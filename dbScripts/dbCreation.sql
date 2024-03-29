USE [master]
GO
/****** Object:  Database [aboutMe]    Script Date: 18.01.2022 21:01:29 ******/
CREATE DATABASE [aboutMe]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'aboutMe', FILENAME = N'/var/opt/mssql/data/aboutMe.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'aboutMe_log', FILENAME = N'/var/opt/mssql/data/aboutMe_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [aboutMe] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [aboutMe].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [aboutMe] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [aboutMe] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [aboutMe] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [aboutMe] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [aboutMe] SET ARITHABORT OFF 
GO
ALTER DATABASE [aboutMe] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [aboutMe] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [aboutMe] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [aboutMe] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [aboutMe] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [aboutMe] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [aboutMe] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [aboutMe] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [aboutMe] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [aboutMe] SET  DISABLE_BROKER 
GO
ALTER DATABASE [aboutMe] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [aboutMe] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [aboutMe] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [aboutMe] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [aboutMe] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [aboutMe] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [aboutMe] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [aboutMe] SET RECOVERY FULL 
GO
ALTER DATABASE [aboutMe] SET  MULTI_USER 
GO
ALTER DATABASE [aboutMe] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [aboutMe] SET DB_CHAINING OFF 
GO
ALTER DATABASE [aboutMe] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [aboutMe] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [aboutMe] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [aboutMe] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'aboutMe', N'ON'
GO
ALTER DATABASE [aboutMe] SET QUERY_STORE = OFF
GO
USE [aboutMe]
GO
/****** Object:  Table [dbo].[MyInfo]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MyInfo](
	[InfoName] [nvarchar](256) NOT NULL,
	[InfoDetail] [nvarchar](max) NOT NULL,
	[InfoOrder] [int] NOT NULL,
 CONSTRAINT [PK_MyInfo] PRIMARY KEY CLUSTERED 
(
	[InfoName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Navigation]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Navigation](
	[Id] [int] NOT NULL,
	[MenuName] [nvarchar](256) NOT NULL,
	[MenuOrder] [int] NOT NULL,
	[NavigationPath] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NavigationHistory]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NavigationHistory](
	[Id] [int] NOT NULL,
	[MenuName] [nvarchar](256) NOT NULL,
	[MenuOrder] [int] NOT NULL,
	[NavigationPath] [nvarchar](max) NOT NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_Navigation_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContent]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContent](
	[Id] [int] NOT NULL,
	[ItemName] [nvarchar](256) NOT NULL,
	[ItemDescription] [nvarchar](max) NULL,
	[ItemContent] [nvarchar](max) NOT NULL,
	[ItemOrder] [int] NULL,
	[NavigationId] [int] NULL,
 CONSTRAINT [PK_PageContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PageContentHistory]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContentHistory](
	[Id] [int] NOT NULL,
	[ItemName] [nvarchar](256) NOT NULL,
	[ItemDescription] [nvarchar](max) NULL,
	[ItemContent] [nvarchar](max) NOT NULL,
	[ItemOrder] [int] NULL,
	[NavigationId] [int] NULL,
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_PageContent_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PageContent]  WITH CHECK ADD FOREIGN KEY([NavigationId])
REFERENCES [dbo].[Navigation] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[GetElementsForVersion]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE   PROCEDURE [dbo].[GetElementsForVersion] @VersionNumber INT NULL = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @VersionNumber IS NULL
	BEGIN
		SELECT [Id]
			  ,[ItemName]
			  ,[ItemDescription]
			  ,[ItemContent]
			  ,[ItemOrder]
			  ,[NavigationId]
		  FROM [aboutMe].[dbo].[PageContent];
	END
	ELSE
	BEGIN
		SELECT [Id]
			  ,[ItemName]
			  ,[ItemDescription]
			  ,[ItemContent]
			  ,[ItemOrder]
			  ,[NavigationId]
		FROM [dbo].[PageContentHistory] PCH
		WHERE [Version] = (SELECT MAX([Version]) 
			FROM [PageContentHistory] 
			WHERE [Version] <= @VersionNumber 
				AND PCH.[Id] = [Id])
	END
END
GO
/****** Object:  StoredProcedure [dbo].[GetSiteForVersion]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetSiteForVersion] @VersionNumber INT NULL = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF @VersionNumber IS NULL
	BEGIN
		SELECT [Id]
		  ,[MenuName]
		  ,[MenuOrder]
		  ,[NavigationPath]
		FROM [aboutMe].[dbo].[Navigation];
	END
	ELSE
	BEGIN
		SELECT [Id]
			  ,[MenuName]
			  ,[MenuOrder]
			  ,[NavigationPath]
		FROM [dbo].[NavigationHistory] NH
		WHERE [Version] = (SELECT MAX([Version]) 
			FROM [NavigationHistory] 
			WHERE [Version] <= @VersionNumber 
				AND NH.[Id] = [Id])
	END
END
GO
/****** Object:  Trigger [dbo].[HistoricalNavigation]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[HistoricalNavigation]
   ON  [dbo].[Navigation]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here
	INSERT INTO [dbo].[NavigationHistory]
	SELECT [Id]
      ,[MenuName]
      ,[MenuOrder]
      ,[NavigationPath]
      ,(SELECT COUNT(*) FROM [PageContentHistory] PCH WHERE PCH.[Id] = inserted.[Id])[Version]
	FROM inserted

	DECLARE @MaxVersion INT, @SecondMaxVersion INT;

	SELECT @MaxVersion = COALESCE(MAX([Version]), 0)
	FROM [NavigationHistory];

	SELECT @SecondMaxVersion = COALESCE(MAX([Version]), 0)
	FROM [NavigationHistory]
	WHERE [Version] <> @MaxVersion;

	IF (@MaxVersion - @SecondMaxVersion > 1)
		BEGIN
		INSERT INTO [dbo].[NavigationHistory]
		SELECT [Id]
		  ,[MenuName]
		  ,[MenuOrder]
		  ,[NavigationPath]
		  ,(SELECT COUNT(*) FROM [NavigationHistory] NS WHERE NS.[Id] = [Navigation].[Id])[Version]
		FROM [dbo].[Navigation]
		WHERE [Id] NOT IN (SELECT [Id] FROM [NavigationHistory] WHERE [Version] = @MaxVersion);	
	END
END
GO
ALTER TABLE [dbo].[Navigation] ENABLE TRIGGER [HistoricalNavigation]
GO
/****** Object:  Trigger [dbo].[HistoricalPageContent]    Script Date: 18.01.2022 21:01:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[HistoricalPageContent]
   ON  [dbo].[PageContent]
   AFTER INSERT,DELETE,UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO [dbo].[PageContentHistory]
	SELECT [Id]
      ,[ItemName]
      ,[ItemDescription]
      ,[ItemContent]
      ,[ItemOrder]
      ,[NavigationId]
      ,(SELECT COUNT(*) FROM [PageContentHistory] PCH WHERE PCH.[Id] = inserted.[Id])[Version]
	FROM inserted

	DECLARE @MaxVersion INT, @SecondMaxVersion INT;

	SELECT @MaxVersion = COALESCE(MAX([Version]), 0)
	FROM [PageContentHistory];

	SELECT @SecondMaxVersion = COALESCE(MAX([Version]), 0)
	FROM [PageContentHistory]
	WHERE [Version] <> @MaxVersion;

	IF (@MaxVersion - @SecondMaxVersion > 1)
	BEGIN
		INSERT INTO [dbo].[PageContentHistory]
		SELECT [Id]
		  ,[ItemName]
		  ,[ItemDescription]
		  ,[ItemContent]
		  ,[ItemOrder]
		  ,[NavigationId]
		  ,(SELECT COUNT(*) FROM [PageContentHistory] PCH WHERE PCH.[Id] = [PageContent].[Id])[Version]
		FROM [dbo].[PageContent]
		WHERE [Id] NOT IN (SELECT [Id] FROM [PageContentHistory] WHERE [Version] = @MaxVersion);		
	END
END
GO
ALTER TABLE [dbo].[PageContent] ENABLE TRIGGER [HistoricalPageContent]
GO
USE [master]
GO
ALTER DATABASE [aboutMe] SET  READ_WRITE 
GO
