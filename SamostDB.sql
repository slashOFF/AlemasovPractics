USE [master]
GO
/****** Object:  Database [Gaynullin_Samost]    Script Date: 01.02.2024 16:52:23 ******/
CREATE DATABASE [Gaynullin_Samost]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Gaynullin_Samost', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gaynullin_Samost.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Gaynullin_Samost_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Gaynullin_Samost_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Gaynullin_Samost] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gaynullin_Samost].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gaynullin_Samost] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET ARITHABORT OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Gaynullin_Samost] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Gaynullin_Samost] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Gaynullin_Samost] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Gaynullin_Samost] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET RECOVERY FULL 
GO
ALTER DATABASE [Gaynullin_Samost] SET  MULTI_USER 
GO
ALTER DATABASE [Gaynullin_Samost] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Gaynullin_Samost] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Gaynullin_Samost] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Gaynullin_Samost] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Gaynullin_Samost] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Gaynullin_Samost] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gaynullin_Samost', N'ON'
GO
ALTER DATABASE [Gaynullin_Samost] SET QUERY_STORE = OFF
GO
USE [Gaynullin_Samost]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 01.02.2024 16:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryName] [nvarchar](50) NOT NULL,
	[Continent] [nvarchar](50) NOT NULL,
	[Currency] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 01.02.2024 16:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DeptName] [nvarchar](50) NOT NULL,
	[CountryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DeptName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 01.02.2024 16:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmpName] [nvarchar](50) NOT NULL,
	[DeptName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmpName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Folder]    Script Date: 01.02.2024 16:52:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Folder](
	[FolderName] [nvarchar](50) NOT NULL,
	[EmpName] [nvarchar](50) NOT NULL,
	[AccessType] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([CountryName], [Continent], [Currency]) VALUES (N'FDFS', N'fdsfea', N'3rqsdb')
INSERT [dbo].[Country] ([CountryName], [Continent], [Currency]) VALUES (N'собака', N'санрайз', N'324цв')
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Country] FOREIGN KEY([CountryName])
REFERENCES [dbo].[Country] ([CountryName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Country]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([DeptName])
REFERENCES [dbo].[Department] ([DeptName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Folder]  WITH CHECK ADD  CONSTRAINT [FK_Folder_Employee] FOREIGN KEY([EmpName])
REFERENCES [dbo].[Employee] ([EmpName])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Folder] CHECK CONSTRAINT [FK_Folder_Employee]
GO
USE [master]
GO
ALTER DATABASE [Gaynullin_Samost] SET  READ_WRITE 
GO
