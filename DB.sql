USE [master]
GO
/****** Object:  Database [DBMiniCapstone]    Script Date: 6/6/2024 1:54:05 AM ******/
CREATE DATABASE [DBMiniCapstone]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBMiniCapstone', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEMINHTRI\MSSQL\DATA\DBMiniCapstone.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBMiniCapstone_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.LEMINHTRI\MSSQL\DATA\DBMiniCapstone_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBMiniCapstone] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [DBMiniCapstone] SET QUERY_STORE = ON
GO
ALTER DATABASE [DBMiniCapstone] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DBMiniCapstone]
GO
/****** Object:  Table [dbo].[Acount]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acount](
	[id_Account] [varchar](50) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Gmail] [varchar](50) NULL,
	[Birthdate] [date] NULL,
	[Gender] [nvarchar](50) NULL,
	[Role] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EducationalQualifications]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EducationalQualifications](
	[id_EducationalEualifications] [varchar](50) NOT NULL,
	[CertificateName] [varchar](50) NULL,
	[img] [varchar](50) NULL,
	[Type] [varchar](50) NULL,
	[id_Tutor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_EducationalEualifications] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Field]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Field](
	[id_Field] [varchar](50) NOT NULL,
	[FieldName] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [varchar](50) NOT NULL,
	[Token] [varchar](50) NULL,
	[JwtId] [varchar](50) NULL,
	[IsUsed] [bit] NULL,
	[IsRevoked] [bit] NULL,
	[ExpiredAt] [datetime] NULL,
	[IssuedAt] [datetime] NULL,
	[id_Account] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rent]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rent](
	[id_Rent] [varchar](50) NOT NULL,
	[Status] [varchar](10) NULL,
	[id_Student] [varchar](10) NOT NULL,
	[id_Schedule] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Rent] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id_Post] [varchar](50) NOT NULL,
	[Price] [varchar](50) NULL,
	[Titile] [varchar](50) NULL,
	[Description] [varchar](200) NULL,
	[Status] [varchar](50) NULL,
	[id_Student] [varchar](10) NOT NULL,
	[id_TypeOfService] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Post] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Resquest_Learning]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resquest_Learning](
	[id_RequestLearning] [varchar](50) NOT NULL,
	[Status] [varchar](50) NULL,
	[id_Tutor] [varchar](50) NOT NULL,
	[tid_Post] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_RequestLearning] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[id_Schedule] [varchar](50) NOT NULL,
	[Date] [date] NULL,
	[TimeStart] [time](7) NULL,
	[TimeEnd] [time](7) NULL,
	[id_Service] [varchar](50) NOT NULL,
	[id_Post] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Schedule] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[id_Service] [varchar](50) NOT NULL,
	[Price] [real] NULL,
	[Status] [varchar](50) NULL,
	[Title] [varchar](50) NULL,
	[Description] [varchar](50) NULL,
	[Video] [varchar](50) NULL,
	[Tutorid_Tutor] [varchar](50) NOT NULL,
	[id_TypeOfService] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Service] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[id_Student] [varchar](10) NOT NULL,
	[img] [varchar](50) NULL,
	[id_Account] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Student] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor](
	[id_Tutor] [varchar](50) NOT NULL,
	[SpecializedSkills] [varchar](50) NULL,
	[Experience] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[id_Account] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Tutor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tutor_Field]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tutor_Field](
	[id_Tutor_Fileld] [varchar](50) NOT NULL,
	[id_Tutor] [varchar](50) NOT NULL,
	[id_Field] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Tutor_Fileld] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type of service]    Script Date: 6/6/2024 1:54:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type of service](
	[id_TypeOfService] [varchar](50) NOT NULL,
	[NameService] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_TypeOfService] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EducationalQualifications]  WITH CHECK ADD  CONSTRAINT [FKEducationa811691] FOREIGN KEY([id_Tutor])
REFERENCES [dbo].[Tutor] ([id_Tutor])
GO
ALTER TABLE [dbo].[EducationalQualifications] CHECK CONSTRAINT [FKEducationa811691]
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FKRefreshTok940738] FOREIGN KEY([id_Account])
REFERENCES [dbo].[Acount] ([id_Account])
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FKRefreshTok940738]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FKRent745294] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Student] ([id_Student])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FKRent745294]
GO
ALTER TABLE [dbo].[Rent]  WITH CHECK ADD  CONSTRAINT [FKRent911520] FOREIGN KEY([id_Schedule])
REFERENCES [dbo].[Schedule] ([id_Schedule])
GO
ALTER TABLE [dbo].[Rent] CHECK CONSTRAINT [FKRent911520]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest420764] FOREIGN KEY([id_Student])
REFERENCES [dbo].[Student] ([id_Student])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest420764]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FKRequest882743] FOREIGN KEY([id_TypeOfService])
REFERENCES [dbo].[Type of service] ([id_TypeOfService])
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FKRequest882743]
GO
ALTER TABLE [dbo].[Resquest_Learning]  WITH CHECK ADD  CONSTRAINT [FKResquest_L231869] FOREIGN KEY([tid_Post])
REFERENCES [dbo].[Request] ([id_Post])
GO
ALTER TABLE [dbo].[Resquest_Learning] CHECK CONSTRAINT [FKResquest_L231869]
GO
ALTER TABLE [dbo].[Resquest_Learning]  WITH CHECK ADD  CONSTRAINT [FKResquest_L23721] FOREIGN KEY([id_Tutor])
REFERENCES [dbo].[Tutor] ([id_Tutor])
GO
ALTER TABLE [dbo].[Resquest_Learning] CHECK CONSTRAINT [FKResquest_L23721]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FKSchedule601757] FOREIGN KEY([id_Post])
REFERENCES [dbo].[Request] ([id_Post])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FKSchedule601757]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FKSchedule81136] FOREIGN KEY([id_Service])
REFERENCES [dbo].[Service] ([id_Service])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FKSchedule81136]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FKService343958] FOREIGN KEY([id_TypeOfService])
REFERENCES [dbo].[Type of service] ([id_TypeOfService])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FKService343958]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FKService741934] FOREIGN KEY([Tutorid_Tutor])
REFERENCES [dbo].[Tutor] ([id_Tutor])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FKService741934]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FKStudent366114] FOREIGN KEY([id_Account])
REFERENCES [dbo].[Acount] ([id_Account])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FKStudent366114]
GO
ALTER TABLE [dbo].[Tutor]  WITH CHECK ADD  CONSTRAINT [FKTutor303168] FOREIGN KEY([id_Account])
REFERENCES [dbo].[Acount] ([id_Account])
GO
ALTER TABLE [dbo].[Tutor] CHECK CONSTRAINT [FKTutor303168]
GO
ALTER TABLE [dbo].[Tutor_Field]  WITH CHECK ADD  CONSTRAINT [FKTutor_Fiel195321] FOREIGN KEY([id_Tutor])
REFERENCES [dbo].[Tutor] ([id_Tutor])
GO
ALTER TABLE [dbo].[Tutor_Field] CHECK CONSTRAINT [FKTutor_Fiel195321]
GO
ALTER TABLE [dbo].[Tutor_Field]  WITH CHECK ADD  CONSTRAINT [FKTutor_Fiel99285] FOREIGN KEY([id_Field])
REFERENCES [dbo].[Field] ([id_Field])
GO
ALTER TABLE [dbo].[Tutor_Field] CHECK CONSTRAINT [FKTutor_Fiel99285]
GO
USE [master]
GO
ALTER DATABASE [DBMiniCapstone] SET  READ_WRITE 
GO
