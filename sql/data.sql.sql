USE [master]
GO
/****** Object:  Database [VaccineDb]    Script Date: 8/5/2024 4:42:34 PM ******/
CREATE DATABASE [VaccineDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VaccineDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VaccineDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VaccineDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\VaccineDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VaccineDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VaccineDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VaccineDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VaccineDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VaccineDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VaccineDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [VaccineDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VaccineDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VaccineDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VaccineDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VaccineDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VaccineDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VaccineDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VaccineDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VaccineDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VaccineDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VaccineDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VaccineDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VaccineDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VaccineDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VaccineDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VaccineDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [VaccineDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VaccineDb] SET RECOVERY FULL 
GO
ALTER DATABASE [VaccineDb] SET  MULTI_USER 
GO
ALTER DATABASE [VaccineDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VaccineDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VaccineDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VaccineDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'VaccineDb', N'ON'
GO
USE [VaccineDb]
GO
/****** Object:  Table [dbo].[injection_result]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[injection_result](
	[injection_result_id] [varchar](36) NOT NULL,
	[injection_date] [date] NULL,
	[next_injection_date] [date] NULL,
	[number_of_injection] [varchar](100) NULL,
	[place_id] [int] NULL,
	[prevention_id] [int] NULL,
	[users_id] [int] NULL,
	[vaccine_id] [varchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[injection_result_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[injection_schedule]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[injection_schedule](
	[injection_schedule_id] [varchar](36) NOT NULL,
	[description] [varchar](1000) NULL,
	[end_date] [date] NULL,
	[place] [varchar](255) NULL,
	[start_date] [date] NULL,
	[vaccine_id] [varchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[injection_schedule_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[news]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[news](
	[news_id] [varchar](36) NOT NULL,
	[content] [nvarchar](4000) NULL,
	[post_date] [date] NULL,
	[preview] [nvarchar](1000) NULL,
	[title] [nvarchar](300) NULL,
	[news_type_id] [varchar](36) NULL,
PRIMARY KEY CLUSTERED 
(
	[news_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[news_type]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[news_type](
	[news_type_id] [varchar](36) NOT NULL,
	[description] [varchar](10) NULL,
	[news_type_name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[news_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[place]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[place](
	[place_id] [int] IDENTITY(1,1) NOT NULL,
	[place_address] [varchar](255) NULL,
	[place_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[place_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[prevention]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[prevention](
	[prevention_id] [int] IDENTITY(1,1) NOT NULL,
	[prevention_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[prevention_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[user_detail]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[user_detail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[code] [varchar](36) NULL,
	[date_of_birth] [date] NULL,
	[email] [varchar](100) NULL,
	[full_name] [varchar](100) NULL,
	[gender] [int] NULL,
	[identity_card] [varchar](12) NULL,
	[image] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
	[position] [varchar](100) NULL,
	[working_place] [varchar](255) NULL,
	[users_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[users]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[users](
	[users_id] [int] IDENTITY(1,1) NOT NULL,
	[password] [varchar](255) NULL,
	[role] [varchar](36) NULL,
	[username] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[users_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vaccine]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vaccine](
	[vaccine_id] [varchar](36) NOT NULL,
	[contraindication] [varchar](200) NULL,
	[indication] [varchar](200) NULL,
	[number_of_injection] [int] NULL,
	[origin] [varchar](50) NULL,
	[time_begin_next_injection] [date] NULL,
	[time_end_next_injection] [date] NULL,
	[usage] [varchar](200) NULL,
	[vaccine_name] [varchar](100) NULL,
	[vaccine_status] [varchar](255) NULL,
	[vaccine_type_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[vaccine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vaccine_type]    Script Date: 8/5/2024 4:42:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vaccine_type](
	[vaccine_type_id] [varchar](50) NOT NULL,
	[description] [varchar](200) NULL,
	[vaccine_type_name] [varchar](50) NULL,
	[vaccine_type_status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[vaccine_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[injection_schedule] ([injection_schedule_id], [description], [end_date], [place], [start_date], [vaccine_id]) VALUES (N'1234567', N'sdcsadd', CAST(N'2024-03-17' AS Date), N'ádcwda', CAST(N'2024-03-16' AS Date), N'12345678')
INSERT [dbo].[injection_schedule] ([injection_schedule_id], [description], [end_date], [place], [start_date], [vaccine_id]) VALUES (N'4323543', N'', CAST(N'2024-08-08' AS Date), N'Hà N?i', CAST(N'2024-08-07' AS Date), N'342332')
INSERT [dbo].[injection_schedule] ([injection_schedule_id], [description], [end_date], [place], [start_date], [vaccine_id]) VALUES (N'543234', N'', CAST(N'2024-08-23' AS Date), N'B?nh vi?n Thu?n Thành B?c Ninh', CAST(N'2024-08-22' AS Date), N'532354')
GO
INSERT [dbo].[news] ([news_id], [content], [post_date], [preview], [title], [news_type_id]) VALUES (N'bc901b78-c222-43a4-8393-f77cee48ecff', N'ádfecadcds', CAST(N'2024-03-17' AS Date), N'hiệu quả xuất sắc', N'phòng ngừa thành công', NULL)
GO
SET IDENTITY_INSERT [dbo].[user_detail] ON 

INSERT [dbo].[user_detail] ([id], [address], [code], [date_of_birth], [email], [full_name], [gender], [identity_card], [image], [phone], [position], [working_place], [users_id]) VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user_detail] ([id], [address], [code], [date_of_birth], [email], [full_name], [gender], [identity_card], [image], [phone], [position], [working_place], [users_id]) VALUES (2, N'B?c Ninh', N'namcv2', CAST(N'2024-03-04' AS Date), N'caovanquyena11@gmail.com', N'Cao Van Nam', 0, NULL, N'', N'0375549373', N'fadsceec', N'bac ninh', 2)
INSERT [dbo].[user_detail] ([id], [address], [code], [date_of_birth], [email], [full_name], [gender], [identity_card], [image], [phone], [position], [working_place], [users_id]) VALUES (3, N'B?c Ninh', NULL, CAST(N'2024-03-11' AS Date), N'tranthuchdic@gmail.com', N'Cao Van Quyen', 0, N'1234567', NULL, N'0375549373', NULL, NULL, 3)
INSERT [dbo].[user_detail] ([id], [address], [code], [date_of_birth], [email], [full_name], [gender], [identity_card], [image], [phone], [position], [working_place], [users_id]) VALUES (4, N'Hà N?i', N'namcv4', CAST(N'2024-06-17' AS Date), N'caovanquyena11@gmail.com', N'Cao Van Nam', 0, NULL, N'', N'0375549373', N'fresher', N'Hà N?i', 4)
INSERT [dbo].[user_detail] ([id], [address], [code], [date_of_birth], [email], [full_name], [gender], [identity_card], [image], [phone], [position], [working_place], [users_id]) VALUES (5, N'TP HCM', NULL, CAST(N'2024-07-30' AS Date), N'caovanquyena11@gmail.com', N'Tr?n Th? Hu?', 0, N'1234567', NULL, N'0375549373', NULL, NULL, 5)
SET IDENTITY_INSERT [dbo].[user_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([users_id], [password], [role], [username]) VALUES (1, N'$2a$10$O2vsG7VNEqBRu6k2S/6fc.Xcy9oHeak.bhK17RzMV9jlfoN3gnzDW', N'ADMIN', N'admin')
INSERT [dbo].[users] ([users_id], [password], [role], [username]) VALUES (2, N'$2a$10$7q8yqotuTwvCzRJlHRUtJulTcqpmUBsaLaz3RUYw3aR3D8KZSWVFW', N'EMPLOYEE', N'QuyenCV3')
INSERT [dbo].[users] ([users_id], [password], [role], [username]) VALUES (3, N'$2a$10$On0I7JDjm38nzPVtQlwMAunuNZKiCn..BL0c3Lu9QI.IlOQz/kwKu', N'CUSTOMER', N'memberA')
INSERT [dbo].[users] ([users_id], [password], [role], [username]) VALUES (4, N'$2a$10$4yb2A2RCAKYCovfenEUwcuOtNK6CeTkQD6bbcexyT0ZN1kFQFEjDy', N'EMPLOYEE', N'caovannam')
INSERT [dbo].[users] ([users_id], [password], [role], [username]) VALUES (5, N'$2a$10$wzBMIjG2RjY3lO5orE7TV.Avrkq.X1bxzGvvdL2OiuNOHn47mxmw6', N'CUSTOMER', N'hue0701')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
INSERT [dbo].[vaccine] ([vaccine_id], [contraindication], [indication], [number_of_injection], [origin], [time_begin_next_injection], [time_end_next_injection], [usage], [vaccine_name], [vaccine_status], [vaccine_type_id]) VALUES (N'12345678', N'câcsdc', N'cácd', 4, N'etadcd', CAST(N'2024-03-13' AS Date), CAST(N'2024-03-22' AS Date), N'acsa', N'vacine e', N'ACTIVE', N'1234567')
INSERT [dbo].[vaccine] ([vaccine_id], [contraindication], [indication], [number_of_injection], [origin], [time_begin_next_injection], [time_end_next_injection], [usage], [vaccine_name], [vaccine_status], [vaccine_type_id]) VALUES (N'342332', N'không dùng v?i ngu?i b? viêm gan B', N'1 l?n 1 tháng', 4, N'Trung Qu?c', CAST(N'2024-08-05' AS Date), CAST(N'2024-08-20' AS Date), N'Tiêm tr?c ti?p', N'covid', N'ACTIVE', N'1234567')
INSERT [dbo].[vaccine] ([vaccine_id], [contraindication], [indication], [number_of_injection], [origin], [time_begin_next_injection], [time_end_next_injection], [usage], [vaccine_name], [vaccine_status], [vaccine_type_id]) VALUES (N'532354', N'không dùng v?i ngu?i b? ti?u du?ng', N'u?ng 2 viên 1 ngày', 2, N'Vi?t Nam', CAST(N'2024-08-05' AS Date), CAST(N'2024-08-27' AS Date), N'u?ng', N'Gia C?m', N'ACTIVE', N'12345')
INSERT [dbo].[vaccine] ([vaccine_id], [contraindication], [indication], [number_of_injection], [origin], [time_begin_next_injection], [time_end_next_injection], [usage], [vaccine_name], [vaccine_status], [vaccine_type_id]) VALUES (N'987654', N'không dùng v?i tr? b? m?n c?m v?i thu?c', N'1 l?n trong d?i', 1, N'USA', CAST(N'2024-08-21' AS Date), CAST(N'2024-09-03' AS Date), N'Tiêm tr?c ti?p', N'vacine s?i', N'ACTIVE', N'3532')
GO
INSERT [dbo].[vaccine_type] ([vaccine_type_id], [description], [vaccine_type_name], [vaccine_type_status]) VALUES (N'12345', N'', N'vaccine b', N'ACTIVE')
INSERT [dbo].[vaccine_type] ([vaccine_type_id], [description], [vaccine_type_name], [vaccine_type_status]) VALUES (N'1234567', N'?cqecacds', N'vaccine a', N'ACTIVE')
INSERT [dbo].[vaccine_type] ([vaccine_type_id], [description], [vaccine_type_name], [vaccine_type_status]) VALUES (N'3532', N'', N'vaccine c', N'ACTIVE')
GO
/****** Object:  Index [UK_5pdd8kpm6pwgdmiw04yd1cd15]    Script Date: 8/5/2024 4:42:35 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_5pdd8kpm6pwgdmiw04yd1cd15] ON [dbo].[user_detail]
(
	[users_id] ASC
)
WHERE ([users_id] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[injection_result]  WITH CHECK ADD  CONSTRAINT [FKf3mxbc9lvdg6xgn9howi5pi9s] FOREIGN KEY([vaccine_id])
REFERENCES [dbo].[vaccine] ([vaccine_id])
GO
ALTER TABLE [dbo].[injection_result] CHECK CONSTRAINT [FKf3mxbc9lvdg6xgn9howi5pi9s]
GO
ALTER TABLE [dbo].[injection_result]  WITH CHECK ADD  CONSTRAINT [FKfqjnl4864owt88iveh79hvw4o] FOREIGN KEY([place_id])
REFERENCES [dbo].[place] ([place_id])
GO
ALTER TABLE [dbo].[injection_result] CHECK CONSTRAINT [FKfqjnl4864owt88iveh79hvw4o]
GO
ALTER TABLE [dbo].[injection_result]  WITH CHECK ADD  CONSTRAINT [FKlvipsriw68jq5dtoe9l26m59] FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([users_id])
GO
ALTER TABLE [dbo].[injection_result] CHECK CONSTRAINT [FKlvipsriw68jq5dtoe9l26m59]
GO
ALTER TABLE [dbo].[injection_result]  WITH CHECK ADD  CONSTRAINT [FKnmew37yuwpbvl1iiy5yqlj7ko] FOREIGN KEY([prevention_id])
REFERENCES [dbo].[prevention] ([prevention_id])
GO
ALTER TABLE [dbo].[injection_result] CHECK CONSTRAINT [FKnmew37yuwpbvl1iiy5yqlj7ko]
GO
ALTER TABLE [dbo].[injection_schedule]  WITH CHECK ADD  CONSTRAINT [FKrssxcmxb2sy4h2s745qd2yqo7] FOREIGN KEY([vaccine_id])
REFERENCES [dbo].[vaccine] ([vaccine_id])
GO
ALTER TABLE [dbo].[injection_schedule] CHECK CONSTRAINT [FKrssxcmxb2sy4h2s745qd2yqo7]
GO
ALTER TABLE [dbo].[news]  WITH CHECK ADD  CONSTRAINT [FK94ti15gwtt8joy8bnit5p0vyt] FOREIGN KEY([news_type_id])
REFERENCES [dbo].[news_type] ([news_type_id])
GO
ALTER TABLE [dbo].[news] CHECK CONSTRAINT [FK94ti15gwtt8joy8bnit5p0vyt]
GO
ALTER TABLE [dbo].[user_detail]  WITH CHECK ADD  CONSTRAINT [FK2vkfocpj7p5j692ewn99x1tp2] FOREIGN KEY([users_id])
REFERENCES [dbo].[users] ([users_id])
GO
ALTER TABLE [dbo].[user_detail] CHECK CONSTRAINT [FK2vkfocpj7p5j692ewn99x1tp2]
GO
ALTER TABLE [dbo].[vaccine]  WITH CHECK ADD  CONSTRAINT [FKsh9t3bn44kyxqlhm696iukmvo] FOREIGN KEY([vaccine_type_id])
REFERENCES [dbo].[vaccine_type] ([vaccine_type_id])
GO
ALTER TABLE [dbo].[vaccine] CHECK CONSTRAINT [FKsh9t3bn44kyxqlhm696iukmvo]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD CHECK  (([role]='EMPLOYEE' OR [role]='CUSTOMER' OR [role]='ADMIN'))
GO
ALTER TABLE [dbo].[vaccine]  WITH CHECK ADD CHECK  (([vaccine_status]='IN_ACTIVE' OR [vaccine_status]='ACTIVE'))
GO
ALTER TABLE [dbo].[vaccine_type]  WITH CHECK ADD CHECK  (([vaccine_type_status]='IN_ACTIVE' OR [vaccine_type_status]='ACTIVE'))
GO
USE [master]
GO
ALTER DATABASE [VaccineDb] SET  READ_WRITE 
GO
