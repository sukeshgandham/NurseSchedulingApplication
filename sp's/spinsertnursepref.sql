USE [nurse_scheduling_system]
GO

/****** Object:  StoredProcedure [dbo].[InsertNursePreferences]    Script Date: 6/15/2021 9:24:15 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [dbo].[InsertNursePreferences]
 (
   @nursepref NVARCHAR(max)
   )
AS
BEGIN

declare @jsonvalues NVARCHAR(max);

set @jsonvalues = CONCAT('{"data":',@nursepref,'}');

INSERT INTO dbo.nur_preferences(
  [nu_Id]
, [nu_location]
, [nu_shiftDate]
, [nu_s1], [nu_s2], [nu_s3],[nu_s4], [nu_isAllocated])

   SELECT nu_Id,nu_location,nu_shiftDate,nu_s1,nu_s2,nu_s3,nu_s4,nu_isAllocated
   FROM OPENJSON(@nursepref, '$.data')
   WITH(
      nu_Id int 
    , nu_location NVARCHAR(50) 
    , nu_shiftDate   Datetime    
    , nu_s1        NVARCHAR(10)   
	, nu_s2        NVARCHAR(10)    
	, nu_s3        NVARCHAR(10)    
	, nu_s4        NVARCHAR(10)     
	, nu_isAllocated NVARCHAR(10)   
    ) AS jsonvalues
 
END
GO


