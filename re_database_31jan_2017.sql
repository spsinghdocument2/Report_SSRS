USE [master]
GO
/****** Object:  Database [Reserves]    Script Date: 1/31/2017 12:04:27 AM ******/
CREATE DATABASE [Reserves]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Reserves_dat', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Reserves.mdf' , SIZE = 440000KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Reserves_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Reserves_log.ldf' , SIZE = 184384KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [Reserves] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Reserves].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Reserves] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Reserves] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Reserves] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Reserves] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Reserves] SET ARITHABORT OFF 
GO
ALTER DATABASE [Reserves] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Reserves] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Reserves] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Reserves] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Reserves] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Reserves] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Reserves] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Reserves] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Reserves] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Reserves] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Reserves] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Reserves] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Reserves] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Reserves] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Reserves] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Reserves] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Reserves] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Reserves] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Reserves] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Reserves] SET  MULTI_USER 
GO
ALTER DATABASE [Reserves] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [Reserves] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Reserves] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Reserves] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Reserves', N'ON'
GO
USE [Reserves]
GO
/****** Object:  User [searc7064]    Script Date: 1/31/2017 12:04:27 AM ******/
CREATE USER [searc7064] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [onlineUser]    Script Date: 1/31/2017 12:04:27 AM ******/
CREATE USER [onlineUser] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_owner]
GO
/****** Object:  User [mafAppsOnline]    Script Date: 1/31/2017 12:04:27 AM ******/
CREATE USER [mafAppsOnline] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[db_owner]
GO
ALTER ROLE [db_owner] ADD MEMBER [searc7064]
GO
ALTER ROLE [db_owner] ADD MEMBER [onlineUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [mafAppsOnline]
GO
/****** Object:  StoredProcedure [dbo].[adduser]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[adduser] 
	@username varchar(40),
     	@password varchar(40),
    	@emailid varchar(50),
     	@accountno varchar(8),
    	@name  varchar(50),
	@phone varchar(12)
AS
BEGIN
	SET NOCOUNT ON;
	insert into tblUsers(UserName,Password,EmailId,AccountNo,BitReset,Name,Telephone,int_Usertype)
	values(@username, @password,@emailid, @accountno,1, @name ,@phone,1)	
END
GO
/****** Object:  StoredProcedure [dbo].[adminlogin]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[adminlogin] 
	-- Add the parameters for the stored procedure here
	@username  varchar(50),
    @password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select userId,UserName,Password,EmailId,AccountNo,BitReset,Name,Telephone,int_UserType
from tblUsers where tblUsers.username=@username and tblusers.password=@password 

END



GO
/****** Object:  StoredProcedure [dbo].[deleteuser]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[deleteuser]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tblusers where UserId=@userId
END

GO
/****** Object:  StoredProcedure [dbo].[example]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[example]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from tblDealers
END

GO
/****** Object:  StoredProcedure [dbo].[getaccountclass]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getaccountclass]
	-- Add the parameters for the stored procedure here
	@acctno varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select acctclass from tblaccounts where dealeracctno=@acctno and (acctclass >=30and acctclass<=39)
END

GO
/****** Object:  StoredProcedure [dbo].[getaccountno]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getaccountno]
	-- Add the parameters for the stored procedure here
	@dealerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT acctno,name from tblDealers where DealerId=@dealerId
END


GO
/****** Object:  StoredProcedure [dbo].[getAccounts]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[getAccounts] 
	-- Add the parameters for the stored procedure here
	@AccountNo varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     tblAccounts.AcctNo, tblAccounts.AcctStatusFlag, 
		tblConsumers.LastName + ', ' + SUBSTRING(tblConsumers.FirstName, 1, 1) AS Consumer, 
		tblAccounts.AcctMidStream, tblAccounts.AcctType, tblAccounts.AcctTerm, 
		tblAccounts.AcctRegPayAmt, tblAccounts.AcctOrgPurAmt, 
		tblAccounts.AcctLoanAmount, tblAccounts.AcctAnticern1, tblAccounts.AcctAntica1, 
		tblAccounts.AcctLossDate, tblAccounts.AcctCurrentBal, 
		tblAccounts.AcctAccern1, tblAccounts.AcctReserve2, tblAccounts.AcctOtherBal, 
		tblAccounts.AcctLCBal, tblAccounts.AcctIntBal, 
		tblAccounts.AcctDaysPastDue,
		tblAccounts.AcctClass,

		CASE WHEN AcctStatusFlag = '' THEN '-' ELSE AcctStatusFlag END AS vCode,

		CASE WHEN  AcctMidStream = 'N'
		Then 
		   Case when AcctType = 'P' then
			 AcctTerm * CONVERT(float ,AcctRegPayAmt )
		   else
			 case when AcctType = 'I' then
					AcctLoanAmount
				end
		   end
		else 
			case when AcctMidStream = 'Y' then
			 CONVERT(float,AcctOrgPurAmt)
			else
			'0'
			end
		end as vOrgGross,

		CASE WHEN  AcctMidStream = 'N'
		Then 
			Case when AcctType = 'P' then
			  Convert(float,AcctLoanAmount) - (Convert(float,AcctAnticern1) + Convert(float,AcctAntica1))
			else case when AcctType = 'I' then
				Convert(float,AcctLoanAmount)
			end
			end 
		else case when AcctMidStream = 'Y' then
			Case when AcctType = 'P' then
			 
				Convert(float,AcctOrgPurAmt) - (Convert(float,AcctAnticern1) + Convert(float,AcctAntica1))
			else case when AcctType = 'I' then
				Convert(float,AcctOrgPurAmt)
			end
			end 
		else
			'0'
		end
		end as vOrgPrin ,

		CASE WHEN AcctLossDate > 0 THEN '0' ELSE convert(float,AcctCurrentBal) END AS vOutGross,

		CASE WHEN AcctLossDate > 0
			THEN convert(CHAR(10),AcctLossDate,101) 
		ELSE  
			''
		END AS vLossDate,

		/*

		CASE WHEN vOutGross - (AcctAnticern1 - AcctAccern1) < 0
		THEN '0'
		ELSE  
		 vOutGross - (AcctAnticern1 - AcctAccern1)
		END AS vRemPrin,

		*/

		CASE WHEN AcctLossDate > 0 
		THEN 
			CASE WHEN  AcctCurrentBal > 0
				Then 
					convert(float, AcctCurrentBal) + convert(float ,AcctAntica1) +
						(CASE WHEN (AcctOtherBal + AcctLCBal + AcctIntBal > 0)
						Then 
							convert(float, AcctOtherBal) + convert(float, AcctLCBal) + convert(float ,AcctIntBal)
						else
							0
						end)
				else
					'0'
				end
		ELSE
			'0'
		END as vLossGross ,

		CASE WHEN AcctLossDate > 0 
		THEN
			CASE WHEN  AcctCurrentBal > 0
				Then 
					convert(float,AcctCurrentBal) +
						(CASE WHEN (AcctOtherBal + AcctLCBal + AcctIntBal > 0)
						Then 
							convert(float, AcctOtherBal) + convert(float, AcctLCBal) + convert(float ,AcctIntBal)
						else
							0
						end)
				else
					'0'
				end
		ELSE
			'0'
		END as vLossPrin,


		CASE WHEN (AcctLossDate IS NULL) AND (AcctOtherBal + AcctLCBal + AcctIntBal > 0)
		Then 
			convert(float, AcctOtherBal) + convert(float, AcctLCBal) + convert(float ,AcctIntBal)
		else
			'0'
		end as vCharge,

		CASE WHEN AcctStatusFlag LIKE '%B%'  
		Then 
			 AcctDaysPastDue - 999999
		else case when AcctDaysPastDue > 30 then
			Case when AcctLossDate <> Null then
			case when isdate(AcctLossDate)= 1  then
			case when day(AcctLossDate) > 0 then
				AcctDaysPastDue-AcctDaysPastDue
			end
			else
				AcctDaysPastDue
			end
			else
				AcctDaysPastDue
			end
		else
			AcctDaysPastDue
		end
		end as dues,


		CASE WHEN   AcctStatusFlag LIKE '%B%' 
		Then 99999
			 
		ELSE

		case WHEN isdate(AcctLossDate) = 1 THEN 0 ELSE 
			case WHEN substring(AcctStatusFlag,1,1) = 'B' THEN 3 ELSE
				case WHEN (CASE WHEN AcctLossDate > 0 THEN 0 ELSE convert(float,AcctCurrentBal) END) = 0 and 
		(CASE WHEN   AcctStatusFlag LIKE '%B%' 
		Then 
			 AcctDaysPastDue - 999999
		else case when AcctDaysPastDue > 30 then
			Case when AcctLossDate <> Null then
			case when isdate(AcctLossDate)= 1  then
			case when day(AcctLossDate) > 0 then
				AcctDaysPastDue-AcctDaysPastDue
			end
			else
				AcctDaysPastDue
			end
			else
				AcctDaysPastDue
			end
		else
			AcctDaysPastDue
		end
		end) = 0 THEN 2 ELSE 1 END END END END as PrimarySort,
		case when AcctStatusFlag LIKE '%B%' THEN 'BKRT' ELSE '' END as NewAcctStatusFlag, tblAccounts.VehYear, tblAccounts.VehModel + '/' + tblAccounts.VehType AS Make,
		CASE WHEN   AcctStatusFlag LIKE '%D%' THEN AcctReserve2 Else 0 end as NewBuyBacks
		-- end here
		FROM  tblAccounts LEFT OUTER JOIN
		tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID LEFT OUTER JOIN
		tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
			WHERE     (tblDealers.AcctNo = @AccountNo) AND
						   (tblAccounts.AcctClass <> '70') AND (tblAccounts.AcctClass <> '71')
			ORDER BY PrimarySort,AcctLossDate,dues DESC,CAST(tblAccounts.AcctNo AS Decimal)
END


GO
/****** Object:  StoredProcedure [dbo].[getAdjustment]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[getAdjustment]
	@AcctNo as varchar(15),
    
    @MasterType as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TranType as  varchar(2) = 'A';
SELECT 	SUM(reservesRegular.RegInc) as SumAdjInc, SUM(reservesRegular.RegDec) as SumAdjDec
	FROM   	tblDealers LEFT OUTER JOIN reservesRegular ON tblDealers.AcctNo = reservesRegular.DlrAcctNo
	WHERE  (tblDealers.AcctNo = @AcctNo) AND (reservesRegular.TranType LIKE @TranType + '%') AND (tblDealers.MasterType = @MasterType)

   
END




GO
/****** Object:  StoredProcedure [dbo].[getCompanyDetails]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCompanyDetails]
	-- Add the parameters for the stored procedure here
	@DealerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @DealerId > 0 
    -- Insert statements for procedure here
	select tblDealers.Name, DealerId from tblDealers where DealerId = @DealerId
else
	select tblDealers.Name, DealerId from tblDealers
END



GO
/****** Object:  StoredProcedure [dbo].[getCompanyName]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getCompanyName]
	-- Add the parameters for the stored procedure here
	@DealerId int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @DealerId > 0 
    -- Insert statements for procedure here
	select tblDealers.Name, DealerId from tblDealers where DealerId = @DealerId
else
	select tblDealers.Name, DealerId from tblDealers 

END


GO
/****** Object:  StoredProcedure [dbo].[getdealer]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getdealer]
	-- Add the parameters for the stored procedure here
	@acctno varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	tblDealers.AcctNo, tblDealers.Name, tblDealers.City, tblDealers.[State], tblDealers.Zip, tblDealers.MasterType, tblDealers.Email
	FROM    tblDealers
	WHERE	(tblDealers.AcctNo = @acctno)
END

GO
/****** Object:  StoredProcedure [dbo].[getdealeraccountno]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getdealeraccountno]
	-- Add the parameters for the stored procedure here
	@dealerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT acctno from tblDealers where DealerId=@dealerId
END

GO
/****** Object:  StoredProcedure [dbo].[getDealerPackage]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[getDealerPackage]
	-- Add the parameters for the stored procedure here	
    @dealerno varchar(15),
	@dealno varchar(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @dealno >= '03' BEGIN
		
		select substring(acctno,PATINDEX('%.%',acctno) +1  ,2) as packageno ,acctno 
		from tblDealers 
		where acctno like @dealerno+'%' and mastertype <> 'N' and  acctno <> '1765.29' and acctno <> '1765.30' and
			substring(acctno,PATINDEX('%.%',acctno) + 1  ,2) >= '03'
		order by packageno asc

	END ELSE BEGIN

		select substring(acctno,PATINDEX('%.%',acctno) +1  ,2) as packageno ,acctno 
		from tblDealers 
		where acctno like @dealerno+'%' and mastertype <> 'N' and  acctno <> '1765.29' and acctno <> '1765.30' and
			substring(acctno,PATINDEX('%.%',acctno) + 1  ,2) < '03'
		order by packageno asc

	END
END


GO
/****** Object:  StoredProcedure [dbo].[getDemoaccountclass]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDemoaccountclass]
	-- Add the parameters for the stored procedure here
	@acctno varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select acctclass from tblDemoaccounts where dealeracctno=@acctno and (acctclass >=30 and acctclass<=39)
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoaccountno]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getDemoaccountno]
	-- Add the parameters for the stored procedure here
	@dealerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT acctno,name from tblDemoDealers where DealerId=@dealerId
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoAccounts]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[getDemoAccounts] 
	-- Add the parameters for the stored procedure here
	@AccountNo varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     tblDemoAccounts.AcctNo, tblDemoAccounts.AcctStatusFlag, 
 tblDemoConsumers.LastName + ', ' + SUBSTRING(tblDemoConsumers.FirstName, 1, 1) AS Consumer, 
tblDemoAccounts.AcctMidStream, tblDemoAccounts.AcctType, tblDemoAccounts.AcctTerm, 
tblDemoAccounts.AcctRegPayAmt, tblDemoAccounts.AcctOrgPurAmt, 
tblDemoAccounts.AcctLoanAmount, tblDemoAccounts.AcctAnticern1, tblDemoAccounts.AcctAntica1, 
tblDemoAccounts.AcctLossDate, tblDemoAccounts.AcctCurrentBal, 
tblDemoAccounts.AcctAccern1, tblDemoAccounts.AcctReserve2, tblDemoAccounts.AcctOtherBal, 
tblDemoAccounts.AcctLCBal, tblDemoAccounts.AcctIntBal, 
tblDemoAccounts.AcctDaysPastDue,


CASE WHEN AcctStatusFlag = ''
THEN '-'
ELSE  
 AcctStatusFlag
END AS vCode,

CASE WHEN  AcctMidStream = 'N'
Then 
   Case when AcctType = 'P' then
	 AcctTerm * CONVERT(float ,AcctRegPayAmt )
   else
     case when AcctType = 'I' then
			AcctLoanAmount
		end
   end
else 
	case when AcctMidStream = 'Y' then
     CONVERT(float,AcctOrgPurAmt)
	else
    '0'
	end
end as vOrgGross,


CASE WHEN  AcctMidStream = 'N'
Then 
	Case when AcctType = 'P' then
	  Convert(float,AcctLoanAmount) - (Convert(float,AcctAnticern1) + Convert(float,AcctAntica1))
	else case when AcctType = 'I' then
		Convert(float,AcctLoanAmount)
	end
	end 
else case when AcctMidStream = 'Y' then
	Case when AcctType = 'P' then
	 
		Convert(float,AcctOrgPurAmt) - (Convert(float,AcctAnticern1) + Convert(float,AcctAntica1))
	else case when AcctType = 'I' then
		Convert(float,AcctOrgPurAmt)
	end
	end 
else
	'0'
end
end as vOrgPrin ,



CASE WHEN AcctLossDate > 0
THEN '0'
ELSE  
 convert(float,AcctCurrentBal)
END AS vOutGross,

CASE WHEN AcctLossDate > 0
	THEN convert(CHAR(10),AcctLossDate,101) 
	-- THEN AcctLossDate
ELSE  
	''
END AS vLossDate,

/*

CASE WHEN vOutGross - (AcctAnticern1 - AcctAccern1) < 0
THEN '0'
ELSE  
 vOutGross - (AcctAnticern1 - AcctAccern1)
END AS vRemPrin,

*/

CASE WHEN AcctLossDate > 0 
THEN 
	CASE WHEN  AcctCurrentBal > 0
		Then 
			convert(float, AcctCurrentBal) + convert(float ,AcctAntica1)
		else
			'0'
		end
ELSE
	'0'
END as vLossGross ,

CASE WHEN AcctLossDate > 0 
THEN
	CASE WHEN  AcctCurrentBal > 0
		Then 
			convert(float,AcctCurrentBal)

		else
			'0'
		end
ELSE
	'0'
END as vLossPrin,


CASE WHEN AcctOtherBal > 0 or AcctLCBal > 0 or AcctIntBal > 0
Then 
	convert(float, AcctOtherBal) + convert(float, AcctLCBal) + convert(float ,AcctIntBal)

else
	'0'
end as vCharge,
--MOdified - sorting based on Dues days -  sjk March03/07

CASE WHEN   AcctStatusFlag LIKE '%B%'
Then 
	 AcctDaysPastDue - 999999
else case when AcctDaysPastDue > 30 then
	Case when AcctLossDate <> Null then
	case when isdate(AcctLossDate)= 1  then
	case when day(AcctLossDate) > 0 then
		AcctDaysPastDue-AcctDaysPastDue
	end
	else
		AcctDaysPastDue
	end
	else
		AcctDaysPastDue
	end
else
	AcctDaysPastDue
end
end as dues,

CASE WHEN   AcctStatusFlag LIKE '%B%' 
Then 99999
	 
ELSE

case WHEN isdate(AcctLossDate) = 1 THEN 0 ELSE 
	case WHEN AcctStatusFlag LIKE '%B%' THEN 3 ELSE
		case WHEN (CASE WHEN AcctLossDate > 0 THEN 0 ELSE convert(float,AcctCurrentBal) END) = 0 and 
(CASE WHEN   AcctStatusFlag LIKE '%B%' 
Then 
	 AcctDaysPastDue - 999999
else case when AcctDaysPastDue > 30 then
	Case when AcctLossDate <> Null then
	case when isdate(AcctLossDate)= 1  then
	case when day(AcctLossDate) > 0 then
		AcctDaysPastDue-AcctDaysPastDue
	end
	else
		AcctDaysPastDue
	end
	else
		AcctDaysPastDue
	end
else
	AcctDaysPastDue
end
end) = 0 THEN 2 ELSE 1 END END END END as PrimarySort,

case when AcctStatusFlag LIKE '%B%' THEN 'BKRT' ELSE '' END as NewAcctStatusFlag, tblDemoAccounts.VehYear, tblDemoAccounts.VehModel + '/' + tblDemoAccounts.VehType AS Make
-- end here

FROM  tblDemoAccounts LEFT OUTER JOIN
tblDemoConsumers ON tblDemoAccounts.ApplicantID = tblDemoConsumers.ConsumerID LEFT OUTER JOIN
tblDemoDealers ON tblDemoAccounts.DealerID = tblDemoDealers.DealerID
	WHERE     (tblDemoDealers.AcctNo = @AccountNo) AND
                   (tblDemoAccounts.AcctClass <> '70') AND (tblDemoAccounts.AcctClass <> '71')
	ORDER BY PrimarySort,AcctLossDate,dues DESC,CAST(tblDemoAccounts.AcctNo AS Decimal)
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoAdjustment]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getDemoAdjustment]
	@AcctNo as varchar(15),
    @TranType as  varchar(2) = 'A',
    @MasterType as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT 	SUM(reservesDemoRegular.RegInc) as SumAdjInc, SUM(reservesDemoRegular.RegDec) as SumAdjDec
	FROM   	tblDemoDealers LEFT OUTER JOIN reservesDemoRegular ON tblDemoDealers.AcctNo = reservesDemoRegular.DlrAcctNo
	WHERE  (tblDemoDealers.AcctNo = @AcctNo) AND (reservesDemoRegular.TranType LIKE @TranType + '%') AND (tblDemoDealers.MasterType = @MasterType)

   
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoCompanyDetails]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getDemoCompanyDetails]
	-- Add the parameters for the stored procedure here
	@DealerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @DealerId > 0 
    -- Insert statements for procedure here
	select tblDemoDealers.Name, DealerId from tblDemoDealers where DealerId = @DealerId
else
	select tblDemoDealers.Name, DealerId from tblDemoDealers
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoCompanyName]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getDemoCompanyName]
	-- Add the parameters for the stored procedure here
	@DealerId int =0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if @DealerId > 0 
    -- Insert statements for procedure here
	select tblDemoDealers.Name, DealerId from tblDemoDealers where DealerId = @DealerId
else
	select tblDemoDealers.Name, DealerId from tblDemoDealers 

