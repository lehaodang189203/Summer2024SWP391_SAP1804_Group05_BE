USE [master]
GO
/****** Object:  Database [DBMiniCapstone]    Script Date: 7/7/2024 4:39:35 AM ******/
CREATE DATABASE [DBMiniCapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMiniCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBMiniCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBMiniCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBMiniCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBMiniCapstone] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBMiniCapstone].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBMiniCapstone] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBMiniCapstone] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBMiniCapstone] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBMiniCapstone] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBMiniCapstone] SET  MULTI_USER 
GO
ALTER DATABASE [DBMiniCapstone] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBMiniCapstone] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBMiniCapstone] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBMiniCapstone] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBMiniCapstone] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBMiniCapstone] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBMiniCapstone] SET QUERY_STORE = OFF
GO
USE [DBMiniCapstone]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Date_Of_Birth] [date] NULL,
	[Gender] [nvarchar](10) NULL,
	[Roles] [nvarchar](50) NULL,
	[Avatar] [nvarchar](max) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[AccountBalance] [real] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[ID] [varchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Duration] [int] NULL,
	[Price] [real] NULL,
	[ID_TimeSlot] [varchar](50) NULL,
	[ID_Service] [varchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [varchar](50) NOT NULL,
	[ClassName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClassRequest]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassRequest](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Request] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint](
	[ID] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Date]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Date](
	[ID] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[ID_Service] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalQualifications]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalQualifications](
	[ID] [varchar](50) NOT NULL,
	[QualificationName] [nvarchar](100) NULL,
	[Img] [nvarchar](max) NULL,
	[Type] [nvarchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[ID] [varchar](50) NOT NULL,
	[Token] [varchar](50) NULL,
	[JwtId] [varchar](50) NULL,
	[IsUsed] [bit] NULL,
	[IsRevoked] [bit] NULL,
	[ExpiredAt] [datetime] NULL,
	[IssuedAt] [datetime] NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[ID] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[CreateDate] [datetime] NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[ID] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[Title] [nvarchar](50) NULL,
	[LearningMethod] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[TimeTable] [nvarchar](50) NULL,
	[TotalSession] [int] NULL,
	[TimeStart] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Class] [varchar](50) NULL,
	[ID_Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request_Learning]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request_Learning](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Request] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ID] [varchar](50) NOT NULL,
	[Feedback] [nvarchar](max) NULL,
	[Rating] [float] NULL,
	[ID_Account] [varchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [varchar](50) NOT NULL,
	[PricePerHour] [real] NULL,
	[Title] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[LearningMethod] [nvarchar](50) NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Class] [varchar](50) NULL,
	[ID_Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[ID] [varchar](50) NOT NULL,
	[SubjectName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[ID] [varchar](50) NOT NULL,
	[TimeSlot] [time](7) NULL,
	[Status] [nvarchar](50) NULL,
	[ID_Date] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[ID] [varchar](50) NOT NULL,
	[Amount] [real] NULL,
	[CreateDate] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[ID] [varchar](50) NOT NULL,
	[SpecializedSkills] [nvarchar](50) NULL,
	[Introduction] [nvarchar](max) NULL,
	[Experience] [int] NULL,
	[Status] [nvarchar](20) NULL,
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 7/7/2024 4:39:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Subject](
	[ID] [varchar](50) NOT NULL,
	[ID_Tutor] [varchar](50) NULL,
	[ID_Subject] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'2A75FEA8-6DEA-497C-B40B-BB832800E3AB', N'Moderator User', N'123456', N'mod@gmail.com', NULL, N'Male', N'Kiểm duyệt viên', NULL, NULL, NULL, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'AB8C8D73-1F66-44C5-A05A-195A6959F36D', N'Admin User', N'123456', N'admin@gmail.com', NULL, N'Male', N'Quản trị viên', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'84CD6027-FC5C-4D4C-AFC2-4FE92489505E', N'11')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'87EBC3A5-3D73-4C45-9A0D-157405DDE00C', N'12')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'F318E90D-3AE8-45E3-AE14-960921418AE1', N'10')
