USE [master]
GO
/****** Object:  Database [Layal]    Script Date: 7/21/2019 12:20:24 AM ******/
CREATE DATABASE [Layal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Layan', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AHMED\MSSQL\DATA\Layan.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Layan_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.AHMED\MSSQL\DATA\Layan_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Layal] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Layal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Layal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Layal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Layal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Layal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Layal] SET ARITHABORT OFF 
GO
ALTER DATABASE [Layal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Layal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Layal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Layal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Layal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Layal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Layal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Layal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Layal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Layal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Layal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Layal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Layal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Layal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Layal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Layal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Layal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Layal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Layal] SET  MULTI_USER 
GO
ALTER DATABASE [Layal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Layal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Layal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Layal] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Layal] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Layal] SET QUERY_STORE = OFF
GO
USE [Layal]
GO
/****** Object:  UserDefinedFunction [dbo].[EnquiryPayments_CheckIfClinetPaymentPricing]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[EnquiryPayments_CheckIfClinetPaymentPricing](@EnquiryId bigint) returns bit
as begin 
/*
الحصول على الدفعات الذى دفعها العميل 
واذا كانت تحويل بنكى فيجب ان تكون تمت الموافقة عليها
*/
declare @UserAcceptPayments decimal =
					(select sum(EnquiryPayments.Amount) from EnquiryPayments 
					where fkenquiry_Id=@EnquiryId and
					(IsBankTransfer =0 or IsAcceptFromManger=1)
					),
		@EventPricing decimal = 
					(select sum(PackagePrice)+sum(PackageNamsArExtraPrice) from Events
					where Id=@EnquiryId 	
					)
