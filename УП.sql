USE [master]
GO
/****** Object:  Database [RepairRequests]    Script Date: 06.11.2024 17:56:42 ******/
CREATE DATABASE [RepairRequests]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RepairRequests', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RepairRequests.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RepairRequests_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RepairRequests_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RepairRequests] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RepairRequests].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RepairRequests] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RepairRequests] SET ARITHABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RepairRequests] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RepairRequests] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RepairRequests] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RepairRequests] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RepairRequests] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RepairRequests] SET  ENABLE_BROKER 
GO
ALTER DATABASE [RepairRequests] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RepairRequests] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RepairRequests] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RepairRequests] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RepairRequests] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RepairRequests] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RepairRequests] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RepairRequests] SET RECOVERY FULL 
GO
ALTER DATABASE [RepairRequests] SET  MULTI_USER 
GO
ALTER DATABASE [RepairRequests] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RepairRequests] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RepairRequests] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RepairRequests] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RepairRequests] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RepairRequests] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'RepairRequests', N'ON'
GO
ALTER DATABASE [RepairRequests] SET QUERY_STORE = ON
GO
ALTER DATABASE [RepairRequests] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RepairRequests]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 06.11.2024 17:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[client_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[contact_info] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[client_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 06.11.2024 17:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[comment_id] [int] NOT NULL,
	[request_id] [int] NOT NULL,
	[performer_id] [int] NOT NULL,
	[comment_date] [datetime] NOT NULL,
	[text] [text] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 06.11.2024 17:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[equipment_id] [int] NOT NULL,
	[serial_number] [varchar](50) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[model] [varchar](100) NULL,
	[location] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[equipment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FaultType]    Script Date: 06.11.2024 17:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FaultType](
	[fault_type_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fault_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Performer]    Script Date: 06.11.2024 17:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Performer](
	[performer_id] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[specialization] [varchar](100) NULL,
	[contact_info] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[performer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepairRequest]    Script Date: 06.11.2024 17:56:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepairRequest](
	[request_id] [int] NOT NULL,
	[request_date] [datetime] NOT NULL,
	[equipment_id] [int] NOT NULL,
	[fault_type_id] [int] NOT NULL,
	[description] [text] NULL,
	[client_id] [int] NOT NULL,
	[status] [varchar](100) NOT NULL,
	[assigned_to] [int] NULL,
	[completion_date] [datetime] NULL,
	[report] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[request_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([performer_id])
REFERENCES [dbo].[Performer] ([performer_id])
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD FOREIGN KEY([request_id])
REFERENCES [dbo].[RepairRequest] ([request_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([assigned_to])
REFERENCES [dbo].[Performer] ([performer_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([client_id])
REFERENCES [dbo].[Client] ([client_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([equipment_id])
REFERENCES [dbo].[Equipment] ([equipment_id])
GO
ALTER TABLE [dbo].[RepairRequest]  WITH CHECK ADD FOREIGN KEY([fault_type_id])
REFERENCES [dbo].[FaultType] ([fault_type_id])
GO
USE [master]
GO
ALTER DATABASE [RepairRequests] SET  READ_WRITE 
GO
