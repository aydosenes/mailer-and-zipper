USE [master]
GO
/****** Object:  Database [testdb]    Script Date: 12/24/2020 12:36:27 AM ******/
CREATE DATABASE [testdb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'testdb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\testdb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'testdb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\testdb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [testdb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [testdb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [testdb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [testdb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [testdb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [testdb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [testdb] SET ARITHABORT OFF 
GO
ALTER DATABASE [testdb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [testdb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [testdb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [testdb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [testdb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [testdb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [testdb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [testdb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [testdb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [testdb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [testdb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [testdb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [testdb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [testdb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [testdb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [testdb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [testdb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [testdb] SET  MULTI_USER 
GO
ALTER DATABASE [testdb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [testdb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [testdb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [testdb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [testdb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [testdb] SET QUERY_STORE = OFF
GO
USE [testdb]
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 12/24/2020 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](50) NOT NULL,
	[Receiver] [nvarchar](50) NOT NULL,
	[AttachmentsPath] [nvarchar](200) NULL,
	[MailGuidId] [nvarchar](50) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Subject] [nvarchar](50) NOT NULL,
	[TemplateId] [int] NOT NULL,
 CONSTRAINT [PK_Mail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Template]    Script Date: 12/24/2020 12:36:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Template](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mail] ON 

INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (1, N'aydos.5194@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\29dee9c1-eeca-4a17-9c83-6342ea4e2866', N'29dee9c1-eeca-4a17-9c83-6342ea4e2866', CAST(N'2020-12-21T15:50:15.207' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (2, N'aydos.5194@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\63b85dc1-12c7-4146-a955-4c2557be7c9d', N'63b85dc1-12c7-4146-a955-4c2557be7c9d', CAST(N'2020-12-21T16:00:45.440' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (3, N'aydos.5194@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\cb15c3a6-5df0-4b4e-bd09-7f9c86c2b441', N'cb15c3a6-5df0-4b4e-bd09-7f9c86c2b441', CAST(N'2020-12-21T16:07:09.033' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (4, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\79d00f3b-83c6-4041-bbbc-7776382b649b', N'79d00f3b-83c6-4041-bbbc-7776382b649b', CAST(N'2020-12-21T16:08:21.840' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (5, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\bca3394e-b215-4586-83cf-629ba1219f16', N'bca3394e-b215-4586-83cf-629ba1219f16', CAST(N'2020-12-21T16:14:43.663' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (6, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\c81ffdf3-259d-4eef-beb7-a5c618f8c9a0', N'c81ffdf3-259d-4eef-beb7-a5c618f8c9a0', CAST(N'2020-12-21T16:17:45.983' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (7, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\dc691783-36d3-479f-be60-6e25ba518606', N'dc691783-36d3-479f-be60-6e25ba518606', CAST(N'2020-12-21T16:22:03.743' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (8, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\9c2e9e84-6c84-4dac-a315-176c5cc125e0', N'9c2e9e84-6c84-4dac-a315-176c5cc125e0', CAST(N'2020-12-21T16:23:17.120' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (9, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\74493ba6-090d-4101-97a3-96687dd83d7d', N'74493ba6-090d-4101-97a3-96687dd83d7d', CAST(N'2020-12-21T16:26:10.387' AS DateTime), N'test', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (10, N'enesaydostr@gmail.com', N'enesaydos@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\bbc8caaa-e4fc-42f9-83bd-5ab36abdc5be', N'bbc8caaa-e4fc-42f9-83bd-5ab36abdc5be', CAST(N'2020-12-23T21:53:46.640' AS DateTime), N'cv', 1)
INSERT [dbo].[Mail] ([Id], [Sender], [Receiver], [AttachmentsPath], [MailGuidId], [Date], [Subject], [TemplateId]) VALUES (11, N'enesaydostr@gmail.com', N'enesaydostr@gmail.com', N'C:\Users\Enes Aydos\Desktop\Video-2\MailerAndZipper\MailerAndZipper\Files\072c1eef-f9df-4de9-9596-b6d727883c52', N'072c1eef-f9df-4de9-9596-b6d727883c52', CAST(N'2020-12-23T21:58:42.803' AS DateTime), N'cv', 1)
SET IDENTITY_INSERT [dbo].[Mail] OFF
GO
SET IDENTITY_INSERT [dbo].[Template] ON 

INSERT [dbo].[Template] ([Id], [Body]) VALUES (1, N'<html>
   <meta charset="utf-8">
   <body>
      <div class="container">
         <p class="center">Mr. Aydos,
            <br>
         <p class="center">If you want to download the files as a zip file, click the link below.
            <br><br><br>
			<a target="_blank" href="#Link#"  class="button button1">Zip Downloader </a>
      </div>
   </body>
   <head>
      <style>
         .center {
         text-align: center
         }
         .button 
         {
         border: none;
         color: white;
         padding: 15px 15px;
         text-align: center;
         text-decoration: none;
         font-size: 16px;
         margin: auto;
         cursor: pointer;
         display: inline-block;
         align-items: center;
         }
         .button1 {background-color: #4CAF50;} /* Green */
         img {
         display: block;
         margin-left: auto;
         margin-right: auto;
         }
         .container {
         position: relative;
         max-width: 800px; /* Maximum width */
         margin: 0 auto; /* Center it */
         }
         .container .content {
         position: absolute;/* Position the background text */
         bottom: 0; /* At the bottom. Use top:0 to append it to the top */
         background: rgb(0, 0, 0); /* Fallback color */
         background: rgba(0, 0, 0, 0.5); /* Black background with 0.5 opacity */
         color: #f1f1f1; /* Grey text */
         width: 50%; /* Full width */
         padding: 10px; /* Some padding */
         }
      </style>
   </head>
</html>')
SET IDENTITY_INSERT [dbo].[Template] OFF
GO
ALTER TABLE [dbo].[Mail]  WITH CHECK ADD  CONSTRAINT [FK_Mail_Template] FOREIGN KEY([TemplateId])
REFERENCES [dbo].[Template] ([Id])
GO
ALTER TABLE [dbo].[Mail] CHECK CONSTRAINT [FK_Mail_Template]
GO
USE [master]
GO
ALTER DATABASE [testdb] SET  READ_WRITE 
GO
