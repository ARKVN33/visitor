USE [master]
ƒ
/****** Object:  Database [dbVisitor]    Script Date: 2/3/2019 4:32:08 AM ******/
CREATE DATABASE [dbVisitor]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbVisitor', FILENAME = N':)Database_Name(:' ,  SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB)
 LOG ON 
( NAME = N'dbVisitor_log', FILENAME = N':)Database_Log(:' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB)
ƒ
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbVisitor].[dbo].[sp_fulltext_database] @action = 'enable'
end
ƒ
ALTER DATABASE [dbVisitor] SET ANSI_NULL_DEFAULT OFF 
ƒ
ALTER DATABASE [dbVisitor] SET ANSI_NULLS OFF 
ƒ
ALTER DATABASE [dbVisitor] SET ANSI_PADDING OFF 
ƒ
ALTER DATABASE [dbVisitor] SET ANSI_WARNINGS OFF 
ƒ
ALTER DATABASE [dbVisitor] SET ARITHABORT OFF 
ƒ
ALTER DATABASE [dbVisitor] SET AUTO_CLOSE OFF 
ƒ
ALTER DATABASE [dbVisitor] SET AUTO_SHRINK OFF 
ƒ
ALTER DATABASE [dbVisitor] SET AUTO_UPDATE_STATISTICS ON 
ƒ
ALTER DATABASE [dbVisitor] SET CURSOR_CLOSE_ON_COMMIT OFF 
ƒ
ALTER DATABASE [dbVisitor] SET CURSOR_DEFAULT  GLOBAL 
ƒ
ALTER DATABASE [dbVisitor] SET CONCAT_NULL_YIELDS_NULL OFF 
ƒ
ALTER DATABASE [dbVisitor] SET NUMERIC_ROUNDABORT OFF 
ƒ
ALTER DATABASE [dbVisitor] SET QUOTED_IDENTIFIER OFF 
ƒ
ALTER DATABASE [dbVisitor] SET RECURSIVE_TRIGGERS OFF 
ƒ
ALTER DATABASE [dbVisitor] SET  DISABLE_BROKER 
ƒ
ALTER DATABASE [dbVisitor] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
ƒ
ALTER DATABASE [dbVisitor] SET DATE_CORRELATION_OPTIMIZATION OFF 
ƒ
ALTER DATABASE [dbVisitor] SET TRUSTWORTHY OFF 
ƒ
ALTER DATABASE [dbVisitor] SET ALLOW_SNAPSHOT_ISOLATION OFF 
ƒ
ALTER DATABASE [dbVisitor] SET PARAMETERIZATION SIMPLE 
ƒ
ALTER DATABASE [dbVisitor] SET READ_COMMITTED_SNAPSHOT OFF 
ƒ
ALTER DATABASE [dbVisitor] SET HONOR_BROKER_PRIORITY OFF 
ƒ
ALTER DATABASE [dbVisitor] SET RECOVERY SIMPLE 
ƒ
ALTER DATABASE [dbVisitor] SET  MULTI_USER 
ƒ
ALTER DATABASE [dbVisitor] SET PAGE_VERIFY CHECKSUM  
ƒ
ALTER DATABASE [dbVisitor] SET DB_CHAINING OFF 
ƒ
ALTER DATABASE [dbVisitor] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
ƒ
ALTER DATABASE [dbVisitor] SET TARGET_RECOVERY_TIME = 0 SECONDS 
ƒ
ALTER DATABASE [dbVisitor] SET DELAYED_DURABILITY = DISABLED 
ƒ
USE [dbVisitor]
ƒ
/****** Object:  Table [dbo].[tblCounty]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblCounty](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Province_Id] [smallint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblCounty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblDoctor]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblDoctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialty_Id] [smallint] NULL,
	[County_Id] [smallint] NULL,
	[Doctor_Id] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[Sex] [bit] NULL,
	[Address] [nvarchar](300) NULL,
	[PhoneNumber] [nvarchar](13) NULL,
	[MobileNumber] [nvarchar](13) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblDoctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblDoctorPatient]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblDoctorPatient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_Id] [int] NULL,
	[Patient_Id] [int] NULL,
	[MedicalRecord] [nvarchar](100) NULL,
	[Date] [nvarchar](10) NULL,
	[Time] [nvarchar](8) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblDoctorPatient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblLicense]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblLicense](
	[Id] [int] NOT NULL,
	[AppLicense] [nvarchar](40) NULL,
	[AppVersion] [nvarchar](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblPatient]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblPatient](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_Id] [nvarchar](10) NULL,
	[Name] [nvarchar](50) NULL,
	[Family] [nvarchar](50) NULL,
	[Sex] [bit] NULL,
	[Address] [nvarchar](300) NULL,
	[PhoneNumber] [nvarchar](13) NULL,
	[MobileNumber] [nvarchar](13) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblPatient] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblPostType]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblPostType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PostType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblProvince]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblProvince](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblProvince] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblSecurityAccess]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblSecurityAccess](
	[Id] [int] NOT NULL,
	[Time] [nvarchar](19) NULL,
	[Counter] [nvarchar](1) NULL,
 CONSTRAINT [PK_tblSecurityAccess] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblSecurityQuestion]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblSecurityQuestion](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[SecurityQuestion] [nvarchar](200) NULL,
 CONSTRAINT [PK_tblSecurityQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblSpecialty]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblSpecialty](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tblSpecialty] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblSundry]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblSundry](
	[Id] [int] NOT NULL,
	[RegisteredAdminPassword] [bit] NULL,
 CONSTRAINT [PK_tblSundry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblUser]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[User_PostType_Id] [tinyint] NULL,
	[User_SecurityQuestion_Id] [tinyint] NULL,
	[UserFirstName] [nvarchar](50) NULL,
	[UserLastName] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](60) NULL,
	[UserMobileNumber] [nvarchar](11) NULL,
	[UserEmail] [nvarchar](200) NULL,
	[UserAnswer] [nvarchar](100) NULL,
	[UserRegistrationDate] [nvarchar](19) NULL,
	[UserImage] [nvarchar](max) NULL,
	[UserDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

ƒ
/****** Object:  Table [dbo].[tblVisitDoctor]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE TABLE [dbo].[tblVisitDoctor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Doctor_Id] [int] NULL,
	[Date] [nvarchar](10) NULL,
	[Time] [nvarchar](8) NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_tblVisitDoctor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

ƒ
/****** Object:  View [dbo].[viewDoctor]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE VIEW [dbo].[viewDoctor]
AS
SELECT        dbo.tblDoctor.Id, dbo.tblDoctor.Specialty_Id, dbo.tblDoctor.County_Id, dbo.tblDoctor.Doctor_Id, dbo.tblDoctor.Name, dbo.tblDoctor.Family, dbo.tblDoctor.Sex, dbo.tblDoctor.Address, dbo.tblDoctor.PhoneNumber, 
                         dbo.tblDoctor.MobileNumber, dbo.tblDoctor.Description, dbo.tblSpecialty.Name AS SpecialtyName, dbo.tblCounty.Name AS CountyName, dbo.tblProvince.Name AS ProvinceName, dbo.tblProvince.Id AS Province_Id
FROM            dbo.tblDoctor INNER JOIN
                         dbo.tblSpecialty ON dbo.tblDoctor.Specialty_Id = dbo.tblSpecialty.Id INNER JOIN
                         dbo.tblCounty ON dbo.tblDoctor.County_Id = dbo.tblCounty.Id INNER JOIN
                         dbo.tblProvince ON dbo.tblCounty.Province_Id = dbo.tblProvince.Id

ƒ
/****** Object:  View [dbo].[viewDoctorPatient]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE VIEW [dbo].[viewDoctorPatient]
AS
SELECT        dbo.tblDoctorPatient.Id, dbo.tblDoctorPatient.Doctor_Id, dbo.tblDoctorPatient.Patient_Id, dbo.tblDoctorPatient.MedicalRecord, dbo.tblDoctorPatient.Date, dbo.tblDoctorPatient.Time, dbo.tblDoctorPatient.Description, 
                         dbo.tblDoctor.Doctor_Id AS DoctorCode, dbo.tblDoctor.Name, dbo.tblDoctor.Family, dbo.tblPatient.Patient_Id AS PatientCode, dbo.tblPatient.Name AS PatientName, dbo.tblPatient.Family AS PatientFamily
FROM            dbo.tblDoctorPatient INNER JOIN
                         dbo.tblDoctor ON dbo.tblDoctorPatient.Doctor_Id = dbo.tblDoctor.Id INNER JOIN
                         dbo.tblPatient ON dbo.tblDoctorPatient.Patient_Id = dbo.tblPatient.Id

ƒ
SET IDENTITY_INSERT [dbo].[tblCounty] ON 

ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (0, 0, N'نامعلوم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (1, 1, N'آذرشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (2, 1, N'اسکو')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (3, 1, N'اهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (4, 1, N'بستان آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (5, 1, N'بناب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (6, 1, N'تبريز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (7, 1, N'جلفا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (8, 1, N'چاراويماق')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (9, 1, N'خداآفرين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (10, 1, N'سراب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (11, 1, N'شبستر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (12, 1, N'عجب شير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (13, 1, N'کليبر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (14, 1, N'مراغه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (15, 1, N'مرند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (16, 1, N'ملکان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (17, 1, N'ميانه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (18, 1, N'ورزقان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (19, 1, N'هريس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (20, 1, N'هشترود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (21, 2, N'اروميه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (22, 2, N'اشنويه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (23, 2, N'بوکان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (24, 2, N'پلدشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (25, 2, N'پيرانشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (26, 2, N'تکاب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (27, 2, N'چالدران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (28, 2, N'چايپاره')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (29, 2, N'خوي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (30, 2, N'سردشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (31, 2, N'سلماس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (32, 2, N'شاهين دژ')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (33, 2, N'شوط')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (34, 2, N'ماکو')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (35, 2, N'مهاباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (36, 2, N'مياندوآب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (37, 2, N'نقده')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (38, 3, N'اردبيل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (39, 3, N'بيله سوار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (40, 3, N'پارس آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (41, 3, N'خلخال')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (42, 3, N'سرعين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (43, 3, N'کوثر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (44, 3, N'گرمي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (45, 3, N'مشگين شهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (46, 3, N'نمين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (47, 3, N'نير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (48, 4, N'آران وبيدگل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (49, 4, N'اردستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (50, 4, N'اصفهان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (51, 4, N'برخوار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (52, 4, N'بو يين و مياندشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (53, 4, N'تيران وکرون')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (54, 4, N'چادگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (55, 4, N'خميني شهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (56, 4, N'خوانسار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (57, 4, N'خور و بيابانک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (58, 4, N'دهاقان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (59, 4, N'سميرم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (60, 4, N'شاهين شهروميمه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (61, 4, N'شهرضا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (62, 4, N'فريدن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (63, 4, N'فريدونشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (64, 4, N'فلاورجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (65, 4, N'کاشان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (66, 4, N'گلپايگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (67, 4, N'لنجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (68, 4, N'مبارکه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (69, 4, N'نايين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (70, 4, N'نجف آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (71, 4, N'نطنز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (72, 5, N'اشتهارد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (73, 5, N'ساوجبلاغ')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (74, 5, N'طالقان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (75, 5, N'فرديس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (76, 5, N'کرج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (77, 5, N'نظرآباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (78, 6, N'آبدانان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (79, 6, N'ايلام')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (80, 6, N'ايوان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (81, 6, N'بدره')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (82, 6, N'چرداول')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (83, 6, N'دره شهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (84, 6, N'دهلران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (85, 6, N'سيروان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (86, 6, N'ملکشاهي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (87, 6, N'مهران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (88, 7, N'بوشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (89, 7, N'تنگستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (90, 7, N'جم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (91, 7, N'دشتستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (92, 7, N'دشتي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (93, 7, N'دير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (94, 7, N'ديلم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (95, 7, N'عسلويه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (96, 7, N'کنگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (97, 7, N'گناوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (98, 8, N'اسلامشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (99, 8, N'بهارستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (100, 8, N'پاکدشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (101, 8, N'پرديس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (102, 8, N'پيشوا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (103, 8, N'تهران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (104, 8, N'دماوند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (105, 8, N'رباطکريم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (106, 8, N'ري')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (107, 8, N'شميرانات')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (108, 8, N'شهريار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (109, 8, N'فيروزکوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (110, 8, N'قدس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (111, 8, N'قرچک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (112, 8, N'ملارد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (113, 8, N'ورامين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (114, 9, N'اردل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (115, 9, N'بروجن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (116, 9, N'بن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (117, 9, N'سامان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (118, 9, N'شهرکرد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (119, 9, N'فارسان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (120, 9, N'کوهرنگ')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (121, 9, N'کيار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (122, 9, N'لردگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (123, 10, N'بشرويه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (124, 10, N'بيرجند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (125, 10, N'خوسف')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (126, 10, N'درميان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (127, 10, N'زيرکوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (128, 10, N'سرايان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (129, 10, N'سربيشه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (130, 10, N'طبس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (131, 10, N'فردوس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (132, 10, N'قاينات')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (133, 10, N'نهبندان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (134, 11, N'باخرز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (135, 11, N'بجستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (136, 11, N'بردسکن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (137, 11, N'بينالود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (138, 11, N'تايباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (139, 11, N'تربت جام')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (140, 11, N'تربت حيدريه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (141, 11, N'جغتاي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (142, 11, N'جوين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (143, 11, N'چناران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (144, 11, N'خليل آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (145, 11, N'خواف')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (146, 11, N'خوشاب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (147, 11, N'داورزن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (148, 11, N'درگز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (149, 11, N'رشتخوار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (150, 11, N'زاوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (151, 11, N'سبزوار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (152, 11, N'سرخس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (153, 11, N'فريمان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (154, 11, N'فيروزه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (155, 11, N'قوچان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (156, 11, N'کاشمر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (157, 11, N'کلات')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (158, 11, N'گناباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (159, 11, N'مشهد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (160, 11, N'مه ولات')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (161, 11, N'نيشابور')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (162, 12, N'اسفراين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (163, 12, N'بجنورد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (164, 12, N'جاجرم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (165, 12, N'راز و جرگلان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (166, 12, N'شيروان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (167, 12, N'فاروج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (168, 12, N'گرمه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (169, 12, N'مانه وسملقان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (170, 13, N'آبادان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (171, 13, N'آغاجاري')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (172, 13, N'اميديه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (173, 13, N'انديکا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (174, 13, N'انديمشک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (175, 13, N'اهواز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (176, 13, N'ايذه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (177, 13, N'باغ ملک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (178, 13, N'باوي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (179, 13, N'بندرماهشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (180, 13, N'بهبهان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (181, 13, N'حميديه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (182, 13, N'خرمشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (183, 13, N'دزفول')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (184, 13, N'دشت آزادگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (185, 13, N'رامشير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (186, 13, N'رامهرمز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (187, 13, N'شادگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (188, 13, N'شوش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (189, 13, N'شوشتر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (190, 13, N'کارون')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (191, 13, N'گتوند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (192, 13, N'لالي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (193, 13, N'مسجدسليمان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (194, 13, N'هفتگل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (195, 13, N'هنديجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (196, 13, N'هويزه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (197, 14, N'ابهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (198, 14, N'ايجرود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (199, 14, N'خدابنده')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (200, 14, N'خرمدره')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (201, 14, N'زنجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (202, 14, N'سلطانيه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (203, 14, N'طارم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (204, 14, N'ماهنشان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (205, 15, N'آرادان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (206, 15, N'دامغان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (207, 15, N'سرخه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (208, 15, N'سمنان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (209, 15, N'شاهرود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (210, 15, N'گرمسار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (211, 15, N'مهدي شهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (212, 15, N'ميامي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (213, 16, N'ايرانشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (214, 16, N'چابهار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (215, 16, N'خاش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (216, 16, N'دلگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (217, 16, N'زابل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (218, 16, N'زاهدان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (219, 16, N'زهک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (220, 16, N'سراوان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (221, 16, N'سرباز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (222, 16, N'سيب و سوران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (223, 16, N'فنوج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (224, 16, N'قصرقند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (225, 16, N'کنارک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (226, 16, N'مهرستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (227, 16, N'ميرجاوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (228, 16, N'نيک شهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (229, 16, N'نيمروز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (230, 16, N'هامون')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (231, 16, N'هيرمند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (232, 17, N'آباده')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (233, 17, N'ارسنجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (234, 17, N'استهبان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (235, 17, N'اقليد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (236, 17, N'بوانات')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (237, 17, N'پاسارگاد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (238, 17, N'جهرم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (239, 17, N'خرامه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (240, 17, N'خرم بيد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (241, 17, N'خنج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (242, 17, N'داراب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (243, 17, N'رستم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (244, 17, N'زرين دشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (245, 17, N'سپيدان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (246, 17, N'سروستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (247, 17, N'شيراز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (248, 17, N'فراشبند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (249, 17, N'فسا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (250, 17, N'فيروزآباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (251, 17, N'قيروکارزين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (252, 17, N'کازرون')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (253, 17, N'کوار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (254, 17, N'گراش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (255, 17, N'لارستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (256, 17, N'لامرد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (257, 17, N'مرودشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (258, 17, N'ممسني')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (259, 17, N'مهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (260, 17, N'ني ريز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (261, 18, N'آبيک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (262, 18, N'آوج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (263, 18, N'البرز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (264, 18, N'بويين زهرا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (265, 18, N'تاکستان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (266, 18, N'قزوين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (267, 19, N'قم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (268, 20, N'بانه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (269, 20, N'بيجار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (270, 20, N'دهگلان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (271, 20, N'ديواندره')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (272, 20, N'سروآباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (273, 20, N'سقز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (274, 20, N'سنندج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (275, 20, N'قروه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (276, 20, N'کامياران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (277, 20, N'مريوان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (278, 21, N'ارزوييه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (279, 21, N'انار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (280, 21, N'بافت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (281, 21, N'بردسير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (282, 21, N'بم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (283, 21, N'جيرفت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (284, 21, N'رابر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (285, 21, N'راور')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (286, 21, N'رفسنجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (287, 21, N'رودبارجنوب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (288, 21, N'ريگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (289, 21, N'زرند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (290, 21, N'سيرجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (291, 21, N'شهربابک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (292, 21, N'عنبرآباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (293, 21, N'فارياب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (294, 21, N'فهرج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (295, 21, N'قلعه گنج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (296, 21, N'کرمان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (297, 21, N'کوهبنان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (298, 21, N'کهنوج')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (299, 21, N'منوجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (300, 21, N'نرماشير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (301, 22, N'اسلام آبادغرب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (302, 22, N'پاوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (303, 22, N'ثلاث باباجاني')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (304, 22, N'جوانرود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (305, 22, N'دالاهو')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (306, 22, N'روانسر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (307, 22, N'سرپل ذهاب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (308, 22, N'سنقر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (309, 22, N'صحنه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (310, 22, N'قصرشيرين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (311, 22, N'کرمانشاه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (312, 22, N'کنگاور')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (313, 22, N'گيلانغرب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (314, 22, N'هرسين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (315, 23, N'باشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (316, 23, N'بويراحمد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (317, 23, N'بهميي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (318, 23, N'چرام')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (319, 23, N'دنا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (320, 23, N'کهگيلويه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (321, 23, N'گچساران')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (322, 23, N'لنده')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (323, 24, N'آزادشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (324, 24, N'آق قلا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (325, 24, N'بندرگز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (326, 24, N'ترکمن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (327, 24, N'راميان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (328, 24, N'علي آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (329, 24, N'کردکوي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (330, 24, N'کلاله')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (331, 24, N'گاليکش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (332, 24, N'گرگان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (333, 24, N'گميشان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (334, 24, N'گنبدکاووس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (335, 24, N'مراوه تپه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (336, 24, N'مينودشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (337, 25, N'آستارا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (338, 25, N'آستانه اشرفيه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (339, 25, N'املش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (340, 25, N'بندرانزلي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (341, 25, N'رشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (342, 25, N'رضوانشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (343, 25, N'رودبار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (344, 25, N'رودسر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (345, 25, N'سياهکل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (346, 25, N'شفت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (347, 25, N'صومعه سرا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (348, 25, N'طوالش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (349, 25, N'فومن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (350, 25, N'لاهيجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (351, 25, N'لنگرود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (352, 25, N'ماسال')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (353, 26, N'ازنا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (354, 26, N'اليگودرز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (355, 26, N'بروجرد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (356, 26, N'پلدختر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (357, 26, N'خرم آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (358, 26, N'دلفان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (359, 26, N'دورود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (360, 26, N'دوره')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (361, 26, N'رومشکان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (362, 26, N'سلسله')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (363, 26, N'کوهدشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (364, 27, N'آمل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (365, 27, N'بابل')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (366, 27, N'بابلسر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (367, 27, N'بهشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (368, 27, N'تنکابن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (369, 27, N'جويبار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (370, 27, N'چالوس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (371, 27, N'رامسر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (372, 27, N'ساري')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (373, 27, N'سوادکوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (374, 27, N'سوادکوه شمالي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (375, 27, N'سيمرغ')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (376, 27, N'عباس آباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (377, 27, N'فريدونکنار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (378, 27, N'قايم شهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (379, 27, N'کلاردشت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (380, 27, N'گلوگاه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (381, 27, N'محمودآباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (382, 27, N'مياندورود')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (383, 27, N'نکا')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (384, 27, N'نور')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (385, 27, N'نوشهر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (386, 28, N'آشتيان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (387, 28, N'اراک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (388, 28, N'تفرش')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (389, 28, N'خمين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (390, 28, N'خنداب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (391, 28, N'دليجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (392, 28, N'زرنديه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (393, 28, N'ساوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (394, 28, N'شازند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (395, 28, N'فراهان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (396, 28, N'کميجان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (397, 28, N'محلات')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (398, 29, N'ابوموسي')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (399, 29, N'بستک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (400, 29, N'بشاگرد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (401, 29, N'بندرعباس')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (402, 29, N'بندرلنگه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (403, 29, N'پارسيان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (404, 29, N'جاسک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (405, 29, N'حاجي اباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (406, 29, N'خمير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (407, 29, N'رودان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (408, 29, N'سيريک')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (409, 29, N'قشم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (410, 29, N'ميناب')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (411, 30, N'اسدآباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (412, 30, N'بهار')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (413, 30, N'تويسرکان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (414, 30, N'رزن')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (415, 30, N'فامنين')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (416, 30, N'کبودرآهنگ')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (417, 30, N'ملاير')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (418, 30, N'نهاوند')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (419, 30, N'همدان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (420, 31, N'ابرکوه')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (421, 31, N'اردکان')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (422, 31, N'اشکذر')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (423, 31, N'بافق')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (424, 31, N'بهاباد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (425, 31, N'تفت')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (426, 31, N'خاتم')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (427, 31, N'مهريز')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (428, 31, N'ميبد')
ƒ
INSERT [dbo].[tblCounty] ([Id], [Province_Id], [Name]) VALUES (429, 31, N'يزد')
ƒ
SET IDENTITY_INSERT [dbo].[tblCounty] OFF
ƒ
INSERT [dbo].[tblLicense] ([Id], [AppLicense], [AppVersion]) VALUES (1, NULL, NULL)
ƒ
SET IDENTITY_INSERT [dbo].[tblPostType] ON 

ƒ
INSERT [dbo].[tblPostType] ([Id], [PostType]) VALUES (1, N'مدیریت')
ƒ
SET IDENTITY_INSERT [dbo].[tblPostType] OFF
ƒ
SET IDENTITY_INSERT [dbo].[tblProvince] ON 

ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (0, N'نامعلوم')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (1, N'آذربايجان شرقي')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (2, N'آذربايجان غربي')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (3, N'اردبيل')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (4, N'اصفهان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (5, N'البرز')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (6, N'ايلام')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (7, N'بوشهر')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (8, N'تهران')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (9, N'چهارمحال وبختياري')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (10, N'خراسان جنوبي')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (11, N'خراسان رضوي')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (12, N'خراسان شمالي')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (13, N'خوزستان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (14, N'زنجان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (15, N'سمنان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (16, N'سيستان وبلوچستان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (17, N'فارس')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (18, N'قزوين')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (19, N'قم')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (20, N'کردستان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (21, N'کرمان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (22, N'کرمانشاه')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (23, N'کهگيلويه وبويراحمد')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (24, N'گلستان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (25, N'گيلان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (26, N'لرستان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (27, N'مازندران')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (28, N'مرکزي')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (29, N'هرمزگان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (30, N'همدان')
ƒ
INSERT [dbo].[tblProvince] ([Id], [Name]) VALUES (31, N'یزد')
ƒ
SET IDENTITY_INSERT [dbo].[tblProvince] OFF
ƒ
SET IDENTITY_INSERT [dbo].[tblSecurityQuestion] ON 

ƒ
INSERT [dbo].[tblSecurityQuestion] ([Id], [SecurityQuestion]) VALUES (1, N'نام اولین معلم شما چیست؟')
ƒ
INSERT [dbo].[tblSecurityQuestion] ([Id], [SecurityQuestion]) VALUES (2, N'نام گل مورد علاقه شما چیست؟')
ƒ
INSERT [dbo].[tblSecurityQuestion] ([Id], [SecurityQuestion]) VALUES (3, N'رنگ مورد علاقه شما چیست؟')
ƒ
INSERT [dbo].[tblSecurityQuestion] ([Id], [SecurityQuestion]) VALUES (4, N'نام فیلم مورد علاقه شما چیست؟')
ƒ
INSERT [dbo].[tblSecurityQuestion] ([Id], [SecurityQuestion]) VALUES (5, N'مکان مورد علاقه شما کجاست؟')
ƒ
SET IDENTITY_INSERT [dbo].[tblSecurityQuestion] OFF
ƒ
SET IDENTITY_INSERT [dbo].[tblSpecialty] ON 

ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (0, N'نا معلوم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (1, N'تخصص آسيب شناسي (پاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (2, N'تخصص آسيب شناسي فک و دهان (پاتولوژي فک و دهان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (3, N'تخصص اپيدميولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (4, N'تخصص ارتودانتيکس')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (5, N'تخصص بهداشت عمومي دندانپزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (6, N'تخصص بيمار‌ي‌هاي دهان و تشخيص')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (7, N'تخصص بيماري‌هاي پوست (درماتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (8, N'تخصص بيماري‌هاي داخلي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (9, N'تخصص بيماري‌هاي دهان، فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (10, N'تخصص بيماري‌هاي عفوني و گرمسيري')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (11, N'تخصص بيماري‌هاي قلب و عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (12, N'تخصص بيماري‌هاي مغز و اعصاب (نورولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (13, N'تخصص بيماري‌هاي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (14, N'تخصص بيماريهاي خون(هماتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (15, N'تخصص بيهوشي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (16, N'تخصص بيولوژي دهان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (17, N'تخصص پرتودرماني (راديوتراپي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (18, N'تخصص پروتزهاي دنداني (پروستودانتيکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (19, N'تخصص پزشکي اجتماعي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (20, N'تخصص پزشکي خانواده')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (21, N'تخصص پزشکي فيزيکي و توانبخشي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (22, N'تخصص پزشکي قانوني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (23, N'تخصص پزشکي هسته‌اي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (24, N'تخصص پزشکي ورزشي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (25, N'تخصص تصوير برداري (راديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (26, N'تخصص تصويربرداري دهان، فک و صورت (راديولوژي دهان، فک و صورت)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (27, N'تخصص جراحي استخوان و مفاصل (ارتوپدي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (28, N'تخصص جراحي ترميمي و پلاستيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (29, N'تخصص جراحي دهان، فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (30, N'تخصص جراحي سوانح و حوادث')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (31, N'تخصص جراحي عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (32, N'تخصص جراحي عمومي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (33, N'تخصص جراحي قلب و عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (34, N'تخصص جراحي لثه (پريودانتيکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (35, N'تخصص جراحي مغز و اعصاب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (36, N'تخصص جراحي کليه، مجاري ادراري و تناسلي (اورولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (37, N'تخصص چشم پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (38, N'تخصص داروسازي باليني (کلينيکال فارماسي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (39, N'تخصص درمان ريشه (اندودانتيکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (40, N'تخصص دندانپزشکي ترميمي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (41, N'تخصص دندانپزشکي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (42, N'تخصص راديوانکولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (43, N'تخصص روانپزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (44, N'تخصص روانپزشکي کودک و نوجوان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (45, N'تخصص زنان و زايمان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (46, N'تخصص ژنتيک انساني با گرايش مولکولي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (47, N'تخصص ژنتيک پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (48, N'تخصص ژنتيک مولکولي انساني ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (49, N'تخصص ژنتيک مولکولي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (50, N'تخصص سالمندشناسي (ژرياتريک)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (51, N'تخصص سم شناسي عمومي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (52, N'تخصص طب اورژانس')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (53, N'تخصص طب سالمندي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (54, N'تخصص طب هوا فضا')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (55, N'تخصص طب هوا فضا و زيرسطحي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (56, N'تخصص طب کار')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (57, N'تخصص فيزيکال مديسين و روماتولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (58, N'تخصص گوش، گلو، بيني و جراحي سر و گردن')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (59, N'تخصص مغز و اعصاب و روانپزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (60, N'تکميلي جراحي کليه، مجاري ادراري و تناسلي (اورولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (61, N'دکتراي تخصصي (Ph.D) آسيب شناسي (پاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (62, N'دکتراي تخصصي (Ph.D) اخلاق پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (63, N'دکتراي تخصصي (Ph.D) ارتز و پروتز (ارتوپدي فني)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (64, N'دکتراي تخصصي (Ph.D) انگل شناسي آزمايشگاهي ( پارازيتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (65, N'دکتراي تخصصي (Ph.D) ايمني شناسي (ايمونولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (66, N'دکتراي تخصصي (Ph.D) ايمني شناسي (ايمونولوژي) سرطان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (67, N'دکتراي تخصصي (Ph.D) ايمني شناسي آزمايشگاهي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (68, N'دکتراي تخصصي (Ph.D) ايمني شناسي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (69, N'دکتراي تخصصي (Ph.D) ايمني شناسي و خون شناسي (ايمونوهماتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (70, N'دکتراي تخصصي (Ph.D) باليني طب چيني و سوزني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (71, N'دکتراي تخصصي (Ph.D) باکتري شناسي آزمايشگاهي (باکتريولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (72, N'دکتراي تخصصي (Ph.D) بهداشت باروري')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (73, N'دکتراي تخصصي (Ph.D) بهداشت خانواده')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (74, N'دکتراي تخصصي (Ph.D) بهداشت عمومي دندانپزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (75, N'دکتراي تخصصي (Ph.D) بيماري‌هاي غدد درون ريز و متابوليسم (اندوکرينولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (76, N'دکتراي تخصصي (Ph.D) بينايي سنجي (اپتومتري)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (77, N'دکتراي تخصصي (Ph.D) بيوشيمي آزمايشگاهي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (78, N'دکتراي تخصصي (Ph.D) بيوشيمي باليني ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (79, N'دکتراي تخصصي (Ph.D) پروتزهاي دنداني (پروستودانتيکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (80, N'دکتراي تخصصي (Ph.D) پزشکي اجتماعي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (81, N'دکتراي تخصصي (Ph.D) پزشکي ورزشي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (82, N'دکتراي تخصصي (Ph.D) جراحي لثه (پريودانتيکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (83, N'دکتراي تخصصي (Ph.D) خون شناسي آزمايشگاهي و بانک خون (هماتولوژي آزمايشگاهي و بانک خون)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (84, N'دکتراي تخصصي (Ph.D) داروسازي باليني (کلينيکال فارماسي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (85, N'دکتراي تخصصي (Ph.D) داروشناسي (فارماکولوژي)  ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (86, N'دکتراي تخصصي (Ph.D) دندانپزشکي ترميمي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (87, N'دکتراي تخصصي (Ph.D) دندانپزشکي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (88, N'دکتراي تخصصي (Ph.D) روانشناسي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (89, N'دکتراي تخصصي (Ph.D) زيست فناوري دارويي (بيوتکنولوژي دارويي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (90, N'دکتراي تخصصي (Ph.D) ژنتيک انساني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (91, N'دکتراي تخصصي (Ph.D) ژنتيک انساني با گرايش مولکولي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (92, N'دکتراي تخصصي (Ph.D) ژنتيک پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (93, N'دکتراي تخصصي (Ph.D) ژنتيک پزشکي با گرايش ژنتيک مولکولي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (94, N'دکتراي تخصصي (Ph.D) ژنتيک مولکولي انساني ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (95, N'دکتراي تخصصي (Ph.D) ژنتيک مولکولي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (96, N'دکتراي تخصصي (Ph.D) سلامت باروري')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (97, N'دکتراي تخصصي (Ph.D) سلامت دهان و دندانپزشکي اجتماعي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (98, N'دکتراي تخصصي (Ph.D) سم شناسي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (99, N'دکتراي تخصصي (Ph.D) سم شناسي داروشناسي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (100, N'دکتراي تخصصي (Ph.D) سم شناسي عمومي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (101, N'دکتراي تخصصي (Ph.D) سيتوژنتيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (102, N'دکتراي تخصصي (Ph.D) سيتوژنتيک پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (103, N'دکتراي تخصصي (Ph.D) شنوايي شناسي (اديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (104, N'دکتراي تخصصي (Ph.D) شيمي دارويي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (105, N'دکتراي تخصصي (Ph.D) طب توليد مثل با گرايش آندرولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (106, N'دکتراي تخصصي (Ph.D) طب سنتي ايراني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (107, N'دکتراي تخصصي (Ph.D) طب سنتي چين')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (108, N'دکتراي تخصصي (Ph.D) علوم تغذيه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (109, N'دکتراي تخصصي (Ph.D) فارماکوگنوزي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (110, N'دکتراي تخصصي (Ph.D) فناوري دارويي (فارماسيوتيکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (111, N'دکتراي تخصصي (Ph.D) فيزيوتراپي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (112, N'دکتراي تخصصي (Ph.D) قارچ شناسي آزمايشگاهي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (113, N'دکتراي تخصصي (Ph.D) گفتاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (114, N'دکتراي تخصصي (Ph.D) مامايي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (115, N'دکتراي تخصصي (Ph.D) مواد دنداني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (116, N'دکتراي تخصصي (Ph.D) ميکروب شناسي آزمايشگاهي (ميکروبيولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (117, N'دکتراي تخصصي (Ph.D) ويروس شناسي آزمايشگاهي (ويرولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (118, N'دکتراي تخصصي (Ph.D) کاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (119, N'دکتراي تخصصي (Ph.D) کاشت دندان (ايمپلنت)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (120, N'دکتراي حرفه‌اي بينايي سنجي (اپتومتري)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (121, N'دکتراي حرفه‌اي پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (122, N'دکتراي حرفه‌اي داروسازي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (123, N'دکتراي حرفه‌اي دندانپزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (124, N'دکتراي حرفه‌اي ژنتيک انساني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (125, N'دکتراي حرفه‌اي ژنتيک انساني با گرايش مولکولي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (126, N'دکتراي حرفه‌اي ژنتيک پزشکي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (127, N'دکتراي حرفه‌اي ژنتيک پزشکي با گرايش ژنتيک مولکولي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (128, N'دکتراي حرفه‌اي ژنتيک مولکولي انساني ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (129, N'دکتراي حرفه‌اي ژنتيک مولکولي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (130, N'دکتراي حرفه‌اي سم شناسي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (131, N'دکتراي حرفه‌اي سيتوژنتيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (132, N'دکتراي حرفه‌اي شنوايي شناسي (اديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (133, N'دکتراي حرفه‌اي علوم آزمايشگاهي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (134, N'دکتراي حرفه‌اي علوم تغذيه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (135, N'دکتراي حرفه‌اي فيزيوتراپي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (136, N'دکتراي حرفه‌اي گفتاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (137, N'دکتراي حرفه‌اي ناتروپاتي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (138, N'دکتراي حرفه‌اي کاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (139, N'دکتراي حرفه‌اي کايروپراکتيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (140, N'فلوشيپ Bariatric')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (141, N'فلوشيپ آرتروپلاستي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (142, N'فلوشيپ آرتروپلاستي هيپ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (143, N'فلوشيپ آسيب شناسي (پاتولوژي) کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (144, N'فلوشيپ آسيب شناسي اعصاب (نوروپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (145, N'فلوشيپ آسيب شناسي پوست (درماتوپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (146, N'فلوشيپ آسيب شناسي چشم (افتالموپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (147, N'فلوشيپ آسيب شناسي خون (هماتوپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (148, N'فلوشيپ آسيب شناسي سلولي (سيتوپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (149, N'فلوشيپ آسيب شناسي قفسه صدري(توراسيک پاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (150, N'فلوشيپ آسيب شناسي گوارش (پاتولوژي گوارش)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (151, N'فلوشيپ آسيب شناسي کليه (نفروپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (152, N'فلوشيپ آسيب شناسي کليه و مجاري ادراري (اوروپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (153, N'فلوشيپ آلرژي و ايمني شناسي باليني (آلرژي و ايمونولوژي باليني)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (154, N'فلوشيپ آي وي اف')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (155, N'فلوشيپ اپي لپسي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (156, N'فلوشيپ اتولوژي - نورواتولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (157, N'فلوشيپ اختلالات حرکتي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (158, N'فلوشيپ اختلالات کف لگن در زنان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (159, N'فلوشيپ ارتوسرجري')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (160, N'فلوشيپ استرابيسم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (161, N'فلوشيپ استروتاکسي و فانکشنال مغز و اعصاب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (162, N'فلوشيپ استروک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (163, N'فلوشيپ اقدامات مداخله‌اي اعصاب (نورواينترونشن)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (164, N'فلوشيپ اقدامات مداخله‌اي قلب و عروق (اينترونشنال کارديولوژي) بزرگسالان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (165, N'فلوشيپ الکتروفيزيولوژي باليني قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (166, N'فلوشيپ الکتروفيزيولوژي در اعصاب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (167, N'فلوشيپ ام آر آي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (168, N'فلوشيپ اندوسکوپي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (169, N'فلوشيپ انکولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (170, N'فلوشيپ انکولوژي دهان، فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (171, N'فلوشيپ انکولوژي هسته‌اي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (172, N'فلوشيپ اورژانس کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (173, N'فلوشيپ اکو، سي تي و هسته اي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (174, N'فلوشيپ اکوکارديوگرافي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (175, N'فلوشيپ ايمني شناسي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (176, N'فلوشيپ اينترونشن غير جراحي ستون فقرات')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (177, N'فلوشيپ بيمار‌ي‌هاي مادرزادي قلب و عروق در بزرگسالان ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (178, N'فلوشيپ بيمار‌ي‌هاي متابوليک استخوان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (179, N'فلوشيپ بيماري ايدز باليني (HIV/AIDS)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (180, N'فلوشيپ بيماري‌هاي روماتولوژي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (181, N'فلوشيپ بيماري‌هاي ريه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (182, N'فلوشيپ بيماري‌هاي ريه کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (183, N'فلوشيپ بيماري‌هاي سطح چشم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (184, N'فلوشيپ بيماري‌هاي عفوني در بيماران پيوندي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (185, N'فلوشيپ بيماري‌هاي عفوني در بيماران مبتلا به نقص ايمني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (186, N'فلوشيپ بيماري‌هاي قلب و عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (187, N'فلوشيپ بيماري‌هاي مغز و اعصاب کودکان (نورولوژي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (188, N'فلوشيپ بيهوشي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (189, N'فلوشيپ بيهوشي پيوند اعضاي داخلي شکم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (190, N'فلوشيپ بيهوشي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (191, N'فلوشيپ بيهوشي مغز و اعصاب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (192, N'فلوشيپ بيهوشي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (193, N'فلوشيپ پايش و تشخيص اعصاب حين جراحي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (194, N'فلوشيپ پرتودرماني (راديوتراپي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (195, N'فلوشيپ پيوند کبد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (196, N'فلوشيپ پيوند کليه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (197, N'فلوشيپ تروما در جراحي عمومي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (198, N'فلوشيپ تصويربرداري اعصاب (نوروراديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (199, N'فلوشيپ تصويربرداري مداخله‌اي (اينترونشنال راديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (200, N'فلوشيپ تصويربرداري مداخله‌اي اعصاب (اينترونشنال نوروراديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (201, N'فلوشيپ تصويربرداري مداخله‌اي عروق(واسکولار اينترونشنال راديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (202, N'فلوشيپ جراحي آرتروسکوپي زانو و هيپ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (203, N'فلوشيپ جراحي آرتروسکوپي و طب ورزشي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (204, N'فلوشيپ جراحي استخوان و مفاصل کودکان (ارتوپدي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (205, N'فلوشيپ جراحي ايمپلنت‌هاي پيشرفته')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (206, N'فلوشيپ جراحي بيماري‌هاي مادرزادي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (207, N'فلوشيپ جراحي بيني و سينوس (رينولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (208, N'فلوشيپ جراحي پا و مچ پا')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (209, N'فلوشيپ جراحي پستان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (210, N'فلوشيپ جراحي پلاستيک چشم و انحراف چشم (اکولوپلاستي و استرابيسم)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (211, N'فلوشيپ جراحي پلاستيک صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (212, N'فلوشيپ جراحي پلاستيک و ترميمي چشم (اکولوپلاستي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (213, N'فلوشيپ جراحي پلاستيک، ترميمي و سوختگي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (214, N'فلوشيپ جراحي پوست')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (215, N'فلوشيپ جراحي پيوندکبد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (216, N'فلوشيپ جراحي ترميمي اورولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (217, N'فلوشيپ جراحي ترميمي دهان، فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (218, N'فلوشيپ جراحي تروماي فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (219, N'فلوشيپ جراحي تومورهاي سيستم اسکلتي و عضلاني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (220, N'فلوشيپ جراحي درون بين (لاپاراسکوپي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (221, N'فلوشيپ جراحي درون بين کليه، مجاري ادراري و تناسلي (اندويورولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (222, N'فلوشيپ جراحي دست')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (223, N'فلوشيپ جراحي روده بزرگ (جراحي کولورکتال)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (224, N'فلوشيپ جراحي زانو')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (225, N'فلوشيپ جراحي زيبايي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (226, N'فلوشيپ جراحي ستون فقرات')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (227, N'فلوشيپ جراحي سر و گردن')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (228, N'فلوشيپ جراحي سرطان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (229, N'فلوشيپ جراحي شانه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (230, N'فلوشيپ جراحي عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (231, N'فلوشيپ جراحي عروق و تروما')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (232, N'فلوشيپ جراحي عروق، پيوند کليه و کبد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (233, N'فلوشيپ جراحي قاعده جمجمه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (234, N'فلوشيپ جراحي لثه و کاشت دندان (پريوايمپلنت)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (235, N'فلوشيپ جراحي لگن')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (236, N'فلوشيپ جراحي مغز و اعصاب کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (237, N'فلوشيپ جراحي ميکروسکوپي عروق مغز')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (238, N'فلوشيپ جراحي هاي کبد پانکراس مجاري صفراوي و پيوند اعضاء داخل شکم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (239, N'فلوشيپ جراحي هيپ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (240, N'فلوشيپ جراحي هيپ و زانو')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (241, N'فلوشيپ جراحي هيپ و لگن')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (242, N'فلوشيپ جراحي کليه، مجاري ادراري و تناسلي زنان (اورولوژي زنان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (243, N'فلوشيپ جراحي کليه، مجاري ادراري و تناسلي کودکان (اورولوژي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (244, N'فلوشيپ جراحي کم تهاجمي پيشرفته و چاقي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (245, N'فلوشيپ چشم پزشکي کودکان و انحراف چشم (استرابيسم)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (246, N'فلوشيپ داروسازي در مراقبت‌هاي ويژه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (247, N'فلوشيپ درد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (248, N'فلوشيپ درمان اعتياد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (249, N'فلوشيپ دمانس')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (250, N'فلوشيپ دندانپزشکي بيمارستاني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (251, N'فلوشيپ رانيماسيون')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (252, N'فلوشيپ روان درماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (253, N'فلوشيپ روانپزشکي پريناتال')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (254, N'فلوشيپ روانپزشکي سالمندان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (255, N'فلوشيپ روانپزشکي کودک و نوجوان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (256, N'فلوشيپ زيبايي پوست و ليزر')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (257, N'فلوشيپ سالمندشناسي (ژرياتريک)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (258, N'فلوشيپ سرطان شناسي (انکولوژي) زنان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (259, N'فلوشيپ سرطان شناسي چشم (افتالموانکولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (260, N'فلوشيپ سرطان شناسي دستگاه ادراري وتناسلي (اوروانکولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (261, N'فلوشيپ سم شناسي باليني ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (262, N'فلوشيپ سوختگي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (263, N'فلوشيپ سونوگرافي زنان و زايمان ')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (264, N'فلوشيپ سکته مغزي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (265, N'فلوشيپ سي تي اسکن و ام آر آي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (266, N'فلوشيپ سيتوژنتيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (267, N'فلوشيپ شبکيه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (268, N'فلوشيپ صرع')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (269, N'فلوشيپ طب تسکيني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (270, N'فلوشيپ طب توانبخشي ستون فقرات و اختلالات اسکلتي عضلاني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (271, N'فلوشيپ طب خواب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (272, N'فلوشيپ طب روان تني ( سايکوسوماتيک)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (273, N'فلوشيپ طب مادر و جنين (پريناتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (274, N'فلوشيپ طب نوزادي و پيرامون تولد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (275, N'فلوشيپ عصبي عضلاني (نوروماسکولار)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (276, N'فلوشيپ فتودرماتولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (277, N'فلوشيپ قرنيه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (278, N'فلوشيپ قرنيه و خارج چشمي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (279, N'فلوشيپ گلوکوم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (280, N'فلوشيپ گوش، گلو، بيني و جراحي سر و گردن')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (281, N'فلوشيپ لاپاراسکوپي و آي وي اف')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (282, N'فلوشيپ لاپاراسکوپي و هيستروسکوپي زنان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (283, N'فلوشيپ لارنگولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (284, N'فلوشيپ ليزر در جراحي فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (285, N'فلوشيپ مراقبت‌هاي ويژه (آي سي يو)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (286, N'فلوشيپ مراقبت‌هاي ويژه کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (287, N'فلوشيپ مولتيپل اسکلروزيس (ام اس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (288, N'فلوشيپ مولکولار پاتولوژي و سيتوژنتيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (289, N'فلوشيپ مولکولارژنوميک پاتولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (290, N'فلوشيپ ناباروري')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (291, N'فلوشيپ نارسايي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (292, N'فلوشيپ نازايي و آي وي اف')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (293, N'فلوشيپ نخاع')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (294, N'فلوشيپ نفرولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (295, N'فلوشيپ نوروژنتيک')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (296, N'فلوشيپ ويتره و رتين')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (297, N'فلوشيپ کاشت دندان (ايمپلنت)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (298, N'فلوشيپ کنترل عفونت‌هاي بيمارستاني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (299, N'فلوشيپ يووئيت و بيماري‌هاي التهابي چشم')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (300, N'فوق تخصص آسيب شناسي خون (هماتوپاتولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (301, N'فوق تخصص آلرژي و ايمني شناسي باليني (آلرژي و ايمونولوژي باليني)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (302, N'فوق تخصص اختلالات خواب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (303, N'فوق تخصص اقدامات مداخله‌اي قلب و عروق (اينترونشنال کارديولوژي) بزرگسالان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (304, N'فوق تخصص الکتروميوگرافي و هدايت عصبي محيطي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (305, N'فوق تخصص ايمني شناسي باليني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (306, N'فوق تخصص بيمار‌ي‌هاي متابوليک ارثي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (307, N'فوق تخصص بيماري‌هاي خون و سرطان (هماتولوژي انکولوژي) کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (308, N'فوق تخصص بيماري‌هاي خون و سرطان بزرگسالان (هماتولوژي انکولوژي بزرگسالان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (309, N'فوق تخصص بيماري‌هاي روماتولوژي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (310, N'فوق تخصص بيماري‌هاي روماتولوژي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (311, N'فوق تخصص بيماري‌هاي ريه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (312, N'فوق تخصص بيماري‌هاي ريه کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (313, N'فوق تخصص بيماري‌هاي عفوني و گرمسيري')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (314, N'فوق تخصص بيماري‌هاي عفوني کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (315, N'فوق تخصص بيماري‌هاي غدد درون ريز و متابوليسم (اندوکرينولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (316, N'فوق تخصص بيماري‌هاي غدد درون ريز و متابوليسم کودکان (اندوکرينولوژي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (317, N'فوق تخصص بيماري‌هاي قلب و عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (318, N'فوق تخصص بيماري‌هاي قلب کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (319, N'فوق تخصص بيماري‌هاي گوارش و کبد بزرگسالان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (320, N'فوق تخصص بيماري‌هاي گوارش کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (321, N'فوق تخصص بيماري‌هاي مغز و اعصاب کودکان (نورولوژي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (322, N'فوق تخصص بيماري‌هاي کليه بزرگسالان (نفرولوژي بزرگسالان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (323, N'فوق تخصص بيماري‌هاي کليه کودکان (نفرولوژي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (324, N'فوق تخصص بيهوشي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (325, N'فوق تخصص تصويربرداري اعصاب (نوروراديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (326, N'فوق تخصص جراحي پلاستيک، ترميمي و سوختگي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (327, N'فوق تخصص جراحي تعويض مفصل ران و اندام‌هاي تحتاني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (328, N'فوق تخصص جراحي دست')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (329, N'فوق تخصص جراحي زانو')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (330, N'فوق تخصص جراحي عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (331, N'فوق تخصص جراحي عروق و تروما')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (332, N'فوق تخصص جراحي عروق، پيوند کليه و کبد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (333, N'فوق تخصص جراحي غدد و سرطان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (334, N'فوق تخصص جراحي قفسه صدري ( جراحي توراکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (335, N'فوق تخصص جراحي قلب و عروق')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (336, N'فوق تخصص جراحي قلب و قفسه صدري(قلب و توراکس)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (337, N'فوق تخصص جراحي کليه، مجاري ادراري و تناسلي کودکان (اورولوژي کودکان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (338, N'فوق تخصص جراحي کودکان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (339, N'فوق تخصص روانپزشکي کودک و نوجوان')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (340, N'فوق تخصص سرطان شناسي (انکولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (341, N'فوق تخصص سرطان شناسي دستگاه ادراري وتناسلي (اوروانکولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (342, N'فوق تخصص سرطان شناسي زنان (انکولوژي زنان)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (343, N'فوق تخصص طب نوزادي و پيرامون تولد')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (344, N'فوق تخصص لاپاراسکوپي و آي وي اف')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (345, N'فوق تخصص مراقبت‌هاي ويژه (آي سي يو)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (346, N'فوق تخصص نازايي و آي وي اف')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (347, N'متخصص جراحي ترميمي دهان، فک و صورت')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (348, N'متخصص جراحي قلب')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (349, N'کارشناس ارشد مشاوره مامايي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (350, N'کارشناسي ارتز و پروتز (ارتوپدي فني)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (351, N'کارشناسي ارشد آموزش مامايي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (352, N'کارشناسي ارشد ارتز و پروتز (ارتوپدي فني)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (353, N'کارشناسي ارشد بينايي سنجي (اپتومتري)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (354, N'کارشناسي ارشد داروسازي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (355, N'کارشناسي ارشد داروشناسي (فارماکولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (356, N'کارشناسي ارشد شنوايي شناسي (اديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (357, N'کارشناسي ارشد علوم تغذيه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (358, N'کارشناسي ارشد فيزيوتراپي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (359, N'کارشناسي ارشد گفتاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (360, N'کارشناسي ارشد مامايي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (361, N'کارشناسي ارشد کاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (362, N'کارشناسي بينايي سنجي (اپتومتري)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (363, N'کارشناسي داروسازي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (364, N'کارشناسي شنوايي شناسي (اديولوژي)')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (365, N'کارشناسي علوم تغذيه')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (366, N'کارشناسي فيزيوتراپي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (367, N'کارشناسي گفتاردرماني')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (368, N'کارشناسي مامايي')
ƒ
INSERT [dbo].[tblSpecialty] ([Id], [Name]) VALUES (369, N'کارشناسي کاردرماني')
ƒ
SET IDENTITY_INSERT [dbo].[tblSpecialty] OFF
ƒ

/****** Object:  StoredProcedure [dbo].[spAutoDoctorId]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE PROCEDURE [dbo].[spAutoDoctorId]
AS
    BEGIN
        DECLARE @a INT = 0;
            DECLARE @b INT;
            SET @b = IDENT_CURRENT('tblDoctor') + 1;
        WHILE @a = 0
            BEGIN
                IF EXISTS ( SELECT TOP 1
                                    Id
                            FROM    dbo.tblDoctor
                            WHERE   dbo.tblDoctor.Doctor_Id = CONVERT(NVARCHAR(10), @b) )
                    SET @b = @b + 1;
                ELSE
                    SET @a = 1;
            END;
        SELECT  @b;
    END;   
ƒ
/****** Object:  StoredProcedure [dbo].[spAutoPatientId]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
CREATE PROCEDURE [dbo].[spAutoPatientId]
AS
    BEGIN
        DECLARE @a INT = 0;
            DECLARE @b INT;
            SET @b = IDENT_CURRENT('tblPatient') + 1;
        WHILE @a = 0
            BEGIN
                IF EXISTS ( SELECT TOP 1
                                    Id
                            FROM    dbo.tblPatient
                            WHERE   dbo.tblPatient.Patient_Id = CONVERT(NVARCHAR(10), @b) )
                    SET @b = @b + 1;
                ELSE
                    SET @a = 1;
            END;
        SELECT  @b;
    END;   
ƒ
/****** Object:  StoredProcedure [dbo].[spSelectViewDoctor]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
  CREATE PROCEDURE [dbo].[spSelectViewDoctor]  AS BEGIN  	SELECT * FROM dbo.viewDoctor  END   
ƒ
/****** Object:  StoredProcedure [dbo].[spSelectViewDoctorPatient]    Script Date: 3/2/2019 5:50:22 PM ******/
SET ANSI_NULLS ON
ƒ
SET QUOTED_IDENTIFIER ON
ƒ
  CREATE PROCEDURE [dbo].[spSelectViewDoctorPatient]  AS BEGIN  	SELECT * FROM dbo.viewDoctorPatient  END   
ƒ
USE [master]
ƒ
ALTER DATABASE [dbVisitor] SET  READ_WRITE 
ƒ
