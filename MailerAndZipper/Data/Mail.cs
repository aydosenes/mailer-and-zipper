using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace MailerAndZipper
{
    public class Mail
    {
        [Key]
        public int Id { get; set; }
        public string Sender { get; set; }
        public string Receiver { get; set; }
        public string AttachmentsPath { get; set; }
        public string MailGuidId { get; set; }
        public DateTime Date { get; set; }
        public string Subject { get; set; }
        public int TemplateId { get; set; }

        [ForeignKey(nameof(TemplateId))]
        [InverseProperty(nameof(Template.Mails))]
        public virtual Template MailTemplate { get; set; }

    }
}
