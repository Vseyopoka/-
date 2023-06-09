USE [master]
GO
/****** Object:  Database [Парк_Горького]    Script Date: 16.03.2023 11:13:51 ******/
CREATE DATABASE [Парк_Горького]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Парк_Горького', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Парк_Горького.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Парк_Горького_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Парк_Горького_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Парк_Горького] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Парк_Горького].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Парк_Горького] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Парк_Горького] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Парк_Горького] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Парк_Горького] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Парк_Горького] SET ARITHABORT OFF 
GO
ALTER DATABASE [Парк_Горького] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Парк_Горького] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Парк_Горького] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Парк_Горького] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Парк_Горького] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Парк_Горького] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Парк_Горького] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Парк_Горького] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Парк_Горького] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Парк_Горького] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Парк_Горького] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Парк_Горького] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Парк_Горького] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Парк_Горького] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Парк_Горького] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Парк_Горького] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Парк_Горького] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Парк_Горького] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Парк_Горького] SET  MULTI_USER 
GO
ALTER DATABASE [Парк_Горького] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Парк_Горького] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Парк_Горького] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Парк_Горького] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Парк_Горького] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Парк_Горького] SET QUERY_STORE = OFF
GO
USE [Парк_Горького]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 16.03.2023 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[Код_заказа] [int] NOT NULL,
	[Штрихкод_заказа] [nvarchar](255) NULL,
	[Дата_создания] [datetime] NULL,
	[Время_заказа] [datetime] NULL,
	[Код_клиента] [int] NULL,
	[Услуги] [nvarchar](255) NULL,
	[Статус] [nvarchar](255) NULL,
	[Дата_закрытия] [datetime] NULL,
	[Время_проката] [float] NULL,
	[Код_сотрудника] [int] NULL,
	[Код_услуги] [int] NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[Код_заказа] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 16.03.2023 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ФИО] [nvarchar](255) NULL,
	[Код_клиента] [int] NOT NULL,
	[Паспортные_данные] [nvarchar](255) NULL,
	[Дата_рождения] [datetime] NULL,
	[Адрес] [nvarchar](255) NULL,
	[e_mail] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Код_клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Роли]    Script Date: 16.03.2023 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Роли](
	[Код_роли] [int] NOT NULL,
	[Должность] [nvarchar](255) NULL,
 CONSTRAINT [PK_Роли] PRIMARY KEY CLUSTERED 
(
	[Код_роли] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 16.03.2023 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[Код_сотрудника] [int] NOT NULL,
	[ФИО] [nvarchar](255) NULL,
	[Логин] [nvarchar](255) NULL,
	[Пароль] [nvarchar](255) NULL,
	[Последний вход] [nvarchar](255) NULL,
	[Тип входа] [nvarchar](255) NULL,
	[Код_роли] [int] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Код_сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 16.03.2023 11:13:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[Код_услуги] [int] NOT NULL,
	[Наименование_услуги] [nvarchar](255) NULL,
	[Штрихкод_услуги] [nvarchar](255) NULL,
	[Стоимость] [float] NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[Код_услуги] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Клиенты] FOREIGN KEY([Код_клиента])
REFERENCES [dbo].[Клиенты] ([Код_клиента])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Клиенты]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Сотрудники] FOREIGN KEY([Код_сотрудника])
REFERENCES [dbo].[Сотрудники] ([Код_сотрудника])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Сотрудники]
GO
ALTER TABLE [dbo].[Заказы]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Услуги] FOREIGN KEY([Код_услуги])
REFERENCES [dbo].[Услуги] ([Код_услуги])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказы] CHECK CONSTRAINT [FK_Заказы_Услуги]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Роли] FOREIGN KEY([Код_роли])
REFERENCES [dbo].[Роли] ([Код_роли])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Роли]
GO
USE [master]
GO
ALTER DATABASE [Парк_Горького] SET  READ_WRITE 
GO
