USE [PetServices]
GO
/****** Object:  Database [PetServices]    Script Date: 10/16/2023 11:23:22 PM ******/
--CREATE DATABASE [PetServices]
ALTER DATABASE [PetServices] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PetServices].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PetServices] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PetServices] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PetServices] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PetServices] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PetServices] SET ARITHABORT OFF 
GO
ALTER DATABASE [PetServices] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PetServices] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PetServices] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PetServices] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PetServices] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PetServices] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PetServices] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PetServices] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PetServices] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PetServices] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PetServices] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PetServices] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PetServices] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PetServices] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PetServices] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PetServices] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PetServices] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PetServices] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PetServices] SET  MULTI_USER 
GO
ALTER DATABASE [PetServices] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PetServices] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PetServices] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PetServices] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PetServices] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PetServices] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [PetServices] SET QUERY_STORE = ON
GO
ALTER DATABASE [PetServices] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PetServices]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[UserInfoID] [int] NULL,
	[PartnerInfoID] [int] NULL,
	[RoleID] [int] NULL,
	[OTPID] [int] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[BookingDate] [date] NULL,
	[BookingStatus] [nchar](10) NULL,
	[AccountID] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRoomDetail]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoomDetail](
	[RoomID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
 CONSTRAINT [PK_BookingRoomDetail] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingServicesDetail]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingServicesDetail](
	[ServiceID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
 CONSTRAINT [PK_BookingServicesDetail] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProductDetail]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductDetail](
	[Quanlity] [int] NULL,
	[Price] [float] NULL,
	[ProductID] [int] NOT NULL,
	[BookingID] [int] NOT NULL,
 CONSTRAINT [PK_OrderProductDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPS]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPS](
	[OTPID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](6) NULL,
 CONSTRAINT [PK_OTPS] PRIMARY KEY CLUSTERED 
(
	[OTPID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerInfo]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerInfo](
	[PartnerInfoID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](1000) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[CardNumber] [varchar](100) NULL,
	[ImagePartner] [varchar](max) NULL,
	[ImageCertificate] [varchar](max) NULL,
 CONSTRAINT [PK_PartnerInfo] PRIMARY KEY CLUSTERED 
(
	[PartnerInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PetInfo]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PetInfo](
	[PetInfoID] [int] IDENTITY(1,1) NOT NULL,
	[PetName] [nvarchar](500) NULL,
	[ImagePet] [varchar](max) NULL,
	[Species] [nvarchar](500) NULL,
	[Gender] [bit] NULL,
	[Descriptions] [varchar](max) NULL,
	[UserInfoID] [int] NULL,
 CONSTRAINT [PK_PetInfo] PRIMARY KEY CLUSTERED 
(
	[PetInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](500) NULL,
	[Desciption] [nvarchar](max) NULL,
	[Picture] [varchar](max) NULL,
	[Status] [bit] NULL,
	[Price] [float] NULL,
	[CreateDate] [date] NULL,
	[ProCategoriesID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[ProCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](500) NULL,
	[Prictue] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProCategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[RoomName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Picture] [varchar](max) NULL,
	[Price] [float] NULL,
	[RoomCategoriesID] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomCategories]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomCategories](
	[RoomCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Picture] [nvarchar](500) NULL,
 CONSTRAINT [PK_RoomCategories] PRIMARY KEY CLUSTERED 
(
	[RoomCategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategories](
	[SerCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[SerCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Prictue] [nvarchar](500) NULL,
 CONSTRAINT [PK_ServiceCategories] PRIMARY KEY CLUSTERED 
(
	[SerCategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Status] [bit] NULL,
	[Picture] [varchar](max) NULL,
	[Price] [float] NULL,
	[SerCategoriesID] [int] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 10/16/2023 11:23:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserInfoID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Phone] [varchar](10) NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](1000) NULL,
	[Descriptions] [nvarchar](max) NULL,
	[ImageUser] [varchar](max) NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_OTPS] FOREIGN KEY([OTPID])
REFERENCES [dbo].[OTPS] ([OTPID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_OTPS]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_PartnerInfo] FOREIGN KEY([PartnerInfoID])
REFERENCES [dbo].[PartnerInfo] ([PartnerInfoID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_PartnerInfo]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_UserInfo]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_Accounts] FOREIGN KEY([AccountID])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_Accounts]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Booking]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Room]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Booking]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Services]
GO
ALTER TABLE [dbo].[OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[OrderProductDetail] CHECK CONSTRAINT [FK_OrderProductDetail_Booking]
GO
ALTER TABLE [dbo].[OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProductDetail] CHECK CONSTRAINT [FK_OrderProductDetail_Product]
GO
ALTER TABLE [dbo].[PetInfo]  WITH CHECK ADD  CONSTRAINT [FK_PetInfo_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[PetInfo] CHECK CONSTRAINT [FK_PetInfo_UserInfo]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategories] FOREIGN KEY([ProCategoriesID])
REFERENCES [dbo].[ProductCategories] ([ProCategoriesID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategories]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD  CONSTRAINT [FK_Room_RoomCategories] FOREIGN KEY([RoomCategoriesID])
REFERENCES [dbo].[RoomCategories] ([RoomCategoriesID])
GO
ALTER TABLE [dbo].[Room] CHECK CONSTRAINT [FK_Room_RoomCategories]
GO
ALTER TABLE [dbo].[Services]  WITH CHECK ADD  CONSTRAINT [FK_Services_ServiceCategories] FOREIGN KEY([SerCategoriesID])
REFERENCES [dbo].[ServiceCategories] ([SerCategoriesID])
GO
ALTER TABLE [dbo].[Services] CHECK CONSTRAINT [FK_Services_ServiceCategories]
GO
USE [master]
GO
ALTER DATABASE [PetServices] SET  READ_WRITE 
GO
