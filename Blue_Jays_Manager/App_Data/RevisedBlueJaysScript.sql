USE [master]
GO
/****** Object:  Database [Blue_Jays_Manager]    Script Date: 7/29/2016 2:47:10 PM ******/
CREATE DATABASE [Blue_Jays_Manager]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blue_Jays_Manager', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Blue_Jays_Manager.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Blue_Jays_Manager_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Blue_Jays_Manager_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blue_Jays_Manager].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blue_Jays_Manager] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blue_Jays_Manager] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blue_Jays_Manager] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Blue_Jays_Manager] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blue_Jays_Manager] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Blue_Jays_Manager] SET  MULTI_USER 
GO
ALTER DATABASE [Blue_Jays_Manager] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blue_Jays_Manager] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blue_Jays_Manager] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blue_Jays_Manager] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Blue_Jays_Manager] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Blue_Jays_Manager] SET QUERY_STORE = OFF
GO
USE [Blue_Jays_Manager]
GO
/****** Object:  Table [dbo].[BattingStats]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BattingStats](
	[BattingStatsID] [int] NOT NULL,
	[PlayerNum] [int] NOT NULL,
	[BatStatYear] [nvarchar](50) NULL,
	[Team] [nvarchar](50) NULL,
	[League] [nvarchar](10) NULL,
	[Games] [int] NOT NULL,
	[AtBats] [int] NOT NULL,
	[Runs] [int] NOT NULL,
	[Hits] [int] NOT NULL,
	[TotalBases] [int] NOT NULL,
	[Doubles] [int] NOT NULL,
	[Triples] [int] NOT NULL,
	[HomeRuns] [int] NOT NULL,
	[RunsBattedIn] [int] NOT NULL,
	[BasesOnBalls] [int] NOT NULL,
	[IntentionalBasesOnBalls] [int] NOT NULL,
	[Strikeouts] [int] NOT NULL,
	[StolenBases] [int] NOT NULL,
	[CaughtStealing] [int] NOT NULL,
	[BattingAverage] [float] NOT NULL,
	[OnBasePercentage] [float] NOT NULL,
	[SluggingPercentage] [float] NOT NULL,
	[OnBasePlusSlugging] [float] NOT NULL,
	[GroundOrAirOuts] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BattingStatsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CoachRoster]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CoachRoster](
	[CoachID] [int] NOT NULL,
	[CoachNumber] [int] NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Position] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CoachID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldingStats]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FieldingStats](
	[FieldingStatsID] [int] NOT NULL,
	[PlayerNum] [int] NOT NULL,
	[FieldStatYear] [nvarchar](30) NULL,
	[Team] [nvarchar](30) NULL,
	[League] [nvarchar](30) NULL,
	[Position] [nvarchar](30) NULL,
	[Games] [int] NOT NULL,
	[GamesStarted] [int] NOT NULL,
	[InningsAtThisPosition] [float] NOT NULL,
	[TotalChances] [int] NOT NULL,
	[Putouts] [int] NOT NULL,
	[Assists] [int] NOT NULL,
	[Errors] [int] NOT NULL,
	[DoublePlays] [int] NOT NULL,
	[PassedBall] [int] NOT NULL,
	[StolenBases] [int] NOT NULL,
	[CaughtStealing] [int] NOT NULL,
	[RangeFactor] [float] NOT NULL,
	[FieldingPercentage] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FieldingStatsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PitchingStats]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PitchingStats](
	[PitchingStatsID] [int] NOT NULL,
	[PlayerNum] [int] NOT NULL,
	[PitchStatYear] [nvarchar](30) NULL,
	[Team] [nvarchar](10) NULL,
	[League] [nvarchar](30) NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[EarnedRunsAverage] [float] NOT NULL,
	[Games] [int] NOT NULL,
	[GamesStarted] [int] NOT NULL,
	[CompleteGames] [int] NOT NULL,
	[ShutOuts] [int] NOT NULL,
	[Saves] [int] NOT NULL,
	[SaveOpportunities] [int] NOT NULL,
	[InningsPitched] [float] NOT NULL,
	[Hits] [int] NOT NULL,
	[Runs] [int] NOT NULL,
	[EarnedRuns] [int] NOT NULL,
	[HomeRuns] [int] NOT NULL,
	[HitBatsmen] [int] NOT NULL,
	[BasesOnBalls] [int] NOT NULL,
	[IntentionalBasesOnBalls] [int] NOT NULL,
	[StrikeOuts] [int] NOT NULL,
	[BattingAverage] [float] NOT NULL,
	[WalksAndHitsPerInningsPitched] [float] NOT NULL,
	[GroundOrAirOuts] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PitchingStatsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerBio]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerBio](
	[PlayerBioID] [int] NOT NULL,
	[PlayerNum] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Age] [int] NOT NULL,
	[Born] [nvarchar](max) NOT NULL,
	[Draft] [nvarchar](max) NULL,
	[HighSchool] [nvarchar](max) NULL,
	[College] [nvarchar](max) NULL,
	[Debut] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerBioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerRoster]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerRoster](
	[PlayerID] [int] NOT NULL,
	[PlayerNum] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Position] [nvarchar](max) NOT NULL,
	[Height] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[SkillOrientation] [nvarchar](max) NOT NULL,
	[DateOfBirth] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PlayerStatsSummaries]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerStatsSummaries](
	[PlayerStatsSummaryID] [int] NOT NULL,
	[PlayerNum] [int] NOT NULL,
	[SummaryYear] [nvarchar](max) NULL,
	[Wins] [int] NOT NULL,
	[Losses] [int] NOT NULL,
	[EarnedRunsAverage] [float] NOT NULL,
	[Games] [int] NOT NULL,
	[GamesStarted] [int] NOT NULL,
	[Saves] [int] NOT NULL,
	[InningsPitched] [float] NOT NULL,
	[StrikeOuts] [int] NOT NULL,
	[WalkAndHitsPerInningsPitched] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlayerStatsSummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
	[Attempts] [int] NULL,
	[IsLocked] [bit] NULL,
	[LockedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  StoredProcedure [dbo].[spAuthenticateUser]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[spAuthenticateUser]
@UserName nvarchar(100),
@Password nvarchar(200)
as
Begin
 Declare @AccountLocked bit
 Declare @Count int
 Declare @RetryCount int
 
 Select @AccountLocked = IsLocked
 from tblUsers where UserName = @UserName
  
 --If the account is already locked
 if(@AccountLocked = 1)
 Begin
  Select 1 as AccountLocked, 0 as Authenticated, 0 as RetryAttempts
 End
 Else
 Begin
  -- Check if the username and password match
  Select @Count = COUNT(UserName) from tblUsers
  where [UserName] = @UserName and [Password] = @Password
  
  -- If match found
  if(@Count = 1)
  Begin
   -- Reset RetryAttempts 
   Update tblUsers set Attempts = 0
   where UserName = @UserName
       
   Select Id, FirstName, LastName, Email, UserName, Password, Role from tblUsers
   where UserName = @UserName

  End
  Else
  Begin
   -- If a match is not found
   Select @RetryCount = IsNULL(Attempts, 0)
   from tblUsers
   where UserName = @UserName
   
   Set @RetryCount = @RetryCount + 1
   
   if(@RetryCount <= 3)
   Begin
    -- If re-try attempts are not completed
    Update tblUsers set Attempts = @RetryCount
    where UserName = @UserName 
    
    Select 0 as AccountLocked, 0 as Authenticated, @RetryCount as RetryAttempts
   End
   Else
   Begin
    -- If re-try attempts are completed
    Update tblUsers set Attempts = @RetryCount,
    IsLocked = 1, LockedDate = GETDATE()
    where UserName = @UserName

    Select 1 as AccountLocked, 0 as Authenticated, 0 as RetryAttempts
   End
  End
 End
End

GO
/****** Object:  StoredProcedure [dbo].[spEnableAdminUser]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spEnableAdminUser]
@FirstName nvarchar(50),
@LastName nvarchar(50)
as
                Begin
                                Update tblUsers
                                set Attempts = 0, IsLocked = Null, LockedDate = Null
                                where FirstName = @FirstName and LastName = @LastName
                End


GO
/****** Object:  StoredProcedure [dbo].[spGetLockedUsers]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[spGetLockedUsers]
as
                begin
                                select FirstName, LastName, UserName, Role, IsLocked from tblUsers
                                where IsLocked = 1;
                end

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoBattingStats]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertIntoBattingStats]
@battingStatsID int,
@playerNum int,
@batStatYear nvarchar(50),
@team nvarchar(50),
@league nvarchar(10),
@games int,
@atBats int,
@runs int,
@hits int,
@totalBases int,
@doubles int,
@triples int,
@homeRuns int,
@runsBattedIn int,
@basesOnBalls int,
@intentionalBasesOnBalls int,
@strikeouts int,
@stolenBases int,
@caughtStealing int,
@battingAverage float,
@onBasePercentage float,
@sluggingPercentage float,
@onBasePlusSlugging float,
@groundOrAirOuts float
as
	Begin
		IF 
		(
			(
				SELECT COUNT(*)
				FROM [BattingStats]
				WHERE [BattingStatsID] = @battingStatsID
			) = 0 
		)	
		INSERT INTO [BattingStats]
           ([BattingStatsID],
		   [PlayerNum]
           ,[BatStatYear]
           ,[Team]
           ,[League]
           ,[Games]
           ,[AtBats]
           ,[Runs]
           ,[Hits]
           ,[TotalBases]
           ,[Doubles]
           ,[Triples]
           ,[HomeRuns]
           ,[RunsBattedIn]
           ,[BasesOnBalls]
           ,[IntentionalBasesOnBalls]
           ,[Strikeouts]
           ,[StolenBases]
           ,[CaughtStealing]
           ,[BattingAverage]
           ,[OnBasePercentage]
           ,[SluggingPercentage]
           ,[OnBasePlusSlugging]
           ,[GroundOrAirOuts])
     VALUES
           (@battingStatsID,
			@playerNum,
            @batStatYear,
            @team,
            @league,
            @games,
            @atBats,
            @runs,
            @hits,
            @totalBases,
            @doubles,
            @triples,
            @homeRuns,
            @runsBattedIn,
            @basesOnBalls,
            @intentionalBasesOnBalls,
            @strikeouts,
            @stolenBases,
            @caughtStealing,
            @battingAverage,
            @onBasePercentage,
            @sluggingPercentage,
            @onBasePlusSlugging,
            @groundOrAirOuts)
	End

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoCoachRoster]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertIntoCoachRoster]
@coachID int,
@coachNumber int,
@name nvarchar(30),
@position nvarchar(30)
as
	Begin
		IF (
			(
				SELECT COUNT(*)
				FROM [CoachRoster]
				WHERE [CoachID] = @coachID
			) = 0 
		)
		INSERT INTO [CoachRoster]
           ([CoachID],
		   [CoachNumber]
           ,[Name]
           ,[Position])
     VALUES
           (@coachID,
		   @coachNumber,
            @name,
            @position)
	End

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoFieldingStats]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertIntoFieldingStats]
@fieldingStatsID int,
@playerNum int,
@fieldStatYear nvarchar(30),
@team nvarchar(30),
@league nvarchar(30),
@position nvarchar(30),
@games int,
@gamesStarted int,
@inningsAtThisPosition float,
@totalChances int,
@putOuts int,
@assists int,
@errors int,
@doublePlays int,
@passedBall int,
@stolenBases int,
@caughtStealing int,
@rangeFactor float,
@fieldingPercentage float
as
	Begin
		IF (
			(
				SELECT COUNT(*)
				FROM [FieldingStats]
				WHERE [FieldingStatsID] = @fieldingStatsID
			) = 0 
		)
		INSERT INTO [FieldingStats]
           ([FieldingStatsID],
		   [PlayerNum]
           ,[FieldStatYear]
           ,[Team]
           ,[League]
           ,[Position]
           ,[Games]
           ,[GamesStarted]
           ,[InningsAtThisPosition]
           ,[TotalChances]
           ,[Putouts]
           ,[Assists]
           ,[Errors]
           ,[DoublePlays]
           ,[PassedBall]
           ,[StolenBases]
           ,[CaughtStealing]
           ,[RangeFactor]
           ,[FieldingPercentage])
     VALUES
           (@fieldingStatsID,
			@playerNum,
			@fieldStatYear,
			@team,
			@league,
			@position,
			@games,
			@gamesStarted,
			@inningsAtThisPosition,
			@totalChances,
			@putOuts,
			@assists,
			@errors,
			@doublePlays,
			@passedBall,
			@stolenBases,
			@caughtStealing ,
			@rangeFactor,
			@fieldingPercentage)
	End

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoPitchingStats]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertIntoPitchingStats]
@pitchingStatsID int,
@playerNum int,
@pitchStatYear nvarchar(30),
@team nvarchar(10),
@league nvarchar(30),
@wins int,
@losses int,
@earnedRunsAverage float,
@games int,
@gamesStarted int,
@completeGames int,
@shutOuts int,
@saves int,
@saveOpportunities int,
@inningsPitched float,
@hits int,
@runs int,
@earnedRuns int,
@homeRuns int,
@hitBatsmen int,
@basesOnBalls int,
@intentionalBasesOnBalls int,
@strikeOuts int,
@battingAverage float,
@walksAndHitsPerInningsPitched float,
@groundOrAirOuts float
as 
	Begin
	IF (
			(
				SELECT COUNT(*)
				FROM [PitchingStats]
				WHERE [PitchingStatsID] = @pitchingStatsID
			) = 0 
		)
		INSERT INTO [PitchingStats]
           ([PitchingStatsID],
			[PlayerNum]
           ,[PitchStatYear]
           ,[Team]
           ,[League]
           ,[Wins]
           ,[Losses]
           ,[EarnedRunsAverage]
           ,[Games]
           ,[GamesStarted]
           ,[CompleteGames]
           ,[ShutOuts]
           ,[Saves]
           ,[SaveOpportunities]
           ,[InningsPitched]
           ,[Hits]
           ,[Runs]
           ,[EarnedRuns]
           ,[HomeRuns]
           ,[HitBatsmen]
           ,[BasesOnBalls]
           ,[IntentionalBasesOnBalls]
           ,[StrikeOuts]
           ,[BattingAverage]
           ,[WalksAndHitsPerInningsPitched]
           ,[GroundOrAirOuts])
     VALUES
           (@pitchingStatsID,
			@playerNum,
			@pitchStatYear,
			@team,
			@league,
			@wins,
			@losses,
			@earnedRunsAverage,
			@games,
			@gamesStarted,
			@completeGames,
			@shutOuts,
			@saves,
			@saveOpportunities,
			@inningsPitched,
			@hits,
			@runs,
			@earnedRuns,
			@homeRuns,
			@hitBatsmen,
			@basesOnBalls,
			@intentionalBasesOnBalls,
			@strikeOuts,
			@battingAverage,
			@walksAndHitsPerInningsPitched,
			@groundOrAirOuts)
	End

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoPlayerBio]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertIntoPlayerBio]
@playerBioID int,
@playerNum int,
@name nvarchar(max),
@age int,
@born nvarchar(max),
@draft nvarchar(max),
@highSchool nvarchar(max),
@college nvarchar(max),
@debut nvarchar(max)
as
	Begin
		IF (
			(
				SELECT COUNT(*)
				FROM [PlayerBio]
				WHERE [PlayerBioID] = @playerBioID
			) = 0 
		)
		INSERT INTO [PlayerBio]
           ([PlayerBioID],
			[PlayerNum]
           ,[Name]
           ,[Age]
           ,[Born]
           ,[Draft]
           ,[HighSchool]
           ,[College]
           ,[Debut])
     VALUES
           (@playerBioID,
			@playerNum,
			@name,
			@age,
			@born,
			@draft,
			@highSchool,
			@college,
			@debut)
	End

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoPlayerRoster]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spInsertIntoPlayerRoster]
@playerID int,
@playerNum int,
@name nvarchar(max),
@position nvarchar(max),
@height int,
@weight int,
@skillOrientation nvarchar(max),
@dateOfBirth nvarchar(max)
as
	Begin
	IF (
			(
				SELECT COUNT(*)
				FROM [PlayerRoster]
				WHERE [PlayerID] = @playerID
			) = 0 
		)
		INSERT INTO [PlayerRoster]
           ([PLayerID],
		   [PlayerNum]
           ,[Name]
           ,[Position]
           ,[Height]
           ,[Weight]
           ,[SkillOrientation]
           ,[DateOfBirth])
     VALUES
			(@playerID,
			@playerNum,
			@name,
			@position,
			@height,
			@weight,
			@skillOrientation,
			@dateOfBirth)
	End

GO
/****** Object:  StoredProcedure [dbo].[spInsertIntoPlayerStatsSummary]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spInsertIntoPlayerStatsSummary]
@playerStatsSummaryID int,
@playerNum int,
@summaryYear nvarchar(max),
@wins int,
@losses int,
@earnedRunsAverage float,
@games int,
@gamesStarted int,
@saves int,
@inningsPitched float,
@strikeOuts int,
@walkAndHitsPerInningsPitched float
as
	Begin
	IF (
			(
				SELECT COUNT(*)
				FROM [PlayerStatsSummaries]
				WHERE [PlayerStatsSummaryID] = @playerStatsSummaryID
			) = 0 
		)
		INSERT INTO [PlayerStatsSummaries]
           ([PlayerStatsSummaryID],
			[PlayerNum]
           ,[SummaryYear]
           ,[Wins]
           ,[Losses]
           ,[EarnedRunsAverage]
           ,[Games]
           ,[GamesStarted]
           ,[Saves]
           ,[InningsPitched]
           ,[StrikeOuts]
           ,[WalkAndHitsPerInningsPitched])
     VALUES
           (@playerStatsSummaryID,
		   @playerNum,
			@summaryYear,
			@wins,
			@losses,
			@earnedRunsAverage,
			@games,
			@gamesStarted,
			@saves,
			@inningsPitched,
			@strikeOuts,
			@walkAndHitsPerInningsPitched)
	End

GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[spRegisterUser] 
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Email NVARCHAR(50),
@UserName NVARCHAR(50),
@Password NVARCHAR(200),
@Role nvarchar(50)
AS
	BEGIN
		DECLARE @Count INT
		DECLARE @ReturnCode INT

		SELECT @Count = COUNT(UserName)
		FROM tblUsers
		WHERE UserName = @UserName

		IF @Count > 0
			BEGIN
				SET @ReturnCode = - 1
			END
		ELSE
			BEGIN
				SET @ReturnCode = 1

				INSERT INTO tblUsers(FirstName, LastName, Email, UserName, Password, Role)
			VALUES (
						@FirstName,
						@LastName,
						@Email,
						@UserName,
						@Password,
						@Role
					)
			END

			SELECT @ReturnCode AS ReturnValue
END 


GO
/****** Object:  StoredProcedure [dbo].[spSelectCoachRoster]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSelectCoachRoster]
as
	Begin
                Select tblUsers.IsLocked, CoachRoster.Name, CoachRoster.Position, CoachRoster.CoachNumber
                from CoachRoster Left Outer Join tblUsers on SUBSTRING(CoachRoster.Name, 0, CHARINDEX(' ',CoachRoster.Name)) = tblUsers.FirstName 
                and SUBSTRING(CoachRoster.Name, CHARINDEX(' ',CoachRoster.Name) + 1, LEN(CoachRoster.Name)) = tblUsers.LastName
	End
GO
/****** Object:  StoredProcedure [dbo].[spSelectPlayerRoster]    Script Date: 7/29/2016 2:47:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spSelectPlayerRoster]
as
	Begin
		Select * from PlayerRoster
	end
GO
USE [master]
GO
ALTER DATABASE [Blue_Jays_Manager] SET  READ_WRITE 
GO
