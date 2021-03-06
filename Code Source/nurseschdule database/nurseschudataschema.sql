USE [master]
GO
/****** Object:  Database [nurse_scheduling_system]    Script Date: 6/15/2021 6:01:35 PM ******/
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
USE [nurse_scheduling_system]
GO
/****** Object:  Table [dbo].[a_registration]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[a_registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[a_regno] [nvarchar](50) NOT NULL,
	[a_regname] [nvarchar](50) NULL,
	[a_address] [nvarchar](200) NULL,
	[a_sec_question] [nvarchar](50) NULL,
	[a_sec_answer] [nvarchar](50) NULL,
	[a_userid] [nvarchar](50) NOT NULL,
	[a_password] [nvarchar](50) NOT NULL,
	[a_con_pwd] [nvarchar](50) NOT NULL,
	[a_createdby] [nvarchar](50) NOT NULL,
	[a_created] [datetime] NOT NULL,
 CONSTRAINT [PK_a_registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerDetails]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerDetails](
	[CustomerId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Country] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CustomerDetails] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[h_registration]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[h_registration](
	[Id] [int] NOT NULL,
	[h_name] [nvarchar](50) NULL,
	[h_reg_no] [nvarchar](50) NULL,
	[h_address] [nvarchar](200) NULL,
	[h_location] [nvarchar](50) NULL,
	[h_phone] [int] NULL,
	[h_email] [nvarchar](50) NULL,
	[h_sec_ques] [nvarchar](50) NULL,
	[h_sec_ans] [nvarchar](50) NOT NULL,
	[h_user_id] [nvarchar](50) NULL,
	[h_pwd] [nvarchar](50) NOT NULL,
	[h_con_pwd] [nvarchar](50) NOT NULL,
	[created] [nvarchar](50) NOT NULL,
	[createdby] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_h_registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[hospital_Requests]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hospital_Requests](
	[Id] [int] NOT NULL,
	[h_id] [int] NULL,
	[h_shiftDate] [datetime] NULL,
	[h_s1] [int] NULL,
	[h_s2] [int] NULL,
	[h_s3] [int] NULL,
	[h_s4] [int] NULL,
	[h_reqNursesInTotal] [int] NULL,
	[h_s1NA] [int] NULL,
	[h_s2NA] [int] NULL,
	[h_s3NA] [int] NULL,
	[h_s4NA] [int] NULL,
	[h_allocatedNurseInTotal] [int] NULL,
 CONSTRAINT [PK_hospital_Requests] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nur_preferences]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nur_preferences](
	[Id] [int] NOT NULL,
	[nu_Id] [int] NULL,
	[nu_location] [nvarchar](50) NULL,
	[nu_shiftDate] [datetime] NULL,
	[nu_s1] [nvarchar](1) NULL,
	[nu_s2] [nvarchar](1) NULL,
	[nu_s3] [nvarchar](1) NULL,
	[nu_s4] [nvarchar](1) NULL,
	[nu_isAllocated] [nvarchar](1) NULL,
 CONSTRAINT [PK_nur_preferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nur_registration]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nur_registration](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nur_firstName] [nvarchar](50) NULL,
	[nur_lastName] [nvarchar](50) NULL,
	[nur_middleName] [nvarchar](50) NULL,
	[nur_dob] [datetime] NULL,
	[nur_qualifications] [nvarchar](50) NULL,
	[nur_designations] [nvarchar](50) NULL,
	[nur_practiceYears] [int] NULL,
	[nur_phone] [int] NULL,
	[nur_email] [nvarchar](50) NULL,
	[nur_userId] [nvarchar](50) NULL,
	[nur_pwd] [nvarchar](50) NULL,
	[nur_conPwd] [nvarchar](50) NULL,
	[nur_secQuestion] [nvarchar](50) NULL,
	[nur_secAnswer] [nvarchar](50) NULL,
	[created] [datetime] NULL,
	[createdby] [nvarchar](50) NULL,
 CONSTRAINT [PK_nur_registration] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[shift_allocations]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[shift_allocations](
	[Id] [int] NOT NULL,
	[nur_id] [int] NULL,
	[hos_id] [int] NULL,
	[date] [datetime] NULL,
	[alloc_s1] [varchar](1) NULL,
	[alloc_s2] [varchar](1) NULL,
	[alloc_s3] [varchar](1) NULL,
	[alloc_s4] [varchar](1) NULL,
	[created] [datetime] NULL,
	[createdby] [varchar](50) NULL,
 CONSTRAINT [PK_shift_allocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[nur_registration] ON 

INSERT [dbo].[nur_registration] ([Id], [nur_firstName], [nur_lastName], [nur_middleName], [nur_dob], [nur_qualifications], [nur_designations], [nur_practiceYears], [nur_phone], [nur_email], [nur_userId], [nur_pwd], [nur_conPwd], [nur_secQuestion], [nur_secAnswer], [created], [createdby]) VALUES (1, N'sukesh', N'sukesh', N'sukesh', CAST(N'2001-10-12 00:00:00.000' AS DateTime), N'aaa', N'aa', 1, 1234567891, N's@g.com', N'nurse12', N'abc123', N'abc123', N'Fav doog', N'pug', CAST(N'2021-06-13 00:00:00.000' AS DateTime), N'sukesh')
INSERT [dbo].[nur_registration] ([Id], [nur_firstName], [nur_lastName], [nur_middleName], [nur_dob], [nur_qualifications], [nur_designations], [nur_practiceYears], [nur_phone], [nur_email], [nur_userId], [nur_pwd], [nur_conPwd], [nur_secQuestion], [nur_secAnswer], [created], [createdby]) VALUES (2, N'sukesh', N'gandham', N'gandham', CAST(N'2021-07-10 00:00:00.000' AS DateTime), N'Masters', N'GNM', 2, 1234567891, N's@gmail.com', N'Nurse123', N'asd', N'asd', N'What is your Birthdate?', N'Pug', CAST(N'2021-06-13 00:00:00.000' AS DateTime), N'Sukesh Gandham')
SET IDENTITY_INSERT [dbo].[nur_registration] OFF
ALTER TABLE [dbo].[hospital_Requests]  WITH CHECK ADD  CONSTRAINT [FK_hospital_Requests_h_registration] FOREIGN KEY([h_id])
REFERENCES [dbo].[h_registration] ([Id])
GO
ALTER TABLE [dbo].[hospital_Requests] CHECK CONSTRAINT [FK_hospital_Requests_h_registration]
GO
ALTER TABLE [dbo].[nur_preferences]  WITH CHECK ADD  CONSTRAINT [FK_nur_preferences_nur_preferences] FOREIGN KEY([nu_Id])
REFERENCES [dbo].[nur_registration] ([Id])
GO
ALTER TABLE [dbo].[nur_preferences] CHECK CONSTRAINT [FK_nur_preferences_nur_preferences]
GO
ALTER TABLE [dbo].[shift_allocations]  WITH CHECK ADD  CONSTRAINT [FK_shift_allocations_h_registration] FOREIGN KEY([hos_id])
REFERENCES [dbo].[h_registration] ([Id])
GO
ALTER TABLE [dbo].[shift_allocations] CHECK CONSTRAINT [FK_shift_allocations_h_registration]
GO
ALTER TABLE [dbo].[shift_allocations]  WITH CHECK ADD  CONSTRAINT [FK_shift_allocations_nur_registration] FOREIGN KEY([nur_id])
REFERENCES [dbo].[nur_registration] ([Id])
GO
ALTER TABLE [dbo].[shift_allocations] CHECK CONSTRAINT [FK_shift_allocations_nur_registration]
GO
/****** Object:  StoredProcedure [dbo].[InsertXML]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--[ParseXML] '<Customers><Customer Id ="1"><Name>JohnHammond</Name><Country>UnitedStates</Country></Customer><Customer Id ="2"><Name>MudassarKhan</Name><Country>India</Country></Customer><Customer Id ="3"><Name>SuzanneMathews</Name><Country>France</Country></Customer><Customer Id ="4"><Name>RobertSchidner</Name><Country>Russia</Country></Customer></Customers>'
CREATE PROCEDURE [dbo].[InsertXML] 
@xml XML
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO CustomerDetails
    SELECT 
	Customer.value('@Id','INT') AS Id, --ATTRIBUTE 
	Customer.value('(Name/text())[1]','VARCHAR(100)') AS Name, --TAG 
	Customer.value('(Country/text())[1]','VARCHAR(100)') AS Country --TAG 
	FROM
	@xml.nodes('/Customers/Customer')AS TEMPTABLE(Customer)
END


GO
/****** Object:  StoredProcedure [dbo].[spAddHospital]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sukesh>
-- Create date: <12/06/2021>
-- Description:	<Create a record in Nurse Registration table>
-- =============================================
CREATE PROCEDURE [dbo].[spAddHospital]

	-- Add the parameters for the stored procedure here
		(
		@Name nvarchar(50),
		@regno nvarchar(50),
		@address nvarchar(50),
		@location nvarchar(50), 
		@phone nvarchar(50),
		@email nvarchar(50),
		@securityquestion nvarchar(50), 
		@securityanswer nvarchar(50),
		@userid nvarchar(50),
		@password nvarchar(50),
		@conpassword nvarchar(50),
		@created datetime,
		@createdby nvarchar(50),
		@Id int output 
		
	)
	AS
BEGIN
	SET NOCOUNT ON;

	   
	INSERT INTO [dbo].[h_registration] (
			[h_name]
           ,[h_reg_no]
           ,[h_address]
           ,[h_location]
           ,[h_phone]
           ,[h_email]
           ,[h_sec_ques]
           ,[h_sec_ans]
           ,[h_user_id]
           ,[h_pwd]
           ,[h_con_pwd],[created],[createdby])
     VALUES
	 (@Name,@regno,
		@address,
		@location ,
		@phone,	@email,
		@securityquestion , 
		@securityanswer,
		@userid ,
		@password ,
		@conpassword,@created,@createdby)
	  SET @Id=SCOPE_IDENTITY()
      RETURN  @Id
end
GO
/****** Object:  StoredProcedure [dbo].[spAddHospitalRequests]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sukesh>
-- Create date: <12/06/2021>
-- Description:	<Create a record in Hosiptal Requests table>
-- =============================================
CREATE PROCEDURE [dbo].[spAddHospitalRequests]

	-- Add the parameters for the stored procedure here
		(
		@hospitalId int,
		@shiftdate int,
		@shift1 int,
		@shift2 int, 
		@shift3 int,
		@shift4 int,
		@totalnursesreq int, 
		@Shift1NA int,
		@Shift2NA int,
		@Shift3NA int,
		@Shift4NA int,
		@totalallocatedNurses int,
		@Id int output 
		
	)
	AS
BEGIN
	SET NOCOUNT ON;

	   
	INSERT INTO [dbo].[hospital_Requests] (
           [h_id]
           ,[h_shiftDate]
           ,[h_s1]
           ,[h_s2]
           ,[h_s3]
           ,[h_s4]
           ,[h_reqNursesInTotal]
           ,[h_s1NA]
           ,[h_s2NA]
           ,[h_s3NA]
           ,[h_s4NA]
           ,[h_allocatedNurseInTotal])
     VALUES
	 (@hospitalId ,
		@shiftdate ,
		@shift1 ,
		@shift2 , 
		@shift3 ,
		@shift4 ,
		@totalnursesreq , 
		@Shift1NA ,
		@Shift2NA ,
		@Shift3NA ,
		@Shift4NA ,
		@totalallocatedNurses)
	  SET @Id=SCOPE_IDENTITY()
      RETURN  @Id
end
GO
/****** Object:  StoredProcedure [dbo].[spAddintoAgencyReg]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sukesh>
-- Create date: <12/06/2021>
-- Description:	<Create a record in Nurse Registration table>
-- =============================================
CREATE PROCEDURE [dbo].[spAddintoAgencyReg]

	-- Add the parameters for the stored procedure here
		(
		@regno nvarchar(50),
		@Name nvarchar(50),
		@address nvarchar(50),
		@securityquestion nvarchar(50), 
		@securityanswer nvarchar(50),
		@userid nvarchar(50),
		@password nvarchar(50),
		@conpassword nvarchar(50),
		@createdby nvarchar(50),
		@created datetime,
		@Id int output 
		
	)
	AS
BEGIN
	SET NOCOUNT ON;

	   
	INSERT INTO [dbo].[a_registration] (
			[a_regno]
           ,[a_regname]
           ,[a_address]
           ,[a_sec_question]
           ,[a_sec_answer]
           ,[a_userid]
           ,[a_password]
           ,[a_con_pwd]
           ,[a_createdby]
           ,[a_created])
     VALUES
	 (@regno,@Name ,
		@address ,
		@securityquestion , 
		@securityanswer ,
		@userid ,
		@password,
		@conpassword ,
		@createdby,
		@created)
	  SET @Id=SCOPE_IDENTITY()
      RETURN  @Id
end
GO
/****** Object:  StoredProcedure [dbo].[spAddintoNurseReg]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Sukesh>
-- Create date: <12/06/2021>
-- Description:	<Create a record in Nurse Registration table>
-- =============================================
CREATE PROCEDURE [dbo].[spAddintoNurseReg]

	-- Add the parameters for the stored procedure here
		(
		@firstName nvarchar(50),
		@middleName nvarchar(50),
		@lastName nvarchar(50),
		@dob datetime, 
		@qualifications nvarchar(50),
		@designations nvarchar(50),
		@praticeofyears int, 
		@phone int,
		@email nvarchar(50),
		@userid nvarchar(50),
		@password nvarchar(50),
		@conpassword nvarchar(50),
		@secquestion nvarchar(50),
		@secanswer nvarchar(50),
		@created datetime,
		@createdby nvarchar(50)
		, @Id int output
	)
	AS
BEGIN
	SET NOCOUNT ON;

	   
	INSERT INTO [dbo].[nur_registration] (
			[nur_firstName]
			 ,[nur_lastName]
           ,[nur_middleName]
           ,[nur_dob]
           ,[nur_qualifications]
           ,[nur_designations]
           ,[nur_practiceYears]
           ,[nur_phone]
           ,[nur_email]
           ,[nur_userId]
           ,[nur_pwd]
           ,[nur_conPwd]
           ,[nur_secQuestion]
           ,[nur_secAnswer],[created],[createdby])
     VALUES
           (@firstName,
		    @lastName,
		   @middleName,
		   @dob,
		   @qualifications,
		   @designations,
		   @praticeofyears,
		   @phone,
		   @email,
		   @userid,
		   @password,
		   @conpassword,
		   @secquestion,
		   @secanswer,@created,@createdby)
		    SET @Id=SCOPE_IDENTITY()
      RETURN  @Id


end

GO
/****** Object:  StoredProcedure [dbo].[spAddNursePreferences]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Sukesh>
-- Create date: <12/06/2021>
-- Description:	<Create a record in Hosiptal Requests table>
-- =============================================
CREATE PROCEDURE [dbo].[spAddNursePreferences]

	-- Add the parameters for the stored procedure here
		(
		@nurseid int,
		@nurselocation varchar(50),
		@nurseshiftdate datetime,
		@nurseshift1 int,
		@nurseshift2 int, 
		@nurseshift3 int,
		@nurseshift4 int,
		@nurseIsAllocated nvarchar(1),
		@Id int output 
		
	)
	AS
BEGIN
	SET NOCOUNT ON;

	   
	INSERT INTO [dbo].[nur_preferences]
           ([nu_Id]
           ,[nu_location]
           ,[nu_shiftDate]
           ,[nu_s1]
           ,[nu_s2]
           ,[nu_s3]
           ,[nu_s4]
           ,[nu_isAllocated])
     VALUES
	 (@nurseid,
		@nurselocation,
		@nurseshiftdate,
		@nurseshift1,
		@nurseshift2 , 
		@nurseshift3 ,
		@nurseshift4,
		@nurseIsAllocated)
	  SET @Id=SCOPE_IDENTITY()
      RETURN  @Id
end

GO
/****** Object:  StoredProcedure [dbo].[spAddShiftAllocations]    Script Date: 6/15/2021 6:01:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Sukesh>
-- Create date: <12/06/2021>
-- Description:	<Create a record in Hosiptal Requests table>
-- =============================================
CREATE PROCEDURE [dbo].[spAddShiftAllocations]

	-- Add the parameters for the stored procedure here
		(
		@nurseid int,
		@hospitalid int,
		@shiftdate datetime,
		@shift1allocated varchar(1),
		@shift2allocated varchar(1), 
		@shift3allocated varchar(1),
		@shift4allocated varchar(1),
		@created datetime,
		@createdby nvarchar(50),
		@Id int output
		
	)
	AS
BEGIN
	SET NOCOUNT ON;

	   
	INSERT INTO [dbo].[shift_allocations]
           ([nur_id]
           ,[hos_id]
           ,[date]
           ,[alloc_s1]
           ,[alloc_s2]
           ,[alloc_s3]
           ,[alloc_s4]
           ,[created]
           ,[createdby])
     VALUES
	 (@nurseid ,
		@hospitalid ,
		@shiftdate ,
		@shift1allocated ,
		@shift2allocated , 
		@shift3allocated ,
		@shift4allocated ,
		@created,
		@createdby)
	  SET @Id=SCOPE_IDENTITY()
      RETURN  @Id
end
GO
USE [master]
GO
ALTER DATABASE [nurse_scheduling_system] SET  READ_WRITE 
GO
