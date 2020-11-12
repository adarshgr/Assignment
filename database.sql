USE [master]
GO

/****** Object:  Database [locusnine_assignmentDb]    Script Date: 12-11-2020 23:13:40 ******/
CREATE DATABASE [locusnine_assignmentDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'locusnine_assignmentDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS14\MSSQL\DATA\locusnine_assignmentDb.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'locusnine_assignmentDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS14\MSSQL\DATA\locusnine_assignmentDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [locusnine_assignmentDb] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [locusnine_assignmentDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [locusnine_assignmentDb] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET ARITHABORT OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [locusnine_assignmentDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [locusnine_assignmentDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET  DISABLE_BROKER 
GO

ALTER DATABASE [locusnine_assignmentDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [locusnine_assignmentDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [locusnine_assignmentDb] SET  MULTI_USER 
GO

ALTER DATABASE [locusnine_assignmentDb] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [locusnine_assignmentDb] SET DB_CHAINING OFF 
GO

ALTER DATABASE [locusnine_assignmentDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [locusnine_assignmentDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [locusnine_assignmentDb] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [locusnine_assignmentDb] SET  READ_WRITE 
GO


USE [locusnine_assignmentDb]
GO

/****** Object:  Table [dbo].[UserDetails]    Script Date: 12-11-2020 23:14:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[emailPersonal] [varchar](50) NOT NULL,
	[emailOfficial] [varchar](50) NULL,
	[mobileNo] [varchar](50) NULL,
	[roleType] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[lastUpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