-- التحقق ان المدفوعات اكبر من سعر المناسبة
if(@UserAcceptPayments >= @EventPricing)
return 1
return 0
end
GO
/****** Object:  UserDefinedFunction [dbo].[GetNotificationsCountIsNotRead]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[GetNotificationsCountIsNotRead](@CuurentUserLoggadId bigint
) returns int
as begin
return (Select ISNULL(Count(Id),0) from NotificationsUser where FKUser_Id=@CuurentUserLoggadId and IsRead=0)
end
GO
/****** Object:  Table [dbo].[Words]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Words](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Ar] [nvarchar](max) NULL,
	[En] [nvarchar](max) NULL,
 CONSTRAINT [PK_Words] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkWord_Id] [bigint] NULL,
 CONSTRAINT [PK_AccountTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[AccountTypes_Select]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[AccountTypes_Select]
as     
select AccountTypes.*,
Words.Ar,
Words.En 
from AccountTypes
join Words on Words.Id=AccountTypes.FkWord_Id 
  

GO
/****** Object:  Table [dbo].[Countries]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[IsoCode] [nvarchar](50) NULL,
 CONSTRAINT [PK_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CountriesView]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CountriesView]
as 
select Countries.*,Words.Ar,
Words.En from  Countries join Words on Words.Id=Countries.Id
GO
/****** Object:  Table [dbo].[Cities]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[FKCountry_Id] [int] NOT NULL,
 CONSTRAINT [PK_Cities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CitiesView]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[CitiesView]
as 
select Cities.*,Words.Ar,
Words.En from  Cities join Words on Words.Id=Cities.Id
GO
/****** Object:  Table [dbo].[AlbumTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlbumTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_AlbumTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[FkCountry_Id] [int] NOT NULL,
	[FKCity_Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Branches] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeDistributionWorks]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeDistributionWorks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FKWorkType_Id] [int] NOT NULL,
	[FKEmployee_Id] [bigint] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EmployeeDistributionWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeesWorks]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeesWorks](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FkWorkType_Id] [int] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EmpoyeesWorks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enquires]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enquires](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNo] [nvarchar](50) NOT NULL,
	[FkCountry_Id] [int] NOT NULL,
	[FkCity_Id] [int] NOT NULL,
	[FKEnquiryType_Id] [int] NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[FKBranch_Id] [int] NULL,
	[IsLinkedClinet] [bit] NULL,
	[IsClosed] [bit] NULL,
	[ClosedDateTime] [datetime] NULL,
	[IsWithBranch] [bit] NOT NULL,
	[ClendarEventId] [nvarchar](max) NULL,
	[FkClinet_Id] [bigint] NULL,
	[IsCreatedEvent] [bit] NOT NULL,
 CONSTRAINT [PK_EnquiryForms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryNotes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryNotes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[FKEnquiryForm_Id] [bigint] NOT NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryFormNotes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryPayments]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryPayments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[IsDeposit] [bit] NOT NULL,
	[IsBankTransfer] [bit] NOT NULL,
	[TransferImage] [nvarchar](max) NULL,
	[IsAcceptFromManger] [bit] NULL,
	[DateTime] [datetime] NOT NULL,
	[FKEnquiry_Id] [bigint] NOT NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryPayments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryStatus]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[DateTime] [datetime] NOT NULL,
	[ScheduleVisitDateTime] [datetime] NULL,
	[FKEnquiry_Id] [bigint] NOT NULL,
	[FKEnquiryStatus_Id] [int] NOT NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
	[FKEnquiryPayment_Id] [bigint] NULL,
 CONSTRAINT [PK_EnquiryStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryStatusTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryStatusTypes](
	[Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryStatusTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EnquiryTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EnquiryTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EnquiryTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCoordinations]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCoordinations](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TaskNumber] [int] NOT NULL,
	[Task] [nvarchar](50) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[FKUserCreated_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_EventCoordination] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [bigint] NOT NULL,
	[IsClinetCustomLogo] [bit] NULL,
	[LogoFilePath] [nvarchar](max) NULL,
	[IsNamesAr] [bit] NULL,
	[NameGroom] [nvarchar](50) NULL,
	[NameBride] [nvarchar](50) NULL,
	[FKPrintNameType_Id] [int] NULL,
	[EventDateTime] [datetime] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[FKPackage_Id] [int] NOT NULL,
	[FKClinet_Id] [bigint] NOT NULL,
	[Notes] [nvarchar](max) NULL,
	[FKUserCreaed_Id] [bigint] NOT NULL,
	[FKBranch_Id] [int] NOT NULL,
	[ClendarEventId] [nvarchar](max) NULL,
	[PackagePrice] [decimal](18, 2) NOT NULL,
	[PackageNamsArExtraPrice] [decimal](18, 2) NOT NULL,
	[VistToCoordinationDateTime] [datetime] NULL,
	[VistToCoordinationClendarEventId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventWorksStatus]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventWorksStatus](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[IsFinshed] [bit] NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[FKEvent_Id] [bigint] NOT NULL,
	[FKWorkType_Id] [int] NOT NULL,
	[FKUsre_Id] [bigint] NOT NULL,
	[FKAccountType_Id] [int] NOT NULL,
 CONSTRAINT [PK_EventWorksStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Menus]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CssClass] [nvarchar](50) NOT NULL,
	[OrderByNumber] [int] NOT NULL,
	[Parent_Id] [int] NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[DateTime] [datetime] NOT NULL,
	[Target_Id] [bigint] NULL,
	[FKPage_Id] [int] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
	[FkWord_Id] [bigint] NOT NULL,
	[FKDescriptionWord_Id] [bigint] NOT NULL,
	[RedirectUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NotificationsUser]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NotificationsUser](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FKNotify_Id] [bigint] NOT NULL,
	[FKUser_Id] [bigint] NOT NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_NotificationsUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageDetails]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[FKPackageInputType_Id] [int] NOT NULL,
	[FKPackage_Id] [int] NOT NULL,
 CONSTRAINT [PK_PackageDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PackageInputTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageInputTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_PackageInputTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Packages]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FkWordName_Id] [bigint] NOT NULL,
	[IsAllowPrintNames] [bit] NOT NULL,
	[FkWordDescription_Id] [bigint] NOT NULL,
	[FKAlbumType_Id] [int] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[NamsArExtraPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[Url] [nvarchar](50) NOT NULL,
	[FkMenu_Id] [int] NOT NULL,
	[OrderByNumber] [int] NOT NULL,
	[IsForClient] [bit] NULL,
	[IsForAdmin] [bit] NULL,
	[IsHide] [bit] NOT NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrintNamesTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintNamesTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
 CONSTRAINT [PK_PrintNamesTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrivileges]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrivileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FKPage_Id] [int] NOT NULL,
	[FkUser_Id] [bigint] NOT NULL,
	[CanAdd] [bit] NOT NULL,
	[CanEdit] [bit] NOT NULL,
	[CanDelete] [bit] NOT NULL,
	[CanDisplay] [bit] NOT NULL,
 CONSTRAINT [PK_UserPrivileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[PhoneNo] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Password] [nvarchar](50) NOT NULL,
	[ActiveCode] [nvarchar](50) NULL,
	[FKAccountType_Id] [int] NOT NULL,
	[FkCountry_Id] [int] NULL,
	[FkCity_Id] [int] NULL,
	[FKLanguage_Id] [int] NOT NULL,
	[CreateDateTime] [datetime] NOT NULL,
	[FKPranch_Id] [int] NULL,
	[IsActiveEmail] [bit] NOT NULL,
	[DateOfBirth] [date] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkTypes]    Script Date: 7/21/2019 12:20:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkTypes](
	[Id] [int] NOT NULL,
	[FKWord_Id] [bigint] NOT NULL,
	[PageUrl] [nvarchar](50) NULL,
 CONSTRAINT [PK_WorkTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountTypes] ON 
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (1, 1)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (2, 4)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (3, 5)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (4, 6)
GO
INSERT [dbo].[AccountTypes] ([Id], [FkWord_Id]) VALUES (5, 20180)
GO
SET IDENTITY_INSERT [dbo].[AccountTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[AlbumTypes] ON 
GO
INSERT [dbo].[AlbumTypes] ([Id], [FKWord_Id]) VALUES (10, 20153)
GO
SET IDENTITY_INSERT [dbo].[AlbumTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 
GO
INSERT [dbo].[Branches] ([Id], [Address], [PhoneNo], [FkCountry_Id], [FKCity_Id], [FKWord_Id]) VALUES (2, N'28 شارع جدة فى المدينة المنصورة', N'0102524940', 1, 1, 47)
GO
INSERT [dbo].[Branches] ([Id], [Address], [PhoneNo], [FkCountry_Id], [FKCity_Id], [FKWord_Id]) VALUES (3, N'28 شارع جدة فى المدينة المنصورة', N'0102524940', 1, 1, 48)
GO
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[Cities] ON 
GO
INSERT [dbo].[Cities] ([Id], [FKWord_Id], [FKCountry_Id]) VALUES (1, 10, 1)
GO
SET IDENTITY_INSERT [dbo].[Cities] OFF
GO
SET IDENTITY_INSERT [dbo].[Countries] ON 
GO
INSERT [dbo].[Countries] ([Id], [FKWord_Id], [IsoCode]) VALUES (1, 8, N'02')
GO
INSERT [dbo].[Countries] ([Id], [FKWord_Id], [IsoCode]) VALUES (2, 9, N'259')
GO
SET IDENTITY_INSERT [dbo].[Countries] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeeDistributionWorks] ON 
GO
INSERT [dbo].[EmployeeDistributionWorks] ([Id], [FKWorkType_Id], [FKEmployee_Id], [FKEvent_Id]) VALUES (26, 3, 15, 6)
GO
SET IDENTITY_INSERT [dbo].[EmployeeDistributionWorks] OFF
GO
SET IDENTITY_INSERT [dbo].[EmployeesWorks] ON 
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (42, 3, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (43, 5, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (44, 6, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (45, 7, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (46, 8, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (47, 9, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (48, 10, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (49, 11, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (50, 12, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (51, 13, 15)
GO
INSERT [dbo].[EmployeesWorks] ([Id], [FkWorkType_Id], [FKUser_Id]) VALUES (52, 14, 15)
GO
SET IDENTITY_INSERT [dbo].[EmployeesWorks] OFF
GO
SET IDENTITY_INSERT [dbo].[Enquires] ON 
GO
INSERT [dbo].[Enquires] ([Id], [FirstName], [LastName], [PhoneNo], [FkCountry_Id], [FkCity_Id], [FKEnquiryType_Id], [FKUserCreated_Id], [CreateDateTime], [Day], [Month], [Year], [FKBranch_Id], [IsLinkedClinet], [IsClosed], [ClosedDateTime], [IsWithBranch], [ClendarEventId], [FkClinet_Id], [IsCreatedEvent]) VALUES (6, N'احمد', N'نجيب', N'0010254940', 1, 1, 9, 5, CAST(N'2019-07-20T22:28:59.757' AS DateTime), 1, 7, 2019, 2, 1, NULL, NULL, 1, NULL, 22, 1)
GO
SET IDENTITY_INSERT [dbo].[Enquires] OFF
GO
SET IDENTITY_INSERT [dbo].[EnquiryPayments] ON 
GO
INSERT [dbo].[EnquiryPayments] ([Id], [Amount], [IsDeposit], [IsBankTransfer], [TransferImage], [IsAcceptFromManger], [DateTime], [FKEnquiry_Id], [FKUserCreated_Id]) VALUES (14, CAST(10.00 AS Decimal(18, 2)), 1, 0, NULL, 0, CAST(N'2019-07-20T22:32:29.210' AS DateTime), 6, 16)
GO
INSERT [dbo].[EnquiryPayments] ([Id], [Amount], [IsDeposit], [IsBankTransfer], [TransferImage], [IsAcceptFromManger], [DateTime], [FKEnquiry_Id], [FKUserCreated_Id]) VALUES (15, CAST(10.00 AS Decimal(18, 2)), 1, 0, NULL, 0, CAST(N'2019-07-20T22:32:40.540' AS DateTime), 6, 16)
GO
INSERT [dbo].[EnquiryPayments] ([Id], [Amount], [IsDeposit], [IsBankTransfer], [TransferImage], [IsAcceptFromManger], [DateTime], [FKEnquiry_Id], [FKUserCreated_Id]) VALUES (16, CAST(30.00 AS Decimal(18, 2)), 0, 1, N'/Files/Enquiries/Payments/Image41eded6c-b8d2-49f8-a15b-84da725dc920.jpg', 1, CAST(N'2019-07-20T23:13:21.907' AS DateTime), 6, 16)
GO
INSERT [dbo].[EnquiryPayments] ([Id], [Amount], [IsDeposit], [IsBankTransfer], [TransferImage], [IsAcceptFromManger], [DateTime], [FKEnquiry_Id], [FKUserCreated_Id]) VALUES (17, CAST(20.00 AS Decimal(18, 2)), 0, 0, NULL, 0, CAST(N'2019-07-20T23:17:14.423' AS DateTime), 6, 16)
GO
SET IDENTITY_INSERT [dbo].[EnquiryPayments] OFF
GO
SET IDENTITY_INSERT [dbo].[EnquiryStatus] ON 
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id]) VALUES (31, N'sds', CAST(N'2019-07-20T22:32:29.207' AS DateTime), NULL, 6, 7, 16, 14)
GO
INSERT [dbo].[EnquiryStatus] ([Id], [Notes], [DateTime], [ScheduleVisitDateTime], [FKEnquiry_Id], [FKEnquiryStatus_Id], [FKUserCreated_Id], [FKEnquiryPayment_Id]) VALUES (32, N'sdsd', CAST(N'2019-07-20T22:32:40.540' AS DateTime), NULL, 6, 7, 16, 15)
GO
SET IDENTITY_INSERT [dbo].[EnquiryStatus] OFF
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (1, 78)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (2, 79)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (3, 80)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (4, 81)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (5, 82)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (6, 92)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (7, 93)
GO
INSERT [dbo].[EnquiryStatusTypes] ([Id], [FKWord_Id]) VALUES (8, 94)
GO
SET IDENTITY_INSERT [dbo].[EnquiryTypes] ON 
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (7, 42)
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (8, 43)
GO
INSERT [dbo].[EnquiryTypes] ([Id], [FKWord_Id]) VALUES (9, 44)
GO
SET IDENTITY_INSERT [dbo].[EnquiryTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[EventCoordinations] ON 
GO
INSERT [dbo].[EventCoordinations] ([Id], [TaskNumber], [Task], [StartTime], [EndTime], [Notes], [FKEvent_Id], [FKUserCreated_Id]) VALUES (9, 1, N'fdf', CAST(N'01:00:00' AS Time), CAST(N'01:00:00' AS Time), NULL, 6, 15)
GO
INSERT [dbo].[EventCoordinations] ([Id], [TaskNumber], [Task], [StartTime], [EndTime], [Notes], [FKEvent_Id], [FKUserCreated_Id]) VALUES (10, 2, N'qwqw', CAST(N'01:06:00' AS Time), CAST(N'01:06:00' AS Time), NULL, 6, 22)
GO
INSERT [dbo].[EventCoordinations] ([Id], [TaskNumber], [Task], [StartTime], [EndTime], [Notes], [FKEvent_Id], [FKUserCreated_Id]) VALUES (13, 3, N'sdsd', CAST(N'01:00:00' AS Time), CAST(N'13:00:00' AS Time), NULL, 6, 15)
GO
INSERT [dbo].[EventCoordinations] ([Id], [TaskNumber], [Task], [StartTime], [EndTime], [Notes], [FKEvent_Id], [FKUserCreated_Id]) VALUES (14, 4, N'dwewe', CAST(N'02:17:00' AS Time), CAST(N'01:17:00' AS Time), NULL, 6, 22)
GO
SET IDENTITY_INSERT [dbo].[EventCoordinations] OFF
GO
INSERT [dbo].[Events] ([Id], [IsClinetCustomLogo], [LogoFilePath], [IsNamesAr], [NameGroom], [NameBride], [FKPrintNameType_Id], [EventDateTime], [CreateDateTime], [FKPackage_Id], [FKClinet_Id], [Notes], [FKUserCreaed_Id], [FKBranch_Id], [ClendarEventId], [PackagePrice], [PackageNamsArExtraPrice], [VistToCoordinationDateTime], [VistToCoordinationClendarEventId]) VALUES (6, NULL, NULL, 1, N'يبيب', N'يبيب', 6, CAST(N'2019-01-01T01:00:00.000' AS DateTime), CAST(N'2019-07-20T23:09:41.313' AS DateTime), 1, 22, NULL, 16, 2, NULL, CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)), CAST(N'2019-01-01T01:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([Id], [Code], [Name]) VALUES (1, N'en', N'English')
GO
INSERT [dbo].[Languages] ([Id], [Code], [Name]) VALUES (2, N'ar', N'Arabic')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[Menus] ON 
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (1, N'fas fa-cogs', 1, NULL, 2)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (2, N'fas fa-users-cog', 2, NULL, 7)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (3, N'fab fa-wpforms', 3, NULL, 33)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (4, N'flaticon2-photo-camera
', 5, NULL, 10142)
GO
INSERT [dbo].[Menus] ([Id], [CssClass], [OrderByNumber], [Parent_Id], [FKWord_Id]) VALUES (5, N'fas fa-hand-holding-heart', 4, NULL, 20149)
GO
SET IDENTITY_INSERT [dbo].[Menus] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10051, CAST(N'2019-07-20T22:28:59.940' AS DateTime), 6, 5, 5, 20220, 20221, N'/Enquires/EnquiryInformation?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10052, CAST(N'2019-07-20T22:32:29.230' AS DateTime), 6, 5, 16, 20222, 20223, N'/EnquiryPayments/Payments?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10053, CAST(N'2019-07-20T22:32:29.333' AS DateTime), 6, 5, 16, 20224, 20225, N'/Enquires/EnquiryInformation?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10054, CAST(N'2019-07-20T22:32:40.563' AS DateTime), 6, 5, 16, 20226, 20227, N'/EnquiryPayments/Payments?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10055, CAST(N'2019-07-20T22:32:40.570' AS DateTime), 6, 5, 16, 20228, 20229, N'/Enquires/EnquiryInformation?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10056, CAST(N'2019-07-20T23:09:48.070' AS DateTime), 6, 12, 16, 20230, 20231, N'/Events/EventInformation?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10057, CAST(N'2019-07-20T23:13:22.117' AS DateTime), 6, 5, 16, 20232, 20233, N'/EnquiryPayments/Payments?id=6&notifyId=')
GO
INSERT [dbo].[Notifications] ([Id], [DateTime], [Target_Id], [FKPage_Id], [FKUser_Id], [FkWord_Id], [FKDescriptionWord_Id], [RedirectUrl]) VALUES (10058, CAST(N'2019-07-20T23:17:14.497' AS DateTime), 6, 5, 16, 20234, 20235, N'/EnquiryPayments/Payments?id=6&notifyId=')
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[NotificationsUser] ON 
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10051, 10051, 16, 1)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10052, 10052, 5, 0)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10053, 10053, 5, 0)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10054, 10054, 5, 0)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10055, 10055, 5, 0)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10056, 10056, 5, 0)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10057, 10057, 5, 1)
GO
INSERT [dbo].[NotificationsUser] ([Id], [FKNotify_Id], [FKUser_Id], [IsRead]) VALUES (10058, 10058, 5, 0)
GO
SET IDENTITY_INSERT [dbo].[NotificationsUser] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageDetails] ON 
GO
INSERT [dbo].[PackageDetails] ([Id], [FKWord_Id], [FKPackageInputType_Id], [FKPackage_Id]) VALUES (15, 20179, 6, 1)
GO
SET IDENTITY_INSERT [dbo].[PackageDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[PackageInputTypes] ON 
GO
INSERT [dbo].[PackageInputTypes] ([Id], [FKWord_Id]) VALUES (6, 10099)
GO
INSERT [dbo].[PackageInputTypes] ([Id], [FKWord_Id]) VALUES (8, 20155)
GO
SET IDENTITY_INSERT [dbo].[PackageInputTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Packages] ON 
GO
INSERT [dbo].[Packages] ([Id], [FkWordName_Id], [IsAllowPrintNames], [FkWordDescription_Id], [FKAlbumType_Id], [Price], [NamsArExtraPrice]) VALUES (1, 10143, 1, 20156, 10, CAST(50.00 AS Decimal(18, 2)), CAST(20.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Packages] OFF
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (1, 3, N'/UsersPrivileges', 2, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (2, 12, N'/Users', 2, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (3, 13, N'/Countries', 1, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (4, 34, N'/EnquiryTypes', 3, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (5, 41, N'/Enquires', 3, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (6, 45, N'/Branches', 1, 3, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (7, 50, N'/MyEnquires', 3, 1, 1, 0, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (8, 51, N'/MyEnquires/AddAndUpdate', 3, 2, 1, 0, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (9, 51, N'/Enquires/AddAndUpdate', 3, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (10, 85, N'/', 2, 3, 0, 1, 1)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (11, 10088, N'/PrintNamesTypes', 1, 4, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (12, 10141, N'/Events', 4, 1, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (13, 10141, N'/MyEvents', 4, 1, 1, 0, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (14, 20147, N'/Packages', 5, 3, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (15, 20148, N'/AlbumTypes', 5, 2, 0, 1, 0)
GO
INSERT [dbo].[Pages] ([Id], [FKWord_Id], [Url], [FkMenu_Id], [OrderByNumber], [IsForClient], [IsForAdmin], [IsHide]) VALUES (16, 20150, N'/PackageInputTypes', 5, 1, 0, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[PrintNamesTypes] ON 
GO
INSERT [dbo].[PrintNamesTypes] ([Id], [FKWord_Id]) VALUES (6, 10099)
GO
INSERT [dbo].[PrintNamesTypes] ([Id], [FKWord_Id]) VALUES (7, 10100)
GO
SET IDENTITY_INSERT [dbo].[PrintNamesTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPrivileges] ON 
GO
INSERT [dbo].[UserPrivileges] ([Id], [FKPage_Id], [FkUser_Id], [CanAdd], [CanEdit], [CanDelete], [CanDisplay]) VALUES (13, 5, 16, 0, 0, 0, 1)
GO
INSERT [dbo].[UserPrivileges] ([Id], [FKPage_Id], [FkUser_Id], [CanAdd], [CanEdit], [CanDelete], [CanDisplay]) VALUES (16, 2, 16, 1, 0, 0, 0)
GO
INSERT [dbo].[UserPrivileges] ([Id], [FKPage_Id], [FkUser_Id], [CanAdd], [CanEdit], [CanDelete], [CanDisplay]) VALUES (17, 10, 16, 0, 0, 0, 1)
GO
INSERT [dbo].[UserPrivileges] ([Id], [FKPage_Id], [FkUser_Id], [CanAdd], [CanEdit], [CanDelete], [CanDisplay]) VALUES (18, 12, 16, 1, 1, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[UserPrivileges] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive]) VALUES (5, N'ahmed', N'a0hed@gmail.com', N'01025249400', N'dfdfdfdfdffdfdfdfssssd', N'123456', NULL, 1, 1, 1, 2, CAST(N'2020-01-01T00:00:00.000' AS DateTime), NULL, 0, NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive]) VALUES (15, N'ahmed10', N'a0hmed@gmail.com', N'010252494', N'sdsd', N'123456', NULL, 5, 1, 1, 2, CAST(N'2019-06-22T22:33:57.323' AS DateTime), 2, 0, NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive]) VALUES (16, N'branch', N'branch@gmail.com', N'0102524900', N'sdsd', N'123456', NULL, 3, 1, 1, 2, CAST(N'2019-06-24T23:19:06.467' AS DateTime), 2, 0, NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive]) VALUES (18, N'fdf', N'a55550hmed@gmail.com55', N'0010254940', N'sdsdsd', N'123456', N'C-13893', 5, 1, 1, 1, CAST(N'2019-06-30T18:13:13.637' AS DateTime), 2, 1, NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive]) VALUES (19, N'testUser', N'shahnda2017@gmail.com', N'1236454215', NULL, N'123456', N'C-19904', 4, 1, 1, 2, CAST(N'2019-07-04T20:57:04.583' AS DateTime), 2, 1, NULL, 1)
GO
INSERT [dbo].[Users] ([Id], [UserName], [Email], [PhoneNo], [Address], [Password], [ActiveCode], [FKAccountType_Id], [FkCountry_Id], [FkCity_Id], [FKLanguage_Id], [CreateDateTime], [FKPranch_Id], [IsActiveEmail], [DateOfBirth], [IsActive]) VALUES (22, N'ahme', N'a0hme55d@gmail.com', N'00710254940', N'ewe', N'123456', N'C-13786', 4, 1, 1, 2, CAST(N'2019-07-20T23:08:40.137' AS DateTime), 2, 1, CAST(N'2019-01-01' AS Date), 1)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Words] ON 
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (1, N'مدير المشروع', N'Project Manager ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (2, N'الاعدادت', N'Setting')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (3, N'صلاحيات الستخدم', N'Users Privileges')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (4, N'مشرف', N'Supervisor')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (5, N'مدير فرع', N'Branch Manager')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (6, N'عميل', N'Clinet')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (7, N'المستخدمين', N'Users')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (8, N'مصر', N'Egypt')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (9, N'الكويت', N'kuwait')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10, N'القاهرة', N'cairo')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (12, N'المستخدمين', N'Users')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (13, N'الدول', N'Countries')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (33, N'الاستفسارات', N'Enquires')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (34, N'انواع الاستفسارات', N'Enquiry Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (41, N'الاستفسارات', N'Enquires')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (42, N'عبر الواتساب', N'By Whatssp')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (43, N'عبر الفيس بوك', N'By FaceBook')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (44, N'عبر الهاتف', N'By Phone')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (45, N'فروع الشركة', N'Branches')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (47, N'جدة', N'Gada')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (48, N'المدينة المنورة', N'Medina')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (50, N'استفسارتى', N'My Enquires')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (51, N'اضافة استفسار جديد', N'Add New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (52, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (53, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (54, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (55, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (56, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (57, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (58, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (59, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (60, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (61, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (62, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (63, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (64, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (65, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (66, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (67, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (68, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (69, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (70, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (71, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (72, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (73, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (74, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (75, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (76, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (77, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (78, N'العميل لم يرد', N'Not Answer ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (79, N'تم التواصل مع العميل ', N'Customer Contacted')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (80, N'رفض الخدمة ', N'Reject Service')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (81, N'الموافقة التامة', N'Full Approval')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (82, N'تحديد موعد للزيارة ', N' Schedule a Visit')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (83, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (84, N'لقد قام العميل ahmed10  بنشاء استفسار جديد', N'ahmed10 Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (85, N'معلومات المستخدم', N'User Information')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (86, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (87, N'لقد قامت الآدارة بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (88, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (89, N'لقد قامت الآدارة تحويل استفسار جديد لك', N'Manger Has been Convert New Enqiry For You')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (90, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (91, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (92, N'يحتاج للتفكير ', N'Needs To Think')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (93, N'الرغبة فى الحجز', N'Desire To Book ')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (94, N'عربون حوالة بنكية', N'Bank Transfer Deposit')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10088, N'انواع طباعة  الاسماء', N'Print Names Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10089, N'dfdf', N'dfdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10090, N'dssd', N'sdsd`')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10091, N'sd', N'dsdضضضض')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10092, N'سي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10096, N'sdsd', N'dfdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10099, N'حفر 1', N'p1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10100, N'حفر 2', N'p2sddddddddd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10101, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10102, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10103, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10104, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10105, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10106, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10107, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10108, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10109, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10110, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10111, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10112, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10113, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10114, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10115, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10116, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10117, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10118, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10119, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10120, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10121, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10122, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10123, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10124, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10125, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10126, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10127, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10128, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10129, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10130, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10131, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10132, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10133, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10134, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10135, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10136, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10137, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10138, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10139, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10140, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10141, N'المناسبات', N'Events')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10142, N'المناسبات', N'Events')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10143, N'تجربة', N'tese')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10144, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10145, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10146, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (10147, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20146, N'مناسباتى', N'MyEvents')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20147, N'الباكيجات', N'Packages')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20148, N'انواع الالبومات', N'Album Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20149, N'الباكيجات', N'Packages')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20150, N'انواع مدخلت الباكيجات', N'Package Input Types')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20151, N'سيسي', N'سيسي')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20152, N'سيسي', N'يسيسي\')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20153, N'البوم 1', N'album 1')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20154, N'asas', N'sdsdsdsdsd55522')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20155, N'fdf', N'dfdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20156, N'cvcv000000', N'fdf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20157, N'dfdfq', N',fdklfj')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20158, N'idojfdlfnl', N'dsdfkjsf')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20159, N'dsdsd', N'vv')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20161, N'صث', N'صث')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20162, N'صث', N'صث')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20163, N'صث', N'صث')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20164, N'd', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20165, N'd', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20166, N'd', N'ds')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20167, N'يسسي', N'sasas')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20168, N'dsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20169, N'sdsd', N'sdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20170, N'sd', N'sd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20179, N'sdsd', N'ssdsd')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20180, N'موظف', N'Employee')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20181, N'الحجز', N'Booking')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20182, N'اكمال البيانات', N'Data Perfection')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20183, N'الاعداد والتنسيق', N'Coordination')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20184, N'التنفيذ', N'Implementation')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20185, N'الأرشفة و الحفظ', N'Archiving and Saveing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20186, N'تجهيز المنتاجات', N'Product processing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20187, N'الاختيار', N'Chooseing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20188, N'المعالجة الرقمية', N'Digital processing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20189, N'الاعداد للطباعة', N'Preparing for printing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20190, N'التصنيع', N'Manufacturing')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20191, N'الجودة و المراجعة', N'Quality and review')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20192, N'التغليف', N'Packaging')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20193, N'الارسال و التسليم', N'Transmission and delivery
')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20194, N'الأرشفة', N'Archiving')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20195, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20196, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 20', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20197, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20198, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 20', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 20')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20199, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20200, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20201, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20202, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20203, N'بيانات المدفوعات', N'Payments Informations')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20204, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20205, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 2000', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 2000')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20206, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20207, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20208, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20209, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 50', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 50')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20210, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20211, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 51', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 51')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20212, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20213, N'لقد قام الموظف   ahmed باضافة عملية دفع عن طريق دفع نقدا وقيمتها 55', N'ahmed Has been Add Payment Process By Cash Payment And It Is Valaue 55')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20214, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20215, N'لقد قام المدير  باضافة عملية دفع عن طريق دفع نقدا وقيمتها 54', N'Manger Has been Add Payment Process By Cash Payment And It Is Valaue 54')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20216, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20217, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20218, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20219, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20220, N' استفسار جدبد', N'New Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20221, N'لقد قام المدير بنشاء استفسار جديد', N'Manger Has been created new enqiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20222, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20223, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 10', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 10')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20224, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20225, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20226, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20227, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 10', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 10')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20228, N'اضافة حالة جديدة على استفسار ما', N'Add New Status On Some Enquiry')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20229, N'لقد قام branch بـ وضع حالة جديد   ', N'branch Has Been Add New Status')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20230, N'لقج تم انشاء حدث جديد', N'Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20231, N'لقد قام مدير فرع جدة بـ انشاء حدث جديد ', N'Gada Branch Manger Has Been Created New Event')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20232, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20233, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق حولة بنكية وقيمتها 30', N'branch Has been Add Payment Process By Bank Transfer And It Is Valaue 30')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20234, N'عملية دفع جديدة', N'New Payment Process')
GO
INSERT [dbo].[Words] ([Id], [Ar], [En]) VALUES (20235, N'لقد قام الموظف   branch باضافة عملية دفع عن طريق دفع نقدا وقيمتها 20', N'branch Has been Add Payment Process By Cash Payment And It Is Valaue 20')
GO
SET IDENTITY_INSERT [dbo].[Words] OFF
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (1, 20181, N'')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (2, 20182, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (3, 20183, N'/EventCoordinations')
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (4, 20184, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (5, 20185, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (6, 20186, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (7, 20187, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (8, 20188, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (9, 20189, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (10, 20190, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (11, 20191, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (12, 20192, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (13, 20193, NULL)
GO
INSERT [dbo].[WorkTypes] ([Id], [FKWord_Id], [PageUrl]) VALUES (14, 20194, NULL)
GO
ALTER TABLE [dbo].[Enquires] ADD  CONSTRAINT [DF_Enquires_IsCreatedEvent]  DEFAULT ((0)) FOR [IsCreatedEvent]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsActiveEmail]  DEFAULT ((0)) FOR [IsActiveEmail]
GO
ALTER TABLE [dbo].[AccountTypes]  WITH CHECK ADD  CONSTRAINT [FK_AccountTypes_Words] FOREIGN KEY([FkWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AccountTypes] CHECK CONSTRAINT [FK_AccountTypes_Words]
GO
ALTER TABLE [dbo].[AlbumTypes]  WITH CHECK ADD  CONSTRAINT [FK_AlbumTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlbumTypes] CHECK CONSTRAINT [FK_AlbumTypes_Words]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Cities] FOREIGN KEY([FKCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Cities]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Countries]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Words]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Countries] FOREIGN KEY([FKCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Countries]
GO
ALTER TABLE [dbo].[Cities]  WITH CHECK ADD  CONSTRAINT [FK_Cities_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cities] CHECK CONSTRAINT [FK_Cities_Words]
GO
ALTER TABLE [dbo].[Countries]  WITH CHECK ADD  CONSTRAINT [FK_Countries_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Countries] CHECK CONSTRAINT [FK_Countries_Words]
GO
ALTER TABLE [dbo].[EmployeeDistributionWorks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmployeeDistributionWorks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_Events]
GO
ALTER TABLE [dbo].[EmployeeDistributionWorks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_Users] FOREIGN KEY([FKEmployee_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDistributionWorks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_Users]
GO
ALTER TABLE [dbo].[EmployeeDistributionWorks]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDistributionWorks_WorkTypes] FOREIGN KEY([FKWorkType_Id])
REFERENCES [dbo].[WorkTypes] ([Id])
GO
ALTER TABLE [dbo].[EmployeeDistributionWorks] CHECK CONSTRAINT [FK_EmployeeDistributionWorks_WorkTypes]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_Enquires_Branches] FOREIGN KEY([FKBranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_Enquires_Branches]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_Cities] FOREIGN KEY([FkCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_Cities]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_Countries]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_EnquiryTypes] FOREIGN KEY([FKEnquiryType_Id])
REFERENCES [dbo].[EnquiryTypes] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_EnquiryTypes]
GO
ALTER TABLE [dbo].[Enquires]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryForms_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Enquires] CHECK CONSTRAINT [FK_EnquiryForms_Users]
GO
ALTER TABLE [dbo].[EnquiryNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryFormNotes_EnquiryForms] FOREIGN KEY([FKEnquiryForm_Id])
REFERENCES [dbo].[Enquires] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryNotes] CHECK CONSTRAINT [FK_EnquiryFormNotes_EnquiryForms]
GO
ALTER TABLE [dbo].[EnquiryNotes]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryFormNotes_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EnquiryNotes] CHECK CONSTRAINT [FK_EnquiryFormNotes_Users]
GO
ALTER TABLE [dbo].[EnquiryPayments]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryPayments_Enquires] FOREIGN KEY([FKEnquiry_Id])
REFERENCES [dbo].[Enquires] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryPayments] CHECK CONSTRAINT [FK_EnquiryPayments_Enquires]
GO
ALTER TABLE [dbo].[EnquiryPayments]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryPayments_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EnquiryPayments] CHECK CONSTRAINT [FK_EnquiryPayments_Users]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_Enquires] FOREIGN KEY([FKEnquiry_Id])
REFERENCES [dbo].[Enquires] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_Enquires]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_EnquiryPayments] FOREIGN KEY([FKEnquiryPayment_Id])
REFERENCES [dbo].[EnquiryPayments] ([Id])
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_EnquiryPayments]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_EnquiryStatusTypes] FOREIGN KEY([FKEnquiryStatus_Id])
REFERENCES [dbo].[EnquiryStatusTypes] ([Id])
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_EnquiryStatusTypes]
GO
ALTER TABLE [dbo].[EnquiryStatus]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatus_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EnquiryStatus] CHECK CONSTRAINT [FK_EnquiryStatus_Users]
GO
ALTER TABLE [dbo].[EnquiryStatusTypes]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryStatusTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryStatusTypes] CHECK CONSTRAINT [FK_EnquiryStatusTypes_Words]
GO
ALTER TABLE [dbo].[EnquiryTypes]  WITH CHECK ADD  CONSTRAINT [FK_EnquiryTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EnquiryTypes] CHECK CONSTRAINT [FK_EnquiryTypes_Words]
GO
ALTER TABLE [dbo].[EventCoordinations]  WITH CHECK ADD  CONSTRAINT [FK_EventCoordination_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventCoordinations] CHECK CONSTRAINT [FK_EventCoordination_Events]
GO
ALTER TABLE [dbo].[EventCoordinations]  WITH CHECK ADD  CONSTRAINT [FK_EventCoordination_Users] FOREIGN KEY([FKUserCreated_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EventCoordinations] CHECK CONSTRAINT [FK_EventCoordination_Users]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Branches] FOREIGN KEY([FKBranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Branches]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Packages] FOREIGN KEY([FKPackage_Id])
REFERENCES [dbo].[Packages] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Packages]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_PrintNamesTypes] FOREIGN KEY([FKPrintNameType_Id])
REFERENCES [dbo].[PrintNamesTypes] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_PrintNamesTypes]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Users] FOREIGN KEY([FKClinet_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Users]
GO
ALTER TABLE [dbo].[EventWorksStatus]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_AccountTypes] FOREIGN KEY([FKAccountType_Id])
REFERENCES [dbo].[AccountTypes] ([Id])
GO
ALTER TABLE [dbo].[EventWorksStatus] CHECK CONSTRAINT [FK_EventWorksStatus_AccountTypes]
GO
ALTER TABLE [dbo].[EventWorksStatus]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_Events] FOREIGN KEY([FKEvent_Id])
REFERENCES [dbo].[Events] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventWorksStatus] CHECK CONSTRAINT [FK_EventWorksStatus_Events]
GO
ALTER TABLE [dbo].[EventWorksStatus]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_Users] FOREIGN KEY([FKUsre_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[EventWorksStatus] CHECK CONSTRAINT [FK_EventWorksStatus_Users]
GO
ALTER TABLE [dbo].[EventWorksStatus]  WITH CHECK ADD  CONSTRAINT [FK_EventWorksStatus_WorkTypes] FOREIGN KEY([FKWorkType_Id])
REFERENCES [dbo].[WorkTypes] ([Id])
GO
ALTER TABLE [dbo].[EventWorksStatus] CHECK CONSTRAINT [FK_EventWorksStatus_WorkTypes]
GO
ALTER TABLE [dbo].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Menus] CHECK CONSTRAINT [FK_Menus_Words]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Notifications] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Notifications]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Pages] FOREIGN KEY([FKPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Pages]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Words] FOREIGN KEY([FkWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Words]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Words1] FOREIGN KEY([FKDescriptionWord_Id])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_Words1]
GO
ALTER TABLE [dbo].[NotificationsUser]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsUser_Notifications] FOREIGN KEY([FKNotify_Id])
REFERENCES [dbo].[Notifications] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NotificationsUser] CHECK CONSTRAINT [FK_NotificationsUser_Notifications]
GO
ALTER TABLE [dbo].[NotificationsUser]  WITH CHECK ADD  CONSTRAINT [FK_NotificationsUser_Users] FOREIGN KEY([FKUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[NotificationsUser] CHECK CONSTRAINT [FK_NotificationsUser_Users]
GO
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetails_PackageInputTypes] FOREIGN KEY([FKPackageInputType_Id])
REFERENCES [dbo].[PackageInputTypes] ([Id])
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_PackageDetails_PackageInputTypes]
GO
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetails_Packages] FOREIGN KEY([FKPackage_Id])
REFERENCES [dbo].[Packages] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_PackageDetails_Packages]
GO
ALTER TABLE [dbo].[PackageDetails]  WITH CHECK ADD  CONSTRAINT [FK_PackageDetails_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageDetails] CHECK CONSTRAINT [FK_PackageDetails_Words]
GO
ALTER TABLE [dbo].[PackageInputTypes]  WITH CHECK ADD  CONSTRAINT [FK_PackageInputTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PackageInputTypes] CHECK CONSTRAINT [FK_PackageInputTypes_Words]
GO
ALTER TABLE [dbo].[Packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_AlbumTypes] FOREIGN KEY([FKAlbumType_Id])
REFERENCES [dbo].[AlbumTypes] ([Id])
GO
ALTER TABLE [dbo].[Packages] CHECK CONSTRAINT [FK_Packages_AlbumTypes]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Menus] FOREIGN KEY([FkMenu_Id])
REFERENCES [dbo].[Menus] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Menus]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Words]
GO
ALTER TABLE [dbo].[PrintNamesTypes]  WITH CHECK ADD  CONSTRAINT [FK_PrintNamesTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PrintNamesTypes] CHECK CONSTRAINT [FK_PrintNamesTypes_Words]
GO
ALTER TABLE [dbo].[UserPrivileges]  WITH CHECK ADD  CONSTRAINT [FK_UserPrivileges_Pages] FOREIGN KEY([FKPage_Id])
REFERENCES [dbo].[Pages] ([Id])
GO
ALTER TABLE [dbo].[UserPrivileges] CHECK CONSTRAINT [FK_UserPrivileges_Pages]
GO
ALTER TABLE [dbo].[UserPrivileges]  WITH CHECK ADD  CONSTRAINT [FK_UserPrivileges_Users] FOREIGN KEY([FkUser_Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserPrivileges] CHECK CONSTRAINT [FK_UserPrivileges_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_AccountTypes] FOREIGN KEY([FKAccountType_Id])
REFERENCES [dbo].[AccountTypes] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_AccountTypes]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Branches] FOREIGN KEY([FKPranch_Id])
REFERENCES [dbo].[Branches] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Branches]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Cities] FOREIGN KEY([FkCity_Id])
REFERENCES [dbo].[Cities] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Cities]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Countries] FOREIGN KEY([FkCountry_Id])
REFERENCES [dbo].[Countries] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Countries]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Languages] FOREIGN KEY([FKLanguage_Id])
REFERENCES [dbo].[Languages] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Languages]
GO
ALTER TABLE [dbo].[WorkTypes]  WITH CHECK ADD  CONSTRAINT [FK_WorkTypes_Words] FOREIGN KEY([FKWord_Id])
REFERENCES [dbo].[Words] ([Id])
GO
ALTER TABLE [dbo].[WorkTypes] CHECK CONSTRAINT [FK_WorkTypes_Words]
GO
/****** Object:  StoredProcedure [dbo].[AlbumTypes_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AlbumTypes_CheckIfUsed] 
@Id int
as begin

select 
isnull(count(*),0)  from Packages where FKAlbumType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[AlbumTypes_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AlbumTypes_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from Cities where Id=@Id)
delete  AlbumTypes where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[AlbumTypes_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[AlbumTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[AlbumTypes]
           ([FKWord_Id]
           )
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[AlbumTypes_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AlbumTypes_SelectAll] 
as begin 

select AlbumTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from AlbumTypes

join Words on Words.Id= AlbumTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[AlbumTypes_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AlbumTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select AlbumTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from AlbumTypes

join Words on Words.Id= AlbumTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[AlbumTypes_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[AlbumTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[Branches_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Branches_CheckIfUsed] 
@Id bigint
as begin

select (count(*)-1)as countr from Branches
left join Enquires on Enquires.FKBranch_Id=Branches.Id
where Branches.Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from Branches where Id=@Id)
delete  Branches where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[Branches_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@Address nvarchar(max),
@Phone nvarchar(50),
@CountryId int , 
@CityId int ,
@WordId int output


as begin
-- Insert Word 
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[Branches]
           ([Address]
           ,PhoneNo
           ,[FkCountry_Id]
           ,[FKCity_Id]
           ,[FKWord_Id])
		   values (@Address,@Phone,@CountryId,@CityId,@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_SelectByAll]
as begin 
select 
		Branches.*,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn

from Branches
join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id
end
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_SelectByFilter]
--Paging
	@Skip int , 
	@Take int 

as begin 
select 
		Branches.*,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn,
		(select COUNT(Id) from Enquires where FKBranch_Id=Branches.Id) as EnquiresCount

from Branches

join Countries on Countries.Id=Branches.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Branches.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id
 
join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id

	order by Branches.Id desc
	offset @Skip rows
	Fetch next @Take Rows Only

end
GO
/****** Object:  StoredProcedure [dbo].[Branches_SelectByPk]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Branches_SelectByPk]
@Id bigint 
as begin 
select 
		Branches.*,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		BrancheWord.Ar as BrancheNameAr,
		BrancheWord.En as BrancheNameEn
 
from Branches

join Countries on Countries.Id=Branches.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Branches.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id

join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id

 
where Branches.Id = @Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Branches_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE  proc [dbo].[Branches_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@Address nvarchar(max),
@Phone nvarchar(50),
@CountryId int , 
@CityId int ,
@WordId bigint


as begin
-- Update Word 
exec  dbo.Words_Update @WordId, @NameAr,@NameEn
-- Insert Target
update [dbo].[Branches]
           set [Address]=@Address
           ,PhoneNo=@Phone
           ,[FkCountry_Id]=@CountryId
           ,[FKCity_Id]=@CityId
end


GO
/****** Object:  StoredProcedure [dbo].[Cities_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cities_CheckIfUsed] 
@Id bigint
as begin

select 
count(*)from Users where FkCity_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Cities_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cities_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from Cities where Id=@Id)
delete  Cities where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Cities_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[Cities_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@CountryId int

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[Cities]
           ([FKWord_Id]
           ,FKCountry_Id)
     VALUES
           (@WordId,@CountryId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cities_SelectAll] 

as begin 
select Cities.* ,
Words.Ar,
Words.En
from Cities
join Words on Words.Id=Cities.FKWord_Id
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Cities_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cities_SelectByFilter] 
@CountryId int
as begin 
select Cities.* ,
Words.Ar,
Words.En
from Cities
join Words on Words.Id=Cities.FKWord_Id
where FKCountry_Id=@CountryId
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Cities_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[Cities_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[Countries_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_CheckIfUsed] 
@Id bigint
as begin
declare @count int ;
select 
(count(*)-1) as countr from countries 
left join users on users.FkCountry_Id=countries.Id
left join Branches on Branches.FkCountry_Id=countries.Id

where countries.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Countries_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_Delete]
@Id bigint
as begin


delete Cities where FKCountry_Id=@Id
delete  Countries where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[Countries_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Countries_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@IsoCode nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[Countries]
           ([FKWord_Id]
           ,[IsoCode])
     VALUES
           (@WordId,@IsoCode)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[Countries_IsoCodeBeforUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Countries_IsoCodeBeforUsed] 
@Id bigint,
@IsoCode nvarchar(50)
as begin

select count(*) from Countries where IsoCode=@IsoCode
and (@Id = 0 or @Id is null or Id!=@Id) 

end
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Countries_SelectAll] 

as begin 
select Countries.* ,
Words.Ar,
Words.En
from Countries
join Words on Words.Id=Countries.FKWord_Id
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select Countries.*,
Words.Ar as NameAr,
Words.En as NameEn from Countries

join Words on Words.Id= Countries.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[Countries_SelectWithCitiesByPk]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Countries_SelectWithCitiesByPk] 
@Id int 
as begin 
select Countries.* ,
Words.Ar as CountryNameAr,
Words.En as CountryNameEn ,

Cities.Id as CityId, 
Cities.FKWord_Id as CityFkWord_Id,
CityWord.Ar as CityNameAr,
CityWord.En as CityNameEn 

from Countries
join Words on Words.Id=Countries.FKWord_Id
left join Cities on Cities.FKCountry_Id=Countries.Id
left join Words as CityWord on CityWord.Id=Cities.FKWord_Id

where Countries.Id=@Id
end 

 
GO
/****** Object:  StoredProcedure [dbo].[Countries_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[Countries_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@IsoCode nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
update Countries 
set IsoCode=@IsoCode
where Id=@Id

end


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionWorks_CheckIfInserted]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EmployeeDistributionWorks_CheckIfInserted]
 
@WorkTypeId int,
@EmployeeId bigint,
@EventId bigint
as begin
select  count(*) from  [dbo].[EmployeeDistributionWorks]
where [FKWorkType_Id]=@WorkTypeId 
and	  [FKEmployee_Id]=@EmployeeId
and   FKEvent_Id=@EventId

		    
end


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionWorks_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EmployeeDistributionWorks_Delete]
@Id bigint
as begin
DELETE FROM [dbo].[EmployeeDistributionWorks]
      where Id=@Id
end 


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionWorks_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeeDistributionWorks_Insert]
@Id	bigint	output,
@WorkTypeId int,
@EmployeeId bigint,
@EventId bigint
as begin
INSERT INTO [dbo].[EmployeeDistributionWorks]
           ([FKWorkType_Id]
           ,[FKEmployee_Id],
		   FKEvent_Id)
     VALUES
           (@WorkTypeId,@EmployeeId,@EventId)

		   select @Id=@@IDENTITY
end


GO
/****** Object:  StoredProcedure [dbo].[EmployeeDistributionWorks_SelectByEventId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeeDistributionWorks_SelectByEventId]
@EventId bigint

as begin 

select EmployeeDistributionWorks.*,
	ISNULL((select top 1 IsFinshed from EventWorksStatus where FKEvent_Id=@EventId and FKWorkType_Id=EmployeeDistributionWorks.FKWorkType_Id ),0)	as IsFinshed
		from  EmployeeDistributionWorks 
where FKEvent_Id=@EventId

end 
GO
/****** Object:  StoredProcedure [dbo].[Employees_CheckAllowAccessToEventForUpdateWorks]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employees_CheckAllowAccessToEventForUpdateWorks] 
@IsAdmin bit , 
@IsClint bit,
@IsEmployee bit,
@IsBranchManger bit , 
@eventId bigint,
@workTypeId int,
@userLoggedId bigint,
@BranchId int 
as begin 

--اذا كان المدير العام فيجب يرجع بـ ترو
if(@IsAdmin=1) select 1

--التحقق اذا كان موظف نتحقق من صلاحيات الموظفين
else if (@IsEmployee=1)
select count(*) from EmployeeDistributionWorks 
where FKEvent_Id=@eventId
and FKWorkType_Id=@workTypeId
and FKEmployee_Id=@userLoggedId

--اذا كان عميل فيجب ان يكون هوا صاحب تلك المناسبة
else if (@IsClint=1)
select count(*) from Events where Id=@eventId and FKClinet_Id=@userLoggedId

-- اذا كان مدير فرع اذا يجب ان يكون هوا مدير على هذة المناسبة
else if (@IsBranchManger=1)
select count(*) from Events where Id=@eventId and FKBranch_Id=@BranchId




end
GO
/****** Object:  StoredProcedure [dbo].[Employees_SelectWorks]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Employees_SelectWorks]
@EmpId bigint
as begin 
select EmployeesWorks.*,
Words.Ar as WorkNameAr,
Words.En as WorkNameEn,
WorkTypes.PageUrl,

(select count(Id) from EmployeeDistributionWorks where FKWorkType_Id=EmployeesWorks.FKWorkType_Id and FKEmployee_Id=@EmpId ) as WorksCount
from WorkTypes 
join EmployeesWorks on EmployeesWorks.FKUser_Id=@EmpId and EmployeesWorks.FkWorkType_Id=WorkTypes.Id
join Words on Words.Id=WorkTypes.FKWord_Id

end
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_CheckIfInserted]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_CheckIfInserted]
@WorkTypeId int ,
@UserId bigint
as begin 

select ISNULL(count(*),0)  from EmployeesWorks 
 where FkWorkType_Id=@WorkTypeId and FKUser_Id=@UserId 

end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_Delete]
@UserId bigint
as begin 
delete EmployeesWorks where FKUser_Id=@UserId

end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_Insert]
@WorkType_Id	int, 
@UserId	bigint 
as begin 
insert EmployeesWorks (FkWorkType_Id,FKUser_Id)values(@WorkType_Id,@UserId)
end 
GO
/****** Object:  StoredProcedure [dbo].[EmployeesWorks_SelectByUserId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EmployeesWorks_SelectByUserId] 
@UserId bigint

as begin 

select * from EmployeesWorks where FKUser_Id=@UserId

end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Closed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_Closed]
@EnquiryId bigint ,
@DateTime datetime
as begin 
--اغلاق الاستفسار
 update Enquires
	  set IsClosed=1 , 
	  ClosedDateTime = @DateTime,
	  IsWithBranch=1
	  
	  where Id=@EnquiryId 
	  --ارجاع معرفات جوجل من اجل حذفهم
	  Select Enquires.ClendarEventId as Enquiry_ClendarEventId,
	           events.ClendarEventId as Event_ClendarEventId,
			   events.VistToCoordinationClendarEventId
	  from Enquires 
	 left join events on events.Id=Enquires.Id
	  where Enquires.Id=@EnquiryId
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[Enquires_Delete]
 @Id bigint 
 as begin
 delete Enquires where Id =@Id
end

GO
/****** Object:  StoredProcedure [dbo].[Enquires_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Enquires_Insert]
 @Id bigint output,
 @FirstName nvarchar(50),
 @LastName nvarchar(50),
 @PhoneNo nvarchar(50),
 @Day int ,
 @Month int , 
 @Year int ,
 @FkCountry_Id int,
 @FkCity_Id int,
 @FKEnquiryType_Id int,
 @FKUserCreated_Id bigint,
 @CreateDateTime datetime,
 @Notes nvarchar(max),
 @BranchId int,
 @IsLinkedClinet bit,
 @IFWithBranch  bit

 as begin
 
 if(@FKEnquiryType_Id =0)
	set @FKEnquiryType_Id=null
 
 if(@BranchId =0)
	set @BranchId=null
	
INSERT INTO [dbo].[Enquires]
           ([FirstName]
           ,[LastName]
           ,[PhoneNo]
           ,[FkCountry_Id]
           ,[FkCity_Id]
           ,[FKEnquiryType_Id]
           ,[FKUserCreated_Id]
           ,[CreateDateTime],
		   [Day],
		   [Month],
		   [Year],
		   FKBranch_Id,
		   IsLinkedClinet,IsWithBranch )
     VALUES
          (@FirstName,  
           @LastName,
           @PhoneNo,
           @FkCountry_Id, 
           @FkCity_Id,
           @FKEnquiryType_Id, 
           @FKUserCreated_Id,
           @CreateDateTime,
		   @Day,
		   @Month,
		   @Year,
		   @BranchId,
		   @IsLinkedClinet,@IFWithBranch 
		   )
select @Id = @@IDENTITY

 if(@Notes is not null)
insert EnquiryNotes (Notes,CreateDateTime,FKEnquiryForm_Id,FKUserCreated_Id)
values (@Notes,@CreateDateTime,@Id,@FKUserCreated_Id)
end

GO
/****** Object:  StoredProcedure [dbo].[Enquires_IsClosed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Enquires_IsClosed] 
@EnquiryId bigint 
as begin 

select count(*) from Enquires where Id=@EnquiryId and IsClosed=1

end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_SelectByFilter]
--Paging
	@Skip int , 
	@Take int ,
--Filter
	@FirstName nvarchar(50),
	@LastName nvarchar(50),
	@Phone nvarchar(50),
	@Day int ,
	@Month int ,
	@Year int ,
	@CreateDateTimeFrom datetime,
	@CreateDateTimeTo datetime,
	@CountryId int , 
	@CityId int ,
	@EnquiryId int, 
	@BranchId int,
	@IsForCurrentUser bit,
	@CurrentUserLoggadId bigint,
	@IsLinkedClinet bit,
	@IsWithBranch bit
	


as begin 
select 
		Enquires.*,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		EnquiryTypeWord.Ar as EnquiryTypeNameAr,
		EnquiryTypeWord.En as EnquiryTypeNameEn,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn,
		UserCreated.UserName as EnquiryCreatedUserName,
		(select count(*) from EnquiryPayments where IsDeposit =1 and (IsBankTransfer=0 or IsAcceptFromManger=1)) as CountIsDepositPaymented
from Enquires

join Countries on Countries.Id=Enquires.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Enquires.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id

left join EnquiryTypes on EnquiryTypes.Id=Enquires.FKEnquiryType_Id
left join Words EnquiryTypeWord on EnquiryTypeWord.Id=EnquiryTypes.FKWord_Id

left join Branches on Branches.Id=Enquires.FKBranch_Id
left join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id


join Users as UserCreated on UserCreated.Id=Enquires.FKUserCreated_Id

where 
	(@IsLinkedClinet is null  or  [Enquires].IsLinkedClinet=@IsLinkedClinet)
	and 
	(@IsForCurrentUser = 0 or [Enquires].FKUserCreated_Id=@CurrentUserLoggadId or [Enquires].FkClinet_Id=@CurrentUserLoggadId)
	and
	(@BranchId is null or @BranchId =0  or [Enquires].FKBranch_Id=@BranchId)
	and
	(@BranchId is null or @BranchId !=0  or [Enquires].FKBranch_Id is null)
	and
	(@EnquiryId is null or @EnquiryId =0 or Enquires.FKEnquiryType_Id=@EnquiryId) 
	and 
	(@CountryId is null or @CountryId =0 or Enquires.FkCountry_Id=@CountryId) 
	and 
	(@CityId is null or @CityId =0 or Enquires.FkCity_Id=@CityId) 
	and 
	(@Day is null  or [Enquires].[Day]=@Day)
	and 
	(@Month is null  or [Enquires].[Month]=@Month)
	and 
	(@Year is null  or [Enquires].[Year]=@Year)
	and 
	(@CreateDateTimeFrom is null  or Enquires.CreateDateTime>=@CreateDateTimeFrom) 
	and 
	(@CreateDateTimeTo is null  or Enquires.CreateDateTime<=@CreateDateTimeTo) 
	and 
	(@Phone = ''  or Enquires.PhoneNo like '%'+@Phone+'%') 
	and 
	(@FirstName = ''  or Enquires.FirstName like '%'+@FirstName+'%') 
	and 
	(@LastName = ''  or Enquires.LastName like '%'+@LastName+'%') 
	and 
	(@IsWithBranch is null  or Enquires.IsWithBranch =@IsWithBranch) 

	
	
	order by Enquires.Id desc
	offset @Skip rows
	Fetch next @Take Rows Only

end
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByPk]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_SelectByPk]
@EnquiyId bigint 
as begin 
select 
		Enquires.*,
		CountryWord.Ar as CountryNameAr,
		CountryWord.En as CountryNameEn,
		CityWord.Ar as CityNameAr,
		CityWord.En as CityNameEn,
		EnquiryTypeWord.Ar as EnquiryTypeNameAr,
		EnquiryTypeWord.En as EnquiryTypeNameEn,
		BrancheWord.Ar as BranchNameAR,
		BrancheWord.En as BranchNameEn,
		UserCreated.UserName as EnquiryCreatedUserName,
		(select count(*) from EnquiryPayments where IsDeposit =1 and (IsBankTransfer=0 or IsAcceptFromManger=1)) as CountIsDepositPaymented

from Enquires

join Countries on Countries.Id=Enquires.FkCountry_Id
join Words CountryWord on CountryWord.Id=Countries.FKWord_Id

join Cities on Cities.Id=Enquires.FkCity_Id
join Words CityWord on CityWord.Id=Cities.FKWord_Id

left join EnquiryTypes on EnquiryTypes.Id=Enquires.FKEnquiryType_Id
left join Words EnquiryTypeWord on EnquiryTypeWord.Id=EnquiryTypes.FKWord_Id

left join Branches on Branches.Id=Enquires.FKBranch_Id
left join Words BrancheWord on BrancheWord.Id=Branches.FKWord_Id

join Users as UserCreated on UserCreated.Id=Enquires.FKUserCreated_Id




where Enquires.Id = @EnquiyId
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_SelectByPk_SimpleData]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquires_SelectByPk_SimpleData] 
@EnauiryId bigint 
as begin 
select Enquires.*,
		(select count(*) from EnquiryPayments where IsDeposit =1 and (IsBankTransfer=0 or IsAcceptFromManger=1)) as CountIsDepositPaymented
from Enquires where Id=@EnauiryId
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquires_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Enquires_Update]
 @Id bigint,
 @FirstName nvarchar(50),
 @LastName nvarchar(50),
 @PhoneNo nvarchar(50),
 @Day int , 
 @Month int ,
 @Year int,
 @FkCountry_Id int,
 @FkCity_Id int,
 @FKEnquiryType_Id int,
 @Notes nvarchar(max),
 @NotesCreateDateTime datetime,
 @NotesFkUsereCreatedId bigint,
 @BranchId int,
 @IsWithBranch bit

 as begin
 UPDATE [dbo].[Enquires]
   SET [FirstName] =@FirstName  ,
      [LastName] =@LastName ,
      [PhoneNo] = @PhoneNo,
      [FkCountry_Id] =@FkCountry_Id ,
      [FkCity_Id] =@FkCity_Id ,
      [FKEnquiryType_Id] =@FKEnquiryType_Id,
	  [Day]=@Day,
	  [Month]=@Month,
	  [Year]=@Year,
	  FKBranch_Id=@BranchId,
	  IsWithBranch=@IsWithBranch
    
 WHERE Id=@Id
 if(@Notes is not null)
 insert EnquiryNotes 
 (CreateDateTime,FKEnquiryForm_Id,FKUserCreated_Id,Notes)
 values (@NotesCreateDateTime,@Id,@NotesFkUsereCreatedId,@Notes)
end

GO
/****** Object:  StoredProcedure [dbo].[Enquiries_ChangeCreateEventState]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Enquiries_ChangeCreateEventState]
@Id bigint,
@IsCreatedEvent bit
as begin 
update Enquires 
	   set IsCreatedEvent=@IsCreatedEvent 
	   where Id=   @Id    
end 
GO
/****** Object:  StoredProcedure [dbo].[Enquiries_UpdateCalendarEventId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Enquiries_UpdateCalendarEventId]
 @EnquiryId bigint,
 @ClendarEventId nvarchar(max)
 as begin

 update Enquires
 set ClendarEventId=@ClendarEventId
 where Id=@EnquiryId

 end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryNote_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[EnquiryNote_Insert]
@Notes nvarchar(max),
@CreateDateTime datetime , 
@FKEnquiryForm_Id bigint,
@FKUserCreated_Id bigint
as begin
INSERT INTO [dbo].[EnquiryNotes]
           ([Notes]
           ,[CreateDateTime]
           ,[FKEnquiryForm_Id]
           ,[FKUserCreated_Id])
     VALUES
           (@Notes,@CreateDateTime,@FKEnquiryForm_Id,@FKUserCreated_Id)
end


GO
/****** Object:  StoredProcedure [dbo].[EnquiryNotes_SelectByEnquiryId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryNotes_SelectByEnquiryId]
@EnquiryId bigint 
as begin
select
	EnquiryNotes.*, UserCreatedNotes.UserName
from EnquiryNotes
left join Users as UserCreatedNotes on UserCreatedNotes.Id=EnquiryNotes.FKUserCreated_Id
where EnquiryNotes.FKEnquiryForm_Id = @EnquiryId
order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_AcceptFromManger]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_AcceptFromManger]
@Id	bigint,
@IsDeposit bit,
@EnquiryId bigint
as begin

update [dbo].[EnquiryPayments]
      set [IsAcceptFromManger]=1
	  where Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_CheckIfClinetPaymentEventPricing]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EnquiryPayments_CheckIfClinetPaymentEventPricing]
@EnquiryId bigint 
as begin 

select dbo.EnquiryPayments_CheckIfClinetPaymentPricing(@EnquiryId)
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_Insert]
@Id	bigint output,
@Amount  decimal(18,2),
@IsDeposit bit,
@IsBankTransfer bit,
@TransferImage nvarchar(max),
@IsAcceptFromManger bit,
@DateTime datetime,
@FKEnquiry_Id bigint,
@FKUserCreated_Id bigint
		   
as begin

INSERT INTO [dbo].[EnquiryPayments]
           ([Amount]
           ,[IsDeposit]
           ,[IsBankTransfer]
           ,[TransferImage]
           ,[IsAcceptFromManger]
           ,[DateTime]
           ,[FKEnquiry_Id]
           ,[FKUserCreated_Id])
     VALUES
           (@Amount,
           @IsDeposit,
           @IsBankTransfer,
           @TransferImage,  
           @IsAcceptFromManger,
           @DateTime, 
           @FKEnquiry_Id,
           @FKUserCreated_Id)

		   select @Id=@@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryPayments_SelectByEnquiryId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryPayments_SelectByEnquiryId]
@EnquiryId bigint

as begin

select 
EnquiryPayments.*, 
Users.UserName as UserCreatedName
from EnquiryPayments  
join Users on Users.Id=EnquiryPayments.FKUserCreated_Id

where FKEnquiry_Id=@EnquiryId

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatus_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryStatus_Insert]
@Notes nvarchar(max),
@DateTime datetime , 
@EnquiryId bigint,
@EnquiryStatusId int, 
@ScheduleVisitDateTime datetime,

@UserCreatedId bigint,
@IFWithBranch  bit,
@EnquiryPaymentId bigint
as begin
INSERT INTO [dbo].[EnquiryStatus]
           ([Notes]
           ,[DateTime]
           ,[FKEnquiry_Id]
           ,[FKEnquiryStatus_Id]
           ,[ScheduleVisitDateTime],
		   FKUserCreated_Id,
		   FKEnquiryPayment_Id)
     VALUES (@Notes,@DateTime,@EnquiryId,@EnquiryStatusId,@ScheduleVisitDateTime,@UserCreatedId,@EnquiryPaymentId)


if(@IFWithBranch is not null)
 update Enquires
	  set IsWithBranch=@IFWithBranch where Id=@EnquiryId 
   
           
		   
end

GO
/****** Object:  StoredProcedure [dbo].[EnquiryStatusTypes_SelectByEnquiryId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[EnquiryStatusTypes_SelectByEnquiryId]
@EnquiyId bigint 
as begin 
select 
		EnquiryStatus.Id as Status_Id,
		WordEnquiryStatusType.Ar as Status_NameAr,
		WordEnquiryStatusType.En as Status_NameEn,
		EnquiryStatus.Notes as Status_Notes,
		EnquiryStatus.DateTime as Status_CreateDateTime,
		EnquiryStatus.ScheduleVisitDateTime as Status_ScheduleVisitDateTime,
		EnquiryStatus.FKUserCreated_Id as Status_UserCreatedId,
		EnquiryStatus.FKEnquiryPayment_Id	as Status_EnquiryPaymentId,
		EnquiryPayments.Amount,
		UserCreatedStatus.UserName as Status_CreatedUserName

from EnquiryStatus
 
 join Users as UserCreatedStatus on UserCreatedStatus.Id=EnquiryStatus.FKUserCreated_Id

 join EnquiryStatusTypes on EnquiryStatusTypes.Id=EnquiryStatus.FKEnquiryStatus_Id
 join Words  as WordEnquiryStatusType on WordEnquiryStatusType.Id=EnquiryStatusTypes.FKWord_Id
left join EnquiryPayments on EnquiryPayments.Id=EnquiryStatus.FKEnquiryPayment_Id

where EnquiryStatus.FKEnquiry_Id = @EnquiyId
order by EnquiryStatus.Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryTypes_CheckIfUsed] 
@Id bigint
as begin

select 
count(*)from Enquires where FKEnquiryType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EnquiryTypes_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from EnquiryTypes where Id=@Id)

delete  EnquiryTypes where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[EnquiryTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[EnquiryTypes]
           ([FKWord_Id])
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create proc [dbo].[EnquiryTypes_SelectAll] 

as begin 

select EnquiryTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from EnquiryTypes

join Words on Words.Id= EnquiryTypes.FKWord_Id

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EnquiryTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select EnquiryTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from EnquiryTypes

join Words on Words.Id= EnquiryTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[EnquiryTypes_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[EnquiryTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 

end


GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_Delete]
			 
            @Id bigint
			as begin
delete [dbo].[EventCoordinations]
where Id=@Id
			end
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_Insert]
			@TaskNumber int,
            @Task nvarchar(50),
            @StartTime time(7),
            @EndTime time(7),
            @Notes nvarchar(max),
            @FKEvent_Id bigint,
            @FKUserCreated_Id bigint
			as begin
INSERT INTO [dbo].[EventCoordinations]
           (TaskNumber
           ,[Task]
           ,[StartTime]
           ,[EndTime]
           ,[Notes]
           ,[FKEvent_Id]
           ,[FKUserCreated_Id])
     VALUES
           (@TaskNumber  ,
 			@Task ,
			@StartTime,
			@EndTime ,
			@Notes ,
			@FKEvent_Id ,
			@FKUserCreated_Id )

			end
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_SelectByEventId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_SelectByEventId]
			 
            @EventId bigint
			as begin
select EventCoordinations.*,Users.UserName from 
EventCoordinations
join Users on Users.Id=EventCoordinations.FKUserCreated_Id

where EventCoordinations.FKEvent_Id=@EventId
			end
GO
/****** Object:  StoredProcedure [dbo].[EventCoordinations_SelectTasksNumber]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventCoordinations_SelectTasksNumber]
			 
            @EventId bigint
			as begin
select EventCoordinations.TaskNumber from 
EventCoordinations

where EventCoordinations.FKEvent_Id=@EventId
			end
GO
/****** Object:  StoredProcedure [dbo].[Events_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_Insert]
		   @Id	bigint  ,
		   @IsClinetCustomLogo            bit,
           @LogoFilePath               nvarchar(max),
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTime			   datetime,
           @CreateDateTime			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
           @FKClinet_Id					bigint,
           @Notes						nvarchar(max),
           @FKUserCreaed_Id				bigint,
           @FKBranch_Id					int,
		   @PackagePrice decimal(18,2),
		   @PackageNamsArExtraPrice decimal(18,2),
		   @VistToCoordinationDateTime datetime

as begin
INSERT INTO [dbo].[Events]
           (Id,[IsClinetCustomLogo]
           ,[LogoFilePath]
           ,[IsNamesAr]
           ,[NameGroom]
           ,[NameBride]
           ,[EventDateTime]
           ,[CreateDateTime]
           ,[FKPackage_Id]
           ,[FKPrintNameType_Id]
           ,[FKClinet_Id]
           ,[Notes]
           ,[FKUserCreaed_Id]
           ,[FKBranch_Id],
		   PackagePrice ,
		   PackageNamsArExtraPrice ,
		   VistToCoordinationDateTime)
     VALUES
           (@Id,@IsClinetCustomLogo     ,
			@LogoFilePath           ,
			@IsNamesAr              ,
			@NameGroom				,
			@NameBride				,
			@EventDateTime			,
			@CreateDateTime			,
			@FKPackage_Id			,
			@FKPrintNameType_Id		,
			@FKClinet_Id			,	
			@Notes					,
			@FKUserCreaed_Id		,	
			@FKBranch_Id,
			@PackagePrice ,
		    @PackageNamsArExtraPrice,
			@VistToCoordinationDateTime)

			set @Id=@@IDENTITY
end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_SelectByFilter]
		   --Paging
		   @Skip int , 
		   @Take int ,
		   --Filter
		   @IsClinetCustomLogo            bit,
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTimeTo			   datetime,
           @EventDateTimeFrom			   datetime,
           @CreateDateTimeTo			   datetime,
           @CreateDateTimeFrom			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
           @FKBranch_Id					int,
		   @IsForCurrentClinet bit,
		   @CurrentClinetId bigint


		   
as begin 

select Events.* ,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   WordBranche.Ar	as Branch_NameAr, 
	   WordBranche.En	as Branch_NameEn,
	   WordPackage.Ar	as Package_NameAr, 
	   WordPackage.En	as Package_NameEn,
		WordPrintNamesType.Ar	as WordPrintNamesType_NameAr, 
		WordPrintNamesType.En	as WordPrintNamesType_NameEn,
	   dbo.EnquiryPayments_CheckIfClinetPaymentPricing(Events.Id) as IsPayment

	from Events

left	join Enquires on Enquires.Id = Events.Id
	
	join Branches   on Branches.Id = Events.FKBranch_Id
	join Packages   on Packages.Id = Events.FKPackage_Id
left	join PrintNamesTypes   on PrintNamesTypes.Id = Events.FKPrintNameType_Id

	join Words as WordBranche   on WordBranche.Id = Branches.FKWord_Id
	join Words as WordPackage   on WordPackage.Id = Packages.FkWordName_Id
left	join Words as WordPrintNamesType   on WordPrintNamesType.Id = PrintNamesTypes.FKWord_Id

	where 
	(     @IsClinetCustomLogo	is null or	Events.IsClinetCustomLogo	=@IsClinetCustomLogo	)																					
	and(  @IsNamesAr           	is null or	Events.IsNamesAr           	=@IsNamesAr				)					
	and(  @NameGroom			is null or	Events.NameGroom			=@NameGroom				)					
	and(  @NameBride			is null or	Events.NameBride			=@NameBride				)					
	and(  @EventDateTimeFrom	is null or	Events.EventDateTime>=		@EventDateTimeFrom			)					
	and(  @EventDateTimeTo		is null or	Events.EventDateTime<=		@EventDateTimeTo			)					
	and(  @CreateDateTimeFrom	is null or	Events.CreateDateTime>=		@CreateDateTimeFrom		)					
	and(  @CreateDateTimeTo		is null or	Events.CreateDateTime<=		@CreateDateTimeTo		)					
	and(  @FKPackage_Id			is null or	Events.FKPackage_Id			=@FKPackage_Id			)					
	and(  @FKPrintNameType_Id	is null or	Events.FKPrintNameType_Id	=@FKPrintNameType_Id	)					
	and(  @FKBranch_Id			is null or	Events.FKBranch_Id			=@FKBranch_Id			)						
	and(  @IsForCurrentClinet	is null or	Events.FKClinet_Id =@CurrentClinetId)					


	order by Id  desc
	Offset @skip rows
	Fetch Next @Take rows only



end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByFilterForEmployee]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Events_SelectByFilterForEmployee]
		   --Paging
		   @Skip int , 
		   @Take int ,
		   --Filter
		   @IsClinetCustomLogo            bit,
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTimeTo			   datetime,
           @EventDateTimeFrom			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
		   @WorkTypeId	int,
		   @EmplolyeeId bigint

		   
as begin 

select Events.* ,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   WordBranche.Ar	as Branch_NameAr, 
	   WordBranche.En	as Branch_NameEn,
	   WordPackage.Ar	as Package_NameAr, 
	   WordPackage.En	as Package_NameEn,
	   WordPrintNamesType.Ar	as WordPrintNamesType_NameAr, 
	   WordPrintNamesType.En	as WordPrintNamesType_NameEn


	from Events
	
	join EmployeeDistributionWorks
	on EmployeeDistributionWorks.FKEvent_Id=Events.Id and 
	EmployeeDistributionWorks.FKEmployee_Id=@EmplolyeeId and 
	EmployeeDistributionWorks.FKWorkType_Id=@WorkTypeId

 	join Enquires on Enquires.Id = Events.Id
	
	join Branches   on Branches.Id = Events.FKBranch_Id
	join Packages   on Packages.Id = Events.FKPackage_Id
	left join PrintNamesTypes   on PrintNamesTypes.Id = Events.FKPrintNameType_Id

	join Words as WordBranche   on WordBranche.Id = Branches.FKWord_Id
	join Words as WordPackage   on WordPackage.Id = Packages.FkWordName_Id
	left join Words as WordPrintNamesType   on WordPrintNamesType.Id = PrintNamesTypes.FKWord_Id

	where 
	(Enquires.IsClosed=0 or Enquires.IsClosed is null)  and 
	-- التحق
	(     @IsClinetCustomLogo	is null or	Events.IsClinetCustomLogo	=@IsClinetCustomLogo	)																					
	and(  @IsNamesAr           	is null or	Events.IsNamesAr           	=@IsNamesAr				)					
	and(  @NameGroom			is null or	Events.NameGroom			=@NameGroom				)					
	and(  @NameBride			is null or	Events.NameBride			=@NameBride				)					
	and(  @EventDateTimeFrom	is null or	Events.EventDateTime>=		@EventDateTimeFrom			)					
	and(  @EventDateTimeTo		is null or	Events.EventDateTime<=		@EventDateTimeTo			)					
	and(  @FKPackage_Id			is null or	Events.FKPackage_Id			=@FKPackage_Id			)					
	and(  @FKPrintNameType_Id	is null or	Events.FKPrintNameType_Id	=@FKPrintNameType_Id	)					


	order by Id  desc
	Offset @skip rows
	Fetch Next @Take rows only



end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectByPK]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_SelectByPK]
@Id bigint
as begin 

select Events.*,
(select IsNull(sum(Amount),0) from EnquiryPayments where FKEnquiry_Id=Events.Id)as TotalPayments,
(select IsNull(sum(Amount),0) from EnquiryPayments
where EnquiryPayments.IsBankTransfer =0  or EnquiryPayments.IsAcceptFromManger=1 and FKEnquiry_Id=Events.Id)as TotalPaymentsActivated,
	   dbo.EnquiryPayments_CheckIfClinetPaymentPricing(Events.Id) as IsPayment

from Events

	where Events.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Events_SelectInformation]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_SelectInformation]
@Id bigint
as begin 

select Events.* ,
	   Enquires.FirstName +' '+ Enquires.LastName as EnquiryName ,
	   Enquires.IsClosed ,
	   PackageWord.Ar as Package_NameAr,
	   PackageWord.En as Package_NameEn ,
	   Packages.IsAllowPrintNames as Package_IsAllowPrintNames,
	   PrintNameTypeWord.Ar as PrintNameType_NameAr,
	   PrintNameTypeWord.En as PrintNameType_NameEn ,
	    
	   BranchWord.Ar as Branch_NameAr,
	   BranchWord.En as Branch_NameEn ,
	   
	   Clinet.UserName as Clinet_UserName,
	   UserCreated.UserName as UserCreated_UserName,
	   (select IsNull(sum(Amount),0) from EnquiryPayments)as TotalPayments,
	   dbo.EnquiryPayments_CheckIfClinetPaymentPricing(Enquires.Id) as IsPayment,

(select IsNull(sum(Amount),0) from EnquiryPayments where EnquiryPayments.IsBankTransfer =0  or EnquiryPayments.IsAcceptFromManger=1 and FKEnquiry_Id=Events.Id)as TotalPaymentsActivated

	   
	from Events

left	join Enquires on Enquires.Id = Events.Id
	
	join Packages on Packages.Id = Events.FKPackage_Id
	join Words as PackageWord  on PackageWord.Id = Packages.FkWordName_Id
	
	join PrintNamesTypes on PrintNamesTypes.Id = Events.FKPrintNameType_Id
	join Words as PrintNameTypeWord  on PrintNameTypeWord.Id = PrintNamesTypes.FKWord_Id
	
	 
	join Branches on Branches.Id = Events.FKBranch_Id
	join Words as BranchWord  on BranchWord.Id = Branches.FKWord_Id


	join Users as Clinet  on Clinet.Id = Events.FKClinet_Id
	join Users as UserCreated  on UserCreated.Id = Events.FKUserCreaed_Id

	where Events.Id=@Id
end
GO
/****** Object:  StoredProcedure [dbo].[Events_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Events_Update]
		   @Id	bigint  ,
		   @IsClinetCustomLogo            bit,
           @LogoFilePath               nvarchar(max),
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @EventDateTime			   datetime,
           @FKPackage_Id				int,
           @FKPrintNameType_Id			int,
           @Notes						nvarchar(max),
		   @PackagePrice decimal(18,2),
		   @PackageNamsArExtraPrice decimal(18,2),
		   @VistToCoordinationDateTime datetime

as begin
update [dbo].[Events]
          set [IsClinetCustomLogo]  =@IsClinetCustomLogo    										 
           ,[LogoFilePath]			=@LogoFilePath           
           ,[IsNamesAr]				=@IsNamesAr              
           ,[NameGroom]				=@NameGroom				 
           ,[NameBride]				=@NameBride				 
           ,[EventDateTime]			=@EventDateTime			 
           ,[FKPackage_Id]			=@FKPackage_Id			 
           ,[FKPrintNameType_Id]	=@FKPrintNameType_Id		 
           ,[Notes]					=@Notes	,
		    PackagePrice= @PackagePrice ,
		    PackageNamsArExtraPrice= @PackageNamsArExtraPrice ,
			VistToCoordinationDateTime=@VistToCoordinationDateTime
   

			where Id=@Id
end									
			 
			 
			 
			 
			
			
			
			
			
			
			
				
				
			
				
			
GO
/****** Object:  StoredProcedure [dbo].[Events_Update2]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Events_Update2]
		   @Id	bigint  ,
		   @IsClinetCustomLogo            bit,
           @LogoFilePath               nvarchar(max),
           @IsNamesAr                  bit,
           @NameGroom				   nvarchar(50),
           @NameBride				   nvarchar(50),
           @FKPrintNameType_Id			int,
		      @PackagePrice decimal(18,2),
		   @PackageNamsArExtraPrice decimal(18,2)

as begin
update [dbo].[Events]
          set [IsClinetCustomLogo]  =@IsClinetCustomLogo    										 
           ,[LogoFilePath]			=@LogoFilePath           
           ,[IsNamesAr]				=@IsNamesAr              
           ,[NameGroom]				=@NameGroom				 
           ,[NameBride]				=@NameBride				 
           ,[FKPrintNameType_Id]	=@FKPrintNameType_Id	,	 
		     PackagePrice= @PackagePrice ,
		  PackageNamsArExtraPrice= @PackageNamsArExtraPrice 
   

			where Id=@Id
end									
			 
			 
			 
			 
			
			
			
			
			
			
			
				
				
			
				
			
GO
/****** Object:  StoredProcedure [dbo].[Events_UpdateCalendarEventId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc [dbo].[Events_UpdateCalendarEventId]
 @EventId bigint,
 @ClendarEventId nvarchar(max),
 @VistToCoordinationClendarEventId nvarchar(max),
 @IsUpdateVistClendar bit,
 @IsUpdateClendar bit

 as begin

 if(@IsUpdateClendar =1)
 update Events
 set ClendarEventId=@ClendarEventId
 where Id=@EventId

 if(@IsUpdateVistClendar=1)
  update Events
 set VistToCoordinationClendarEventId=@VistToCoordinationClendarEventId
 where Id=@EventId
  

 end
GO
/****** Object:  StoredProcedure [dbo].[EventWorksStatus_CheckIfFinshed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventWorksStatus_CheckIfFinshed] 
@eventId bigint
as begin
select count(*) from EventWorksStatus where FKEvent_Id=@eventId and IsFinshed=1

end
GO
/****** Object:  StoredProcedure [dbo].[EventWorksStatus_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[EventWorksStatus_Insert]
@IsFinshed bit,
@DateTime datetime,
@FKEvent_Id bigint,
@FKWorkType_Id int,
@FKUsre_Id  bigint,
@FKAccountType_Id int
as begin
INSERT INTO [dbo].[EventWorksStatus]
           ([IsFinshed]
           ,[DateTime]
           ,[FKEvent_Id]
           ,[FKWorkType_Id]
           ,[FKUsre_Id]
           ,[FKAccountType_Id])
     VALUES
          (@IsFinshed ,
@DateTime ,
@FKEvent_Id ,
@FKWorkType_Id ,
@FKUsre_Id  ,
@FKAccountType_Id )
end


GO
/****** Object:  StoredProcedure [dbo].[EventWorksStatus_SelectByEventId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EventWorksStatus_SelectByEventId]
@eventId bigint
as begin 

select EventWorksStatus.*,Users.UserName,
Word.Ar	as AccountTypeAr,
Word.En	as AccountTypeEn 
from EventWorksStatus 
join Users on
Users.Id=EventWorksStatus.FKUsre_Id

join AccountTypes on AccountTypes.Id=Users.FKAccountType_Id
join Words as Word on Word.Id=AccountTypes.FkWord_Id
where FKEvent_Id=@eventId

end 
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Menus_SelectAll]

as begin
 select 
		Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as MenuNameEn

		from Menus 
 join Words on Words.Id=Menus.FKWord_Id

 order by Menus.OrderByNumber 
 end
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAllByUser_Id]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Menus_SelectAllByUser_Id]
@UserId bigint
as begin
 select 
 Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as MenuNameEn,
		PageWord.Ar as PageNameAr,
		PageWord.En as PageNameEn
 from Menus 

 join Pages 
 on Pages.FkMenu_Id=Menus.Id 

 join Words on Words.Id=Menus.FKWord_Id
 join PageWord as PageWord on PageWord.Id=Pages.FKWord_Id

 join UsersPrivileges 
 on (@UserId is null or UsersPrivileges.FkEmployee_Id=@UserId	 	 )
 and UsersPrivileges.FkPage_Id=Pages.Id

 order by Menus.OrderByNumber 
 end
GO
/****** Object:  StoredProcedure [dbo].[Menus_SelectAllForUserCanBeAccess]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Menus_SelectAllForUserCanBeAccess]	 
 
@UserId bigint ,
@IsPublicMenus bit

as begin
--نتحقق اذا كان يريد القوءم التى بها لـ المستخدم العادى نقوم بجلبها مباشرة اذا بها صفح ولا يوجد هنا تحققات لان المستخدم العادى ليس له صلاحيات وله صفح خاصة بة 
if(@IsPublicMenus =1 )
select distinct Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as		MenuNameEn from Menus 

 join Words on Words.Id=Menus.FKWord_Id 
 join Pages on Pages.FkMenu_Id=Menus.Id 
 where Pages.IsForClient=1 and Pages.IsHide=0

		order by Menus.OrderByNumber
--**********************************************************
--**********************************************************
else if(@UserId is null or @UserId =0 )
 select Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as		MenuNameEn from Menus 
 join Words on Words.Id=Menus.FKWord_Id

		order by Menus.OrderByNumber 

 else
--**********************************************************
--**********************************************************
 -- جلب كل القوائم التى يمكن المستخدم الوصول اليها بشكل مباشر
  select 
		Menus.*,
		Words.Ar as MenuNameAr,
		Words.En as		MenuNameEn
		from Menus 

 join Pages on Pages.FkMenu_Id=Menus.Id 
 join Words on Words.Id=Menus.FKWord_Id
 join UserPrivileges on UserPrivileges.FkUser_Id=@UserId 
 and UserPrivileges.FkPage_Id=Pages.Id 
 where     Pages.IsHide=0

 union 
 -- جلب كل القوائم الرئيسية بناء ع القوائم الفرعية المسموح لها بـ الظهور
  select 
		Parent.*,
  		Words.Ar as MenuNameAr,
		Words.En as	MenuNameEn
		from Menus 

 join Menus as Parent on Parent.Id=Menus.Parent_Id 
 join Pages on Pages.FkMenu_Id=Menus.Id 
 join Words on Words.Id=Parent.FKWord_Id
 join UserPrivileges on UserPrivileges.FkUser_Id=@UserId 
      and UserPrivileges.FkPage_Id=Pages.Id

where 
 Menus.Parent_Id is not null   
 and Pages.IsHide=0

 order by Menus.OrderByNumber 
 end
GO
/****** Object:  StoredProcedure [dbo].[Notifications_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[Notifications_Insert]
	@Id bigint output,
	@DateTime datetime,
	@TargetId bigint,
	@PageId bigint,
	@UserId bigint,
	@NameAr nvarchar(max),
	@NameEn nvarchar(max),
	@DescriptionAr nvarchar(max),
	@DescriptionEn nvarchar(max),
	@RedirectUrl nvarchar(max),
	@UserTargrtId bigint
as begin
declare @WordId bigint,
@WordDescriptionId bigint

exec @WordId = Words_Insert @NameAr,@NameEn;
exec @WordDescriptionId = Words_Insert @DescriptionAr,@DescriptionEn;

INSERT INTO [dbo].[Notifications]
           ([DateTime],[Target_Id],[FKPage_Id],[FKUser_Id],[FkWord_Id],[FKDescriptionWord_Id],RedirectUrl)
     VALUES (@DateTime,@TargetId,@PageId,@UserId,@WordId,@WordDescriptionId,@RedirectUrl)

select @id=@@IDENTITY
	 exec NotificationsUser_Insert @id,@UserTargrtId

end

GO
/****** Object:  StoredProcedure [dbo].[Notifications_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Notifications_SelectByFilter]
--Paging
@Skip int  ,
@Take int , 
--Filter
@PagedId int , 
@IsRead bit ,
@CuurentUserLoggadId bigint
as begin
declare @NotificationsCount int = dbo.GetNotificationsCountIsNotRead(@CuurentUserLoggadId)
select Notifications.* ,
TitleWord.Ar as TitleAr,
TitleWord.En as TitleEn,
DescWord.Ar as DescriptionAr,
DescWord.En as DescriptionEn,
@NotificationsCount as NotificationsCount,
NotificationsUser.IsRead
from NotificationsUser  
	join Notifications on Notifications.Id=NotificationsUser.FKNotify_Id
	join Words as  TitleWord on TitleWord.Id=Notifications.FkWord_Id
	join Words  as DescWord on DescWord.Id=Notifications.FKDescriptionWord_Id

where 
NotificationsUser.FKUser_Id=@CuurentUserLoggadId 
and 
(@PagedId is null or Notifications.FKPage_Id=@PagedId)
and 
(@IsRead is null or NotificationsUser.IsRead=@IsRead)

order by Notifications.Id desc
offset @Skip Rows
Fetch Next @Take Rows Only
end 
GO
/****** Object:  StoredProcedure [dbo].[NotificationsUser_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NotificationsUser_Insert]
@NotifyId bigint ,
@UserId bigint
as begin
INSERT INTO [dbo].[NotificationsUser]
           ([FKNotify_Id]
           ,[FKUser_Id]
           ,[IsRead])
     VALUES
           (@NotifyId,@UserId,0)
end

GO
/****** Object:  StoredProcedure [dbo].[NotificationsUser_Read]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[NotificationsUser_Read] 
@NotifyId bigint , 
@UserId	bigint
as begin

update NotificationsUser 
set IsRead=1
where FKNotify_Id=@NotifyId and FKUser_Id=@UserId

end
GO
/****** Object:  StoredProcedure [dbo].[Package_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Package_CheckIfUsed] 
@Id int
as begin

select 
isnull(count(*),0)  from Events where FKPackage_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PackageDetails_Delete]
@Id int 

as begin
delete PackageDetails where Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_DeleteAllByPackageId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PackageDetails_DeleteAllByPackageId]
@PackageId int 

as begin
delete PackageDetails where FKPackage_Id=@PackageId
end 
GO
/****** Object:  StoredProcedure [dbo].[PackageDetails_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PackageDetails_Insert]
@Id int output,
@Package_Id int , 
@ValueAr nvarchar(max),
@ValueEn nvarchar(max),
@PackageInputId int 
as begin
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @ValueAr,@ValueEn
INSERT INTO [dbo].[PackageDetails]
           ([FKWord_Id]
           ,[FKPackageInputType_Id]
           ,[FKPackage_Id])
     VALUES
           (@WordId,@PackageInputId,@Package_Id)
		   select @Id=@@IDENTITY
end 
GO
/****** Object:  StoredProcedure [dbo].[PackageInputTypes_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PackageInputTypes_CheckIfUsed] 
@Id int
as begin

select 
isnull(count(*),0)  from PackageDetails where FKPackageInputType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PackageInputTypes_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PackageInputTypes_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from Cities where Id=@Id)
delete  PackageInputTypes where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PackageInputTypes_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[PackageInputTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[PackageInputTypes]
           ([FKWord_Id]
           )
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[PackageInputTypes_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PackageInputTypes_SelectAll] 
as begin 

select PackageInputTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from PackageInputTypes

join Words on Words.Id= PackageInputTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[PackageInputTypes_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PackageInputTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select PackageInputTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from PackageInputTypes

join Words on Words.Id= PackageInputTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[PackageInputTypes_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[PackageInputTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[Packages_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Packages_Delete]
@Id int ,
@WordNameId bigint,
@WordDescriptionId bigint
as begin

delete Packages where Id=@Id
 exec dbo.Words_Delete  @WordNameId
 exec dbo.Words_Delete  @WordDescriptionId



end


GO
/****** Object:  StoredProcedure [dbo].[Packages_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Packages_Insert]
@Id int output,
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@DescriptionAr nvarchar(50),
@DescriptionEn nvarchar(50),
@IsAllowPrintNames bit,
@AlbumTypeId int,
@Price decimal(18,2),
@NamsArExtraPrice decimal(18,2)

as begin
declare @WordNameId bigint, 
@WordDescriptionId bigint;
exec @WordNameId =   dbo.Words_Insert @NameAr,@NameEn
exec @WordDescriptionId =   dbo.Words_Insert @DescriptionAr,@DescriptionEn


INSERT INTO [dbo].[Packages]
           ([FkWordName_Id]
           ,[IsAllowPrintNames]
           ,[FkWordDescription_Id]
           ,[FKAlbumType_Id],Price,NamsArExtraPrice
            )
     VALUES
           (@WordNameId,@IsAllowPrintNames,@WordDescriptionId,
		   @AlbumTypeId,@Price,@NamsArExtraPrice)
		   select @Id=@@IDENTITY
end


GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Packages_SelectAll] 

as begin 

select Packages.*,
Words.Ar as NameAr,
Words.En as NameEn from Packages

join Words on Words.Id= Packages.FKWordName_Id

order by Id desc
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectByPaging]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Packages_SelectByPaging] 
--Paging
@Skip int , 
@Take int 
as begin 

select Packages.*,
WordName.Ar as NameAr,
WordName.En as NameEn ,
WordDescription.Ar as DescriptionAr,
WordDescription.En as DescriptionEn

from Packages
join Words as WordName on WordName.Id= Packages.FKWordName_Id
join Words  as WordDescription on WordDescription.Id= Packages.FkWordDescription_Id

order by Id desc
Offset @Skip rows
Fetch next @Take rows only
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_SelectByPK]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE proc [dbo].[Packages_SelectByPK]  
@Id int
as begin 

select Packages.*,
	WordName.Ar as NameAr,
	WordName.En as NameEn ,
	WordDescription.Ar as DescriptionAr,
	WordDescription.En as DescriptionEn,
	PackageDetails.Id as PackageDetailsId,
	WordPackageDetail.Ar as PackageDetailValueAr ,
	WordPackageDetail.En as PackageDetailValueEn ,
	PackageDetails.FKPackageInputType_Id as FKPackageInputType_Id ,
	WordPackageInputType.Ar as PackageInputTypeAr,
	WordPackageInputType.En as PackageInputTypeEn,
              WordAlbumTypes.Ar as   AlbumType_NameAr,
              WordAlbumTypes.En as   AlbumType_NameEn
from Packages

join Words as WordName on WordName.Id= Packages.FKWordName_Id
join Words as WordDescription on WordDescription.Id= Packages.FkWordDescription_Id
left join PackageDetails on PackageDetails.FKPackage_Id=Packages.Id
left join PackageInputTypes on PackageInputTypes.Id=PackageDetails.FKPackageInputType_Id
left join Words as WordPackageInputType on WordPackageInputType.Id= PackageInputTypes.FKWord_Id
left join Words as WordPackageDetail on WordPackageDetail.Id= PackageDetails.FKWord_Id


left join AlbumTypes on AlbumTypes.Id=Packages.FKAlbumType_Id
left join Words as WordAlbumTypes on WordAlbumTypes.Id= AlbumTypes.FKWord_Id
where Packages.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Packages_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Packages_Update]
@Id int ,
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@DescriptionAr nvarchar(50),
@DescriptionEn nvarchar(50),
@IsAllowPrintNames bit,
@AlbumTypeId int,
@WordNameId bigint,
@WordDescriptionId bigint,

@Price decimal(18,2),
@NamsArExtraPrice decimal(18,2)
as begin

 exec dbo.Words_Update @WordNameId,@NameAr,@NameEn
 exec dbo.Words_Update @WordDescriptionId,@DescriptionAr,@DescriptionEn


update [Packages]
          set 
           [IsAllowPrintNames]=@IsAllowPrintNames
           ,[FKAlbumType_Id]=@AlbumTypeId,
		   Price =@Price ,
		   NamsArExtraPrice=@NamsArExtraPrice

where Id=@Id
end


GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAllByUser_Id]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Pages_SelectAllByUser_Id]
@UserId bigint
as begin
 select Pages.*,
 PageWord.Ar as PageNameAr,
		PageWord.En as PageNameEn
		from  Pages 
 join PageWord as PageWord on PageWord.Id=Pages.FKWord_Id

 join UserPrivileges 
 on (@UserId is null or UserPrivileges.FkUser_Id=@UserId	 	 )
 and UserPrivileges.FkPage_Id=Pages.Id

 end
GO
/****** Object:  StoredProcedure [dbo].[Pages_SelectAllForUserCanBeAccess]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc  [dbo].[Pages_SelectAllForUserCanBeAccess]
   @UserId bigint,
@IsPublicMenus bit
as begin 
--نتحقق اذا كان يريد الصفح التى بها لـ المستخدم العادى نقوم بجلبها مباشرة  ولا يوجد هنا تحققات لان المستخدم العادى ليس له صلاحيات وله صفح خاصة بة 
if(@IsPublicMenus =1 )
select 
Pages.*,
	PageWord.Ar as PageNameAr,
	PageWord.En as PageNameEn
	
from Pages 
 join Words as PageWord on PageWord.Id=Pages.FKWord_Id
 where Pages.IsForClient=1 
 and pages.IsHide!=1

order by Pages.OrderByNumber

else if(@UserId is null or @userId=0)
select 
	Pages.*,
	PageWord.Ar as PageNameAr,
	PageWord.En as PageNameEn
	
from Pages 
 join Words as PageWord on PageWord.Id=Pages.FKWord_Id
 where Pages.IsForAdmin=1
 and pages.IsHide!=1

order by Pages.OrderByNumber

else 
select 
	Pages.*,
	PageWord.Ar as PageNameAr,
	PageWord.En as PageNameEn
	
from Pages 

 join Words as PageWord on PageWord.Id=Pages.FKWord_Id
 join UserPrivileges on UserPrivileges.FkUser_Id=@UserId 
 and UserPrivileges.FkPage_Id=Pages.Id
 where Pages.IsForAdmin=1
 and pages.IsHide!=1
order by Pages.OrderByNumber
 end
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_CheckIfUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[PrintNamesTypes_CheckIfUsed] 
@Id bigint
as begin

select 
isnull(count(*),0)  from Events where FKPrintNameType_Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrintNamesTypes_Delete]
@Id bigint
as begin
delete Words where Words.Id in (select  FKWord_Id from Cities where Id=@Id)
delete  PrintNamesTypes where Id=@Id
 
end
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create  proc [dbo].[PrintNamesTypes_Insert]
@Id int output , 
@NameAr nvarchar(50),
@NameEn nvarchar(50)

as begin
-- Insert Word 
declare @WordId int ;
exec @WordId =   dbo.Words_Insert @NameAr,@NameEn

-- Insert Target
INSERT INTO [dbo].[PrintNamesTypes]
           ([FKWord_Id]
           )
     VALUES
           (@WordId)

		 select  @Id=@@identity
end


GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrintNamesTypes_SelectByFilter] 
@Skip int , 
@Take int 

as begin 

select PrintNamesTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from PrintNamesTypes

join Words on Words.Id= PrintNamesTypes.FKWord_Id

order by Id desc
Offset @skip rows 
Fetch next @Take rows only 
end 
GO
/****** Object:  StoredProcedure [dbo].[PrintNamesTypes_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  proc [dbo].[PrintNamesTypes_Update]
@Id int  , 
@NameAr nvarchar(50),
@NameEn nvarchar(50),
@WordId bigint

as begin
-- Update Word 
exec dbo.Words_Update @WordId, @NameAr,@NameEn

-- Update Target
 
end


GO
/****** Object:  StoredProcedure [dbo].[PrintNameTypes_SelectAll]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[PrintNameTypes_SelectAll] 
as begin 

select PrintNamesTypes.*,
Words.Ar as NameAr,
Words.En as NameEn from PrintNamesTypes

join Words on Words.Id= PrintNamesTypes.FKWord_Id

end 
GO
/****** Object:  StoredProcedure [dbo].[User_EmailBeforUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_EmailBeforUsed] 
@UserId bigint,
@Email nvarchar(50)
as begin

select count(*) from Users where Email=@Email 
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[User_PhoneNumberBeforUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_PhoneNumberBeforUsed] 
@UserId bigint,
@PhoneNumber nvarchar(50)
as begin

select count(*) from Users where PhoneNo=@PhoneNumber 
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[User_UserNameBeforUsed]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[User_UserNameBeforUsed] 
@UserId bigint,
@UserName nvarchar(50)
as begin

select count(*) from Users where UserName=@UserName 
and (@UserId = 0 or @UserId is null or Id!=@UserId) 

end
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPrivileges_Insert]
	@PageId int ,
	@UserId bigint,
	@CanAdd bit , 
	@CanEdit bit , 
	@CanDelete bit ,
	@CanDisplay bit 

	as 
SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN


INSERT [dbo].[UserPrivileges]
(
		[FkUser_Id],
		[FkPage_Id],
		[CanAdd],
		[CanEdit],
		[CanDelete],
		[CanDisplay]
)
VALUES
(
		@UserId,
		@PageId,
		@CanAdd,
		@CanEdit,
		@CanDelete,
		@CanDisplay
)


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_RemoveByMenuIdAndUserId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPrivileges_RemoveByMenuIdAndUserId] 
	@MenuId int , 
	@UserId bigint
/*
حذف جميع الامتيازات بناء على المنيو

*/
	as begin 

	delete UserPrivileges 
	where 
	FkUser_Id=@UserId and 
	(select COUNT(*) from Pages 
	where Pages.Id=UserPrivileges.FkPage_Id and Pages.FkMenu_Id=@MenuId)>0

	end
