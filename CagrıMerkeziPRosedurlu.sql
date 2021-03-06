USE [master]
GO
/****** Object:  Database [CagrıMerkezi]    Script Date: 23.04.2019 22:18:11 ******/
CREATE DATABASE [CagrıMerkezi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CagrıMerkezi', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CagrıMerkezi.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CagrıMerkezi_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CagrıMerkezi_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CagrıMerkezi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CagrıMerkezi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CagrıMerkezi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET ARITHABORT OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CagrıMerkezi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CagrıMerkezi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CagrıMerkezi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CagrıMerkezi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET RECOVERY FULL 
GO
ALTER DATABASE [CagrıMerkezi] SET  MULTI_USER 
GO
ALTER DATABASE [CagrıMerkezi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CagrıMerkezi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CagrıMerkezi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CagrıMerkezi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CagrıMerkezi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [CagrıMerkezi]
GO
/****** Object:  Table [dbo].[Birimler]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Birimler](
	[BirimNo] [int] IDENTITY(1,1) NOT NULL,
	[BirimAdi] [varchar](50) NULL,
	[BirimMüdürü] [varchar](50) NULL,
	[ŞubeNo] [int] NULL,
 CONSTRAINT [PK_Birimler] PRIMARY KEY CLUSTERED 
(
	[BirimNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CGörevli]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CGörevli](
	[CGorevliNo] [int] IDENTITY(1,1) NOT NULL,
	[CAdSoyad] [varchar](50) NULL,
	[Mezuniyet] [varchar](50) NULL,
	[VardiyaDurumu] [varchar](50) NULL,
	[HaftalikCalismaPlani] [varchar](50) NULL,
 CONSTRAINT [PK_CGörevli] PRIMARY KEY CLUSTERED 
(
	[CGorevliNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kampanya]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kampanya](
	[KampanyaNo] [int] IDENTITY(1,1) NOT NULL,
	[TarifeNo] [int] NULL,
	[KAdi] [varchar](50) NULL,
	[KSüresi] [varchar](50) NULL,
	[KUcreti] [money] NULL,
 CONSTRAINT [PK_Kampanya] PRIMARY KEY CLUSTERED 
(
	[KampanyaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Kayıt]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Kayıt](
	[KayıtNo] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [int] NULL,
	[GorevliNo] [int] NULL,
	[KayıtSuresi] [varchar](50) NULL,
	[KayıtTarihi] [nvarchar](50) NULL,
	[Acıklama] [varchar](50) NULL,
	[BirimNo] [int] NULL,
 CONSTRAINT [PK_Kayıt] PRIMARY KEY CLUSTERED 
(
	[KayıtNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Musteriler]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Musteriler](
	[MusteriNo] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [varchar](50) NULL,
	[Türü] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[Adres] [varchar](50) NULL,
	[Puan] [int] NULL,
 CONSTRAINT [PK_Musteriler] PRIMARY KEY CLUSTERED 
(
	[MusteriNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Odemeler]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Odemeler](
	[OdemeNo] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [int] NULL,
	[Tipi] [varchar](50) NULL,
	[OdemeTarihi] [nvarchar](50) NULL,
	[OdemeTutarı] [money] NULL,
	[OdemeGeciktirmeDurumu] [int] NULL,
	[OdemeGeciktirmeFaizi] [int] NULL,
 CONSTRAINT [PK_Odemeler] PRIMARY KEY CLUSTERED 
(
	[OdemeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subeler]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subeler](
	[ŞubeNo] [int] IDENTITY(1,1) NOT NULL,
	[ŞubeAdi] [varchar](50) NULL,
	[Şubeİlce] [varchar](50) NULL,
	[ŞubeYetkilisi] [varchar](50) NULL,
 CONSTRAINT [PK_Subeler] PRIMARY KEY CLUSTERED 
(
	[ŞubeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tarifeler]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tarifeler](
	[TarifeNo] [int] IDENTITY(1,1) NOT NULL,
	[MusteriNo] [int] NULL,
	[TAd] [varchar](50) NULL,
	[TDurum] [varchar](50) NULL,
	[TUcret] [money] NULL,
	[BaslangicTarihi] [nvarchar](50) NULL,
	[BitisTarihi] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tarifeler] PRIMARY KEY CLUSTERED 
(
	[TarifeNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Birimler] ON 

INSERT [dbo].[Birimler] ([BirimNo], [BirimAdi], [BirimMüdürü], [ŞubeNo]) VALUES (1, N'A Birimi', N'Defne', 1)
INSERT [dbo].[Birimler] ([BirimNo], [BirimAdi], [BirimMüdürü], [ŞubeNo]) VALUES (2, N'B Birimi', N'Bilal', 2)
INSERT [dbo].[Birimler] ([BirimNo], [BirimAdi], [BirimMüdürü], [ŞubeNo]) VALUES (3, N'C Birimi', N'Hasan', 3)
INSERT [dbo].[Birimler] ([BirimNo], [BirimAdi], [BirimMüdürü], [ŞubeNo]) VALUES (4, N'D Birimi', N'Cem', 4)
SET IDENTITY_INSERT [dbo].[Birimler] OFF
SET IDENTITY_INSERT [dbo].[CGörevli] ON 

INSERT [dbo].[CGörevli] ([CGorevliNo], [CAdSoyad], [Mezuniyet], [VardiyaDurumu], [HaftalikCalismaPlani]) VALUES (1, N'Nihal Öz', N'Lisans', N'Sabah', N', Pazartesi, Çarşamba, Cuma, Cumartesi, Perşembe')
INSERT [dbo].[CGörevli] ([CGorevliNo], [CAdSoyad], [Mezuniyet], [VardiyaDurumu], [HaftalikCalismaPlani]) VALUES (2, N'Esma Durmuş', N'Lise', N'Akşam', N', Pazartesi, Salı, Çarşamba, Cuma, Perşembe')
INSERT [dbo].[CGörevli] ([CGorevliNo], [CAdSoyad], [Mezuniyet], [VardiyaDurumu], [HaftalikCalismaPlani]) VALUES (3, N'Ali Şahin', N'Lisans', N'Akşam', N', Salı, Cuma, Cumartesi, Pazar, Perşembe')
SET IDENTITY_INSERT [dbo].[CGörevli] OFF
SET IDENTITY_INSERT [dbo].[Kampanya] ON 

INSERT [dbo].[Kampanya] ([KampanyaNo], [TarifeNo], [KAdi], [KSüresi], [KUcreti]) VALUES (1, 1, N'Konuştukça Artan Kampanya', N'5 ay', 25.0000)
INSERT [dbo].[Kampanya] ([KampanyaNo], [TarifeNo], [KAdi], [KSüresi], [KUcreti]) VALUES (2, 2, N'Konuştukça Artan Kampanya', N'2 ay', 20.0000)
INSERT [dbo].[Kampanya] ([KampanyaNo], [TarifeNo], [KAdi], [KSüresi], [KUcreti]) VALUES (3, 3, N'İnternetli Kampanya', N'2 ay', 20.0000)
INSERT [dbo].[Kampanya] ([KampanyaNo], [TarifeNo], [KAdi], [KSüresi], [KUcreti]) VALUES (4, 4, N'İnternetli Kampanya', N'2 ay', 25.0000)
SET IDENTITY_INSERT [dbo].[Kampanya] OFF
SET IDENTITY_INSERT [dbo].[Kayıt] ON 

INSERT [dbo].[Kayıt] ([KayıtNo], [MusteriNo], [GorevliNo], [KayıtSuresi], [KayıtTarihi], [Acıklama], [BirimNo]) VALUES (1, 1, 1, N'35 dakika', N'23 Nisan 2019 Salı', N'Kampanya Değişikliği', 1)
INSERT [dbo].[Kayıt] ([KayıtNo], [MusteriNo], [GorevliNo], [KayıtSuresi], [KayıtTarihi], [Acıklama], [BirimNo]) VALUES (2, 3, 2, N'30 dakika', N'11 Nisan 2019 Perşembe', N'tarife değişikliği', 2)
INSERT [dbo].[Kayıt] ([KayıtNo], [MusteriNo], [GorevliNo], [KayıtSuresi], [KayıtTarihi], [Acıklama], [BirimNo]) VALUES (3, 1, 1, N'40 dakika', N'23 Nisan 2019 Salı', N'PUK kodu öğrenme', 1)
INSERT [dbo].[Kayıt] ([KayıtNo], [MusteriNo], [GorevliNo], [KayıtSuresi], [KayıtTarihi], [Acıklama], [BirimNo]) VALUES (4, 4, 3, N'30 dakika', N'2 Nisan 2019 Salı', N'tarife değişikliği', 1)
SET IDENTITY_INSERT [dbo].[Kayıt] OFF
SET IDENTITY_INSERT [dbo].[Musteriler] ON 

INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Türü], [Telefon], [Adres], [Puan]) VALUES (1, N'Yeliz Durmuş', N'Bireysel', N'(555) 858-6545', N'Pendik', 5)
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Türü], [Telefon], [Adres], [Puan]) VALUES (2, N'Ayşegül Akbaş', N'Bireysel', N'(454) 485-8856', N'Ümraniye', 80)
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Türü], [Telefon], [Adres], [Puan]) VALUES (3, N'Yasemin Sekmen', N'Kurumsal', N'(544) 858-8568', N'Sultanbeyli', 50)
INSERT [dbo].[Musteriler] ([MusteriNo], [AdSoyad], [Türü], [Telefon], [Adres], [Puan]) VALUES (4, N'Hande Polat', N'Bireysel', N'(544) 614-8357', N'Dudullu', 25)
SET IDENTITY_INSERT [dbo].[Musteriler] OFF
SET IDENTITY_INSERT [dbo].[Odemeler] ON 

INSERT [dbo].[Odemeler] ([OdemeNo], [MusteriNo], [Tipi], [OdemeTarihi], [OdemeTutarı], [OdemeGeciktirmeDurumu], [OdemeGeciktirmeFaizi]) VALUES (1, 1, N'Kredi', N'19 Nisan 2019 Cuma', 30.0000, 3, 20)
INSERT [dbo].[Odemeler] ([OdemeNo], [MusteriNo], [Tipi], [OdemeTarihi], [OdemeTutarı], [OdemeGeciktirmeDurumu], [OdemeGeciktirmeFaizi]) VALUES (2, 2, N'Kredi', N'25 Nisan 2019 Perşembe', 25.0000, 1, 20)
INSERT [dbo].[Odemeler] ([OdemeNo], [MusteriNo], [Tipi], [OdemeTarihi], [OdemeTutarı], [OdemeGeciktirmeDurumu], [OdemeGeciktirmeFaizi]) VALUES (3, 3, N'Nakit', N'20 Nisan 2019 Cumartesi', 25.0000, 3, 25)
INSERT [dbo].[Odemeler] ([OdemeNo], [MusteriNo], [Tipi], [OdemeTarihi], [OdemeTutarı], [OdemeGeciktirmeDurumu], [OdemeGeciktirmeFaizi]) VALUES (4, 4, N'Nakit', N'25 Nisan 2019 Perşembe', 65.0000, 3, 25)
SET IDENTITY_INSERT [dbo].[Odemeler] OFF
SET IDENTITY_INSERT [dbo].[Subeler] ON 

INSERT [dbo].[Subeler] ([ŞubeNo], [ŞubeAdi], [Şubeİlce], [ŞubeYetkilisi]) VALUES (1, N'As İletişim', N'Maltepe', N'Muhammet')
INSERT [dbo].[Subeler] ([ŞubeNo], [ŞubeAdi], [Şubeİlce], [ŞubeYetkilisi]) VALUES (2, N'Veri İletişim', N'Pendik', N'Hasan')
INSERT [dbo].[Subeler] ([ŞubeNo], [ŞubeAdi], [Şubeİlce], [ŞubeYetkilisi]) VALUES (3, N'Feza İletişim', N'Kartal', N'Halil')
INSERT [dbo].[Subeler] ([ŞubeNo], [ŞubeAdi], [Şubeİlce], [ŞubeYetkilisi]) VALUES (4, N'Umut İletişim', N'Sultanbeyli', N'Muhtar')
INSERT [dbo].[Subeler] ([ŞubeNo], [ŞubeAdi], [Şubeİlce], [ŞubeYetkilisi]) VALUES (5, N'Jet İletişim', N'Sarıyer', N'Yiğit')
SET IDENTITY_INSERT [dbo].[Subeler] OFF
SET IDENTITY_INSERT [dbo].[Tarifeler] ON 

INSERT [dbo].[Tarifeler] ([TarifeNo], [MusteriNo], [TAd], [TDurum], [TUcret], [BaslangicTarihi], [BitisTarihi]) VALUES (1, 1, N'Genç Tarife', N'Faturalı', 30.0000, N'19 Nisan 2019 Cuma', N'19 Nisan 2020 Pazar')
INSERT [dbo].[Tarifeler] ([TarifeNo], [MusteriNo], [TAd], [TDurum], [TUcret], [BaslangicTarihi], [BitisTarihi]) VALUES (2, 2, N'Genç Tarife', N'Faturasız', 24.0000, N'19 Nisan 2019 Cuma', N'19 Mayıs 2019 Pazar')
INSERT [dbo].[Tarifeler] ([TarifeNo], [MusteriNo], [TAd], [TDurum], [TUcret], [BaslangicTarihi], [BitisTarihi]) VALUES (3, 3, N'Uçan Tarife', N'Faturasız', 28.0000, N'19 Nisan 2019 Cuma', N'19 Mayıs 2019 Pazar')
INSERT [dbo].[Tarifeler] ([TarifeNo], [MusteriNo], [TAd], [TDurum], [TUcret], [BaslangicTarihi], [BitisTarihi]) VALUES (4, 4, N'Uçan Tarife', N'Faturalı', 35.0000, N'19 Nisan 2019 Cuma', N'19 Nisan 2020 Pazar')
SET IDENTITY_INSERT [dbo].[Tarifeler] OFF
ALTER TABLE [dbo].[Birimler]  WITH CHECK ADD  CONSTRAINT [FK_Birimler_Subeler] FOREIGN KEY([ŞubeNo])
REFERENCES [dbo].[Subeler] ([ŞubeNo])
GO
ALTER TABLE [dbo].[Birimler] CHECK CONSTRAINT [FK_Birimler_Subeler]
GO
ALTER TABLE [dbo].[Kampanya]  WITH CHECK ADD  CONSTRAINT [FK_Kampanya_Tarifeler] FOREIGN KEY([TarifeNo])
REFERENCES [dbo].[Tarifeler] ([TarifeNo])
GO
ALTER TABLE [dbo].[Kampanya] CHECK CONSTRAINT [FK_Kampanya_Tarifeler]
GO
ALTER TABLE [dbo].[Kayıt]  WITH CHECK ADD  CONSTRAINT [FK_Kayıt_Birimler] FOREIGN KEY([BirimNo])
REFERENCES [dbo].[Birimler] ([BirimNo])
GO
ALTER TABLE [dbo].[Kayıt] CHECK CONSTRAINT [FK_Kayıt_Birimler]
GO
ALTER TABLE [dbo].[Kayıt]  WITH CHECK ADD  CONSTRAINT [FK_Kayıt_CGörevli] FOREIGN KEY([GorevliNo])
REFERENCES [dbo].[CGörevli] ([CGorevliNo])
GO
ALTER TABLE [dbo].[Kayıt] CHECK CONSTRAINT [FK_Kayıt_CGörevli]
GO
ALTER TABLE [dbo].[Kayıt]  WITH CHECK ADD  CONSTRAINT [FK_Kayıt_Musteriler] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[Musteriler] ([MusteriNo])
GO
ALTER TABLE [dbo].[Kayıt] CHECK CONSTRAINT [FK_Kayıt_Musteriler]
GO
ALTER TABLE [dbo].[Odemeler]  WITH CHECK ADD  CONSTRAINT [FK_Odemeler_Musteriler] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[Musteriler] ([MusteriNo])
GO
ALTER TABLE [dbo].[Odemeler] CHECK CONSTRAINT [FK_Odemeler_Musteriler]
GO
ALTER TABLE [dbo].[Tarifeler]  WITH CHECK ADD  CONSTRAINT [FK_Tarifeler_Musteriler] FOREIGN KEY([MusteriNo])
REFERENCES [dbo].[Musteriler] ([MusteriNo])
GO
ALTER TABLE [dbo].[Tarifeler] CHECK CONSTRAINT [FK_Tarifeler_Musteriler]
GO
/****** Object:  StoredProcedure [dbo].[AdaGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AdaGoreAra]
@ad varchar(50)
as
select *from Musteriler where AdSoyad=@ad

GO
/****** Object:  StoredProcedure [dbo].[BirimAdAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BirimAdAra]
@mad varchar(50)
as
select *from Birimler where  BirimAdi=@mad

GO
/****** Object:  StoredProcedure [dbo].[BirimEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BirimEkle]
@bAdi varchar(50),
@BirimMüdürü varchar(50),
@sno int
as
insert into Birimler(BirimAdi,BirimMüdürü,ŞubeNo)
values(@bAdi,@BirimMüdürü,@sno)

GO
/****** Object:  StoredProcedure [dbo].[BirimListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BirimListele]
as
select *from Birimler

GO
/****** Object:  StoredProcedure [dbo].[BirimSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[BirimSil]
@bno int
as
delete from Birimler where BirimNo=@bno

GO
/****** Object:  StoredProcedure [dbo].[BirimŞubeNoAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BirimŞubeNoAra]
@no int
as
select *from Birimler where ŞubeNo=@no

GO
/****** Object:  StoredProcedure [dbo].[BirimYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[BirimYenile]
@bno int,
@bAdi varchar(50),
@BirimMüdürü varchar(50),
@sno int
as begin
update Birimler set BirimAdi=@bAdi,BirimMüdürü=@BirimMüdürü,ŞubeNo=@sno where BirimNo=@bno
end

GO
/****** Object:  StoredProcedure [dbo].[GorevliEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevliEkle]
@AdSoyad varchar(50),
@Mezuniyet varchar(50),
@vardiya varchar(50),
@cplan varchar(50)
as
insert into CGörevli(CAdSoyad,Mezuniyet,VardiyaDurumu,HaftalikCalismaPlani)
values(@AdSoyad,@Mezuniyet,@vardiya,@cplan)

GO
/****** Object:  StoredProcedure [dbo].[GorevliSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevliSil]
@gno int
as
delete from CGörevli where CGorevliNo=@gno

GO
/****** Object:  StoredProcedure [dbo].[GorevListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GorevListele]
as
select *from CGörevli

GO
/****** Object:  StoredProcedure [dbo].[GorevliYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GorevliYenile]
@GorevliNo int,
@AdSoyad varchar(50),
@Mezuniyet varchar(50),
@vardiya varchar(50),
@cplan varchar(50)
as
update CGörevli set CAdSoyad=@AdSoyad,Mezuniyet=@Mezuniyet,VardiyaDurumu=@vardiya,
HaftalikCalismaPlani=@cplan where CGorevliNo=@GorevliNo

GO
/****** Object:  StoredProcedure [dbo].[GVardiyaGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GVardiyaGoreAra]
@durum varchar(50)
as
select *from CGörevli where VardiyaDurumu=@durum

GO
/****** Object:  StoredProcedure [dbo].[KAdaGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KAdaGoreAra]
@kad varchar(50)
as
select *from Kampanya where KAdi=@kad

GO
/****** Object:  StoredProcedure [dbo].[KampanyaEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KampanyaEkle]
@TarifeNo int,
@ad varchar(50),
@sure varchar(50),
@ucret money
as
insert into Kampanya(TarifeNo,KAdi,KSüresi,KUcreti)values(@TarifeNo,@ad,@sure,@ucret)

GO
/****** Object:  StoredProcedure [dbo].[KampanyaListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[KampanyaListele]
as
select *from Kampanya

GO
/****** Object:  StoredProcedure [dbo].[KampanyaSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KampanyaSil]
@KampanyaNo int
as
delete from Kampanya where KampanyaNo=@KampanyaNo

GO
/****** Object:  StoredProcedure [dbo].[KampanyaYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KampanyaYenile]
@KampanyaNo int,
@TarifeNo int,
@ad varchar(50),
@sure varchar(50),
@ucret money
as
update Kampanya set TarifeNo=@TarifeNo,KAdi=@ad,KSüresi=@sure,KUcreti=@ucret where KampanyaNo=@KampanyaNo

GO
/****** Object:  StoredProcedure [dbo].[KayıtGorevliAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KayıtGorevliAra]
@gid int
as
select *from Kayıt where GorevliNo=@gid
GO
/****** Object:  StoredProcedure [dbo].[KayıtMusteriAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KayıtMusteriAra]
@mid int
as
select *from Kayıt where  MusteriNo=@mid
GO
/****** Object:  StoredProcedure [dbo].[KayitEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KayitEkle]
@mno int,
@gno int,
@sure varchar(50),
@tarih nvarchar(50),
@aciklama varchar(50),
@bno int
as
insert into Kayıt(MusteriNo,GorevliNo,KayıtSuresi,KayıtTarihi,Acıklama,BirimNo)
values(@mno,@gno,@sure,@tarih,@aciklama,@bno)

GO
/****** Object:  StoredProcedure [dbo].[KayitListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[KayitListele]
as 
select *from Kayıt

GO
/****** Object:  StoredProcedure [dbo].[KayitSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[KayitSil]
@kno int
as
delete from Kayıt where KayıtNo=@kno

GO
/****** Object:  StoredProcedure [dbo].[KayitYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[KayitYenile]
@kno int,
@mno int,
@gno int,
@sure varchar(50),
@tarih nvarchar(50),
@aciklama varchar(50),
@bno int
as begin
update Kayıt set MusteriNo=@mno,GorevliNo=@gno,KayıtSuresi=@sure,KayıtTarihi=@tarih,Acıklama=@aciklama,
BirimNo=@bno where KayıtNo=@kno
end

GO
/****** Object:  StoredProcedure [dbo].[MAdGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MAdGoreAra]
@mad varchar(50)
as
select *from CGörevli where  CAdSoyad=@mad

GO
/****** Object:  StoredProcedure [dbo].[MNoGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MNoGoreAra]
@mno int
as
select *from Odemeler where MusteriNo=@mno

GO
/****** Object:  StoredProcedure [dbo].[MusteriEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriEkle]
@Adsoyad varchar(50),
@Turu varchar(50),
@telefon varchar(50),
@adres varchar(50),
@puan int
as
insert into Musteriler(AdSoyad,Türü,Telefon,Adres,Puan)
values(@Adsoyad,@Turu,@telefon,@adres,@puan)

GO
/****** Object:  StoredProcedure [dbo].[MusteriListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriListele]
as 
select *from Musteriler

GO
/****** Object:  StoredProcedure [dbo].[MusteriSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriSil]
@no int
as
delete from Musteriler where MusteriNo=@no

GO
/****** Object:  StoredProcedure [dbo].[MusteriYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[MusteriYenile]
@MusteriNo int,
@Adsoyad varchar(50),
@Turu varchar(50),
@telefon varchar(50),
@adres varchar(50),
@puan int
as begin
update Musteriler set AdSoyad=@Adsoyad,Türü=@Turu,Telefon=@telefon,Adres=@adres,
Puan=@puan where MusteriNo=@MusteriNo
end

GO
/****** Object:  StoredProcedure [dbo].[OdemeEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OdemeEkle]
@MusteriNo int,
@tip varchar(50),
@tarih nvarchar(50),
@tutar money,
@gecikme int,
@faiz int
as
insert into Odemeler(MusteriNo,Tipi,OdemeTarihi,OdemeTutarı,OdemeGeciktirmeDurumu,OdemeGeciktirmeFaizi)
values(@MusteriNo,@tip,@tarih,@tutar,@gecikme,@faiz)

GO
/****** Object:  StoredProcedure [dbo].[OdemeListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[OdemeListele]
as
select *from Odemeler

GO
/****** Object:  StoredProcedure [dbo].[OdemeSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OdemeSil]
@no int
as
delete from Odemeler where OdemeNo=@no

GO
/****** Object:  StoredProcedure [dbo].[OdemeYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OdemeYenile]
@OdemeNo int,
@MusteriNo int,
@tip varchar(50),
@tarih nvarchar(50),
@tutar money,
@gecikme int,
@faiz int
as
update Odemeler set MusteriNo=@MusteriNo,Tipi=@tip,OdemeTarihi=@tarih,OdemeTutarı=@tutar,
OdemeGeciktirmeDurumu=@gecikme,OdemeGeciktirmeFaizi=@faiz where OdemeNo=@OdemeNo

GO
/****** Object:  StoredProcedure [dbo].[OtipiGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[OtipiGoreAra]
@otip varchar(50)
as
select *from Odemeler where Tipi=@otip

GO
/****** Object:  StoredProcedure [dbo].[SubeAdAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SubeAdAra]
@mad varchar(50)
as
select *from Subeler where  ŞubeAdi=@mad

GO
/****** Object:  StoredProcedure [dbo].[SubeEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeEkle]
@sAdi varchar(50),
@sİlce varchar(50),
@sYetkili varchar(50)
as
insert into Subeler(ŞubeAdi,Şubeİlce,ŞubeYetkilisi)
values(@sAdi,@sİlce,@sYetkili)

GO
/****** Object:  StoredProcedure [dbo].[SubeİlceAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeİlceAra]
@durum varchar(50)
as
select *from Subeler where Şubeİlce=@durum

GO
/****** Object:  StoredProcedure [dbo].[SubeListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[SubeListele]
as
select *from Subeler

GO
/****** Object:  StoredProcedure [dbo].[SubeSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeSil]
@sno int
as
delete from Subeler where ŞubeNo=@sno

GO
/****** Object:  StoredProcedure [dbo].[SubeYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[SubeYenile]
@sno int,
@sAdi varchar(50),
@sİlce varchar(50),
@sYetkili varchar(50)
as begin
update Subeler set ŞubeAdi=@sAdi,Şubeİlce=@sİlce,ŞubeYetkilisi=@sYetkili where ŞubeNo=@sno
end

GO
/****** Object:  StoredProcedure [dbo].[TAdaGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TAdaGoreAra]
@ad varchar(50)
as
select *from Tarifeler where TAd=@ad

GO
/****** Object:  StoredProcedure [dbo].[TarifeEkle]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TarifeEkle]
@MusteriNo int,
@ad varchar(50),
@durum varchar(50),
@ucret money,
@baslangic nvarchar(50),
@bitis nvarchar(50)
as
insert into Tarifeler(MusteriNo,TAd,TDurum,TUcret,BaslangicTarihi,BitisTarihi)
values(@MusteriNo,@ad,@durum,@ucret,@baslangic,@bitis)

GO
/****** Object:  StoredProcedure [dbo].[TarifeListele]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TarifeListele]
as
select *from Tarifeler

GO
/****** Object:  StoredProcedure [dbo].[TarifeSil]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TarifeSil]
@TarifeNo int
as
delete from Tarifeler where TarifeNo=@TarifeNo

GO
/****** Object:  StoredProcedure [dbo].[TarifeYenile]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TarifeYenile]
@TarifeNo int,
@MusteriNo int,
@ad varchar(50),
@durum varchar(50),
@ucret money,
@baslangic nvarchar(50),
@bitis nvarchar(50)
as begin
update Tarifeler set MusteriNo=@MusteriNo,TAd=@ad,TDurum=@durum,TUcret=@ucret,BaslangicTarihi=@baslangic,
BitisTarihi=@bitis where TarifeNo=@TarifeNo
end

GO
/****** Object:  StoredProcedure [dbo].[TDurumeGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TDurumeGoreAra]
@tur varchar(50)
as
select *from Tarifeler where TDurum=@tur

GO
/****** Object:  StoredProcedure [dbo].[TNoGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TNoGoreAra]
@tno int
as
select *from Kampanya where TarifeNo=@tno

GO
/****** Object:  StoredProcedure [dbo].[TureGoreAra]    Script Date: 23.04.2019 22:18:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[TureGoreAra]
@tur varchar(50)
as
select *from Musteriler where Türü=@tur

GO
USE [master]
GO
ALTER DATABASE [CagrıMerkezi] SET  READ_WRITE 
GO
