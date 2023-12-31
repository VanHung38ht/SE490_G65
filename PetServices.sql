USE [master]
GO
/****** Object:  Database [PetServices]    Script Date: 10/29/2023 9:19:51 PM ******/
CREATE DATABASE [PetServices]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PetServices', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PetServices.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PetServices_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\PetServices_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PetServices] SET COMPATIBILITY_LEVEL = 150
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
/****** Object:  Table [dbo].[Accounts]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[Blogs]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Heading] [nvarchar](max) NULL,
	[PageTile] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[ImageURL] [nvarchar](max) NULL,
	[PublisheDate] [date] NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[BookingID] [int] IDENTITY(1,1) NOT NULL,
	[BookingDate] [date] NULL,
	[BookingStatus] [nchar](20) NULL,
	[UserInfoID] [int] NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[BookingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingRoomDetail]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingRoomDetail](
	[RoomID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_BookingRoomDetail] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingServicesDetail]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingServicesDetail](
	[ServiceID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_BookingServicesDetail] PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProductDetail]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProductDetail](
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderProductDetail] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NULL,
	[OrderStatus] [nchar](20) NULL,
	[Province] [nvarchar](500) NULL,
	[District] [nvarchar](500) NULL,
	[Commune] [nvarchar](500) NULL,
	[Address] [nvarchar](500) NULL,
	[UserInfoID] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderType]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderType](
	[OrderTypeID] [int] IDENTITY(1,1) NOT NULL,
	[OrderProduct] [bit] NULL,
	[BookingRoom] [bit] NULL,
	[BookingService] [bit] NULL,
	[OrderID] [int] NULL,
 CONSTRAINT [PK_OrderType] PRIMARY KEY CLUSTERED 
(
	[OrderTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPS]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[PartnerInfo]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[Payment]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[PetInfo]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 10/29/2023 9:19:51 PM ******/
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
	[Quantity] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[ProCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](500) NULL,
	[Picture] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProCategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[Room]    Script Date: 10/29/2023 9:19:51 PM ******/
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
	[Slot] [int] NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomCategories]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomCategories](
	[RoomCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[RoomCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Picture] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_RoomCategories] PRIMARY KEY CLUSTERED 
(
	[RoomCategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServices]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomServices](
	[RoomID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
 CONSTRAINT [PK_RoomServices] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC,
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceCategories]    Script Date: 10/29/2023 9:19:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceCategories](
	[SerCategoriesID] [int] IDENTITY(1,1) NOT NULL,
	[SerCategoriesName] [nvarchar](500) NULL,
	[Desciptions] [nvarchar](max) NULL,
	[Picture] [nvarchar](500) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ServiceCategories] PRIMARY KEY CLUSTERED 
(
	[SerCategoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 10/29/2023 9:19:51 PM ******/
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
/****** Object:  Table [dbo].[UserInfo]    Script Date: 10/29/2023 9:19:51 PM ******/
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
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (1, N'cus@gmail.com', N'123456', 1, 1, 2, 2, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (2, N'manager@gmail.com', N'123456', 1, 2, NULL, 3, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (3, N'partner@gmail.com', N'123456', 1, NULL, 1, 4, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (4, N'admin@gmail.com', N'123456', 1, 3, NULL, 1, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (5, N'customer@gmail.com', N'12345678', 1, 4, NULL, 2, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (15, N'phucshungw2001@gmail.com', N'12345678', 1, NULL, 3, 4, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (16, N'daovanthanhton@mail.com', N'12345678', 0, 14, NULL, 2, 9)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (17, N'daovanthanhton@gmail.com', N'12345678', 1, 15, NULL, 2, 10)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (18, N'h93354306@gmail.com', N'12345678', 1, 16, NULL, 2, 11)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [Status], [UserInfoID], [PartnerInfoID], [RoleID], [OTPID]) VALUES (19, N'vanhung38ht@gmail.com', N'hung2001', 1, NULL, 4, 4, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([BookingID], [BookingDate], [BookingStatus], [UserInfoID], [Province], [District], [Commune], [Address]) VALUES (1, CAST(N'2023-10-20' AS Date), N'Complete            ', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Booking] ([BookingID], [BookingDate], [BookingStatus], [UserInfoID], [Province], [District], [Commune], [Address]) VALUES (2, CAST(N'2023-10-20' AS Date), N'Waiting             ', 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Booking] ([BookingID], [BookingDate], [BookingStatus], [UserInfoID], [Province], [District], [Commune], [Address]) VALUES (3, CAST(N'2023-10-20' AS Date), N'Reject              ', 1, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID]) VALUES (5, 24000, 1, 1)
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID]) VALUES (10, 45000, 15, 1)
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID]) VALUES (1, 230000, 19, 3)
INSERT [dbo].[OrderProductDetail] ([Quantity], [Price], [ProductID], [OrderID]) VALUES (1, 250000, 21, 2)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [UserInfoID]) VALUES (1, CAST(N'2023-10-20' AS Date), N'Complete            ', N'Hà Nội', N'Hà Nội', N'Hà Nội', N'Hà Nội', 1)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [UserInfoID]) VALUES (2, CAST(N'2023-10-20' AS Date), N'Complete            ', N'Hải Phòng', N'Hải Phòng', N'Hải Phòng', N'Hải Phòng', 1)
INSERT [dbo].[Orders] ([OrderID], [OrderDate], [OrderStatus], [Province], [District], [Commune], [Address], [UserInfoID]) VALUES (3, CAST(N'2023-10-20' AS Date), N'Complete            ', N'Hồ Chí Minh', N'Hồ Chí Minh', N'Hồ Chí Minh', N'Hồ Chí Minh', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderType] ON 

INSERT [dbo].[OrderType] ([OrderTypeID], [OrderProduct], [BookingRoom], [BookingService], [OrderID]) VALUES (1, 1, 0, 0, 1)
INSERT [dbo].[OrderType] ([OrderTypeID], [OrderProduct], [BookingRoom], [BookingService], [OrderID]) VALUES (2, 1, 0, 0, 2)
INSERT [dbo].[OrderType] ([OrderTypeID], [OrderProduct], [BookingRoom], [BookingService], [OrderID]) VALUES (3, 1, 0, 0, 3)
SET IDENTITY_INSERT [dbo].[OrderType] OFF
GO
SET IDENTITY_INSERT [dbo].[OTPS] ON 

INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (1, N'224899')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (2, N'541745')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (3, N'840879')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (4, N'644244')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (5, N'256515')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (6, N'465576')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (7, N'147678')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (8, N'581833')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (9, N'433641')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (10, N'779021')
INSERT [dbo].[OTPS] ([OTPID], [Code]) VALUES (11, N'665574')
SET IDENTITY_INSERT [dbo].[OTPS] OFF
GO
SET IDENTITY_INSERT [dbo].[PartnerInfo] ON 

INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate]) VALUES (1, N'Thị', N'Nở', N'0987654321', N'Hà Nội', N'Hà Nội', N'Hà Nội', N'Hà Nội', N'Người làm việc cho động vật', N'88888888', NULL, NULL)
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate]) VALUES (2, N'Phúc', N'Hưng', N'09888888', N'Hà Nội', N'Thạch Hoà', N'Thạch Thất', N'Hà Nội', N'Người yêu động vật', NULL, NULL, NULL)
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate]) VALUES (3, N'Nguyễn ', N'A Đùa', N'0988888888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[PartnerInfo] ([PartnerInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [CardNumber], [ImagePartner], [ImageCertificate]) VALUES (4, N'Hùng ', N'Hùng', N'0987654321', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PartnerInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[PetInfo] ON 

INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID]) VALUES (1, N'Mi Mi', NULL, N'Mèo', 1, N'Mèo Con', 1)
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID]) VALUES (2, N'Pic', NULL, N'Mèo', 1, N'Mèo Con', 1)
INSERT [dbo].[PetInfo] ([PetInfoID], [PetName], [ImagePet], [Species], [Gender], [Descriptions], [UserInfoID]) VALUES (3, N'Tiểu Hắc', N'string', N'Mèo', 1, N'Mèo con', 1)
SET IDENTITY_INSERT [dbo].[PetInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (1, N'Pate Lechat Exellence Mousse Rich', N'Pate Lechat Exellence Mousse Rich 85g là thức ăn nổi tiếng dạng mousse dành cho mèo từ Ý với những thành phần tươi ngon nhất, tuyệt hảo nhất.', NULL, 1, 45000, CAST(N'2023-10-01' AS Date), 1, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (2, N'Hạt Royal Canin Medium Puppy 4kg ', N'Những giống chó kích cỡ Medium trong khoảng 11 - 25kg được biết đến có nguồn năng lượng dồi dào vì đa số giống chó này được sử dụng hỗ trợ trong các công việc của con người từ rất lâu. Cho dù giống chó size Medium này được nuôi trong nhà hay dành thời gian hoạt động ngoài trời, với  thức ăn cho chó ROYAL CANIN Medium Puppy sẽ giúp chúng duy trì khả năng phòng thủ tự nhiên tốt hơn, đồng thời cung cấp năng lượng cân bằng cho giống chó này giúp duy trì trọng lượng khỏe mạnh', NULL, 1, 23000, CAST(N'2023-10-01' AS Date), 1, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (3, N'Viên uống hỗ trợ khử mùi giải độc Natural', N'Ba mẹ thường chỉ lo lắng khi thấy vật cưng của mình ăn uống kém, không đòi ăn. Chứ ít khi nghĩ vật cưng đang ăn, uống thức ăn không phù hợp với sinh lý và cũng để xảy ra nhiều lý do khác dẫn tới sự tiêu hóa kém, táo bón, mà như vậy đường ruột không được tẩy sạch và không loại thải hết độc tố. Các chất độc không bị loại thải ra khỏi cơ thể, tích tụ lâu ngày, chúng sẽ gây nên các bệnh mãn tính, dị ứng, lông da đặc biệt làm suy yếu các cơ quan gan - tụy, thận, tim mạch.', NULL, 1, 100000, CAST(N'2023-10-01' AS Date), 4, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (4, N'Băng gạc y tế', N'Băng gạc y tế không dính, được sử dụng để băng bó vết thương và vết cắt nhỏ.', NULL, 1, 12000, CAST(N'2023-10-01' AS Date), 4, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (5, N'Áo hai dây gấu và que kem', N' khi shop ghi chất liệu là NỈ / LÔNG/ NHUNG / .... thì các chất vải này ÍT CO GIÃN nên khi bé của bạn bắp tay to / bụng béo / lưng dài / chân lùn ngắn/....thì nên cân nhắc lên thêm 1 size hoặc chỉ nên mua các loại vải thun để mặc

𝒔𝒐̂́ đ𝒐:  theo thứ tự size áo / vòng ngực/ chiều dài / số cân ước lượng
XS 30 / 20 / 500gr - 1.5kg
S 35 / 25 / 1.6 - 2.5kg
M 40 / 30/ 2.6kg - 4kg
L 45 / 35 / 4kg - 5.5kg
XL 50 / 38 / 5.6kg - 7.5kg
XXL 55 / 42 / 7.6kg - 10kg', NULL, 1, 145000, CAST(N'2023-10-01' AS Date), 5, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (6, N'Đồ chơi cao su hình ngôi sao cho chó', N'Việc cho chó chơi đồ chơi là một giải pháp tuyệt vời giúp cún cưng của bạn trở nên nhanh nhẹn, hoạt bát hơn. Không những thế nó còn giúp cún cưng hạn chế cắn phá các vật dụng trong nhà. Chúng sẽ trở nên ngoan ngoãn và vâng lời hơn. Nếu bạn đang băn khoăn chưa biết lựa chọn loại đồ chơi nào phù hợp trong vô vàng các sản phẩm đa dạng mẫu mã trên thị trường hiện nay. Thì trong bài viết này Miluxinh sẽ xin gợi ý đến bạn món đồ chơi chó ngôi sao cao su đặc nhiều màu. Chắc chắn đây là sẽ món đồ chơi mà khiến thú cưng của bạn mê mẩn suốt ngày.  ', NULL, 1, 15000, CAST(N'2023-10-01' AS Date), 6, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (7, N'Bàn chải tắm silicon gấu trúc', N'Bàn chải silicon mềm mại giúp làm sạch chó mèo, không gây đau rát', NULL, 1, 12000, CAST(N'2023-10-01' AS Date), 8, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (8, N'Sữa tắm Yoko cao cấp 55ml', N'Với sự kết hợp tinh tế từ những hương thơm dịu nhẹ của hoa cỏ, YOKO tin rằng sẽ đem lại cảm giác tươi mát, năng động nhưng xen lẫn một chút ấm áp, giúp thú cưng luôn thoải mái và thơm tho mọi lúc mọi nơi.

Lấy cảm hứng từ mùa Xuân, Hạ, Thu, Đông, sữa tắm YOKO tin rằng sẽ đem đến trải nghiệm khó quên theo từng mùa trong năm. Đồng thời với các dưỡng chất thiên nhiên kết hợp vitamin giúp nuôi dưỡng da và lông mềm mượt, khử mùi, kháng khuẩn, lưu hương lâu và đặc biệt an toàn với thú cưng của bạn.

Cảm ơn bạn đã là những khách hàng đầu tiên trải nghiệm và tin chọn YOKO. Đừng quên cùng YOKO lan tỏa yêu thương và chăm sóc đặc biệt nhất dành cho thú cưng của bạn thời gian tới nữa nha!', NULL, 1, 15000, CAST(N'2023-10-01' AS Date), 8, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (9, N'Xịt Bioline khử trùng', N'Xịt khử trùng kháng khuẩn Bioline 500ml
Chai xịt làm sạch mùi hôi diệt khuẩn, diệt mầm bệnh, sát trùng không gian
Tinh dầu thông mang lại cảm giác mát lạnh, sạch sẽ.
Khử mùi tuyệt đối mùi khó chịu của chó mèo
Giúp triệt tiêu vi khuẩn, giữ không gian trong lành, mát mẻ
Tiêu diệt vi khuẩn trong không gian sống, không gian ở của thú cưng ở
Tiêu diệt virus, nấm, trong chuồng nuôi hay các nơi dơ bẩn
Hdsd: Xịt trực tiếp vào vị trí muốn xịt hoặc trên cơ thể vật nuôi', NULL, 1, 38000, CAST(N'2023-10-01' AS Date), 8, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (10, N'Nhà vệ sinh cho mèo cửa tròn', N'1. Trọng lượng: 1.7kg
2. Chất liệu: nhựa PP an toàn, không gây kích ứng
3. Xuất xứ: Thượng Hải
4. Kích thước: 34*41*38CM
5. Thiết kế rộng rãi có thể dùng được cho mèo trên 10kg
ƯU ĐIỂM NHÀ VỆ SINH CHO MÈO
- Dễ dàng lắp ráp
- Thiết kế 2 cửa tiện lợi tuỳ theo sở thích mọi bé mèo

- Thiết kế keo khay cát, dễ dàng dọn dẹp thay cát. Không cần mở nắp

- Có cửa ngăn giúp hạn chế phát tán mùi hôi và tránh văng cát khi mèo lấp

- Bệ ra vào thiết kế lổ tròn: trong quá trình mèo ra vào, cát vệ sinh dính vào lòng bàn tay chân sẽ rơi ra tại đây. Giúp mèo giữ gìn vệ sinh, không bị liếm phải cát, và hạn chế viêm da

- Mèo nhỏ vẫn có thể sử dụng dễ dàng. 

Nhà vệ sinh vừa với mèo trên 10kg', NULL, 1, 230000, CAST(N'2023-10-01' AS Date), 8, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (11, N'Cát đậu nành Cature Domestic 6L ', N'Đặc biệt: Giá thành của sản phẩm này mềm hơn so với thị trường rất nhiều 
😘Đương nhiên không vì thế mà chất lượng kém đi đâu ạ, thậm chí còn rất được ưa chuộng vì những tính năng và công dụng tuyệt vời 👍 của sản phẩm: 
😍Đầu tiên, phải nói đến sự thấm hút đỉnh cao và khử mùi siêu siêu tốt, khóa chặt "chất thải vệ sinh" cực tốt. Vón cục nhanh trong vòng 3s. Tính năng này thì ẻm là lựa chọn số 1️⃣
😍Thành phần hoàn toàn tự nhiên, không gây kích ứng với những bé mèo nhạy cảm. 
😍Hoàn toàn thân thiện với môi trường, có thể xả trong toilet, phân hủy sinh học. 
😍Ngoài ra, cát hoàn toàn không gây bụi và không dính chân mèo, không lo bẩn nhà nhé các Sen ơi
👉Có 2 dòng sản phẩm: 
💛Màu vàng: Cát đậu nành, hoàn toàn tự nhiên, khử mùi và vi khuẩn cực tốt', NULL, 1, 120000, CAST(N'2023-10-01' AS Date), 8, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (12, N'Chuồng mèo hai tầng Petland', N'Chuồng mèo siêu cao cấp kích thước lớn, có tầng để mèo thoải mái leo trèo và hoạt động. Một ngôi nhà an toàn và hoàn hảo cho mèo khi bạn phải ra ngoài không có thời gian chăm giữ bé. Kích thước: M - 75*54*170cm

Ngoài ra, lồng có bánh xe và khay nhựa dễ dàng vệ sinh chỉ với vài thao tác tháo lắp đơn giản

Chất liệu khung sắt tĩnh điện kết hợp với nhựa PVC cao cấp, chắc chắn, màu sắc bắt mắt, sang trọng', NULL, 1, 350000, CAST(N'2023-10-01' AS Date), 9, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (13, N'Dung dịch vệ sinh tai TropiClean', N'Ệ SINH TAI CHÓ MÈO SIÊU DỄ CHỈ 1’30S
Với vệ sinh tai không cồn Ear Wash.
---
Tai của các con là vùng khó vệ sinh, thường bị:

- Nước đọng sau khi tắm
- Lông tai bết do ráy tai tích tụ
- Ẩm ướt nên vi khuẩn dễ làm tổ.
- Để lâu có thể gây #mùi_hôi tai, ve rận kí sinh, bé bị viêm tai và ngứa ngáy!', NULL, 1, 67000, CAST(N'2023-10-01' AS Date), 8, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (14, N'Pate TƯƠI The Pet Cho Chó Mèo Biếng Ăn', N'Pate Tươi Cho Mèo Hỗn Hợp cho Chó Mèo Biếng Ăn được làm từ hỗn hợp cá biển và gan gà tươi nguyên chất thích hợp dùng cho Chó Mèo.

CHẤP HẾT TẤT CẢ MÈO BIẾNG ĂN, KHÓ ĂN, KÉN MỌI LOẠI THỨC ĂN.
💯 100% nguyên liệu tự nhiên, không độn rau củ, chứa độ ẩm & đạm tự nhiên cao từ 60-84%.
💯 Năng lượng cao hơn vượt trội so với các dòng sản phẩm khác trên thị trường (trung bình ở mức 400kcal/kg).
💯 Công thức siêu cấp nước, giúp ngăn ngừa sỏi thận.
💯 Với giá chỉ từ 8k/bữa ăn là Boss đã có được bữa ăn thơm ngon, tốt cho sức khỏe.
💯 Chỉ cần bảo quản sản phẩm trong ngăn mát, không cần chế biến hay hâm nóng.

Paddy có sẵn có 2 mùi vị thơm ngon #BestSeller, hấp dẫn các bé kén ăn
✅ Hỗn Hợp Gà - cho Chó & Mèo
✅ Hỗn Hợp Cá - cho Mèo
✅ Hỗn Hợp Gà - cho Chó & Mè', NULL, 1, 45000, CAST(N'2023-10-01' AS Date), 1, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (15, N'Pate Cho Mèo Dạng Thạch Nekko', N'1. Giới thiệu về pate Nekko cho mèo 70g:
Pate Nekko được làm từ 100% thực thịt và cá thật, chất lượng cao và đã được lựa chọn là tốt. Những chú mèo rất thích hương vị của cá, thịt và phô mai trong các loại pate Nekko. Sản phẩm chứa các vitamin và khoáng chất cần thiết cho con mèo yêu quý của bạn.

2. Công dụng và ưu điểm của pate Nekko:
- Nuôi dưỡng làn da và duy trì một lớp lông mượt cho mèo.
- Nuôi dưỡng mắt và hệ thần kinh của mèo', NULL, 1, 46000, CAST(N'2023-10-01' AS Date), 1, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (16, N'Pate Mèo Kings Pet Cá Ngừ', N'- Sản phẩm Pate cá ngừ Jelly King’s Pet By với 70% là cá ngừ thịt trắng được đánh bắt tại vùng biển miền Nam Việt Nam.
- Cá được đánh bắt và chế biến trong ngày theo tiêu chuẩn sản xuất khép kín từ thuyền đến xưởng sản xuất nhằm giữ nguyên độ tươi ngon của cá.
- Khi mở nắp hộp Pate cá ngừ Jelly King’s Pet sẽ cảm nhận rõ ràng được mùi thơm tươi mới của thành phần khác biệt so với mùi tanh như các dòng sản phẩm thông thường.
- Cam kết 100% cá ngừ tươi đi thẳng từ vùng biển đánh bắt đến nhà máy, không qua quá trình đông lạnh hay bảo quản dài ngày.
- Đồng thời nguyên liệu tươi ngon còn giúp sản phẩm tuyệt đối không cần dùng thêm các loại phụ liệu hóa học, chất độn hay mùi hương nhân tạo để kích thích vị giác của mèo.', NULL, 1, 39000, CAST(N'2023-10-01' AS Date), 1, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (17, N'Pate Mèo Meowow Súp Cá Ngừ', N'Cá ngừ thịt trắng đóng hộp Tuna White Meat là món ăn nhẹ giàu dinh dưỡng, hỗ trợ cho sự phát triển toàn diện của mèo, đồng thời được mix vị với nhiều loại thịt khác để tăng hàm lượng dinh dưỡng cũng như hương vị thơm ngon.

- Sử dụng thịt cá ngừ trắng tươi, miếng cá mềm, kích thước nhỏ vừa ăn. Các thành phần mix cùng như tôm tươi nguyên con, cá cơm sữa Nhật Bản, thịt cua, cá hồi nguyên thớ và gà xé sasami.

- Dành cho mọi lứa tuổi, kể cả mèo con, mèo lớn tuổi và mèo có hệ tiêu hóa nhạy cảm.

- Giàu DHA, omega-3, giúp mèo sáng mắt, mượt lông.

- Bổ sung taurin, tốt cho tim mạch và trí não.

- Cấp nước cho chế độ ăn hằng ngày, đặc biệt phù hợp với những chú mèo ít uống nước.

- Hộp nhôm hút chân không hiện đại, giữ sản phẩm tươi ngon.', NULL, 1, 35000, CAST(N'2023-10-01' AS Date), 1, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (18, N'Hạt Royal Canin Mini Puppy Cho Chó', N'Thức ăn cho chó RC Mini Puppy LÀ SẢN PHẨM THỨC ĂN KHÔ CHO CHÓ CON CỠ NHỎ DƯỚI 10 THÁNG TUỔI CÓ TRỌNG LƯỢNG 4 - 10KG - Vì khả năng tiêu hóa của giống chó nhỏ phát triển khá chậm nên sử dụng Thức ăn cho chó RC Mini Puppy cung cấp năng lượng cao trong thời kỳ phát triển ngắn ngủi mạnh mẽ. Thức ăn cho chó RC Mini Puppy đã kết hợp các nguồn dinh dưỡng từ các protein dễ tiêu hóa với các men vi sinh giúp tăng cường hệ tiêu hóa tối ưu, giúp cơ thể dễ hấp thu chất dinh dưỡng, hỗ trợ tiêu hóa Thêm vào đó, Mini Puppy còn giúp tăng sức đề kháng tự nhiên của chó con với hợp chất chống oxy hóa chứa trong các hạt thức ăn chó hình dạng 3 góc giúp giảm hình thành cao răng. Đối Tượng Sử Dụng:Chó con cỡ nhỏ dưới 10 tháng tuổi có trọng lượng từ 4 - 10kg (9 – 22 lbs).', NULL, 1, 35000, CAST(N'2023-10-01' AS Date), 2, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (19, N'Hạt Pedigree Puppy Cho Chó Con', N'Hương vị gà và trứng thơm ngon với nhân sữa bên trong, giúp cún ăn ngon miệng.
Cung cấp đủ vitamin và khoáng chất, giúp tăng cường hệ thống miễn dịch của cún, giiúp cún cưng phát triển khỏe mạnh,
Bổ sung DHA và Choline rất cần thiết cho sự phát triển của não bộ, để cún thật thông minh, lanh lợi.
Sản phẩm chứa nhiều canxi và phốt pho, giúp cho răng và xương cún chắc khỏe.
Hạt nhỏ, vỏ mỏng giòn, nhân sữa thơm ngon giúp cún với hàm răng nhỏ chưa phát triển cứng cáp cũng có thể ăn dễ dàng.
Kiểm soát được khẩu phần ăn hàng ngày, tránh việc quá nhiều để cún bỏ lại thức ăn thừa.
Nhanh chóng, tiện lợi, không tốn nhiều thời gian chuẩn bị,
Nhiều định lượng để bạn lựa chọn tùy theo nhu cầu của cún.', NULL, 1, 40000, CAST(N'2023-10-01' AS Date), 2, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (20, N'Hạt Royal Canin Cho Chó Chihuahua', N'Sản phẩm dinh dưỡng dành riêng cho giống chó Chihuahua với hình dáng hạt được thiết kế dành riêng cho giống chó này. Nguồn dinh dưỡng đặc biệt được các nhà khoa học nghiên cứu và dựa trên kinh nghiệm từ các nhà nhân giống thế giới.

Kích thích sự thèm ăn
Hình dạng nhỏ gọn nhỏ gọn thích hợp cho hàm nhỏ
Giảm phân và mùi hôi
Hỗ trợ sức khỏe hệ miễn dịch
100% dinh dưỡng cân bằng
100% đảm bảo an toàn
Thức ăn cho chó ROYAL CANIN CHIHUAHUA PUPPY được thiết kế dành riêng cho giống chó Chihuahua từ 8 tuần đến 8 tháng.
Hình dáng hạt', NULL, 1, 52000, CAST(N'2023-10-01' AS Date), 2, 100)
INSERT [dbo].[Product] ([ProductID], [ProductName], [Desciption], [Picture], [Status], [Price], [CreateDate], [ProCategoriesID], [Quantity]) VALUES (21, N'Hạt Smartheart Puppy Vị Bò & Sữa', N'Thức ăn hạt cho chó con Smartheart Puppy vị bò & sữa

Công dụng của Smartheart Puppy:

- Tăng cường phát triển trí não

- Giúp tim mạch khỏe mạnh

- Đẹp da, mượt lông

- Tăng cường hệ thống miễn dịch

- Hệ thống tiêu hóa khỏe mạnh

- Xương và răng chắc khỏe

Thành phần: Gạo, thịt heo, đậu nành, mỡ gà, bột củ cải, dầu cá, chất thay thế sữa, dầu cá, DHA, omega 3…

Xuất xứ: Thái Lan', NULL, 1, 61000, CAST(N'2023-10-01' AS Date), 2, 100)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (1, N'Thức ăn cho mèo', N'Danh mục này bao gồm các sản phẩm và phụ kiện liên quan đến mèo', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (2, N'Thức ăn cho chó', N'Danh mục này chứa các sản phẩm và phụ kiện dành cho chó', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (3, N'Dinh Dưỡng', N'Danh mục này cung cấp các sản phẩm liên quan đến dinh dưỡng cho thú cưng như thức ăn chất lượng cao, bổ sung vitamin và khoáng chất, hoặc các sản phẩm dinh dưỡng đặc biệt cho thú cưng có nhu cầu đặc thù.', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (4, N'Dụng cụ y tế ', N'Danh mục này chứa các dụng cụ y tế và sản phẩm dùng trong việc chăm sóc sức khỏe cho thú cưng như bộ chăm sóc răng miệng, kẹp móng, xịt chống côn trùng, băng gạc và các sản phẩm khác liên quan đến y tế thú cưng.', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (5, N'Quần Áo', N'Danh mục này bao gồm các sản phẩm quần áo dành cho thú cưng như áo len, áo khoác, áo sơ mi, áo thể thao, váy cho thú cưng và các loại quần áo khác để giữ ấm, tạo phong cách và bảo vệ thú cưng khỏi thời tiết khắc nghiệt.', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (6, N'Đồ chơi', N'Danh mục này bao gồm các đồ chơi dành cho thú cưng như bóng, chuỗi răng, đồ chơi nạp nước, đồ chơi kích thích trí tuệ và các loại đồ chơi khác để giải trí và kích thích hoạt động của thú cưng.', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (7, N'Phụ kiện ', N'Danh mục này chứa các phụ kiện khác như vòng cổ, lồng và giường, bát ăn, bình nước, dây xích, áo mưa và các loại phụ kiện khác để chăm sóc và trang trí cho thú cưng.', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (8, N'Vệ sinh', N'Danh mục này chứa các sản phẩm vệ sinh dành cho thú cưng như bột cát vệ sinh cho mèo, giấy thảm vệ sinh, nước tẩy mùi vệ sinh, bông tẩy tai, và các sản phẩm khác để giữ vệ sinh và sạch sẽ cho thú cưng', NULL, 1)
INSERT [dbo].[ProductCategories] ([ProCategoriesID], [ProCategoriesName], [Desciptions], [Picture], [Status]) VALUES (9, N'Chuồng và lồng', N'Danh mục này chứa các sản phẩm chuồng và lồng dành cho thú cưng như chuồng cho chó, lồng cho mèo, chuồng vận chuyển, và các loại chuồng và lồng khác để cung cấp nơi ở an toàn và thoải mái cho thú cưng.', NULL, 1)
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'ADMIN')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'CUSTOMER')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'MANAGER')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (4, N'PARTNER')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Room] ON 

INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (1, N'Phòng 1', N'Mô tả cho phòng 1', 1, NULL, 100, 1, 2)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (2, N'Phòng 2', N'Mô tả cho phòng 2', 1, NULL, 120, 2, 2)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (5, N'Phòng 3', N'Mô tả cho phòng 3', 1, NULL, 140, 1, 1)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (6, N'Phòng 4', N'Mô tả cho phòng 4', 1, NULL, 140, 1, 2)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (7, N'abc', N'abc', 1, N'/img/Untitled-2.png', 12312, 1, 123)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (8, N'abc', N'123', 1, N'/img/394481700_1190360021921612_8349014315165585456_n.png', 123, 1, 123)
INSERT [dbo].[Room] ([RoomID], [RoomName], [Desciptions], [Status], [Picture], [Price], [RoomCategoriesID], [Slot]) VALUES (9, N'abc', N'123', 1, N'/img/82524Untitled-2.png', 123, 2, 123)
SET IDENTITY_INSERT [dbo].[Room] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomCategories] ON 

INSERT [dbo].[RoomCategories] ([RoomCategoriesID], [RoomCategoriesName], [Desciptions], [Picture], [Status]) VALUES (1, N'Room S', N'Loại phòng vip dành cho những thú cưng có yêu cầu cao', NULL, 1)
INSERT [dbo].[RoomCategories] ([RoomCategoriesID], [RoomCategoriesName], [Desciptions], [Picture], [Status]) VALUES (2, N'Room A', N'Loại phòng thường', NULL, 1)
INSERT [dbo].[RoomCategories] ([RoomCategoriesID], [RoomCategoriesName], [Desciptions], [Picture], [Status]) VALUES (3, N'avc', N'q23', N'/img/08754images (1).png', 1)
SET IDENTITY_INSERT [dbo].[RoomCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[ServiceCategories] ON 

INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (2, N'Dịch vụ dắt thu cưng đi dạo', NULL, NULL, 1)
INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (3, N'Dịch vụ chăm sóc thu cưng tại nhà', NULL, NULL, 1)
INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (4, N'Spa thú cưng', NULL, NULL, 1)
INSERT [dbo].[ServiceCategories] ([SerCategoriesID], [SerCategoriesName], [Desciptions], [Picture], [Status]) VALUES (5, N'Đào tạo thú cưng', NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[ServiceCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Picture], [Price], [SerCategoriesID]) VALUES (1, N'Service 1', N'Mô tả cho service 1 ', 1, NULL, 100, 2)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Picture], [Price], [SerCategoriesID]) VALUES (2, N'Service 2', N'Mô tả cho service 2', 1, NULL, 200, 3)
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [Desciptions], [Status], [Picture], [Price], [SerCategoriesID]) VALUES (4, N'service 3', N'Mô tả cho service 3', 1, NULL, 200, 2)
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (1, N'Nguyễn Phúc', N'Hưng', N'0988888888', N'Thành phố Hà Nội', N'Quận Ba Đình', N'Phường Phúc Xá', N'Hà Nội', N'Người yêu động vật', NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (2, N'Vương', N'Bát Đản', N'0988888888', N'Tỉnh Cao Bằng', N'Thành phố Cao Bằng', N'Phường Sông Hiến', N'Vĩnh Phúc', NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (3, N'Thịnh', N'Suy', N'0987654321', N'Hà Nội', N'Thạch Hoà ', N'Thạch Thất', N'Hà Nội', N'Người yêu động 4 chân', NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserInfoID], [FirstName], [LastName], [Phone], [Province], [District], [Commune], [Address], [Descriptions], [ImageUser]) VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
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
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_UserInfo]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Booking] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Booking]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Orders]
GO
ALTER TABLE [dbo].[BookingRoomDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingRoomDetail_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[BookingRoomDetail] CHECK CONSTRAINT [FK_BookingRoomDetail_Room]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Booking] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Booking] ([BookingID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Booking]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Orders]
GO
ALTER TABLE [dbo].[BookingServicesDetail]  WITH CHECK ADD  CONSTRAINT [FK_BookingServicesDetail_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[BookingServicesDetail] CHECK CONSTRAINT [FK_BookingServicesDetail_Services]
GO
ALTER TABLE [dbo].[OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProductDetail] CHECK CONSTRAINT [FK_OrderProductDetail_Orders]
GO
ALTER TABLE [dbo].[OrderProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderProductDetail_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderProductDetail] CHECK CONSTRAINT [FK_OrderProductDetail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_UserInfo] FOREIGN KEY([UserInfoID])
REFERENCES [dbo].[UserInfo] ([UserInfoID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_UserInfo]
GO
ALTER TABLE [dbo].[OrderType]  WITH CHECK ADD  CONSTRAINT [FK_OrderType_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderType] CHECK CONSTRAINT [FK_OrderType_Orders]
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
ALTER TABLE [dbo].[RoomService]  WITH CHECK ADD  CONSTRAINT [FK_RoomService_Room] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Room] ([RoomID])
GO
ALTER TABLE [dbo].[RoomService] CHECK CONSTRAINT [FK_RoomService_Room]
GO
ALTER TABLE [dbo].[RoomService]  WITH CHECK ADD  CONSTRAINT [FK_RoomService_Services] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[RoomService] CHECK CONSTRAINT [FK_RoomService_Services]
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