GO
/****** Object:  StoredProcedure [dbo].[UserPrivileges_SelectByUserId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UserPrivileges_SelectByUserId]
@pageId int , 
@userId bigint
as begin 

select * from UserPrivileges where FkUser_Id=@userId and FkPage_Id=@pageId

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_ActiveEmail]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_ActiveEmail] 
@UserId bigint,
@ActiveCode nvarchar(50)
as begin 
declare @OldActiveCode nvarchar(50) = (select top 1 ActiveCode from users where Id=@UserId);

if(@OldActiveCode =@ActiveCode)
	Update Users 
	set IsActiveEmail =1 
	where Id=@UserId

select * from users where Id=@UserId
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckFromActiveCode]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_CheckFromActiveCode]
@Id bigint , 
@ActiveCode nvarchar(50)
as begin

select ISNULL(count(*),0) from Users where Id=@Id and ActiveCode=@ActiveCode


end 
GO
/****** Object:  StoredProcedure [dbo].[Users_CheckIfEmailActivated]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_CheckIfEmailActivated] 
@UserId bigint
as begin 
select isnull(IsActiveEmail,0) from Users where Id=@UserId

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Insert]
			@Id bigint output,
			@UserName nvarchar(50),
           @Email nvarchar(50),
           @PhoneNo nvarchar(50),
           @FKAccountType_Id int,
           @Address nvarchar(250),
           @FkCountry_Id int,
           @FkCity_Id int,
           @Password nvarchar(50),
           @ActiveCode nvarchar(50),
		   @CreateDateTime datetime,
		   @LanguageId int,
		   @BranchId int,
		   @EnquiryId	bigint,
		   @DateOfBirth  date
as begin
INSERT INTO [dbo].[Users]
           ([UserName]
           ,[Email]
           ,[PhoneNo]
           ,[FKAccountType_Id]
           ,[Address]
           ,[FkCountry_Id]
           ,[FkCity_Id]
           ,[Password]
           ,[ActiveCode],
		   CreateDateTime,
		   FKLanguage_Id,
		   FKPranch_Id,
		   DateOfBirth,isActive)
     VALUES
           (@UserName,
           @Email, 
           @PhoneNo,
           @FKAccountType_Id, 
           @Address, 
           @FkCountry_Id,
           @FkCity_Id,
           @Password, 
           @ActiveCode,
		  @CreateDateTime,
		   @LanguageId,
		   @BranchId,
		   @DateOfBirth,1)

		   --نقوم بتحيث الاستفسار الان
		   if(@EnquiryId is not null)
		   update Enquires set IsLinkedClinet=1 , FkClinet_Id =@@IDENTITY where Enquires.Id=@EnquiryId


select @Id= @@IDENTITY


end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAllEmployees]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectAllEmployees]

as begin 

select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where 
	Users.IsActive=1 and 
	Users.FKAccountType_Id =2 or 
	Users.FKAccountType_Id =3 or 
	Users.FKAccountType_Id =5

end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByBranchId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_SelectByBranchId]
@BranchId int ,
@AccountTypeId int 
as begin
select Users.*,
EmployeesWorks.FkWorkType_Id
from Users 
left join EmployeesWorks on EmployeesWorks.FKUser_Id=Users.Id
Where FKPranch_Id=@BranchId and FKAccountType_Id=@AccountTypeId and IsActive=1
end
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByFilter]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc   [dbo].[Users_SelectByFilter]
--Paging
@Skip  int ,
@Take int , 

--Filter
@UserName nvarchar(50),
@Email nvarchar(50),
@PhoneNumber nvarchar(50),
@Adddress nvarchar(50),
@CreateDateTo date,
@CreateDateFrom date,
@CountryId int,
@CityId int,
@AccountTypeId int,
@LanguageId int
as begin
select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from users 
join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where 
(@UserName		= ''  or @UserName		 is null or users.UserName like '%'+@UserName+'%')and
(@Email  		= ''  or @Email  		 is null or users.Email like '%'+@Email+'%')and
(@PhoneNumber   = ''  or @PhoneNumber    is null or users.PhoneNo like '%'+@PhoneNumber+'%')and
(@Adddress		= ''  or @Adddress		  is null or users.Address like '%'+@Adddress+'%')and
(@CreateDateTo  	is null or users.CreateDateTime<=@CreateDateTo )and
(@CreateDateFrom  	is null or users.CreateDateTime>=@CreateDateFrom)and
(@CountryId 		is null or users.FkCountry_Id=@CountryId)and
(@CityId  			is null or users.FkCity_Id=@CityId)and
(@AccountTypeId 	is null or users.FKAccountType_Id=@AccountTypeId)and
(@LanguageId 		is null or users.FKLanguage_Id=@LanguageId) 




order by Id Desc
Offset @Skip rows
fetch next @Take rows only
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByPk]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_SelectByPk]
@Id bigint as begin 

select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where Users.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectByUserNameAndPassword]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_SelectByUserNameAndPassword]
@UserName nvarchar(50),
@Password nvarchar(50) 
 as begin 

select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where Users.UserName=@UserName and Users.Password=@Password
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_UpateActiveCodeAndEmail]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_UpateActiveCodeAndEmail] 
@UserId bigint,
@ActiveCode nvarchar(50),
@Email nvarchar(50)
as begin 
--تحديث الكود
Update Users 
set ActiveCode =@ActiveCode 
where Id=@UserId

--تحديث الاميل فى اول مرة فقط يقوم بتعديل بها الاميل لان نفس الدالة تستخدم فى تحديث البروفيل ايضا
Update Users 
set Email=@Email
where Id=@UserId and Email is null
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Users_Update]
			@Id bigint  ,
			@UserName nvarchar(50),
           @Email nvarchar(50),
           @PhoneNo nvarchar(50),
           @Address nvarchar(250),
           @FkCountry_Id int,
           @FkCity_Id int,
           @Password nvarchar(50),
		   @LanguageId int,
		   @DateOfBirth date,
		   @IsActive bit
as begin
update [dbo].[Users] set
           [UserName]			= @UserName,		
           [Email]				=@Email ,
           [PhoneNo]			=@PhoneNo ,
           [Address]			=@Address ,
           [FkCountry_Id]		=@FkCountry_Id ,
           [FkCity_Id]			=@FkCity_Id ,
           [Password]			=@Password ,
		   FKLanguage_Id		=@LanguageId ,
		   DateOfBirth=@DateOfBirth,
		   IsActive=@IsActive

   where Id=@Id and @Password is not null

   update [dbo].[Users] set
           [UserName]			= @UserName,		
           [Email]				=@Email ,
           [PhoneNo]			=@PhoneNo ,
           [Address]			=@Address ,
           [FkCountry_Id]		=@FkCountry_Id ,
           [FkCity_Id]			=@FkCity_Id ,
		   FKLanguage_Id		=@LanguageId ,
		   DateOfBirth=@DateOfBirth ,
		   IsActive=@IsActive

   where Id=@Id and @Password is  null
end 
GO
/****** Object:  StoredProcedure [dbo].[Users_UpdateLangage]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Users_UpdateLangage]
@Id bigint,
@languageId int 
 as begin 
 update Users set FKLanguage_Id=@languageId where Id=@Id
select 
	Users.*,
	WordAccountType.Ar as AccountTypeNameAr,
	WordAccountType.En as AccountTypeNameEn,
	WordCountry.Ar as CountryNameAr,
	WordCountry.En as CountryNameEn,
	WordCity.Ar as CityNameAr,
	WordCity.En as CityNameEn

from Users

join AccountTypes on AccountTypes.Id=users.FKAccountType_Id
left join Countries on Countries.Id=users.FkCountry_Id
left join Cities on Cities.Id=users.FkCity_Id

join Words as WordAccountType on WordAccountType.Id=AccountTypes.FKWord_Id
left join Words as WordCountry on WordCountry.Id=Countries.FKWord_Id
left join Words as WordCity on WordCity.Id=Cities.FKWord_Id
where Users.Id=@Id
end 
GO
/****** Object:  StoredProcedure [dbo].[UsersPrivileges_SelectByMenuId]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UsersPrivileges_SelectByMenuId]
@menuId int , 
@userId bigint 
as begin 

select  
		Pages.Id as Page_Id , 
		Pages.Url as Pages_Url, 
		Pages.OrderByNumber as Pages_OrderByNumber,
		PageWord.Ar as Pages_NameAr,
		PageWord.En as Pages_NameEn,
		
		UserPrivileges.Id as UsersPrivileges_Id,
		UserPrivileges.CanAdd as UsersPrivileges_CanAdd,
		UserPrivileges.CanDelete as UsersPrivileges_CanDelete,
		UserPrivileges.CanDisplay as UsersPrivileges_CanDisplay,
		UserPrivileges.CanEdit as UsersPrivileges_CanEdit


from Pages

join Words as PageWord on PageWord.Id=Pages.FKWord_Id
left join UserPrivileges on UserPrivileges.FKPage_Id=Pages.Id and UserPrivileges.FkUser_Id=@userId

where 
Pages.FkMenu_Id=@menuId
and Pages.IsForAdmin =1
end 
GO
/****** Object:  StoredProcedure [dbo].[Words_Delete]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Words_Delete]
@Id bigint 
as begin 
delete Words where Id=@Id

end 
GO
/****** Object:  StoredProcedure [dbo].[Words_Insert]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Words_Insert] 
@ar nvarchar(max),@en nvarchar(max)
as begin
insert Words (Ar,En) values (@ar,@en)
return @@identity

end 
GO
/****** Object:  StoredProcedure [dbo].[Words_Update]    Script Date: 7/21/2019 12:20:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Words_Update]
@Id bigint,
@Ar nvarchar(max),
@En nvarchar(max)
as begin

update Words set Ar=@Ar,
En=@En
where Id=@Id

end
GO
USE [master]
GO
ALTER DATABASE [Layal] SET  READ_WRITE 
GO
