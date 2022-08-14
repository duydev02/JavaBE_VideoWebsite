USE [master]
GO
/****** Object:  Database [asmjava4]    Script Date: 8/13/2022 12:01:42 PM ******/
CREATE DATABASE [asmjava4]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'asmjava4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\asmjava4.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'asmjava4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\asmjava4_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [asmjava4] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [asmjava4].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [asmjava4] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [asmjava4] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [asmjava4] SET ARITHABORT OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [asmjava4] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [asmjava4] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [asmjava4] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [asmjava4] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [asmjava4] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [asmjava4] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [asmjava4] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [asmjava4] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [asmjava4] SET  ENABLE_BROKER 
GO
ALTER DATABASE [asmjava4] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [asmjava4] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [asmjava4] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [asmjava4] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [asmjava4] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [asmjava4] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [asmjava4] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [asmjava4] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [asmjava4] SET  MULTI_USER 
GO
ALTER DATABASE [asmjava4] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [asmjava4] SET DB_CHAINING OFF 
GO
ALTER DATABASE [asmjava4] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [asmjava4] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [asmjava4] SET DELAYED_DURABILITY = DISABLED 
GO
USE [asmjava4]
GO
/****** Object:  Table [dbo].[history]    Script Date: 8/13/2022 12:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[history](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[videoId] [int] NULL,
	[viewedDate] [datetime] NOT NULL DEFAULT (getdate()),
	[isLiked] [bit] NOT NULL DEFAULT ((0)),
	[likedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user]    Script Date: 8/13/2022 12:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](10) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[isAdmin] [bit] NOT NULL DEFAULT ((0)),
	[isActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[video]    Script Date: 8/13/2022 12:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[video](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[href] [varchar](50) NOT NULL,
	[poster] [varchar](255) NULL,
	[views] [int] NOT NULL DEFAULT ((0)),
	[shares] [int] NOT NULL DEFAULT ((0)),
	[description] [nvarchar](255) NOT NULL,
	[isActive] [bit] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[history] ON 

INSERT [dbo].[history] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (1, 2, 1, CAST(N'2022-02-25 18:40:21.593' AS DateTime), 1, CAST(N'2022-02-25 18:40:21.593' AS DateTime))
INSERT [dbo].[history] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (2, 2, 3, CAST(N'2022-02-25 18:40:21.593' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (5, 1, 5, CAST(N'2022-08-13 10:25:06.937' AS DateTime), 0, NULL)
INSERT [dbo].[history] ([id], [userId], [videoId], [viewedDate], [isLiked], [likedDate]) VALUES (6, 1, 2, CAST(N'2022-08-13 10:25:31.770' AS DateTime), 1, CAST(N'2022-08-13 10:25:34.750' AS DateTime))
SET IDENTITY_INSERT [dbo].[history] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (1, N'duyhm', N'123', N'minhduy12581@gmail.com', 1, 1)
INSERT [dbo].[user] ([id], [username], [password], [email], [isAdmin], [isActive]) VALUES (2, N'uyenttk', N'123', N'kimuyen13.08@gmail.com', 0, 1)
SET IDENTITY_INSERT [dbo].[user] OFF
SET IDENTITY_INSERT [dbo].[video] ON 

INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (1, N'Đường Tôi Chở Em Về (Lofi Ver.)', N'flREuRJCdxw', N'https://img.youtube.com/vi/flREuRJCdxw/maxresdefault.jpg', 0, 0, N'Đường Tôi Chở Em Về (Lofi Ver.) - buitruonglinh x Freak D', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (2, N'SƠN TÙNG M-TP | MUỘN RỒI MÀ SAO CÒN', N'xypzmu5mMPY', N'https://img.youtube.com/vi/xypzmu5mMPY/maxresdefault.jpg', 0, 0, N'SƠN TÙNG M-TP | MUỘN RỒI MÀ SAO CÒN | OFFICIAL MUSIC VIDEO', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (3, N'BƯỚC QUA MÙA CÔ ĐƠN / Vũ', N'n6Pnzi6r9NU', N'https://img.youtube.com/vi/n6Pnzi6r9NU/maxresdefault.jpg', 0, 0, N'BƯỚC QUA MÙA CÔ ĐƠN / Vũ. (Official MV)', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (4, N'LỖI TẠI ANH - ALEX LAM', N'g19gP0Waxc8', N'https://img.youtube.com/vi/g19gP0Waxc8/maxresdefault.jpg', 0, 0, N'LỖI TẠI ANH - ALEX LAM', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (5, N'LẠ LÙNG / Vũ.', N'F5tS5m86bOI', N'https://img.youtube.com/vi/F5tS5m86bOI/maxresdefault.jpg', 0, 0, N'LẠ LÙNG / Vũ. (Original)', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (6, N'3107 - W/n', N'V5GS5ANG96M', N'https://img.youtube.com/vi/V5GS5ANG96M/maxresdefault.jpg', 0, 0, N'3107 - W/n ( Official Video ) ft. Nâu, Duongg', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (7, N'HongKong1 | OFFICIAL MV', N't7tZFq29lis', N'https://img.youtube.com/vi/t7tZFq29lis/maxresdefault.jpg', 0, 0, N'HongKong1 | OFFICIAL MV | Nguyễn Trọng Tài x San Ji x Double X', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (8, N'QUÂN A.P | BÔNG HOA ĐẸP NHẤT', N'fTXd-DpN3AI', N'https://img.youtube.com/vi/fTXd-DpN3AI/maxresdefault.jpg', 0, 0, N'QUÂN A.P | BÔNG HOA ĐẸP NHẤT | OFFICIAL MUSIC VIDEO', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (9, N'Thức Giấc - Da LAB', N'zB5Ao7Q71Jo', N'https://img.youtube.com/vi/zB5Ao7Q71Jo/maxresdefault.jpg', 0, 0, N'Thức Giấc - Da LAB「Lo - Fi Ver. by 1 9 6 7」/ Audio Lyrics', 1)
INSERT [dbo].[video] ([id], [title], [href], [poster], [views], [shares], [description], [isActive]) VALUES (10, N'Dù Cho Mai Về Sau (Lofi Ver.)', N'KCXOWNl2iCM', N'https://img.youtube.com/vi/KCXOWNl2iCM/maxresdefault.jpg', 0, 0, N'Dù Cho Mai Về Sau (Lofi Ver.) - buitruonglinh x Freak D', 1)
SET IDENTITY_INSERT [dbo].[video] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__user__AB6E6164C2610AFA]    Script Date: 8/13/2022 12:01:42 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__user__F3DBC5728EA1DCF4]    Script Date: 8/13/2022 12:01:42 PM ******/
ALTER TABLE [dbo].[user] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__video__7FF10F0520453657]    Script Date: 8/13/2022 12:01:42 PM ******/
ALTER TABLE [dbo].[video] ADD UNIQUE NONCLUSTERED 
(
	[href] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[history]  WITH CHECK ADD FOREIGN KEY([videoId])
REFERENCES [dbo].[video] ([id])
GO
/****** Object:  StoredProcedure [dbo].[sp_selectUsersLikedVideoByVideoHref]    Script Date: 8/13/2022 12:01:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sp_selectUsersLikedVideoByVideoHref](@videoHref varchar(50))
as begin
	select
		u.username, u.email
	from
		video v left join history h on v.id = h.videoId
			left join [user] u on h.userId = u.id
	where
		v.href = @videoHref and u.isActive = 1 and v.isActive = 1 and h.isLiked = 1
end

GO
USE [master]
GO
ALTER DATABASE [asmjava4] SET  READ_WRITE 
GO
