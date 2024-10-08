USE [master]
GO
/****** Object:  Database [DisasterAlleviationDB]    Script Date: 2024/09/26 21:40:30 ******/
CREATE DATABASE [DisasterAlleviationDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DisasterAlleviationDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DisasterAlleviationDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DisasterAlleviationDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DisasterAlleviationDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DisasterAlleviationDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DisasterAlleviationDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DisasterAlleviationDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DisasterAlleviationDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DisasterAlleviationDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DisasterAlleviationDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DisasterAlleviationDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DisasterAlleviationDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DisasterAlleviationDB] SET  MULTI_USER 
GO
ALTER DATABASE [DisasterAlleviationDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DisasterAlleviationDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DisasterAlleviationDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DisasterAlleviationDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DisasterAlleviationDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DisasterAlleviationDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DisasterAlleviationDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [DisasterAlleviationDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DisasterAlleviationDB]
GO
/****** Object:  Table [dbo].[AddedTasks]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddedTasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[TaskName] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [nvarchar](255) NULL,
	[ContactInfo] [nvarchar](255) NULL,
	[DateAdded] [datetime] NULL,
	[Status] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssignedTasks]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssignedTasks](
	[AssignmentId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[VolunteerId] [nvarchar](255) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsCompleted] [bit] NULL,
	[UserId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssignmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Donations]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Donations](
	[DonationId] [int] IDENTITY(1,1) NOT NULL,
	[ResourceType] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DateSubmitted] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DonationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IncidentReports]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IncidentReports](
	[IncidentId] [int] IDENTITY(1,1) NOT NULL,
	[IncidentType] [nvarchar](100) NOT NULL,
	[Location] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DateReported] [date] NOT NULL,
	[DateSubmitted] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IncidentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[PasswordHash] [nvarchar](max) NOT NULL,
	[ConfirmPassword] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Volunteers]    Script Date: 2024/09/26 21:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Volunteers](
	[VolunteerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[VolunteerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AddedTasks] ADD  DEFAULT ('Available') FOR [Status]
GO
ALTER TABLE [dbo].[AssignedTasks] ADD  DEFAULT ((0)) FOR [IsCompleted]
GO
ALTER TABLE [dbo].[Donations] ADD  DEFAULT (getdate()) FOR [DateSubmitted]
GO
ALTER TABLE [dbo].[IncidentReports] ADD  DEFAULT (getdate()) FOR [DateSubmitted]
GO
ALTER TABLE [dbo].[AssignedTasks]  WITH CHECK ADD FOREIGN KEY([TaskId])
REFERENCES [dbo].[AddedTasks] ([TaskId])
GO
USE [master]
GO
ALTER DATABASE [DisasterAlleviationDB] SET  READ_WRITE 
GO