END
GO
/****** Object:  StoredProcedure [dbo].[getDemodealer]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getDemodealer]
	-- Add the parameters for the stored procedure here
	@acctno varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	tblDemoDealers.AcctNo, tblDemoDealers.Name, tblDemoDealers.City, tblDemoDealers.State, 
			tblDemoDealers.Zip, tblDemoDealers.MasterType,tblDemoDealers.Email
	FROM    tblDemoDealers
	WHERE	(tblDemoDealers.AcctNo = @acctno)
END
GO
/****** Object:  StoredProcedure [dbo].[getDemodealeraccountno]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[getDemodealeraccountno]
	-- Add the parameters for the stored procedure here
	@dealerId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT acctno from tblDemoDealers where DealerId=@dealerId
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoDealerPackage]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[getDemoDealerPackage]
	-- Add the parameters for the stored procedure here
	
    @dealerno varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	 select substring(acctno,PATINDEX('%.%',acctno) +1  ,2) as packageno ,acctno from tblDemoDealers where acctno like '%'+@dealerno+'%' and mastertype <> 'N'  order by packageno asc
END
GO
/****** Object:  StoredProcedure [dbo].[getDemoPayouts]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getDemoPayouts]
   @AcctNo as varchar(15),
   @TranType as  varchar(2) = 'P-',
   @MasterType as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
SELECT	SUM(reservesDemoRegular.RegDec) as SumPayout
	FROM   	tblDemoDealers LEFT OUTER JOIN reservesDemoRegular ON tblDemoDealers.AcctNo = reservesDemoRegular.DlrAcctNo
	WHERE  	(tblDemoDealers.AcctNo =  @AcctNo) AND (reservesDemoRegular.TranType LIKE @TranType + '%') AND (tblDemoDealers.MasterType =  @MasterType)
    -- Insert statements for procedure here
	
END
GO
/****** Object:  StoredProcedure [dbo].[getHistoryLog]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getHistoryLog]
	@date1 DateTime
AS
BEGIN
	SET NOCOUNT ON;
	SELECT     *
	FROM         tblHistoryLog
	WHERE     (LogInTime >= CONVERT(VARCHAR, @date1, 101)) AND 
			(LogInTime <= CONVERT(VARCHAR, @date1 +1 , 101))
	ORDER BY LogID DESC
END
GO
/****** Object:  StoredProcedure [dbo].[getPayouts]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[getPayouts]
   @AcctNo as varchar(15),
   
   @MasterType as varchar(1)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @TranType as  varchar(2) = 'P-';
SELECT	SUM(reservesRegular.RegDec) as SumPayout
	FROM   	tblDealers LEFT OUTER JOIN reservesRegular ON tblDealers.AcctNo = reservesRegular.DlrAcctNo
	WHERE  	(tblDealers.AcctNo =  @AcctNo) AND (reservesRegular.TranType LIKE @TranType + '%')AND (tblDealers.MasterType =  @MasterType)
    -- Insert statements for procedure here
	
END



GO
/****** Object:  StoredProcedure [dbo].[getuserdetails]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getuserdetails]
	-- Add the parameters for the stored procedure here
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--select distinct(tblDealers.mastertype) ,tblUsers.int_usertype,tblUsers.BitReset from tblUsers,tblDealers where tblUsers.AccountNo=tblDealers.AcctNo and tblUsers.AccountNo=@acctNo
select distinct(tblDealers.mastertype) ,tblUsers.int_usertype,tblUsers.BitReset,tblDealers.acctno  from tblUsers,tblDealers where tblUsers.AccountNo=tblDealers.AcctNo and tblUsers.UserId=@UserId
END






GO
/****** Object:  StoredProcedure [dbo].[getuseremail]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[getuseremail]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT UserName,EmailId from tblusers
END



GO
/****** Object:  StoredProcedure [dbo].[listDealers]    Script Date: 1/31/2017 12:04:27 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[listDealers] 
	@accountno varchar(4)
AS
BEGIN
	SET NOCOUNT ON;
	IF LEN(@accountno) > 0 
		SELECT UserId, tblDealers.Name AS DlrName, tblUsers.Name, UserName, Password, EmailId, tblUsers.AccountNo,Telephone, 
			CASE WHEN Disabled = 1 THEN 'Disabled' ELSE 'Enabled' END AS Login
		FROM tblDealers, tblUsers 
		WHERE (tblDealers.AcctNo = tblUsers.AccountNo) and (tblUsers.AccountNo like @accountno + '%' ) 
	ELSE
		SELECT UserId, tblDealers.Name AS DlrName, tblUsers.Name, UserName, Password, EmailId, tblUsers.AccountNo,Telephone,
			CASE WHEN Disabled = 1 THEN 'Disabled' ELSE 'Enabled' END AS Login
		FROM tblDealers, tblUsers 
		WHERE (tblDealers.AcctNo = tblUsers.AccountNo)
END



GO
/****** Object:  StoredProcedure [dbo].[Oadduser]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Oadduser] 
	@username varchar(40),
     	@password varchar(40),
    	@emailid varchar(50),
     	@accountno varchar(8),
    	@name  varchar(50),
	@phone varchar(12)
AS
BEGIN
	SET NOCOUNT ON;
	insert into tblUsers(UserName,Password,EmailId,AccountNo,BitReset,Name,Telephone,int_Usertype)
	values(@username, @password,@emailid, @accountno,1, @name ,@phone,1)	
END

GO
/****** Object:  StoredProcedure [dbo].[OsearchDealer]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OsearchDealer]
	@dealerNo varchar(8),
	@dealername varchar(100)
AS
	DECLARE @searchString varchar(2000)
	DECLARE @sExec varchar(2000)
	
	set @searchString=''
begin
    if len(rtrim(ltrim(@dealerNo)))>0
	begin
        select @dealerNo= rtrim(ltrim(@dealerNo));
        select @searchString=dbo.appenedString(@searchString) + 'AcctNo like ''' + @dealerNo + '%''' 
	end
 
	if  len(rtrim(ltrim(@dealername)))>0
	begin
		select @dealername= '%'+@dealername+'%';
        select @searchString=@searchString+dbo.appenedString(@searchString) +  'name like''' + @dealername +''''
	end

	SET @sExec='select Name,Name2,AddrLn1,AddrLn2,City,State,Email,AcctNo from tblDealers' + @searchString 

	exec (@sExec)
end

GO
/****** Object:  StoredProcedure [dbo].[resetpassword]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[resetpassword]
	-- Add the parameters for the stored procedure here
	@oldpassword varchar(50),
    @newpassword varchar(50),
     @userid int
    
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update tblusers set password=@newpassword,bitreset=0 where password=@oldpassword and UserId=@userid
END






GO
/****** Object:  StoredProcedure [dbo].[searchDealer]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec searchDealer '9999',''
CREATE PROCEDURE [dbo].[searchDealer]
@dealerNo varchar(10),
@dealerName varchar(max)
	AS	
begin
	select Name,Name2,AddrLn1,AddrLn2,City,State,Email,AcctNo from tblDealers where AcctNo like '%'+@dealerNo+'%' and Name like '%'+@dealerName+'%'
end


GO
/****** Object:  StoredProcedure [dbo].[selectDealaerByAcountNo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[selectDealaerByAcountNo] 
	-- Add the parameters for the stored procedure here
@accountNo varchar(30)	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Name,Name2,AddrLn1,AddrLn2,City,State,Email,AcctNo from tblDealers where AcctNo=rtrim(ltrim(@accountNo))
END





GO
/****** Object:  StoredProcedure [dbo].[selectuser]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectuser] 
	-- Add the parameters for the stored procedure here
	@accountno varchar(50) 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT tblusers.Name,tblDealers.Name2 as dealername, EmailId,Telephone,UserId from tblusers,tblDealers where tblusers.accountno=tblDealers.AcctNo and accountno=@accountno and int_Usertype=2
END





GO
/****** Object:  StoredProcedure [dbo].[selectUserById]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[selectUserById]
	-- Add the parameters for the stored procedure here
	@userId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT Name, EmailId, Telephone, username, password, AccountNo, BitReset, Disabled 
		from tblusers 
		where UserId=@userId
END





GO
/****** Object:  StoredProcedure [dbo].[sp_ACHAutoPay_Insert]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu Team	
-- Description:	Insert ACH AutoPay
-- =============================================


CREATE PROCEDURE [dbo].[sp_ACHAutoPay_Insert]
	@Confirmation VARCHAR(15),	
	@AcctNo VARCHAR(10),	
	@TranPayment MONEY,
	@TranFee MONEY,
	@BankABA VARCHAR(9),	
	@BankAcctNo VARCHAR(17),	
	@BankName VARCHAR(50),	
	@BankHolder VARCHAR(50),
	@BankAcctType VARCHAR(1),
	@UpdatedPhone VARCHAR(12),
	@UpdatedPhoneDate DATETIME	,
	
     @SaveAccountFuture  bit,
	@BankAccountName varchar(50),
	@ScheduleMethod varchar(30),
	@Email varchar(50),
	@Filter varchar(30),
	@paymentFrequency varchar(100),
	@Message varchar(100) out

AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE 	@val int;	DECLARE @ScheduleID int;declare @counter int;declare @count int; declare @addate datetime;set @count=1 ;
	 DECLARE @TotalAmount money, 	@AccountID varchar(10);
	set @addate=getdate();
	set @TotalAmount=@TranPayment +@TranFee;
	if(@Filter = 'SaveAchAutoPay')
	begin
		insert into tblSchedulePaymentSetup 
		(AcctNo, ConfirmationNumber, TranAmount, TranFee, BankABA, BankAcctNo, BankName, BankHolder, 
		BankAcctType, PaymentFrequency, IsFuturePay, IsAutoPay, CreatedDate,
		CreatedBy, IsVerified, IsActive ) 
		values (@AcctNo, @Confirmation, @TranPayment, @TranFee, @BankABA, @BankAcctNo, @BankName, @BankAccountName,
		@BankAcctType, @paymentFrequency, 0, 1, getdate(), 
		@BankHolder, 1, 1)
		--select top 1 @ScheduleID =ScheduleId from tblschedulepayment where AcctNo=@AcctNo Order by ScheduleId Desc
		SET @ScheduleID = SCOPE_IDENTITY();

		--select @addate = AcctNextDueDate  from tblAccounts where AcctNo =  @AcctNo
		
		select 
		@addate = convert(datetime,(select AutoPayDueDate from GetAutpayDetails(@AcctNo))),
		@val = RemainingTerm, 
		@counter=case AcctFreq
		WHEN 'W' THEN  7 
		WHEN 'M' THEN  30
		WHEN 'Y' THEN  365
		WHEN 'B' THEN  14
		WHEN 'D' THEN  1
		end from Reserves.dbo.tblAccounts where AcctNo = @AcctNo;
		--select @val = RemainingTerm  from tblAccounts where AcctNo =  @AcctNo
	  
		while @count <= @val
		begin
			INSERT INTO tblSchedulePaymentDetails (ScheduleID, ScheduledDate, [Status], IsActive)
			VALUES (@ScheduleID ,@addate,'Pending', 1);

			set @count = @count + 1; set @addate= DATEADD(day,@counter,@addate)
		end
		    
		if(@SaveAccountFuture = 1)
		begin
			If NOT exists( Select 1 from tblSavedACH where BankAcctNo = @BankAcctNo and AcctNo = @AcctNo and PrimaryNumber = @UpdatedPhone  and BankABA = @BankABA and Email = @Email and IsActive = 1)		
			begin
				INSERT INTO tblSavedACH (AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,CreatedBy,Email,PrimaryNumber,CreatedDate,IsActive)
				VALUES (@AcctNo, @BankABA, @BankAcctNo, @BankName, @BankAccountName, @BankAcctType,@BankHolder,@Email,@UpdatedPhone,getdate(),'1')
			end
		end
	
		 select top 1 @AccountID=AccountId from tblaccounts where AcctNo=@AcctNo;
		  Insert into Collection.dbo.tblactionlog (ActionLogAccountId,ActionLogType,ActionLogSubType,ActionLogDate,ActionLogUsername,ActionLogEntry) 
			values (@AccountID,'SCH','WEB',getdate(),@BankHolder,convert(text,'ACH for $'+convert(varchar(10),@TotalAmount) +' Conf#: '+@Confirmation));
		
	end	
	
	

END


GO
/****** Object:  StoredProcedure [dbo].[sp_AutoPayDuplicatePaymentAlert]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec [sp_AutoPayDuplicatePaymentAlert]  '311676'
CREATE PROCEDURE [dbo].[sp_AutoPayDuplicatePaymentAlert]
@AcctNo VARCHAR(10)
AS	
begin
	select * from GetAutpayDetails(@AcctNo);
end

GO
/****** Object:  StoredProcedure [dbo].[sp_CheckDuplicatePayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CheckDuplicatePayment]
@AcctNo VARCHAR(10)
AS	
BEGIN
declare @days int,@LastPaymentDate datetime,
@AcctNextDueDate datetime ,@OneTime varchar(10),
@Scheduled varchar(10),
@TotalScheduledAmount money,
@TotalAmount money,
@AcctPastDueAmt money,
@DuplicatePayment varchar(10),
@TotalOneTimeAmount money;

SET @TotalScheduledAmount =0;
SET @TotalAmount =0;
SET @AcctPastDueAmt =0;
SET @TotalOneTimeAmount =0;

select @AcctPastDueAmt= AcctPastDueAmt from  [dbo].[tblAccounts] where AcctNo =@AcctNo
select  
   @days= case AcctFreq
	WHEN 'W' THEN  7 
	WHEN 'M' THEN  30
	WHEN 'Y' THEN  365
	WHEN 'B' THEN  14
	WHEN 'D' THEN  1
	WHEN 'S' THEN  15
	end,
	@LastPaymentDate=DATEADD(day,-@days,acctnextduedate),
	@AcctNextDueDate=acctnextduedate
	from tblaccounts 
where acctno=@AcctNo
if exists(select top 1 id from tblonlinepayments where acctno=@AcctNo and CONVERT(datetime, CONVERT(varchar, TranDate, 102))  between @LastPaymentDate and @AcctNextDueDate)
begin
    select @TotalOneTimeAmount = SUM(TranPayment) from tblonlinepayments where acctno=@AcctNo  and CONVERT(datetime, CONVERT(varchar, TranDate, 102)) between @LastPaymentDate and @AcctNextDueDate
	set @OneTime='True'
end
if exists(select top 1 p.Scheduleid as Scheduled
	from 
	tblschedulepaymentdetails d 
	inner join tblschedulepaymentsetup p 
	on d.scheduleid=p.scheduleid 
	where p.acctno=@AcctNo
	AND d.ScheduledDate between @LastPaymentDate and @AcctNextDueDate
	and p.isactive=1
	and p.IsDeleted = 0
	and p.IsVerified = 1
	AND d.IsActive = 1
	)
begin
	set @Scheduled='True'

	 select  @TotalScheduledAmount =SUM(p.TranAmount)
		from 
		tblschedulepaymentdetails d 
		inner join tblschedulepaymentsetup p 
		on d.scheduleid=p.scheduleid 
		where p.acctno=@AcctNo
		AND d.ScheduledDate between @LastPaymentDate and @AcctNextDueDate
		and p.isactive=1
		and p.IsDeleted = 0
		and p.IsVerified = 1
		AND d.IsActive = 1
end
	set @TotalAmount = @TotalScheduledAmount + @TotalOneTimeAmount
	if( @AcctPastDueAmt > @TotalAmount)
		begin
			set @OneTime=null; set @Scheduled=null;
		end
	select @OneTime as OneTime ,@Scheduled as Scheduled
END

GO
/****** Object:  StoredProcedure [dbo].[SP_CheckNSFStatus]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [dbo].[SP_CheckNSFStatus] 314788
CREATE	PROC [dbo].[SP_CheckNSFStatus]
(@AcctNo varchar(10))
	AS
		BEGIN
		    DECLARE @NSFCount90days int, @NSFCount180days int, @NSFStatus varchar(50);

			SET @NSFCount90days = 0;
			SET @NSFCount180days = 0;
			SET @NSFStatus = NULL;

			IF OBJECT_ID ('tempdb..#tblpmthistory') IS NOT NULL
				DROP TABLE #tblpmthistory;

			SELECT a.TranCOde atc, b.TranCode btc, a.RefNo arn, b.RefNo as RefNo, a.AcctNo, a.SeqNo
			INTO #tblpmthistory
			FROM
			(select * 
			from collection.dbo.tblpmthistory 
			where AcctNo = @AcctNo 
			AND TranCode IN ('PA', 'PY') ) a
			LEFT OUTER JOIN
			(select * 
			from collection.dbo.tblpmthistory 
			where AcctNo = @AcctNo 
			AND TranCode = 'RV' AND RefNo = 'NSF') b
			ON a.SeqNo = b.RevSeq AND b.SeqNo = a.RevBy
			order by a.SeqNo desc

			select @NSFCount90days=count(AcctNo) from (SELECT TOP 3 * FROM #tblpmthistory) a where 
					RefNo='NSF' 

			select @NSFCount180days=count(AcctNo) from (SELECT TOP 6 * FROM #tblpmthistory) a where 
					RefNo='NSF' 

			DECLARE @lastNSFDate datetime;
			select top 1 @lastNSFDate = CONVERT(datetime, CONVERT(varchar, DATEADD(DAY, 90, TranDate), 102)) 
			from collection.dbo.tblpmthistory 
			where AcctNo=@Acctno 
			AND TranCode = 'RV' AND RefNo = 'NSF'
			order by seqno desc

			if(@NSFCount180days=6)
				begin
					set @NSFStatus='Blocked';
				end

			else if(@NSFCount90days=3 and CONVERT(datetime, CONVERT(varchar, GETDATE(), 102)) <= @lastNSFDate)
				begin
					set @NSFStatus='Blocked';
				end

			select @NSFStatus as NSFStatus;
		END

GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteAutoPayRecurring]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeleteAutoPayRecurring]
@AcctNo VARCHAR(10),
@Message varchar(100) out
AS	
BEGIN

If exists( Select 1 from tblschedulepaymentsetup where AcctNo = @AcctNo and IsAutoPay = 1 AND IsActive = 1 AND IsDeleted = 0)
 begin
   update tblschedulepaymentdetails set status='Cancelled' , IsActive = 0 where scheduleid= (select top 1 scheduleid from tblschedulepaymentsetup where AcctNo = @AcctNo and IsAutoPay = 1 AND IsActive = 1 AND IsDeleted = 0)
   update tblschedulepaymentsetup set IsDeleted = 1 where AcctNo = @AcctNo and IsAutoPay = 1 AND IsActive = 1 AND IsDeleted = 0  

   set @Message = 'Record Delete Successfully'
 end
 else
      begin
            set @Message = 'Record Delete Failed'
     end

	END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeletePayByTextSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_DeletePayByTextSetup]
@AcctNo VARCHAR(10)
AS	
BEGIN

If exists( Select 1 from tblPayByTextSetup where AcctNo = @AcctNo AND IsActive = 1 AND IsDeleted = 0)
 begin
   UPDATE tblPayByTextSetup set IsDeleted = 1 where AcctNo = @AcctNo  AND IsActive = 1 AND IsDeleted = 0
 end
END
GO
/****** Object:  StoredProcedure [dbo].[sp_DeleteSavedAchDetail]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 08/27/2016
-- Description:	To delete saved ach details based on account number and bank account number
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeleteSavedAchDetail]
@AcctNo VARCHAR(10),		
	@ID VARCHAR(17)
AS
BEGIN
	
	SET NOCOUNT ON;
	update tblSavedACH set IsActive = '0' WHERE ID = @ID AND AcctNo = @AcctNo 
	 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_Get2ndAdvSummary]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Durango
-- Create date: 01/04/2014
-- Description:	Get 2nd Advance Summary
-- =============================================
CREATE PROCEDURE [dbo].[sp_Get2ndAdvSummary]
	@DlrAcctNo VARCHAR(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT  SUM(CASE WHEN reservesTitle.TranNote = 'BUYBACK RESERVE' THEN 0 ELSE reservesTitle.TitleHold END) AS SumTitleHold,
			SUM(CASE WHEN reservesTitle.TranNote = 'BUYBACK RESERVE' THEN reservesTitle.TitleHold ELSE 0 END) AS SumBBackHold,
			SUM(reservesTitle.TitleRelease) AS SumTitleRelease
	FROM        tblDealers LEFT OUTER JOIN tblAccounts ON tblDealers.DealerID = tblAccounts.DealerID
				  RIGHT OUTER JOIN reservesTitle ON tblAccounts.AcctNo = reservesTitle.AcctNo
	WHERE    (CAST(tblDealers.AcctNo As Float) = @DlrAcctNo)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetAchDetail]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[SP_GetAchDetail]
@AcctNo VARCHAR(10)
AS	
BEGIN
declare @ACHDetailDate datetime, @PaymentDate datetime;

SET  @ACHDetailDate = null;
SET @PaymentDate = null;

select @ACHDetailDate =max(setp.createddate) 
from tblschedulepaymentsetup setp 
left outer join tblsavedach ach 
on setp.bankacctno=ach.bankacctno 
WHERE ach.AcctNo = @AcctNo and ach.IsActive = 1 

select @PaymentDate =max(pmt.trandate) 
from tblonlinepayments pmt 
left outer join 
tblsavedach ach 
on pmt.bankacctno=ach.bankacctno 
WHERE ach.AcctNo = @AcctNo and ach.IsActive = 1 

if(@ACHDetailDate is not null and  @ACHDetailDate>@PaymentDate )
begin
	SELECT * 
	FROM (
		select a.ID, a.AcctNo,  a.BankABA, a.BankAcctNo, a.BankName, a.BankHolder, 
		a.BankAcctType,a.CreatedBy,a.Email,a.PrimaryNumber,a.IsActive, pmtid 
		from (
			select ach.ID, ach.AcctNo,  ach.BankABA, ach.BankAcctNo, ach.BankName, 
			ach.BankHolder, ach.BankAcctType,ach.CreatedBy,ach.Email,
			ach.PrimaryNumber,ach.IsActive ,pmt.ScheduleId as pmtid,
			row_number() over( partition by ach.id order by pmt.ScheduleId  desc) as rownumber 
			from tblsavedach ach 
			left outer join tblschedulepaymentsetup pmt 
			on ach.bankacctno=pmt.BankAcctNo 
			where ach.Acctno=@AcctNo and ach.isactive=1 
			) a 
		where rownumber=1) b 
	ORDER BY pmtid asc
end

else if(@PaymentDate is not null and  @ACHDetailDate<@PaymentDate )
begin
	SELECT * 
	FROM (
		select a.ID, a.AcctNo,  a.BankABA, a.BankAcctNo, a.BankName, a.BankHolder, 
		a.BankAcctType,a.CreatedBy,a.Email,a.PrimaryNumber,a.IsActive, onlinepmtid 
		from (
			select ach.ID, ach.AcctNo,  ach.BankABA, ach.BankAcctNo, ach.BankName, ach.BankHolder, 
			ach.BankAcctType,ach.CreatedBy,ach.Email,ach.PrimaryNumber,ach.IsActive ,pmt.id as onlinepmtid,
			row_number() over( partition by ach.id order by pmt.id  desc) as rownumber 
			from tblsavedach ach 
			left outer join tblonlinepayments pmt 
			on ach.bankacctno=pmt.BankAcctNo 
			where ach.Acctno=@AcctNo and ach.isactive=1 
			) a 
		where rownumber=1) b 
	ORDER BY onlinepmtid asc
end

else
begin
	select ID, AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, 
	BankAcctType,CreatedBy,Email,PrimaryNumber,IsActive 
	from tblsavedach 
	where acctno=@Acctno AND IsActive = 1
end

END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAdjsAndPos]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Durango
-- Create date: 06/17/2011
-- Description:	Gets Adj. and P.Outs
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAdjsAndPos]
	@DlrAcctNo VARCHAR(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT reservesRegular.*,
		CASE WHEN TranType = 'A+' THEN RegInc ELSE 0 END AS AdjInc,
		CASE WHEN TranType = 'A-' THEN RegDec ELSE 0 END AS AdjDec,
		CASE WHEN TranType = 'P+' THEN RegInc ELSE 0 END AS PayInc,
		CASE WHEN TranType = 'P-' THEN RegDec ELSE 0 END AS PayDec
	FROM   reservesRegular LEFT OUTER JOIN tblDealers ON reservesRegular.DlrAcctNo = tblDealers.AcctNo
	WHERE	 (CAST(reservesRegular.DlrAcctNo As Float) = @DlrAcctNo)
	ORDER BY reservesRegular.TranDate, reservesRegular.DlrAcctNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAlerts]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/22/2016
-- Description:	To get the alert notifications
-- sp_GetAlerts '311676'
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAlerts]
	@accountNumber varchar(10)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @Alerts TABLE(
	Head varchar(50),
	[Description] varchar(200),
	[Action] varchar(50),
	[ActionHeader] varchar(50)
	)
	DECLARE @DaysPastDue int;
	DECLARE @CellNumber varchar(15);
	DECLARE @TextNumber varchar(15);
	DECLARE @TextNumber2 varchar(15);
	DECLARE @SecurityID2 varchar(15);
	DECLARE @SecurityID3 varchar(15);

	DECLARE @Address1 varchar(15);
	--DECLARE @Address2 varchar(15);
	DECLARE @City varchar(15);
	DECLARE @State varchar(15);
	DECLARE @Zip varchar(15);

	SELECT @DaysPastDue = AcctDaysPastDue FROM tblAccounts WHERE AcctNo = @accountNumber
	select @Address1= Address1 , --@Address2=Address2 , 
	@City=City , @State=State , @Zip=Zip from dbo.GetAddress(@accountNumber)

	select top 1   
	@CellNumber =  (select top 1 InfoLogEntry 
	  from collection.dbo.tblinfolog as tbi 
	  where tbi.InfoLogType = 'TEL' 
	  and tbi.infologsubtype='CEL' 
	  and tbi.infologaccountid=a.accountid
	  ORDER BY InfoLogDate DESC) , 

 @TextNumber= (select top 1 InfoLogEntry 
  from collection.dbo.tblinfolog as tbi 
  where tbi.InfoLogType = 'TEL' 
  and tbi.infologsubtype='TXT1' 
  and tbi.infologaccountid=a.accountid
  ORDER BY InfoLogDate DESC) ,
@TextNumber2 = (select top 1 InfoLogEntry 
  from collection.dbo.tblinfolog as tbi 
  where tbi.InfoLogType = 'TEL' 
  and tbi.infologsubtype='TXT2' 
  and tbi.infologaccountid=a.accountid
  ORDER BY InfoLogDate DESC) , 
  @SecurityID2 = isnull(u.SecurityID2,0) , @SecurityID3 = isnull(SecurityID3,0)  
   from tblonlineusers u 
   inner join tblaccounts a on u.acctno=a.acctno 
 
	where a.AcctNo= @accountNumber;


	IF(@DaysPastDue > 0)
	BEGIN
		INSERT INTO @Alerts
		VALUES(
		CAST(@DaysPastDue as VARCHAR)+' Days Past Due',
		'You have '+CAST(@DaysPastDue as VARCHAR)+' days past due for last payment. ',
		'MAFPayment',
		'Click here to do payment'
		);
	END

	        IF NOT EXISTS(SELECT * FROM tblInsuranceInformation WHERE AccountNumber = @accountNumber)
	BEGIN
		INSERT INTO @Alerts
		VALUES(
		'Update Insurance Information',
		'You have not updated insurance information. Please update it in ',
		'InsuranceInformation',
		'Insurance Information Section'
		);
	END
	     	IF(@CellNumber = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated CellNumber. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END
	        IF(@TextNumber = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated Primary Text Number. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END
	        IF(@TextNumber2 = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated Secondary Text Number. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END	       
    	    IF(@Zip = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated zip. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END
		    IF(@Address1 = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated Address1. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END
	--	    IF(@Address2 = '')
	--BEGIN
	--        INSERT INTO @Alerts
	--	VALUES(
	--	'Update User Profile',
	--	'You have not updated Address2. Please update it in User Profile Section.'
	--	);
	--END
		    IF(@City = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated City. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END
		    IF(@State = '')
	BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update User Profile',
		'You have not updated State. Please update it in ',
		'UserProfile',
		'User Profile Section'
		);
	END
	    	IF(@SecurityID2 = '')
	    BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update Security Question',
		'You have not updated Security Question 2. Please update it in ',
		'UpdateSecurityQuestion',
		'Update Security Question Section'
		);
	END
	    	IF(@SecurityID3 = '')
	    BEGIN
	        INSERT INTO @Alerts
		VALUES(
		'Update Security Question',
		'You have not updated Security Question 3. Please update it in ',
		'UpdateSecurityQuestion',
		'Update Security Question Section'
		);
	END

	SELECT * FROM @Alerts;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetAutoPayRecurring]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetAutoPayRecurring]
@AcctNo VARCHAR(10)
AS	
BEGIN

	SELECT top 1 tspd.ScheduledDate, CAST(tsp.ScheduleId as VARCHAR) as ScheduleId,tsp.SubscriptionId as TokenId,
	tsp.BankAcctType as ScheduleMethod,tsp.IsFuturePay as IsSchedule,tsp.IsAutoPay as IsReccuring,
	tsp.CreatedDate,tsp.IsActive,
	tsp.ConfirmationNumber as ConfirmationID,tsp.AcctNo,tsp.CreatedDate as TranDate, tsp.TranAmount as TranPayment,
	tsp.TranFee, tsp.BankABA,tsp.BankAcctNo,tsp.BankName,
	tsp.BankHolder,tsp.BankAcctType,tspd.Status,
	tsp.BankHolder as BankAccountName,tsp.paymentFrequency
	FROM tblSchedulePaymentDetails tspd INNER JOIN tblschedulepaymentsetup tsp
	ON tspd.ScheduleId = tsp.ScheduleId where tsp.AcctNo = @AcctNo And IsAutoPay = 1  
	and tsp.IsFuturePay <> 1 and tsp.IsActive=1  AND  tspd.IsActive=1 
	AND IsVerified = 1
	AND IsDeleted = 0
	Order by ScheduledDate Asc

END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetAutoPaySetupPaymentMethod]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Chetu
-- Create date: 10/06/2016
-- Description:	Procedure to get autopay setup details
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetAutoPaySetupPaymentMethod]
@accountNumber varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
		CASE BankAcctType
		WHEN 'P' THEN 'ACH'
		WHEN 'S' THEN 'ACH'
		WHEN 'V' THEN 'Card'
		WHEN 'M' THEN 'Card'
		ELSE 'None'
		END
		AS PaymentMethod
	FROM tblSchedulePaymentSetup
	WHERE 
	AcctNo = @accountNumber
	AND IsActive = 1 
	AND IsVerified = 0
	AND IsAutoPay = 1 
	AND IsFuturePay = 0
	AND IsDeleted = 0
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetCardInfo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetCardInfo]
(@accountNo varchar(20))
as
begin
select top 1 u.FullName, a.AcctCurrentBal as AccountNumber from tblonlineusers u inner join tblAccounts a on u.acctno =a.AcctNo
 where a.AcctNo= @accountNo
 end
GO
/****** Object:  StoredProcedure [dbo].[SP_GetFuturePayAccountInfo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_GetFuturePayAccountInfo]
(@AcctNo varchar(10))
as
	begin
		select a.AcctPastDueAmt as Amount , format(a.AcctNextDueDate,'MM/dd/yyyy') as DueDate,AcctDaysPastDue,isnull(t.MinimumAmount,50) as MinimumAmount,isnull(t.MaximumAmount,2500) as MaximumAmount,
		format(DATEADD(day,case a.AcctFreq
        WHEN 'W' THEN  7 
	    WHEN 'M' THEN  30
	    WHEN 'Y' THEN  365
	    WHEN 'B' THEN  14
	    WHEN 'D' THEN  1 end,a.AcctNextDueDate),'MM/dd/yyyy') as NextDueDate ,a.UpdatedPhone as CellNumber ,u.FullName as Name
		 from tblaccounts a
		 inner join tblonlineusers u on a.acctno=u.acctno
		 left outer join tblTransactionAmountLimit t on a.acctfreq=t.acctfreq
		  where a.acctno=@AcctNo
	end


	
GO
/****** Object:  StoredProcedure [dbo].[sp_GetInsuranceInformation]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--================================================
-- Author: Chetu
-- Create date: 09/05/2016
-- Description: Procedure to get insurance information based on account number
-- [dbo].[sp_GetInsuranceInformation] 999998
--================================================
CREATE PROCEDURE [dbo].[sp_GetInsuranceInformation]
	@AcctNo VARCHAR(10)
AS
BEGIN   
   SELECT AcctNo, InsPolicyNo, InsEffDate, InsExpDate, VehVin, VehYear, VehModel, VehType,
   company.Name as InsuranceCompanyName,
   company.[Address] as  InsuranceCompanyAddress,
   company.City as InsuranceCompanyCity,
   company.[State] as InsuranceCompanyState,
   company.Zip as InsuranceCompanyZip,
   InsuranceAgencyName,
   InsuranceAgencyAddress,
   InsuranceAgencyCity,
   InsuranceAgencyState,
   InsuranceAgencyZip,
   InsuredName,
   InsuredAddress,
   InsuredCity,
   InsuredState,
   InsuredZip,
   InsuranceCardPath
   FROM tblAccounts acct LEFT JOIN (tblInsuranceInformation insuranceinfo 
   
   INNER JOIN
   tblInsuranceCompany company
   ON insuranceinfo.InsuranceCompanyID = company.ID)
   ON acct.acctno= insuranceinfo.AccountNumber
   WHERE acct.AcctNo = @AcctNo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_GetLastPaymentHistory]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetLastPaymentHistory]
	@AcctNo VARCHAR(10)
AS
BEGIN 
    SELECT ID, ConfirmationID,AcctNo,CAST( TranDate as varchar) as TranDate,CAST ( TranPayment as varchar) as TranPayment,CAST( TranFee as varchar) as TranFee,BankABA,BankAcctNo,BankName,BankHolder,BankAcctType,Status FROM tblOnlinePayments where AcctNo =@AcctNo AND  TranDate IN (SELECT max(TranDate) FROM tblOnlinePayments where AcctNo =@AcctNo) AND Status <> 'Cancel' 
    
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetLatestMessageFromPayByTextMessageLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 10/18/2016
-- Description:	Stored Procedure to get latest message from  paybytext log
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetLatestMessageFromPayByTextMessageLog] 
	@AcctNo varchar(15),
	@TextNumber varchar(15)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT TOP 1 AcctNo, TextNumber, [Message], [Type], [Keyword]
	FROM tblPayByTextMessageLog
	WHERE CAST(LogDate as date) = CAST(GETDATE() as date)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetMafAccountDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetMafAccountDetails]
	@AcctNo VARCHAR(10)
AS
BEGIN 
 DECLARE @AccountID varchar(10),@ActionLogSubType varchar(50) ;
    select top 1 @AccountID=AccountId from tblaccounts where AcctNo=@AcctNo;	
	
	select top 1 @ActionLogSubType 
= case RefNo
	--WHEN 'WEB' THEN  'Web Portal'
	--WHEN 'PHN' THEN  'Phone'
	--WHEN 'TXT' THEN  'Text'
	WHEN 'CASH' THEN  'Cash payment'
	WHEN 'MO' THEN  'Money order'
	WHEN 'MG' THEN  'MoneyGram '
	WHEN 'WU' THEN  'Western union'
	WHEN 'WEB' THEN  'Web Portal'
	WHEN 'ACH' THEN  'ACH'
	WHEN 'DEBIT ' THEN  'Debit Card'
	WHEN 'CARD' THEN  'Debit/CC'
	WHEN 'TELCK' THEN  'Phone'
	WHEN 'ARCH' THEN  'Mail-in checks'
	WHEN 'AUTO' THEN  'AutoPAY'
	WHEN 'AUTOWEB' THEN  'AutoPay'
	WHEN 'TELCK' THEN  'Phone'
	end
 from [collection].[dbo].[tblPmtHistory] where AcctNo = @AcctNo ORDER BY PaymentId desc

IF EXISTS (SELECT 1 FROM tblOnlinePayments where AcctNo =@AcctNo AND Status in ('Completed','Pending')  )
begin
select acct.AcctFreq, CAST ( acct.AcctCurrentBal as varchar) as AcctCurrentBal,CAST ( acct.AcctDaysPastDue as varchar) as AcctDaysPastDue,CAST ( acct.AcctPastDueAmt as varchar) as AcctPastDueAmt,
 onlp.ConfirmationID,acct.AcctNo, onlp.TranDate ,CAST ( onlp.TranPayment as varchar) as TranPayment,CAST(onlp.TranFee as varchar) as TranFee,onlp.BankABA,onlp.BankAcctNo,onlp.BankName,onluser.FullName as BankHolder,onlp.BankAcctType,onlp.Status,
 acct.AcctNextDueDate,@ActionLogSubType as ActionLogSubType , onluser.ProfilePicture
 from tblAccounts acct LEFT JOIN  tblOnlinePayments onlp
 
  on acct.AcctNo = onlp.AcctNo INNER JOIN tblOnlineUsers onluser on onluser.AcctNo = acct.AcctNo
where acct.AcctNo =@AcctNo AND  TranDate IN  (SELECT max(TranDate) FROM tblOnlinePayments where AcctNo =@AcctNo  AND Status in ('Completed','Pending')) -- AND Status in ('Completed','Pending') 
end
else
begin

select acct. AcctFreq ,onuser.AcctNo,onuser.FullName as BankHolder ,CAST ( acct.AcctCurrentBal as varchar)as AcctCurrentBal  ,CAST ( acct.AcctDaysPastDue as varchar)as AcctDaysPastDue,CAST ( acct.AcctPastDueAmt as varchar)as AcctPastDueAmt, onuser.ProfilePicture  from tblAccounts acct LEFT JOIN tblOnlineUsers onuser on acct.AcctNo = onuser.AcctNo  where acct.AcctNo =@AcctNo
end
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetPayByTextMessageLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu 
-- Create date: 10/18/2016
-- Description:	Procedure to get pay by text message logfor an account for current date
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPayByTextMessageLog]
@AcctNo varchar(10),
@TextNumber varchar(12)

AS
BEGIN
	SET NOCOUNT ON;

	SELECT AcctNo, TextNumber, [Message], [Type], [Keyword], LogDate as [Date]
	FROM tblPayByTextMessageLog 
	WHERE AcctNo = @AcctNo 
	AND TextNumber = @TextNumber 
	AND CAST(LogDate as date) = CAST(GETDATE() as date)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetPayByTextSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/28/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetPayByTextSetup]
	@AcctNo VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT top 1 ID as PayByTextId, SubscriptionId,
	ConfirmationNumber, AcctNo, TextNumber, 
	BankABA, BankAcctNo, BankName,
	BankHolder, BankAcctType
	FROM tblPayByTextSetup  
	where AcctNo = @AcctNo   
	AND IsActive=1 
	AND IsDeleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetPaymentHistory]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetPaymentHistory]
	@AcctNo VARCHAR(10)
AS
BEGIN 
      Select ID, ConfirmationID,AcctNo,CAST( TranDate as varchar) as TranDate,CAST ( TranPayment as varchar) as TranPayment,CAST( TranFee as varchar) as TranFee,
       BankABA,BankAcctNo,BankName,BankHolder,BankAcctType,Status From tblOnlinePayments Where AcctNo = @AcctNo  Order by ID Desc
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetPayOnlineAccountDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ==================================================
-- Author:		Chetu
-- Create date: 08/03/2016
-- Description:	Get account details
-- [dbo].[sp_GetPayOnlineAccountDetails] 311676
-- ==================================================
CREATE PROCEDURE [dbo].[sp_GetPayOnlineAccountDetails]
	@AcctNo VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Get state of account holder
	Declare @state varchar(5), @TranFee money, @TranPayment money, @BankAcctType nvarchar(5);
	select @state = [State] from dbo.GetAddress(@AcctNo)

	select TOP 1 @TranFee = TranFee,  
	@TranPayment= TranPayment,
	@BankAcctType = BankAcctType
	FROM tblOnlinePayments 
	where 
	AcctNo = @AcctNo
	AND Status <> 'Cancel'
	ORDER By TranDate desc

	--Select account details
	Select 
	CAST(@TranFee as VARCHAR) as TranFee,
	CAST(@TranPayment as VARCHAR) as TranPayment,
	@BankAcctType as BankAcctType,
	tblAccounts.AcctPayOff,
	tblAccounts.RemainingTerm, 
	tblAccounts.AcctNextDueDate, 
	tblAccounts.AcctNo, 
	tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
	tblAccounts.AcctCurrentBal, 
	tblAccounts.AcctRegPayAmt, 
	tblAccounts.AcctPastDueAmt, 
	tblAccounts.AcctDaysPastDue, 
	VehYear, 
	VehModel, 
	VehType, 
	@state as [State],
	SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
	tblAccounts.UpdatedPhone, 
	tblAccounts.UpdatedPhoneDate ,
	isnull(t.MinimumAmount,50) as MinimumAmount,
	isnull(t.MaximumAmount,2500) as MaximumAmount
	From tblAccounts 
	LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
	LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
	left outer join tblTransactionAmountLimit t on tblAccounts.acctfreq=t.acctfreq
	Where tblAccounts.AcctNo = @AcctNo
END









GO
/****** Object:  StoredProcedure [dbo].[sp_GetPayOnlineVerify]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ==================================================
-- Author:		David Durango
-- Create date: 09/03/2009
-- Description:	Verifies the existency of an account
-- ==================================================
CREATE PROCEDURE [dbo].[sp_GetPayOnlineVerify]
       @AcctNo VARCHAR(10),
       @LastName VARCHAR(30)
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

    -- Select statements for procedure here
       IF @LastName = '' BEGIN    
	   --Get state of account holder
	Declare @state varchar(5);
	select @state = [State] from dbo.GetAddress(@AcctNo)

	--Select account details
	Select 
	(select TOP 1 CAST( TranFee as varchar)  
	FROM tblOnlinePayments 
	where 
	AcctNo = @AcctNo
	AND Status <> 'Cancel'
	ORDER By TranDate desc) as TranFee,
	(select TOP 1 CAST ( TranPayment as varchar)  
	FROM tblOnlinePayments 
	where AcctNo = @AcctNo
	AND Status <> 'Cancel'
	ORDER By TranDate desc) as TranPayment,
	(select TOP 1 BankAcctType
	FROM tblOnlinePayments 
	where AcctNo = @AcctNo 
	AND Status <> 'Cancel'
	ORDER By TranDate desc) as BankAcctType,
	tblAccounts.AcctPayOff,
	tblAccounts.RemainingTerm, 
	tblAccounts.AcctNextDueDate, 
	tblAccounts.AcctNo, 
	tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
	tblAccounts.AcctCurrentBal, 
	tblAccounts.AcctRegPayAmt, 
	tblAccounts.AcctPastDueAmt, 
	VehYear, 
	VehModel, 
	VehType, 
	@state as [State],
	SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
	tblAccounts.UpdatedPhone, 
	tblAccounts.UpdatedPhoneDate  
	From tblAccounts 
	LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
	LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
	Where tblAccounts.AcctNo = @AcctNo
              --Select tblAccounts.AcctNo, tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
              --       tblAccounts.AcctCurrentBal, tblAccounts.AcctRegPayAmt, tblAccounts.AcctPastDueAmt, 
              --       VehYear, VehModel, VehType, tblConsumers.State,
              --       SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
              --       tblAccounts.UpdatedPhone, tblAccounts.UpdatedPhoneDate  
              --From tblAccounts LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
              --       LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
              --Where tblAccounts.AcctNo = @AcctNo
       END ELSE BEGIN
              Select tblAccounts.AcctNo, tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
                     tblAccounts.AcctCurrentBal, tblAccounts.AcctRegPayAmt, tblAccounts.AcctPastDueAmt, 
                     VehYear, VehModel, VehType, tblConsumers.State,
                     SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
                     tblAccounts.UpdatedPhone, tblAccounts.UpdatedPhoneDate
              From tblAccounts LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
                     LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
              Where tblAccounts.AcctNo = @AcctNo and tblConsumers.LastName = @LastName
       END
END










GO
/****** Object:  StoredProcedure [dbo].[sp_GetScheduledTransactionsForAchPayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/09/2016
-- Description:	Prcedure to get scheduled transactions for Ach
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetScheduledTransactionsForAchPayment]
AS
BEGIN
	SET NOCOUNT ON;

	IF OBJECT_ID ('tempdb..#ACHpayments') IS NOT NULL
	DROP TABLE #ACHpayments;

	SELECT sp.ScheduleId, spd.ID as ID, sp.ConfirmationNumber as ConfirmationID, sp.AcctNo, GETDATE() as TranDate, 
	CASE WHEN sp.IsAutoPay = 1 AND sp.IsFuturePay = 0
	THEN acct.AcctPastDueAmt
	ELSE sp.TranAmount
	END as TranPayment,
	CASE WHEN sp.IsAutoPay = 1 THEN 'AutoPay'
		WHEN sp.IsFuturePay = 1 THEN 'FuturePay'
		ELSE null END as PaymentType, 
	TranFee, BankABA, 
	BankAcctNo, BankName, BankHolder,
	BankAcctType, 'Pending' as [Status]
	INTO #ACHpayments
	FROM tblSchedulePaymentSetup sp
	INNER JOIN tblAccounts acct
	ON acct.AcctNo = sp.AcctNo
	INNER JOIN tblSchedulePaymentDetails spd
	ON sp.ScheduleId = spd.ScheduleID
	AND (sp.IsFuturePay = 1 OR (sp.IsAutoPay = 1 AND sp.IsVerified = 1)) AND sp.IsActive = 1
	AND sp.IsDeleted = 0
	WHERE spd.IsActive = 1 
	--AND CAST(spd.ScheduledDate as date) = CAST(GETDATE() as date)
	AND DATEDIFF(DAY, GETDATE(), spd.ScheduledDate) = 0
	AND BankAcctType IN ('S', 'P')
	
	select * from #ACHpayments;	
END


GO
/****** Object:  StoredProcedure [dbo].[sp_GetScheduledTransactionsForCardPayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/09/2016
-- Description:	Prcedure to get scheduled transactions for Card
-- =============================================
--exec [sp_GetScheduledTransactionsForCardPayment]

CREATE PROCEDURE [dbo].[sp_GetScheduledTransactionsForCardPayment]
AS
BEGIN
	SET NOCOUNT ON;

	IF OBJECT_ID ('tempdb..#cardpayments') IS NOT NULL
	DROP TABLE #cardpayments;
  
	WITH cteAddress as 
	(
		SELECT * FROM
		(
			SELECT CardSubscriptionId, ConfirmationId, AcctNo, CreatedDate, FirstName,LastName,Address as Street,City,State,Zip as PostelCode,PrimaryNumber,EmailID as Email,
			ROW_NUMBER() OVER (PARTITION BY CardSubscriptionId ORDER BY CreatedDate desc) as rowNumber
			FROM tblbillingaddress
		) sub WHERE sub.rowNumber = 1 
	)
	SELECT badd.FirstName,badd.LastName,badd.Street,badd.City,badd.State,badd.PostelCode,badd.PrimaryNumber,badd.Email,
		convert(varchar(max), spd.ID) as ScheduleID, sp.ConfirmationNumber as ConfirmationID, sp.AcctNo as AccountNumber, GETDATE() as TranDate, sp.SubscriptionId,
		CASE WHEN sp.IsAutoPay = 1 AND sp.IsFuturePay = 0
		THEN convert(varchar(max),acct.AcctPastDueAmt)
		ELSE convert(varchar(max),sp.TranAmount)
		END as Amount, 
		CASE WHEN sp.IsAutoPay = 1 THEN 'AutoPay'
		WHEN sp.IsFuturePay = 1 THEN 'FuturePay'
		ELSE null END as PaymentType,
		 convert(varchar(max),TranFee) as Fee, 
		BankAcctNo as CardNumber,  BankHolder as CardName,
		BankAcctType as CardType, 'Pending' as [Status],sp.subscriptionid as TokenId
		,(select top 1 cd.CardExpiry from tblcardsubscriptioninfo as cd where cd.SubscriptionId=sp.subscriptionid) as CardExpiry
		INTO #cardpayments
		FROM tblSchedulePaymentSetup sp
		INNER JOIN tblAccounts acct
		ON acct.AcctNo = sp.AcctNo
		INNER JOIN tblSchedulePaymentDetails spd
		ON sp.ScheduleId = spd.ScheduleID
		AND (sp.IsFuturePay = 1 OR (sp.IsAutoPay = 1 AND sp.IsVerified = 1)) AND sp.IsActive = 1
		AND sp.IsDeleted = 0
		INNER JOIN cteAddress badd ON badd.CardSubscriptionId = sp.SubscriptionId AND badd.AcctNo = sp.AcctNo
		WHERE spd.IsActive = 1 
		--AND CAST(spd.ScheduledDate as date) = CAST(GETDATE() as date)
		AND DATEDIFF(DAY, GETDATE(), spd.ScheduledDate) = 0
		AND BankAcctType IN ('V', 'M')
	
	select * from #cardpayments
	
END

GO
/****** Object:  StoredProcedure [dbo].[SP_GetUserProfile]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- [dbo].[SP_GetUserProfile] '154250'
CREATE proc [dbo].[SP_GetUserProfile]
(@accountNo varchar(20))
as
begin
declare @Address1 varchar(100) , @Address2 varchar(100), @City varchar(50), @State varchar(50), @Zip varchar(10)
select @Address1= Address1 , @Address2=Address2 , @City=City , @State=State , @Zip=Zip from dbo.GetAddress(@accountNo)
select top 1 u.FullName , u.Email , a.AcctNo as AccountNumber ,a.VehYear as Year , a.VehType as Model, a.VehModel as Make ,  
 AcctDaysPastDue as DaysPastDue , isnull(AcctPastDueAmt,0) as PastDueAmount , isnull((p.TranPayment+p.TranFee),0) as LastPaymentAmount ,
  @Address1 as Address1, @Address2 as Address2,@City as City, @State as State, @Zip as Zip, u.ProfilePicture,
(select top 1 left(replace(convert(varchar,InfoLogEntry),'-',''),10)
  from collection.dbo.tblinfolog as tbi 
  where tbi.InfoLogType = 'TEL' 
  and tbi.infologsubtype='CEL' 
  and tbi.infologaccountid=a.accountid
  ORDER BY InfoLogDate DESC) as CellNumber, 
  (select top 1 left(replace(convert(varchar,InfoLogEntry),'-',''),10)
  from collection.dbo.tblinfolog as tbi 
  where tbi.InfoLogType = 'TEL' 
  and tbi.infologsubtype='TXT1' 
  and tbi.infologaccountid=a.accountid
  ORDER BY InfoLogDate DESC) as TextNumber,
 (select top 1 left(replace(convert(varchar,InfoLogEntry),'-',''),10)
  from collection.dbo.tblinfolog as tbi 
  where tbi.InfoLogType = 'TEL' 
  and tbi.infologsubtype='TXT2' 
  and tbi.infologaccountid=a.accountid
  ORDER BY InfoLogDate DESC) as TextNumber2, 
  a.AcctFreq as PaymentFrequency,
  isnull(u.SecurityID,0) as SecurityID,isnull(u.SecurityID2,0) as SecurityID2,isnull(SecurityID3,0) as SecurityID3 ,u.Answer , u.Answer2 , u.Answer3
   from tblonlineusers u 
   inner join tblaccounts a on u.acctno=a.acctno 
   left outer join tblonlinepayments p on u.acctno =p.AcctNo
	where a.AcctNo= @accountNo;
end
GO
/****** Object:  StoredProcedure [dbo].[sp_GetUserValues]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<DD>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetUserValues]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM tblUsers
END

GO
/****** Object:  StoredProcedure [dbo].[sp_GetValidateTransaction]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetValidateTransaction]
	@AcctNo VARCHAR(10)
AS
BEGIN 

        Select Count(ID) As TotTran,CAST ( Sum(TranPayment + TranFee)as varchar) As TotAmt From tblOnlinePayments Where AcctNo = @AcctNo And CONVERT(VARCHAR(10), TranDate, 101) = CONVERT(VARCHAR(10), getDate(), 101)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertACHDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_InsertACHDetails]
(@AcctNo varchar(15),
@BankABA varchar(9),
@BankAcctNo varchar(17),
@BankName varchar(50),
@BankHolder varchar(50),
@BankAcctType varchar(1),
@Email varchar(50),
@PrimaryNumber varchar(50)
)
 as 
	begin
		insert into tblsavedach (AcctNo ,BankABA,BankAcctNo,BankName,BankHolder,BankAcctType,Email, PrimaryNumber,createddate,CreatedBy,IsActive)
		 values(@AcctNo ,@BankABA,@BankAcctNo,@BankName,@BankHolder,@BankAcctType,@Email, @PrimaryNumber,Getdate(),(select top 1 Fullname from tblonlineusers where acctno=@AcctNo),1)
	end						   

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPayByTextACHSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/27/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertPayByTextACHSetup] 
	@Confirmation VARCHAR(15),	
	@AcctNo VARCHAR(10),	
	@BankABA VARCHAR(9),	
	@BankAcctNo VARCHAR(17),	
	@BankName VARCHAR(50),	
	@BankHolder VARCHAR(50),
	@BankAcctType VARCHAR(1),
	@CreatedBy varchar(50),
	@Phone VARCHAR(12),
	@Email varchar(50),
	@TextNumber varchar(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO tblPayByTextSetup 
	(AcctNo, ConfirmationNumber, BankABA, BankAcctNo, BankName, BankHolder, TextNumber,
	BankAcctType, CreatedDate, CreatedBy, IsActive ) 
	VALUES (@AcctNo, @Confirmation, @BankABA, @BankAcctNo, @BankName, @BankHolder, @TextNumber,
	 @BankAcctType, getdate(), @CreatedBy, 1)

	If NOT exists(Select * from tblSavedACH where BankAcctNo = @BankAcctNo and AcctNo = @AcctNo and PrimaryNumber = @Phone and BankABA = @BankABA and Email = @Email AND IsActive = 1  )		
	begin
		INSERT INTO tblSavedACH (AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,CreatedBy,Email,PrimaryNumber,CreatedDate,IsActive)
		VALUES (@AcctNo, @BankABA, @BankAcctNo, @BankName, @BankHolder, @BankAcctType, @CreatedBy,@Email,@Phone,getdate(),'1')
	end
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPayByTextCardSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/27/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertPayByTextCardSetup]
@ConfirmationId varchar(15),
@Acctno varchar(10),
@TokenId varchar(30),
@CardName varchar(50),
@CardType varchar(50),
@CardNumber varchar(30),
@CardExpiry varchar(30),
@CreatedBy varchar(50),
	@TextNumber varchar(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO tblPayByTextSetup 
	(AcctNo, ConfirmationNumber, BankAcctNo, BankHolder, TextNumber,
	BankAcctType, CreatedDate, SubscriptionId,
	CreatedBy, IsActive) 
	values (@AcctNo, @ConfirmationId, @CardNumber, @CardName,@TextNumber,
	@CardType, getdate(), @TokenId,
	@CreatedBy, 1)

	if not exists (select top 1 * from tblCardSubscriptionInfo where AcctNo=@AcctNo and CardNumber=@CardNumber and CardExpiry=@CardExpiry and CardType=@CardType and isactive=1)
	begin			
		insert into tblCardSubscriptionInfo (AcctNo , SubscriptionId,CardName,CardType, CardNumber , CardExpiry , CreatedDate) values(@Acctno,@TokenId ,@CardName,@CardType, @CardNumber , @CardExpiry , getdate())
	End
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPayByTextMessageLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 10/18/2016
-- Description:	Stored Procedure to insert paybytext log
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertPayByTextMessageLog] 
	@AcctNo varchar(15),
	@TextNumber varchar(15),
	@Message varchar(200),
	@Type varchar(10),
	@Keyword varchar(10)
AS
BEGIN
	SET NOCOUNT ON;

    INSERT INTO tblPayByTextMessageLog
	VALUES(@AcctNo, @TextNumber, @Message, @Type, @Keyword, GETDATE())
END

GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUpdateInsuranceInformation]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/05/2016
-- Description:	Procedure to Insert or Update InsuranceInformation
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertUpdateInsuranceInformation] 
	@AcctNo VARCHAR(10), 
	@InsPolicyNo VARCHAR(25), 
	@InsEffDate datetime, 
	@InsExpDate datetime, 	
   @InsuranceCompanyName VARCHAR(100),
   @InsuranceCompanyAddress VARCHAR(150),
   @InsuranceCompanyCity VARCHAR(50),
   @InsuranceCompanyState VARCHAR(50),
   @InsuranceCompanyZip VARCHAR(15),
   @InsuranceAgencyName VARCHAR(100),
   @InsuranceAgencyAddress VARCHAR(150),
   @InsuranceAgencyCity VARCHAR(50),
   @InsuranceAgencyState VARCHAR(50),
   @InsuranceAgencyZip VARCHAR(15),
   @InsuredName VARCHAR(100),
   @InsuredAddress VARCHAR(150),
   @InsuredCity VARCHAR(50),
   @InsuredState VARCHAR(50),
   @InsuredZip VARCHAR(15),
   @InsuranceCardPath VARCHAR(100),
   @Filter VARCHAR(10)
AS
BEGIN
	DECLARE @InsuranceCompanyID int;

	SET NOCOUNT ON;

	SELECT @InsuranceCompanyID = ID
	FROM tblInsuranceCompany
	WHERE 
		Name = @InsuranceCompanyName AND
		[Address] = @InsuranceCompanyAddress AND
	   City = @InsuranceCompanyCity AND
	   [State] = @InsuranceCompanyState AND
	   Zip = @InsuranceCompanyZip 


	IF(@InsuranceCompanyID IS NULL OR @InsuranceCompanyID = '')
		BEGIN
			INSERT INTO tblInsuranceCompany 
			VALUES(@InsuranceCompanyName, @InsuranceCompanyAddress, @InsuranceCompanyCity, 
			@InsuranceCompanyState, @InsuranceCompanyZip)

			SET @InsuranceCompanyID = SCOPE_IDENTITY();
		END

    IF NOT EXISTS (SELECT * FROM tblInsuranceInformation WHERE AccountNumber = @AcctNo)
	BEGIN
		
		INSERT INTO tblInsuranceInformation
		VALUES(@AcctNo, @InsuranceAgencyName, @InsuranceAgencyAddress, @InsuranceAgencyCity,
		@InsuranceAgencyState, @InsuranceAgencyZip,
		@InsuredName , @InsuredAddress,
		@InsuredCity, @InsuredState,
		@InsuredZip, @InsuranceCardPath, @InsuranceCompanyID)

		UPDATE tblAccounts 
		SET InsPolicyNo = @InsPolicyNo,
		InsEffDate = @InsEffDate, 
		InsExpDate = @InsExpDate
		WHERE AcctNo = @AcctNo
	END
	ELSE
	BEGIN
		UPDATE tblInsuranceInformation
		SET
		InsuranceAgencyName	= @InsuranceAgencyName, 
		InsuranceAgencyAddress = @InsuranceAgencyAddress, 
		InsuranceAgencyCity = @InsuranceAgencyCity,
		InsuranceAgencyState = @InsuranceAgencyState, 
		InsuranceAgencyZiP = @InsuranceAgencyZip,
		InsuredName = @InsuredName , 
		InsuredAddress = @InsuredAddress,
		InsuredCity = @InsuredCity, 
		InsuredState = @InsuredState,
		InsuredZip = @InsuredZip, 
		InsuranceCardPath = @InsuranceCardPath,
		InsuranceCompanyID = @InsuranceCompanyID
		 WHERE AccountNumber = @AcctNo

		 UPDATE tblAccounts 
		SET InsPolicyNo = @InsPolicyNo,
		InsEffDate = @InsEffDate, 
		InsExpDate = @InsExpDate
		WHERE AcctNo = @AcctNo
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SP_InsertUserActionLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_InsertUserActionLog]
(@AcctNo varchar(12),
@ConfirmationNumber varchar(20),
@ActionSubType varchar(20),
@Action varchar(300),
@IpAddress varchar(50))
	as
		Begin
			declare @PID varchar(12)=null, @CreatedBy varchar(50);
			set @CreatedBy=(select top 1 fullname from tblonlineusers where acctno=@AcctNo);
			if(@ActionSubType='AutoPay' or @ActionSubType='FuturePay')
				begin		
					if(@ConfirmationNumber is not null)
						begin
							select top 1 @PId=scheduleid from tblschedulepaymentsetup where  AcctNo = @AcctNo and ConfirmationNumber=@ConfirmationNumber order by scheduleid desc;						
						end
					else 
						begin		
							select top 1 @PId=scheduleid ,@ConfirmationNumber=ConfirmationNumber from tblschedulepaymentsetup where  AcctNo = @AcctNo and IsAutoPay = 1 AND IsDeleted = 1  order by scheduleid desc;					
						end					
				end
			if(@ActionSubType='PayByText')
				begin		
					if(@ConfirmationNumber is not null)
						begin
							select top 1 @PId=Id from tblPayByTextSetup where  AcctNo = @AcctNo and ConfirmationNumber=@ConfirmationNumber order by Id desc;						
						end
					else
						begin		
							select top 1 @PId=Id ,@ConfirmationNumber=ConfirmationNumber from tblPayByTextSetup where  AcctNo = @AcctNo AND IsDeleted = 1  order by Id desc;					
						end
				end
			Insert into tblUserActionLog(AcctNo,PId,ConfirmationNumber,ActionType,ActionSubType,Action,IpAddress,createddate,CreatedBy) values(@AcctNo,@PId,@ConfirmationNumber,'WEB',@ActionSubType,@Action,@IpAddress,getdate(),@CreatedBy)
		end

GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineABA]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		David Durango
-- Create date: 09/15/2009
-- Description:	Gets the bank name based on ABA
-- =============================================
CREATE PROCEDURE [dbo].[sp_PayOnlineABA]
	@ABA VARCHAR(9)	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Top 1 Name as BankName
	FROM Thompson.dbo.tblBanks 
	WHERE (ABAForACH = @ABA)
END


GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineChange]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Durango
-- Create date: 11/6/2010
-- Description:	Allow to change user password
-- =============================================
CREATE PROCEDURE [dbo].[sp_PayOnlineChange]
	@NewOne VARCHAR(20),
	@AcctNo VARCHAR(10),
	@BitReset VARCHAR(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE tblOnlineUsers SET Password = @NewOne, BitReset= @BitReset WHERE AcctNo = @AcctNo
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineForgot]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Durango
-- Create date: 09/14/2009
-- Description:	Finds Username and Password
-- =============================================
CREATE PROCEDURE [dbo].[sp_PayOnlineForgot]
	@AcctNo VARCHAR(10)
AS
BEGIN
	SET NOCOUNT ON;

    SELECT * 
	FROM tblOnlineUsers 
	WHERE AcctNo = @AcctNo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineLogin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[sp_PayOnlineLogin]
	@AcctNo VARCHAR(10),	
	@Username VARCHAR(50),
	@Password VARCHAR(20),
	@IPAddress VARCHAR(15)
AS
BEGIN
	SET NOCOUNT ON;

	declare @ACNStatus char(1),@IsSuccess bit=0,@IsBitReset bit=0,@FullName varchar(50),@Message varchar(200),@AccountId varchar(15),@RepoApprovedDate datetime,@RepoCancelDate datetime;

	if exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo AND Email = @Username AND [Password] = @Password)
		begin		
			select 	@AccountId= AccountId,@RepoApprovedDate=RepoApprovedDate,@RepoCancelDate=RepoCancelDate from collection.dbo.tblaccounts where acctno=@AcctNo;
			select @ACNStatus = a.AcceptedPayments From SQL1.PayAssist.dbo.tblAccounts a where acctno=@AcctNo;
			if(@ACNStatus='N' or (@RepoApprovedDate is not null and isnull(@RepoCancelDate,getdate()+1)>getdate())) --(@ACNStatus='N' or @ACNStatus is null)
				Begin
					Set @Message='Sorry we can''t proccess your payment at this time. Please call Customer Service @ 800-793-9661 ext 600.';
				End
			else
				Begin
					set @IsSuccess=1; set @Message='Login Successfully.';;
					SELECT @FullName=FullName,@IsBitReset=BitReset FROM tblOnlineUsers WHERE AcctNo = @AcctNo;
					UPDATE tblOnlineUsers SET LastLogin = GETDATE() WHERE acctno=@AcctNo;
					INSERT INTO Collection.dbo.tblactionlog (
					ActionLogAccountId,
					ActionLogType,
					ActionLogSubType,
					ActionLogDate,
					ActionLogUsername,
					ActionLogEntry) 
					VALUES (
					@AccountId,
					'WEB',
					'LOG',
					getdate(),
					@FullName,
					convert(text,'Logged In. IP Address@' + @IPAddress));
				End							
		end
	else
		begin				
			if not exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo)
				begin
					set @Message='Invalid Account Number.';
				end
			else if not exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo AND Email = @Username)
				begin
					set @Message='Invalid Email.';
				end
			else if not exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo AND [Password] = @Password)
				begin
					set @Message='Invalid Password.';
				end
			else set @Message='Login Faild.';
		end

		SELECT  @ACNStatus as ACNStatus ,@IsSuccess as IsSuccess,@IsBitReset as IsBitReset,@Message as Message
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineLogin2]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[sp_PayOnlineLogin2]
	@AcctNo VARCHAR(10),	
	@Username VARCHAR(50),
	@Password VARCHAR(20)
AS
BEGIN
	SET NOCOUNT ON;

	declare @ACNStatus char(1),@IsSuccess bit=0,@IsBitReset bit=0,@FullName varchar(50),@Message varchar(200),@AccountId varchar(15),@RepoApprovedDate datetime,@RepoCancelDate datetime;

	if exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo AND Email = @Username AND [Password] = @Password)
		begin		
			select 	@AccountId= AccountId,@RepoApprovedDate=RepoApprovedDate,@RepoCancelDate=RepoCancelDate from collection.dbo.tblaccounts where acctno=@AcctNo;
			select @ACNStatus = a.AcceptedPayments From SQL1.PayAssist.dbo.tblAccounts a where acctno=@AcctNo;
			if(@ACNStatus='N' or (@RepoApprovedDate is not null and isnull(@RepoCancelDate,getdate()+1)>getdate())) --(@ACNStatus='N' or @ACNStatus is null)
				Begin
					Set @Message='Sorry we can''t proccess your payment at this time. Please call Customer Service @ 800-793-9661 ext 600.';
				End
			else
				Begin
					set @IsSuccess=1; set @Message='Login Successfully.';;
					SELECT @FullName=FullName,@IsBitReset=BitReset FROM tblOnlineUsers WHERE AcctNo = @AcctNo;
					UPDATE tblOnlineUsers SET LastLogin = GETDATE() WHERE acctno=@AcctNo;
					INSERT INTO Collection.dbo.tblactionlog (
					ActionLogAccountId,
					ActionLogType,
					ActionLogSubType,
					ActionLogDate,
					ActionLogUsername,
					ActionLogEntry) 
					VALUES (
					@AccountId,
					'WEB',
					'LOG',
					getdate(),
					@FullName,
					convert(text,'Logged In.'));
				End							
		end
	else
		begin				
			if not exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo)
				begin
					set @Message='Invalid Account Number.';
				end
			else if not exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo AND Email = @Username)
				begin
					set @Message='Invalid Email.';
				end
			else if not exists(SELECT top 1 * FROM tblOnlineUsers WHERE AcctNo = @AcctNo AND [Password] = @Password)
				begin
					set @Message='Invalid Password.';
				end
			else set @Message='Login Faild.';
		end

		SELECT  @ACNStatus as ACNStatus ,@IsSuccess as IsSuccess,@IsBitReset as IsBitReset,@Message as Message
END



GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlinePayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		David Durango	
-- Create date: 11/09/2009
-- Description:	Registers Online Payments
-- =============================================
CREATE PROCEDURE [dbo].[sp_PayOnlinePayment]
	(@Confirmation VARCHAR(12),	
	@AcctNo VARCHAR(10),	
	@TranPayment MONEY,
	@TranFee MONEY,
	@BankABA VARCHAR(9),	
	@BankAcctNo VARCHAR(17),	
	@BankName VARCHAR(50),	
	@BankHolder VARCHAR(50),
	@BankAcctType VARCHAR(1),
	@UpdatedPhone VARCHAR(12),
	@UpdatedPhoneDate DATETIME	,
	@SaveAccountFuture  varchar(50),
	@BankAccountName varchar(50),
	@FuturePaymentDate date,
	@ScheduleMethod varchar(30),
	@Email varchar(50),
	@ReferenceNumber varchar(20),
	@PaymentType varchar(20))

AS	
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ScheduleID int,@TotalAmount money,@AccountID varchar(10);

	set @TotalAmount=@TranPayment +@TranFee;

	   IF(@FuturePaymentDate is not null and @FuturePaymentDate <> '')
		begin
			insert into tblSchedulePaymentSetup 
			(AcctNo, ConfirmationNumber, TranAmount, TranFee, BankABA, BankAcctNo, BankName, BankHolder, 
			BankAcctType, IsFuturePay, IsAutoPay, CreatedDate,
			CreatedBy, IsVerified, IsActive, PaymentFrequency ) 
			values (@AcctNo, @Confirmation, @TranPayment, @TranFee, @BankABA, @BankAcctNo, @BankName, @BankAccountName,
			@BankAcctType, 1, 0, getdate(), 
			@BankHolder, 1, 1, (SELECT TOP 1 AcctFreq FROM tblAccounts WHERE AcctNo  = @Acctno))
			SET @ScheduleID = SCOPE_IDENTITY();

			INSERT INTO tblSchedulePaymentDetails (ScheduleID, ScheduledDate, [Status], IsActive)
			VALUES (@ScheduleID ,@FuturePaymentDate,'Pending', 1);

			If NOT exists( Select 1 from tblSavedACH where BankAcctNo = @BankAcctNo and AcctNo = @AcctNo and PrimaryNumber = @UpdatedPhone and BankABA = @BankABA and Email = @Email and IsActive =1)		
			begin
	  			INSERT INTO tblSavedACH (AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,CreatedBy,Email,PrimaryNumber,CreatedDate,IsActive)
				VALUES (@AcctNo, @BankABA, @BankAcctNo, @BankName, @BankAccountName, @BankAcctType,@BankHolder,@Email,@UpdatedPhone,getdate(),1)
			end
		end
	Else
		begin	
			-- Insert statements for procedure here
		INSERT INTO tblOnlinePayments (ConfirmationID, AcctNo, TranPayment, TranFee, BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,Status,ReferenceNumber,Type)
		VALUES (@Confirmation, @AcctNo, @TranPayment, @TranFee, @BankABA, @BankAcctNo, @BankName, @BankAccountName, @BankAcctType,'Pending',@ReferenceNumber,@PaymentType)
		
		select top 1 @AccountID=AccountId from tblaccounts where AcctNo=@AcctNo;
		Insert into Collection.dbo.tblactionlog (ActionLogAccountId,ActionLogType,ActionLogSubType,ActionLogDate,ActionLogUsername,ActionLogEntry) 
			values (@AccountID,'PMT','WEB',getdate(),@BankHolder,convert(text,'ACH for $'+convert(varchar(10),@TotalAmount) +' Transaction Date: '+format(getdate(),'MM/dd/yyyy')+' Conf#: '+@Confirmation));
		
		if(@SaveAccountFuture = 1)
			begin
				If NOT exists( Select 1 from tblSavedACH where BankAcctNo = @BankAcctNo and AcctNo = @AcctNo and PrimaryNumber = @UpdatedPhone and BankABA = @BankABA and Email = @Email and IsActive =1)		
				begin
	  				INSERT INTO tblSavedACH (AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,CreatedBy,Email,PrimaryNumber,CreatedDate,IsActive)
					VALUES (@AcctNo, @BankABA, @BankAcctNo, @BankName, @BankAccountName, @BankAcctType,@BankHolder,@Email,@UpdatedPhone,getdate(),'1')
				end
			 end
	end	
END
















GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineRegister]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_PayOnlineRegister]
	@AcctNo VARCHAR(10),	
	@FullName VARCHAR(50),	
	@Password VARCHAR(20), 
	@Email VARCHAR(50),	 
	@SecurityID TINYINT, 
	@Answer VARCHAR(50),
	@SecurityID2 TINYINT, 
	@Answer2 VARCHAR(50),
	@SecurityID3 TINYINT, 
	@Answer3 VARCHAR(50),
	@BitReset VARCHAR(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO tblOnlineUsers (AcctNo, FullName, Password, Email, SecurityID, Answer,SecurityID2,Answer2,SecurityID3,Answer3,BitReset)
	VALUES (@AcctNo, @FullName, @Password, @Email, @SecurityID, @Answer,@SecurityID2,@Answer2,@SecurityID3,@Answer3 ,@BitReset)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_PayOnlineVerify]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- ==================================================
-- Author:		David Durango
-- Create date: 09/03/2009
-- Description:	Verifies the existency of an account
-- ==================================================
CREATE PROCEDURE [dbo].[sp_PayOnlineVerify]
       @AcctNo VARCHAR(10),
       @LastName VARCHAR(30)
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

    -- Select statements for procedure here
       IF @LastName = '' BEGIN    
	   --Get state of account holder
	Declare @state varchar(5);
	select @state = [State] from dbo.GetAddress(@AcctNo)

	--Select account details
	Select 
	(select TOP 1 CAST( TranFee as varchar)  
	FROM tblOnlinePayments 
	where 
	AcctNo = @AcctNo
	AND Status <> 'Cancel'
	ORDER By TranDate desc) as TranFee,
	(select TOP 1 CAST ( TranPayment as varchar)  
	FROM tblOnlinePayments 
	where AcctNo = @AcctNo
	AND Status <> 'Cancel'
	ORDER By TranDate desc) as TranPayment,
	(select TOP 1 BankAcctType
	FROM tblOnlinePayments 
	where AcctNo = @AcctNo 
	AND Status <> 'Cancel'
	ORDER By TranDate desc) as BankAcctType,
	tblAccounts.AcctPayOff,
	tblAccounts.RemainingTerm, 
	tblAccounts.AcctNextDueDate, 
	tblAccounts.AcctNo, 
	tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
	tblAccounts.AcctCurrentBal, 
	tblAccounts.AcctRegPayAmt, 
	tblAccounts.AcctPastDueAmt, 
	VehYear, 
	VehModel, 
	VehType, 
	@state as [State],
	SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
	tblAccounts.UpdatedPhone, 
	tblAccounts.UpdatedPhoneDate  
	From tblAccounts 
	LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
	LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
	Where tblAccounts.AcctNo = @AcctNo
              --Select tblAccounts.AcctNo, tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
              --       tblAccounts.AcctCurrentBal, tblAccounts.AcctRegPayAmt, tblAccounts.AcctPastDueAmt, 
              --       VehYear, VehModel, VehType, tblConsumers.State,
              --       SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
              --       tblAccounts.UpdatedPhone, tblAccounts.UpdatedPhoneDate  
              --From tblAccounts LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
              --       LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
              --Where tblAccounts.AcctNo = @AcctNo
       END ELSE BEGIN
              Select tblAccounts.AcctNo, tblConsumers.FirstName + ' ' + tblConsumers.LastName as FullName,
                     tblAccounts.AcctCurrentBal, tblAccounts.AcctRegPayAmt, tblAccounts.AcctPastDueAmt, 
                     VehYear, VehModel, VehType, tblConsumers.State,
                     SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo,
                     tblAccounts.UpdatedPhone, tblAccounts.UpdatedPhoneDate
              From tblAccounts LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
                     LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID
              Where tblAccounts.AcctNo = @AcctNo and tblConsumers.LastName = @LastName
       END
END










GO
/****** Object:  StoredProcedure [dbo].[sp_ProcessACHScheduledTransactions]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/09/2016
-- Description:	Prcedure to process scheduled ach transactions
-- =============================================
CREATE PROCEDURE [dbo].[sp_ProcessACHScheduledTransactions]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DetailsID int;

	DECLARE @ACHPayments TABLE(
	[ID] int,
	[ConfirmationID] [varchar](10),
	[AcctNo] [varchar](10),
	[TranDate] [datetime],
	[TranPayment] [money],
	[TranFee] [money],
	[BankABA] [varchar](9),
	[BankAcctNo] [varchar](17),
	[BankName] [varchar](50),
	[BankHolder] [varchar](50),
	[BankAcctType] [varchar](1),
	[Status] [varchar](10),
	[SaveAccountFuture] [varchar](50),
	[BankAccountName] [varchar](50));

	IF OBJECT_ID ('tempdb..#achpayments') IS NOT NULL
		DROP TABLE #achpayments

	SELECT spd.ID, spd.ConfirmationID, sp.AcctNo, GETDATE() as TranDate, 
	TranPayment, TranFee, BankABA, 
	BankAcctNo, BankName, BankHolder,
	BankAcctType, 'Pending' as [Status]
	INTO #achpayments
	FROM tblSchedulePayment sp
	INNER JOIN tblSchedulePaymentDetails spd
	ON sp.ScheduleId = spd.ScheduleID
	AND (sp.IsSchedule = 1 OR sp.IsReccuring = 1) AND sp.IsActive = 1
	WHERE spd.IsActive = 1 AND CAST(spd.ScheduledDate as date) = CAST(GETDATE() as date)
	AND BankAcctType IN ('P', 'S')
	
	WHILE (EXISTS(SELECT * FROM #achpayments))
	BEGIN
		--Select Detail id
		SELECT TOP 1 @DetailsID = ID FROM #AchPayments

		--Insert into main ach payment table
		INSERT INTO tblOnlinePayments 
		SELECT ConfirmationID, AcctNo, TranDate, 
		TranPayment, TranFee, BankABA, 
		BankAcctNo, BankName, BankHolder,
		BankAcctType, [Status]
		FROM #AchPayments 
		WHERE ID = @DetailsID

		--Mark autopay as inactive
		UPDATE tblSchedulePaymentDetails
		SET IsActive = 0
		WHERE ID = @DetailsID

		DELETE FROM #AchPayments 
		WHERE ID = @DetailsID
	END
END

GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_AdminLogin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 11/26/2016
-- Description:	Procedure to login into admin portal
-- =============================================
CREATE PROCEDURE [dbo].[sp_rpt_AdminLogin] 
	@username varchar(20),
	@password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT Name FROM dbo.tblAdminLogin 
	WHERE Username  = @username
	AND [Password] = @password
END

GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetAccountInfo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 12/27/2016
-- Description:	Get Account Information
-- [dbo].[SP_Rpt_GetAccountInfo]
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetAccountInfo]
AS
BEGIN

  SELECT AcctNo AS AccountNumber,FullName AS Name FROM tblOnlineUsers 
  ORDER BY AcctNo 
END


GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetAllPayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 01/01/2017
-- Description:	 All Payment Report
-- [dbo].[sp_rpt_GetAllPayment] '01/18/2017','01/26/2017', '' ,'' ,'',''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetAllPayment]
@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10),
@PaymentMethod VARCHAR(10),
@Status VARCHAR(50),
@ConfirmationNumber VARCHAR(15)
AS
BEGIN  
       DECLARE @isAccount bit = 0;
	   DECLARE @isStatus bit = 0;
	   DECLARE @isPaymentType bit = 0;
	    DECLARE @isConfirmationNumber bit = 0;
      if(@AccountNumber is null or @AccountNumber ='')
      BEGIN
	        SET @isAccount = 1;
      END
	  if(@PaymentMethod is null or @PaymentMethod ='')
      BEGIN
	        SET @isPaymentType = 1;
      END  
	  if(@Status is null or @Status ='')
      BEGIN
	        SET @isStatus = 1;
      END 
	  if(@ConfirmationNumber is null or @ConfirmationNumber ='')
      BEGIN
	        SET @isConfirmationNumber = 1;
      END 
	  
	   
	  (
	   SELECT  op.AcctNo AS [AccountNumber],ou.FullName AS [AccountName],(op.TranPayment + op.TranFee) AS [Amount],
	   CASE op.BankAcctType WHEN  'V' THEN 'Visa' when 'M' THEN 'MasterCard' WHEN 'S' THEN 'Savings Account' WHEN 'P' THEN 'Checking Personal' END AS [PaymentMethodType], 
	   CASE op.BankAcctType WHEN 'V' THEN 'XXXX-XXXX-XXXX-'+ op.BankAcctNo WHEN 'M' THEN 'XXXX-XXXX-XXXX-'+ op.BankAcctNo WHEN 'S' THEN 'XXXXX-'+ RIGHT(op.BankAcctNo,4) WHEN 'P' THEN 'XXXXX-'+ RIGHT(op.BankAcctNo,4) END AS [BankAccountCardNumber],
       op.BankHolder AS BankAccountCardName,
	   CASE op.BankAcctType WHEN 'V' THEN 'Card' WHEN 'M' THEN 'Card' WHEN 'S' THEN 'ACH'  WHEN 'P' THEN 'ACH' END AS [PaymentMethod],
	    --CASE op.BankAcctType WHEN 'V' THEN CASE clog.ReasonCode  when 100 THEN 'Success' ELSE 'Failed' END  WHEN 'M' THEN CASE clog.ReasonCode  when 100 THEN 'Success' ELSE 'Failed' END
		-- WHEN 'S' THEN op.Status  WHEN 'P' THEN op.Status END AS [Status],
		op.Status AS Status,
	   CASE clog.ReasonCode   when 100 THEN '' ELSE clog.Description END AS [Reason], clog.ReasonCode AS [ReasonCode],
	   op.ConfirmationID AS [ConfirmationNumber],
	   CONVERT(DATE, op.TranDate) AS [TransDate] ,CONVERT(varchar(15),CAST(op.TranDate AS TIME),8) AS [TransTime],
	   'WEB' as [Source],
	   ou.FullName as Username 
	   From tblOnlinePayments op 
	   LEFT JOIN  tblOnlineUsers ou  ON op.AcctNo = ou.AcctNo
	   LEFT JOIN  tblCardTransactionLog clog ON  op.ConfirmationId =clog.ConfirmationId AND op.AcctNo = clog.AcctNo
	   WHERE (op.TranDate BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND op.AcctNo = @AccountNumber)) 
	   AND  ((@isPaymentType = 1) OR (@isPaymentType = 0 AND  (@PaymentMethod = 'ACH' AND op.BankAcctType IN('S','P')  OR  (@PaymentMethod = 'Card'AND op.BankAcctType IN('V','M')) )))
	   AND ((@isStatus = 1) OR (@isStatus = 0 AND (op.Status = @Status) ) )
	   AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND (op.ConfirmationID = @ConfirmationNumber) ))	     
	   )

	   UNION 

	   (SELECT PDAcctNo as AccountNumber,
		PDFullName as AccountName,
		(TelCheckAmt) as [Amount],
		CASE csi.CardType WHEN  '001' THEN 'Visa' when '002' THEN 'MasterCard' END AS [PaymentMethodType],
		'XXXX-XXXX-XXXX-' + tvl.TelBankAcctNo as [BankAccountCardNumber],
		tvl.TelBankAcctHolder as BankAccountCardName,
		'Card'  AS [PaymentMethod],
		CASE ctl.ReasonCode  when '100' THEN 'Success' ELSE 'Failed' END AS [Status],
		CASE ctl.ReasonCode  when '100' THEN '' ELSE ctl.Description END AS [Reason],
		ctl.ReasonCode AS [ReasonCode],

		tvl.TelBankABA AS [ConfirmationNumber],
		CONVERT(DATE, tvl.EnteredDate) AS [TransDate] ,
		CONVERT(varchar(15),CAST(tvl.EnteredDate AS TIME),8) AS [TransTime],
		'QCall' as [Source],
		tvl.EnteredBy as Username 
		FROM SQL1.Collection.dbo.tblVoxLog tvl
		INNER JOIN SQL1.Collection.dbo.tblCardTransactionLog ctl
		ON tvl.TelBankABA = ctl.ConfirmationId AND tvl.PDAcctNo = ctl.AcctNo
		INNER JOIN SQL1.Collection.dbo.tblCardSubscriptionInfo csi
		ON csi.SubscriptionId = ctl.SubscriptionID AND ctl.AcctNo = csi.AcctNo
		AND ((@isPaymentType = 1 AND tvl.TelCheckNo = 'Card') OR (@isPaymentType = 0 AND tvl.TelCheckNo = @PaymentMethod))
		Where (tvl.EnteredDate BETWEEN @FromDate  AND  @ToDate ) 
		AND  ((@isAccount = 1) or (@isAccount = 0 AND tvl.PDAcctNo = @AccountNumber))   
	   AND  ((@isStatus = 1) or (@isStatus = 0 AND  ((@Status = 'Failed' AND ctl.ReasonCode <> '100') OR  (@Status = 'Success'AND ctl.ReasonCode = '100'))   )) 
	    AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND (tvl.TelBankABA = @ConfirmationNumber) ))
		)

		--UNION 

	 --  (SELECT PDAcctNo as AccountNumber,
		--PDFullName as AccountName,
		--(TelCheckAmt) as [Amount],
		--CASE csi.CardType WHEN  '001' THEN 'Visa' when '002' THEN 'MasterCard' END AS [PaymentMethodType],
		--'XXXX-XXXX-XXXX-' + tvl.TelBankAcctNo as [BankAccountCardNumber],
		--tvl.TelBankAcctHolder as BankAccountCardName,
		--'Card'  AS [PaymentMethod],
		--CASE ctl.ReasonCode  when '100' THEN 'Success' ELSE 'Failed' END AS [Status],
		--CASE ctl.ReasonCode  when '100' THEN '' ELSE ctl.Description END AS [Reason],
		--ctl.ReasonCode AS [ReasonCode],

		--tvl.TelBankABA AS [ConfirmationNumber],
		--CONVERT(DATE, tvl.EnteredDate) AS [TransDate] ,
		--CONVERT(varchar(15),CAST(tvl.EnteredDate AS TIME),8) AS [TransTime],
		--'QCall' as [Source],
		--tvl.EnteredBy as Username 
		--FROM SQL1.Collection.dbo.tblVoxLog tvl
		--INNER JOIN SQL1.Collection.dbo.tblCardTransactionLog ctl
		--ON tvl.TelBankABA = ctl.ConfirmationId AND tvl.PDAcctNo = ctl.AcctNo
		--INNER JOIN SQL1.Collection.dbo.tblCardSubscriptionInfo csi
		--ON csi.SubscriptionId = ctl.SubscriptionID AND ctl.AcctNo = csi.AcctNo
		--AND ((@isPaymentType = 1 AND tvl.TelCheckNo = 'Card') OR (@isPaymentType = 0 AND tvl.TelCheckNo = @PaymentMethod))
		--Where (tvl.EnteredDate BETWEEN @FromDate  AND  @ToDate ) 
		--AND  ((@isAccount = 1) or (@isAccount = 0 AND tvl.PDAcctNo = @AccountNumber))   
	 --  AND  ((@isStatus = 1) or (@isStatus = 0 AND  ((@Status = 'Failed' AND ctl.ReasonCode <> '100') OR  (@Status = 'Success'AND ctl.ReasonCode = '100'))   )) 
	 --   AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND (tvl.TelBankABA = @ConfirmationNumber) ))
		--)
	   ORDER BY [TransDate],[TransTime] 

END


GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetAutoPay]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 10/01/2017
-- Description:	 Auto Pay  Report
-- [dbo].[sp_rpt_GetAutoPay] '1/1/2017' , '1/20/2017' ,'' ,''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetAutoPay]
@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10),
@ConfirmationNumber VARCHAR(15)
AS
BEGIN  
    DECLARE @isAccount bit = 0;
	DECLARE @isConfirmationNumber bit = 0;

	IF(@AccountNumber is null or @AccountNumber ='')
    BEGIN
	        SET @isAccount = 1;
    END
	IF(@ConfirmationNumber is null or @ConfirmationNumber ='')
    BEGIN
	    SET @isConfirmationNumber = 1;
    END 

	--SELECT * 
	--FROM (
		SELECT  
		--row_number() over (PARTITION BY tsp.AcctNo order by scheduleddate ) as 'rowno', 
		tsp.AcctNo  AS [AccountNumber],
		ou.FullName AS [AccountName], 
		CASE tsp.BankAcctType 
		WHEN 'V' THEN 'Card-Visa'
		WHEN 'M' THEN 'Card-MasterCard' 
		WHEN 'S' THEN 'ACH-Savings'  
		WHEN 'P' THEN 'ACH-Checking' 
		END AS [PaymentMethod],
		CASE tsp.BankAcctType 
		WHEN 'V' THEN 'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo 
		WHEN 'M' THEN 'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo 
		WHEN 'S' THEN 'XXXXX-'+ RIGHT(tsp.BankAcctNo,4) 
		WHEN 'P' THEN 'XXXXX-'+ RIGHT(tsp.BankAcctNo,4) 
		END AS [BankAccountCardNumber],
		tsp.BankHolder AS [BankAccountCardName],
		tsp.BankABA AS [BankRoutingNumber],
		csi.CardExpiry AS [CardExpiry],
		(SELECT TOP 1 ScheduledDate 
		FROM tblSchedulePaymentDetails 
		WHERE ScheduleId = tsp.ScheduleId AND IsActive=1 ) AS [NextScheduledDate],
		tspd.ScheduledDate,
		tsp.ConfirmationNumber AS [ConfirmationNumber] ,
		tsp.WebConfirmationNumber AS[AgreementConfirmationNumber],
		FORMAT(Cast(tsp.TextNumber AS bigint),'###-###-####')  AS [TextNumber],
		--ual.Action AS [Type], 
		ual.ActionType AS [Source] ,
		ual.CreatedBy AS [UserName],
		CAST(tsp.CreatedDate AS DATE) AS [Date] ,
		CONVERT(varchar(15),CAST(tsp.CreatedDate AS TIME), 8) AS [Time],
		CASE tspd.IsActive 
		WHEN 0 THEN op.Status 
		WHEN 1 THEN tspd.Status END as [Status],
		op.TranPayment as Amount,
		op.TranFee as Fee,
		clog.ReasonCode ,
		CASE clog.ReasonCode WHEN  100 THEN '' ELSE clog.Description END AS [Reason],
		op.ConfirmationID as PaymentConfirmationNumber
		FROM tblSchedulePaymentDetails tspd 
		INNER JOIN tblschedulepaymentsetup tsp ON tspd.ScheduleId = tsp.ScheduleId
		INNER JOIN  tblOnlineUsers ou  ON ou.AcctNo = tsp.AcctNo
		LEFT JOIN  tblCardSubscriptionInfo csi ON  tsp.SubscriptionId =csi.SubscriptionId AND tsp.AcctNo = csi.AcctNo
		LEFT JOIN   tblUserActionLog ual ON ual.PId = tsp.ScheduleId
		LEFT JOIN tblOnlinePayments op ON op.ReferenceNumber = tspd.ID AND op.AcctNo = tsp.AcctNo
		LEFT JOIN  tblCardTransactionLog clog ON  op.ConfirmationID = clog.ConfirmationId AND tsp.AcctNo = clog.AcctNo
		WHERE  
		(tsp.CreatedDate BETWEEN @FromDate  AND  @ToDate) AND
		IsAutoPay = 1  
		and tsp.IsFuturePay <> 1 and tsp.IsActive=1 
		AND IsVerified = 1
		AND IsDeleted = 0
		AND  (@isAccount = 1 or (@isAccount = 0 AND tsp.AcctNo = @AccountNumber))
		--AND  ((@isPaymentType = 1) OR (@isPaymentType = 0 AND  (@PaymentMethod = 'ACH' AND [PaymentMethod] IN('ACH')  OR  (@PaymentMethod = 'Card'AND [PaymentMethod] IN('Card')) )))
		AND (@isConfirmationNumber = 1 OR (@isConfirmationNumber = 0 AND tsp.ConfirmationNumber = @ConfirmationNumber))
	--	) tab1 
	--where rowno = 1
	--AND  (@isAccount = 1 or (@isAccount = 0 AND [AccountNumber] = @AccountNumber))
	----AND  ((@isPaymentType = 1) OR (@isPaymentType = 0 AND  (@PaymentMethod = 'ACH' AND [PaymentMethod] IN('ACH')  OR  (@PaymentMethod = 'Card'AND [PaymentMethod] IN('Card')) )))
	--AND (@isConfirmationNumber = 1 OR (@isConfirmationNumber = 0 AND [ConfirmationNumber] = @ConfirmationNumber))	

  END
GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetAutoPayEnrollment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 09/01/2017
-- Description:	 Auto Pay Enrollment Report
-- [dbo].[sp_rpt_GetAutoPayEnrollment] '2017-01-1 04:1:24' , '2017-01-13 23:44:55.683' ,'999997' ,'' ,''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetAutoPayEnrollment]
@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10),
@PaymentMethod VARCHAR(10),
@ConfirmationNumber VARCHAR(15)
AS
BEGIN  
 
     DECLARE @isAccount bit = 0;
	 DECLARE @isPaymentType bit = 0;
	 DECLARE @isConfirmationNumber bit = 0;

              IF(@AccountNumber is null or @AccountNumber ='')
                 BEGIN
	                   SET @isAccount = 1;
              END
	        If(@PaymentMethod is null or @PaymentMethod ='')
                BEGIN
	                   SET @isPaymentType = 1;
                END 

	     IF(@ConfirmationNumber is null or @ConfirmationNumber ='')
             BEGIN
	                SET @isConfirmationNumber = 1;
             END 

    SELECT * FROM (
                   SELECT
					  row_number() over (PARTITION BY ual.LogId ORDER BY tspd.scheduleddate ASC) AS 'rowno',
                      ual.AcctNo  AS [AccountNumber],ual.ActionSubType AS [ActionSubType],
                      ou.FullName AS [AccountName],
                      CASE tsp.BankAcctType WHEN 'V' THEN 'Card-Visa' WHEN 'M' THEN 'Card-MasterCard' WHEN 'S' THEN 'ACH-Savings'  WHEN 'P' THEN 'ACH-Checking' END AS [PaymentMethod],
                      CASE tsp.BankAcctType WHEN 'V' THEN 'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo WHEN 'M' THEN 'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo WHEN 'S' THEN 'XXXXX-'+ RIGHT(tsp.BankAcctNo,4) WHEN 'P' THEN 'XXXXX-'+ RIGHT(tsp.BankAcctNo,4) END AS [BankAccountCardNumber],
                      tsp.BankHolder AS [BankAccountCardName],
                      tsp.BankABA AS [BankRoutingNumber],
                      clog.CardExpiry AS [CardExpiry],
                      CASE tsp.paymentFrequency WHEN 'W' THEN 'Weekly' WHEN 'M' THEN 'Monthly' WHEN 'Y' THEN 'Yearly' WHEN 'B' THEN 'Bi-Weekly' WHEN 'S' THEN 'Semi-Monthly' WHEN 'D' THEN 'Daily'  END AS [PaymentFrequency],
                      
					CASE   
					       WHEN ual.Action = 'Opt-Out'   THEN   NULL
						     WHEN tsp.IsDeleted = 1   THEN   NULL
						   WHEN tspd.IsActive = 1   THEN   tspd.ScheduledDate 
					       WHEN tspd.IsActive = 0 THEN NULL 
					
					END  AS [NextScheduledDate],


					  ual.Action AS [Type],
					   ual.ActionType AS [Source] ,
                      ual.IpAddress AS [IPAddress] ,
                     ual.ConfirmationNumber AS [ConfirmationNumber] ,
					 tsp.WebConfirmationNumber AS[AgreementConfirmationNumber],
					 FORMAT(Cast( tsp.TextNumber AS bigint),'###-###-####')  AS [TextNumber],
                     ual.CreatedBy AS [UserName],
					 ual.CreatedDate AS [Date] ,CONVERT(varchar(15),CAST(ual.CreatedDate AS TIME),8) AS [Time]
                    
					 FROM tblUserActionLog ual
                     LEFT JOIN tblschedulepaymentsetup tsp ON ual.PId = tsp.ScheduleId
                     LEFT JOIN  tblOnlineUsers ou  ON tsp.AcctNo = ou.AcctNo
                     LEFT JOIN  tblCardSubscriptionInfo clog ON  tsp.SubscriptionId =clog.SubscriptionId AND tsp.AcctNo = clog.AcctNo
                     LEFT JOIN tblSchedulePaymentDetails tspd ON ual.PId = tspd.ScheduleId
                     AND tspd.IsActive=1

					--AND ual.ConfirmationNumber IN ( SELECT [ConfirmationNumber] from tblUserActionLog WHERE (CreatedDate BETWEEN  @FromDate  AND  @ToDate))
                     --AND IsVerified = 1
                    --and tsp.IsFuturePay <>1 AND tsp.IsAutoPay = 1
					--AND ual.ActionSubType ='AutoPay'

      
	  ) tab1 WHERE [ConfirmationNumber] IN ( SELECT [ConfirmationNumber] from tblUserActionLog WHERE (CreatedDate BETWEEN  @FromDate  AND  @ToDate))
		 AND rowno = 1 AND ActionSubType ='AutoPay'
		 AND  ((@isAccount = 1) or (@isAccount = 0 AND [AccountNumber] = @AccountNumber))
		 AND  ((@isPaymentType = 1) OR (@isPaymentType = 0 AND  (@PaymentMethod = 'ACH' AND [PaymentMethod] IN('ACH-Savings','ACH-Checking')  OR  (@PaymentMethod = 'Card'AND [PaymentMethod] IN('Card-Visa','Card-MasterCard')) )))
		 AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND ([ConfirmationNumber] = @ConfirmationNumber) ))	
      ORDER BY [Date] ,[Time], AccountNumber
	  
END
GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetAutoPayOptInOptOut ]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 19/01/2017
-- Description:	 AutoPay OptIn OptOut Report
-- [dbo].[sp_rpt_GetAutoPayOptInOptOut] '2017-01-16 04:1:24' , '2017-01-25 23:44:55.683' ,'Opt-Out' ,''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetAutoPayOptInOptOut ]
@FromDate dateTime,
@ToDate dateTime,
@Type VARCHAR(15),
@Source VARCHAR(15)
AS
BEGIN  
 
	DECLARE @isType bit = 0;
	DECLARE @IsSource bit = 1;
    
	IF(@Type is null or @Type ='')
    BEGIN
	    SET @isType = 1;
    END 
	IF(@Source is null or @Source ='')
    BEGIN
	    SET @IsSource = 0;
    END 
	
	IF(@Type = 'Opt-In')
	BEGIN               
		SELECT
		ual.AcctNo  AS [AccountNumber],
		ou.FullName AS [AccountName],
		CASE tsp.BankAcctType WHEN 'V' THEN 'Card-Visa' WHEN 'M' THEN 'Card-MasterCard' WHEN 'S' THEN 'ACH-Savings'  WHEN 'P' THEN 'ACH-Checking' END AS [PaymentMethod],
		CASE tsp.paymentFrequency WHEN 'W' THEN 'Weekly' WHEN 'M' THEN 'Monthly' WHEN 'Y' THEN 'Yearly' WHEN 'B' THEN 'Bi-Weekly' WHEN 'S' THEN 'Semi-Monthly' WHEN 'D' THEN 'Daily'  END AS [PaymentFrequency],
		ual.Action AS [Type],				
		ual.ActionType AS [Source] ,					  
		ual.IpAddress AS [IPAddress] ,
		ual.ConfirmationNumber AS [ConfirmationNumber] ,
		tsp.WebConfirmationNumber AS[AgreementConfirmationNumber],
		FORMAT(Cast( tsp.TextNumber AS bigint),'###-###-####')  AS [TextNumber],
		ual.CreatedBy AS [UserName],
		ual.CreatedDate AS [OptInDate] ,CONVERT(varchar(15),CAST(ual.CreatedDate AS TIME),8) AS [OptInTime],
		ual1.CreatedDate AS [OptOutDate] ,CONVERT(varchar(15),CAST(ual1.CreatedDate AS TIME),8) AS [OptOutTime]                      
		FROM tblUserActionLog ual
		INNER JOIN tblschedulepaymentsetup tsp ON ual.PId = tsp.ScheduleId AND ual.ActionSubType ='AutoPay' AND ual.Action = 'Opt-In' --AND (ual.Action = 'Opt-In' OR ual.Action = 'Opt-Out')
		INNER JOIN  tblOnlineUsers ou  ON tsp.AcctNo = ou.AcctNo
		LEFT JOIN tblUserActionLog ual1 ON ual.ConfirmationNumber = ual1.ConfirmationNumber AND ual1.Action = 'Opt-Out'
		WHERE  
		ual.CreatedDate BETWEEN @FromDate  AND  @ToDate
		AND  (@IsSource = 0 OR (@IsSource = 1 AND ual.ActionType = @Source))
		ORDER BY ual.CreatedDate , ual.AcctNo
	END
	ELSE IF(@Type = 'Opt-Out')
	BEGIN
		SELECT
		ual.AcctNo  AS [AccountNumber],
		ou.FullName AS [AccountName],
		CASE tsp.BankAcctType WHEN 'V' THEN 'Card-Visa' WHEN 'M' THEN 'Card-MasterCard' WHEN 'S' THEN 'ACH-Savings'  WHEN 'P' THEN 'ACH-Checking' END AS [PaymentMethod],
		CASE tsp.paymentFrequency WHEN 'W' THEN 'Weekly' WHEN 'M' THEN 'Monthly' WHEN 'Y' THEN 'Yearly' WHEN 'B' THEN 'Bi-Weekly' WHEN 'S' THEN 'Semi-Monthly' WHEN 'D' THEN 'Daily'  END AS [PaymentFrequency],
		ual.Action AS [Type],				
		ual.ActionType AS [Source] ,					  
		ual.IpAddress AS [IPAddress] ,
		ual.ConfirmationNumber AS [ConfirmationNumber] ,
		tsp.WebConfirmationNumber AS[AgreementConfirmationNumber],
		FORMAT(Cast( tsp.TextNumber AS bigint),'###-###-####')  AS [TextNumber],
		ual.CreatedBy AS [UserName],
		ual.CreatedDate AS [OptOutDate] ,CONVERT(varchar(15),CAST(ual.CreatedDate AS TIME),8) AS [OptOutTime],
		ual1.CreatedDate AS [OptInDate] ,CONVERT(varchar(15),CAST(ual1.CreatedDate AS TIME),8) AS [OptInTime]                      
		FROM tblUserActionLog ual
		INNER JOIN tblschedulepaymentsetup tsp ON ual.PId = tsp.ScheduleId AND ual.ActionSubType ='AutoPay' AND ual.Action = 'Opt-Out' --AND (ual.Action = 'Opt-In' OR ual.Action = 'Opt-Out')
		INNER JOIN  tblOnlineUsers ou  ON tsp.AcctNo = ou.AcctNo
		INNER JOIN tblUserActionLog ual1 ON ual.ConfirmationNumber = ual1.ConfirmationNumber AND ual1.Action = 'Opt-In'
		WHERE  
		ual.CreatedDate BETWEEN @FromDate  AND  @ToDate
		AND  (@IsSource = 0 OR (@IsSource = 1 AND ual.ActionType = @Source))
		ORDER BY ual.CreatedDate , ual.AcctNo
	END
	
	-- OR (@isSubType = 1 AND ual.ConfirmationNumber IN (SELECT ConfirmationNumber FROM tblUserActionLog  WHERE ActionSubType ='AutoPay' AND Action = 'Opt-Out'
	
	--AND (CreatedDate BETWEEN @FromDate  AND  @ToDate))))   ) 
END

GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetAutoPaySchedule]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 13/01/2017
-- Description:	 Scheduled AutoPay
-- [dbo].[sp_rpt_GetAutoPaySchedule] '2017-01-01 04:1:24' , '2017-09-14 23:44:55.683' ,'' ,'' ,'',''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetAutoPaySchedule]
@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10),
@PaymentMethod VARCHAR(10),
@Status VARCHAR(50),
@ConfirmationNumber VARCHAR(15)

AS
BEGIN  
	DECLARE @isAccount bit = 0;
	DECLARE @isStatus bit = 0;
	DECLARE @isPaymentType bit = 0;
	DECLARE @isConfirmationNumber bit = 0;

	if(@AccountNumber is null or @AccountNumber ='')
	BEGIN
		SET @isAccount = 1;
	END
	if(@PaymentMethod is null or @PaymentMethod ='')
	BEGIN
		SET @isPaymentType = 1;
	END  
	if(@Status is null or @Status ='')
	BEGIN
		SET @isStatus = 1;
	END 
	IF(@ConfirmationNumber is null or @ConfirmationNumber ='')
	BEGIN
		SET @isConfirmationNumber = 1;
	END 

	SELECT   tsp.AcctNo  AS [AccountNumber],
	ou.FullName AS [AccountName], 
	CASE tsp.BankAcctType 
	WHEN 'V' THEN 'Card-Visa' 
	WHEN 'M' THEN 'Card-MasterCard' 
	WHEN 'S' THEN 'ACH-Savings'  
	WHEN 'P' THEN 'ACH-Checking' 
	END AS [PaymentMethod],
	CASE tsp.BankAcctType 
	WHEN 'V' THEN 'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo 
	WHEN 'M' THEN 'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo 
	WHEN 'S' THEN 'XXXXX-'+ RIGHT(tsp.BankAcctNo,4) 
	WHEN 'P' THEN 'XXXXX-'+ RIGHT(tsp.BankAcctNo,4) 
	END AS [BankAccountCardNumber],
	tsp.BankHolder AS [BankAccountCardName],
	tsp.BankABA AS [BankRoutingNumber],
	csi.CardExpiry AS [CardExpiry],
	tsp.ConfirmationNumber AS [ConfirmationNumber] ,
	tsp.WebConfirmationNumber AS[AgreementConfirmationNumber],
	FORMAT(Cast( tsp.TextNumber AS bigint),'###-###-####')  AS [TextNumber],
	ual.ActionType AS [Source] ,
	ual.CreatedBy AS [UserName],
	tspd.ScheduledDate AS [ScheduledDate],
	CASE tspd.IsActive 
	WHEN 0 THEN op.Status 
	WHEN 1 THEN tspd.Status END as [Status],
	op.TranPayment as Amount,
	op.TranFee as Fee,
	clog.ReasonCode ,
	CASE clog.ReasonCode WHEN  100 THEN '' ELSE clog.Description END AS [Reason],
	op.ConfirmationID as PaymentConfirmationNumber
	FROM tblSchedulePaymentDetails tspd 
	INNER JOIN tblschedulepaymentsetup tsp ON tspd.ScheduleId = tsp.ScheduleId
	INNER JOIN  tblOnlineUsers ou  ON ou.AcctNo = tsp.AcctNo
	LEFT JOIN  tblCardSubscriptionInfo csi ON  tsp.SubscriptionId =csi.SubscriptionId AND tsp.AcctNo = csi.AcctNo
	LEFT JOIN   tblUserActionLog ual ON ual.PId = tsp.ScheduleId
	LEFT JOIN tblOnlinePayments op ON op.ReferenceNumber = tspd.ID AND op.AcctNo = tsp.AcctNo
	LEFT JOIN  tblCardTransactionLog clog ON  op.ConfirmationID = clog.ConfirmationId AND tsp.AcctNo = clog.AcctNo
	WHERE (tspd.ScheduledDate BETWEEN @FromDate  AND  @ToDate )	              	 
	AND  ((@isAccount = 1) or (@isAccount = 0 AND tsp.acctno = @AccountNumber))
	AND  ((@isPaymentType = 1) OR (@isPaymentType = 0 AND  (@PaymentMethod = 'ACH' AND tsp.BankAcctType IN('S','P')  OR  (@PaymentMethod = 'Card'AND tsp.BankAcctType IN('V','M')) )))
	AND ((@isStatus = 1) OR (@isStatus = 0 AND (tspd.Status = @Status) ) )
	AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND (op.ConfirmationID = @ConfirmationNumber) ))
	AND IsAutoPay = 1  
	and tsp.IsFuturePay <> 1 and tsp.IsActive=1 
	AND IsVerified = 1
	AND IsDeleted = 0 
	ORDER BY tsp.AcctNo, tspd.ScheduledDate
END  
GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetCardExpiry]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 25/01/2017
-- Description:	 Card Expiry Report
--  [dbo].[sp_rpt_GetCardExpiry]  ''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetCardExpiry]
@AccountNumber VARCHAR(10)
AS
BEGIN  
	DECLARE @IsAccountNumber BIT;
	SET @IsAccountNumber = 1;
	IF(@AccountNumber IS NULL OR @AccountNumber = '')
	BEGIN
		SET @IsAccountNumber = 0;
	END

	SELECT  
	tsp.AcctNo  AS [AccountNumber],	
	ou.FullName AS [AccountName], 		
	'XXXX-XXXX-XXXX-'+ tsp.BankAcctNo AS [CardNumber],
	tsp.BankHolder AS [CardName],
	CASE tsp.BankAcctType 
	WHEN 'V' THEN 'Visa'
	WHEN 'M' THEN 'MasterCard' 
	END AS [CardType],
	csi.CardExpiry AS [CardExpiry],
	ActionSubType AS [ActiveEnrollment],
	CASE ActionSubType
	WHEN 'FuturePay' THEN tspd.ScheduledDate
	ELSE
	(SELECT TOP 1 ScheduledDate 
	FROM tblSchedulePaymentDetails 
	WHERE ScheduleId = tsp.ScheduleId AND IsActive=1 ) END AS [NextScheduledDate],
	ual.ActionType AS [Source],
	ual.CreatedBy AS [UserName]
	FROM tblSchedulePaymentDetails tspd 
	INNER JOIN tblschedulepaymentsetup tsp 
	ON tspd.ScheduleId = tsp.ScheduleId
	INNER JOIN  tblOnlineUsers ou  
	ON ou.AcctNo = tsp.AcctNo
	INNER JOIN  tblCardSubscriptionInfo csi 
	ON  tsp.SubscriptionId = csi.SubscriptionId AND tsp.AcctNo = csi.AcctNo
	INNER JOIN   tblUserActionLog ual 
	ON ual.PId = tsp.ScheduleId
	WHERE 
	CONVERT(DATETIME, RIGHT(csi.CardExpiry,4) + '/' + LEFT(csi.CardExpiry, LEN(csi.CardExpiry)-5) + '/' + CAST( DAY(GETDATE()) AS VARCHAR(2)), 101) = CONVERT(datetime, CONVERT(VARCHAR, GETDATE(), 102)) 
	--CONVERT(datetime, RIGHT(csi.CardExpiry,4) + '/' + LEFT(csi.CardExpiry, LEN(csi.CardExpiry)-5) + '/' + CAST( DAY(GETDATE()) AS VARCHAR(2)), 101) BETWEEN GETDATE() AND DATEADD(DAY, @ExpiringInDays, GETDATE())
	AND (@IsAccountNumber = 0 OR (@IsAccountNumber = 1 AND tsp.AcctNo = @AccountNumber))
	AND (tsp.IsFuturePay = 1 OR IsAutoPay = 1)  
	AND tsp.IsActive=1 
	AND tspd.IsActive=1
	AND tsp.IsVerified = 1
	AND tsp.IsDeleted = 0
	AND tsp.BankAcctType IN ('V','M')

	UNION 

	SELECT 
	tpbts.AcctNo  AS [AccountNumber],
	ou.FullName AS [AccountName], 
	'XXXX-XXXX-XXXX-'+ tpbts.BankAcctNo AS [CardNumber],
	tpbts.BankHolder AS [CardName],
	CASE tpbts.BankAcctType 
	WHEN 'V' THEN 'Visa'
	WHEN 'M' THEN 'MasterCard' 
	END AS [CardType],		
	csi.CardExpiry AS [CardExpiry],
	ActionSubType AS [ActiveEnrollment],
	NULL AS [NextScheduledDate],
	ual.ActionType AS [Source],
	ual.CreatedBy AS [UserName]
	FROM tblPayByTextSetup tpbts
    INNER JOIN  tblOnlineUsers ou  ON ou.AcctNo = tpbts.AcctNo
	INNER JOIN  tblCardSubscriptionInfo csi ON  tpbts.SubscriptionId =csi.SubscriptionId AND tpbts.AcctNo = csi.AcctNo 
	INNER JOIN  tblUserActionLog ual ON ual.PID = tpbts.ID
	WHERE 
	CONVERT(DATETIME, RIGHT(csi.CardExpiry,4) + '/' + LEFT(csi.CardExpiry, LEN(csi.CardExpiry)-5) + '/' + CAST( DAY(GETDATE()) AS VARCHAR(2)), 101) = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 102)) 
	--CONVERT(datetime, RIGHT(csi.CardExpiry,4) + '/' + LEFT(csi.CardExpiry, LEN(csi.CardExpiry)-5) + '/' + CAST( DAY(GETDATE()) AS VARCHAR(2)), 101) BETWEEN GETDATE() AND DATEADD(DAY, @ExpiringInDays, GETDATE())
	AND (@IsAccountNumber = 0 OR (@IsAccountNumber = 1 AND tpbts.AcctNo = @AccountNumber))
	AND tpbts.IsActive=1 
	AND tpbts.IsDeleted = 0
	AND tpbts.BankAcctType IN ('M','V')
END

GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetCardPayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 12/30/2016
-- Description:	 Card Payment Report
-- [dbo].[sp_rpt_GetCardPayment] '01/18/2017','01/26/2017','','',''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetCardPayment]
@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10),
@Status VARCHAR(50),
@ConfirmationNumber VARCHAR(15)
AS
BEGIN  
       DECLARE @isAccount bit = 0;
	   DECLARE @isStatus bit = 0;
	    DECLARE @isConfirmationNumber bit = 0;
      if(@AccountNumber is null or @AccountNumber ='')
      BEGIN
	        SET @isAccount = 1;
      END
	  if(@Status is null or @Status ='')
      BEGIN
	        SET @isStatus = 1;
      END	
	    
	  if(@ConfirmationNumber is null or @ConfirmationNumber ='')
      BEGIN
	        SET @isConfirmationNumber = 1;
      END 
	     
	   (SELECT op.AcctNo  AS [AccountNumber],
	   ou.FullName AS [AccountName],
	   (op.TranPayment + op.TranFee) AS [Amount],
	   op.BankHolder AS [CardName],
	   'XXXX-XXXX-XXXX-'+ clog.CardNumber AS [CardNumber],
	   CASE op.BankAcctType when 'V' THEN 'Visa' ELSE 'MasterCard' END AS [CardType],
	   clog.CardExpiry AS [CardExpiry],clog.ReasonCode AS [ReasonCode], 
	   CASE clog.ReasonCode  when '100' THEN 'Success' ELSE 'Failed' END AS [Status],
	   --op.Status,
	   CASE clog.ReasonCode  when '100' THEN '' ELSE clog.Description END AS [Reason],
	   op.ConfirmationID AS [ConfirmationNumber],
	   CONVERT(DATE, op.TranDate) AS [TransDate] ,
	   CONVERT(varchar(15),CAST(op.TranDate AS TIME),8) AS [TransTime],
	   'WEB' as [Source],
	   ou.FullName as Username 
	   FROM tblOnlinePayments op
	   INNER JOIN  tblOnlineUsers ou  ON op.AcctNo = ou.AcctNo	
	   INNER JOIN  tblCardTransactionLog clog ON  op.ConfirmationId =clog.ConfirmationId AND op.AcctNo = clog.AcctNo
	   Where (op.TranDate BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND op.AcctNo = @AccountNumber))   
	   AND  ((@isStatus = 1) or (@isStatus = 0 AND  ((@Status = 'Failed' AND clog.ReasonCode <> '100') OR  (@Status = 'Success'AND clog.ReasonCode = '100'))   )) 
	   AND  op.BankAcctType in('V','M') 
	    AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND (op.ConfirmationID = @ConfirmationNumber) ))
	   )

	   UNION 

	   (SELECT PDAcctNo as AccountNumber,
		PDFullName as AccountName,
		(TelCheckAmt) as [Amount],
		tvl.TelBankAcctHolder as CardName,
		'XXXX-XXXX-XXXX-' + tvl.TelBankAcctNo as [CardNumber],
		CASE csi.CardType when '001' THEN 'Visa' ELSE 'MasterCard' END AS [CardType],
		csi.CardExpiry AS [CardExpiry],
		ctl.ReasonCode AS [ReasonCode],
		CASE ctl.ReasonCode  when '100' THEN 'Success' ELSE 'Failed' END AS [Status],
		CASE ctl.ReasonCode  when '100' THEN '' ELSE ctl.Description END AS [Reason],
		tvl.TelBankABA AS [ConfirmationNumber],
		CONVERT(DATE, tvl.EnteredDate) AS [TransDate] ,
		CONVERT(varchar(15),CAST(tvl.EnteredDate AS TIME),8) AS [TransTime],
		'QCall' as [Source],
		tvl.EnteredBy as Username 
		FROM SQL1.Collection.dbo.tblVoxLog tvl
		INNER JOIN SQL1.Collection.dbo.tblCardTransactionLog ctl
		ON tvl.TelBankABA = ctl.ConfirmationId AND tvl.PDAcctNo = ctl.AcctNo
		INNER JOIN SQL1.Collection.dbo.tblCardSubscriptionInfo csi
		ON csi.SubscriptionId = ctl.SubscriptionID AND ctl.AcctNo = csi.AcctNo
		AND tvl.TelCheckNo = 'Card'
		Where (tvl.EnteredDate BETWEEN @FromDate  AND  @ToDate ) 
		AND  ((@isAccount = 1) or (@isAccount = 0 AND tvl.PDAcctNo = @AccountNumber))   
	   AND  ((@isStatus = 1) or (@isStatus = 0 AND  ((@Status = 'Failed' AND ctl.ReasonCode <> '100') OR  (@Status = 'Success'AND ctl.ReasonCode = '100'))   )) 
	    AND ((@isConfirmationNumber = 1) OR (@isConfirmationNumber = 0 AND (tvl.TelBankABA = @ConfirmationNumber) ))
		)
		ORDER BY  [TransDate],[TransTime] 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetNotificationsByTextOptInOptOut]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	CHETU	
-- Create date: 01/18/2017
-- Description:	 Auto Pay Enrollment Report
---- [dbo].[sp_rpt_GetNotificationsByTextOptInOptOut] '2017-01-1' , '2017-01-31 ' ,'Opt-Out' ,''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetNotificationsByTextOptInOptOut]
@FromDate dateTime,
@ToDate dateTime,
@Type VARCHAR(15),
@AccountNumber VARCHAR(10)

 AS
 BEGIN  
    DECLARE @isAccount bit = 0;
    IF(@AccountNumber is null or @AccountNumber ='')
    BEGIN
	        SET @isAccount = 1;
    END
		

    IF(@Type = 'Opt-In')
    BEGIN 
	      SELECT * FROM (
	                     SELECT   tab1.AccountNumber,tab1.AccountName,tab1.Type,tab1.Source,tab1.IPAddress,
						 tab1.OptInDate,tab1.OptInTime,tab1.OptOutDate,tab1.OptOutTime,tab1.OptedIN,
						 tab1.TextNumber,tab1.UserName,tab1.PaymentReminder,
						 tab1.PaymentConfirmation,tab1.ChatByText,tab1.PayByText
		            FROM(
		                SELECT --al.*,
		                row_number() over( partition by ssr.SubscriberID order by ssr.CreatedDate desc)  AS 'rowno',
		                ssr.AccountNumber AS [AccountNumber],
		                ou.FullName AS [AccountName],
		               -- CASE ssr.IsActive WHEN 1 THEN 'Opt-In' WHEN 0 THEN 'Opt-Out' END AS [Type],
					    'Opt-In' AS [Type],
				        CASE 
				        --WHEN LEFT(stal.ActionLogEntry,3) = 'CUS' AND UPPER(stal.ActionLogSubType) = 'SUBSCRIBE' THEN 'WEB'
				        --WHEN LEFT(stal.ActionLogEntry,3) = 'REP' AND UPPER(stal.ActionLogSubType) = 'SUBSCRIBED' THEN 'Qcall'
						WHEN LEFT(stal.ActionLogEntry,3) = 'CUS'  THEN 'WEB'
				        WHEN LEFT(stal.ActionLogEntry,3) = 'REP'  THEN 'Qcall'
				        END AS [Source],	
		                ssr.OptInIPAddress AS [IPAddress],
		                CONVERT(DATE, ssr.CreatedDate) AS [OptInDate] ,
		                CONVERT(varchar(15),CAST(ssr.CreatedDate AS TIME),8) AS [OptInTime],
						CONVERT(DATE, ssr.ModifiedDate) AS [OptOutDate],
				        CONVERT(varchar(15),CAST(ssr.ModifiedDate AS TIME),8) AS [OptOutTime],
				        CAST(DATEDIFF(DAY, ssr.CreatedDate, ssr.ModifiedDate) AS VARCHAR(5)) + '-Days' AS [OptedIN],
		                FORMAT(Cast(ssr.TextNumber AS bigint),'###-###-####')  AS [TextNumber], 
		                ssr.CreatedBy AS [UserName],
		                CASE ssr.IsPaymentReminderNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [PaymentReminder],
		                CASE ssr.IsPaymentConfirmationNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [PaymentConfirmation],
		                CASE ssr.IsChatByTextNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [ChatByText],
		                CASE ssr.IsPayByTextNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [PayByText]
		                FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTSubscriber] ssr 
		                INNER JOIN  tblOnlineUsers ou  ON ssr.AccountNumber  = ou.AcctNo
		                INNER JOIN [Reserves].[dbo].[tblAccounts] ac ON  ssr.AccountNumber = ac.AcctNo
	                    INNER JOIN [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTTextActionLog] stal ON ac.AccountID = stal.ActionLogAccountID 
					    AND ssr.TextNumber = stal.ActionLogTxtNumber            
		                WHERE (ssr.CreatedDate BETWEEN @FromDate  AND  @ToDate )
		                AND  ((@isAccount = 1) or (@isAccount = 0 AND ssr.AccountNumber = @AccountNumber)) 
		                AND ssr.IsActive = 1
					--  AND UPPER(stal.ActionLogSubType) IN('SUBSCRIBE','SUBSCRIBED')

		) tab1 WHERE rowno = 1
	) tab2
	END
	ELSE IF(@Type = 'Opt-Out')
	BEGIN
SELECT * FROM (
              SELECT tab1.AccountNumber,tab1.AccountName,tab1.Type,tab1.Source,tab1.IPAddress,
			  tab1.OptInDate,tab1.OptInTime,tab1.OptOutDate,tab1.OptOutTime,tab1.OptedIN,tab1.TextNumber,tab1.UserName,tab1.PaymentReminder,tab1.PaymentConfirmation,tab1.ChatByText,tab1.PayByText
			  FROM(
			   SELECT 
				row_number() over( partition by ssr.SubscriberID order by ssr.ModifiedDate desc)  AS 'rowno',
				ssr.AccountNumber AS [AccountNumber],
				ou.FullName AS [AccountName],
				--CASE ssr.IsActive WHEN 1 THEN 'Opt-In' WHEN 0 THEN 'Opt-Out' END AS [Type],
				'Opt-Out' AS [Type],
				 CASE 
				--WHEN LEFT(stal.ActionLogEntry,3) = 'CUS' AND UPPER(stal.ActionLogSubType) = 'UNSUBSCRIBE' THEN 'WEB'
				--WHEN LEFT(stal.ActionLogEntry,3) = 'REP' AND UPPER(stal.ActionLogSubType) = 'UNSUBSCRIBE' THEN 'Qcall'
				WHEN LEFT(stal.ActionLogEntry,3) = 'CUS'  THEN 'WEB'
				WHEN LEFT(stal.ActionLogEntry,3) = 'REP'  THEN 'Qcall'
				END AS [Source],		
				ssr.OptOutIPAddress AS [IPAddress],
				CONVERT(DATE, ssr.CreatedDate) AS [OptInDate] ,
				CONVERT(varchar(15),CAST(ssr.CreatedDate AS TIME),8) AS [OptInTime],
				CONVERT(DATE, ssr.ModifiedDate) AS [OptOutDate],
				CONVERT(varchar(15),CAST(ssr.ModifiedDate AS TIME),8) AS [OptOutTime],
				CAST(DATEDIFF(DAY, ssr.CreatedDate, ssr.ModifiedDate) AS VARCHAR(5)) + '-Days' AS [OptedIN],
				FORMAT(Cast(ssr.TextNumber AS bigint),'###-###-####')  AS [TextNumber], 
				ssr.ModifiedBy AS [UserName],
				CASE ssr.IsPaymentReminderNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [PaymentReminder],
		        CASE ssr.IsPaymentConfirmationNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [PaymentConfirmation],
		        CASE ssr.IsChatByTextNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [ChatByText],
		        CASE ssr.IsPayByTextNotification WHEN 1 THEN 'Enabled' When 0 THEN 'Disabled' END AS [PayByText]
				FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTSubscriber] ssr 
				INNER JOIN  tblOnlineUsers ou  ON ssr.AccountNumber  = ou.AcctNo
				INNER JOIN [Reserves].[dbo].[tblAccounts] ac ON  ssr.AccountNumber = ac.AcctNo
				INNER JOIN [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTTextActionLog] stal 
				ON ac.AccountID = stal.ActionLogAccountID AND ssr.TextNumber = stal.ActionLogTxtNumber            
				WHERE (ssr.ModifiedDate BETWEEN @FromDate  AND  @ToDate )
				AND  ((@isAccount = 1) or (@isAccount = 0 AND ssr.AccountNumber = @AccountNumber)) 
				AND ssr.IsActive = 0
				--AND UPPER(stal.ActionLogSubType) ='UNSUBSCRIBE'
		   ) tab1 WHERE rowno = 1
		   )tab2
	END

END









GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetPaymentStatus]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 01/06/2017
-- Description:	Get status for payments
-- =============================================
CREATE PROCEDURE [dbo].[sp_rpt_GetPaymentStatus]
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT DISTINCT [Status] 
	FROM tblOnlinePayments
	WHERE [Status] IS NOT NULL;
END

GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetTextMessage]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 12/31/2016
-- Description:	 Text Message Report
--  [dbo].[sp_rpt_GetTextMessage] '12/1/2016' , '12/3/2016' ,'311676',''
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetTextMessage]
@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10),
@MessageType VARCHAR(20)
AS
BEGIN  

  
      DECLARE @isAccount bit = 0;
		     if(@AccountNumber is null or @AccountNumber ='')
                BEGIN
	                  SET @isAccount = 1;
                END

   if(@MessageType is null or @MessageType ='')
	 BEGIN
 --   SELECT (msl.AccountNo +'  ' +ou.FullName) AS [User], 'Outbound' AS [InboundOutbound], msl.TxtMessage AS [Text Message] , msl.DateSend AS [DateTime] 
	--FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTTextMsgSendlog] msl
 --   INNER JOIN  [dbo].[tblOnlineUsers] ou ON  msl.AccountNo = ou.AcctNo
 --   WHERE (msl.DateSend BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND msl.AccountNo = @AccountNumber))
 --   UNION 
 

 
     (SELECT surl.UniqueId  AS [AccountNumber], ou.FullName AS [AccountName],'Outbound' AS [InboundOutbound], surl.Message AS [TextMessage], 
	RIGHT(FORMAT(Cast( surl.SendTo AS bigint),'###-###-####'),12)  AS TextNumber , 
	 CONVERT(DATE, surl.EntryDate) AS [Date] ,CONVERT(varchar(15),CAST(surl.EntryDate AS TIME),8) AS [Time] 
	 FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTStatusUrlInfo] surl
     INNER JOIN  [dbo].[tblOnlineUsers] ou ON  surl.UniqueId = ou.AcctNo
     WHERE (surl.EntryDate BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND surl.UniqueId = @AccountNumber)) AND surl.Status = 100 
     UNION 
     SELECT cburl.UniqueId  AS [AccountNumber], ou.FullName AS [AccountName], 'Inbound' AS [InboundOutbound], cburl.Message AS [TextMessage],
	 RIGHT(FORMAT(Cast( cburl.Phone  AS bigint),'###-###-####'),12) AS TextNumber, 
	 CONVERT(DATE, cburl.EntryDate) AS [Date] ,CONVERT(varchar(15),CAST(cburl.EntryDate AS TIME),8) AS [Time] 
	 FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTCallBackUrlInfo] cburl
     INNER JOIN  [dbo].[tblOnlineUsers] ou ON cburl.UniqueId = ou.AcctNo	
     WHERE (cburl.EntryDate BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND cburl.UniqueId = @AccountNumber)))
	 ORDER BY [Date] , [Time] 
  END

	   if(@MessageType ='Inbound')
	   BEGIN
	       
	           SELECT cburl.UniqueId  AS [AccountNumber], ou.FullName AS [AccountName], 'Inbound' AS [InboundOutbound], cburl.Message AS [TextMessage], 
			  RIGHT(FORMAT(Cast(  cburl.Phone  AS bigint),'###-###-####'),12) AS TextNumber,
			    CONVERT(DATE, cburl.EntryDate) AS [Date] ,CONVERT(varchar(15),CAST(cburl.EntryDate AS TIME),8) AS [Time] 
	           FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTCallBackUrlInfo] cburl
               INNER JOIN  [dbo].[tblOnlineUsers] ou ON cburl.UniqueId = ou.AcctNo	
               WHERE (cburl.EntryDate BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND cburl.UniqueId = @AccountNumber)) Order by  cburl.EntryDate  ,[Time] 
	   END

	   if(@MessageType ='Outbound')
	   BEGIN
	         
	          SELECT surl.UniqueId  AS [AccountNumber], ou.FullName AS [AccountName], 'Outbound' AS [InboundOutbound], surl.Message AS [TextMessage],
			  RIGHT(FORMAT(Cast(surl.SendTo AS bigint),'###-###-####'),12) AS TextNumber  ,
	         CONVERT(DATE, surl.EntryDate) AS [Date] ,CONVERT(varchar(15),CAST(surl.EntryDate AS TIME),8) AS [Time] 
	          FROM [MidAtlanticFinanace-SolutionByText].[dbo].[tblSBTStatusUrlInfo] surl
              INNER JOIN  [dbo].[tblOnlineUsers] ou ON  surl.UniqueId = ou.AcctNo
              WHERE (surl.EntryDate BETWEEN @FromDate  AND  @ToDate ) AND  ((@isAccount = 1) or (@isAccount = 0 AND surl.UniqueId = @AccountNumber)) AND surl.Status = 100 Order by surl.EntryDate  ,[Time] 
	   END

	   
END
GO
/****** Object:  StoredProcedure [dbo].[sp_rpt_GetUserLogin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		CHETU	
-- Create date: 12/28/2016
-- Description:	Procedure to get data for User Login Report
-- [dbo].[sp_rpt_GetUserLogin] '01/16/2017','01/22/2017','311676'
-- =============================================

CREATE PROCEDURE [dbo].[sp_rpt_GetUserLogin]

@FromDate dateTime,
@ToDate dateTime,
@AccountNumber VARCHAR(10)
AS
BEGIN

DECLARE @isAll bit = 0;
if(@AccountNumber is null or @AccountNumber ='')
BEGIN
	SET @isAll = 1;
END

         SELECT onu.AcctNo AS AccountNumber,onu.FullName AS Name,
		 CONVERT(DATE, alog.ActionLogDate) AS [LoginDate] ,CONVERT(varchar(15),CAST(alog.ActionLogDate AS TIME),8) AS [LoginTime]  ,
		 --SUBSTRING(alog.ActionLogEntry, CHARINDEX( '@',CAST(alog.ActionLogEntry as varchar(max))), LEN(alog.ActioNLogEntry)),
		 CASE WHEN CHARINDEX('@',CAST(ActionLogEntry as varchar(max))) > 0 
		 THEN
			SUBSTRING(CAST(ActionLogEntry as varchar(max)), CHARINDEX('@',CAST(ActionLogEntry as varchar(max))) + 1, LEN(CAST(ActionLogEntry as varchar(max))))
		 ELSE null END as IPAddress
		 FROM tblOnlineUsers onu
         LEFT JOIN  tblaccounts acct
         ON onu.AcctNo = acct.AcctNo
         INNER JOIN Collection.dbo.tblactionlog alog
         ON alog.ActionLogAccountID = acct.AccountId AND alog.ActionLogType = 'WEB' AND alog.ActionLogSubType = 'LOG'
         WHERE  (alog.ActionLogDate BETWEEN @FromDate  AND  @ToDate ) 
		 AND ((@isAll = 1) OR (@isAll = 0 AND onu.AcctNo = @AccountNumber))
         ORDER BY [LoginDate], [LoginTime], onu.AcctNo
		 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAutoPayAch]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_UpdateAutoPayAch]
(
	@Confirmation VARCHAR(15),	
	@AcctNo VARCHAR(10),	
	@TranPayment MONEY,
	@TranFee MONEY,
	@BankABA VARCHAR(9),	
	@BankAcctNo VARCHAR(17),	
	@BankName VARCHAR(50),	
	@BankHolder VARCHAR(50),
	@BankAcctType VARCHAR(1),
	@BankAccountName varchar(50),
	@ScheduleMethod varchar(30),
	@Email varchar(50),
	@paymentFrequency varchar(100),
	@ScheduleID varchar(12),
	@SaveAccountFuture  bit,
	@UpdatedPhone VARCHAR(12)
    

)
as
   
Begin
	If  exists( Select 1 
	from tblschedulepaymentsetup 
	where AcctNo = @Acctno and ScheduleID = @ScheduleID and IsActive =1 and IsDeleted = 0)
	begin
		update 	tblschedulepaymentsetup
		set SubscriptionId = null,
		ConfirmationNumber = @Confirmation,
		TranAmount=@TranPayment ,TranFee = @TranFee,
		BankABA=@BankABA,BankAcctNo= @BankAcctNo,
		BankName=@BankName,BankHolder= @BankAccountName,
		BankAcctType = @BankAcctType,
		paymentFrequency=@paymentFrequency,CreatedBy=@BankHolder, 
		IsAutoPay = 1,CreatedDate = getdate() 
		where AcctNo = @Acctno and ScheduleID = @ScheduleID and IsActive = 1 AND IsDeleted = 0
		
	end

	
	if(@SaveAccountFuture = 1)
		begin
			If NOT exists( Select 1 from tblSavedACH where BankAcctNo = @BankAcctNo and AcctNo = @AcctNo and PrimaryNumber = @UpdatedPhone  and BankABA = @BankABA and Email = @Email and IsActive = 1)		
			begin
				INSERT INTO tblSavedACH (AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,CreatedBy,Email,PrimaryNumber,CreatedDate,IsActive)
				VALUES (@AcctNo, @BankABA, @BankAcctNo, @BankName, @BankAccountName, @BankAcctType,@BankHolder,@Email,@UpdatedPhone,getdate(),'1')
			end
		end
	
End

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateAutoPayConfirmationNumber]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 10/06/2016
-- Description:	Procedure to update autopay web confirmation number
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateAutoPayConfirmationNumber]
@accountNumber varchar(10),
@confirmationNumber varchar(15)
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE tblSchedulePaymentSetup
	SET WebConfirmationNumber = @confirmationNumber
	WHERE 
	AcctNo = @accountNumber
	AND IsActive = 1 
	AND IsVerified = 0
	AND IsAutoPay = 1 
	AND IsFuturePay = 0
	AND IsDeleted = 0
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateMAFAccountConsecutiveNSFStatus]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateMAFAccountConsecutiveNSFStatus]
 AS	
BEGIN

	DECLARE @AccountTable TABLE
	(AcctNo varchar(10))

	-- get account number with active autopay or future pay
	INSERT INTO @AccountTable
	SELECT DISTINCT AcctNo 
	FROM tblSchedulePaymentSetup sp 
	INNER JOIN tblSchedulePaymentDetails spd
	ON sp.ScheduleId = spd.ScheduleID AND 
	(sp.IsFuturePay = 1 OR (sp.IsAutoPay = 1 AND sp.IsVerified = 1)) AND sp.IsActive = 1
	AND sp.IsDeleted = 0 AND spd.IsActive = 1 AND spd.[Status] = 'Pending'

	-- get account number with active autopay or future pay
	INSERT INTO @AccountTable
	SELECT DISTINCT AcctNo
	FROM tblPayByTextSetup pbt
	WHERE pbt.IsActive = 1 AND pbt.IsDeleted = 0

	IF OBJECT_ID ('tempdb..#tblpmthistory') IS NOT NULL
		DROP TABLE #tblpmthistory;

	SELECT a.TranCOde atc, b.TranCode btc, a.RefNo arn, b.RefNo as RefNo, a.AcctNo, a.SeqNo
	INTO #tblpmthistory
	FROM
		(select * 
		from collection.dbo.tblpmthistory 
		where AcctNo IN (SELECT AcctNo FROM @AccountTable)
		AND TranCode IN ('PA', 'PY') ) a
	LEFT OUTER JOIN
		(select * 
		from collection.dbo.tblpmthistory 
		where AcctNo IN (SELECT AcctNo FROM @AccountTable)
		AND TranCode = 'RV' AND RefNo = 'NSF') b
	ON a.SeqNo = b.RevSeq AND b.SeqNo = a.RevBy
	order by a.SeqNo desc

	 ----------------------3 NSF Count ------------------------
	 -----------------------Cancel Schedule Payment-----------
	   update tblschedulepaymentdetails set Status='Cancelled', IsActive = 0 where ID 
		                                 in( select 
					                     DISTINCT  d.Id --, count(d.Id) as NSFCount
					                     from tblschedulepaymentsetup s 
					                     inner join #tblpmthistory a on (s.acctno=a.acctno)
					                     inner join tblschedulepaymentdetails d on s.scheduleid=d.scheduleid
					                     where 
					                     a.RefNo='NSF' and 
					                     s.BankAcctType in ('S','P') 
					                     and a.AcctNo 
					                     in (select Top 3 AcctNo 
					                     from #tblpmthistory 
					                     where AcctNo=a.acctno 
					                     )
					                     group by d.Id
					                     HAVING count(d.Id) in(3)	
										 )

	   update tblschedulepaymentsetup set isdeleted =1 where scheduleid
	                                    in ( select 
					                     DISTINCT  d.Id --, count(d.Id) as NSFCount
					                     from tblschedulepaymentsetup s 
					                     inner join #tblpmthistory a on (s.acctno=a.acctno)
					                     inner join tblschedulepaymentdetails d on s.scheduleid=d.scheduleid
					                     where 
					                     a.RefNo='NSF' and 
					                     s.BankAcctType in ('S','P') 
					                     and a.AcctNo 
					                     in (select Top 3 AcctNo 
					                     from #tblpmthistory 
					                     where AcctNo=a.acctno 
					                     )
					                     group by d.Id
					                     HAVING count(d.Id) in(3)
                                         )

	   ----------------------Delete Pay ByText Setup ----
	   UPDATE tblPayByTextSetup set IsDeleted = 1 where AcctNo 
	                                                          in(
	                                                              select 
                                                                  DISTINCT a.acctno  as AcctNo --, count(a.acctno) as NSFCount
	                                                              from tblPayByTextSetup s 
	                                                              inner join #tblpmthistory a on (s.acctno=a.acctno)	
	                                                              where 
	                                                              s.BankAcctType IN ('S', 'P') and a.RefNo='NSF' 
	                                                              and a.AcctNo 
	                                                              in (
	                                                              select Top 3 AcctNo 
																 from #tblpmthistory 
																 where AcctNo=a.acctno )
	                                                              group by a.acctno
	                                                              HAVING count(a.acctno) in(3)
	                                                              )


	--=========Commented because no need to block credit card and ach will be blocked based on above statements
	  ------------------------6 NSF Count ------------------------

	  -------------------------Cancel Schedule Payment-----------
	  -- update tblschedulepaymentdetails set Status='Cancelled', IsActive = 0 where ID 
		 --                                in( select 
			--		                     DISTINCT  d.Id --, count(d.Id) as NSFCount
			--		                     from tblschedulepaymentsetup s 
			--		                     inner join #tblpmthistory a on (s.acctno=a.acctno)
			--		                     inner join tblschedulepaymentdetails d on s.scheduleid=d.scheduleid
			--		                     where 
			--		                     a.RefNo='NSF' and 
			--		                     a.AcctNo 
			--		                     in (select Top 6 AcctNo 
			--		                     from #tblpmthistory 
			--		                     where AcctNo=a.acctno 
			--		                     )
			--							 AND
			--							 (s.IsFuturePay = 1 OR (s.IsAutoPay = 1 AND s.IsVerified = 1)) AND s.IsActive = 1
			--							AND s.IsDeleted = 0 AND d.IsActive = 1 AND d.[Status] = 'Pending'
			--		                     group by d.Id
			--		                     HAVING count(d.Id) in(6)	
			--							 )

	  -- update tblschedulepaymentsetup set isdeleted =1 where scheduleid
	  --                                  in ( select 
			--		                     DISTINCT  d.Id --, count(d.Id) as NSFCount
			--		                     from tblschedulepaymentsetup s 
			--		                     inner join #tblpmthistory a on (s.acctno=a.acctno)
			--		                     inner join tblschedulepaymentdetails d on s.scheduleid=d.scheduleid
			--		                     where 
			--		                     a.RefNo='NSF' and 
			--		                     a.AcctNo 
			--		                     in (select Top 6 AcctNo 
			--		                     from #tblpmthistory 
			--		                     where AcctNo=a.acctno 
			--		                     )
			--							 AND
			--							 (s.IsFuturePay = 1 OR (s.IsAutoPay = 1 AND s.IsVerified = 1)) AND s.IsActive = 1
			--							AND s.IsDeleted = 0 AND d.IsActive = 1 AND d.[Status] = 'Pending'
			--		                     group by d.Id
			--		                     HAVING count(d.Id) in(6)
   --                                      )

	  -- ----------------------Delete Pay ByText Setup ----
	  -- UPDATE tblPayByTextSetup set IsDeleted = 1 where AcctNo 
	  --                                                        in(
	  --                                                            select 
   --                                                               DISTINCT a.acctno  as AcctNo --, count(a.acctno) as NSFCount
	  --                                                            from tblPayByTextSetup s 
	  --                                                            inner join #tblpmthistory a on (s.acctno=a.acctno)	
	  --                                                            where 
	  --                                                            s.IsActive = 1 and s.IsDeleted = 0  and a.RefNo='NSF' 
	  --                                                            and a.AcctNo 
	  --                                                            in (
	  --                                                            select Top 6 AcctNo 
			--													 from #tblpmthistory 
			--													 where AcctNo=a.acctno )
	  --                                                            group by a.acctno
	  --                                                            HAVING count(a.acctno) in(6)
	  --                                                            )
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePayByTextACHSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/27/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdatePayByTextACHSetup] 
	@Confirmation VARCHAR(15),	
	@AcctNo VARCHAR(10),	
	@BankABA VARCHAR(9),	
	@BankAcctNo VARCHAR(17),	
	@BankName VARCHAR(50),	
	@BankHolder VARCHAR(50),
	@BankAcctType VARCHAR(1),
	@CreatedBy varchar(50),
	@Phone VARCHAR(12),
	@Email varchar(50),
	@TextNumber varchar(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
if exists(select top 1 * from tblPayByTextSetup where IsActive =1 and acctno=@AcctNo)
	begin
		update tblPayByTextSetup set
		ConfirmationNumber=@Confirmation,
		BankABA=@BankABA, 
		BankAcctNo=@BankAcctNo,
		BankName=@BankName,
		BankHolder=@BankHolder, 
		TextNumber=@TextNumber,
		BankAcctType=@BankAcctType,
		CreatedDate=getdate(), 
		CreatedBy=@CreatedBy
		 where IsActive =1 and acctno=@AcctNo

		If NOT exists(Select * from tblSavedACH where BankAcctNo = @BankAcctNo and AcctNo = @AcctNo and PrimaryNumber = @Phone and BankABA = @BankABA and Email = @Email AND IsActive = 1  )		
		begin
			INSERT INTO tblSavedACH (AcctNo,  BankABA, BankAcctNo, BankName, BankHolder, BankAcctType,CreatedBy,Email,PrimaryNumber,CreatedDate,IsActive)
			VALUES (@AcctNo, @BankABA, @BankAcctNo, @BankName, @BankHolder, @BankAcctType, @CreatedBy,@Email,@Phone,getdate(),'1')
		end
	end
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdatePayByTextCardSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/27/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdatePayByTextCardSetup]
@ConfirmationId varchar(15),
@Acctno varchar(10),
@TokenId varchar(30),
@CardName varchar(50),
@CardType varchar(50),
@CardNumber varchar(30),
@CardExpiry varchar(30),
@CreatedBy varchar(50),
	@TextNumber varchar(11)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if exists(select top 1 * from tblPayByTextSetup where IsActive =1 and acctno=@AcctNo)
		begin
			update tblPayByTextSetup set
			ConfirmationNumber =@ConfirmationId,
			BankAcctNo=@CardNumber,
			BankHolder=@CardName,
			TextNumber=@TextNumber,
			BankAcctType=@CardType,
			CreatedDate=getdate(),
			SubscriptionId=@TokenId,
			CreatedBy=@CreatedBy
			where IsActive =1 and acctno=@Acctno;

			if not exists (select top 1 * from tblCardSubscriptionInfo where AcctNo=@AcctNo and CardNumber=@CardNumber and CardExpiry=@CardExpiry and CardType=@CardType and isactive=1)
			begin			
				insert into tblCardSubscriptionInfo (AcctNo , SubscriptionId,CardName,CardType, CardNumber , CardExpiry , CreatedDate) values(@Acctno,@TokenId ,@CardName,@CardType, @CardNumber , @CardExpiry , getdate())
			End
		end
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateScheduleTransactionStatus]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chetu
-- Create date: 09/09/2016
-- Description:	Prcedure to get scheduled transactions for Card
-- =============================================

CREATE PROCEDURE [dbo].[sp_UpdateScheduleTransactionStatus]
(@ScheduleDetailsId varchar(10),
@Status varchar(10))
AS
BEGIN
	SET NOCOUNT ON;

	if exists( select top 1 id from tblschedulepaymentdetails where id=@ScheduleDetailsId)
	begin
		update tblschedulepaymentdetails set Status=@Status , isactive=0 where Id=@ScheduleDetailsId;
	End
END

GO
/****** Object:  StoredProcedure [dbo].[sp_updateSecurityQuestions]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[sp_updateSecurityQuestions]
(
@AcctNo varchar(10),
@SecurityID tinyint,
@Answer varchar(50) ,
@SecurityID2 tinyint,
@Answer2 varchar(50) ,
@SecurityID3 tinyint,
@Answer3 varchar(50) 
)
as
begin
update tblOnlineUsers set SecurityID=@SecurityID, Answer=@Answer,SecurityID2=@SecurityID2,Answer2=@Answer2,SecurityID3=@SecurityID3,Answer3=@Answer3 where AcctNo = @AcctNo
end
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateUserProfile]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_UpdateUserProfile]
(@Email varchar(200),
@CellNumber varchar(15) = NULL,
@TextNumber varchar(15) =NULL,
@TextNumber2 varchar(15) =NULL,
@Address1 varchar(max) = NULL,
@AccountNumber varchar(30),
@ProfilePicture varchar(200),
@Address2 varchar(max)=null,
@City varchar(50),
@State varchar(4),
@Zip varchar(12)
)
as
begin
	declare @countCell int , @countTXT int, @accountid int;
	if(@Email is not null and @Email <>'')
	begin
		update tblonlineusers set Email =@Email where AcctNo=@AccountNumber;

		if(@ProfilePicture<>'' and @ProfilePicture is not null)
		begin
		update tblonlineusers set ProfilePicture=@ProfilePicture where AcctNo=@AccountNumber;
		end

		select top 1 @accountid=AccountId from tblaccounts where acctno=@AccountNumber;
	
		if not exists(select top 1 * from tbladdress where Acctno=@AccountNumber and Address1=@Address1 and Address2=@Address2 and City=@City and State=@State and Zip=@Zip order by AddressID desc)
		begin
			insert into tbladdress (Acctno ,Address1 , Address2 , City , State , Zip , Country ,CreatedDate) values (@AccountNumber ,@Address1 , @Address2 , @City , @State , @Zip , 'United States', getdate())
			insert into  collection.dbo.[tblInfoLog] (infologaccountid , InfoLogType , InfoLogSubtype ,InfoLogDate , InfoLogEntry) values (@accountid,'ADD','RES',getdate(),@Address1 +' '+@Address2+' '+@City+' '+@State+' '+@Zip + ' ADDED ' + FORMAT(getdate(),'MM/dd/yyyy hh:mm tt', 'en-US' ));
		END 

		--Insert cell number
			if (not exists(select top 1 * 
						FROM
						(
						SELECT InfoLogEntry,InfoLogID, ROW_NUMBER() OVER (Partition By infologaccountid ORDER BY InfoLogID DESC) as RowNumber 
						FROM collection.dbo.[tblInfoLog] 
						where infologaccountid=@accountid 
						and InfoLogType='TEL' and InfoLogSubtype='CEL' 
						) sub
						WHERE convert(varchar,InfoLogEntry) = @CellNumber AND RowNUmber = 1)
						or (@CellNumber is null or @CellNumber='')
			  )
		begin
			update tblaccounts set UpdatedPhone=@CellNumber , UpdatedPhoneDate=getdate() where acctno=@AccountNumber;
			insert into  collection.dbo.[tblInfoLog] (infologaccountid , InfoLogType , InfoLogSubtype ,InfoLogDate , InfoLogEntry) values (@accountid,'TEL','CEL',getdate(),@CellNumber);
		end
		
		if (not exists(select top 1 * 
						FROM
						(
						SELECT InfoLogEntry,InfoLogID, ROW_NUMBER() OVER (Partition By infologaccountid ORDER BY InfoLogID DESC) as RowNumber 
						FROM collection.dbo.[tblInfoLog] 
						where infologaccountid=@accountid 
						and InfoLogType='TEL' and InfoLogSubtype='TXT1' 
						) sub
						WHERE convert(varchar,InfoLogEntry) = @TextNumber AND RowNUmber = 1)
		OR (@TextNumber is null OR @TextNumber = '')
		)
		begin
		--insert text number 1 and TextNumber2
			insert into  collection.dbo.[tblInfoLog] (infologaccountid , InfoLogType , InfoLogSubtype ,InfoLogDate , InfoLogEntry) values (@accountid,'TEL','TXT1',getdate(),@TextNumber);
		end
		if (not exists(select top 1 * 
						FROM
						(
						SELECT InfoLogEntry,InfoLogID, ROW_NUMBER() OVER (Partition By infologaccountid ORDER BY InfoLogID DESC) as RowNumber 
						FROM collection.dbo.[tblInfoLog] 
						where infologaccountid=@accountid 
						and InfoLogType='TEL' and InfoLogSubtype='TXT2' 
						) sub
						WHERE convert(varchar,InfoLogEntry) = @TextNumber2 AND RowNUmber = 1)
		OR (@TextNumber2 is null OR @TextNumber2 = '')
		)
		begin
			insert into  collection.dbo.[tblInfoLog] (infologaccountid , InfoLogType , InfoLogSubtype ,InfoLogDate , InfoLogEntry) values (@accountid,'TEL','TXT2',getdate(),@TextNumber2);
		End
	end
end



GO
/****** Object:  StoredProcedure [dbo].[spUtil_SearchText]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--drop proc dbo.spUtil_searchText

CREATE PROC [dbo].[spUtil_SearchText] --'3300.90'
(
      @Text VARCHAR(1024)
	, @ExactMatchOnly BIT = 0
	, @ShowNotFoundMsg BIT = 0
)  

AS
SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

DECLARE @ColumnsToSearch TABLE (
													  LineId INT NOT NULL IDENTITY(1,1) PRIMARY KEY
													, SchemaName SYSNAME NOT NULL
													, TableName SYSNAME NOT NULL
													, ColumnName SYSNAME NOT NULL
												)


--Find all string-based columns large enough to hold the text being searched
INSERT INTO @ColumnsToSearch (SchemaName, TableName, ColumnName)
	SELECT 
		c.TABLE_SCHEMA, c.TABLE_NAME, c.COLUMN_NAME
	FROM 
		INFORMATION_SCHEMA.COLUMNS c 
		INNER JOIN 
		INFORMATION_SCHEMA.TABLES t
		ON c.TABLE_SCHEMA=t.TABLE_SCHEMA 
			 AND c.TABLE_NAME = t.TABLE_NAME
	WHERE 
		t.TABLE_TYPE = 'BASE TABLE'
		AND c.DATA_TYPE IN ('varchar', 'nvarchar','char', 'nchar') 
		AND c.CHARACTER_MAXIMUM_LENGTH >= LEN(@Text)

-- Search every column
DECLARE @LineId INT, @FullyQualifiedTableName NVARCHAR(256), @ColumnToSearch SYSNAME, @Sql NVARCHAR(1024)

SELECT @LineId = LineId, @FullyQualifiedTableName = '[' + SchemaName + '].[' + TableName + ']', @ColumnToSearch = '[' + ColumnName + ']' FROM @ColumnsToSearch

WHILE NOT @LineId IS NULL
BEGIN
  -- Create the base query against the table
  SET @Sql = 'SELECT ''' + @FullyQualifiedTableName + '.' + @ColumnToSearch + ''' AS [Table_Column], * FROM ' 
        + @FullyQualifiedTableName + ' WHERE ' + @ColumnToSearch + 
			CASE @ExactMatchOnly
				WHEN 1 THEN '=''' + @Text + ''''
				ELSE ' LIKE ''%' + @Text + '%'''
			END

        -- Only return rows that actually contain the search term otherwise write out a message saying the table/column did not have the criteria
        EXEC ( 'IF EXISTS (' + @Sql + ') ' + @Sql + ' ELSE IF ' + @ShowNotFoundMsg + ' = 1 PRINT ''' + @FullyQualifiedTableName + '.' + @ColumnToSearch + ' - no matches''')
        DELETE @ColumnsToSearch WHERE LineId=@LineId
        SET @LineId = NULL
        SELECT @LineId = LineId, @FullyQualifiedTableName = '[' + SchemaName + '].[' + TableName + ']', @ColumnToSearch = '[' + ColumnName + ']' FROM @ColumnsToSearch
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateLastLogin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateLastLogin] 
	@accountNumber varchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    --Update last login time
	UPDATE tblUsers SET LastLogin = GETDATE()
	WHERE AccountNo = @accountNumber
END

GO
/****** Object:  StoredProcedure [dbo].[updatepassword]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updatepassword] 
	-- Add the parameters for the stored procedure here
	@newpassword varchar(20),
    @email  varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	update tblusers set password=@newpassword , BitReset=1 where  emailid=@email
END
GO
/****** Object:  StoredProcedure [dbo].[updateReserves]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec updatereserves
CREATE PROCEDURE [dbo].[updateReserves] AS
BEGIN
	SET NOCOUNT ON;

	Truncate Table tblDealers

	INSERT INTO tblDealers
    SELECT [DealerID]
          ,[CreatedDate]
          ,[RevisedDate]
          ,[Source]
          ,[AcctNo]
          ,[FedTaxID]
          ,[Name]
          ,[Name2]
          ,[Contact]
          ,[AddrLn1]
          ,[AddrLn2]
          ,[City]
          ,[State]
          ,[Zip]
          ,[PhnMain]
          ,[PhnFax]
          ,[Email]
          ,[StaticCode]
          ,[Notes]
          ,[ACQType]
          ,[MasterGrossRes]
          ,[MasterPrinRes]
          ,[RequiredPercent]
          ,[MasterType]
          ,[BuyBackHold]
          ,[BuyerID]
          ,[DlrUncoop]
          ,[DlrOOB]
          ,[Recourse]
          ,[Excluded]
    FROM [Collection].[dbo].[tblDealers]
	WHERE NOT EXISTS (select * from tblDealers where Collection.dbo.tblDealers.DealerID = tblDealers.DealerID);

	Truncate Table tblAccounts

	INSERT INTO tblAccounts (AccountID, AcctNo, PDData, PDCalc, ApplicantID, DealerID, DealerAcctNo, 
		AcctCurrentBal, AcctClass, AcctType, AcctTerm, AcctFreq, AcctStatusFlag, AcctLoanAmount, 
		AcctIntRate, AcctLossDate, AcctCode, AcctEntryDate, AcctRegPayAmt, AcctDaysPastDue, 
		AcctMidStream, AcctAnticern1, AcctAnticern5, AcctAccern1, AcctAntica1, AcctOrgPurAmt, 
		AcctOrgTerm, AcctAccErn5, AcctReserve1, AcctReserve2, AcctReserve3, AcctOtherBal, 
		RepoCodedDate, ReserveTitleHold, ReserveTitleRelease, AcctIntBal, AcctLCBal, AcctTotLChg, 
		AcctProceeds, VehYear, VehModel, VehType, AcctPastDueAmt, AcctNextDueDate,InsPolicyNo,InsEffDate,InsExpDate,VehVin,AcctPayOff ,RemainingTerm,AcctNextDueAmt)
	SELECT 	AccountID, AcctNo, PDData, PDCalc, ApplicantID, DealerID, DealerAcctNo, AcctCurrentBal, 
		AcctClass, AcctType, AcctTerm, AcctFreq, AcctStatusFlag, AcctLoanAmount, AcctIntRate, 
		AcctLossDate, AcctCode, AcctEntryDate, AcctRegPayAmt, AcctDaysPastDue, AcctMidStream, 
		AcctAnticern1, AcctAnticern5, AcctAccern1, AcctAntica1, AcctOrgPurAmt, AcctOrgTerm, 
		AcctAccErn5, AcctReserve1, AcctReserve2, AcctReserve3, AcctOtherBal, RepoCodedDate, 
		ReserveTitleHold, ReserveTitleRelease, AcctIntBal, AcctLCBal, AcctTotLChg, AcctProceeds, 
		VehYear, VehModel, VehType, AcctDueToday, AcctNextDueDate,InsPolicyNo,InsEffDate,InsExpDate,VehVin,AcctPayOff,		
		case 
		when acctfreq='m' then DATEDIFF(mm, acctnextduedate, acctmaturitydate)
		when acctfreq='w' then DATEDIFF(ww, acctnextduedate, acctmaturitydate)
		when acctfreq='y' then DATEDIFF(yy, acctnextduedate, acctmaturitydate)
		when acctfreq='b' then DATEDIFF(ww, acctnextduedate, acctmaturitydate)/2
		when acctfreq='s' then DATEDIFF(mm, acctnextduedate, acctmaturitydate)/2
		when acctfreq='d' then DATEDIFF(dd, acctnextduedate, acctmaturitydate)
		else null
		end as RemainingTerm , AcctNextDueAmt
	FROM Collection.dbo.tblAccounts
	WHERE 	(Collection.dbo.tblAccounts.AcctEntryDate >= '01/01/2003') 

	Truncate Table tblConsumers

	INSERT INTO tblConsumers (ConsumerID, LastName, FirstName, State)
	SELECT ConsumerID, LastName, FirstName, State
	FROM Collection.dbo.tblConsumers
	WHERE NOT EXISTS (select * 
			from tblConsumers 
			where Collection.dbo.tblConsumers.ConsumerID = tblConsumers.ConsumerID);

	DELETE FROM tblConsumers
	WHERE 	NOT EXISTS (select *
		      from tblAccounts
		      where tblConsumers.ConsumerID = tblAccounts.ApplicantID)

	Truncate Table tblVehicles

	INSERT INTO tblVehicles (AcctNo, ApplicantID, VehYear, VehModel, VehType, VehBody, VehMiles, VehColor, VehVin, VehVin6)
	SELECT AcctNo, ApplicantID, VehYear, VehModel, VehType, VehBody, VehMiles, VehColor, VehVin, VehVin6
	FROM 	Collection.dbo.tblAccounts
	WHERE NOT EXISTS (select * 
		      from tblVehicles
		      where Collection.dbo.tblAccounts.AcctNo = tblVehicles.AcctNo)

	DELETE 
	FROM 	tblVehicles
	WHERE 	NOT EXISTS (select *
		      from tblAccounts
		      where tblVehicles.ApplicantID = tblAccounts.ApplicantID)

	Truncate Table reservesRegular

	INSERT INTO reservesRegular
    SELECT [ReserveID]
      ,[DlrAcctNo]
      ,[TranDate]
      ,[TranType]
      ,[TranEnteredBy]
      ,[TranDesc]
      ,[TranNote]
      ,[RegInc]
      ,[RegDec]
      ,[QDate]
      ,[AcctNo]
    FROM [Collection].[dbo].[reservesRegular]
	WHERE NOT EXISTS (select * from reservesRegular where Collection.dbo.reservesRegular.ReserveID = reservesRegular.ReserveID);

	--Updates Collections Database if Accounts Ever hits the Contractual 30's
	Update [Collection].[dbo].tblAccounts Set [Collection].[dbo].tblAccounts.Ever30s = GetDate() 
	Where [Collection].[dbo].tblAccounts.AcctPastDueAmt = 30.0 and [Collection].[dbo].tblAccounts.Ever30s is null

	--Updates Collections Database if Accounts Ever hits 35 Days Past Due
	Update [Collection].[dbo].tblAccounts Set [Collection].[dbo].tblAccounts.Ever35s = GetDate() 
	Where [Collection].[dbo].tblAccounts.AcctDaysPastDue = 35 and [Collection].[dbo].tblAccounts.Ever35s is null

	--Updates LastPaidRefCode on Collections Database tblAccounts
	Update [Collection].[dbo].tblAccounts 
	Set LastPaidRefCode = 
		(	
			Select Top 1 [Collection].[dbo].tblPmtHistory.RefNo 
			From [Collection].[dbo].tblPmtHistory 
			Where [Collection].[dbo].tblPmtHistory.AcctNo = [Collection].[dbo].tblAccounts.AcctNo 
			Order by SeqNo Desc	
		)
	Where EXISTS 
		(	
			Select Top 1 [Collection].[dbo].tblPmtHistory.RefNo 
			From [Collection].[dbo].tblPmtHistory 
			Where [Collection].[dbo].tblPmtHistory.AcctNo = [Collection].[dbo].tblAccounts.AcctNo
			Order by SeqNo Desc	
		)

	/* This update fixes all pushed accounts first transaction in Payment History */
	Update [Collection].[dbo].tblPmtHistory Set PostedDate = PayDate Where SeqNo = 1 And PostedDate = '1900-01-01 00:00:00.000' 


	/* This block is temporal until La Fiesta issue is solved */
	Update tblAccounts Set AcctCurrentBal = 1719.91 Where AcctNo = '174679'
	Update tblAccounts Set AcctCurrentBal = 951.41 Where AcctNo = '174692'
	Update tblAccounts Set AcctCurrentBal = 2917.73 Where AcctNo = '174694'
	Update tblAccounts Set AcctCurrentBal = 2438.25 Where AcctNo = '174697'
	Update tblAccounts Set AcctCurrentBal = 5532.61 Where AcctNo = '174698'
	Update tblAccounts Set AcctCurrentBal = 3080.25 Where AcctNo = '174699'
	Update tblAccounts Set AcctCurrentBal = 3626.67 Where AcctNo = '174716'
	Update tblAccounts Set AcctCurrentBal = 314.02 Where AcctNo = '174717'
	Update tblAccounts Set AcctCurrentBal = 5135.73 Where AcctNo = '174729'
	Update tblAccounts Set AcctCurrentBal = 3458.8 Where AcctNo = '174734'
	Update tblAccounts Set AcctCurrentBal = 971.03 Where AcctNo = '174763'
	Update tblAccounts Set AcctCurrentBal = 7142.91 Where AcctNo = '174781'
	Update tblAccounts Set AcctCurrentBal = 2552.7 Where AcctNo = '174823'
	Update tblAccounts Set AcctCurrentBal = 1173.58 Where AcctNo = '174824'
	Update tblAccounts Set AcctCurrentBal = 135.48 Where AcctNo = '174833'
	Update tblAccounts Set AcctCurrentBal = 5835.27 Where AcctNo = '174836'
	Update tblAccounts Set AcctCurrentBal = 6134.63 Where AcctNo = '174840'
	Update tblAccounts Set AcctCurrentBal = 8309.13 Where AcctNo = '174842'
	Update tblAccounts Set AcctCurrentBal = 1136.44 Where AcctNo = '174861'
	Update tblAccounts Set AcctCurrentBal = 923.07 Where AcctNo = '174865'
	Update tblAccounts Set AcctCurrentBal = 2142.57 Where AcctNo = '174868'
	Update tblAccounts Set AcctCurrentBal = 6684.82 Where AcctNo = '174873'
	Update tblAccounts Set AcctCurrentBal = 7081.59 Where AcctNo = '174876'
	Update tblAccounts Set AcctCurrentBal = 5497.19 Where AcctNo = '174895'
	Update tblAccounts Set AcctCurrentBal = 2545.12 Where AcctNo = '174910'
	Update tblAccounts Set AcctCurrentBal = 2981.87 Where AcctNo = '174975'
	Update tblAccounts Set AcctCurrentBal = 7613.37 Where AcctNo = '174984'
	Update tblAccounts Set AcctCurrentBal = 3868.03 Where AcctNo = '174985'
	Update tblAccounts Set AcctCurrentBal = 6051.63 Where AcctNo = '174989'
	Update tblAccounts Set AcctCurrentBal = 5170.54 Where AcctNo = '174995'
	Update tblAccounts Set AcctCurrentBal = 5437.48 Where AcctNo = '174999'
	Update tblAccounts Set AcctCurrentBal = 5678.22 Where AcctNo = '175002'
	Update tblAccounts Set AcctCurrentBal = 2865.45 Where AcctNo = '175008'
	Update tblAccounts Set AcctCurrentBal = 3457.15 Where AcctNo = '175009'
	Update tblAccounts Set AcctCurrentBal = 6993.45 Where AcctNo = '175018'
	Update tblAccounts Set AcctCurrentBal = 4510.96 Where AcctNo = '175031'
	Update tblAccounts Set AcctCurrentBal = 6920.84 Where AcctNo = '175036'
	Update tblAccounts Set AcctCurrentBal = 8777.11 Where AcctNo = '175047'
	Update tblAccounts Set AcctCurrentBal = 3714.43 Where AcctNo = '175051'
	Update tblAccounts Set AcctCurrentBal = 2366.48 Where AcctNo = '175054'
	Update tblAccounts Set AcctCurrentBal = 3127.16 Where AcctNo = '175065'
	Update tblAccounts Set AcctCurrentBal = 3362.66 Where AcctNo = '175066'
	Update tblAccounts Set AcctCurrentBal = 4708.98 Where AcctNo = '175073'
	Update tblAccounts Set AcctCurrentBal = 5027.07 Where AcctNo = '175093'
	Update tblAccounts Set AcctCurrentBal = 8547.48 Where AcctNo = '175103'
	Update tblAccounts Set AcctCurrentBal = 3210.11 Where AcctNo = '175104'
	Update tblAccounts Set AcctCurrentBal = 3904.04 Where AcctNo = '175113'
	Update tblAccounts Set AcctCurrentBal = 7989.31 Where AcctNo = '175154'
	Update tblAccounts Set AcctCurrentBal = 3663.42 Where AcctNo = '175160'
	Update tblAccounts Set AcctCurrentBal = 3538.85 Where AcctNo = '175177'
	Update tblAccounts Set AcctCurrentBal = 4244.68 Where AcctNo = '175185'
	Update tblAccounts Set AcctCurrentBal = 3619.69 Where AcctNo = '175191'
	Update tblAccounts Set AcctCurrentBal = 5274.32 Where AcctNo = '175192'
	Update tblAccounts Set AcctCurrentBal = 2499.3 Where AcctNo = '175198'
	Update tblAccounts Set AcctCurrentBal = 1864.61 Where AcctNo = '175201'
	Update tblAccounts Set AcctCurrentBal = 5625.69 Where AcctNo = '175209'
	Update tblAccounts Set AcctCurrentBal = 3116.4 Where AcctNo = '175216'
	Update tblAccounts Set AcctCurrentBal = 3542.22 Where AcctNo = '175226'
	Update tblAccounts Set AcctCurrentBal = 6992.59 Where AcctNo = '175241'
	Update tblAccounts Set AcctCurrentBal = 4452.64 Where AcctNo = '175245'
	Update tblAccounts Set AcctCurrentBal = 2300.25 Where AcctNo = '175247'
	Update tblAccounts Set AcctCurrentBal = 3859.38 Where AcctNo = '175250'
	Update tblAccounts Set AcctCurrentBal = 2037.59 Where AcctNo = '175275'
	Update tblAccounts Set AcctCurrentBal = 524.48 Where AcctNo = '175280'
	Update tblAccounts Set AcctCurrentBal = 3040.78 Where AcctNo = '175288'
	Update tblAccounts Set AcctCurrentBal = 3631.29 Where AcctNo = '175307'
	Update tblAccounts Set AcctCurrentBal = 3809.3 Where AcctNo = '175318'
	Update tblAccounts Set AcctCurrentBal = 2556.8 Where AcctNo = '175369'
	Update tblAccounts Set AcctCurrentBal = 3911.1 Where AcctNo = '175370'
	Update tblAccounts Set AcctCurrentBal = 3509.63 Where AcctNo = '175377'
	Update tblAccounts Set AcctCurrentBal = 2699.48 Where AcctNo = '175383'
	Update tblAccounts Set AcctCurrentBal = 7494.01 Where AcctNo = '175391'
	Update tblAccounts Set AcctCurrentBal = 5082.96 Where AcctNo = '175401'
	Update tblAccounts Set AcctCurrentBal = 2266.3 Where AcctNo = '175410'
	Update tblAccounts Set AcctCurrentBal = 4869.71 Where AcctNo = '175414'
	Update tblAccounts Set AcctCurrentBal = 5968.07 Where AcctNo = '175418'
	Update tblAccounts Set AcctCurrentBal = 193.9 Where AcctNo = '175430'
	Update tblAccounts Set AcctCurrentBal = 7978.48 Where AcctNo = '175454'
	Update tblAccounts Set AcctCurrentBal = 7942.25 Where AcctNo = '175464'
	Update tblAccounts Set AcctCurrentBal = 5849.49 Where AcctNo = '175471'
	Update tblAccounts Set AcctCurrentBal = 3647.86 Where AcctNo = '175493'
	Update tblAccounts Set AcctCurrentBal = 6550.77 Where AcctNo = '175503'
	Update tblAccounts Set AcctCurrentBal = 3358.79 Where AcctNo = '175517'
	Update tblAccounts Set AcctCurrentBal = 2886.28 Where AcctNo = '175527'
	Update tblAccounts Set AcctCurrentBal = 5401.58 Where AcctNo = '175531'
	Update tblAccounts Set AcctCurrentBal = 3946.09 Where AcctNo = '175540'
	Update tblAccounts Set AcctCurrentBal = 4936.91 Where AcctNo = '175549'
	Update tblAccounts Set AcctCurrentBal = 2317.66 Where AcctNo = '175554'
	Update tblAccounts Set AcctCurrentBal = 4704.77 Where AcctNo = '175562'
	Update tblAccounts Set AcctCurrentBal = 6469.36 Where AcctNo = '175573'
	Update tblAccounts Set AcctCurrentBal = 3400.34 Where AcctNo = '175582'
	Update tblAccounts Set AcctCurrentBal = 6918.09 Where AcctNo = '175602'
	Update tblAccounts Set AcctCurrentBal = 4046.22 Where AcctNo = '175610'
	Update tblAccounts Set AcctCurrentBal = 3201.5 Where AcctNo = '175622'
	Update tblAccounts Set AcctCurrentBal = 4995.07 Where AcctNo = '175624'
	Update tblAccounts Set AcctCurrentBal = 6021.31 Where AcctNo = '175652'
	Update tblAccounts Set AcctCurrentBal = 3916.48 Where AcctNo = '175653'
	Update tblAccounts Set AcctCurrentBal = 4134.18 Where AcctNo = '175656'
	Update tblAccounts Set AcctCurrentBal = 1344.5 Where AcctNo = '175672'
	Update tblAccounts Set AcctCurrentBal = 7984.57 Where AcctNo = '175681'
	Update tblAccounts Set AcctCurrentBal = 6428.64 Where AcctNo = '175691'
	Update tblAccounts Set AcctCurrentBal = 4725.73 Where AcctNo = '175695'
	Update tblAccounts Set AcctCurrentBal = 3736.9 Where AcctNo = '175707'
	Update tblAccounts Set AcctCurrentBal = 3419.82 Where AcctNo = '175713'
	Update tblAccounts Set AcctCurrentBal = 5230.33 Where AcctNo = '175747'
	Update tblAccounts Set AcctCurrentBal = 5516.45 Where AcctNo = '175761'
	Update tblAccounts Set AcctCurrentBal = 4373.45 Where AcctNo = '175775'
	Update tblAccounts Set AcctCurrentBal = 1972.8 Where AcctNo = '175780'
	Update tblAccounts Set AcctCurrentBal = 4970.84 Where AcctNo = '175783'
	Update tblAccounts Set AcctCurrentBal = 3999.06 Where AcctNo = '175786'
	Update tblAccounts Set AcctCurrentBal = 1258.71 Where AcctNo = '175793'
	Update tblAccounts Set AcctCurrentBal = 3693.26 Where AcctNo = '175797'
	Update tblAccounts Set AcctCurrentBal = 3948.43 Where AcctNo = '175800'
	Update tblAccounts Set AcctCurrentBal = 1921.56 Where AcctNo = '175803'
	Update tblAccounts Set AcctCurrentBal = 565.82 Where AcctNo = '175809'
	Update tblAccounts Set AcctCurrentBal = 1983.7 Where AcctNo = '175832'
	Update tblAccounts Set AcctCurrentBal = 2482.22 Where AcctNo = '175845'
	Update tblAccounts Set AcctCurrentBal = 4924.91 Where AcctNo = '175870'
	Update tblAccounts Set AcctCurrentBal = 3856.82 Where AcctNo = '175884'
	Update tblAccounts Set AcctCurrentBal = 4778.11 Where AcctNo = '175945'
	Update tblAccounts Set AcctCurrentBal = 2284.51 Where AcctNo = '175956'
	Update tblAccounts Set AcctCurrentBal = 6087.37 Where AcctNo = '175961'
	Update tblAccounts Set AcctCurrentBal = 4267.71 Where AcctNo = '175964'
	Update tblAccounts Set AcctCurrentBal = 3913.08 Where AcctNo = '175966'
	Update tblAccounts Set AcctCurrentBal = 1631.64 Where AcctNo = '175985'
	Update tblAccounts Set AcctCurrentBal = 4935.2 Where AcctNo = '175993'
	Update tblAccounts Set AcctCurrentBal = 700.02 Where AcctNo = '175999'
	Update tblAccounts Set AcctCurrentBal = 1746.01 Where AcctNo = '176021'
	Update tblAccounts Set AcctCurrentBal = 1987.94 Where AcctNo = '176023'
	Update tblAccounts Set AcctCurrentBal = 5439.14 Where AcctNo = '176026'
	Update tblAccounts Set AcctCurrentBal = 2637.71 Where AcctNo = '176033'
	Update tblAccounts Set AcctCurrentBal = 3202.47 Where AcctNo = '176034'
	Update tblAccounts Set AcctCurrentBal = 5454.83 Where AcctNo = '176037'
	Update tblAccounts Set AcctCurrentBal = 2298.82 Where AcctNo = '176063'
	Update tblAccounts Set AcctCurrentBal = 3890.04 Where AcctNo = '176071'
	Update tblAccounts Set AcctCurrentBal = 2701.61 Where AcctNo = '176072'
	Update tblAccounts Set AcctCurrentBal = 2623.23 Where AcctNo = '176083'
	Update tblAccounts Set AcctCurrentBal = 4824.89 Where AcctNo = '176096'
	Update tblAccounts Set AcctCurrentBal = 2424.49 Where AcctNo = '176098'
	Update tblAccounts Set AcctCurrentBal = 4570.99 Where AcctNo = '176112'
	Update tblAccounts Set AcctCurrentBal = 3088.81 Where AcctNo = '176141'
	Update tblAccounts Set AcctCurrentBal = 5455.73 Where AcctNo = '176158'
	Update tblAccounts Set AcctCurrentBal = 927.87 Where AcctNo = '176161'
	Update tblAccounts Set AcctCurrentBal = 937.53 Where AcctNo = '176180'
	Update tblAccounts Set AcctCurrentBal = 1297.66 Where AcctNo = '176188'
	Update tblAccounts Set AcctCurrentBal = 3328.93 Where AcctNo = '176200'
	Update tblAccounts Set AcctCurrentBal = 4327.16 Where AcctNo = '176204'
	Update tblAccounts Set AcctCurrentBal = 5927.05 Where AcctNo = '176220'

	Update ReservesRegular Set DlrAcctNo = '0.00', AcctNo = '0' Where AcctNo = '174678' 
	Update ReservesRegular Set DlrAcctNo = '0.00', AcctNo = '0' Where AcctNo = '176159' 
	/* End of block */
