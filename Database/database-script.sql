USE [master]
GO
/****** Object:  Database [UCT]    Script Date: 2021/12/19 18:22:54 ******/
CREATE DATABASE [UCT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UCT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UCT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UCT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UCT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UCT] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UCT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UCT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UCT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UCT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UCT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UCT] SET ARITHABORT OFF 
GO
ALTER DATABASE [UCT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UCT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UCT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UCT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UCT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UCT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UCT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UCT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UCT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UCT] SET  ENABLE_BROKER 
GO
ALTER DATABASE [UCT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UCT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UCT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UCT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UCT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UCT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UCT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UCT] SET RECOVERY FULL 
GO
ALTER DATABASE [UCT] SET  MULTI_USER 
GO
ALTER DATABASE [UCT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UCT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UCT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UCT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UCT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UCT] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UCT', N'ON'
GO
ALTER DATABASE [UCT] SET QUERY_STORE = OFF
GO
USE [UCT]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseId] [int] IDENTITY(1,1) NOT NULL,
	[CourseDesc] [nvarchar](max) NULL,
	[SubjectId] [int] NOT NULL,
	[SessionId] [int] NULL,
	[Usertype] [int] NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[Junior_courses]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Junior_courses]
AS
SELECT CourseId, CourseDesc
FROM     dbo.Courses
WHERE  (Usertype = 1)
GO
/****** Object:  View [dbo].[senior_courses]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[senior_courses]
AS
SELECT CourseId, CourseDesc
FROM     dbo.Courses
WHERE  (Usertype = 2)
GO
/****** Object:  Table [dbo].[Centres]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Centres](
	[CentreId] [int] IDENTITY(1,1) NOT NULL,
	[CentreName] [nvarchar](max) NULL,
	[CentreLocation] [nvarchar](max) NULL,
 CONSTRAINT [PK_Centres] PRIMARY KEY CLUSTERED 
(
	[CentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseCentres]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCentres](
	[CourseCentreId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[CentreId] [int] NOT NULL,
 CONSTRAINT [PK_CourseCentres] PRIMARY KEY CLUSTERED 
(
	[CourseCentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegisteredCourses](
	[RegisteredCourseId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_RegisteredCourses] PRIMARY KEY CLUSTERED 
(
	[RegisteredCourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionId] [int] IDENTITY(1,1) NOT NULL,
	[Date] [nvarchar](max) NULL,
	[StartTime] [nvarchar](max) NULL,
	[EndTime] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sessions] PRIMARY KEY CLUSTERED 
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_Subjects] PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[Surname] [varchar](max) NOT NULL,
	[UserTypeId] [int] NULL,
	[CentreId] [int] NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[UserRole_ID] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[isAtSchool] [int] NULL,
	[SchoolName] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2021/12/19 18:22:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeDesc] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTypes] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseCentres_CentreId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_CourseCentres_CentreId] ON [dbo].[CourseCentres]
(
	[CentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseCentres_CourseId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_CourseCentres_CourseId] ON [dbo].[CourseCentres]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Courses_SessionId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_Courses_SessionId] ON [dbo].[Courses]
(
	[SessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Courses_SubjectId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_Courses_SubjectId] ON [dbo].[Courses]
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisteredCourses_CourseId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_RegisteredCourses_CourseId] ON [dbo].[RegisteredCourses]
(
	[CourseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RegisteredCourses_UserId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_RegisteredCourses_UserId] ON [dbo].[RegisteredCourses]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_CentreId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_Users_CentreId] ON [dbo].[Users]
(
	[CentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_UserTypeId]    Script Date: 2021/12/19 18:22:54 ******/
CREATE NONCLUSTERED INDEX [IX_Users_UserTypeId] ON [dbo].[Users]
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CourseCentres]  WITH CHECK ADD  CONSTRAINT [FK_CourseCentres_Centres_CentreId] FOREIGN KEY([CentreId])
REFERENCES [dbo].[Centres] ([CentreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseCentres] CHECK CONSTRAINT [FK_CourseCentres_Centres_CentreId]
GO
ALTER TABLE [dbo].[CourseCentres]  WITH CHECK ADD  CONSTRAINT [FK_CourseCentres_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseCentres] CHECK CONSTRAINT [FK_CourseCentres_Courses_CourseId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Sessions_SessionId] FOREIGN KEY([SessionId])
REFERENCES [dbo].[Sessions] ([SessionId])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Sessions_SessionId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_Subjects_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subjects] ([SubjectId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_Subjects_SubjectId]
GO
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_UserRole] FOREIGN KEY([Usertype])
REFERENCES [dbo].[UserRole] ([id])
GO
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_UserRole]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_Courses_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Courses] ([CourseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_Courses_CourseId]
GO
ALTER TABLE [dbo].[RegisteredCourses]  WITH CHECK ADD  CONSTRAINT [FK_RegisteredCourses_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegisteredCourses] CHECK CONSTRAINT [FK_RegisteredCourses_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Centres_CentreId] FOREIGN KEY([CentreId])
REFERENCES [dbo].[Centres] ([CentreId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Centres_CentreId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([UserRole_ID])
REFERENCES [dbo].[UserRole] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypes_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypes] ([UserTypeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserTypes_UserTypeId]
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
         Begin Table = "Courses"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Junior_courses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Junior_courses'
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
         Begin Table = "Courses"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 170
               Right = 242
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
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 2400
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'senior_courses'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'senior_courses'
GO
USE [master]
GO
ALTER DATABASE [UCT] SET  READ_WRITE 
GO
