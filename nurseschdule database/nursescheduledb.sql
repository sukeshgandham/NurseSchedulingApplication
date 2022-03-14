USE [master]
GO

/****** Object:  Database [nurse_scheduling_system]    Script Date: 6/15/2021 5:58:53 PM ******/
CREATE DATABASE [nurse_scheduling_system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'nurse_scheduling_system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nurse_scheduling_system.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'nurse_scheduling_system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\nurse_scheduling_system_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [nurse_scheduling_system] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [nurse_scheduling_system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [nurse_scheduling_system] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET ARITHABORT OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [nurse_scheduling_system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [nurse_scheduling_system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET  DISABLE_BROKER 
GO

ALTER DATABASE [nurse_scheduling_system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [nurse_scheduling_system] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [nurse_scheduling_system] SET  MULTI_USER 
GO

ALTER DATABASE [nurse_scheduling_system] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [nurse_scheduling_system] SET DB_CHAINING OFF 
GO

ALTER DATABASE [nurse_scheduling_system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [nurse_scheduling_system] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [nurse_scheduling_system] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [nurse_scheduling_system] SET  READ_WRITE 
GO

