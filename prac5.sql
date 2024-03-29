USE [master]
GO
/****** Object:  Database [sobakaSANRAIZ]    Script Date: 01.02.2024 20:55:35 ******/
CREATE DATABASE [sobakaSANRAIZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sobakaSANRAIZ', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sobakaSANRAIZ.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'sobakaSANRAIZ_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\sobakaSANRAIZ_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [sobakaSANRAIZ] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sobakaSANRAIZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sobakaSANRAIZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sobakaSANRAIZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sobakaSANRAIZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET  ENABLE_BROKER 
GO
ALTER DATABASE [sobakaSANRAIZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sobakaSANRAIZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET RECOVERY FULL 
GO
ALTER DATABASE [sobakaSANRAIZ] SET  MULTI_USER 
GO
ALTER DATABASE [sobakaSANRAIZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sobakaSANRAIZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sobakaSANRAIZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sobakaSANRAIZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [sobakaSANRAIZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [sobakaSANRAIZ] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'sobakaSANRAIZ', N'ON'
GO
ALTER DATABASE [sobakaSANRAIZ] SET QUERY_STORE = OFF
GO
USE [sobakaSANRAIZ]
GO
/****** Object:  Table [dbo].[hall]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hall](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[namee] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hall_row]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hall_row](
	[id_hall] [int] NOT NULL,
	[number] [smallint] NOT NULL,
	[capacity] [smallint] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_hall] ASC,
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[CapacityHall]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CapacityHall]
AS
SELECT        dbo.hall.namee, dbo.hall_row.capacity
FROM            dbo.hall INNER JOIN
                         dbo.hall_row ON dbo.hall.id = dbo.hall_row.id_hall
GO
/****** Object:  Table [dbo].[film]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[film](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[namee] [varchar](255) NULL,
	[descriptionn] [varchar](2000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[screening]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[screening](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hall_id] [int] NULL,
	[film_id] [int] NULL,
	[timee] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[FilmsAfterDate]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FilmsAfterDate] AS
SELECT f.namee AS FilmName, s.timee AS ScreeningTime
FROM film f
JOIN screening s ON f.id = s.film_id
WHERE s.timee > '2021-01-01 11:00:00';
GO
/****** Object:  View [dbo].[HallSchedule]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[HallSchedule] AS
SELECT h.namee AS HallName, f.namee AS FilmName, s.timee AS ScreeningTime
FROM hall h
JOIN screening s ON h.id = s.hall_id
JOIN film f ON s.film_id = f.id;
GO
/****** Object:  View [dbo].[FilmSchedule]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FilmSchedule] AS
SELECT f.namee AS FilmName, h.namee AS HallName, s.timee AS ScreeningTime
FROM film f
JOIN screening s ON f.id = s.film_id
JOIN hall h ON s.hall_id = h.id;
GO
/****** Object:  Table [dbo].[tickets]    Script Date: 01.02.2024 20:55:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tickets](
	[id_screening] [int] NOT NULL,
	[roww] [smallint] NOT NULL,
	[seat] [smallint] NOT NULL,
	[cost] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id_screening] ASC,
	[roww] ASC,
	[seat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[film] ON 

INSERT [dbo].[film] ([id], [namee], [descriptionn]) VALUES (1, N'Фильм 1', N'Описание фильма 1')
INSERT [dbo].[film] ([id], [namee], [descriptionn]) VALUES (2, N'Фильм 2', N'Описание фильма 2')
INSERT [dbo].[film] ([id], [namee], [descriptionn]) VALUES (3, N'Фильм 3', N'Описание фильма 3')
INSERT [dbo].[film] ([id], [namee], [descriptionn]) VALUES (4, N'Фильм 4', N'Описание фильма 4')
SET IDENTITY_INSERT [dbo].[film] OFF
GO
SET IDENTITY_INSERT [dbo].[hall] ON 

INSERT [dbo].[hall] ([id], [namee]) VALUES (1, N'Зал 1')
INSERT [dbo].[hall] ([id], [namee]) VALUES (2, N'Зал 2')
INSERT [dbo].[hall] ([id], [namee]) VALUES (3, N'Зал 5')
INSERT [dbo].[hall] ([id], [namee]) VALUES (4, N'Зал 6')
SET IDENTITY_INSERT [dbo].[hall] OFF
GO
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (1, 1, 50)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (1, 2, 60)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (2, 1, 55)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (2, 2, 65)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (3, 3, 40)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (3, 4, 50)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (4, 3, 55)
INSERT [dbo].[hall_row] ([id_hall], [number], [capacity]) VALUES (4, 4, 65)
GO
SET IDENTITY_INSERT [dbo].[screening] ON 

INSERT [dbo].[screening] ([id], [hall_id], [film_id], [timee]) VALUES (1, 1, 1, CAST(N'2024-01-02T18:00:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [timee]) VALUES (2, 2, 2, CAST(N'2024-01-02T20:00:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [timee]) VALUES (3, 3, 3, CAST(N'2024-01-02T14:00:00.000' AS DateTime))
INSERT [dbo].[screening] ([id], [hall_id], [film_id], [timee]) VALUES (4, 4, 4, CAST(N'2024-01-02T16:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[screening] OFF
GO
INSERT [dbo].[tickets] ([id_screening], [roww], [seat], [cost]) VALUES (1, 1, 5, 200)
INSERT [dbo].[tickets] ([id_screening], [roww], [seat], [cost]) VALUES (2, 2, 10, 250)
INSERT [dbo].[tickets] ([id_screening], [roww], [seat], [cost]) VALUES (3, 1, 5, 180)
INSERT [dbo].[tickets] ([id_screening], [roww], [seat], [cost]) VALUES (4, 2, 10, 220)
GO
ALTER TABLE [dbo].[hall_row]  WITH CHECK ADD FOREIGN KEY([id_hall])
REFERENCES [dbo].[hall] ([id])
GO
ALTER TABLE [dbo].[screening]  WITH CHECK ADD FOREIGN KEY([film_id])
REFERENCES [dbo].[film] ([id])
GO
ALTER TABLE [dbo].[screening]  WITH CHECK ADD FOREIGN KEY([hall_id])
REFERENCES [dbo].[hall] ([id])
GO
ALTER TABLE [dbo].[tickets]  WITH CHECK ADD FOREIGN KEY([id_screening])
REFERENCES [dbo].[screening] ([id])
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "hall"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "hall_row"
            Begin Extent = 
               Top = 6
               Left = 250
               Bottom = 119
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CapacityHall'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CapacityHall'
GO
USE [master]
GO
ALTER DATABASE [sobakaSANRAIZ] SET  READ_WRITE 
GO