END








GO
/****** Object:  StoredProcedure [dbo].[updateuser]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[updateuser] 
	-- Add the parameters for the stored procedure here
		
    @emailid varchar(50),
    @userid varchar(50),
    @name  varchar(50),
	@phone varchar(50),
	@passw varchar(50),
	@reset bit,
	@login bit
  
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	update  tblUsers 
	set EmailId=@emailid, Name=@name, Telephone=@phone, Password=@passw, BitReset=@reset, Disabled=@login 
	where UserId=@userid
END








GO
/****** Object:  StoredProcedure [dbo].[userDemologin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[userDemologin]
	-- Add the parameters for the stored procedure here
	@dealerno varchar(15),
	@username  varchar(50),
	@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select userId,UserName,Password,EmailId,AccountNo,BitReset,Name,Telephone,int_UserType
	from tblDemoUsers where tblDemoUsers.username=@username and
		substring(accountno,1,PATINDEX('%.%',accountno) -1 )=@dealerno and 
	tblDemousers.password=@password 

Insert Into tblHistoryLog (Username, Password, LogInTime, DealerNo)
	Values (@username, @password, getDate(), @dealerno)


END
GO
/****** Object:  StoredProcedure [dbo].[userlogin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[userlogin]
	-- Add the parameters for the stored procedure here
@dealerno varchar(15),
@username  varchar(50),
@password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/*
		select tblDealers.mastertype,tblDealers.DealerId,tblDealers.acctno,tblUsers.int_usertype from tblDealers,tblUsers where tblUsers.username=@username and
 substring(tbldealers.acctno,1,4)=@acctno and tblusers.password=@password and 
tblusers.accountno=tbldealers.acctno */

	select top 1 userId,UserName,Password,EmailId,AccountNo,BitReset,Name,Telephone,int_UserType,Disabled
	from tblUsers where tblUsers.username=@username and
	 substring(accountno,1,PATINDEX('%.%',accountno) -1 )=@dealerno and 
	tblusers.password=@password 

	Insert Into tblHistoryLog (Username, Password, LogInTime, DealerNo)
	Values (@username, @password, getDate(), @dealerno)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_CancelSchedulePayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_CancelSchedulePayment]
