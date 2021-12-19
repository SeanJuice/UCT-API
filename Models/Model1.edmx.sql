
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/19/2021 21:03:25
-- Generated from EDMX file: C:\Users\shaun\OneDrive\Documents\MY PROJECTS\UCT\API\Models\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [UCT];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CourseCentres_Centres_CentreId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseCentres] DROP CONSTRAINT [FK_CourseCentres_Centres_CentreId];
GO
IF OBJECT_ID(N'[dbo].[FK_CourseCentres_Courses_CourseId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseCentres] DROP CONSTRAINT [FK_CourseCentres_Courses_CourseId];
GO
IF OBJECT_ID(N'[dbo].[FK_CourseCentres_Users]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CourseCentres] DROP CONSTRAINT [FK_CourseCentres_Users];
GO
IF OBJECT_ID(N'[dbo].[FK_Courses_Sessions_SessionId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Courses] DROP CONSTRAINT [FK_Courses_Sessions_SessionId];
GO
IF OBJECT_ID(N'[dbo].[FK_Courses_Subjects_SubjectId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Courses] DROP CONSTRAINT [FK_Courses_Subjects_SubjectId];
GO
IF OBJECT_ID(N'[dbo].[FK_Courses_UserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Courses] DROP CONSTRAINT [FK_Courses_UserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_RegisteredCourses_Courses_CourseId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredCourses] DROP CONSTRAINT [FK_RegisteredCourses_Courses_CourseId];
GO
IF OBJECT_ID(N'[dbo].[FK_RegisteredCourses_Users_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RegisteredCourses] DROP CONSTRAINT [FK_RegisteredCourses_Users_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_UserRole]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_UserRole];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_UserTypes_UserTypeId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Users] DROP CONSTRAINT [FK_Users_UserTypes_UserTypeId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Centres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Centres];
GO
IF OBJECT_ID(N'[dbo].[CourseCentres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CourseCentres];
GO
IF OBJECT_ID(N'[dbo].[Courses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Courses];
GO
IF OBJECT_ID(N'[dbo].[RegisteredCourses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RegisteredCourses];
GO
IF OBJECT_ID(N'[dbo].[Sessions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sessions];
GO
IF OBJECT_ID(N'[dbo].[Subjects]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subjects];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[UserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRole];
GO
IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[UserTypes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserTypes];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Centres'
CREATE TABLE [dbo].[Centres] (
    [CentreId] int IDENTITY(1,1) NOT NULL,
    [CentreName] nvarchar(max)  NULL,
    [CentreLocation] nvarchar(max)  NULL
);
GO

-- Creating table 'CourseCentres'
CREATE TABLE [dbo].[CourseCentres] (
    [CourseCentreId] int IDENTITY(1,1) NOT NULL,
    [CourseId] int  NOT NULL,
    [CentreId] int  NOT NULL,
    [userId] int  NULL
);
GO

-- Creating table 'Courses'
CREATE TABLE [dbo].[Courses] (
    [CourseId] int IDENTITY(1,1) NOT NULL,
    [CourseDesc] nvarchar(max)  NULL,
    [SubjectId] int  NOT NULL,
    [SessionId] int  NULL,
    [Usertype] int  NULL
);
GO

-- Creating table 'RegisteredCourses'
CREATE TABLE [dbo].[RegisteredCourses] (
    [RegisteredCourseId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NOT NULL,
    [CourseId] int  NOT NULL
);
GO

-- Creating table 'Sessions'
CREATE TABLE [dbo].[Sessions] (
    [SessionId] int IDENTITY(1,1) NOT NULL,
    [Date] nvarchar(max)  NULL,
    [StartTime] nvarchar(max)  NULL,
    [EndTime] nvarchar(max)  NULL
);
GO

-- Creating table 'Subjects'
CREATE TABLE [dbo].[Subjects] (
    [SubjectId] int IDENTITY(1,1) NOT NULL,
    [SubjectDesc] nvarchar(max)  NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'UserRoles'
CREATE TABLE [dbo].[UserRoles] (
    [id] int IDENTITY(1,1) NOT NULL,
    [name] varchar(50)  NOT NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [id] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(max)  NOT NULL,
    [Surname] varchar(max)  NOT NULL,
    [UserTypeId] int  NULL,
    [CentreId] int  NULL,
    [Username] varchar(50)  NOT NULL,
    [Password] varchar(max)  NOT NULL,
    [UserRole_ID] int  NOT NULL,
    [Email] varchar(50)  NOT NULL,
    [isAtSchool] int  NULL,
    [SchoolName] varchar(50)  NULL,
    [CourseCentreId] int  NULL
);
GO

-- Creating table 'UserTypes'
CREATE TABLE [dbo].[UserTypes] (
    [UserTypeId] int IDENTITY(1,1) NOT NULL,
    [UserTypeDesc] nvarchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CentreId] in table 'Centres'
ALTER TABLE [dbo].[Centres]
ADD CONSTRAINT [PK_Centres]
    PRIMARY KEY CLUSTERED ([CentreId] ASC);
GO

-- Creating primary key on [CourseCentreId] in table 'CourseCentres'
ALTER TABLE [dbo].[CourseCentres]
ADD CONSTRAINT [PK_CourseCentres]
    PRIMARY KEY CLUSTERED ([CourseCentreId] ASC);
GO

-- Creating primary key on [CourseId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [PK_Courses]
    PRIMARY KEY CLUSTERED ([CourseId] ASC);
GO

-- Creating primary key on [RegisteredCourseId] in table 'RegisteredCourses'
ALTER TABLE [dbo].[RegisteredCourses]
ADD CONSTRAINT [PK_RegisteredCourses]
    PRIMARY KEY CLUSTERED ([RegisteredCourseId] ASC);
GO

-- Creating primary key on [SessionId] in table 'Sessions'
ALTER TABLE [dbo].[Sessions]
ADD CONSTRAINT [PK_Sessions]
    PRIMARY KEY CLUSTERED ([SessionId] ASC);
GO

-- Creating primary key on [SubjectId] in table 'Subjects'
ALTER TABLE [dbo].[Subjects]
ADD CONSTRAINT [PK_Subjects]
    PRIMARY KEY CLUSTERED ([SubjectId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [id] in table 'UserRoles'
ALTER TABLE [dbo].[UserRoles]
ADD CONSTRAINT [PK_UserRoles]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([id] ASC);
GO

-- Creating primary key on [UserTypeId] in table 'UserTypes'
ALTER TABLE [dbo].[UserTypes]
ADD CONSTRAINT [PK_UserTypes]
    PRIMARY KEY CLUSTERED ([UserTypeId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CentreId] in table 'CourseCentres'
ALTER TABLE [dbo].[CourseCentres]
ADD CONSTRAINT [FK_CourseCentres_Centres_CentreId]
    FOREIGN KEY ([CentreId])
    REFERENCES [dbo].[Centres]
        ([CentreId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseCentres_Centres_CentreId'
CREATE INDEX [IX_FK_CourseCentres_Centres_CentreId]
ON [dbo].[CourseCentres]
    ([CentreId]);
GO

-- Creating foreign key on [CentreId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Centres_CentreId]
    FOREIGN KEY ([CentreId])
    REFERENCES [dbo].[Centres]
        ([CentreId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Centres_CentreId'
CREATE INDEX [IX_FK_Users_Centres_CentreId]
ON [dbo].[Users]
    ([CentreId]);
GO

-- Creating foreign key on [CourseId] in table 'CourseCentres'
ALTER TABLE [dbo].[CourseCentres]
ADD CONSTRAINT [FK_CourseCentres_Courses_CourseId]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([CourseId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseCentres_Courses_CourseId'
CREATE INDEX [IX_FK_CourseCentres_Courses_CourseId]
ON [dbo].[CourseCentres]
    ([CourseId]);
GO

-- Creating foreign key on [SessionId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_Courses_Sessions_SessionId]
    FOREIGN KEY ([SessionId])
    REFERENCES [dbo].[Sessions]
        ([SessionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Courses_Sessions_SessionId'
CREATE INDEX [IX_FK_Courses_Sessions_SessionId]
ON [dbo].[Courses]
    ([SessionId]);
GO

-- Creating foreign key on [SubjectId] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_Courses_Subjects_SubjectId]
    FOREIGN KEY ([SubjectId])
    REFERENCES [dbo].[Subjects]
        ([SubjectId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Courses_Subjects_SubjectId'
CREATE INDEX [IX_FK_Courses_Subjects_SubjectId]
ON [dbo].[Courses]
    ([SubjectId]);
GO

-- Creating foreign key on [Usertype] in table 'Courses'
ALTER TABLE [dbo].[Courses]
ADD CONSTRAINT [FK_Courses_UserRole]
    FOREIGN KEY ([Usertype])
    REFERENCES [dbo].[UserRoles]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Courses_UserRole'
CREATE INDEX [IX_FK_Courses_UserRole]
ON [dbo].[Courses]
    ([Usertype]);
GO

-- Creating foreign key on [CourseId] in table 'RegisteredCourses'
ALTER TABLE [dbo].[RegisteredCourses]
ADD CONSTRAINT [FK_RegisteredCourses_Courses_CourseId]
    FOREIGN KEY ([CourseId])
    REFERENCES [dbo].[Courses]
        ([CourseId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegisteredCourses_Courses_CourseId'
CREATE INDEX [IX_FK_RegisteredCourses_Courses_CourseId]
ON [dbo].[RegisteredCourses]
    ([CourseId]);
GO

-- Creating foreign key on [UserId] in table 'RegisteredCourses'
ALTER TABLE [dbo].[RegisteredCourses]
ADD CONSTRAINT [FK_RegisteredCourses_Users_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RegisteredCourses_Users_UserId'
CREATE INDEX [IX_FK_RegisteredCourses_Users_UserId]
ON [dbo].[RegisteredCourses]
    ([UserId]);
GO

-- Creating foreign key on [UserRole_ID] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_UserRole]
    FOREIGN KEY ([UserRole_ID])
    REFERENCES [dbo].[UserRoles]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_UserRole'
CREATE INDEX [IX_FK_Users_UserRole]
ON [dbo].[Users]
    ([UserRole_ID]);
GO

-- Creating foreign key on [UserTypeId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_UserTypes_UserTypeId]
    FOREIGN KEY ([UserTypeId])
    REFERENCES [dbo].[UserTypes]
        ([UserTypeId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_UserTypes_UserTypeId'
CREATE INDEX [IX_FK_Users_UserTypes_UserTypeId]
ON [dbo].[Users]
    ([UserTypeId]);
GO

-- Creating foreign key on [userId] in table 'CourseCentres'
ALTER TABLE [dbo].[CourseCentres]
ADD CONSTRAINT [FK_CourseCentres_Users]
    FOREIGN KEY ([userId])
    REFERENCES [dbo].[Users]
        ([id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseCentres_Users'
CREATE INDEX [IX_FK_CourseCentres_Users]
ON [dbo].[CourseCentres]
    ([userId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------