USE [master]
GO
/****** Object:  Database [UrunYonetim]    Script Date: 24.09.2022 10:41:45 ******/
CREATE DATABASE [UrunYonetim]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UrunYonetim', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UrunYonetim.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UrunYonetim_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\UrunYonetim_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UrunYonetim] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UrunYonetim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UrunYonetim] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UrunYonetim] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UrunYonetim] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UrunYonetim] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UrunYonetim] SET ARITHABORT OFF 
GO
ALTER DATABASE [UrunYonetim] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UrunYonetim] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UrunYonetim] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UrunYonetim] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UrunYonetim] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UrunYonetim] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UrunYonetim] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UrunYonetim] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UrunYonetim] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UrunYonetim] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UrunYonetim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UrunYonetim] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UrunYonetim] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UrunYonetim] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UrunYonetim] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UrunYonetim] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UrunYonetim] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UrunYonetim] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UrunYonetim] SET  MULTI_USER 
GO
ALTER DATABASE [UrunYonetim] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UrunYonetim] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UrunYonetim] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UrunYonetim] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UrunYonetim] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UrunYonetim] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [UrunYonetim] SET QUERY_STORE = OFF
GO
USE [UrunYonetim]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 24.09.2022 10:41:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sube]    Script Date: 24.09.2022 10:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sube](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](200) NOT NULL,
	[PlakaNo] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sube] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Urun]    Script Date: 24.09.2022 10:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Urun](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Adi] [varchar](100) NOT NULL,
	[ParcaNo] [char](10) NOT NULL,
	[StokAdedi] [bigint] NULL,
	[BirimFiyati] [decimal](18, 2) NULL,
	[EklenmeTarihi] [datetime] NOT NULL,
	[KategoriId] [int] NOT NULL,
 CONSTRAINT [PK_Urun] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UrunSube]    Script Date: 24.09.2022 10:41:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UrunSube](
	[UrunId] [int] NOT NULL,
	[SubeId] [int] NOT NULL,
 CONSTRAINT [PK_UrunSube] PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC,
	[SubeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([Id], [Adi]) VALUES (3, N'Beyaz Eşya')
INSERT [dbo].[Kategori] ([Id], [Adi]) VALUES (1, N'Elektronik')
INSERT [dbo].[Kategori] ([Id], [Adi]) VALUES (2, N'Giyim')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
GO
SET IDENTITY_INSERT [dbo].[Sube] ON 

INSERT [dbo].[Sube] ([Id], [Adi], [PlakaNo]) VALUES (1, N'Ankara Şube', 6)
INSERT [dbo].[Sube] ([Id], [Adi], [PlakaNo]) VALUES (2, N'İstanbul Şube', 34)
INSERT [dbo].[Sube] ([Id], [Adi], [PlakaNo]) VALUES (3, N'İzmir Şube', 35)
SET IDENTITY_INSERT [dbo].[Sube] OFF
GO
SET IDENTITY_INSERT [dbo].[Urun] ON 

INSERT [dbo].[Urun] ([Id], [Adi], [ParcaNo], [StokAdedi], [BirimFiyati], [EklenmeTarihi], [KategoriId]) VALUES (1, N'Arçelik Buz Dolabı', N'BA11111111', 1000, CAST(16000.25 AS Decimal(18, 2)), CAST(N'2022-09-24T09:31:51.317' AS DateTime), 3)
INSERT [dbo].[Urun] ([Id], [Adi], [ParcaNo], [StokAdedi], [BirimFiyati], [EklenmeTarihi], [KategoriId]) VALUES (2, N'Vestel Mikrodalga Fırın', N'BA22222222', 500, CAST(2500.00 AS Decimal(18, 2)), CAST(N'2020-09-24T17:59:59.000' AS DateTime), 3)
INSERT [dbo].[Urun] ([Id], [Adi], [ParcaNo], [StokAdedi], [BirimFiyati], [EklenmeTarihi], [KategoriId]) VALUES (3, N'iPhone 14', N'BA33333333', 250, CAST(56000.75 AS Decimal(18, 2)), CAST(N'2022-08-13T14:12:45.000' AS DateTime), 1)
INSERT [dbo].[Urun] ([Id], [Adi], [ParcaNo], [StokAdedi], [BirimFiyati], [EklenmeTarihi], [KategoriId]) VALUES (4, N'LC Waikiki T-Shirt', N'BA44444444', NULL, NULL, CAST(N'2022-09-24T09:48:23.603' AS DateTime), 2)
INSERT [dbo].[Urun] ([Id], [Adi], [ParcaNo], [StokAdedi], [BirimFiyati], [EklenmeTarihi], [KategoriId]) VALUES (5, N'Lewi''s', N'BA55555555', 5000, CAST(500.00 AS Decimal(18, 2)), CAST(N'2022-09-24T09:58:10.543' AS DateTime), 2)
INSERT [dbo].[Urun] ([Id], [Adi], [ParcaNo], [StokAdedi], [BirimFiyati], [EklenmeTarihi], [KategoriId]) VALUES (6, N'Mavi Gömlek', N'BA66666666', 0, CAST(300.00 AS Decimal(18, 2)), CAST(N'2022-09-24T10:00:01.027' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[Urun] OFF
GO
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (1, 1)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (1, 2)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (2, 1)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (2, 2)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (3, 1)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (3, 2)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (4, 2)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (4, 3)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (5, 2)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (5, 3)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (6, 2)
INSERT [dbo].[UrunSube] ([UrunId], [SubeId]) VALUES (6, 3)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [uqKategoriAdi]    Script Date: 24.09.2022 10:41:46 ******/
ALTER TABLE [dbo].[Kategori] ADD  CONSTRAINT [uqKategoriAdi] UNIQUE NONCLUSTERED 
(
	[Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idxUrunAdi]    Script Date: 24.09.2022 10:41:46 ******/
CREATE NONCLUSTERED INDEX [idxUrunAdi] ON [dbo].[Urun]
(
	[Adi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Urun]  WITH CHECK ADD  CONSTRAINT [FK_Urun_Kategori] FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategori] ([Id])
GO
ALTER TABLE [dbo].[Urun] CHECK CONSTRAINT [FK_Urun_Kategori]
GO
ALTER TABLE [dbo].[UrunSube]  WITH CHECK ADD  CONSTRAINT [FK_UrunSube_Sube] FOREIGN KEY([SubeId])
REFERENCES [dbo].[Sube] ([Id])
GO
ALTER TABLE [dbo].[UrunSube] CHECK CONSTRAINT [FK_UrunSube_Sube]
GO
ALTER TABLE [dbo].[UrunSube]  WITH CHECK ADD  CONSTRAINT [FK_UrunSube_Urun] FOREIGN KEY([UrunId])
REFERENCES [dbo].[Urun] ([Id])
GO
ALTER TABLE [dbo].[UrunSube] CHECK CONSTRAINT [FK_UrunSube_Urun]
GO
USE [master]
GO
ALTER DATABASE [UrunYonetim] SET  READ_WRITE 
GO