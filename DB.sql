USE [master]
GO
/****** Object:  Database [DBMiniCapstone]    Script Date: 7/7/2024 5:50:05 AM ******/
CREATE DATABASE [DBMiniCapstone]
 
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
/****** Object:  Table [dbo].[Account]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Booking]    Script Date: 7/7/2024 5:50:05 AM ******/
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
	[ID_Account] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[ClassRequest]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Complaint]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Date]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[EducationalQualifications]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Rent]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Request]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Request_Learning]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Review]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Subject]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Transaction]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Tutor]    Script Date: 7/7/2024 5:50:05 AM ******/
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
/****** Object:  Table [dbo].[Tutor_Subject]    Script Date: 7/7/2024 5:50:05 AM ******/
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
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'DBB0A8DB-E704-406B-B2B2-7FEB7239B0AE', N'Quản trị viên', N'123456', N'admin@gmail.com', NULL, N'Male', N'quản trị viên', NULL, NULL, NULL, 0)
INSERT [dbo].[Account] ([ID], [FullName], [Password], [Email], [Date_Of_Birth], [Gender], [Roles], [Avatar], [Address], [Phone], [AccountBalance]) VALUES (N'DBF229D1-331A-4AC6-A910-F2138E365AA6', N'Kiểm duyệt viên', N'123456', N'mod@gmail.com', NULL, N'Male', N'kiểm duyệt viên', NULL, NULL, NULL, 0)
GO
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'24831355-A591-42CB-8805-1F101AFAAC62', N'12')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'8C10DB5E-B78A-462F-90D0-AD200AE1210F', N'11')
INSERT [dbo].[Class] ([ID], [ClassName]) VALUES (N'99B19BC7-1272-49F6-A6BC-24D18F3CA1EE', N'10')
GO
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'075C5BAD-4480-4F84-A3BF-6B2D36604556', N'Ngữ văn')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'135AADA6-1D42-4BF4-A45B-BA6A9191201A', N'Sinh học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'2BC6F423-865B-47DC-BA6B-6BC6C8D63DFF', N'Vật Lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'3612FDAE-0DFF-4EAF-9D7E-18F38D2817A3', N'Lịch sử')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'39E98AA8-027E-4AD3-9E7C-C89554D977EE', N'Ngoại ngữ')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'3E3EA2E0-C9A9-4AC1-B354-C689C6FDF7B7', N'Giáo dục công dân')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'5B6AFF08-3F1F-41E0-B99B-16C731AE3F22', N'Tin học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'5E621B58-27C2-4947-9781-223BBCF5EF20', N'Địa lý')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'9F0326C5-1FA5-4826-8A11-FADB21A81CB3', N'Toán học')
INSERT [dbo].[Subject] ([ID], [SubjectName]) VALUES (N'FE4555BC-C93E-4B54-962A-F5799CACFA49', N'Hóa học')
GO
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'077F7A3F-AC62-412D-AF92-20D248F45423', CAST(N'09:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'087C5860-EEDF-46CD-B72A-FF0C2242ECB7', CAST(N'07:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'0A9F434E-C367-49A5-A5A2-3AC02D14670F', CAST(N'06:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'0F45E762-7782-4DC2-BF34-E4536BE5C5C5', CAST(N'23:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'13D47A9F-4992-408A-9350-F409195CD728', CAST(N'00:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1A27EB25-63B5-4A2B-B1E8-82D277CF16B6', CAST(N'10:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1AEF4C95-27D1-4764-8599-E86A04178B80', CAST(N'22:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'1EC9EAA5-1894-43CB-98A3-4E871EC0817A', CAST(N'11:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'2483415B-C9F6-45F9-AB39-337267A418E0', CAST(N'15:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'2F37EFE9-9FEE-43A8-8653-C67936334E2F', CAST(N'23:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'3039CDB4-6A7D-4626-940B-908BEBB8A5E0', CAST(N'18:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'321D8318-FAE9-42CD-B518-7BAD4A11780F', CAST(N'09:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'3AAADCB3-52B0-403D-A4E2-95407A8AF847', CAST(N'19:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'3B40B2D3-1DE2-48F4-949E-C68EB97A0B30', CAST(N'16:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'41B51439-C743-45BF-B7DB-443058C65518', CAST(N'01:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'42F546EB-4D79-42FB-B2BA-F767B75E06D3', CAST(N'21:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'439BB561-B98C-4F55-8AA3-A25B7DD771E9', CAST(N'12:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'44E047D5-E3BD-44F3-A350-302EB418C4BD', CAST(N'19:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'4A8C49E7-70FA-4B55-B8A5-655C1F6C8922', CAST(N'00:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'4AE5CE86-2DC6-4E4E-B563-14290FA8C5E8', CAST(N'12:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'4B37864C-B52B-459B-8202-7246CCC5F2EF', CAST(N'17:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'4DE014A9-541B-43BC-A4C9-6849784B7CC4', CAST(N'07:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'59023E45-F4FE-4C6B-ADFD-F4DC59E8BBE0', CAST(N'08:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'6104CDEC-7DF2-4BDB-ABD3-C264177B3543', CAST(N'03:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'664CC782-3D86-4244-9769-6ACFEACCDD37', CAST(N'13:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'6945128B-5896-41A5-ACB8-AF14B394A72B', CAST(N'20:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'6B032273-4C89-4DF0-A49B-FB90DE4FFA7E', CAST(N'20:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'8059407D-F3FC-42C5-9272-90C0FEE36CDC', CAST(N'11:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'821928FD-EBD7-432E-9523-52E59087F624', CAST(N'02:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'853F344A-2BFE-4D3F-955C-CB692CE33015', CAST(N'04:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'8D6C1457-7850-4598-8730-404E23D49D17', CAST(N'05:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'8DFC2D96-8CD7-4CD7-B28E-9B70D3A0B8B7', CAST(N'21:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'A6CF7E3E-6417-4A58-AC2A-8F7C3740E251', CAST(N'14:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'AE21C931-01B6-40D3-8615-D3A02144FA50', CAST(N'14:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B4C934E4-87B4-46CE-9700-9D116926C80B', CAST(N'17:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B57F56E6-8456-4570-BCD0-C89EA85585E4', CAST(N'10:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B5E0B5FE-EB63-4FEB-9C6A-8E2085D9D030', CAST(N'18:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B819079A-DDCB-4721-8854-1E9CD17EA3AF', CAST(N'01:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'B9F6EE84-3797-48CC-91DE-66C89C6CC2C9', CAST(N'05:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'BAD9BAFC-58C2-435B-B5A1-38761D583CE7', CAST(N'02:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'BC390B00-D8E1-4444-B2CC-71EDDB174FA5', CAST(N'04:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'C0032983-5A80-487C-B170-8D43EA85E408', CAST(N'13:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'C9245B63-0E68-4899-A369-FCFB9F45691B', CAST(N'16:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'CE250608-1084-4EB3-ACA6-54B6752ABCE6', CAST(N'08:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'E45B58BB-B17F-49A5-805D-49049928E852', CAST(N'15:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'E6C01233-505C-4910-B4BD-5235667EBAD2', CAST(N'22:00:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'EED61D00-9685-40A0-96CD-D9923EB7B1B6', CAST(N'03:30:00' AS Time), NULL, NULL)
INSERT [dbo].[TimeSlot] ([ID], [TimeSlot], [Status], [ID_Date]) VALUES (N'F235A4B4-7ECF-4682-843A-C5F2CC4DC940', CAST(N'06:00:00' AS Time), NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Tutor__213379EAA573B698]    Script Date: 7/7/2024 5:50:05 AM ******/
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