(@Id int)
as
	begin
	if exists( select id from tblschedulepaymentdetails where id=@Id)
	begin
		update tblschedulepaymentdetails set Status='Cancelled', IsActive = 0 where Id=@Id;
		update tblschedulepaymentsetup set isdeleted =1 where scheduleid=(select top 1 scheduleid from tblschedulepaymentdetails where id=@id);
	end
	end


	

GO
/****** Object:  StoredProcedure [dbo].[USP_CheckACNPayment]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_CheckACNPayment](
@AcctNo varchar(10) )
as
	begin
		Select AcceptedPayments From SQL1.PayAssist.dbo.tblAccounts where acctno=@AcctNo;
	end

GO
/****** Object:  StoredProcedure [dbo].[USP_CheckCardMaxLimit]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[USP_CheckCardMaxLimit]
(@AcctNo varchar(10),
@CardNumber varchar(4),
@CardName varchar(50),
@CardExpiry varchar(12),
@TokenId varchar(50))
as
	begin
		Declare @ReturnVal varchar(20);

		SET @ReturnVal = null;
		if(@TokenId is not null and @TokenId <> '')
			Begin
				select @ReturnVal=count(Acctno) from tblcardtransactionlog where acctno=@acctno 
							--and convert(date,CreatedDate)= convert(date,getdate())
							AND DATEDIFF(DAY, CreatedDate, GETDATE()) = 0
							and SubscriptionId=@TokenId
							and ReasonCode<>'100'
			End

		Else
			Begin
				select @ReturnVal=count(Acctno) from tblcardtransactionlog where acctno=@acctno 
							--and convert(date,CreatedDate)= convert(date,getdate())
							AND DATEDIFF(DAY, CreatedDate, GETDATE()) = 0
							and CardName=@CardName and CardNumber=@CardNumber and CardExpiry=@CardExpiry
							and ReasonCode<>'100'
			End

		if(@ReturnVal>=5)
			begin
			    set	@ReturnVal='Blocked'
			end

		select @ReturnVal as CardMaxLimit;
	end

GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteCard]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_DeleteCard]
(@tokenId varchar(30))
as
	begin
		update tblCardSubscriptionInfo set IsActive=0 where SubscriptionId=@tokenId;
	End


GO
/****** Object:  StoredProcedure [dbo].[USP_GetBillingAddress]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--[USP_GetBillingAddress1] '311676',''
CREATE proc [dbo].[USP_GetBillingAddress]
(@AcctNo varchar(10),
@TokeinId varchar(30))
as
	begin
		if(@TokeinId is not null and @TokeinId<> '' and @TokeinId<> '0')
			Begin
				select top 1 AddressId,CardSubscriptionID,AcctNo as AccountNumber,FirstName,LastName,
						PrimaryNumber,EmailID,Address,City,State,Zip,Country from tblbillingaddress where AcctNo=@AcctNo and CardSubscriptionId=@TokeinId and IsActive=1 order by addressid desc;
			End
		else
			Begin
				select top 1 AddressId,CardSubscriptionID,AcctNo as AccountNumber,FirstName,LastName,
						PrimaryNumber,EmailID,Address,City,State,Zip,Country from tblbillingaddress where AcctNo=@AcctNo and IsActive=1 order by addressid desc;
			End		
	End
	

GO
/****** Object:  StoredProcedure [dbo].[USP_GetCardSbscriptionInfo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetCardSbscriptionInfo]
(@AcctNo varchar(10))
	as
		begin
			SELECT * FROM (select a.SubscriptionId as TokenId,a.CardName,a.CardType, a.CardNumber , a.CardExpiry, a.LogId from 
(select s.SubscriptionId,s.CardName,s.CardType, s.CardNumber , s.CardExpiry ,l.logid, row_number() over( partition by s.SubscriptionId order by l.logid desc) as rownumber from tblCardSubscriptionInfo s 
inner join tblcardtransactionlog l on s.SubscriptionId=l.SubscriptionId where s.Acctno=@AcctNo and s.isactive=1 )
a where rownumber=1) b ORDER BY Logid asc
		end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetInsuranceCompanyList]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetInsuranceCompanyList]
as
begin
select Id , InsCompany as InsuranceCompanyName from tblInsuranceCompanyList where IsActive=1;
end

GO
/****** Object:  StoredProcedure [dbo].[USP_GetPaymentSchedule]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[USP_GetPaymentSchedule] '311676'
CREATE proc [dbo].[USP_GetPaymentSchedule]
@Acctno varchar(20)
as
begin
select 
    s.acctno as AccountNumber,
	s.ConfirmationNumber,
	s.createddate as CreatedDate,
	AcctNextDueDate as DueDate , PaymentFrequency =
	case a.acctfreq
	when 'W' then 'Weekly'
	when 'M' then 'Monthly'
	when 'Y' then 'Yearly'
	when 'B' then 'Bi-Weekly' 
	when 'S' then 'Semi-Monthly'
	when 'D' then 'Daily' else 'Not Available' end  , 
	d.ScheduledDate as scheduledate ,	  
	 convert(varchar(10),(s.TranAmount + s.TranFee)) as ScheduledAmount ,
	 s.BankAcctType as ScheduleMethod,
	 case when(s.IsAutoPay=1) then 'Recurring'
	 when(s.IsFuturePay=1) then 'Scheduled' else 'Not Available' end as PaymentMode
	, d.Id , d.Status,d.isactive
	from tblschedulepaymentsetup s 
	inner join tblaccounts a on s.acctno=a.acctno
	 inner join tblschedulepaymentdetails d on s.scheduleid=d.scheduleid
	 where s.acctno=@Acctno and s.IsVerified = 1 
	 order by d.ScheduledDate
	 ;

end


GO
/****** Object:  StoredProcedure [dbo].[USP_GetPreMailPaymentDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_GetPreMailPaymentDetails]
as
begin
	select  a.Acctno ,u.FullName ,a.acctnextdueamt as Amount, a.acctnextduedate as DueDate  from tblaccounts a inner join tblonlineusers u on a.acctno=u.acctno where 
		convert (varchar(10),acctnextduedate,120)=CONVERT(VARCHAR(10), DATEADD(day,2,GETDATE()), 120) and a.acctnextdueamt is not null and a.acctnextdueamt<>0.00;
End

GO
/****** Object:  StoredProcedure [dbo].[USP_GetScheuleServiceDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec USP_GetScheuleServiceDetails 311676
CREATE proc [dbo].[USP_GetScheuleServiceDetails]
(@AcctNo varchar(10))
	as	
		begin
			select d.acctno, 
			 d.TranDate ,
			 d.TranPayment, 
			 d.TranFee  ,
			 d.BankABA,   
			 d.BankAcctNo,
			 d.BankName,
			 d.BankHolder,
			 d.BankAcctType,
			 d.SaveAccountFuture,
			 d.BankAccountName
			 from tblschedulepayment s 
			 inner join tblschedulepaymentdetails d 
			 on s.acctno=d.AcctNo  
			 where s.acctno=@AcctNo and IsSchedule=1
			 and scheduledate=CONVERT(VARCHAR(10), GETDATE(), 120);
		end

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertAutoPayCardSubscription]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertAutoPayCardSubscription]
(@ConfirmationId varchar(15),
@Acctno varchar(10),
@TokenId varchar(30),
@CardName varchar(50),
@CardType varchar(50),
@CardNumber varchar(30),
@CardExpiry varchar(30),
@Amount varchar(10),
@paymentFrequency varchar(50),
@TranFee varchar(10))
as
Begin
	DECLARE @CardSubscriptionID int,@ScheduleID int,@AccountName varchar(50)
	DECLARE @val int, @counter int, @count int, @addate datetime;
	 DECLARE @TotalAmount money, 	@AccountID varchar(10);
	set @count=1;
	set @addate=getdate();
	set @TotalAmount=convert(money,@Amount) + convert(money,@TranFee);
	select top 1 @AccountName =  FullName from tblonlineusers where acctno=@Acctno
			
	insert into tblSchedulePaymentSetup 
	(AcctNo, ConfirmationNumber, TranAmount, TranFee, BankAcctNo, BankHolder, 
	BankAcctType, PaymentFrequency, IsFuturePay, IsAutoPay, CreatedDate, SubscriptionId,
	CreatedBy, IsVerified, IsActive ) 
	values (@AcctNo, @ConfirmationId, @Amount, @TranFee, @CardNumber, @CardName,
	@CardType, @paymentFrequency, 0, 1, getdate(), @TokenId,
	@AccountName, 1, 1)
	SET @ScheduleID = SCOPE_IDENTITY();
	
	select 
	@addate = convert(datetime,(select AutoPayDueDate from GetAutpayDetails(@AcctNo))),
	@val = RemainingTerm, 
	@counter=case AcctFreq
	WHEN 'W' THEN  7 
	WHEN 'M' THEN  30
	WHEN 'Y' THEN  365
	WHEN 'B' THEN  14
	WHEN 'D' THEN  1
	end from Reserves.dbo.tblAccounts where AcctNo = @AcctNo;
	  
	while @count <= @val
	begin
		INSERT INTO tblSchedulePaymentDetails 
		(ScheduleID, scheduleddate, [status], IsActive)
		VALUES (@ScheduleID, @addate, 'Pending', 1);
		set @count = @count + 1; set @addate= DATEADD(day,@counter,@addate)
	end
	       
	select top 1 @AccountID=AccountId from tblaccounts where AcctNo=@AcctNo;
	Insert into Collection.dbo.tblactionlog (ActionLogAccountId,ActionLogType,ActionLogSubType,ActionLogDate,ActionLogUsername,ActionLogEntry) 
	values (@AccountID,'SCH','WEB',getdate(),@AccountName,convert(text,'CDC for $'+convert(varchar(10),@TotalAmount) +' Conf#: '+@ConfirmationId));
	
	if not exists (select top 1 * from tblCardSubscriptionInfo where AcctNo=@AcctNo and CardNumber=@CardNumber and CardExpiry=@CardExpiry and CardType=@CardType and isactive=1)
	begin			
		insert into tblCardSubscriptionInfo (AcctNo , SubscriptionId,CardName,CardType, CardNumber , CardExpiry , CreatedDate) values(@Acctno,@TokenId ,@CardName,@CardType, @CardNumber , @CardExpiry , getdate())
	End
End

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillingAddress]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertBillingAddress]
(@TokenId varchar(30),
@ConfirmationId varchar(15),
@Acctno varchar(10) ,
@FirstName varchar(50),
@LastName varchar(50),
@PrimaryNumber varchar(12), 
@EmailID varchar(100),
@Address varchar(200),
@City varchar(50),
@State varchar(50),
@Zip varchar(10),
@Country varchar(50))
as
	begin	
		insert into tblBillingAddress (CardSubscriptionID,ConfirmationId,AcctNo,FirstName,LastName,PrimaryNumber,EmailID,Address,City,State,Zip, Country,CreatedDate) values (@TokenId,@ConfirmationId,@Acctno,@FirstName,@LastName,@PrimaryNumber , @EmailID,@Address,@City,@State,@Zip,@Country ,getdate())					
	End

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCardSubscription]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertCardSubscription]
(@ConfirmationId varchar(15),
@Acctno varchar(10),
@TokenId varchar(30),
@CardName varchar(50),
@CardType varchar(50),
@CardNumber varchar(30),
@CardExpiry varchar(30),
@FuturePaymentDate varchar(30),
@Fee varchar(5),
@Status varchar(15),
@Amount varchar(10),
@ReferenceNumber varchar(20),
@PaymentType varchar(20))
as
   DECLARE @CardSubscriptionID int,@ScheduleID int,@AccountName varchar(50),@AccountID varchar(10),@TotalAmount decimal(10,2);
	Begin
	set @TotalAmount=CAST(@Amount as decimal(10,5))+CAST(@Fee as decimal(10,2));
	select top 1 @AccountName=  FullName from tblonlineusers where acctno=@Acctno;
	select top 1 @AccountID=AccountId from tblaccounts where AcctNo=@AcctNo;
		if(@FuturePaymentDate <> '' and @FuturePaymentDate is not null)
			Begin			
				insert into tblSchedulePaymentSetup 
				(AcctNo, ConfirmationNumber, TranAmount, TranFee, BankAcctNo, BankHolder, 
				BankAcctType, IsFuturePay, IsAutoPay, CreatedDate,
				CreatedBy, IsVerified, IsActive, PaymentFrequency , SubscriptionId) 
				values (@AcctNo, @ConfirmationId, @Amount, @Fee, @CardNumber, @CardName,
				@CardType, 1, 0, getdate(), 
				@AccountName, 1, 1, (SELECT TOP 1 AcctFreq FROM tblAccounts WHERE AcctNo  = @Acctno), @TokenId)
				SET @ScheduleID = SCOPE_IDENTITY();

				INSERT INTO tblSchedulePaymentDetails 
				(ScheduleID, scheduleddate, [status], IsActive)
				VALUES (@ScheduleID, @FuturePaymentDate, 'Pending', 1);

				Insert into Collection.dbo.tblactionlog (ActionLogAccountId,ActionLogType,ActionLogSubType,ActionLogDate,ActionLogUsername,ActionLogEntry) 
				values (@AccountID,'SCH','WEB',getdate(),@AccountName,convert(text,'CDC for $'+convert(varchar(10),@TotalAmount) +' Transaction Date: '+format(getdate(),'MM/dd/yyyy')+' Conf#: '+@ConfirmationId+' Payment '+@Status));

			End	
		else
			begin
			if(@Amount is not null and @Amount <> '' and @Amount <> '0.00')
				begin
					INSERT INTO tblonlinepayments (ConfirmationID, AcctNo, TranPayment,  BankAcctNo, BankHolder, BankAcctType,TranDate,status,TranFee,ReferenceNumber,Type)
						 VALUES (@ConfirmationId, @AcctNo, @Amount, @CardNumber, @CardName , @CardType,getdate(),@Status,@Fee,@ReferenceNumber,@PaymentType)
					Insert into Collection.dbo.tblactionlog (ActionLogAccountId,ActionLogType,ActionLogSubType,ActionLogDate,ActionLogUsername,ActionLogEntry) 
						values (@AccountID,'PMT','WEB',getdate(),@AccountName,convert(text,'CDC for $'+convert(varchar(10),@TotalAmount) +' Transaction Date: '+format(getdate(),'MM/dd/yyyy')+' Conf#: '+@ConfirmationId+' Payment '+@Status));			
				End
		End
		if (@TokenId <> '' and @TokenId is not null) AND not exists (select top 1 * from tblCardSubscriptionInfo where AcctNo=@AcctNo and CardNumber=@CardNumber and CardExpiry=@CardExpiry and CardType=@CardType and isactive=1)
				begin			
					insert into tblCardSubscriptionInfo (AcctNo , SubscriptionId,CardName,CardType, CardNumber , CardExpiry , CreatedDate) values(@Acctno,@TokenId ,@CardName,@CardType, @CardNumber , @CardExpiry , getdate())
				End
End
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCardTransactionLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_InsertCardTransactionLog]
(
@AcctNo varchar(10),
@ConfirmationId varchar(15),
@TokenId varchar(30),
@RequestId varchar(30),
@CardName varchar(50),
@CardNumber varchar(40),
@CardExpiry varchar(10),
@CardType char(1),
@ReasonCode varchar(10),
@Description varchar(200)
)
as
	begin
		Insert into tblCardTransactionLog (AcctNo,ConfirmationId,SubscriptionId,RequestId,CardName,CardNumber,CardExpiry,CardType,ReasonCode,Description,CreatedDate) 
		values
		(@AcctNo,@ConfirmationId,@TokenId,@RequestId,@CardName,@CardNumber,@CardExpiry,@CardType,@ReasonCode,@Description,getdate());
	End

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateAutoPayCardSubscription]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateAutoPayCardSubscription]
(@ConfirmationId varchar(15),
@Acctno varchar(10),
@TokenId varchar(30),
@CardName varchar(50),
@CardType varchar(50),
@CardNumber varchar(30),
@CardExpiry varchar(30),
@Amount varchar(10),
@paymentFrequency varchar(50),
@TranFee varchar(10),
@ScheduleID varchar(12)

)
as
   
Begin
	DECLARE	@AccountName varchar(50);
	select top 1 @AccountName=  FullName from tblonlineusers where acctno=@Acctno
	
	If  exists( Select 1 
	from tblschedulepaymentsetup 
	where AcctNo = @Acctno and ScheduleID = @ScheduleID and IsActive =1 and IsDeleted = 0)
	begin
		update 	tblschedulepaymentsetup
		set SubscriptionId = @TokenId,
		ConfirmationNumber = @ConfirmationId,
		TranAmount=@Amount ,TranFee = @TranFee,
		BankAcctNo= @CardNumber,
		BankHolder= @CardName,
		BankAcctType = @CardType,
		BankABA=null,
		BankName = null, 
		paymentFrequency=@paymentFrequency,CreatedBy=@AccountName, 
		IsAutoPay = 1,CreatedDate = getdate() 
		where AcctNo = @Acctno and ScheduleID = @ScheduleID and IsActive = 1 AND IsDeleted = 0
	end
	if not exists (select top 1 * from tblCardSubscriptionInfo where AcctNo=@AcctNo and CardNumber=@CardNumber and CardExpiry=@CardExpiry and CardType=@CardType and isactive=1)
	begin			
		insert into tblCardSubscriptionInfo (AcctNo , SubscriptionId,CardName,CardType, CardNumber , CardExpiry , CreatedDate) values(@Acctno,@TokenId ,@CardName,@CardType, @CardNumber , @CardExpiry , getdate())
	End
End

GO
/****** Object:  UserDefinedFunction [dbo].[appenedString]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
Create FUNCTION [dbo].[appenedString] 
(
	-- Add the parameters for the function here
	@sql nvarchar(85)
)
RETURNS varchar(30)
BEGIN
	-- Declare the return variable here
	declare @return varchar(30)

	-- Add the T-SQL statements to compute the return value here
	select @return =  (CASE CHARINDEX( 'where',ltrim(rtrim(@sql))) WHEN 0 THEN 
 ' where '  ELSE   'and '  END) 


	-- Return the result of the function
	RETURN @return

END


GO
/****** Object:  UserDefinedFunction [dbo].[GetAddress]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetAddress](@Acctno varchar(12))
returns @tblAddress table(
 Address1 varchar(100),
Address2 varchar(100),
City varchar(50),
State varchar(4),
Zip varchar(10)
)
as
Begin
declare @ConsumerId varchar(12);
select @ConsumerId=Applicantid from tblaccounts where acctno=@acctno;
if exists(select top 1 * from tblAddress where acctno=@acctno)
begin
	insert into @tblAddress (Address1 , Address2 , City , State , Zip)select top 1  Address1 , Address2 , City , State , Zip from tbladdress where acctno=@acctno order by Addressid desc;
end
else if exists (select top 1 * from Address.dbo.items where Recordid=@ConsumerId)
begin
	insert into @tblAddress (Address1 , Address2 , City , State , Zip)select top 1  Address1 , Address2 , City , State , Zip from Address.dbo.items where Recordid=@ConsumerId order by itemid desc;
end
else if exists (select top 1 * from Collection.dbo.tblconsumers where Consumerid=@ConsumerId)
begin
	insert into @tblAddress (Address1 , Address2 , City , State , Zip)select top 1  AddrLn1 as Address1 ,AddrLn2 as Address2 , City , State , Zip from Collection.dbo.tblconsumers where Consumerid=@ConsumerId;
end
else
begin
	insert into @tblAddress (Address1 , Address2 , City , State , Zip) select null , null , null, null, null
end
return;
end


GO
/****** Object:  UserDefinedFunction [dbo].[GetAutpayDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[GetAutpayDetails](@Acctno varchar(12))
returns @AutoPayDetails table
(OneTime varchar(5),
Scheduled varchar(10),
AutoPayDueDate varchar(30),
FuturePayDate varchar(50))
BEGIN
declare @days int,
@LastPaymentDate datetime,
@AcctNextDueDate datetime ,
@OneTime varchar(10),
@Scheduled varchar(10),
@UpComingNextDueDate datetime,
@FuturePayDate varchar(50);

select  
   @days= case AcctFreq
	WHEN 'W' THEN  7 
	WHEN 'M' THEN  30
	WHEN 'Y' THEN  365
	WHEN 'B' THEN  14
	WHEN 'D' THEN  1
	end,
	@LastPaymentDate=DATEADD(day,-@days,acctnextduedate),
	@AcctNextDueDate=acctnextduedate	
	from tblaccounts 
where acctno=@AcctNo
set @UpComingNextDueDate=DATEADD(day,@days,@AcctNextDueDate);
if exists(select top 1 id from tblonlinepayments where acctno=@AcctNo and CONVERT(datetime, CONVERT(varchar, TranDate, 102)) between @LastPaymentDate and @AcctNextDueDate)
begin
	set @OneTime='True'
end

-- Check future pay

if exists(select top 1 d.scheduleddate
from 
tblschedulepaymentdetails d 
inner join tblschedulepaymentsetup p 
on d.scheduleid=p.scheduleid 
where p.acctno=@AcctNo
AND d.ScheduledDate between @LastPaymentDate and @AcctNextDueDate
and d.isactive=1 
and p.isactive=1
and p.IsFuturePay=1
and p.IsDeleted = 0
and p.IsVerified = 1)
begin
	
	select top 1 @FuturePayDate=CONVERT(varchar(10), d.scheduleddate, 101)
		from 
		tblschedulepaymentdetails d 
		inner join tblschedulepaymentsetup p 
		on d.scheduleid=p.scheduleid 
		where p.acctno=@AcctNo
		AND d.ScheduledDate between @LastPaymentDate and @AcctNextDueDate
		and d.isactive=1 
		and p.isactive=1
		and p.IsFuturePay=1
		and p.IsDeleted = 0
		and p.IsVerified = 1
	set @Scheduled='True' ;
end

if exists(select top 1 p.Scheduleid as Scheduled
from 
tblschedulepaymentdetails d 
inner join tblschedulepaymentsetup p 
on d.scheduleid=p.scheduleid 
where p.acctno=@AcctNo
AND d.ScheduledDate between  @AcctNextDueDate and @UpComingNextDueDate
and d.isactive=1 
and p.isactive=1
and p.IsFuturePay=1
and p.IsDeleted = 0
and p.IsVerified = 1)
begin
	
	if(@FuturePayDate is not null and @FuturePayDate<> '')
		begin
			set @FuturePayDate = @FuturePayDate + ','
		end
	select top 1 @FuturePayDate = @FuturePayDate + CONVERT(varchar(10), d.scheduleddate, 101)
		from 
		tblschedulepaymentdetails d 
		inner join tblschedulepaymentsetup p 
		on d.scheduleid=p.scheduleid 
		where p.acctno=@AcctNo
		AND d.ScheduledDate between  @AcctNextDueDate and @UpComingNextDueDate
		and d.isactive=1 
		and p.isactive=1
		and p.IsFuturePay=1
		and p.IsDeleted = 0
		and p.IsVerified = 1
	set @Scheduled='True';set @UpComingNextDueDate= DATEADD(day,@days,@UpComingNextDueDate);
end
insert into @AutoPayDetails (OneTime , Scheduled ,AutoPayDueDate ,FuturePayDate) values
(@OneTime  ,@Scheduled , CONVERT(varchar(10), @UpComingNextDueDate, 101), @FuturePayDate)
return;
END

GO
/****** Object:  UserDefinedFunction [dbo].[ReturnGreaterThanZero]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Luis Jimenez
-- Create date: 7/8/14
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[ReturnGreaterThanZero]
(
	@Value  money
)
RETURNS money
AS
BEGIN
	DECLARE @Result money
	set @Result = 0

	if @Value > 0 
		set @Result = @Value
	RETURN @Result

END

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[AgentUserId] [int] NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reservesDemoRegular]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reservesDemoRegular](
	[ReserveID] [int] NOT NULL,
	[DlrAcctNo] [varchar](10) NULL,
	[TranDate] [datetime] NULL,
	[TranType] [varchar](2) NULL,
	[TranEnteredBy] [varchar](30) NULL,
	[TranDesc] [varchar](20) NULL,
	[TranNote] [varchar](75) NULL,
	[RegInc] [money] NULL,
	[RegDec] [money] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reservesRegular]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reservesRegular](
	[ReserveID] [int] NOT NULL,
	[DlrAcctNo] [varchar](10) NULL,
	[TranDate] [datetime] NULL,
	[TranType] [varchar](2) NULL,
	[TranEnteredBy] [varchar](30) NULL,
	[TranDesc] [varchar](20) NULL,
	[TranNote] [varchar](75) NULL,
	[RegInc] [money] NULL,
	[RegDec] [money] NULL,
	[QDate] [datetime] NULL,
	[AcctNo] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reservesTitle]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reservesTitle](
	[ReserveID] [int] NOT NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[HoldDate] [datetime] NULL,
	[TitleHold] [money] NULL,
	[TitleRelease] [money] NULL,
	[ReleaseDate] [datetime] NULL,
	[TranNote] [varchar](75) NULL,
	[TranEnteredBy] [varchar](30) NULL,
	[SplitReserve] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAccounts]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccounts](
	[AccountID] [int] NOT NULL,
	[AcctNo] [varchar](10) NULL,
	[PDData] [datetime] NULL,
	[PDCalc] [datetime] NULL,
	[ApplicantID] [int] NULL,
	[DealerID] [int] NULL,
	[DealerAcctNo] [varchar](15) NULL,
	[AcctCurrentBal] [money] NULL,
	[AcctClass] [varchar](5) NULL,
	[AcctType] [varchar](10) NULL,
	[AcctTerm] [int] NULL,
	[AcctFreq] [varchar](1) NULL,
	[AcctStatusFlag] [varchar](10) NULL,
	[AcctLoanAmount] [money] NULL,
	[AcctIntRate] [float] NULL,
	[AcctLossDate] [datetime] NULL,
	[AcctCode] [varchar](15) NULL,
	[AcctEntryDate] [datetime] NULL,
	[AcctRegPayAmt] [money] NULL,
	[AcctDaysPastDue] [int] NULL,
	[AcctMidStream] [varchar](1) NULL,
	[AcctAnticern1] [money] NULL,
	[AcctAnticern5] [money] NULL,
	[AcctAccern1] [money] NULL,
	[AcctAntica1] [money] NULL,
	[AcctOrgPurAmt] [money] NULL,
	[AcctOrgTerm] [int] NULL,
	[AcctAccErn5] [money] NULL,
	[AcctReserve1] [money] NULL,
	[AcctReserve2] [money] NULL,
	[AcctReserve3] [money] NULL,
	[AcctOtherBal] [money] NULL,
	[RepoCodedDate] [datetime] NULL,
	[ReserveTitleHold] [money] NULL,
	[ReserveTitleRelease] [money] NULL,
	[AcctIntBal] [money] NULL,
	[AcctLCBal] [money] NULL,
	[AcctTotLChg] [money] NULL,
	[AcctProceeds] [money] NULL,
	[VehYear] [int] NULL,
	[VehModel] [varchar](20) NULL,
	[VehType] [varchar](20) NULL,
	[AcctPastDueAmt] [money] NULL,
	[UpdatedPhone] [varchar](12) NULL,
	[UpdatedPhoneDate] [datetime] NULL,
	[AcctNextDueDate] [datetime] NULL,
	[AcctPayOff] [money] NULL,
	[RemainingTerm] [int] NULL,
	[AcctNextDueAmt] [money] NULL,
	[InsPolicyNo] [varchar](25) NULL,
	[InsEffDate] [datetime] NULL,
	[InsExpDate] [datetime] NULL,
	[VehVin] [varchar](30) NULL,
 CONSTRAINT [PK_tblAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[Acctno] [varchar](10) NULL,
	[Address1] [varchar](200) NULL,
	[Address2] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](3) NULL,
	[Zip] [varchar](12) NULL,
	[Country] [varchar](20) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAdminLogin]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdminLogin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAdminLogin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBillingAddress]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblBillingAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[CardSubscriptionID] [varchar](30) NULL,
	[ConfirmationId] [varchar](15) NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PrimaryNumber] [varchar](12) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[City] [varchar](30) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zip] [varchar](12) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCardSubscriptionInfo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCardSubscriptionInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[SubscriptionId] [varchar](30) NOT NULL,
	[CardName] [varchar](50) NOT NULL,
	[CardNumber] [varchar](4) NOT NULL,
	[CardExpiry] [varchar](20) NOT NULL,
	[CardType] [varchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCardTransactionLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCardTransactionLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[ConfirmationId] [varchar](30) NULL,
	[SubscriptionId] [varchar](30) NULL,
	[RequestId] [varchar](30) NULL,
	[CardName] [varchar](50) NULL,
	[CardNumber] [varchar](4) NULL,
	[CardExpiry] [varchar](10) NULL,
	[CardType] [char](1) NULL,
	[ReasonCode] [varchar](10) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblConsumers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblConsumers](
	[ConsumerID] [int] NOT NULL,
	[LastName] [varchar](30) NULL,
	[FirstName] [varchar](30) NULL,
	[State] [varchar](2) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblContacts]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblContacts](
	[AcctNo] [varchar](15) NULL,
	[Company] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Phone] [varchar](12) NULL,
	[Email] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblCybsInfo]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblCybsInfo](
	[Account] [nvarchar](50) NOT NULL,
	[MerchantID] [varchar](25) NOT NULL,
	[Transkey] [varchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDealers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDealers](
	[DealerID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[RevisedDate] [datetime] NULL,
	[Source] [varchar](1) NULL,
	[AcctNo] [varchar](15) NULL,
	[FedTaxID] [varchar](15) NULL,
	[Name] [varchar](50) NULL,
	[Name2] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[AddrLn1] [varchar](50) NULL,
	[AddrLn2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[PhnMain] [varchar](12) NULL,
	[PhnFax] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[StaticCode] [varchar](5) NULL,
	[Notes] [varchar](80) NULL,
	[ACQType] [varchar](1) NULL,
	[MasterGrossRes] [money] NULL,
	[MasterPrinRes] [money] NULL,
	[RequiredPercent] [float] NULL,
	[MasterType] [varchar](1) NULL,
	[BuyBackHold] [money] NULL,
	[BuyerID] [int] NULL,
	[DlrUncoop] [char](1) NULL,
	[DlrOOB] [char](1) NULL,
	[Recourse] [smallint] NULL,
	[Excluded] [char](1) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDemoAccounts]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDemoAccounts](
	[AccountID] [int] NOT NULL,
	[AcctNo] [varchar](10) NULL,
	[PDData] [datetime] NULL,
	[PDCalc] [datetime] NULL,
	[ApplicantID] [int] NULL,
	[DealerID] [int] NULL,
	[DealerAcctNo] [varchar](15) NULL,
	[AcctCurrentBal] [money] NULL,
	[AcctClass] [varchar](5) NULL,
	[AcctType] [varchar](10) NULL,
	[AcctTerm] [int] NULL,
	[AcctFreq] [varchar](1) NULL,
	[AcctStatusFlag] [varchar](5) NULL,
	[AcctLoanAmount] [money] NULL,
	[AcctIntRate] [float] NULL,
	[AcctLossDate] [datetime] NULL,
	[AcctCode] [varchar](15) NULL,
	[AcctEntryDate] [datetime] NULL,
	[AcctRegPayAmt] [money] NULL,
	[AcctDaysPastDue] [int] NULL,
	[AcctMidStream] [varchar](1) NULL,
	[AcctAnticern1] [money] NULL,
	[AcctAnticern5] [money] NULL,
	[AcctAccern1] [money] NULL,
	[AcctAntica1] [money] NULL,
	[AcctOrgPurAmt] [money] NULL,
	[AcctOrgTerm] [int] NULL,
	[AcctAccErn5] [money] NULL,
	[AcctReserve1] [money] NULL,
	[AcctReserve2] [money] NULL,
	[AcctReserve3] [money] NULL,
	[AcctOtherBal] [money] NULL,
	[RepoCodedDate] [datetime] NULL,
	[ReserveTitleHold] [money] NULL,
	[ReserveTitleRelease] [money] NULL,
	[AcctIntBal] [money] NULL,
	[AcctLCBal] [money] NULL,
	[AcctTotLChg] [money] NULL,
	[AcctProceeds] [money] NULL,
	[VehYear] [int] NULL,
	[VehModel] [varchar](20) NULL,
	[VehType] [varchar](20) NULL,
 CONSTRAINT [PK_tblDemoAccounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDemoConsumers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDemoConsumers](
	[ConsumerID] [int] NOT NULL,
	[LastName] [varchar](30) NULL,
	[FirstName] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDemoDealers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDemoDealers](
	[DealerID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[RevisedDate] [datetime] NULL,
	[Source] [varchar](1) NULL,
	[AcctNo] [varchar](15) NULL,
	[FedTaxID] [varchar](15) NULL,
	[Name] [varchar](50) NULL,
	[Name2] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[AddrLn1] [varchar](50) NULL,
	[AddrLn2] [varchar](50) NULL,
	[City] [varchar](30) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[PhnMain] [varchar](12) NULL,
	[PhnFax] [varchar](12) NULL,
	[Email] [varchar](50) NULL,
	[StaticCode] [varchar](5) NULL,
	[Notes] [text] NULL,
	[ACQType] [varchar](1) NULL,
	[MasterGrossRes] [money] NULL,
	[MasterPrinRes] [money] NULL,
	[RequiredPercent] [float] NULL,
	[MasterType] [varchar](1) NULL,
	[BuyBackHold] [money] NULL,
	[BuyerID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblDemoUsers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblDemoUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[AccountNo] [varchar](15) NULL,
	[BitReset] [bit] NULL,
	[Name] [varchar](50) NULL,
	[Telephone] [varchar](12) NULL,
	[int_Usertype] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblHistoryLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblHistoryLog](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NULL,
	[Username] [char](50) NULL,
	[LogInTime] [datetime] NULL,
	[DealerNo] [varchar](4) NULL,
 CONSTRAINT [PK_tblHistoryLog] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInsuranceCompany]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInsuranceCompany](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Address] [varchar](150) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Zip] [varchar](15) NOT NULL,
 CONSTRAINT [PK_tblInsuranceCompany] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInsuranceCompanyList]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInsuranceCompanyList](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InsCompany] [varchar](100) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblInsuranceInformation]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblInsuranceInformation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AccountNumber] [varchar](10) NOT NULL,
	[InsuranceAgencyName] [varchar](100) NOT NULL,
	[InsuranceAgencyAddress] [varchar](150) NOT NULL,
	[InsuranceAgencyCity] [varchar](50) NOT NULL,
	[InsuranceAgencyState] [varchar](50) NOT NULL,
	[InsuranceAgencyZip] [varchar](15) NOT NULL,
	[InsuredName] [varchar](100) NOT NULL,
	[InsuredAddress] [varchar](150) NOT NULL,
	[InsuredCity] [varchar](50) NOT NULL,
	[InsuredState] [varchar](50) NOT NULL,
	[InsuredZip] [varchar](15) NOT NULL,
	[InsuranceCardPath] [varchar](100) NOT NULL,
	[InsuranceCompanyID] [int] NOT NULL,
 CONSTRAINT [PK_tblInsuranceInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblMake]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblMake](
	[Make] [varchar](20) NOT NULL,
 CONSTRAINT [PK_tblMake] PRIMARY KEY CLUSTERED 
(
	[Make] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOnlinePayments]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOnlinePayments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfirmationID] [varchar](15) NULL,
	[AcctNo] [varchar](10) NULL,
	[TranDate] [datetime] NULL,
	[TranPayment] [money] NULL,
	[TranFee] [money] NULL,
	[BankABA] [varchar](9) NULL,
	[BankAcctNo] [varchar](17) NULL,
	[BankName] [varchar](50) NULL,
	[BankHolder] [varchar](50) NULL,
	[BankAcctType] [varchar](1) NULL,
	[Status] [varchar](10) NULL,
	[Type] [varchar](50) NULL,
	[ReferenceNumber] [varchar](20) NULL,
 CONSTRAINT [PK_tblOnlinePayments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOnlinePaymentsTest]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOnlinePaymentsTest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ConfirmationID] [varchar](10) NULL,
	[AcctNo] [varchar](10) NULL,
	[TranDate] [datetime] NULL,
	[TranPayment] [money] NULL,
	[TranFee] [money] NULL,
	[BankABA] [varchar](9) NULL,
	[BankAcctNo] [varchar](17) NULL,
	[BankName] [varchar](50) NULL,
	[BankHolder] [varchar](50) NULL,
	[BankAcctType] [varchar](1) NULL,
	[Status] [varchar](10) NULL,
 CONSTRAINT [PK_tblOnlinePaymentsTest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOnlineUsers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOnlineUsers](
	[AcctNo] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[FullName] [varchar](50) NULL,
	[Password] [varchar](20) NULL,
	[SecurityID] [tinyint] NULL,
	[Answer] [varchar](50) NULL,
	[CCAuthorized] [varchar](1) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[SecurityID2] [tinyint] NULL,
	[Answer2] [varchar](50) NULL,
	[SecurityID3] [tinyint] NULL,
	[Answer3] [varchar](50) NULL,
	[ProfilePicture] [varchar](200) NULL,
	[BitReset] [varchar](10) NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_tblOnlineUsers] PRIMARY KEY CLUSTERED 
(
	[AcctNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[Company] [varchar](50) NULL,
	[Contact] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](5) NULL,
	[Phone] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Quatity] [int] NULL,
	[Confirmated] [bit] NULL,
	[Seller] [varchar](40) NULL,
	[Payment] [varchar](15) NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPayByTextMessageLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPayByTextMessageLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](15) NOT NULL,
	[TextNumber] [varchar](15) NOT NULL,
	[Message] [varchar](200) NOT NULL,
	[Type] [varchar](10) NOT NULL,
	[Keyword] [varchar](10) NOT NULL,
	[LogDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblPayByTextMessageLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPayByTextSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPayByTextSetup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[ConfirmationNumber] [varchar](15) NOT NULL,
	[BankABA] [varchar](9) NULL,
	[BankAcctNo] [varchar](17) NULL,
	[BankName] [varchar](50) NULL,
	[BankHolder] [varchar](50) NULL,
	[BankAcctType] [varchar](10) NOT NULL,
	[SubscriptionId] [varchar](30) NULL,
	[TextNumber] [varchar](11) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BillingAddressId] [int] NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblPayByTextSetup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblPmtHistory]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblPmtHistory](
	[PaymentID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[SeqNo] [int] NULL,
	[PayDate] [datetime] NULL,
	[TranDate] [datetime] NULL,
	[TranCode] [varchar](2) NULL,
	[RefNo] [varchar](5) NULL,
	[TranAmount] [money] NULL,
	[ApInt] [money] NULL,
	[ApLC] [money] NULL,
	[ApOth] [money] NULL,
	[ApPrin] [money] NULL,
	[PrinBal] [money] NULL,
	[IntBal] [money] NULL,
	[LCBal] [money] NULL,
	[OthBal] [money] NULL,
	[PaidThrough] [datetime] NULL,
	[LCPaidThrough] [datetime] NULL,
	[ColID] [varchar](5) NULL,
	[RevCode] [varchar](2) NULL,
	[RevSeq] [int] NULL,
	[NewRate] [float] NULL,
	[RevBy] [int] NULL,
	[PostedDate] [datetime] NULL,
 CONSTRAINT [PK_tblPmtHistory] PRIMARY KEY NONCLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSavedACH]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSavedACH](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](10) NULL,
	[BankABA] [varchar](9) NULL,
	[BankAcctNo] [varchar](17) NULL,
	[BankName] [varchar](50) NULL,
	[BankHolder] [varchar](50) NULL,
	[BankAcctType] [varchar](1) NULL,
	[Email] [varchar](50) NULL,
	[PrimaryNumber] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK__tblSaved__3214EC2757E0A316] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSchedulePaymentDetails]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[tblSchedulePaymentDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ScheduleID] [varchar](10) NOT NULL,
	[ScheduledDate] [date] NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_tblSchedulePaymentDetails1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblSchedulePaymentSetup]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblSchedulePaymentSetup](
	[ScheduleId] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](10) NOT NULL,
	[TextNumber] [varchar](15) NULL,
	[ConfirmationNumber] [varchar](15) NOT NULL,
	[WebConfirmationNumber] [varchar](10) NULL,
	[TranAmount] [money] NOT NULL,
	[TranFee] [money] NOT NULL,
	[BankABA] [varchar](9) NULL,
	[BankAcctNo] [varchar](17) NULL,
	[BankName] [varchar](50) NULL,
	[BankHolder] [varchar](50) NULL,
	[BankAcctType] [varchar](10) NOT NULL,
	[PaymentFrequency] [varchar](100) NOT NULL,
	[SubscriptionId] [varchar](30) NULL,
	[IsFuturePay] [bit] NOT NULL,
	[IsAutoPay] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[BillingAddressId] [int] NULL,
	[IsVerified] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_tblSchedulePaymentSetup] PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblTransactionAmountLimit]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblTransactionAmountLimit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AcctFreq] [char](1) NOT NULL,
	[MinimumAmount] [decimal](8, 2) NOT NULL,
	[MaximumAmount] [decimal](8, 2) NOT NULL,
 CONSTRAINT [PK_tblTransactionAmountLimit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUserActionLog]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUserActionLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[AcctNo] [varchar](12) NULL,
	[PId] [varchar](50) NULL,
	[ConfirmationNumber] [varchar](20) NULL,
	[ActionType] [varchar](30) NULL,
	[ActionSubType] [varchar](50) NULL,
	[Action] [varchar](300) NULL,
	[IpAddress] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblUsers](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
	[AccountNo] [varchar](15) NULL,
	[BitReset] [bit] NULL,
	[Name] [varchar](50) NULL,
	[Telephone] [varchar](12) NULL,
	[int_Usertype] [int] NULL,
	[Disabled] [bit] NULL,
	[LastLogin] [datetime] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblVehicles]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblVehicles](
	[AcctNo] [varchar](10) NOT NULL,
	[ApplicantID] [int] NULL,
	[VehYear] [int] NULL,
	[VehModel] [varchar](20) NULL,
	[VehType] [varchar](20) NULL,
	[VehBody] [varchar](25) NULL,
	[VehMiles] [int] NULL,
	[VehColor] [varchar](20) NULL,
	[VehVin] [varchar](30) NULL,
	[VehVin6] [varchar](6) NULL,
 CONSTRAINT [PK_tblVehicles] PRIMARY KEY CLUSTERED 
(
	[AcctNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwAccountsFee]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vwAccountsFee] as
with ctePrimary as ( 
		Select tblAccounts.AcctNo,tblConsumers.[State],
			SUBSTRING(tblDealers.AcctNo, 1, CHARINDEX('.', tblDealers.AcctNo) - 1) AS DlrAcctNo
		From tblAccounts 
			LEFT OUTER JOIN tblConsumers ON tblAccounts.ApplicantID = tblConsumers.ConsumerID
			LEFT OUTER JOIN tblDealers ON tblAccounts.DealerID = tblDealers.DealerID)
select AcctNo, 
		case 
			when DlrAcctNo in ('2699', '8300', '2152', '9926') then 0.0 
			when [State] in ('CO', 'IA') then 0.0
			else 6.0
		end as FeeAmount 
from ctePrimary


GO
/****** Object:  View [dbo].[vwBuyBacks]    Script Date: 1/31/2017 12:04:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[vwBuyBacks] as 
with cteAccount as (
	select AccountID,
		CASE WHEN AcctMidStream = 'N' THEN
			CASE WHEN  AcctType = 'P' THEN AcctTerm * AcctRegPayAmt
				ELSE
				CASE WHEN AcctType = 'I' THEN AcctLoanAmount END
			  END
		ELSE
			CASE WHEN AcctMidStream = 'Y' THEN AcctOrgPurAmt ELSE 0 END
		END AS OrgGross, AcctMidStream, AcctType, AcctTerm, AcctRegPayAmt,  AcctLoanAmount, AcctOrgPurAmt,
		CASE WHEN (AcctLossDate is Null) THEN AcctCurrentBal ELSE 0 END AS OutGross, AcctLossDate, AcctCurrentBal
	from dbo.tblAccounts), 
cteCalcAccount as (
	select dbo.ReturnGreaterThanZero(OutGross - (AcctAnticern1 - AcctAccErn1)) calcRemP, a.* 
	from cteAccount a inner join tblAccounts b on a.AccountID=b.AccountID)
select 
	case when OrgGross > 0 then 
		dbo.ReturnGreaterThanZero(calcRemP - AcctReserve2 - (AcctAnticern5 * (OutGross / OrgGross)))
	else 
		dbo.ReturnGreaterThanZero(calcRemP - AcctReserve2)
	end calcSpcBB, a.AccountID 
from cteCalcAccount a inner join tblAccounts b on a.AccountID=b.AccountID

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tblAccounts]    Script Date: 1/31/2017 12:04:28 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tblAccounts] ON [dbo].[tblAccounts]
(
	[AcctNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[reservesTitle] ADD  CONSTRAINT [DF_reservesTitle_SplitReserve]  DEFAULT ((0)) FOR [SplitReserve]
GO
ALTER TABLE [dbo].[tblBillingAddress] ADD  CONSTRAINT [DF_tblBillingAddress_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCardSubscriptionInfo] ADD  CONSTRAINT [DF_tblCardSubscriptionInfo_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblCybsInfo] ADD  CONSTRAINT [DF_CybsInfo_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblDealers] ADD  CONSTRAINT [DF_tblDealers_MasterType]  DEFAULT ('N') FOR [MasterType]
GO
ALTER TABLE [dbo].[tblDealers] ADD  CONSTRAINT [DF_tblDealers_BuyBackHold]  DEFAULT ((0)) FOR [BuyBackHold]
GO
ALTER TABLE [dbo].[tblDealers] ADD  CONSTRAINT [DF_tblDealers_BuyerID]  DEFAULT ((0)) FOR [BuyerID]
GO
ALTER TABLE [dbo].[tblDealers] ADD  CONSTRAINT [DF_tblDealers_Excluded]  DEFAULT ('N') FOR [Excluded]
GO
ALTER TABLE [dbo].[tblDemoDealers] ADD  CONSTRAINT [DF_tblDemoDealers_MasterType]  DEFAULT ('N') FOR [MasterType]
GO
ALTER TABLE [dbo].[tblDemoDealers] ADD  CONSTRAINT [DF_tblDemoDealers_BuyBackHold]  DEFAULT (0) FOR [BuyBackHold]
GO
ALTER TABLE [dbo].[tblInsuranceCompanyList] ADD  CONSTRAINT [DF_tblInsuranceCompanyList_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblOnlinePayments] ADD  CONSTRAINT [DF_tblOnlinePayments_TranDate]  DEFAULT (getdate()) FOR [TranDate]
GO
ALTER TABLE [dbo].[tblOnlinePayments] ADD  CONSTRAINT [DF_tblOnlinePayments_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[tblOnlinePaymentsTest] ADD  CONSTRAINT [DF_tblOnlinePaymentsTest_TranDate]  DEFAULT (getdate()) FOR [TranDate]
GO
ALTER TABLE [dbo].[tblOnlinePaymentsTest] ADD  CONSTRAINT [DF_tblOnlinePaymentTests_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[tblOnlineUsers] ADD  CONSTRAINT [DF_tblOnlineUsers_CCAuthorized]  DEFAULT ('N') FOR [CCAuthorized]
GO
ALTER TABLE [dbo].[tblOnlineUsers] ADD  CONSTRAINT [DF_tblOnlineUsers_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblOnlineUsers] ADD  CONSTRAINT [DF_tblOnlineUsers_BitReset]  DEFAULT ((0)) FOR [BitReset]
GO
ALTER TABLE [dbo].[tblOnlineUsers] ADD  CONSTRAINT [DF_tblOnlineUsers_LastLogin]  DEFAULT (getdate()) FOR [LastLogin]
GO
ALTER TABLE [dbo].[tblPayByTextMessageLog] ADD  CONSTRAINT [DF_tblPayByTextMessageLog_LogDate]  DEFAULT (getdate()) FOR [LogDate]
GO
ALTER TABLE [dbo].[tblPayByTextSetup] ADD  CONSTRAINT [DF_tblPayByTextSetup_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblPayByTextSetup] ADD  CONSTRAINT [DF_tblPayByTextSetup_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblPayByTextSetup] ADD  CONSTRAINT [DF_tblPayByTextSetup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblSavedACH] ADD  CONSTRAINT [DF_tblSavedACH_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblSchedulePaymentDetails] ADD  CONSTRAINT [DF_tblSchedulePaymentDetails1_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblSchedulePaymentSetup] ADD  CONSTRAINT [DF_tblSchedulePaymentSetup_IsSchedule]  DEFAULT ((0)) FOR [IsFuturePay]
GO
ALTER TABLE [dbo].[tblSchedulePaymentSetup] ADD  CONSTRAINT [DF_tblSchedulePaymentSetup_IsReccuring]  DEFAULT ((0)) FOR [IsAutoPay]
GO
ALTER TABLE [dbo].[tblSchedulePaymentSetup] ADD  CONSTRAINT [DF_tblSchedulePaymentSetup_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[tblSchedulePaymentSetup] ADD  CONSTRAINT [DF_tblSchedulePaymentSetup_IsVerified]  DEFAULT ((0)) FOR [IsVerified]
GO
ALTER TABLE [dbo].[tblSchedulePaymentSetup] ADD  CONSTRAINT [DF_tblSchedulePaymentSetup_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[tblSchedulePaymentSetup] ADD  CONSTRAINT [DF_tblSchedulePaymentSetup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[tblUsers] ADD  CONSTRAINT [DF_tblUsers_Disabled]  DEFAULT ((0)) FOR [Disabled]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [Reserves] SET  READ_WRITE 
GO
