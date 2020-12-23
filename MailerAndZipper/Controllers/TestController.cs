using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json.Linq;

namespace MailerAndZipper.Controllers
{
    [ApiController]
    [Route("api/test")]
    public class TestController : ControllerBase
    {
        private TestDbContext _context;

        public TestController(TestDbContext context)
        {
            _context = context;
        }
        // sends mail, saves the files, 
        [HttpPost("sendmail")]
        public async Task<IActionResult> SendMail()
        {
            try
            {
                var template = await _context.Templates.Where(t => t.Id == 1).FirstOrDefaultAsync();

                StreamReader reader = new StreamReader(Request.Body, Encoding.UTF8);
                var data = await reader.ReadToEndAsync();
                var obj = JObject.Parse(data);
                var info = (JObject)obj.Property("info").Value;
                var from = "enesaydostr@gmail.com";
                var to = (string)info.Property("to").Value;
                var subject = (string)info.Property("subject").Value;
                var mailGuidId = Guid.NewGuid().ToString();
                var mailFilesPath = Directory.GetCurrentDirectory() + "\\Files" + "\\" + mailGuidId;

                // download link
                var url = "https://localhost:44387/api/test/downloadzip?mailGuidId=";
                var mergeToTemplate = new Dictionary<string, string>
                {
                    ["#Link#"] = $"{url}{mailGuidId}"
                };
                var updatedBody = "";

                // replaces the updated link with new value (old value is '#Link#' in the body template)
                foreach (var keyAndValue in mergeToTemplate)
                {
                    updatedBody = template.Body.Replace(keyAndValue.Key.ToString(), keyAndValue.Value.ToString());
                }

                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(from);
                mail.To.Add(to);
                mail.Subject = subject;
                mail.Body = updatedBody;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;

                var attachments = obj.GetValue("attachments") as JArray;
                List<string> pathList = new List<string>();
                foreach (var attach in attachments)
                {
                    var filename = (string)JObject.Parse(attach.ToString()).Property("filename").Value;
                    var filetype = (string)JObject.Parse(attach.ToString()).Property("filetype").Value;
                    var base64 = (string)JObject.Parse(attach.ToString()).Property("base64").Value;

                    // adding pad right to base64 string in case long length string
                    base64 = base64.PadRight(base64.Length + (base64.Length * 3) % 4, '=');
                    var byteArr = Convert.FromBase64String(base64);
                    var currentPath = mailFilesPath;

                    if (!Directory.Exists(currentPath))
                    {
                        Directory.CreateDirectory(currentPath);
                    }

                    if (System.IO.File.Exists(currentPath + "\\" + filename + filetype))
                    {
                        currentPath += "\\" + filename + "-Copy-" + Guid.NewGuid().ToString().Substring(0, 4) + filetype;
                    }
                    else
                    {
                        currentPath += "\\" + filename + filetype;
                    }

                    System.IO.File.WriteAllBytes(currentPath, byteArr);
                    pathList.Add(currentPath);
                }

                var m = new Mail()
                {
                    Sender = from,
                    Receiver = to,
                    Date = DateTime.Now,
                    MailGuidId = mailGuidId,
                    TemplateId = template.Id,
                    Subject = subject,
                    AttachmentsPath = mailFilesPath,
                };
                await _context.Mails.AddAsync(m);
                await _context.SaveChangesAsync();

                foreach (var path in pathList)
                {
                    mail.Attachments.Add(new Attachment(path));
                }
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com", 587);
                SmtpServer.UseDefaultCredentials = false;
                #region SmtpServer.Credentials
                SmtpServer.Credentials = new NetworkCredential("*********@gmail.com", "*********");
                #endregion
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);

                return Ok("Mail sent successfully.");

            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // downloads the files in a compressed file (*.zip)
        [HttpGet("downloadzip")]
        public async Task<IActionResult> DownloadZip(string mailGuidId)
        {
            var fileToZip = Directory.GetCurrentDirectory() + "\\Files" + "\\" + mailGuidId;
            var zipPath = fileToZip + ".zip";

            if (!System.IO.File.Exists(zipPath))
            {
                ZipFile.CreateFromDirectory(fileToZip, zipPath);
            }

            var memory = new MemoryStream();
            using (var stream = new FileStream(zipPath, FileMode.Open))
            {
                await stream.CopyToAsync(memory);
            }
            memory.Position = 0;

            return File(memory, "application/octet-stream", mailGuidId + ".zip");
        }
    }
}
