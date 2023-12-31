USE [master]
GO
/****** Object:  Database [Tours]    Script Date: 16.09.2023 22:24:23 ******/
CREATE DATABASE [Tours]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tours', FILENAME = N'D:\3 курс\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tours.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tours_log', FILENAME = N'D:\3 курс\MSSQL15.SQLEXPRESS\MSSQL\DATA\Tours_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tours].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tours] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tours] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tours] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tours] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tours] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tours] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tours] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tours] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tours] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tours] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tours] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tours] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tours] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tours] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tours] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tours] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tours] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tours] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tours] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tours] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tours] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tours] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tours] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tours] SET  MULTI_USER 
GO
ALTER DATABASE [Tours] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tours] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tours] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tours] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tours] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Tours]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[CountOfStars] [int] NOT NULL,
	[CountryCode] [nchar](2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelComment]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelComment](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Author] [nchar](100) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_HotelComment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelImage]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelImage](
	[Id] [int] NOT NULL,
	[HotelId] [int] NOT NULL,
	[ImagePreview] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_HotelImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HotelOfTour]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HotelOfTour](
	[HotelID] [int] NOT NULL,
	[TourID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tour]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tour](
	[id] [int] NOT NULL,
	[TicketCount] [int] NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[ImagePreview] [varbinary](max) NULL,
	[Price] [money] NOT NULL,
	[IsActual] [bit] NOT NULL,
 CONSTRAINT [PK_Tour] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfTour]    Script Date: 16.09.2023 22:24:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfTour](
	[TourID] [int] NOT NULL,
	[TypeID] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AB', N'Абхазия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'AN', N'Англия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'BG', N'Болгария')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'DE', N'Германия')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'EG', N'Египет')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'GE', N'Греция')
INSERT [dbo].[Country] ([Code], [Name]) VALUES (N'IL', N'Израиль')
GO
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (1, N'Тип1', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (2, N'Тип2', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (3, N'Тип3', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (4, N'Тип4', NULL)
INSERT [dbo].[Type] ([Id], [Name], [Description]) VALUES (5, N'Тип5', NULL)
GO
/****** Object:  Index [IX_TypeOfTour]    Script Date: 16.09.2023 22:24:23 ******/
CREATE NONCLUSTERED INDEX [IX_TypeOfTour] ON [dbo].[TypeOfTour]
(
	[TourID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Country] FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([Code])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Country]
GO
ALTER TABLE [dbo].[HotelComment]  WITH CHECK ADD  CONSTRAINT [FK_HotelComment_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelComment] CHECK CONSTRAINT [FK_HotelComment_Hotel]
GO
ALTER TABLE [dbo].[HotelImage]  WITH CHECK ADD  CONSTRAINT [FK_HotelImage_Hotel] FOREIGN KEY([HotelId])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelImage] CHECK CONSTRAINT [FK_HotelImage_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Hotel] FOREIGN KEY([HotelID])
REFERENCES [dbo].[Hotel] ([Id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Hotel]
GO
ALTER TABLE [dbo].[HotelOfTour]  WITH CHECK ADD  CONSTRAINT [FK_HotelOfTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[HotelOfTour] CHECK CONSTRAINT [FK_HotelOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Tour] FOREIGN KEY([TourID])
REFERENCES [dbo].[Tour] ([id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Tour]
GO
ALTER TABLE [dbo].[TypeOfTour]  WITH CHECK ADD  CONSTRAINT [FK_TypeOfTour_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[Type] ([Id])
GO
ALTER TABLE [dbo].[TypeOfTour] CHECK CONSTRAINT [FK_TypeOfTour_Type]
GO
USE [master]
GO
ALTER DATABASE [Tours] SET  READ_WRITE 
GO
