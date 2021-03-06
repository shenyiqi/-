USE [master]
GO
/****** Object:  Database [MyPets]    Script Date: 2017/6/12 18:21:47 ******/
CREATE DATABASE [MyPets]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyPets', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MyPets.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MyPets_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\MyPets_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MyPets] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyPets].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyPets] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyPets] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyPets] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyPets] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyPets] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyPets] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyPets] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [MyPets] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyPets] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyPets] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyPets] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyPets] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyPets] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyPets] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyPets] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyPets] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyPets] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyPets] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyPets] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyPets] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyPets] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyPets] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyPets] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyPets] SET RECOVERY FULL 
GO
ALTER DATABASE [MyPets] SET  MULTI_USER 
GO
ALTER DATABASE [MyPets] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyPets] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyPets] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyPets] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MyPets', N'ON'
GO
USE [MyPets]
GO
/****** Object:  Table [dbo].[Adminstrator]    Script Date: 2017/6/12 18:21:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Adminstrator](
	[AdminId] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [nvarchar](50) NULL,
	[AdminPwd] [nvarchar](50) NULL,
	[AdminImg] [nvarchar](max) NULL,
 CONSTRAINT [PK_Adminstrator] PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Baike]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Baike](
	[BaikeId] [int] IDENTITY(1,1) NOT NULL,
	[BaikeSeries] [nvarchar](50) NULL,
	[BaikeType] [nvarchar](50) NOT NULL,
	[BaikeTitle] [nvarchar](50) NOT NULL,
	[BaikeImg] [nvarchar](max) NULL,
	[BaikeDescribe] [nvarchar](max) NULL,
	[BaikeContent] [nvarchar](max) NOT NULL,
	[BaikeTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Baike] PRIMARY KEY CLUSTERED 
(
	[BaikeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaikeActivity]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaikeActivity](
	[ActivedId] [int] IDENTITY(1,1) NOT NULL,
	[ActivedTitle] [nvarchar](max) NOT NULL,
	[ActivedContent] [nvarchar](max) NOT NULL,
	[ActivedImg] [nvarchar](max) NOT NULL,
	[ActicedDetail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_BaikeActivity] PRIMARY KEY CLUSTERED 
(
	[ActivedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaikeAnswer]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaikeAnswer](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[UserId] [int] NOT NULL,
	[AnswerContent] [nvarchar](max) NULL,
	[AnswerTime] [datetime] NULL,
	[ClickNum] [int] NULL,
 CONSTRAINT [PK_BaikeAnswer] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaikeQuestion]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaikeQuestion](
	[QuestionId] [int] IDENTITY(1,1) NOT NULL,
	[QuestionTitle] [nvarchar](max) NULL,
	[QuestionType] [nvarchar](50) NULL,
	[QuestionDescribe] [nvarchar](max) NULL,
	[QuestionTime] [datetime] NULL,
	[UserId] [int] NULL,
	[isChoiceness] [bit] NULL,
 CONSTRAINT [PK_BaikeQuestion] PRIMARY KEY CLUSTERED 
(
	[QuestionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Collect]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Collect](
	[CollectId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[ShopId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Collect] PRIMARY KEY CLUSTERED 
(
	[CollectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Goods]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[GoodsId] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [nvarchar](max) NOT NULL,
	[SeriesName] [nvarchar](50) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
	[DetailName] [nvarchar](50) NOT NULL,
	[GoodsImg1] [nvarchar](max) NOT NULL,
	[GoodsImg2] [nvarchar](max) NOT NULL,
	[GoodsImg3] [nvarchar](max) NOT NULL,
	[GoodsImg4] [nvarchar](max) NOT NULL,
	[GoodsPrice] [decimal](10, 2) NOT NULL,
	[GoodsDescribe] [nvarchar](max) NULL,
	[IsDiscount] [bit] NOT NULL,
	[DiscountPrice] [decimal](10, 2) NULL,
	[GoodsStock] [int] NOT NULL,
	[ShopId] [int] NOT NULL,
	[SellNum] [int] NULL,
	[GoodsRange] [nchar](10) NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsComment]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsComment](
	[CommentId] [int] IDENTITY(1,1) NOT NULL,
	[CommentContent] [nvarchar](max) NOT NULL,
	[ContentRange] [nvarchar](max) NULL,
	[CommentTime] [datetime] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
	[IsReply] [bit] NOT NULL,
 CONSTRAINT [PK_GoodsComment] PRIMARY KEY CLUSTERED 
(
	[CommentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GoodsResponseComment]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsResponseComment](
	[AnswerId] [int] IDENTITY(1,1) NOT NULL,
	[CommentId] [int] NOT NULL,
	[AnswerContent] [nvarchar](max) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[AnswerTime] [datetime] NOT NULL,
 CONSTRAINT [PK_GoodsResponseComment] PRIMARY KEY CLUSTERED 
(
	[AnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderCount] [decimal](10, 2) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[OrderAddress] [nvarchar](max) NOT NULL,
	[OrderRemark] [nvarchar](max) NULL,
	[OrderState] [bit] NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[DetailSum] [int] NOT NULL,
	[DetailCount] [decimal](10, 2) NOT NULL,
	[UserId] [int] NOT NULL,
	[OrderNumber] [nvarchar](50) NOT NULL,
	[OrderState] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Post]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[PostId] [int] IDENTITY(1,1) NOT NULL,
	[PostTitle] [nvarchar](max) NOT NULL,
	[PostContent] [nvarchar](max) NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[UserId] [int] NOT NULL,
	[PostType] [nvarchar](50) NOT NULL,
	[IsChoose] [bit] NOT NULL,
	[IsTop] [bit] NOT NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PrivateMsg]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrivateMsg](
	[PrivateMsgId] [int] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[PrivateMsgContent] [nvarchar](max) NOT NULL,
	[PrivateMsgEmail] [nvarchar](max) NULL,
	[PrivateMsgTime] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PrivateMsg] PRIMARY KEY CLUSTERED 
(
	[PrivateMsgId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResponAnswer]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ResponAnswer](
	[ResponseAnswerId] [int] IDENTITY(1,1) NOT NULL,
	[AnswerId] [int] NULL,
	[ResponContent] [varchar](max) NULL,
	[UserName] [nvarchar](50) NULL,
	[ResponTime] [datetime] NULL,
 CONSTRAINT [PK_ResponAnswer] PRIMARY KEY CLUSTERED 
(
	[ResponseAnswerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Response]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[ResponseId] [int] IDENTITY(1,1) NOT NULL,
	[PostId] [int] NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReceiverId] [int] NOT NULL,
	[ResponseTime] [datetime] NOT NULL,
	[ResponseContent] [nvarchar](max) NOT NULL,
	[ResponseFloor] [int] NOT NULL,
 CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED 
(
	[ResponseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shop]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ShopId] [int] IDENTITY(1,1) NOT NULL,
	[ShopName] [nvarchar](50) NULL,
	[ShopImg] [nvarchar](50) NULL,
	[CustomerService] [nvarchar](50) NULL,
	[ShopEmail] [nvarchar](50) NULL,
	[SellerIdCard] [nvarchar](50) NULL,
	[UserId] [int] NULL,
	[StarLevel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ShopId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopCart]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopCart](
	[CartId] [int] IDENTITY(1,1) NOT NULL,
	[GoodsId] [int] NOT NULL,
	[GoodsSum] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ShopCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShopRecommend]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShopRecommend](
	[RecommendId] [int] IDENTITY(1,1) NOT NULL,
	[RecommendImg] [nvarchar](max) NOT NULL,
	[ShopId] [int] NOT NULL,
 CONSTRAINT [PK_ShopRecommend] PRIMARY KEY CLUSTERED 
(
	[RecommendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 2017/6/12 18:21:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserPhone] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[UserPwd] [nvarchar](50) NOT NULL,
	[ConfirmPwd] [nvarchar](50) NOT NULL,
	[UserImg] [nvarchar](max) NULL,
	[IsSeller] [bit] NOT NULL,
	[Range] [nvarchar](50) NULL,
	[Score] [int] NULL,
 CONSTRAINT [PK_UserInfo] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Baike] ON 

INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (1, N'狗系列', N'准备养狗 狗狗饲养', N'宠物狗多大适合做绝育手术', N'~/Content/Baike/img/upload/1494853-9910.jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<p>2017-01-21</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align:center">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align:center">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', CAST(0x0000A75100963BEB AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (2, N'狗系列', N'准备养狗 狗狗饲养', N'狗妈妈必知得泰迪配种知识', N'~/Content/Baike/img/upload/89a45c89d8010a0de2da80fb1eacb356.jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1><p style="text-align: center;">2017-06-12&nbsp;</p><p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p><div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br /><a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div><div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div><p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p><p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>', CAST(0x0000A751009A6E60 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (3, N'狗系列', N'准备养狗 狗狗饲养', N'怀孕宠物狗喂食次数的调整', N'~/Content/Baike/img/upload/1648-121113111Q2.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751009C6497 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (4, N'狗系列', N'准备养狗 狗狗饲养', N'博美咳嗽的症状与区别分析', N'~/Content/Baike/img/upload/2291021-4653.jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<p style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></p>

<p style="text-align:center">2017-03-19&nbsp;</p>

<p style="text-align:justify">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align:center">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align:center">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>

<p>&quot;&gt;</p>
', CAST(0x0000A751009DB9A8 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (5, N'狗系列', N'准备养狗 狗狗饲养', N'哈士奇肠胃疾病的常见症状', N'~/Content/Baike/img/upload/28105023-9176.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751009EB44C AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (6, N'狗系列', N'准备养狗 狗狗饲养', N'宠物送洗要注意的三大问题', N'~/Content/Baike/img/upload/300000764046131181673305202_950.jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751009FF784 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (7, N'狗系列', N'准备养狗 狗狗饲养', N'简单就护理好宠物狗狗脚部', N'~/Content/Baike/img/upload/89a45c89d8010a0de2da80fb1eacb356.jpg', N'博美十分漂亮的狗狗，而且观赏性很强，对于狗狗来说，绝对可以称得上是萌新小宠。博美比赛也是很多的，那么我们应该怎么训练一直参赛的博美犬呢?这里有什么讲究呢?今天小编就带你看看!博美　　博美犬很喜欢运动，适当的运动可以提高博美犬的体质，同时对我们和博美犬之间的感情也可以起到加温的作用。一般来说，每天带博', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A23BF0 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (8, N'狗系列', N'准备养狗 狗狗饲养', N'使宠物狗毛发有光泽的技巧', N'~/Content/Baike/img/upload/89a45c89d8010a0de2da80fb1eacb356.jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A33131 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (9, N'狗系列', N'准备养狗 狗狗饲养', N'长毛犬美毛护理方法的技巧', N'~/Content/Baike/img/upload/89a45c89d8010a0de2da80fb1eacb356.jpg', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A3F0F1 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (10, N'狗系列', N'准备养狗 狗狗饲养', N'西里汉梗的护理知识', N'~/Content/Baike/img/upload/89a45c89d8010a0de2da80fb1eacb356.jpg', N'贵宾犬最近会有眼屎，家长们可是着急坏了，我们的狗狗现在是怎么回事了呢?这是为什么呢?难道吃的不合适吗?今天小编就带大家了解一下贵宾为什么眼屎变得多了!贵宾眼屎　　临床研究发现，导致贵宾犬(详情介绍)眼屎多的原因有很多。比如说上火，眼睛炎症，体内有虚热等等。这些病因就会导致贵宾犬眼屎增多。因为不同的病', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A565C3 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (11, N'狗系列', N'幼犬 养狗', N'如何挑选一只好的纯种贵宾幼犬', N'~/Content/Baike/img/upload/0a84764d969565bf.jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A6C87D AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (12, N'狗系列', N'幼犬 幼犬洗澡 狗狗洗澡', N'幼犬什么时候可以洗澡', N'~/Content/Baike/img/upload/0a84764d969565bf.jpg', N'比格犬是一种小巧，漂亮，淘气的小型宠物犬。很多家长一开始会十分喜欢，但是如果没有教育好，后期将会十分头疼，然后慢慢疏远。其实想要比格能够大小便自理是很简单的哦!今天就和小编一起看看吧!训练比格　　首先训练比格犬大小便最好再幼年时期开始。虽然比格犬在年幼时期，大小便都不规律，训练起来有一定难度，作为家', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A89D3B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (13, N'狗系列', N'幼犬 幼犬喂食', N'泰迪幼犬几个月可以吃干粮', N'~/Content/Baike/img/upload/0a84764d969565bf.jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100A99D12 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (14, N'狗系列', N'幼犬 幼犬喂食', N'宠物幼犬喂养的最佳方法', N'~/Content/Baike/img/upload/1494853-9910.jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100AA5F8F AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (15, N'狗系列', N'幼犬 幼犬健康 狗狗健康', N'秋田犬幼犬的健康问题', N'~/Content/Baike/img/upload/52603eaf40b3e98a83971511eaa1bd54.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100ABFD0C AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (16, N'狗系列', N'成犬 成犬喂食 狗狗喂食', N'正确的给狗狗喂食健康狗粮', N'~/Content/Baike/img/upload/1I55C2Q-0.jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100AD38D0 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (17, N'狗系列', N'狗狗训练  成犬', N'用合适的方法训练宠物狗狗', N'~/Content/Baike/img/upload/65b1OOOPIC5a.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100ADF0F7 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (18, N'狗系列', N'成犬 成犬粮', N'轻松自制美味营养的成犬粮', N'~/Content/Baike/img/upload/2009040926722498.jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100AEDA94 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (19, N'狗系列', N'成犬 狗狗健康', N'雪纳瑞缺钙危害大要及时补', N'~/Content/Baike/img/upload/Img401711705.jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100AFDA6A AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (20, N'狗系列', N'成犬 狗狗健康', N'溺爱可能让宠物爱宠不健康', N'~/Content/Baike/img/upload/Mypsd_52802_201309090817380036B.jpg', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100B096C7 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (21, N'狗系列', N'老年犬 美容护理', N'老年狗狗也要细心美容护理', N'~/Content/Baike/img/upload/5_120709170355_1.jpg', N'贵宾犬最近会有眼屎，家长们可是着急坏了，我们的狗狗现在是怎么回事了呢?这是为什么呢?难道吃的不合适吗?今天小编就带大家了解一下贵宾为什么眼屎变得多了!贵宾眼屎　　临床研究发现，导致贵宾犬(详情介绍)眼屎多的原因有很多。比如说上火，眼睛炎症，体内有虚热等等。这些病因就会导致贵宾犬眼屎增多。因为不同的病', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100B1F2E0 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (22, N'狗系列', N'老年犬 护理', N'老龄狗狗的特殊护理六步骤', N'~/Content/Baike/img/upload/510512-2646.jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100B2CAD1 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (23, N'狗系列', N'老年犬 健康', N'老年犬的营养饲养方案大全', N'~/Content/Baike/img/upload/20070708030713151.JPG', N'比格犬是一种小巧，漂亮，淘气的小型宠物犬。很多家长一开始会十分喜欢，但是如果没有教育好，后期将会十分头疼，然后慢慢疏远。其实想要比格能够大小便自理是很简单的哦!今天就和小编一起看看吧!训练比格　　首先训练比格犬大小便最好再幼年时期开始。虽然比格犬在年幼时期，大小便都不规律，训练起来有一定难度，作为家', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100B4336A AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (24, N'狗系列', N'老年犬 健康', N'狗狗老年期容易出现的问题', N'~/Content/Baike/img/upload/a420.jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100B57561 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (25, N'狗系列', N'老年犬 健康', N'老年狗狗日常饮食管理大全', N'~/Content/Baike/img/upload/xinsrc_552010317101434325937177.jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100BE3A1E AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (26, N'狗系列', N'狗交配 繁殖', N'宠物狗狗交配与繁殖的事宜', N'~/Content/Baike/img/upload/2_119723_618135f51c4b77a.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100EBD962 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (27, N'狗系列', N'狗交配 繁殖', N'让母狗繁殖的七大正当理由', N'~/Content/Baike/img/upload/011.jpg', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100ECE7A7 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (28, N'狗系列', N'狗交配 日常检查', N'贵宾犬的日常家庭自助检查', N'~/Content/Baike/img/upload/521f836066e5e67f5e983659229c_461_461.c1.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100EE15F6 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (29, N'狗系列', N'狗交配 蝴蝶犬 健康', N'蝴蝶犬九大问题迅速送医院', N'~/Content/Baike/img/upload/1443514309-0.jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100EF1954 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (30, N'狗系列', N'狗交配 繁殖', N'发情期引导狗狗交配的方法', N'~/Content/Baike/img/upload/t0179c889fafc7ccc4c.jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100EFDC10 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (31, N'狗系列', N'狗感冒', N'狗狗感冒、细小、犬瘟热症状的区别', N'~/Content/Baike/img/upload/0beb1dcf24533d64.jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F08E96 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (32, N'狗系列', N'狗感冒', N'吉娃娃狗感冒吃什么药', N'~/Content/Baike/img/upload/2480_7782.jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F1B81F AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (33, N'狗系列', N'狗感冒 医疗', N'狗狗患上感冒的症状及治疗', N'~/Content/Baike/img/upload/1275877971_1a.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F31A8B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (34, N'狗系列', N'狗感冒 健康 ', N'泰迪犬三种疾病的饮食注意', N'~/Content/Baike/img/upload/19300001035357130568571785032.jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F42BB7 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (35, N'狗系列', N'狗感冒 医疗', N'宠物狗感冒的三种治疗方法', N'~/Content/Baike/img/upload/t0133f08cf402d8b0cc.jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F4B3BF AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (36, N'狗系列', N'狗皮肤病 健康 护理', N'京巴犬得了皮肤病怎么办', N'~/Content/Baike/img/upload/164404thz91vg30cvvw0ug.jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F60FC2 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (37, N'狗系列', N'狗皮肤病 健康', N'苏格兰牧羊犬眼屎多怎么回事？', N'~/Content/Baike/img/upload/1483523067856426.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F6F8E7 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (38, N'狗系列', N'狗皮肤病 医疗', N'犬的八个皮肤肿瘤问题', N'~/Content/Baike/img/upload/300001143928130283511182804_950.gif', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F83CA2 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (39, N'狗系列', N'狗皮肤病 医疗', N'宠物狗皮炎湿疹的治疗方法', N'~/Content/Baike/img/upload/t01a871085ed73b84e2.jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100F946E3 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (40, N'狗系列', N'狗皮肤病 健康', N'什么是犬的皮肤真菌病', N'~/Content/Baike/img/upload/t01458f664819249e43.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FA493C AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (41, N'狗系列', N'狗掉毛 ', N'狗狗掉毛的原因有哪些', N'~/Content/Baike/img/upload/57c7eba0a6634.jpeg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FB4499 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (42, N'狗系列', N'狗掉毛 护理', N'【雪纳瑞掉毛吗】雪纳瑞怎么养', N'~/Content/Baike/img/upload/1749-1247913912.jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FC346A AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (43, N'狗系列', N'狗掉毛 护理', N'法国斗牛犬掉毛怎么办？', N'~/Content/Baike/img/upload/4902572.jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FCF71E AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (44, N'狗系列', N'狗掉毛  健康', N'狗狗掉毛吃鱼油好吗', N'~/Content/Baike/img/upload/201611210935245767.jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FE1CC6 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (45, N'狗系列', N'狗掉毛', N'春夏交替对狗狗掉毛的护理', N'~/Content/Baike/img/upload/xinsrc_12201031710016564323113.jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FE959E AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (46, N'狗系列', N'狗呕吐 健康', N'狗呕吐是怎么回事？狗狗呕吐怎么办', N'~/Content/Baike/img/upload/1684o2.jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75100FF1C8B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (47, N'狗系列', N'狗呕吐 医疗', N'狗狗呕吐原因及治疗', N'~/Content/Baike/img/upload/445423.jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A7510100851D AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (48, N'狗系列', N'狗呕吐 健康', N'发现了博美犬呕吐要怎么办', N'~/Content/Baike/img/upload/01300000029584128505368532061.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75101041B8B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (49, N'狗系列', N'狗呕吐 医疗', N'狗狗经常呕吐的治疗方法', N'~/Content/Baike/img/upload/enterdesk (5).jpg', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751010514E8 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (50, N'狗系列', N'狗呕吐 健康', N'成长期狗狗经常呕吐怎么办', N'~/Content/Baike/img/upload/n_s12241294658358535123.jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75101060931 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (51, N'狗系列', N'狗不能吃的 健康', N'不能给宠物狗吃的七种食物', N'~/Content/Baike/img/upload/A1837DAF546A5DEFA8787CF2EFA8634A.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75101077793 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (52, N'狗系列', N'狗不能吃的 健康', N'不能给宠物狗吃的蔬菜盘点', N'~/Content/Baike/img/upload/4902572.jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751010A7A0D AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (53, N'狗系列', N'狗不能吃的 健康', N'泰迪狗不能吃什么东西？', N'~/Content/Baike/img/upload/300001143928130283511182804_950.gif', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751010B47D5 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (54, N'狗系列', N'狗不能吃的 健康', N'解读关于狗吃蔬菜的4问题', N'~/Content/Baike/img/upload/1443514309-0.jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A751010C3FAA AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (55, N'狗系列', N'狗贫血 医疗', N'怎样做好狗狗贫血的防治', N'~/Content/Baike/img/upload/timg (1).jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300896759 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (56, N'狗系列', N'狗贫血 医疗', N'犬营养性贫血症的诊断与治疗', N'~/Content/Baike/img/upload/timg (2).jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008A7B45 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (57, N'狗系列', N'狗贫血 医疗', N'健康最重要狗狗贫血怎么办', N'~/Content/Baike/img/upload/timg (3).jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008BA30B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (58, N'狗系列', N'狗贫血 医疗', N'狗妈必知狗贫血的相关知识', N'~/Content/Baike/img/upload/timg (4).jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008C7C8E AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (59, N'狗系列', N'狗贫血 健康', N'关于宠物狗再生障碍性贫血', N'~/Content/Baike/img/upload/timg.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008D5187 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (60, N'狗系列', N'狗狗发抖 健康', N'宠物犬会发抖的原因有哪些', N'~/Content/Baike/img/upload/timg (5).jpg', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008E26DB AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (61, N'狗系列', N'狗狗发抖 健康', N'狗妈必知狗发抖是怎么回事', N'~/Content/Baike/img/upload/timg (1).jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008ECE14 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (62, N'狗系列', N'狗狗发抖 健康', N'狗不停发抖可能是患了脑炎', N'~/Content/Baike/img/upload/timg (2).jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753008F972B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (63, N'狗系列', N'狗吃药 健康', N'如何让狗狗乖乖吃药？', N'~/Content/Baike/img/upload/timg (5).jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A7530090667D AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (64, N'狗系列', N'狗吃药 健康 训练', N'如何让狗狗吃药', N'~/Content/Baike/img/upload/timg (1).jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A7530091519E AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (65, N'狗系列', N'狗吃药 医疗', N'狗狗吃了驱虫药的不良反应', N'~/Content/Baike/img/upload/timg (2).jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753009226ED AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (66, N'狗系列', N'狗吃药 训练', N'轻松喂任性的宠物狗狗吃药', N'~/Content/Baike/img/upload/timg (3).jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300937395 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (67, N'狗系列', N'狗吃药 健康', N'千万不能给狗狗吃的三类药', N'~/Content/Baike/img/upload/timg (4).jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300941DB9 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (68, N'狗系列', N'狗狗发烧 医疗', N'狗狗发烧怎么办？如何治疗', N'~/Content/Baike/img/upload/timg (5).jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A7530094E65B AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (69, N'狗系列', N'狗狗发烧 健康', N'狗狗发烧时应知的8件事', N'~/Content/Baike/img/upload/timg (1).jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A7530096211C AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (70, N'狗系列', N'狗狗发烧 健康', N'怎么给狗狗量体温？如何知道狗狗是否发烧呢', N'~/Content/Baike/img/upload/timg.jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A7530096F96C AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (71, N'狗系列', N'狗洗澡 健康', N'狗狗冬天能洗澡 感冒发烧怎么办？', N'~/Content/Baike/img/upload/', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753009C1BE7 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (72, N'狗系列', N'狗洗澡 健康', N'狗洗澡：教你怎么正确给狗狗洗脚', N'~/Content/Baike/img/upload/timg (5).jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753009CE78F AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (73, N'狗系列', N'狗洗澡 健康', N'宠物狗洗澡的重要性和方法', N'~/Content/Baike/img/upload/timg (1).jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A753009DFD30 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (74, N'狗系列', N'狗护毛 护理', N'狗狗毛打结怎么办？狗狗毛结团如何处理？', N'~/Content/Baike/img/upload/~/Content/Baike/img/upload/445423.jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300EEAECC AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (75, N'狗系列', N'狗护毛 护理', N'狗狗毛色不好怎么办？如何处理？', N'~/Content/Baike/img/upload/timg (4).jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F02A43 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (76, N'狗系列', N'狗护毛 美容护理', N'小贵宾大明星 贵宾犬的美容攻略', N'~/Content/Baike/img/upload/timg (2).jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F0D894 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (77, N'狗系列', N'狗修毛 护理', N'帮狗狗修毛？剃毛？视情况而定', N'~/Content/Baike/img/upload/timg (2).jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F22444 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (78, N'狗系列', N'狗修毛 护理', N'怎么帮狗狗修毛', N'~/Content/Baike/img/upload/4902572.jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F2B90F AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (79, N'狗系列', N'狗修毛 护理', N'为宠物狗狗修毛剪甲的步骤', N'~/Content/Baike/img/upload/timg (1).jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;"><span style="font-size:36px">西里汉梗的护理知识</span></h1>

<p style="text-align: center;">2017-05-04&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行护理清洁。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗狗洗澡的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都清理一下。</p>

<div style="text-align: center;"><img alt="西里汉梗" src="http://img.boqiicdn.com/Data/BK/A/1408/4/img86951407150766_y.jpg" title="西里汉梗" /><br />
<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a>(<a href="http://www.boqii.com/pet-all/575.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> &nbsp;西里汉梗活泼而好动，免不了会钻到一些比较脏的地方，所以要定期的为它进行<a href="http://www.boqii.com/tag/907/" target="_blank">护理</a><a href="http://www.boqii.com/tag/3024/" target="_blank">清洁</a>。最好是每天为其进行一次梳理，帮它整理被毛的同时还能够清除藏在被毛中的垃圾以及灰尘。 定期的洗澡也是必不可少的，一般狗<a href="http://www.boqii.com/tag/2157/" target="_blank">狗洗澡</a>的频率都不要超过一个星期一次。在洗澡后可以将耳毛，脚底毛等都<a href="http://www.boqii.com/tag/5072/" target="_blank">清理</a>一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;好动的它也喜欢奔跑和跳跃，所以闲暇之余可以带它出去散步，跑动一下都是很有好处的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;西里汉梗的学习能力很好，对于主人的要求及训练都能较快的接受，而且能很好地完成。而它这种较强的接受力，也能让主人在训练它的时候有较大的成就感。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/17278/" target="_blank">西里汉梗</a> <a href="http://www.boqii.com/tag/4958/" target="_blank">狗狗训练</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F3C4F6 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (80, N'狗系列', N'狗泪痕 健康', N'狗眼睛保健消除泪痕大作战', N'~/Content/Baike/img/upload/timg (1).jpg', N'精心挑选的雪纳瑞小狗就要回家了！你是否准备好了雪纳瑞狗狗到家后要用的一系列东西呢？作为一个好主人，想要养好一只小雪纳瑞可不简单，我们需要准备很多的东西。', N'<h1 style="text-align: center;"><span style="font-size:36px">宠物多大适合做绝育手术</span></h1>

<p style="text-align: center;">2017-01-21</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp; 想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。</p>

<div style="text-align: center;"><img alt="腊肠犬" src="http://img.boqiicdn.com/Data/BK/A/1401/21/img41971390284026_y.jpg" title="腊肠犬" /><br />
<a href="http://www.boqii.com/tag/1435/" target="_blank">腊肠犬</a>(<a href="http://www.boqii.com/pet-all/503.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性<a href="http://www.boqii.com/tag/511/" target="_blank">疾病</a>的发生。<br />
　　猫和狗在6个月大就有生育能力了。母狗通常每年发情1-2次，每次持续3周左右。母猫第一次发情后可以在春季到初秋的时间里每3-4周发情一次，并且母猫可能在刚生完小猫仅10天後再次怀孕。<br />
　　猫和狗的怀孕时间均为63天。通常最佳的绝育时间是在宠物第一次发情前或发情期间隔，发情期时<a href="http://www.boqii.com/tag/5782/" target="_blank">宠物医生</a>都不建议做绝育手术。<br />
　　国外目前也有在猫狗3-4个月大就做绝育手术的，有兽医认为越早做手术越有利於健康和好性格的养成。在第一次生育前做绝育手术，通常可使宠物们保持青春期的活泼好动的性格。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/27064/" target="_blank">宠物</a>&nbsp;<a href="http://www.boqii.com/tag/11328/" target="_blank">宠物绝育</a>&nbsp;<a href="http://www.boqii.com/tag/4059/" target="_blank">年龄</a>&nbsp;<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F485C6 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (81, N'狗系列', N'狗泪痕 护理', N'狗狗脸部的清洁护理小窍门', N'~/Content/Baike/img/upload/timg (2).jpg', N'对于一些狗狗的日常生活用品我们在将狗狗领回家之前就应该准备好，不要当狗狗来到新家之后才慌乱地准备，这样很可能会出现遗漏的情况。所以对于养狗要准备哪些日常用品，每一个养狗的朋友都应该有所了解。', N'<h1 style="text-align: center;"><span style="font-size:36px">泰迪最佳配种时间</span></h1>

<p style="text-align: center;">2017-06-12&nbsp;</p>

<p style="text-align: justify;">&nbsp; 犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪狗狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1406/12/img44951402537228_y.jpg" style="height:350px; width:500px" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　　<span style="font-size:20px">犬类是季节性发情动物，一般是一年发情两次，分别在春秋两季，也有例外的，泰迪<a href="http://www.boqii.com/tag/6763/" target="_blank">狗</a>狗第一次发情时不宜配种，因为狗狗第一次发情还未到一岁，各个器官还尚未成熟，不宜配种。<br />
　　在泰迪最佳配种时间给其配种，则受孕的概率就会大大提高。最佳配种时间的选择依据主要是：当母犬的阴道出现流血现象后的第11至13天是泰迪最佳配种时间。然而对于已经生产过狗狗的母犬，判断依据也不一样，还有的母犬虽然是头一次配种然而表现却不一样，这需要主人掌握住母犬多种判断最佳配种时间的方法，以便根据不同的表现找出最佳的配种时间。<br />
　　当泰迪母犬遇到公犬频频排尿表示愿意接近公犬，并让公犬嗅其阴部，并愿意让公犬爬跨的现象，这就是母犬发情最强的表现，也是发情<a href="http://www.boqii.com/tag/285/" target="_blank">征兆</a>最为明显的情况，这时就可以让母犬进行交配。配种时以两次为主最好，即初配和复配。在目前交配之前最好不要给狗狗喂食或者给它吃太饱，而且还不要围观很多人，否则将会影响交配质量。<br />
　　为了更准确的知道泰迪最佳配种时间，建议在发情后的几天去<a href="http://www.boqii.com/tag/119/" target="_blank">宠物医院</a>做膜片，能更准确的看出泰迪狗狗是否到了排卵期。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/2053/" target="_blank">泰迪犬</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F52DE0 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (82, N'狗系列', N'狗泪痕 护理', N'处理比熊犬泪痕的七大方法', N'~/Content/Baike/img/upload/timg (3).jpg', N'雪纳瑞狗狗也是一种非常可爱的狗狗哦!那么我们在雪纳瑞幼犬期间，应该怎么去挑选啊?有什么要点呢?下面小编就带大家来看看调血雪纳瑞的要点!　　在挑选雪纳瑞的时候，没经验的不敢下手，只能单纯的拼眼缘来判断幼犬的好坏，下面给大家介绍下挑选雪纳瑞幼犬的一些要点?　　1、体型：好的雪纳瑞幼犬骨骼粗壮，颈部长，背', N'<h1 style="text-align: center;"><span style="font-size:36px">怀孕狗狗喂食次数的调整</span></h1>

<p style="text-align: center;">2017-03-20&nbsp;</p>

<p style="text-align: justify;">家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，饲喂的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="贵宾犬" src="http://img.boqiicdn.com/Data/BK/A/1403/20/img77201395296722_y.jpg" title="贵宾犬" /><br />
<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　家中的母狗若是怀孕了除了在食物上需要添加更多的营养成分，<a href="http://www.boqii.com/tag/6191/" target="_blank">饲喂</a>的次数需要做哪些调整呢？家中有&ldquo;准妈妈&rdquo;的主人们赶紧来学习一下吧。<br />
　　通常在妊娠期早期每日的饲喂次数为2次即可，中期可增加为3次，到了后期则以每日4次为宜，这是因为在妊娠后期，犬的<a href="http://www.boqii.com/tag/3265/" target="_blank">营养需求</a>量显着增加，如果每日喂养次数过少，使得母犬一次的摄食量过大，将会使得胃部扩张过大而挤压胎儿，从而影响胎儿的正常生长发育。<br />
　　总之饲喂次数的变化，总的原则是应根据妊娠母犬所怀胎儿的数量多少，每次摄食量的多少以及饲料的营养水平而灵活掌握，以便较好地控制母犬体况和胎儿出生时的体重，避免因胎儿过大而引起母犬难产而发生意外。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6689/" target="_blank">狗狗怀孕</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F67D11 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (83, N'狗系列', N'狗虱子 健康', N'治狗虱可用狗虱水或酵母片', N'~/Content/Baike/img/upload/timg (1).jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;"><span style="font-size:36px">博美咳嗽的症状区别</span></h1>

<p style="text-align: center;">2017-03-19&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。</p>

<div style="text-align: center;"><img alt="博美犬" src="http://img.boqiicdn.com/Data/BK/A/1403/19/img47481395200781_y.jpg" style="height:376px; width:500px" title="博美犬" /><br />
<a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a>(<a href="http://www.boqii.com/pet-all/347.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　我们知道博美犬比较容易出现心脏疾病，所以当你家的博美犬出现咳嗽症状时主人就需要注意了。狗狗咳嗽分为干咳、湿咳以及痛咳，主人需要分清楚这几种咳嗽的具体症状，以便及时就诊。<br />
　<strong>　一、干咳</strong><br />
　　乾咳的特徵微咳嗽的声音乾、短促、清脆，这表示了博美的呼吸道内只有少量的黏稠分泌物，甚至是无分泌物。会引发乾咳通常为气管有异物、胸膜肺炎、肺结核等、急性喉炎初期。<br />
　<strong>　二、湿咳</strong><br />
　　湿咳的声音听起来有湿润感而且较长，这表示有大量的稀薄分泌物在博美的呼吸道内。博美大多都会随着咳嗽，从鼻孔喷出分泌物，或是在咳嗽後出现吞咽或是咀嚼的行为。湿咳通常为支气管炎、咽喉炎、肺脓肿等疾病。<br />
　<strong>　三、痛咳</strong><br />
　　当博美咳嗽时会伴随疼痛，其症状为咳嗽时头跟颈部会伸直、并且会有惊慌或是不安的现象。此状况常见於异物性肺炎、肋骨骨折、心包炎、胸膜炎等。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7851/" target="_blank">狗狗咳嗽</a> <a href="http://www.boqii.com/tag/467/" target="_blank">博美犬</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F74D20 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (84, N'狗系列', N'狗虱子 护理 健康', N'消灭狗狗跳蚤虱子实用四法', N'~/Content/Baike/img/upload/timg (4).jpg', N'一般在自己的狗狗进行过一次交配或者生育过一次后，很多主人都会为自己的狗狗实行绝育。因为随着年龄的增长很多疾病都会慢慢地浮现出来，尤其对于母犬问题更是接踵而至，而绝育能够有效地避免一些疾病的发生。那么狗狗多大能做绝育手术，在什么年龄段做最合适呢？', N'<h1 style="text-align: center;">哈士奇肠胃病的常见症状</h1>

<p style="text-align: center;">2017-1-22&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 哈士奇对于初养狗狗的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇肠胃病的常见症状是什么，我们来了解一下。</p>

<div style="text-align: center;"><img alt="哈士奇" src="http://img.boqiicdn.com/Data/BK/A/1410/22/img95411413942143_y.jpg" title="哈士奇" /><br />
<a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a>(<a href="http://www.boqii.com/pet-all/357.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; <span style="font-size:20px">&nbsp;哈士奇对于初养<a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a>的人来说其实并不是十分的适合，因为这种狗很容易患上肠道类疾病，因此有很多养过哈士奇的人都觉得它们很容易死。那么我们在饲养哈士奇的时候就应该多加注意这些问题，哈士奇<a href="http://www.boqii.com/tag/5672/" target="_blank">肠胃病</a>的常见<a href="http://www.boqii.com/tag/5806/" target="_blank">症状</a>是什么，我们来了解一下。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;1.腹泻和呕吐在狗狗中比较常见。腹泻是由于肠蠕动加速，肠粘膜分泌增加和吸收障碍所致，多见于肠道疾病，腹泻以排出不成形或液状粪便为特征，是多种疾病的症状。狗狗出现腹泻常引起脱水死亡，所以发现病症时要尽早<a href="http://www.boqii.com/tag/4114/" target="_blank">治疗</a>。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;2.狗狗是很容易呕吐的动物，幼犬表现更为突出，它们在饮食过饱或吃到异味刺激性的东西时会出现呕吐，呕吐也是狗狗自我保护的现象，有时它们会有意识地外出寻找野草吞食，促使胃中东西吐出。针对呕吐和腹泻，除一般的治疗方法如补充生理盐水、抗生素治疗外，对狗狗的饮食也要格外用心，少食多餐易消化的食物。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;3.造成狗狗出现肠胃不适的因素有很多，例如当狗狗在外出散步和游戏时，常有机会不小心食入暴露在环境中的虫卵，这些虫卵会寄生在狗狗体内，或是狗 狗误食变霉变腐食品，不小心吞食异物，长期使用抗生素，肠道内菌群失调、有害菌增多，肠道感染或营养不良等都可导致肠胃不适。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;4.少食多餐对于狗狗来说是很重要的。一次喂太多，会一下子增加狗狗胃的负担，容易引起消化不良、呕吐。如果有条件的话成犬一天喂两次，5个月以前的一天吃三次，如果不能保证按时给狗狗喂饭，也要控制每一次的量，不能把一天的食物一次都给它，让它饿一点儿比吃得撑撑的对于它的肠胃更好。家长们要注意的是尽量少喂干硬的食物，对于肠胃不好的狗狗来说是很难消化的。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; &nbsp;哈士奇这种狗狗的肠胃不适特别好，所以比较容易引起腹泻、呕吐等症状。因此主人在平时照顾时要多加关注一下它们的饮食，以免造成肠道的不适。</span></div>

<p style="text-align: center;"><img alt="扫一扫，有惊喜！" src="http://img.boqiicdn.com/Data/BK/A/1410/23/img33381414032756_y.jpg" title="扫一扫，有惊喜！" /><br />
扫一扫，有惊喜！</p>

<p style="text-align: center;">&nbsp;</p>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a> <a href="http://www.boqii.com/tag/355/" target="_blank">哈士奇</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F81762 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (85, N'狗系列', N'狗虱子 健康', N'常见实用五法驱杀狗寄生虫', N'~/Content/Baike/img/upload/timg (5).jpg', N'





 

给博美梳毛方法技巧

2017-05-04 11:24:14

by 二乔



博美犬外形靓丽，毛发浓密，身体柔软。所有的博美犬都需要家长的护理才能更好的成长，今天我们就看应该怎么给博美犬梳毛，需要什么样子的技巧吧!博美梳毛　　我们知道博美犬是一种毛发非常浓密之后且修长的宠物狗，博美犬这身柔软飘逸的毛发每天都需要家长进行合理的护理，而给博美犬每天美容最简单而且有效的方法就是为博 ', N'<h1 style="text-align: center;"><span style="font-size:36px">狗狗毛发护理及美容常识</span></h1>

<p style="text-align: center;">2017-1-05&nbsp;</p>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、贵宾犬等。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">　　宠物美容是宠物行业新兴的一项技术，涵盖宠物基础护理、造型修剪和创意设计等技术。犬的美容最早起源于古罗马时期，到十五世纪至十七世纪，那时候的油画和挂饰上已经出现了许多贵族特色的犬造型图案，其中包括西班牙猎犬、比熊犬、<a href="http://www.boqii.com/tag/470/" target="_blank">贵宾犬</a>(<a href="http://www.boqii.com/pet-all/340.html" target="_blank">详情介绍</a>)等。到了十九世纪初，宠物美容师职业已初具规模，进入二十世纪以后，宠物美容逐渐进入普通百姓家庭，并发展完善至现在我们看到的服务模式。从最初的剪指甲、拔耳毛、洗澡，到创意造型修剪、个性装扮，再到美容保健，宠物的美容经历了一个历史性的飞跃。本文浅述了宠物犬毛发护理的基本要求以及其他的美容常识，以期能够帮助大家。<br />
　<strong>　一、狗狗毛发护理</strong><br />
　　狗狗毛发的新陈代谢周期约为20天，洗浴时要遵循这个周期，洗澡过于频繁或间隔时间太长，都会影响毛发生长和发质。狗狗皮肤呈弱碱性，在洗浴时要选择弱酸性的浴液或温和的、刺激性小的香波，以免造成狗狗皮肤过敏、被毛干燥。目前市场上有许多针对不同毛色、发质的浴液，主人们可以更有针对性的去选择。给宠物洗澡时，应遵循由后向前、由上到下的顺序，从肛门开始清洗，最后清洗头部，以免过早冲洗头部引起狗狗的不适和对抗。<br />
　　宠物毛发的日常梳理非常重要，不仅可以减少被毛毛结的形成，还可促进皮肤血液循环，加速毛囊的修复生长。对于卷毛犬，拥有浓密的卷曲毛发，在耳后、腋下、颈部容易打结，需要用钢针梳进行日常梳理；软毛犬毛发脆且易断，梳理时要选用木柄针梳，通过手腕的力量轻轻梳理被毛，以减少对毛发的损伤；对于硬毛的犬种，可使用刮毛刷，去除底层绒毛和脱落死毛，只留下表层的硬直毛。对于丝质毛发，在梳理的同时，还要采用防静电的被毛护理用品和护发素，以避免发质受损。</span></div>

<div style="text-align: center;"><img alt="剃除胎毛以前狗狗的毛色不够明亮柔顺" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img5231383616667_y.jpg" title="剃除胎毛以前狗狗的毛色不够明亮柔顺" /><br />
<span style="font-size:18px">剃除胎毛以前狗狗的毛色不够明亮柔顺</span></div>

<div style="text-align: justify;">　<strong>　<span style="font-size:20px">二、毛发的修剪</span></strong><br />
<span style="font-size:20px">　　对于胎毛是否修剪的问题，并没有严格的要求，主人们可以根据需要自行选择。如果主人对胎毛的质量不够满意，通常可在3月龄左右时，狗狗身体健康，且处于温暖的季节时，剃除狗狗的胎毛，以利于宠物长出主人们想要的毛发。宠物毛发的修剪不仅可以减轻宠物的脱毛现象，还可以创造出各种各样的造型，让宠物们变得更加漂亮。但是他们身上的毛在夏天却有着重要的保护作用--阻挡阳光直射。因此，修剪狗狗毛发时注意保留一定的长度，如果你想完全剃掉然后重新长，那么出门的时候记得给狗狗穿上衣服吧。</span></div>

<div style="text-align: center;"><span style="font-size:20px"><img alt="剃除胎毛后虽然很丑，但还有点狮子的感觉" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img28851383616782_y.jpg" title="剃除胎毛后虽然很丑，但还有点狮子的感觉" /></span><br />
<span style="font-size:20px">剃除胎毛后虽然很丑，但还有点狮子的感觉</span></div>

<div style="text-align: center;"><img alt="剃除胎毛一个月后，毛发渐渐长齐" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img58371383617335_y.jpg" title="剃除胎毛一个月后，毛发渐渐长齐" /><br />
<span style="font-size:20px">剃除胎毛一个月后，毛发渐渐长齐</span></div>

<div style="text-align: center;"><img alt="剃除胎毛2个月后，越来越可爱了吧" src="http://img.boqiicdn.com/Data/BK/A/1311/5/img73871383617369_y.jpg" title="剃除胎毛2个月后，越来越可爱了吧" /><br />
<span style="font-size:20px">剃除胎毛2个月后，越来越可爱了吧</span></div>

<div style="text-align: justify;">　<span style="font-size:20px"><strong>　三、其他美容常识</strong><br />
　　1、脚部护理，脚趾是狗狗重要的部位，对于室内家养的狗狗，则需要定期检查指甲的长度，尤其是悬趾，避免遗漏。修剪时避开血管和指甲床，并用挫刀挫平，这需要主人需要勤检查、勤修剪。脚底毛的修剪也很重要，对于室内家养的宠物狗狗，脚底毛生长速度过快，行动起来容易打滑、摔倒，外出玩耍时更容易藏污纳垢，甚至引发脚部炎症。<br />
　　2、耳道护理，耳道的结构非常精细复杂，正常情况下会分泌大量的耳垢。对于长毛、大耳朵、垂耳的犬种，由于耳道密闭、透气性差，常常是细菌、真菌、寄生虫等滋生的最佳场所，诱发狗狗耳炎、耳螨，严重的甚至影响到听觉，因此耳道的护理也非常重要。耳道的护理一般包括两项内容：拔除耳毛、清洁耳道，方法如下：耳道内涂撒拔耳毛粉，轻轻按摩涂匀，徒手拔去裸露的耳毛，用止血钳轻轻拔除内侧的耳毛，并用洁净脱脂棉球包裹止血钳，缓慢清洁耳道内的分泌物。护理耳道时，涂撒耳毛粉可起到消炎、止痒、干燥内环境的作用，避免拔耳毛引发人为的感染。<br />
　　3、肛门腺护理，肛门腺是一对梨形状腺体，在犬肛门两侧约四点钟、八点钟的方位，各有一个开口，可分泌肛门腺液，既可润滑排便，又是犬只身份辨识的主要部位，肛门腺液积久会变黑色或深咖啡色液状或泥状物，气味臭不可闻。若长时间不排出，可诱发肛门腺炎和肛门囊肿。因此在宠物基础护理中，首先要挤净肛门腺内积存的腺液，并用浴液清洗肛门周围的残液和污物，之后再进行全身洗浴。操作时掌握技巧和力度，避免引起狗狗的不适。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5801/" target="_blank">狗狗毛发护理</a> <a href="http://www.boqii.com/tag/5802/" target="_blank">胎毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F902FD AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (86, N'狗系列', N'狗粮 饮食', N'细说狗狗们的活力来源——狗粮', N'~/Content/Baike/img/upload/timg (1).jpg', N'贵宾犬是一种十分可爱并且活泼的狗狗，它们喜欢在马路边闲逛，显示出自己的可爱外形。今日小编就向大家介绍一下万一我们的贵宾犬得了抑郁症应该怎么办?我们主人可以采取什么措施呢?贵宾犬　　贵宾犬得了抑郁症应该怎么办?解决方案：在这种情况下，要改变宠物的抑郁自然应该先给它换个轻松点的环境。详细的解决办法请跟宠', N'<h1 style="text-align: center;">狗狗脚部受伤的处理办法</h1>

<p style="text-align: center;">2017-4-06&nbsp;</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; 狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。</p>

<div style="text-align: center;"><img alt="狗狗肉垫" src="http://img.boqiicdn.com/Data/BK/A/1312/6/img66051386314696_y.jpg" title="狗狗肉垫" /><br />
<a href="http://www.boqii.com/tag/5752/" target="_blank">狗狗肉垫</a></div>

<div style="text-align: justify;">　　<span style="font-size:20px">狗狗出门肉垫一直在与马路接触，特别是一些幼犬，经常会出现去外面跑一下就因为肉垫上的皮肤太嫩而受伤，小编今天就来为你分析一下狗狗脚部受伤的处理办法，家长们赶紧来学习一下吧。<br />
　<strong>　一、狗狗指甲碎裂</strong><br />
　　狗狗太久没剪指甲让指甲过长，指甲常发生破裂的情形。如果发现狗狗跛脚，仔细检查一下指甲是否有断裂的情况，发现断裂的指甲，马上用指甲剪剪除。<br />
　　如果断裂的指甲无法或难以取出，若断裂的指甲很脏并且暴露出许多组织，爲免受细菌感染，应请兽医处理。狗狗断裂指甲，通常不会流血或只流少许的血，若流血不止，可使用加压绷带裹住脚趾１２至２４小时。 若流血不止，可使用加压绷带裹住脚趾１２至２４小时。<br />
　<strong>　二、肉垫擦伤起水泡</strong><br />
　　肉垫起水泡或是表皮脱落，会让狗狗露出脚底易受刺激的组织。狗狗会有明显的跛脚情形。你检查时会发现表皮翻开，有一部分还连在肉垫上，的组织显露出来。<br />
　　将翻出的表皮剪掉，彻底清除伤口上的脏东西。 处理这种外伤的最好方法就是让狗狗修息直到伤口癒合。期间约二周。如果皮下组织暴露的面积很广，并且有流血的现象，要先用优碘之类的杀菌剂清洗伤口，乾了之後包上绷带。<br />
　　如果狗狗需要长时间行走，必须在伤口上包绷带以免与泥土接触，防止二次伤害及疼痛。<br />
　<strong>　三、狗狗脚肉垫割伤</strong><br />
　　若狗狗不小心给利器割伤而导致大量<a href="http://www.boqii.com/tag/4740/" target="_blank">出血</a>时，家长应该带狗狗回到家中，用棉花压按着流血的伤口约一分钟左右。如果是小伤口，在止血後检查是否有异物在伤口内，若有则要马上取出并以优碘清洗伤口，让伤口乾燥，并以绷带包紮，以防脏东西进入。<br />
　　如果脚肉垫割伤很深，通常会造成大量出血。 应该给兽医做缝合，促进伤口癒合及避免流血不止。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/5396/" target="_blank">肉垫</a> <a href="http://www.boqii.com/tag/4256/" target="_blank">受伤</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300F9B69E AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (87, N'狗系列', N'狗粮 饮食', N'狗粮应该泡了再给狗狗吃吗', N'~/Content/Baike/img/upload/timg (2).jpg', N'对于很多指人们来说狗狗只要能跑能跳那么他们的健康状况就没有问题了，其实并不是这个样子的!狗狗们的身体和我们人类一样，千万不要有什么侥幸心理存在!那么八哥犬发烧了应该怎么办?就让小编带大家来看一下吧!八哥犬　　很多没有经验的主人，其实对于狗狗生病之后的处理办法大多都是拖延一段时间再送医院，很多主人都抱', N'<h1 style="text-align: center;"><span style="font-size:36px">让狗狗毛发发亮的小技巧</span></h1>

<p style="text-align: center;">2017-02-27&nbsp;</p>

<p style="text-align: center;">小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。</p>

<div style="text-align: center;"><img alt="约克夏" src="http://img.boqiicdn.com/Data/BK/A/1402/27/img65141393483972_y.jpg" style="height:333px; width:500px" title="约克夏" /><br />
<a href="http://www.boqii.com/tag/627/" target="_blank">约克夏</a>(<a href="http://www.boqii.com/pet-all/337.html" target="_blank">详情介绍</a>)</div>

<div style="text-align: justify;">　<span style="font-size:20px">　小编遇到过一些主人为使犬毛有光泽、漂亮，用海藻或让犬喝少量的醋，有的人用蛋白涂抹犬毛等。这些方法都不好。如用蛋白来涂抹约克夏或马尔济斯犬的毛，一旦干燥后，毛就会分叉、断裂，反而要损伤毛质、损伤毛根，使毛色更加暗淡，有时还会引起皮炎或皮肤病。要使犬毛有光泽、美观，可每天给犬多喂富含蛋白质的饲料。含有维生素E、维生素D的<a href="http://www.boqii.com/tag/6455/" target="_blank">添加剂</a>和海藻类食物、蔬菜等，如瘦肉、煮熟的蛋黄、植物油等，少喂富含糖份、盐份、淀粉等食物。肥胖而脂肪堆积的犬，一般毛质都比较差。<br />
　　同时，要给犬多作日光浴，多吸收<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a>，并且经常运动，以促进其血液循环，使其长出健康的毛发。为保护犬毛，每天要替它梳毛，如有条件，最好给它涂上薄薄一层护毛油。要使毛色光亮，还要注意不要让犬进入卧室，应该<a href="http://www.boqii.com/tag/142/" target="_blank">饲养</a>在较寒冷的场所。杜宾犬等短毛犬在洗澡后，应该用浴巾擦拭，这样能使被毛光润可爱。北京犬、雪纳瑞、马尔济斯犬、博美犬和阿富汗犬等长毛犬在洗澡后，如用喷雾器装上蒸馏水，在犬毛上薄薄的喷一层，能使毛发蓬松，看起来丰满、美观。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/6559/" target="_blank">紫外线</a> <a href="http://www.boqii.com/tag/6542/" target="_blank">狗狗毛发</a> <a href="http://www.boqii.com/tag/2139/" target="_blank">梳毛</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300FA7DDB AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (88, N'狗系列', N'狗粮 饮食', N'怎么挑选狗粮呢', N'~/Content/Baike/img/upload/timg (3).jpg', N'家里的小宠比格生气了，发脾气回家的后已经生病了!从最近宠物医院回来的我手里拿着一包药正在发呆。我应该怎么为我叫比格吃药呢?下面就和小编一起来看看吧!比格喂药　　如果你的爱比格犬是只很听话的小狗，那么喂它吃药片或其它固体状药物时，应先命令它坐好。　　让小狗张开嘴巴，尽可能快速地将药片放在它嘴的深处，然', N'<h1 style="text-align: center;"><span style="font-size:36px">长毛犬美毛护理方法的技巧</span></h1>

<p style="text-align: center;">2017-04-03&nbsp;</p>

<p style="text-align: justify;">　　要保持长毛犬全身被毛光泽垂顺，需要花大量的时间和专业的技术。一只&ldquo;长发飘飘&rdquo;的帅狗从你眼前掠过，飘动的毛发一如那阵经过你身边的秋风，让你感到无限激动。你是否体验过这样的感受?</p>

<div style="text-align: center;"><img alt="约克夏犬" src="http://img.boqiicdn.com/Data/BK/A/1406/3/img6401401780986_y.jpg" style="height:500px; width:500px" title="约克夏犬" /><br />
<a href="http://www.boqii.com/tag/4133/" target="_blank">约克夏犬</a></div>

<div style="text-align: justify;"><br />
　　<span style="font-size:20px">影响犬只毛发长度和毛量的因素有很多，有些因素是先天的，几乎不能改变，但是还有很多因素是后天培养的过程中，可以受到我们人为控制的。以下我们向大家介绍几个比较容易控制的重点因素。<br />
　　<strong>1.季节和气候</strong><br />
　　大多数长毛犬的原产地分布在气候相对寒冷的寒带和温带地区，这些地区的最大气候特点就是冬季温度比较低，而犬为了让自己得到很好的保护，就会生长长毛以便适应气候。<br />
　　冬天相对寒冷干燥，刚好模拟了很多长毛犬原产地的气候特点，所以到每年的秋季，犬的生理周期会调整到一个合理的状态，也就自然地刺激了长毛的生长。这个时候，很多被饲养在室内的犬只由于接触天气变化不明显，所以长毛的生长比生活在户外的犬只要差。对于这种情况下的狗来说，安排适时的<a href="http://www.boqii.com/tag/5787/" target="_blank">户外运动</a>，让它们充分接触户外的低温是很好的方法。<br />
　　但是，要注意的是方式要相对温和。你不能要求一只狗一下子从二十几度的室内马上适应接近零度的户外，因此，尽量使用循序渐进的方式，让它们慢慢适应温度的变化才是比较科学的方法。<br />
　<strong>　2.营养摄取</strong><br />
　　我们经常可以看到市场上销售的很多宠物美毛用品，基本的效用就是补充狗在食物中摄取不足的各种营养成分，以保持它们的身体健康，促进它们毛发的生长。狗的毛发是一种角质的、柔软的、有弹性的丝状物质，毛发的成分中含有较多的蛋白质，而当犬只体内缺乏蛋白质、Omega6脂肪酸等营养成分时，毛发就会生长缓慢、失去光泽、容易脱落和断裂。这些营养成份，尤其是Omega6脂肪酸，可以补充身体内所需自然油，促进毛发生长，使毛发亮泽。<br />
　　由于毛发是生长在皮肤上的，也就是说皮肤是毛发的基础，所以皮肤的状态自然会影响到毛发。当毛发状态不良时，就说明皮肤的抵抗力和健康状况也在下降。因此，给犬只适当<a href="http://www.boqii.com/tag/5980/" target="_blank">补充营养</a>不但可以促进毛发生长，还有助于保持肌肤健康。但是需要注意营养的补充一定要适量，如果营养过剩导致爱犬肥胖，就会造成底毛稀疏，因为脂肪层过厚的情况下，犬只就可以依靠脂肪御寒，而毛发相对生长得就不那么旺盛了。参赛犬的毛发要经常护理，长长的毛发要使用营养油并要将长毛包卷起来，以防止毛发断裂，并有助于长出油亮的长毛发</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/12069/" target="_blank">长毛犬美毛</a> <a href="http://www.boqii.com/tag/2890/" target="_blank">狗狗护理</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A75300FB5743 AS DateTime))
INSERT [dbo].[Baike] ([BaikeId], [BaikeSeries], [BaikeType], [BaikeTitle], [BaikeImg], [BaikeDescribe], [BaikeContent], [BaikeTime]) VALUES (109, N'狗系列', N'狗狗健康', N'酶与益生菌对于狗狗有何作用', N'~/Content/Baike/img/upload/timg (2).jpg', N'想要为家中宠物做绝育的主人们首先会考虑的问题就是宠物多大做绝育手术是最合适的，科学研究表明，在宠物第一次发情前做绝育手术可以更好的预防很多恶性疾病的发生。', N'<h1 style="text-align: center;"><span style="font-size:36px">酶与益生菌对于狗狗有何作用</span></h1>

<p style="text-align: center;">2017-05-02 &nbsp;by 沈袆祺</p>

<p style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp;其实狗狗身体本身就会存在各式各样的酶，来帮助机体消化以及吸收营养。不过随着某些食物摄入量地减少，某些酶的活性就会变得越来越低，最后就会缺乏这种酶，这也是为什么如果我们长时间不喝牛奶，但是突然间喝了一定的牛奶后会出现腹泻拉稀的原因。</p>

<div style="text-align: center;"><img alt="平时可适量喂食些酸奶补充益生菌" src="http://img.boqiicdn.com/Data/BK/A/1507/2/imagick12121435824688_y.jpg" title="平时可适量喂食些酸奶补充益生菌" /><br />
平时可适量喂食些酸奶补充益生菌</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp; &nbsp;<span style="font-size:20px">其实狗狗身体本身就会存在各式各样的酶，来帮助机体消化以及吸收营养。不过随着某些食物摄入量地减少，某些酶的活性就会变得越来越低，最后就会缺乏这种酶，这也是为什么如果我们长时间不喝牛奶，但是突然间喝了一定的牛奶后会出现腹泻拉稀的原因。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 消化酶的作用是分解食物，以便于被身体所吸收以及利用。当<a href="http://www.boqii.com/tag/12868/" target="_blank">狗狗进食</a>了生肉等食物，身体机能便会活跃起来，狗狗的体内便会产生大量的是物美，来帮助其消化吸收。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 而煮熟的食物本身缺乏酶，所以机体为了消化这些食物便会消耗本身所储备的酶，如果消化酶长期得不到补充，那么之后就有可能出现消化不良<a href="http://www.boqii.com/tag/3196/" target="_blank">食欲</a>不佳的情况。</span></div>

<div style="text-align: center;"><img alt="平时除了喂食狗粮之外，也可适当喂食其它有益食物" src="http://img.boqiicdn.com/Data/BK/A/1507/2/imagick75731435824985_y.jpg" title="平时除了喂食狗粮之外，也可适当喂食其它有益食物" /><br />
平时除了喂食狗粮之外，也可适当喂食其它有益食物</div>

<div style="text-align: justify;">&nbsp; &nbsp; &nbsp;<span style="font-size:20px"> 益生菌相信大家都不陌生，主要是一种有益于肠道的菌类。益生菌能够防止有害及无用的细菌来破坏机体的平衡。益生菌能够较为有效地消灭大肠杆菌等无益细菌。不过益生菌会被抗生素杀死，所以这也是为什么抗生素药的效果好，但是很多饲主都不愿意用的原因之一。补充益生菌可以较为有效地改善狗狗的肠道功能，所以这也是为什么我们常说不要给狗狗喂食牛奶，但是可以给狗狗喂食酸奶，因为酸奶中也含有一定量的益生菌，帮助狗狗肠道消化。</span></div>

<div style="text-align: justify;"><span style="font-size:20px">&nbsp; &nbsp; &nbsp; 酶和益生菌购买的渠道有很多，包括健康<a href="http://www.boqii.com/tag/4739/" target="_blank">食品</a>店、维生素商店、药房等都能够买到。寻找那些含有大量有效<a href="http://www.boqii.com/tag/5792/" target="_blank">成分</a>并且没有附加物、奶制品、糖类等的产品。当然还要记住使用时一定要遵照医嘱或是说明书，不要凭自己的感觉胡乱用药，反而让狗狗产生不良反应。酶大多数时候在喂前洒在食物上，至于益生菌一般在就餐间隙使用比较好一些，用完后最好冷藏处理。</span></div>

<p style="text-align: center;">相关标签：<a href="http://www.boqii.com/tag/7377/" target="_blank">消化酶</a> <a href="http://www.boqii.com/tag/6692/" target="_blank">益生菌</a> <a href="http://www.boqii.com/tag/3909/" target="_blank">狗狗饲养</a> <a href="http://www.boqii.com/tag/332/" target="_blank">狗狗</a></p>

<p style="text-align: center;">本文版权属于宠物网（www.mypets.com/baike/），转载请注明出处。商业使用请联系宠物网。</p>
', CAST(0x0000A76A00DE912E AS DateTime))
SET IDENTITY_INSERT [dbo].[Baike] OFF
SET IDENTITY_INSERT [dbo].[BaikeActivity] ON 

INSERT [dbo].[BaikeActivity] ([ActivedId], [ActivedTitle], [ActivedContent], [ActivedImg], [ActicedDetail]) VALUES (1, N'干货分享——养犬新手必看知识合集', N'初养宠物犬，更多的新手饲主有着的是一种迷茫。因为狗狗是花了大价钱买来的，所以对待起来也不可能那么的随便。九层之台、起于累...', N'~/Content/Baike/img/ad2.jpg', N'~/Content/Baike/img/干货分享——养犬新手必看知识合集.png')
INSERT [dbo].[BaikeActivity] ([ActivedId], [ActivedTitle], [ActivedContent], [ActivedImg], [ActicedDetail]) VALUES (2, N'你说我像饼？偶可是热带鱼之王七彩神仙！', N'七彩神仙鱼的辨识度很高，远远看去像块铁饼的就是了。七彩神仙可不是一般的观赏鱼，它是大名鼎鼎的热带鱼之王！！', N'~/Content/Baike/img/ad3.jpg', N'~/Content/Baike/img/你说我像饼？偶可是热带鱼之王七彩神仙！.png')
INSERT [dbo].[BaikeActivity] ([ActivedId], [ActivedTitle], [ActivedContent], [ActivedImg], [ActicedDetail]) VALUES (3, N'爱猫无国界：各国猫文化大盘点', N'一方水土养一方喵，想不想在日本繁华的猫街沾沾招财猫的福气？或是在雨后的浪漫法兰西和你心目中的那只喵来场旷世绝恋？快上车，...', N'~/Content/Baike/img/ad4.jpg', N'~/Content/Baike/img/爱猫无国界：各国猫文化大盘点.png')
INSERT [dbo].[BaikeActivity] ([ActivedId], [ActivedTitle], [ActivedContent], [ActivedImg], [ActicedDetail]) VALUES (4, N'宠物夏季饲养全攻略', N'夏天对于各种宠物来说都是一个无比难熬的季节。但是主人们请不要担心，万能的波奇小编来啦。我们给大家支支招，学习一点消夏小知...', N'~/Content/Baike/img/ad1.jpg', N'~/Content/Baike/img/宠物夏季饲养全攻略.png')
INSERT [dbo].[BaikeActivity] ([ActivedId], [ActivedTitle], [ActivedContent], [ActivedImg], [ActicedDetail]) VALUES (5, N'第一期“波奇宠物”专家团在线问诊活动开始啦！', N'养宠有疑惑？撩个专家压压惊吧！', N'~/Content/Baike/img/ad5.jpg', N'~/Content/Baike/img/ad5.jpg')
SET IDENTITY_INSERT [dbo].[BaikeActivity] OFF
SET IDENTITY_INSERT [dbo].[BaikeAnswer] ON 

INSERT [dbo].[BaikeAnswer] ([AnswerId], [QuestionId], [UserId], [AnswerContent], [AnswerTime], [ClickNum]) VALUES (1, 1, 3, N'用手掌背和手关节部位，在1/4圈处由头顶画圆圈，重复此动作到后颈部的位置', CAST(0x0000A76C01591C71 AS DateTime), 34)
INSERT [dbo].[BaikeAnswer] ([AnswerId], [QuestionId], [UserId], [AnswerContent], [AnswerTime], [ClickNum]) VALUES (2, 1, 9, N'我家狗前段时间也是，说是腰脱，吃了两个星期的药。现在是好多了。不懂可以➕我v:ayou1987a', CAST(0x0000A76C01591C71 AS DateTime), 22)
INSERT [dbo].[BaikeAnswer] ([AnswerId], [QuestionId], [UserId], [AnswerContent], [AnswerTime], [ClickNum]) VALUES (3, 1, 4, N'换医院拍片子吧，怎么可能拍不出来', CAST(0x0000A76C01591C71 AS DateTime), 34)
INSERT [dbo].[BaikeAnswer] ([AnswerId], [QuestionId], [UserId], [AnswerContent], [AnswerTime], [ClickNum]) VALUES (4, 14, 3, N'<p><img alt="" src="http://"><img alt=""><br></p>', CAST(0x0000A78E00F47F8B AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[BaikeAnswer] OFF
SET IDENTITY_INSERT [dbo].[BaikeQuestion] ON 

INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (1, N'狗脊椎按痛 腹部按', N'医疗', N'<p></p><div><div><div><div><div><div>比熊两岁，昨夜带狗出去大便以后 我打算抱起它回去 和以前一样的动作先是用双手抬起两个前腿让它成站立状 然后再用一只手拖起它屁股抱起来 当我刚抬起它两个前腿站起来的一瞬间它叫了一声  我以为是弄疼退了 动动腿不叫了 就回家了 回家以后它开始打蔫 腹部按压疼的会叫 马上带去医院拍片 没看出问题  大夫按他的脊椎前部分 有一节会疼的叫 按腹部也会疼 不触碰刺激到不会疼叫 打了封闭针止疼针  说可能脊椎神经伤到  已经过去十个小时 碰它还会疼 今天还用打封闭针吗 一定是神经伤到么  会不会抱起来一瞬间肌肉拉伤 自己养着会痊愈么 走路吃饭饮水排尿正常 </div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C01591C71 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (2, N'     狗狗发抖', N'医疗', N'<p></p><div><div><div><div><div><div>我家约克夏这几天一直在发抖是不是因为太冷了。。刚给他剃过毛。。而且每天遛完他没多久就在家里尿尿。。不知道是不是病啦</div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C01595607 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (3, N'怎么杀死细小病毒', N'其他', N'<p></p><div><div><div><div><div><div>前一个月我家里一只狗狗因为细小死掉了，现在想再养一只，用什么可以消毒，84可以吗？</div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C01599377 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (4, N'羊奶粉可以干吃吗', N'饲养', N'<p></p><div><div><div><div><div><div>现在冬天了，我们家狗习惯在外面上厕所，可是太冷了，然后吃羊奶粉的话怕他尿尿会多，所以想请问一下，羊奶粉可以拌在狗粮里，干吃嘛？</div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C0159C5C6 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (5, N'九个月大泰迪挑食', N'饲养', N'<p></p><div><div><div><div><div><div><p>我家狗狗9个多月了，每天除了狗粮其他都吃，我也是无语了，饿了几天也不吃，导致低血糖。</p><p><img alt="" src="http://img.boqiicdn.com/Data/BK/T/1415/141566/14156652/img871956543e1fb681c_y.jpg"></p></div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C015A11E0 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (6, N'我家小猫快二月了，经常打喷嚏，一打就是好几个，是什么情况呢？', N'饲养', N'<p></p><div><div><div><div><div><div>家里不冷，有暖气。偶尔还会流一点点眼泪。不知道是感冒还是什么情况？回家已经有一个多星期了，一直这样。其他一切健康，还很活泼</div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C015A8429 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (7, N'我家狗狗晚上不好好睡觉怎么办？', N'训练', N'<p></p><div><div><div><div><div><div><p>我家狗狗是白色京巴，13岁了，最近一段时间它晚上睡觉特别不老实，老是睡着睡着突然就行了，满屋子乱转，转完了又回窝里睡，它的窝就在我床边，有时候还扒床，扒东西，还往高的地方卧，扒我电脑椅电脑主机，反正一到晚上就是不好好睡觉，白天倒是呼呼大睡。</p><p>吃饭排便都正常，特别贪吃，去年做过一次大手术，子宫摘了，年龄大了牙也掉了几颗，平时我们就给它买封鲜包伴着馒头吃，水果也不断，不爱喝水。</p></div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C015C2BF0 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (8, N'急求朋友告诉我的猫是不是传染病', N'医疗', N'<p></p><div><div><div><div><div><div>我的猫咪肚子越来越大，今天去宠物诊所抽腹水，抽出来肚子里全是血，是很粘稠的血，而且它眼睛鼻子流脓水，嘴巴流透明粘液，耳朵也有分泌物，有没有哪位朋友知道通常情况下是什么病？急啊！给它打了针吃药都没有明显好转。医生都建议我安乐死那些话了</div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C015D1360 AS DateTime), 1, 1)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (9, N'狗狗最近咬鞋嘴巴有点红肿什么原因', N'饲养', N'<div><div><div><div><div><div><p>狗狗最近咬鞋嘴巴有点红肿什么原因</p><p><img alt="" src="http://img.boqiicdn.com/Data/BK/T/1288/128864/12886447/img63785648714a81723_y.jpg"></p><p><img alt="" src="http://img.boqiicdn.com/Data/BK/T/1288/128864/12886447/img18455648714abe465_y.jpg"></p></div></div></div></div></div></div><br>', CAST(0x0000A76C015DA222 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (10, N' 怎么和兔兔培养感情呢？', N'训练', N'<p></p><div><div><div><div><div><div><p>精神：非常活泼 &nbsp; &nbsp;体重：不造 &nbsp; &nbsp; 食物：目前是草类植物 &nbsp; &nbsp; 食欲：非常好 &nbsp; &nbsp; 大小便：正常</p><p>&nbsp;兔兔总是保持警惕状态，我们想跟他培养感情，让他能放心一点，怎么办？</p></div></div></div></div></div></div><br><p></p>', CAST(0x0000A76C015DE8AB AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (11, N'冬季要给狗狗穿衣服吗？', N'饲养', N'<p></p><div><p>&nbsp; &nbsp; 有一种冷，叫主人觉得你很冷。</p><p>&nbsp; &nbsp; 冬季到了，越来越多的主人为狗狗穿上了冬衣，如果说夏天穿衣服是为了造型好看的话，那么冬天主人给狗狗穿衣服一定是为了保暖。<br></p><p>&nbsp; &nbsp; 现在问题来了，狗狗真的需要我们人为的添加衣物吗？对于这件事，你有什么看法呢？<br></p><p>&nbsp; &nbsp; &nbsp;<img alt="" src="http://img.boqiicdn.com/Data/BK/T/132/13286/1328680/img42901419234224_y.jpg"><br></p></div><br><p></p>', CAST(0x0000A76C015E5703 AS DateTime), 1, 1)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (12, N'狗狗睡觉鼾声特别大', N'饲养', N'<p>狗狗鼾声特别大，是什么原因，如何解决？    狗狗睡觉鼾声特别大</p><div><h2><br></h2></div><br><p></p>', CAST(0x0000A76C015EB0C7 AS DateTime), 1, 0)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (13, N'狗狗生病了，拜托请一定要戳进来！！！', N'医疗', N'<p></p><p>我家狗狗是一只大眼睛的小土狗，很漂亮。 &nbsp;前几天生病了，老是呕吐...嗜喝水...喝了吐...吐得时候会抽...眼睛还湿湿的...喉咙哑了.叫声咔咔的.还没精神..我想一定是给它洗澡导致感冒了，老妈买了999感冒冲剂和阿莫西林.都是掺牛奶喂的，现在精神好多了.可是和正常的时候比精神还是太。不吐了.可是喉咙还是哑的.后腿平常也抽抽...样子很像打嗝却又打不来的那种···我不想放弃他..请问各位我该怎么办...该喂什么药...</p><br><p></p>', CAST(0x0000A76C015FFDD8 AS DateTime), 1, 1)
INSERT [dbo].[BaikeQuestion] ([QuestionId], [QuestionTitle], [QuestionType], [QuestionDescribe], [QuestionTime], [UserId], [isChoiceness]) VALUES (14, N'狗肉味道不错！', N'饲养', N'<p>&nbsp;吃了上火！</p>', CAST(0x0000A7890167A809 AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[BaikeQuestion] OFF
SET IDENTITY_INSERT [dbo].[Collect] ON 

INSERT [dbo].[Collect] ([CollectId], [Type], [ShopId], [UserId]) VALUES (53, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Collect] OFF
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (1, N'法国皇家ROYAL CANIN 小型犬离乳期奶糕1kg MIS30', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.1.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.1.4.jpg', CAST(63.00 AS Decimal(10, 2)), N'非常好！非常好！非常好！', 1, CAST(58.00 AS Decimal(10, 2)), 1000, 1, 52, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (2, N'醇粹 泰迪贵宾幼犬奶糕天然狗粮500g 泰迪狗粮', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.2.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.2.4.jpg', CAST(28.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 11, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (3, N'比瑞吉 小型幼犬粮天然狗粮1.5kg', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.3.4.jpg', CAST(83.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 2, 12, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (4, N'法国皇家ROYAL CANIN 大型犬粮 怀孕哺乳期奶糕幼犬狗粮1kg ', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.4.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.4.jpg', CAST(61.00 AS Decimal(10, 2)), N'', 1, CAST(55.00 AS Decimal(10, 2)), 1000, 1, 2, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (5, N'醇粹 泰迪贵宾奶糕幼犬粮狗粮3kg 泰迪狗粮', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.5.4.jpg', CAST(89.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 5, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (6, N'畅享 离乳犬奶糕幼犬粮鲑鱼红米优质狗粮1.5kg', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog1.6.1.jpg', N'~/Content/Shop/upload/Goods/dog1.6.2.jpg', N'~/Content/Shop/upload/Goods/dog1.6.3.jpg', N'~/Content/Shop/upload/Goods/dog1.6.4.jpg', CAST(85.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 4, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (7, N'法国皇家ROYAL CANIN 中型犬奶糕怀孕哺乳期母犬离乳期幼犬狗粮1kg2 MES30', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.7.4.jpg', CAST(120.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 145, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (8, N'比瑞吉 小型犬奶糕天然狗粮2kg', N'狗狗商品', N'粮食', N'离乳期狗粮', N'~/Content/Shop/upload/Goods/dog.1.8.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.8.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.8.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.8.4.jpg', CAST(89.00 AS Decimal(10, 2)), N'', 1, CAST(85.00 AS Decimal(10, 2)), 1000, 6, 56, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (9, N'宝路 幼犬粮肉类奶蔬菜谷物配方狗粮1.3kg', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.1.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.1.4.jpg', CAST(32.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 11, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (10, N'法国皇家ROYAL CANIN 小型犬幼犬粮专用狗粮2kg MIJ31', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.2.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.2.4.jpg', CAST(104.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 5, 45, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (11, N'法国皇家ROYAL CANIN A3优选幼犬粮哺乳期母犬及幼犬适用 8kg', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.4.jpg', CAST(189.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 52, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (12, N'法国皇家ROYAL CANIN 贵宾幼犬粮专用狗粮3kg APD33', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.4.jpg', CAST(212.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 10, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (13, N'宝路 幼犬粮肉类奶蔬菜谷物配方狗粮1.3kg2 包', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.5.4.jpg', CAST(65.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 23, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (14, N'怡亲 保护肠胃雪橇犬专用幼犬粮2.5kg', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.6.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.6.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.6.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.6.4.jpg', CAST(59.00 AS Decimal(10, 2)), N'', 1, CAST(55.00 AS Decimal(10, 2)), 1000, 3, 11, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (15, N'法国皇家ROYAL CANIN 迷你雪纳瑞幼犬粮50g', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.7.4.jpg', CAST(10.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 4, 40, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (16, N'法国皇家ROYAL CANIN 中型犬幼犬粮专用狗粮4kg MEJ32', N'狗狗商品', N'粮食', N'幼犬粮', N'~/Content/Shop/upload/Goods/dog.2.8.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.8.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.8.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.8.4.jpg', CAST(186.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 4, 20, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (17, N'法国皇家ROYAL CANIN 泰迪贵宾成犬粮专用狗粮3kg PD30', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.1.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.1.4.jpg', CAST(190.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 35, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (18, N'宝路 中小型成犬粮牛肉肝蔬菜及谷物狗粮1.8kg', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.4.jpg', CAST(42.00 AS Decimal(10, 2)), N'', 1, CAST(37.60 AS Decimal(10, 2)), 1000, 1, 25, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (19, N'法国皇家ROYAL CANIN 10个月-8岁小型成犬粮2kg PR27', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.3.4.jpg', CAST(99.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 4, 56, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (20, N'法国皇家ROYAL CANIN 成犬粮狗粮8kg CC', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.4.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.4.4.jpg', CAST(173.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 112, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (21, N'康多乐 成犬粮牛肉肝蔬菜狗粮15kg', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.5.4.jpg', CAST(269.00 AS Decimal(10, 2)), N'', 1, CAST(252.00 AS Decimal(10, 2)), 1000, 3, 152, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (22, N'诺瑞好之味 成犬粮牛肉味狗粮10kg', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.6.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.6.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.6.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.6.4.jpg', CAST(102.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 564, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (23, N'比瑞吉 小型成犬粮天然狗粮1.5kg', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.7.4.jpg', CAST(72.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 125, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (24, N'宝路 大型成犬粮全面营养牛肉鸡肉及谷物味狗粮7.5kg', N'狗狗商品', N'粮食', N'成犬粮', N'~/Content/Shop/upload/Goods/dog.3.8.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.8.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.8.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.8.4.jpg', CAST(148.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 6, 88, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (25, N'宝路 老犬犬粮牛肉鸡肉蔬菜及谷物狗粮1.8kg', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.1.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.1.4.jpg', CAST(43.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 5, 77, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (26, N'法国皇家ROYAL CANIN 8岁以上老年小型犬粮 4kg SPR27', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.2.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.2.4.jpg', CAST(204.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 6, 55, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (27, N'醇粹 高龄老年犬粮高吸收天然狗粮3kg', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.3.4.jpg', CAST(82.00 AS Decimal(10, 2)), N'', 1, CAST(75.80 AS Decimal(10, 2)), 1000, 5, 66, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (28, N'醇粹 高龄老年犬粮高吸收天然狗粮500g', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.4.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.4.4.jpg', CAST(28.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 6, 44, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (29, N'佳乐滋 汪汪爱7岁以上大龄犬粮鸡肉牛肉多种蔬菜小鱼配方狗粮1.6kg', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.5.4.jpg', CAST(29.00 AS Decimal(10, 2)), N'', 1, CAST(25.60 AS Decimal(10, 2)), 1000, 2, 55, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (30, N'比瑞吉 小型老年犬粮天然狗粮2kg', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.6.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.6.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.6.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.6.4.jpg', CAST(81.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 2, 33, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (31, N'怡亲Yoken 老年犬专用狗粮 2.5kg', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.7.4.jpg', CAST(57.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 5, 22, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (32, N'法国皇家ROYAL CANIN 8岁以上贵宾老年犬粮3kg PDA26', N'狗狗商品', N'粮食', N'老犬粮', N'~/Content/Shop/upload/Goods/dog.4.8.1.jpg', N'~/Content/Shop/upload/Goods/dog.4.8.2.jpg', N'~/Content/Shop/upload/Goods/dog.4.8.3.jpg', N'~/Content/Shop/upload/Goods/dog.4.8.4.jpg', CAST(194.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 2, 11, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (33, N'宝路 成犬鸡肉味妙鲜包100g 狗湿粮', N'狗狗商品', N'罐头', N'成犬', N'~/Content/Shop/upload/Goods/b.1.1.1.jpg', N'~/Content/Shop/upload/Goods/b.1.1.2.jpg', N'~/Content/Shop/upload/Goods/b.1.1.3.jpg', N'~/Content/Shop/upload/Goods/b.1.1.4.jpg', CAST(3.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 2, 478, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (34, N'怡亲Yoken 成犬牛肉蔬菜湿粮110g', N'狗狗商品', N'罐头', N'成犬', N'~/Content/Shop/upload/Goods/b.1.2.1.jpg', N'~/Content/Shop/upload/Goods/b.1.2.2.jpg', N'~/Content/Shop/upload/Goods/b.1.2.3.jpg', N'~/Content/Shop/upload/Goods/b.1.2.4.jpg', CAST(2.90 AS Decimal(10, 2)), N'', 1, CAST(1.80 AS Decimal(10, 2)), 1000, 5, 123, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (35, N'顽皮Wanpy happy100牛肉慕斯狗罐头95g 狗湿粮', N'狗狗商品', N'罐头', N'成犬', N'~/Content/Shop/upload/Goods/b.1.3.1.jpg', N'~/Content/Shop/upload/Goods/b.1.3.2.jpg', N'~/Content/Shop/upload/Goods/b.1.3.3.jpg', N'~/Content/Shop/upload/Goods/b.1.3.4.jpg', CAST(4.50 AS Decimal(10, 2)), N'', 1, CAST(4.10 AS Decimal(10, 2)), 1000, 5, 456, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (36, N'爱丽思Natural 牛肉野菜狗罐头100g3罐 狗湿粮', N'狗狗商品', N'罐头', N'成犬', N'~/Content/Shop/upload/Goods/b.1.4.1.jpg', N'~/Content/Shop/upload/Goods/b.1.4.2.jpg', N'~/Content/Shop/upload/Goods/b.1.4.3.jpg', N'~/Content/Shop/upload/Goods/b.1.4.4.jpg', CAST(14.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 321, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (37, N'怡亲Yoken 幼犬三文鱼炖鸡湿粮110g', N'狗狗商品', N'罐头', N'幼犬', N'~/Content/Shop/upload/Goods/b.2.1.1.jpg', N'~/Content/Shop/upload/Goods/b.2.1.2.jpg', N'~/Content/Shop/upload/Goods/b.2.1.3.jpg', N'~/Content/Shop/upload/Goods/b.2.1.4.jpg', CAST(2.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 5, 312, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (38, N'怡亲Yoken 半湿粮幼犬健骨配方100g', N'狗狗商品', N'粮食', N'幼犬', N'~/Content/Shop/upload/Goods/b.2.2.1.jpg', N'~/Content/Shop/upload/Goods/b.2.2.2.jpg', N'~/Content/Shop/upload/Goods/b.2.2.3.jpg', N'~/Content/Shop/upload/Goods/b.2.2.4.jpg', CAST(3.60 AS Decimal(10, 2)), N'', 0, NULL, 1000, 4, 89, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (39, N'顽皮Wanpy 幼犬用鸡肉牛肉鲜封包80g 狗湿粮', N'狗狗商品', N'粮食', N'幼犬', N'~/Content/Shop/upload/Goods/b.2.3.1.jpg', N'~/Content/Shop/upload/Goods/b.2.3.2.jpg', N'~/Content/Shop/upload/Goods/b.2.3.3.jpg', N'~/Content/Shop/upload/Goods/b.2.3.4.jpg', CAST(4.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 92, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (40, N'朗跃 幼犬粮牛肉味半湿粮150g 狗湿粮妙鲜包', N'狗狗商品', N'粮食', N'幼犬', N'~/Content/Shop/upload/Goods/b.2.4.1.jpg', N'~/Content/Shop/upload/Goods/b.2.4.2.jpg', N'~/Content/Shop/upload/Goods/b.2.4.3.jpg', N'~/Content/Shop/upload/Goods/b.2.4.4.jpg', CAST(3.00 AS Decimal(10, 2)), N'', 1, CAST(2.80 AS Decimal(10, 2)), 1000, 5, 11, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (41, N'路斯 火腿肠单只15g 狗零食', N'狗狗商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/c.1.1.1.jpg', N'~/Content/Shop/upload/Goods/c.1.1.2.jpg', N'~/Content/Shop/upload/Goods/c.1.1.3.jpg', N'~/Content/Shop/upload/Goods/c.1.1.4.jpg', CAST(1.00 AS Decimal(10, 2)), N'', 1, NULL, 1000, 6, 24, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (42, N'路斯 金曼鸡肉磨牙硬条100g 狗零食', N'狗狗商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/c.1.2.1.jpg', N'~/Content/Shop/upload/Goods/c.1.2.2.jpg', N'~/Content/Shop/upload/Goods/c.1.2.3.jpg', N'~/Content/Shop/upload/Goods/c.1.2.4.jpg', CAST(21.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 4, 8, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (43, N'怡润 迷你双味卷鳕鱼鸡肉50g 狗零食', N'狗狗商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/c.1.3.1.jpg', N'~/Content/Shop/upload/Goods/c.1.3.2.jpg', N'~/Content/Shop/upload/Goods/c.1.3.3.jpg', N'~/Content/Shop/upload/Goods/c.1.3.4.jpg', CAST(4.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 4, 9, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (44, N'怡亲 犬用牛肉火腿肠15g30支 狗零食', N'狗狗商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/c.1.4.1.jpg', N'~/Content/Shop/upload/Goods/c.1.4.2.jpg', N'~/Content/Shop/upload/Goods/c.1.4.3.jpg', N'~/Content/Shop/upload/Goods/c.1.4.4.jpg', CAST(15.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 3, 6, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (49, N'宝路 幼犬钙奶棒洁齿咬胶60g 补钙磨牙两不误 狗零食', N'狗狗商品', N'零食', N'咬骨咬胶', N'~/Content/Shop/upload/Goods/c.2.1.1.jpg', N'~/Content/Shop/upload/Goods/c.2.1.2.jpg', N'~/Content/Shop/upload/Goods/c.2.1.3.jpg', N'~/Content/Shop/upload/Goods/c.2.1.4.jpg', CAST(10.40 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 4, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (50, N'宝路 中小型犬成犬洁齿棒75g 有效减少牙斑牙垢 狗零食', N'狗狗商品', N'粮食', N'咬骨咬胶', N'~/Content/Shop/upload/Goods/c.2.2.1.jpg', N'~/Content/Shop/upload/Goods/c.2.2.2.jpg', N'~/Content/Shop/upload/Goods/c.2.2.3.jpg', N'~/Content/Shop/upload/Goods/c.2.2.4.jpg', CAST(11.50 AS Decimal(10, 2)), N'', 0, NULL, 1000, 2, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (51, N'风来客 毫棒豪棒混合装洁齿骨咬胶2寸30只装270g 洁齿磨牙骨 狗零食', N'狗狗商品', N'粮食', N'咬骨咬胶', N'~/Content/Shop/upload/Goods/c.2.3.1.jpg', N'~/Content/Shop/upload/Goods/c.2.3.2.jpg', N'~/Content/Shop/upload/Goods/c.2.3.3.jpg', N'~/Content/Shop/upload/Goods/c.2.3.4.jpg', CAST(24.80 AS Decimal(10, 2)), N'', 0, NULL, 1000, 2, 2, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (52, N'宝路 钙力健磨牙棒75g 骨骼强壮牙齿坚固补钙 狗零食', N'狗狗商品', N'粮食', N'咬骨咬胶', N'~/Content/Shop/upload/Goods/c.2.4.1.jpg', N'~/Content/Shop/upload/Goods/c.2.4.2.jpg', N'~/Content/Shop/upload/Goods/c.2.4.3.jpg', N'~/Content/Shop/upload/Goods/c.2.4.4.jpg', CAST(11.50 AS Decimal(10, 2)), N'', 1, CAST(10.10 AS Decimal(10, 2)), 1000, 3, 1, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (53, N'BOTH 幼犬山羊奶果冻布丁16g50粒桶装 狗零食', N'狗狗商品', N'粮食', N'奶质零食', N'~/Content/Shop/upload/Goods/dog.1.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.1.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.1.4.jpg', CAST(52.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (63, N'湃特安琪儿 滴眼液18ml 杀菌消炎止痒润眼', N'狗狗商品', N'医疗', N'眼部护理', N'~/Content/Shop/upload/Goods/dog.1.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.2.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.2.4.jpg', CAST(25.00 AS Decimal(10, 2)), NULL, 0, NULL, 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (66, N'妙多乐CatChow 成猫粮均衡营养猫粮1.5kg', N'猫猫商品', N'粮食', N'成猫粮', N'~/Content/Shop/upload/Goods/dog.1.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.3.4.jpg', CAST(49.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (68, N'伟嘉 成猫粮海洋鱼味猫粮1.3kg', N'猫猫商品', N'粮食', N'成猫粮', N'~/Content/Shop/upload/Goods/dog.1.4.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.4.jpg', CAST(42.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 10, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (69, N'伟嘉 成猫精选金枪鱼味妙鲜包85g 猫湿粮', N'猫猫商品', N'罐头', N'成猫湿粮', N'~/Content/Shop/upload/Goods/dog.1.4.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.4.4.jpg', CAST(3.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (71, N'金赏Golden 金枪鱼+蟹肉味猫罐头170g 猫湿粮', N'猫猫商品', N'罐头', N'成猫湿粮', N'~/Content/Shop/upload/Goods/dog.1.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.5.4.jpg', CAST(4.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 45, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (73, N'怡亲Yoken 幼猫金枪鱼海鲜湿粮110g', N'猫猫商品', N'罐头', N'幼猫湿粮', N'~/Content/Shop/upload/Goods/c.2.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.6.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.6.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.6.4.jpg', CAST(3.00 AS Decimal(10, 2)), N'', 1, CAST(2.50 AS Decimal(10, 2)), 1000, 1, 10, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (74, N'伟嘉 幼猫精选海洋鱼妙鲜包85g 猫湿粮', N'猫猫商品', N'罐头', N'幼猫湿粮', N'~/Content/Shop/upload/Goods/dog.1.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.7.4.jpg', CAST(3.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 8, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (75, N'怡亲Yoken 幼猫精选小黄鱼鸡肉湿粮110g', N'猫猫商品', N'罐头', N'幼猫湿粮', N'~/Content/Shop/upload/Goods/dog.1.8.1.jpg', N'~/Content/Shop/upload/Goods/dog.1.8.2.jpg', N'~/Content/Shop/upload/Goods/dog.1.8.3.jpg', N'~/Content/Shop/upload/Goods/dog.1.8.4.jpg', CAST(3.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 9, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (76, N'伟嘉 幼猫精选牛肉妙鲜包85g 猫湿粮', N'猫猫商品', N'罐头', N'幼猫湿粮', N'~/Content/Shop/upload/Goods/dog.2.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.1.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.1.4.jpg', CAST(3.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 45, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (77, N'路斯 三文鱼肉丁35g 猫零食', N'猫猫商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/dog.2.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.3.4.jpg', CAST(8.90 AS Decimal(10, 2)), N'', 1, CAST(8.30 AS Decimal(10, 2)), 1000, 1, 0, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (78, N'怡亲Yoken 金枪鱼切片30g 猫零食', N'猫猫商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/c.2.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.4.4.jpg', CAST(9.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 41, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (79, N'怡亲 无盐阳光西施鱼干30g 猫零食', N'猫猫商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/dog.2.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.5.4.jpg', CAST(9.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (80, N'怡亲Yoken 三文鱼切片30g 猫零食', N'猫猫商品', N'零食', N'肉质零食', N'~/Content/Shop/upload/Goods/dog.2.6.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.6.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.6.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.6.4.jpg', CAST(9.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 56, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (81, N'森巴 芬苯达唑片 犬猫专用内驱 1片盒 防治蛔虫球虫绦虫等寄生虫', N'猫猫商品', N'医疗', N'体内驱虫', N'~/Content/Shop/upload/Goods/dog.2.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.7.4.jpg', CAST(25.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (82, N'雷米高Ramical 驱虫一粒清猫狗打虫药6片装 蛔虫绦虫', N'猫猫商品', N'医疗', N'体内驱虫', N'~/Content/Shop/upload/Goods/dog.2.8.1.jpg', N'~/Content/Shop/upload/Goods/dog.2.8.2.jpg', N'~/Content/Shop/upload/Goods/dog.2.8.3.jpg', N'~/Content/Shop/upload/Goods/dog.2.8.4.jpg', CAST(25.00 AS Decimal(10, 2)), N'', 1, CAST(22.30 AS Decimal(10, 2)), 1000, 1, 45, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (83, N'雷米高Ramical 驱虫一粒清猫狗广谱驱虫药打虫药1片装', N'猫猫商品', N'医疗', N'体内驱虫', N'~/Content/Shop/upload/Goods/dog.3.1.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.1.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.1.4.jpg', CAST(9.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (84, N'湃特安琪儿 肠虫宁体内驱虫药 牛肉香味 4粒装', N'猫猫商品', N'医疗', N'体内驱虫', N'~/Content/Shop/upload/Goods/dog.3.2.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.2.4.jpg', CAST(28.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 86, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (85, N'维斯康 冰岛有机海藻颗粒300g 发毛固色', N'猫猫商品', N'保健', N'美发护肤', N'~/Content/Shop/upload/Goods/dog.3.3.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.3.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.3.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.3.4.jpg', CAST(63.90 AS Decimal(10, 2)), N'', 1, CAST(58.50 AS Decimal(10, 2)), 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (86, N'维斯康 何首乌有色犬美毛颗粒300g 固色亮毛', N'猫猫商品', N'保健', N'美发护肤', N'~/Content/Shop/upload/Goods/dog.3.4.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.4.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.4.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.4.4.jpg', CAST(98.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (87, N'怡亲 多可特猫用护爪膏50ml', N'猫猫商品', N'保健', N'美发护肤', N'~/Content/Shop/upload/Goods/dog.3.5.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.5.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.5.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.5.4.jpg', CAST(13.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 12, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (88, N'雪亮 天然海藻粉300g 防脱毛改善毛色', N'猫猫商品', N'保健', N'美发护肤', N'~/Content/Shop/upload/Goods/dog.3.6.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.6.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.6.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.6.4.jpg', CAST(26.50 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (89, N'诺摩陆龟活体保温饲养箱宠物杉木斜面箱-NX-04', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.3.7.1.jpg', N'~/Content/Shop/upload/Goods/dog.3.7.2.jpg', N'~/Content/Shop/upload/Goods/dog.3.7.3.jpg', N'~/Content/Shop/upload/Goods/dog.3.7.4.jpg', CAST(119.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (90, N'黄色多用饲养盒饲养箱 水龟乌龟爬虫刺猬花草适用', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.1.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21411711941_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31411711941_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41411711941_thumb.jpg', CAST(68.00 AS Decimal(10, 2)), N'', 1, CAST(62.50 AS Decimal(10, 2)), 1000, 1, 11, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (91, N'CM水陆多用爬虫饲养箱亚克力爬箱313128', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.2.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21416546430_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31416546431_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41416546431_thumb.jpg', CAST(104.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 11, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (92, N'诺摩新款斜面组合小斜面保温爬箱403030-NX02', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21403763219_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41403763219_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath51403763219_thumb.jpg', CAST(160.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 56, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (93, N'NOMO乌龟缸 带晒台水龟苗箱饲养盒龟窝 养龟盆', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.4.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11376907520_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21376907508_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21376907520_thumb.jpg', CAST(5.80 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (94, N'诺摩NOMO 龟缸带晒台乌龟运输盒巴西龟手提盒橙黄蓝绿随机发', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.5.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21461308561_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31461308562_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41461308562_thumb.jpg', CAST(7.80 AS Decimal(10, 2)), N'', 1, CAST(7.50 AS Decimal(10, 2)), 1000, 1, 78, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (96, N'Reptile Structure 蜥蜴陆龟箱加热灯太阳UVA灯日光灯加温灯25W', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.6.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21411790067_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31411790067_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41411790067_thumb.jpg', CAST(20.00 AS Decimal(10, 2)), N'', 1, CAST(18.80 AS Decimal(10, 2)), 1000, 1, 46, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (97, N'爬虫夜灯陆龟蜥蜴蜘蛛夜间保温灯ny-01 75W', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.7.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21388030445_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41388030445_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath51388030445_thumb.jpg', CAST(19.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 12, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (98, N'Reptile Structure 爬虫陆龟箱蜥蜴夜灯保温灯UVA陶瓷加热灯25W', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.4.8.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21413945566_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31413945566_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41413945566_thumb.jpg', CAST(30.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (99, N'NOMO 蜥蜴箱陆龟箱宠物用太阳灯节能灯泡13W', N'爬虫用品', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/b.1.1.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21401852685_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31401852685_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41401852685_thumb.jpg', CAST(59.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (100, N'兔粮 幼兔粮.成兔粮.胡萝卜含防球虫成分500g', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.1.2.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11452670366_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11452670375_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11463479236_thumb.jpg', CAST(8.30 AS Decimal(10, 2)), N'', 1, CAST(8.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (101, N'NEW AGE纽安吉经典幼兔粮1KG 替代乳配方', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.1.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11468891836_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21401788841_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21468891836_thumb.jpg', CAST(13.00 AS Decimal(10, 2)), N'', 1, CAST(12.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (102, N'凯莉KY64 天然兔粮2.5kg有效除臭防球虫', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.1.4.1.jpg', N'~/Content/Shop/upload/Goods/picpath31363937775_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11419556590_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11419580891_thumb.jpg', CAST(22.50 AS Decimal(10, 2)), N'', 1, CAST(22.00 AS Decimal(10, 2)), 1000, 1, 66, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (103, N'凯莉KY12私房兔粮全龄防球虫兔饲料2.5kg', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.1.2.1.jpg', N'~/Content/Shop/upload/Goods/picpath21364380309_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11419652271_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21419652271_thumb.jpg', CAST(28.90 AS Decimal(10, 2)), N'', 1, CAST(27.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (104, N'Minishow 迷你秀仓鼠盛宴营养鼠粮800g', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.2.4.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11468904747_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21464861422_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31464861422_thumb.jpg', CAST(10.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (105, N'纽安吉 仓鼠全日缤纷水果粮 400g豪华配料', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.2.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11421657370_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21421657349_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31421657350_thumb.jpg', CAST(13.50 AS Decimal(10, 2)), N'', 1, CAST(13.00 AS Decimal(10, 2)), 1000, 1, 44, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (106, N'纽安吉 仓鼠全日综合营养粮 800g豪华配料', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.2.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11421657252_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21421657228_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31421657229_thumb.jpg', CAST(14.50 AS Decimal(10, 2)), N'', 1, CAST(13.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (107, N'Marsa 高营养杂锦仓鼠粮食500g MA29', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/b.2.4.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21426839594_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31426839595_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41426839595_thumb.jpg', CAST(7.90 AS Decimal(10, 2)), N'', 1, CAST(8.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (108, N'凯莉 全营养优质龙猫粮2.5kg KY10', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/c.1.1.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21463467299_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31463467299_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41463467299_thumb.jpg', CAST(31.50 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 4, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (109, N'凯莉 全营养优质龙猫粮1kg KY09', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/c.1.2.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11467706277_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11467706290_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21467706277_thumb.jpg', CAST(13.50 AS Decimal(10, 2)), N'', 1, CAST(12.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (110, N'纽安吉全日蔬果美毛龙猫粮800g', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/c.1.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11468891418_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21411703309_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21468891418_thumb.jpg', CAST(17.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 1, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (111, N'New Age纽安吉 活力龙猫粮 600g', N'奇趣小宠', N'粮食', N'其它', N'~/Content/Shop/upload/Goods/c.1.4.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11468892946_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21468892923_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21468892946_thumb.jpg', CAST(16.70 AS Decimal(10, 2)), N'', 1, CAST(15.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (112, N'森森 鱼缸外置过滤桶HW-603 不带动力源 60cm以内鱼缸适用', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/c.2.1.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21421228708_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31421228709_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath51421228710_thumb.jpg', CAST(52.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (113, N'森森 鱼缸迷你气动过滤器水妖精JX-01', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/c.2.2.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21417670001_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31417670001_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41417670002_thumb.jpg', CAST(8.50 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 5, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (114, N'森森超静音过滤器增氧泵水 7w JP-043F', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/c.2.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21489141503_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31489141503_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41489141504_thumb.jpg', CAST(19.50 AS Decimal(10, 2)), N'', 1, CAST(17.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (115, N'鱼缸水族箱杀菌过滤器 森森JUP-01 02', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/c.2.4.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11468811996_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11468812006_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21468812007_thumb.jpg', CAST(79.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (116, N'闽江 玻璃水族箱鱼缸HR3-580 MJ-560 58cm长', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/c.2.1.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21470105204_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31470105204_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41470105204_thumb.jpg', CAST(278.00 AS Decimal(10, 2)), N'', 1, CAST(256.00 AS Decimal(10, 2)), 1000, 1, 5, N'rateit    ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (117, N'闽江MJ系列幻影鱼缸 创新触摸灯光变色 6种颜色可选', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.1.1.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11434503725_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11434503737_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21434503738_thumb.jpg', CAST(99.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 0, N'rateit1   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (118, N'闽江 玻璃水族箱鱼缸HR3-480 48cm长', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.1.2.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21398332516_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31398332516_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41398332517_thumb.jpg', CAST(199.00 AS Decimal(10, 2)), N'', 1, CAST(156.00 AS Decimal(10, 2)), 1000, 1, 44, N'rateit1   ')
GO
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (119, N'鱼缸水族箱 佳宝生态金鱼缸高清玻璃热带鱼创意观赏造景鱼缸', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.1.3.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21461209968_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31461209968_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41461209968_thumb.jpg', CAST(72.00 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 99, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (120, N'精灵鱼血鹦鹉增色饲料 发财鱼增红鱼粮1500G', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.1.4.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath11456212817_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21428047221_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41428047222_thumb.jpg', CAST(32.00 AS Decimal(10, 2)), N'', 1, CAST(23.00 AS Decimal(10, 2)), 1000, 1, 0, N'rateit2   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (121, N'锦跃 鹦鹉鱼饲料鱼食血鹦鹉增红鱼饲料增色鱼食鱼饲料鹦鹉鱼食', N'水族市场', N'日用品', N'其它', N'~/Content/Shop/upload/Goods/dog.1.5.1.jpg', N'~/Content/Shop/upload/Goods/shoppicpath21458631391_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath31458631391_thumb.jpg', N'~/Content/Shop/upload/Goods/shoppicpath41458631391_thumb.jpg', CAST(12.90 AS Decimal(10, 2)), N'', 0, NULL, 1000, 1, 405, N'rateit3   ')
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [SeriesName], [TypeName], [DetailName], [GoodsImg1], [GoodsImg2], [GoodsImg3], [GoodsImg4], [GoodsPrice], [GoodsDescribe], [IsDiscount], [DiscountPrice], [GoodsStock], [ShopId], [SellNum], [GoodsRange]) VALUES (124, N'专业大型犬宠物电推剪泰迪狗狗剃毛器充电式金毛狗毛电推子用品 ', N'狗狗商品', N'日用品', N'日用品 除毛', N'~/Content/Shop/upload/Goods/add1.1.jpg', N'~/Content/Shop/upload/Goods/add1.2.jpg', N'~/Content/Shop/upload/Goods/add1.3.jpg', N'~/Content/Shop/upload/Goods/add1.4.jpg', CAST(89.00 AS Decimal(10, 2)), NULL, 0, NULL, 1000, 2, 12, N'rateit3   ')
SET IDENTITY_INSERT [dbo].[Goods] OFF
SET IDENTITY_INSERT [dbo].[GoodsComment] ON 

INSERT [dbo].[GoodsComment] ([CommentId], [CommentContent], [ContentRange], [CommentTime], [GoodsId], [UsersId], [IsReply]) VALUES (2, N'不错不错，下次再来', N'好评', CAST(0x0000A78900000000 AS DateTime), 1, 3, 1)
INSERT [dbo].[GoodsComment] ([CommentId], [CommentContent], [ContentRange], [CommentTime], [GoodsId], [UsersId], [IsReply]) VALUES (3, N'还行，狗狗挺爱吃的', N'中评', CAST(0x0000A78800000000 AS DateTime), 1, 4, 0)
INSERT [dbo].[GoodsComment] ([CommentId], [CommentContent], [ContentRange], [CommentTime], [GoodsId], [UsersId], [IsReply]) VALUES (4, N'一般吧！', N'中评', CAST(0x0000A78700000000 AS DateTime), 1, 6, 0)
SET IDENTITY_INSERT [dbo].[GoodsComment] OFF
SET IDENTITY_INSERT [dbo].[GoodsResponseComment] ON 

INSERT [dbo].[GoodsResponseComment] ([AnswerId], [CommentId], [AnswerContent], [UserName], [AnswerTime]) VALUES (1, 2, N'欢迎下次再来！！！', N'用户1', CAST(0x0000A7870159A40D AS DateTime))
SET IDENTITY_INSERT [dbo].[GoodsResponseComment] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [OrderCount], [UserId], [OrderTime], [OrderAddress], [OrderRemark], [OrderState], [OrderNumber]) VALUES (8, CAST(146.00 AS Decimal(10, 2)), 1, CAST(0x0000A785014A8780 AS DateTime), N'待填', NULL, 0, N'387604997314')
INSERT [dbo].[Order] ([OrderId], [OrderCount], [UserId], [OrderTime], [OrderAddress], [OrderRemark], [OrderState], [OrderNumber]) VALUES (9, CAST(146.00 AS Decimal(10, 2)), 1, CAST(0x0000A785014D9F84 AS DateTime), N'待填', NULL, 0, N'140971088013')
INSERT [dbo].[Order] ([OrderId], [OrderCount], [UserId], [OrderTime], [OrderAddress], [OrderRemark], [OrderState], [OrderNumber]) VALUES (10, CAST(140.00 AS Decimal(10, 2)), 1, CAST(0x0000A78801717D78 AS DateTime), N'待填', NULL, 0, N'237120024310')
INSERT [dbo].[Order] ([OrderId], [OrderCount], [UserId], [OrderTime], [OrderAddress], [OrderRemark], [OrderState], [OrderNumber]) VALUES (11, CAST(195.00 AS Decimal(10, 2)), 1, CAST(0x0000A78900AA0D0E AS DateTime), N'待填', NULL, 0, N'588785479285')
INSERT [dbo].[Order] ([OrderId], [OrderCount], [UserId], [OrderTime], [OrderAddress], [OrderRemark], [OrderState], [OrderNumber]) VALUES (12, CAST(19.10 AS Decimal(10, 2)), 1, CAST(0x0000A78B00BFA84D AS DateTime), N'待填', NULL, 0, N'135792777664')
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (1, 8, 6, 1, CAST(6.00 AS Decimal(10, 2)), 1, N'485265809990', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (2, 8, 2, 1, CAST(2.00 AS Decimal(10, 2)), 1, N'485265809990', 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (3, 8, 3, 1, CAST(3.00 AS Decimal(10, 2)), 1, N'485265809990', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (4, 8, 4, 1, CAST(4.00 AS Decimal(10, 2)), 1, N'485265809990', 1)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (5, 8, 4, 1, CAST(55.00 AS Decimal(10, 2)), 1, N'387604997314', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (6, 8, 5, 1, CAST(89.00 AS Decimal(10, 2)), 1, N'387604997314', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (7, 8, 6, 1, CAST(85.00 AS Decimal(10, 2)), 1, N'387604997314', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (8, 9, 4, 1, CAST(55.00 AS Decimal(10, 2)), 1, N'140971088013', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (9, 9, 6, 1, CAST(85.00 AS Decimal(10, 2)), 1, N'140971088013', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (10, 10, 4, 1, CAST(55.00 AS Decimal(10, 2)), 1, N'237120024310', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (11, 10, 8, 1, CAST(85.00 AS Decimal(10, 2)), 1, N'237120024310', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (12, 11, 2, 4, CAST(112.00 AS Decimal(10, 2)), 1, N'588785479285', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (13, 11, 3, 1, CAST(83.00 AS Decimal(10, 2)), 1, N'588785479285', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (14, 12, 73, 1, CAST(2.50 AS Decimal(10, 2)), 1, N'135792777664', 0)
INSERT [dbo].[OrderDetail] ([DetailId], [OrderId], [GoodsId], [DetailSum], [DetailCount], [UserId], [OrderNumber], [OrderState]) VALUES (15, 12, 77, 2, CAST(16.60 AS Decimal(10, 2)), 1, N'135792777664', 1)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
SET IDENTITY_INSERT [dbo].[Post] ON 

INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (1, N'家里的狗狗突然不吃食了，怎么回事', N'帖子1', CAST(0x0000A78B00000000 AS DateTime), 1, N'求助帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (2, N'我家的蠢二哈', N'帖子2', CAST(0x0000A78C00000000 AS DateTime), 3, N'分享帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (10, N'永远不懂喵星人', N'帖子3', CAST(0x0000A78E00000000 AS DateTime), 1, N'交流贴', 0, 1)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (13, N'专家建议', N'帖子4', CAST(0x0000A78E00000000 AS DateTime), 3, N'专家帖', 1, 1)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (14, N'我怀疑我家宠物成精了', N'第一天，，，，，，
第二天，，，，，，
第三天，，，，，，', CAST(0x0000A78E015B21F4 AS DateTime), 1, N'分享帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (15, N'测试发帖', N'宠物之家测试帖1', CAST(0x0000A78F00ED1D54 AS DateTime), 1, N'交流帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (16, N'猫咪不能吃的食物', N'有的猫比较馋，人吃什么它也想吃什么，你喂它就吃。但如果长期这样做的话，会逐渐损害猫的身体健康。肯定会有同学说：猫哪有这么金贵，我家的猫什么都吃，也健健康康的。是这样的：首先猫不会“讲”它生病了，可能你根本不知道它曾难受煎熬。', CAST(0x0000A78F00F42790 AS DateTime), 1, N'专家帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (17, N'养狗新手注意', N'很多朋友在养狗之前，根本没有接触过狗狗，或许他们养狗狗只是一时兴趣，或者是别人送了一只狗狗，自己捡了一只狗狗这种情况多不胜数。在完全不了解如何养狗的时候你就开始养狗了，如果喂养不当就可能引起狗狗生病甚至死亡的，所以一定要先了解新手喂养狗狗的极大禁忌才能更好的让狗狗健康成长。', CAST(0x0000A78F00F59393 AS DateTime), 1, N'交流帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (18, N'狗狗在危险时刻救了主人', N'2017年3月22日中午，在江苏通吕运河海门市刘浩段，一艘货船上一个四五岁的男孩，为了追气球一脚踏空跌进河里。危急关头，原本被系在门上的大黑狗，硬是挣脱了脖子上的绳索跳进河中。在水里叼住小主人的衣服后，它拼尽全力救起孩子。记者了解到，孩子安然无恙，而黑狗身上却伤痕累累。', CAST(0x0000A78F0133D50B AS DateTime), 11, N'分享帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (19, N'鱼缸里的水多久换一次', N'不换不干净，换的太频繁自己也累，那多久换一次比较合适嘞', CAST(0x0000A79000BFE3F1 AS DateTime), 13, N'交流帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (20, N'泰迪是不是生病了', N'我家小泰迪两个半月了，今天突然睡觉出来后踹粗气或喷嚏两下，不多，就几次，能吃能睡，尿尿比较多，因为我今天喂得稀饭，便便也成型，鼻子有一点点干，但很凉，我不知道是不是病了。', CAST(0x0000A79001208839 AS DateTime), 13, N'求助帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (21, N'松狮两个月大概要喂多少狗粮啊', N'松狮两个月大概要喂多少狗粮啊？我家小六怎么总跟吃不饱一样呢，而且我发现它好像瘦了，身上的骨头都很明显就能摸到了。我每天喂4次，一次基本就是一小把。它的盆是直径12、3厘米大的，每次泡完食基本就是两层，会不会少点啊？', CAST(0x0000A7900120E11D AS DateTime), 13, N'求助帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (22, N'蝴蝶犬得了跳蚤、虱、蜱感染怎么办？', N'       想要在喂养好 狼青犬，首要的就是狼青怎么保证他的健康，自然健康的话，也是关注每个细节，比如说就是体外寄生虫的防治上！
       犬的外寄生虫病在犬皮肤病中病率很高，包括：蠕形螨感染、疥螨感染、耳痒螨感染、恙螨感染、跳蚤感染、虱子和蜱感染等病症，尤其在夏季多生，因此，应该引起重视。
       犬外寄生虫的防治与环境有密切关系。有些外寄生虫在正常情况下少量存在于犬的体表，不表现出临床症状；有些寄生虫与环境卫生差有关，如跳蚤、虱子、蜱等外寄生虫，室外饲养的犬易患此病，使用大颈圈，加强环境卫生可以预防这些寄生虫病的生。
       皮肤化验是正确诊断犬的外寄生虫病的基础，在此基础上的正确用药是治疗犬的外寄生虫病的手段。', CAST(0x0000A79001227DF7 AS DateTime), 13, N'专家帖', 0, 0)
INSERT [dbo].[Post] ([PostId], [PostTitle], [PostContent], [PostTime], [UserId], [PostType], [IsChoose], [IsTop]) VALUES (23, N'狗狗能看懂主人的眼神吗', N'想问问狗狗能看懂人的眼神、心思吗？', CAST(0x0000A79001238E0C AS DateTime), 8, N'交流帖', 0, 0)
SET IDENTITY_INSERT [dbo].[Post] OFF
SET IDENTITY_INSERT [dbo].[ResponAnswer] ON 

INSERT [dbo].[ResponAnswer] ([ResponseAnswerId], [AnswerId], [ResponContent], [UserName], [ResponTime]) VALUES (1, 1, N'我是一楼！！！', N'用户1', CAST(0x0000A7780153659C AS DateTime))
INSERT [dbo].[ResponAnswer] ([ResponseAnswerId], [AnswerId], [ResponContent], [UserName], [ResponTime]) VALUES (2, 1, N'我是二楼！！！', N'用户1', CAST(0x0000A7780153A49C AS DateTime))
INSERT [dbo].[ResponAnswer] ([ResponseAnswerId], [AnswerId], [ResponContent], [UserName], [ResponTime]) VALUES (3, 1, N'我是三楼！！！', N'用户1', CAST(0x0000A7780153BA01 AS DateTime))
INSERT [dbo].[ResponAnswer] ([ResponseAnswerId], [AnswerId], [ResponContent], [UserName], [ResponTime]) VALUES (4, 1, N'我是四楼！！！', N'用户1', CAST(0x0000A77B00A04FC6 AS DateTime))
INSERT [dbo].[ResponAnswer] ([ResponseAnswerId], [AnswerId], [ResponContent], [UserName], [ResponTime]) VALUES (5, 2, N'我是一楼！！！', N'用户1', CAST(0x0000A77B00A44350 AS DateTime))
INSERT [dbo].[ResponAnswer] ([ResponseAnswerId], [AnswerId], [ResponContent], [UserName], [ResponTime]) VALUES (6, 1, N'一楼说的对！！！', N'用户1', CAST(0x0000A77B00BD967D AS DateTime))
SET IDENTITY_INSERT [dbo].[ResponAnswer] OFF
SET IDENTITY_INSERT [dbo].[Response] ON 

INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (1, 1, 1, 3, CAST(0x0000A78B00000000 AS DateTime), N'我是一楼', 1)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (2, 1, 1, 8, CAST(0x0000A78B00000000 AS DateTime), N'我是二楼', 2)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (3, 2, 3, 1, CAST(0x0000A78B00000000 AS DateTime), N'我是一楼', 1)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (4, 2, 1, 3, CAST(0x0000A78F0120EC71 AS DateTime), N'我是二楼', 2)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (5, 2, 1, 3, CAST(0x0000A78F01223FC5 AS DateTime), N'我是三楼', 3)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (6, 18, 11, 11, CAST(0x0000A78F013403D2 AS DateTime), N'二楼是我的', 1)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (7, 18, 11, 11, CAST(0x0000A78F01341045 AS DateTime), N'三楼是我的', 2)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (8, 18, 11, 11, CAST(0x0000A78F013436A3 AS DateTime), N'楼上抢楼了', 3)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (9, 17, 13, 1, CAST(0x0000A79000BED2B8 AS DateTime), N'注意什么', 1)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (10, 16, 13, 1, CAST(0x0000A79000BF126E AS DateTime), N'我家的猫咪就因为吃坏东西得过病', 1)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (11, 18, 13, 11, CAST(0x0000A790010A5677 AS DateTime), N'后排围观', 4)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (12, 18, 8, 11, CAST(0x0000A790012780F0 AS DateTime), N'随便说一句吧', 5)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (13, 18, 8, 11, CAST(0x0000A790012B8920 AS DateTime), N'很神奇', 6)
INSERT [dbo].[Response] ([ResponseId], [PostId], [SenderId], [ReceiverId], [ResponseTime], [ResponseContent], [ResponseFloor]) VALUES (14, 18, 8, 11, CAST(0x0000A790012B9753 AS DateTime), N'狗狗是人类的朋友啊', 7)
SET IDENTITY_INSERT [dbo].[Response] OFF
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (1, N'店铺1', N'~/Content/Shop/upload/Store/Store1.jpg', N'15279168277', NULL, N'362202199502136636', 1, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (2, N'店铺2', N'~/Content/Shop/upload/Store/Store2.jpg', N'15279168276', NULL, N'362202199502136636', 3, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (3, N'店铺3', N'~/Content/Shop/upload/Store/Store3.jpg', N'15279168275', NULL, N'362202199502136636', 4, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (4, N'店铺4', N'~/Content/Shop/upload/Store/Store4.jpg', N'15279168274', NULL, N'362202199502136636', 6, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (5, N'店铺5', N'~/Content/Shop/upload/Store/Store5.jpg', N'15279168273', NULL, N'362202199502136636', 8, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (6, N'店铺6', N'~/Content/Shop/upload/Store/Store6.jpg', N'15279168272', NULL, N'362202199502136636', 9, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (7, N'店铺7', N'~/Content/Shop/upload/Store/shop1.jpg', N'15279168277', NULL, N'362202199502136636', 11, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (8, N'店铺8', N'~/Content/Shop/upload/Store/shop4.jpg', N'15279168277', NULL, N'362202199502136636', 13, NULL)
INSERT [dbo].[Shop] ([ShopId], [ShopName], [ShopImg], [CustomerService], [ShopEmail], [SellerIdCard], [UserId], [StarLevel]) VALUES (9, N'店铺9', N'~/Content/Shop/upload/Store/shop7.jpg', N'15279168277', NULL, N'362202199502136636', 14, NULL)
SET IDENTITY_INSERT [dbo].[Shop] OFF
SET IDENTITY_INSERT [dbo].[ShopCart] ON 

INSERT [dbo].[ShopCart] ([CartId], [GoodsId], [GoodsSum], [UserName]) VALUES (75, 73, 1, N'用户1')
INSERT [dbo].[ShopCart] ([CartId], [GoodsId], [GoodsSum], [UserName]) VALUES (76, 77, 1, N'用户1')
SET IDENTITY_INSERT [dbo].[ShopCart] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (1, N'15279168277', N'1264523595@qq.com', N'用户1', N'12345', N'12345', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (3, N'15279168276', N'1264523595@qq.com', N'用户2', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (4, N'15279168275', N'1264523595@qq.com', N'用户3', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (6, N'15279168274', N'1264523595@qq.com', N'用户4', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (8, N'15279168273', N'1264523595@qq.com', N'用户5', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (9, N'15279168277', N'1264523595@qq.com', N'用户6', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (11, N'15279168277', N'1264523595@qq.com', N'用户7', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (13, N'15279168277', N'1264523595@qq.com', N'用户8', N'123456', N'123456', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
INSERT [dbo].[UserInfo] ([UserId], [UserPhone], [UserEmail], [UserName], [UserPwd], [ConfirmPwd], [UserImg], [IsSeller], [Range], [Score]) VALUES (14, N'15279168277', N'1234563595@qq.com', N'用户9', N'112345', N'112345', N'~/Content/Baike/img/user.jpg', 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[BaikeAnswer]  WITH CHECK ADD  CONSTRAINT [FK_BaikeAnswer_BaikeQuestion] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[BaikeAnswer] CHECK CONSTRAINT [FK_BaikeAnswer_BaikeQuestion]
GO
ALTER TABLE [dbo].[BaikeQuestion]  WITH CHECK ADD  CONSTRAINT [FK_BaikeQuestion_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[BaikeQuestion] CHECK CONSTRAINT [FK_BaikeQuestion_UserInfo]
GO
ALTER TABLE [dbo].[Collect]  WITH CHECK ADD  CONSTRAINT [FK_Collect_Shop] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([ShopId])
GO
ALTER TABLE [dbo].[Collect] CHECK CONSTRAINT [FK_Collect_Shop]
GO
ALTER TABLE [dbo].[Collect]  WITH CHECK ADD  CONSTRAINT [FK_Collect_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[Collect] CHECK CONSTRAINT [FK_Collect_UserInfo]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Shop1] FOREIGN KEY([ShopId])
REFERENCES [dbo].[Shop] ([ShopId])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Shop1]
GO
ALTER TABLE [dbo].[GoodsComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodsComment_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
GO
ALTER TABLE [dbo].[GoodsComment] CHECK CONSTRAINT [FK_GoodsComment_Goods]
GO
ALTER TABLE [dbo].[GoodsComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodsComment_UserInfo] FOREIGN KEY([UsersId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[GoodsComment] CHECK CONSTRAINT [FK_GoodsComment_UserInfo]
GO
ALTER TABLE [dbo].[GoodsResponseComment]  WITH CHECK ADD  CONSTRAINT [FK_GoodsResponseComment_GoodsComment] FOREIGN KEY([CommentId])
REFERENCES [dbo].[GoodsComment] ([CommentId])
GO
ALTER TABLE [dbo].[GoodsResponseComment] CHECK CONSTRAINT [FK_GoodsResponseComment_GoodsComment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_UserInfo]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Goods]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_UserInfo]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_UserInfo]
GO
ALTER TABLE [dbo].[ResponAnswer]  WITH CHECK ADD  CONSTRAINT [FK_ResponAnswer_BaikeAnswer] FOREIGN KEY([AnswerId])
REFERENCES [dbo].[BaikeAnswer] ([AnswerId])
GO
ALTER TABLE [dbo].[ResponAnswer] CHECK CONSTRAINT [FK_ResponAnswer_BaikeAnswer]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([PostId])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Post]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_UserInfo] FOREIGN KEY([SenderId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_UserInfo]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Shop] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Shop]
GO
ALTER TABLE [dbo].[ShopCart]  WITH CHECK ADD  CONSTRAINT [FK_ShopCart_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
GO
ALTER TABLE [dbo].[ShopCart] CHECK CONSTRAINT [FK_ShopCart_Goods]
GO
USE [master]
GO
ALTER DATABASE [MyPets] SET  READ_WRITE 
GO