GO
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'16D7420C-690D-4B72-B262-80B46FDF6FB6', N'Vật Lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'1F97F3FF-DEC5-4ACD-A40C-EFD093036DB0', N'Lịch sử')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'2DB22D2C-78F0-465B-8053-9E65C042E2E8', N'Tin học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'383D9B2C-3476-44AF-9C87-B299E636DF4E', N'Ngữ văn')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'46CE9525-1ED5-4FC6-92C4-80451FCBC68D', N'Hóa học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'6986C7E2-7E38-43A1-AB54-8FCB191CB5ED', N'Toán học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'7C6C54F6-208E-4F17-B799-8B887B085768', N'Sinh học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'C0213A8E-142F-4C5A-B495-1E8914E165E9', N'Địa lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'C9309B0D-5EEF-49BF-9034-D9CF5381FBB9', N'Ngoại ngữ')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'FADE179C-7348-46C3-8E13-81F38802F5FA', N'Giáo dục công dân')
GO
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'070B0843-6D7A-4549-9655-E16B820A7523', CAST(N'10:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'0A67D13E-82EE-4FE9-A7A4-1D5519886B06', CAST(N'04:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'0AA9088D-B704-41F1-85F7-8918E26006D1', CAST(N'01:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'0C7EF222-8CF1-4896-A222-3501AD4F2199', CAST(N'02:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'10305A4C-74D0-4B19-9C62-764121D65573', CAST(N'04:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'133C710E-1DE7-4AA8-A04B-3E83FF2C3656', CAST(N'08:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1BE85D14-C818-4DF4-AB8E-2F1D30361C8E', CAST(N'14:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1DF1005E-9F00-4D0D-B015-343E550EA4C5', CAST(N'00:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1E730A98-2AFB-460E-A73E-744C759F8A0C', CAST(N'07:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1F554622-DC19-42C8-AB7E-23D5F1199205', CAST(N'00:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'2124A5DE-4FA0-4A08-85A6-0F62C33D7C7E', CAST(N'06:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'24A75046-49DE-424C-8AF8-CAB02B9AD312', CAST(N'20:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'26010BB4-B912-4805-9D76-97829B855DE8', CAST(N'16:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'3380CE57-2E9F-40A9-9656-125C65597849', CAST(N'03:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'46051399-F3AA-46C1-B111-1625C44EDE6C', CAST(N'07:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'4959B485-5536-4425-A6FD-75DC4E372DB7', CAST(N'05:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'4B93269C-304D-4770-BBFD-B0A09EDA1409', CAST(N'03:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'5637C945-4525-4899-802E-C9501A850613', CAST(N'15:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'59759DCA-1876-4D49-9A96-A00475E8B953', CAST(N'21:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'5FD6EAA6-1BA8-4913-8AEC-C3B106165E43', CAST(N'17:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'61EBC645-CB0D-4FDA-BEA2-25AECEBED4E3', CAST(N'11:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'6DDC1505-007C-4080-9429-3561737A1970', CAST(N'22:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'7064373F-1A10-46F4-9A03-BE6B44243FD5', CAST(N'09:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'8236561A-21F1-42D1-BCEE-249A8ED3EF3E', CAST(N'22:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'82CA1405-6D93-4345-887A-90E3BF9B20AD', CAST(N'12:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'82CD5B99-8F3D-4DF4-B94A-DE008CA2AB43', CAST(N'09:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'864E8A11-1DAC-41F3-BC6A-E27EF96B5651', CAST(N'01:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'8E26FAAB-3DA6-4C72-8E40-8EBC9A3B33F9', CAST(N'19:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'92465AB1-1638-4D02-98C1-73671608299E', CAST(N'16:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'96C5DFB5-25E8-41CD-94A9-49A4E7E7CB22', CAST(N'23:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'98EF59B2-EEB4-4C0E-A991-5EFD5963AF4E', CAST(N'17:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'AF30CE13-884A-426A-A589-E2D9F5DB4E92', CAST(N'23:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B2921633-2AE6-4900-8EFD-680B87F40A76', CAST(N'18:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B6988F17-5B0A-4CEF-AADA-F0098E220E0A', CAST(N'13:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'C3C10CEA-0F39-4F98-AF79-D5C5D37AF0A9', CAST(N'14:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'C585D90A-6FD1-4C82-9325-21E370D6B7A4', CAST(N'18:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'C5F7993B-2B99-42FC-90D0-0438B4E9F255', CAST(N'06:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'CB5E353D-C10C-4572-A6F3-3873D5DB9BA4', CAST(N'13:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'CF330740-A0E1-495D-8095-95D463C56816', CAST(N'12:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'D33C4BB0-C15C-47FD-983C-BD187DA6AFF0', CAST(N'02:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'DDD16309-38B0-4F74-9A26-34D32B45FCDB', CAST(N'19:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'DDFC7412-9D4A-461D-8636-6AE1812ADC99', CAST(N'21:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'E105D99B-8899-47F7-B28E-8E39B27F1398', CAST(N'15:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'E29DBFA5-3CBB-4D02-979D-09E769ABE87F', CAST(N'05:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'E9B7E611-E86B-41F0-BB02-50FE2B3A6D26', CAST(N'10:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'EBFDD647-D8C7-4A17-AD6D-90BD5C952B1A', CAST(N'20:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'F2E313DD-7604-451F-B8C1-77660FD44F6C', CAST(N'11:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'F84FCB60-8449-410C-9C0E-645AA9F2FDC6', CAST(N'08:00:00' AS Time), NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tutor__213379EAEB517CD4]    Script Date: 7/7/2024 4:39:35 AM ******/
ALTER TABLE [dbo].[Tutor] ADD UNIQUE NONCLUSTERED 
(
	[ID_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD FOREIGN KEY([ID_TimeSlot])
REFERENCES [dbo].[TimeSlot] ([ID])
GO
ALTER TABLE [dbo].[ClassRequest]  WITH CHECK ADD FOREIGN KEY([ID_Request])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[ClassRequest]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Complaint]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Date]  WITH CHECK ADD FOREIGN KEY([ID_Service])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[EducationalQualifications]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ID_Class])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Request_Learning]  WITH CHECK ADD FOREIGN KEY([ID_Request])
REFERENCES [dbo].[Request] ([ID])
GO
ALTER TABLE [dbo].[Request_Learning]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Class])
REFERENCES [dbo].[Class] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
ALTER TABLE [dbo].[TimeSlot]  WITH CHECK ADD FOREIGN KEY([ID_Date])
REFERENCES [dbo].[Date] ([ID])
GO
ALTER TABLE [dbo].[Transaction]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD FOREIGN KEY([ID_Account])
REFERENCES [dbo].[Account] ([ID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([ID_Subject])
REFERENCES [dbo].[Subject] ([ID])
GO
ALTER TABLE [dbo].[Tutor_Subject]  WITH CHECK ADD FOREIGN KEY([ID_Tutor])
REFERENCES [dbo].[Tutor] ([ID])
GO
USE [master]
GO
ALTER DATABASE [DBMiniCapstone] SET  READ_WRITE 
GO
