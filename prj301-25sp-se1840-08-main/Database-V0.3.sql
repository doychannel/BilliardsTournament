USE [master]
GO
/****** Object:  Database [TournamentManagement]    Script Date: 3/28/2025 10:59:25 PM ******/
CREATE DATABASE [TournamentManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TournamentManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHSQL\MSSQL\DATA\TournamentManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TournamentManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MINHSQL\MSSQL\DATA\TournamentManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TournamentManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TournamentManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TournamentManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TournamentManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TournamentManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TournamentManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TournamentManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [TournamentManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TournamentManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TournamentManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TournamentManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TournamentManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TournamentManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TournamentManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TournamentManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TournamentManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TournamentManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TournamentManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TournamentManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TournamentManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TournamentManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TournamentManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TournamentManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TournamentManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TournamentManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TournamentManagement] SET  MULTI_USER 
GO
ALTER DATABASE [TournamentManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TournamentManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TournamentManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TournamentManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TournamentManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TournamentManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TournamentManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [TournamentManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TournamentManagement]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameMatch]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameMatch](
	[MatchID] [int] NOT NULL,
	[RoundID] [int] NOT NULL,
	[TableID] [int] NOT NULL,
	[Player1ID] [int] NOT NULL,
	[Player2ID] [int] NOT NULL,
	[ScoreP1] [int] NULL,
	[ScoreP2] [int] NULL,
	[GameStatus] [varchar](20) NOT NULL,
	[WinnerPlayer] [int] NULL,
	[TournamentID] [int] NOT NULL,
	[MatchTime] [datetime] NULL,
 CONSTRAINT [PK_GameMatch] PRIMARY KEY CLUSTERED 
(
	[TournamentID] ASC,
	[MatchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameTable]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameTable](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Players]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Players](
	[PlayerID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[PlayerStatus] [varchar](20) NOT NULL,
	[TournamentID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rounds]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rounds](
	[RoundID] [int] IDENTITY(1,1) NOT NULL,
	[RoundName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[TournamentID] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Location] [nvarchar](100) NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[Fee] [int] NULL,
	[ImgFile] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[TournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[PlayerID] [int] NOT NULL,
	[TournamentID] [int] NOT NULL,
	[PaymentStatus] [varchar](20) NOT NULL,
	[CreationTime] [datetime] NOT NULL,
	[ExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/28/2025 10:59:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 

INSERT [dbo].[Admins] ([AdminID], [FullName], [Username], [Password]) VALUES (2, N'Super Admin', N'superadmin', N'hashed_pass2')
INSERT [dbo].[Admins] ([AdminID], [FullName], [Username], [Password]) VALUES (4, N'Nguyen The Minh', N'admin', N'admin')
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 1, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 2, 1, 2, 3, 2, 1, N'Completed', 2, 1, CAST(N'2024-11-16T03:02:59.740' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (3, 2, 1, 1, 3, 1, 0, N'Completed', 1, 1, CAST(N'2024-11-16T10:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (4, 2, 2, 3, 2, 2, 0, N'Completed', 3, 1, CAST(N'2024-11-17T13:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (6, 2, 1, 3, 5, 2, 1, N'Pending', 3, 1, CAST(N'2025-03-26T23:37:13.067' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (7, 2, 1, 6, 7, 1, 3, N'Completed', 7, 1, CAST(N'2025-03-26T22:30:21.333' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (8, 1, 3, 5, 2, 2, 0, N'Completed', 5, 1, CAST(N'2024-11-16T23:04:09.360' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (7, 3, 3, 3, 6, 0, 1, N'Completed', 6, 2, CAST(N'2024-12-21T10:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (4, 2, 2, 3, 2, 2, 0, N'Completed', 3, 3, CAST(N'2024-11-17T13:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (8, 4, 2, 4, 2, 1, 1, N'Completed', NULL, 3, CAST(N'2025-02-11T10:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 4, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (5, 4, 3, 2, 5, 0, 0, N'Pending', NULL, 4, NULL)
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (10, 2, 3, 5, 2, 1, 0, N'Completed', 5, 5, CAST(N'2025-01-02T03:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 11, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 1, 2, 11, 12, 0, 0, N'Pending', NULL, 11, CAST(N'2025-03-29T03:00:06.020' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 12, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 1, 1, 16, 17, 0, 0, N'Pending', NULL, 12, CAST(N'2025-03-30T03:00:06.023' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 13, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 1, 2, 24, 25, 0, 0, N'Pending', NULL, 13, CAST(N'2025-03-27T07:07:40.187' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (3, 1, 3, 26, 27, 3, 2, N'Completed', 26, 13, CAST(N'2025-03-26T03:07:40.187' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (4, 1, 1, 28, 29, 0, 0, N'Pending', NULL, 13, CAST(N'2025-03-28T03:07:40.187' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (5, 1, 2, 30, 31, 0, 0, N'Pending', NULL, 13, CAST(N'2025-03-28T03:07:40.187' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 14, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 1, 1, 71, 72, 1, 3, N'Completed', 72, 14, CAST(N'2025-03-26T23:23:55.823' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (3, 1, 2, 73, 74, 0, 0, N'InProgress', NULL, 14, CAST(N'2025-03-27T03:23:55.823' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (4, 1, 3, 75, 76, 0, 0, N'Pending', NULL, 14, CAST(N'2025-03-27T06:23:55.823' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 17, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 1, 2, 60, 61, 2, 4, N'Completed', 61, 17, CAST(N'2025-01-06T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (3, 2, 1, 58, 61, 4, 3, N'Completed', 58, 17, CAST(N'2025-01-10T14:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 18, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 1, 1, 62, 63, 1, 3, N'Completed', 63, 18, CAST(N'2024-12-02T12:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (3, 1, 2, 64, 65, 3, 2, N'Completed', 64, 18, CAST(N'2024-12-03T10:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (1, 1, 3, 60, 61, 2, 0, N'Completed', 60, 19, CAST(N'2024-12-02T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (2, 8, 3, 93, 94, 3, 1, N'Completed', 93, 19, CAST(N'2024-10-01T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (3, 8, 1, 95, 96, 3, 1, N'Completed', 95, 19, CAST(N'2024-10-01T12:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (4, 8, 2, 97, 98, 3, 1, N'Completed', 97, 19, CAST(N'2024-10-01T13:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (5, 8, 3, 99, 100, 3, 1, N'Completed', 99, 19, CAST(N'2024-10-01T14:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (6, 8, 1, 101, 102, 3, 1, N'Completed', 101, 19, CAST(N'2024-10-01T15:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (7, 8, 2, 103, 104, 3, 1, N'Completed', 103, 19, CAST(N'2024-10-01T16:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (8, 8, 3, 105, 106, 3, 1, N'Completed', 105, 19, CAST(N'2024-10-01T17:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (9, 8, 1, 107, 108, 3, 1, N'Completed', 107, 19, CAST(N'2024-10-01T18:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (10, 8, 2, 109, 110, 3, 1, N'Completed', 109, 19, CAST(N'2024-10-01T19:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (11, 8, 3, 111, 112, 3, 1, N'Completed', 111, 19, CAST(N'2024-10-01T20:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (12, 8, 1, 113, 114, 3, 1, N'Completed', 113, 19, CAST(N'2024-10-01T21:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (13, 8, 2, 115, 116, 3, 1, N'Completed', 115, 19, CAST(N'2024-10-01T22:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (14, 8, 3, 117, 118, 3, 1, N'Completed', 117, 19, CAST(N'2024-10-01T23:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (15, 8, 1, 119, 120, 3, 1, N'Completed', 119, 19, CAST(N'2024-10-02T00:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (16, 8, 2, 105, 107, 3, 1, N'Completed', 105, 19, CAST(N'2024-10-02T01:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (17, 9, 3, 91, 93, 2, 3, N'Completed', 93, 19, CAST(N'2024-10-03T02:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (18, 9, 1, 95, 97, 2, 3, N'Completed', 97, 19, CAST(N'2024-10-03T03:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (19, 9, 2, 99, 101, 2, 3, N'Completed', 101, 19, CAST(N'2024-10-03T04:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (20, 9, 3, 103, 105, 2, 3, N'Completed', 105, 19, CAST(N'2024-10-03T05:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (21, 9, 1, 107, 109, 2, 3, N'Completed', 109, 19, CAST(N'2024-10-03T06:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (22, 9, 2, 111, 113, 2, 3, N'Completed', 113, 19, CAST(N'2024-10-03T07:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (23, 9, 3, 115, 117, 2, 3, N'Completed', 117, 19, CAST(N'2024-10-03T08:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (24, 9, 1, 119, 105, 2, 3, N'Completed', 105, 19, CAST(N'2024-10-03T09:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (25, 10, 2, 93, 97, 4, 3, N'Completed', 93, 19, CAST(N'2024-10-04T11:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (26, 10, 3, 101, 105, 4, 3, N'Completed', 101, 19, CAST(N'2024-10-04T12:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (27, 10, 1, 109, 113, 4, 3, N'Completed', 109, 19, CAST(N'2024-10-04T13:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (29, 11, 3, 93, 101, 4, 5, N'Completed', 101, 19, CAST(N'2024-10-05T18:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (30, 11, 1, 109, 117, 4, 5, N'Completed', 117, 19, CAST(N'2024-10-05T19:00:00.000' AS DateTime))
INSERT [dbo].[GameMatch] ([MatchID], [RoundID], [TableID], [Player1ID], [Player2ID], [ScoreP1], [ScoreP2], [GameStatus], [WinnerPlayer], [TournamentID], [MatchTime]) VALUES (31, 12, 1, 101, 117, 5, 3, N'Completed', 101, 19, CAST(N'2024-10-05T15:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[GameTable] ON 

INSERT [dbo].[GameTable] ([TableID], [TableName]) VALUES (1, N'Table No. 1')
INSERT [dbo].[GameTable] ([TableID], [TableName]) VALUES (2, N'Table No. 2')
INSERT [dbo].[GameTable] ([TableID], [TableName]) VALUES (3, N'Table No. 3')
SET IDENTITY_INSERT [dbo].[GameTable] OFF
GO
SET IDENTITY_INSERT [dbo].[Players] ON 

INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (1, 1, N'Active', 1)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (2, 2, N'Active', 1)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (3, 3, N'Inactive', 1)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (4, 4, N'Active', 2)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (5, 5, N'Active', 2)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (6, 6, N'Active', 3)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (7, 7, N'Suspended', 3)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (8, 8, N'Active', 3)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (9, 1, N'Active', 11)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (10, 2, N'Active', 11)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (11, 4, N'Active', 11)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (12, 6, N'Pending', 11)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (13, 3, N'Active', 12)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (14, 5, N'Active', 12)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (15, 7, N'Suspended', 12)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (16, 13, N'Active', 12)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (17, 14, N'Active', 12)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (18, 8, N'Active', 7)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (19, 9, N'Active', 7)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (20, 1, N'Active', 4)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (21, 15, N'Active', 4)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (22, 1, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (23, 3, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (24, 5, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (25, 7, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (26, 9, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (27, 12, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (28, 16, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (29, 18, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (30, 20, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (31, 22, N'Pending', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (32, 24, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (33, 26, N'Active', 13)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (39, 1, N'Pending', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (40, 5, N'Pending', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (41, 13, N'Active', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (42, 15, N'Active', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (43, 27, N'Active', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (44, 28, N'Active', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (45, 29, N'Pending', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (46, 30, N'Active', 15)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (47, 6, N'Active', 16)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (48, 12, N'Active', 16)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (49, 18, N'Pending', 16)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (50, 24, N'Active', 16)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (51, 26, N'Active', 16)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (52, 28, N'Active', 16)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (53, 7, N'Active', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (54, 14, N'Active', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (55, 16, N'Active', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (56, 20, N'Inactive', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (57, 22, N'Active', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (58, 27, N'Active', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (59, 29, N'Active', 17)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (60, 2, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (61, 8, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (62, 13, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (63, 17, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (64, 19, N'Inactive', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (65, 23, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (66, 25, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (67, 30, N'Active', 18)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (69, 2, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (70, 4, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (71, 6, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (72, 8, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (73, 17, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (74, 19, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (75, 21, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (76, 23, N'Suspended', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (77, 25, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (78, 29, N'Active', 14)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (79, 12, N'Active', 1)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (80, 23, N'Active', 1)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (81, 13, N'Active', 2)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (82, 14, N'Inactive', 2)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (83, 15, N'Active', 3)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (84, 16, N'Active', 4)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (85, 17, N'Active', 5)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (86, 18, N'Active', 6)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (87, 19, N'Active', 8)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (88, 20, N'Active', 9)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (89, 21, N'Active', 11)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (90, 22, N'Active', 12)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (91, 1, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (92, 2, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (93, 3, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (94, 4, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (95, 5, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (96, 6, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (97, 7, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (98, 8, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (99, 9, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (100, 12, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (101, 13, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (102, 14, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (103, 15, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (104, 16, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (105, 17, N'Active', 19)
GO
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (106, 18, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (107, 19, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (108, 20, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (109, 21, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (110, 22, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (111, 23, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (112, 24, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (113, 25, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (114, 26, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (115, 27, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (116, 28, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (117, 29, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (118, 30, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (119, 31, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (120, 32, N'Active', 19)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (121, 8, N'Active', 4)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (122, 8, N'Active', 5)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (123, 8, N'Active', 6)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (124, 8, N'Active', 11)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (125, 12, N'Active', 2)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (126, 12, N'Active', 3)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (127, 12, N'Active', 7)
INSERT [dbo].[Players] ([PlayerID], [UserID], [PlayerStatus], [TournamentID]) VALUES (128, 12, N'Active', 8)
SET IDENTITY_INSERT [dbo].[Players] OFF
GO
SET IDENTITY_INSERT [dbo].[Rounds] ON 

INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (1, N'Preliminary Round')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (2, N'Semi Finals')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (3, N'Final Round')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (4, N'Opening Matches')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (5, N'Final Round')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (6, N'Qualifiers')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (7, N'Championship Match')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (8, N'Vòng 32')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (9, N'Vòng 16')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (10, N'Tứ kết')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (11, N'Bán kết')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (12, N'Chung kết')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (14, N'Tá»© káº¿t 2')
INSERT [dbo].[Rounds] ([RoundID], [RoundName]) VALUES (15, N'Tu ket 3')
SET IDENTITY_INSERT [dbo].[Rounds] OFF
GO
SET IDENTITY_INSERT [dbo].[Tournaments] ON 

INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (1, N'Vietnam Pooldown', N'A casual yet exciting billiards tournament for everyone', N'District 1, Vietnam', CAST(N'2024-11-15T09:00:00.000' AS DateTime), CAST(N'2024-11-17T18:00:00.000' AS DateTime), 500000, N'assets/images/tournamentLogo/Vietnam Pooldown-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (2, N'Junior Open VN', N'A friendly tournament for young billiards players', N'Thu Duc, Vietnam', CAST(N'2024-12-20T08:00:00.000' AS DateTime), CAST(N'2024-12-22T17:00:00.000' AS DateTime), 200000, N'assets/images/tournamentLogo/Junior Open VN-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (3, N'Spring Break Challenge', N'Celebrate the new year with a thrilling billiards event', N'Tan Phu, Vietnam', CAST(N'2025-02-10T09:00:00.000' AS DateTime), CAST(N'2025-02-12T16:00:00.000' AS DateTime), 750000, N'assets/images/tournamentLogo/Spring Break Challenge-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (4, N'Mixed Double Open 2025', N'An open tournament for Europe', N'Thu Duc, Vietnam', CAST(N'2025-02-25T10:00:00.000' AS DateTime), CAST(N'2025-03-01T18:00:00.000' AS DateTime), 100, N'assets/images/tournamentLogo/Mixed Double Open 2025-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (5, N'One Pocket', N'An open tournament in Asia', N'Singapore', CAST(N'2025-01-02T02:00:00.000' AS DateTime), CAST(N'2025-03-04T10:00:00.000' AS DateTime), 150, N'assets/images/tournamentLogo/One Pocket-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (6, N'Challenge Of Champions', N'A tournament only for A rank player', N'Quan 1, Vietnam', CAST(N'2025-03-04T11:35:00.000' AS DateTime), CAST(N'2025-03-09T11:35:00.000' AS DateTime), 1000000, N'assets/images/tournamentLogo/Challenge Of Champions-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (7, N'Pro Billiards', N'Pro Tournaments Players Champ', N'Quan 2, Vietnam', CAST(N'2025-05-04T11:35:00.000' AS DateTime), CAST(N'2025-07-09T11:35:00.000' AS DateTime), 1200000, N'assets/images/tournamentLogo/Pro Billiards-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (8, N'HaNoi Open', N'Open tournament for foreign people', N'Quan 5, Vietnam', CAST(N'2025-04-04T11:35:00.000' AS DateTime), CAST(N'2025-04-09T11:35:00.000' AS DateTime), 800000, N'assets/images/tournamentLogo/HaNoi Open-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (9, N'Hue Open', N'Open tournament for foreign people in Hue', N'Hoan Kiem, Vietnam', CAST(N'2024-04-04T11:35:00.000' AS DateTime), CAST(N'2024-04-09T11:35:00.000' AS DateTime), 600000, N'assets/images/tournamentLogo/Hue Open-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (11, N'Nha Trang Club', N'Gangster Champion League in Nha Trang', N'Nha Trang', CAST(N'2025-03-20T10:00:00.000' AS DateTime), CAST(N'2025-05-11T17:00:00.000' AS DateTime), 385000, N'assets/images/tournamentLogo/Nha Trang Club-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (12, N'Thien Long Bar', N'Billiards tournament for loyal customers of the shop', N'Nha Trang', CAST(N'2025-03-23T10:00:00.000' AS DateTime), CAST(N'2025-04-11T17:00:00.000' AS DateTime), 100000, N'assets/images/tournamentLogo/Thien Long Bar-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (13, N'Saigon Pool Masters', N'Professional 9-ball tournament in Ho Chi Minh City', N'Quáº­n 3, TPHCM', CAST(N'2025-03-17T03:07:00.000' AS DateTime), CAST(N'2025-04-16T03:07:00.000' AS DateTime), 800000, N'assets/images/tournamentLogo/Saigon Pool Masters-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (14, N'Weekend Express 8-Ball', N'Weekend 8 Ball Pool Quick Play', N'Quáº­n 10, TPHCM', CAST(N'2025-03-26T03:07:00.000' AS DateTime), CAST(N'2025-03-31T03:07:00.000' AS DateTime), 300000, N'assets/images/tournamentLogo/Weekend Express 8-Ball-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (15, N'Da Nang Coastal Cup', N'Friendly tournament in Da Nang', N'ÄÃ  Náºµng', CAST(N'2025-04-11T03:07:00.000' AS DateTime), CAST(N'2025-04-21T03:07:00.000' AS DateTime), 500000, N'assets/images/tournamentLogo/Da Nang Coastal Cup-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (16, N'Summer Snooker Fest', N'Summer Snooker Festival', N'Hà Nội', CAST(N'2025-05-27T03:07:00.000' AS DateTime), CAST(N'2025-06-06T03:07:00.000' AS DateTime), 1500000, NULL)
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (17, N'New Year 10-Ball Cup', N'10 Balls Prize Happy New Year', N'Quáº­n 1, TPHCM', CAST(N'2025-01-05T09:00:00.000' AS DateTime), CAST(N'2025-01-15T18:00:00.000' AS DateTime), 600000, N'assets/images/tournamentLogo/New Year 10-Ball Cup-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (18, N'Winter 9-Ball Classic', N'Winter Classic 9-Ball', N'Quáº­n 7, TPHCM', CAST(N'2024-12-01T10:00:00.000' AS DateTime), CAST(N'2024-12-10T17:00:00.000' AS DateTime), 700000, N'assets/images/tournamentLogo/Winter 9-Ball Classic-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (19, N'Past Masters 32', N'32-player knockout simulation tournament', N'Simulation Arena', CAST(N'2024-10-01T09:00:00.000' AS DateTime), CAST(N'2024-10-05T18:00:00.000' AS DateTime), 100000, N'assets/images/tournamentLogo/Past Masters 32-logo.png')
INSERT [dbo].[Tournaments] ([TournamentID], [TournamentName], [Description], [Location], [StartTime], [EndTime], [Fee], [ImgFile]) VALUES (20, N'FPT', N'ÃÂ¡df', N'VietNam', CAST(N'2025-03-26T19:14:00.000' AS DateTime), CAST(N'2025-03-29T17:14:00.000' AS DateTime), 0, N'assets/images/tournamentLogo/FPT-logo.png')
SET IDENTITY_INSERT [dbo].[Tournaments] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (1, 7, 1, N'Completed', CAST(N'2024-11-01T10:15:00.000' AS DateTime), CAST(N'2025-03-12T16:23:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (2, 2, 1, N'Completed', CAST(N'2024-11-02T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (3, 3, 1, N'Completed', CAST(N'2024-11-03T11:45:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (4, 5, 1, N'Completed', CAST(N'2024-11-04T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (5, 1, 2, N'Pending', CAST(N'2024-12-10T15:30:00.000' AS DateTime), CAST(N'2024-12-20T08:00:00.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (6, 2, 2, N'Completed', CAST(N'2024-12-12T16:45:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (7, 5, 2, N'Completed', CAST(N'2024-12-15T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (8, 9, 11, N'Completed', CAST(N'2025-03-22T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (9, 10, 11, N'Completed', CAST(N'2025-03-23T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (10, 11, 11, N'Completed', CAST(N'2025-03-24T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (11, 12, 11, N'Pending', CAST(N'2025-03-25T03:00:06.037' AS DateTime), CAST(N'2025-04-01T03:00:06.037' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (12, 13, 12, N'Completed', CAST(N'2025-03-21T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (13, 14, 12, N'Failed', CAST(N'2025-03-22T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (14, 15, 12, N'Completed', CAST(N'2025-03-23T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (15, 16, 12, N'Completed', CAST(N'2025-03-24T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (16, 17, 12, N'Pending', CAST(N'2025-03-25T03:00:06.037' AS DateTime), CAST(N'2025-04-03T03:00:06.037' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (17, 18, 7, N'Pending', CAST(N'2025-03-26T03:00:06.037' AS DateTime), CAST(N'2025-04-27T03:00:06.037' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (18, 19, 7, N'Completed', CAST(N'2025-03-27T03:00:06.037' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (19, 20, 4, N'Completed', CAST(N'2025-02-20T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (20, 21, 4, N'Completed', CAST(N'2025-02-21T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (21, 22, 13, N'Completed', CAST(N'2025-03-15T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (22, 23, 13, N'Completed', CAST(N'2025-03-16T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (23, 24, 13, N'Completed', CAST(N'2025-03-17T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (24, 25, 13, N'Completed', CAST(N'2025-03-18T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (25, 26, 13, N'Completed', CAST(N'2025-03-19T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (26, 27, 13, N'Completed', CAST(N'2025-03-20T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (27, 28, 13, N'Completed', CAST(N'2025-03-21T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (28, 29, 13, N'Failed', CAST(N'2025-03-22T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (29, 30, 13, N'Completed', CAST(N'2025-03-23T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (30, 31, 13, N'Pending', CAST(N'2025-03-24T03:23:55.827' AS DateTime), CAST(N'2025-04-03T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (31, 32, 13, N'Completed', CAST(N'2025-03-25T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (32, 33, 13, N'Completed', CAST(N'2025-03-26T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (33, 69, 14, N'Completed', CAST(N'2025-03-24T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (34, 70, 14, N'Completed', CAST(N'2025-03-25T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (35, 71, 14, N'Completed', CAST(N'2025-03-25T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (36, 72, 14, N'Completed', CAST(N'2025-03-26T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (37, 73, 14, N'Completed', CAST(N'2025-03-26T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (38, 74, 14, N'Pending', CAST(N'2025-03-27T03:23:55.827' AS DateTime), CAST(N'2025-03-30T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (39, 75, 14, N'Completed', CAST(N'2025-03-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (40, 76, 14, N'Completed', CAST(N'2025-03-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (41, 77, 14, N'Completed', CAST(N'2025-03-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (42, 78, 14, N'Failed', CAST(N'2025-03-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (43, 39, 15, N'Pending', CAST(N'2025-03-26T03:23:55.827' AS DateTime), CAST(N'2025-04-10T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (44, 40, 15, N'Completed', CAST(N'2025-03-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (45, 41, 15, N'Completed', CAST(N'2025-03-28T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (46, 42, 15, N'Pending', CAST(N'2025-03-29T03:23:55.827' AS DateTime), CAST(N'2025-04-10T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (47, 43, 15, N'Completed', CAST(N'2025-03-30T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (48, 44, 15, N'Completed', CAST(N'2025-03-31T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (49, 45, 15, N'Pending', CAST(N'2025-04-01T03:23:55.827' AS DateTime), CAST(N'2025-04-10T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (50, 46, 15, N'Completed', CAST(N'2025-04-02T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (51, 53, 17, N'Completed', CAST(N'2025-01-01T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (52, 54, 17, N'Completed', CAST(N'2025-01-01T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (53, 55, 17, N'Completed', CAST(N'2025-01-02T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (54, 56, 17, N'Completed', CAST(N'2025-01-02T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (55, 57, 17, N'Completed', CAST(N'2025-01-03T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (56, 58, 17, N'Completed', CAST(N'2025-01-03T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (57, 59, 17, N'Completed', CAST(N'2025-01-04T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (58, 60, 18, N'Completed', CAST(N'2024-11-25T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (59, 61, 18, N'Completed', CAST(N'2024-11-26T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (60, 62, 18, N'Completed', CAST(N'2024-11-27T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (61, 63, 18, N'Completed', CAST(N'2024-11-27T11:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (62, 64, 18, N'Completed', CAST(N'2024-11-28T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (63, 65, 18, N'Completed', CAST(N'2024-11-28T14:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (64, 66, 18, N'Completed', CAST(N'2024-11-29T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (65, 67, 18, N'Completed', CAST(N'2024-11-29T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (66, 79, 1, N'Completed', CAST(N'2024-11-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (67, 80, 1, N'Completed', CAST(N'2024-11-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (68, 81, 2, N'Completed', CAST(N'2024-12-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (69, 82, 2, N'Failed', CAST(N'2024-12-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (70, 83, 3, N'Completed', CAST(N'2025-02-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (71, 84, 4, N'Completed', CAST(N'2025-03-12T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (72, 85, 5, N'Pending', CAST(N'2025-03-17T03:23:55.827' AS DateTime), CAST(N'2025-04-16T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (73, 86, 6, N'Completed', CAST(N'2025-03-22T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (74, 87, 8, N'Pending', CAST(N'2025-03-25T03:23:55.827' AS DateTime), CAST(N'2025-04-06T03:23:55.827' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (75, 88, 9, N'Completed', CAST(N'2024-03-27T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (76, 89, 11, N'Completed', CAST(N'2025-03-24T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (77, 90, 12, N'Completed', CAST(N'2025-03-25T03:23:55.827' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (78, 91, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (79, 92, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (80, 93, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (81, 94, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (82, 95, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (83, 96, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (84, 97, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (85, 98, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (86, 99, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (87, 100, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (88, 101, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (89, 102, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (90, 103, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (91, 104, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (92, 105, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (93, 106, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (94, 107, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (95, 108, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (96, 109, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (97, 110, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (98, 111, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (99, 112, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (100, 113, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (101, 114, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (102, 115, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (103, 116, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (104, 117, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (105, 118, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (106, 119, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (107, 120, 19, N'Completed', CAST(N'2024-09-26T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (108, 121, 4, N'Completed', CAST(N'2025-03-27T14:21:31.257' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (109, 122, 5, N'Completed', CAST(N'2025-03-27T14:21:31.260' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (110, 123, 6, N'Completed', CAST(N'2025-03-27T14:21:31.260' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (111, 124, 11, N'Completed', CAST(N'2025-03-27T14:21:31.260' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (112, 125, 2, N'Completed', CAST(N'2025-03-27T14:25:30.180' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (113, 126, 3, N'Completed', CAST(N'2025-03-27T14:25:30.180' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (114, 127, 7, N'Completed', CAST(N'2025-03-27T14:25:30.183' AS DateTime), NULL)
INSERT [dbo].[Transactions] ([TransactionID], [PlayerID], [TournamentID], [PaymentStatus], [CreationTime], [ExpirationDate]) VALUES (115, 128, 8, N'Completed', CAST(N'2025-03-27T14:25:30.183' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (1, N'Nguyễn Văn A', N'nguyenvana', N'hashed_pass1', N'nguyenvana@example.com', N'0901234567')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (2, N'Trần Thị B', N'tranthib', N'hashed_pass2', N'tranthib@example.com', N'0912345678')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (3, N'Lê Văn C', N'levanc', N'hashed_pass3', N'levanc@example.com', N'0773456789')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (4, N'Phạm Thị D', N'phamthid', N'hashed_pass4', N'phamthid@example.com', N'0934567890')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (5, N'Hoàng Văn E', N'hoangvane', N'hashed_pass5', N'hoangvane@example.com', N'0945678901')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (6, N'Đỗ Phúc Duy', N'dophucduy', N'hashed_pass6', N'duydo@example.com', N'0773355879')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (7, N'Nguyễn Tuấn Anh', N'nguyentuananh', N'hashed_pass7', N'anhngu@example.com', N'0774490472')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (8, N'Nguyễn Thế Minh', N'nguyentheminh', N'hashed_pass8', N'minhnguyen@example.com', N'0945678755')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (9, N'Phạm Nhật Thông', N'phamnhatthong', N'hashed_pass9', N'thongnhat@example.com', N'0945612345')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (12, N'Nguyen The Minh', N'minh', N'minh', N'nguyenminh110505@gmail.com', N'0888789001')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (13, N'Võ Thị F', N'vothif', N'hashed_pass13', N'vothif@example.com', N'0987654321')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (14, N'Bùi Văn G', N'buivang', N'hashed_pass14', N'buivang@example.com', N'0911223344')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (15, N'Đặng Thị H', N'dangthih', N'hashed_pass15', N'dangthih@example.com', N'0922334455')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (16, N'Mai Thị Kim Chi', N'maithikimchi', N'pass16', N'chi.mtk@example.com', N'0955112233')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (17, N'Hồ Văn Tài', N'hovantai', N'pass17', N'tai.hv@example.com', N'0955223344')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (18, N'Đinh Thị Ngọc', N'dinhthingoc', N'pass18', N'ngoc.dt@example.com', N'0955334455')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (19, N'Vũ Đức Thắng', N'vuducthang', N'pass19', N'thang.vd@example.com', N'0955445566')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (20, N'Trịnh Lan Anh', N'trinhlananh', N'pass20', N'anh.tl@example.com', N'0955556677')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (21, N'Lý Minh Khang', N'lyminhkhang', N'pass21', N'khang.lm@example.com', N'0955667788')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (22, N'Châu Ngọc Bích', N'chaungocbich', N'pass22', N'bich.cn@example.com', N'0955778899')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (23, N'Tăng Quốc Bảo', N'tangquocbao', N'pass23', N'bao.tq@example.com', N'0955889900')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (24, N'Dương Thúy Vy', N'duongthuyvy', N'pass24', N'vy.dt@example.com', N'0955990011')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (25, N'Kiều Minh Tuấn', N'kieuminhtuan', N'pass25', N'tuan.km@example.com', N'0955001122')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (26, N'Giang Hồng Ngọc', N'gianghongngoc', N'pass26', N'ngoc.gh@example.com', N'0955121212')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (27, N'Huỳnh Lập', N'huynhlap', N'pass27', N'lap.huynh@example.com', N'0955232323')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (28, N'Khả Như', N'khanhu', N'pass28', N'nhu.kha@example.com', N'0955343434')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (29, N'Cris Phan', N'crisphan', N'pass29', N'cris.phan@example.com', N'0955454545')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (30, N'Misthy', N'misthy', N'pass30', N'misthy@example.com', N'0955565656')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (31, N'Trần Văn X', N'tranvanx', N'pass31', N'x.tv@example.com', N'0961112233')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (32, N'Nguyễn Thị Y', N'nguyenthiy', N'pass32', N'y.nt@example.com', N'0962223344')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (34, N'Dung', N'dung', N'dung', N'dung@gmail.com', N'12345679')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (35, N'dung2', N'dung2', N'dung2', N'dung2@gmail.com', N'0126587548')
INSERT [dbo].[Users] ([UserID], [FullName], [Username], [Password], [Email], [PhoneNumber]) VALUES (36, N'Nguyễn Văn Tèo', N'vanteo', N'12345678', N'teo@gmail.com', N'0123568947')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Admins_Username]    Script Date: 3/28/2025 10:59:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Admins_Username] ON [dbo].[Admins]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ_Players_User_Tournament]    Script Date: 3/28/2025 10:59:25 PM ******/
ALTER TABLE [dbo].[Players] ADD  CONSTRAINT [UQ_Players_User_Tournament] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[TournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Players_TournamentID]    Script Date: 3/28/2025 10:59:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Players_TournamentID] ON [dbo].[Players]
(
	[TournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Transactions_TournamentID]    Script Date: 3/28/2025 10:59:25 PM ******/
CREATE NONCLUSTERED INDEX [IX_Transactions_TournamentID] ON [dbo].[Transactions]
(
	[TournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Email]    Script Date: 3/28/2025 10:59:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Users_Username]    Script Date: 3/28/2025 10:59:25 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GameMatch] ADD  CONSTRAINT [DF_GameMatch_ScoreP1]  DEFAULT ((0)) FOR [ScoreP1]
GO
ALTER TABLE [dbo].[GameMatch] ADD  CONSTRAINT [DF_GameMatch_ScoreP2]  DEFAULT ((0)) FOR [ScoreP2]
GO
ALTER TABLE [dbo].[GameMatch] ADD  CONSTRAINT [DF_GameMatch_GameStatus]  DEFAULT ('Pending') FOR [GameStatus]
GO
ALTER TABLE [dbo].[Players] ADD  DEFAULT ('Active') FOR [PlayerStatus]
GO
ALTER TABLE [dbo].[Tournaments] ADD  CONSTRAINT [DF_Tournaments_Fee]  DEFAULT ((0)) FOR [Fee]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT ('Pending') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[Transactions] ADD  DEFAULT (getdate()) FOR [CreationTime]
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD FOREIGN KEY([Player1ID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD FOREIGN KEY([Player2ID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD FOREIGN KEY([RoundID])
REFERENCES [dbo].[Rounds] ([RoundID])
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD FOREIGN KEY([TableID])
REFERENCES [dbo].[GameTable] ([TableID])
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD FOREIGN KEY([WinnerPlayer])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD  CONSTRAINT [FK_GameMatch_Tournaments] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[GameMatch] CHECK CONSTRAINT [FK_GameMatch_Tournaments]
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Players]  WITH CHECK ADD  CONSTRAINT [FK_Players_Tournaments] FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[Players] CHECK CONSTRAINT [FK_Players_Tournaments]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([PlayerID])
REFERENCES [dbo].[Players] ([PlayerID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([TournamentID])
REFERENCES [dbo].[Tournaments] ([TournamentID])
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD  CONSTRAINT [CK_DifferentPlayers] CHECK  (([Player1ID]<>[Player2ID]))
GO
ALTER TABLE [dbo].[GameMatch] CHECK CONSTRAINT [CK_DifferentPlayers]
GO
ALTER TABLE [dbo].[GameMatch]  WITH CHECK ADD  CONSTRAINT [CK_GameStatus] CHECK  (([GameStatus]='Pending' OR [GameStatus]='InProgress' OR [GameStatus]='Completed' OR [GameStatus]='Cancelled'))
GO
ALTER TABLE [dbo].[GameMatch] CHECK CONSTRAINT [CK_GameStatus]
GO
ALTER TABLE [dbo].[Tournaments]  WITH CHECK ADD  CONSTRAINT [CK_Tournament_Dates] CHECK  (([EndTime]>[StartTime]))
GO
ALTER TABLE [dbo].[Tournaments] CHECK CONSTRAINT [CK_Tournament_Dates]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [CK_PaymentStatus] CHECK  (([PaymentStatus]='Refunded' OR [PaymentStatus]='Failed' OR [PaymentStatus]='Completed' OR [PaymentStatus]='Pending'))
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [CK_PaymentStatus]
GO
USE [master]
GO
ALTER DATABASE [TournamentManagement] SET  READ_WRITE 
GO
