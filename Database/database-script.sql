USE [UCT]
GO
/****** Object:  Table [dbo].[Centres]    Script Date: 2021/12/20 01:33:28 ******/
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
/****** Object:  Table [dbo].[CourseCentres]    Script Date: 2021/12/20 01:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseCentres](
	[CourseCentreId] [int] IDENTITY(1,1) NOT NULL,
	[CourseId] [int] NOT NULL,
	[CentreId] [int] NOT NULL,
	[userId] [int] NOT NULL,
	[Marks] [float] NULL,
	[Comments] [varchar](max) NULL,
 CONSTRAINT [PK_CourseCentres] PRIMARY KEY CLUSTERED 
(
	[CourseCentreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2021/12/20 01:33:28 ******/
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
/****** Object:  Table [dbo].[RegisteredCourses]    Script Date: 2021/12/20 01:33:28 ******/
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
/****** Object:  Table [dbo].[Sessions]    Script Date: 2021/12/20 01:33:28 ******/
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
/****** Object:  Table [dbo].[Subjects]    Script Date: 2021/12/20 01:33:28 ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 2021/12/20 01:33:28 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2021/12/20 01:33:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](max) NOT NULL,
	[Surname] [varchar](max) NOT NULL,
	[UserTypeId] [int] NULL,
	[CourseCentreId] [int] NULL,
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
/****** Object:  Table [dbo].[UserTypes]    Script Date: 2021/12/20 01:33:28 ******/
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
SET IDENTITY_INSERT [dbo].[Centres] ON 

INSERT [dbo].[Centres] ([CentreId], [CentreName], [CentreLocation]) VALUES (1, N'bisho 1', N'Johannesburg')
INSERT [dbo].[Centres] ([CentreId], [CentreName], [CentreLocation]) VALUES (2, N'bisho 2', N'Cape Town')
INSERT [dbo].[Centres] ([CentreId], [CentreName], [CentreLocation]) VALUES (3, N'King Williams Town', N' Eastern Cape ')
INSERT [dbo].[Centres] ([CentreId], [CentreName], [CentreLocation]) VALUES (4, N'Soweto', N'Soweto')
SET IDENTITY_INSERT [dbo].[Centres] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseCentres] ON 

INSERT [dbo].[CourseCentres] ([CourseCentreId], [CourseId], [CentreId], [userId], [Marks], [Comments]) VALUES (1, 2, 1, 7, NULL, NULL)
INSERT [dbo].[CourseCentres] ([CourseCentreId], [CourseId], [CentreId], [userId], [Marks], [Comments]) VALUES (2, 3, 1, 7, NULL, NULL)
INSERT [dbo].[CourseCentres] ([CourseCentreId], [CourseId], [CentreId], [userId], [Marks], [Comments]) VALUES (3, 2, 1, 7, NULL, NULL)
INSERT [dbo].[CourseCentres] ([CourseCentreId], [CourseId], [CentreId], [userId], [Marks], [Comments]) VALUES (4, 3, 1, 7, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CourseCentres] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (2, N'Grade 6 Mathjr', 5, 1, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (3, N'Grade 7 Mathjr', 5, 1, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (4, N'Grade 6 ICTjr', 6, 1, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (5, N'Grade 7 ICTjr', 6, 1, 1)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (6, N'Grade 8 Maths', 1, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (8, N'Grade 9 Math', 1, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (9, N'Grade 10 Math', 1, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (10, N'Grade 11 Math', 1, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (11, N'Grade 12 Math', 1, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (16, N'Grade 8 ICT', 4, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (17, N'Grade 9 ICT', 4, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (18, N'Grade 10 ICT', 4, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (19, N'Grade 11 ICT', 4, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (20, N'Grade 12 ICT', 4, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (21, N'Grade 8 Accounting', 2, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (22, N'Grade 9 Accounting', 2, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (23, N'Grade 10 Accounting', 2, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (26, N'Grade 11 Accounting', 2, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (27, N'Grade 12 Accounting', 2, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (28, N'Grade 8 Physics', 3, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (30, N'Grade 9 Physics', 3, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (31, N'Grade 10 Physics', 3, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (32, N'Grade 11 Physics', 3, 1, 2)
INSERT [dbo].[Courses] ([CourseId], [CourseDesc], [SubjectId], [SessionId], [Usertype]) VALUES (33, N'Grade 12 Physics', 3, 1, 2)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Sessions] ON 

INSERT [dbo].[Sessions] ([SessionId], [Date], [StartTime], [EndTime]) VALUES (1, N'2021-12-19', N'01:00', N'02:00')
SET IDENTITY_INSERT [dbo].[Sessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([SubjectId], [SubjectDesc]) VALUES (1, N'Math')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectDesc]) VALUES (2, N'Accounting')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectDesc]) VALUES (3, N'Physics')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectDesc]) VALUES (4, N'ICT')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectDesc]) VALUES (5, N'Mathjr')
INSERT [dbo].[Subjects] ([SubjectId], [SubjectDesc]) VALUES (6, N'ICTjr')
SET IDENTITY_INSERT [dbo].[Subjects] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([id], [name]) VALUES (1, N'Administrator')
INSERT [dbo].[UserRole] ([id], [name]) VALUES (2, N'Learner')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (1, N'Sha', N'sd', NULL, NULL, N'learn1@gmail.com', N'7B7E55A31B7FBBA7CDAF202C52702529A91ECD7823662F01407D23895E270962', 2, N'learn1@gmail.com', NULL, NULL)
INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (2, N'shaun', N'mlax', NULL, NULL, N'lax', N'7B7E55A31B7FBBA7CDAF202C52702529A91ECD7823662F01407D23895E270962', 2, N'lax', NULL, NULL)
INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (3, N'Shaun', N'mlax', NULL, NULL, N'user1', N'F0ACD6AAF7D3B659F4A5EFA1F8066D0E1AE518336D600194B07DDA56C1BB4643', 2, N'user1', NULL, NULL)
INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (4, N'Shaun', N'malx', NULL, NULL, N'uaw3e', N'7B7E55A31B7FBBA7CDAF202C52702529A91ECD7823662F01407D23895E270962', 2, N'uaw3e', 1, N'aschool')
INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (5, N'Shaun', N'mlax', NULL, NULL, N'School', N'E1EBC371A7E4CDEDBD50FD77CA90006DA80EA66E107FDF51892BC8AD7803A0D7', 2, N'School', 1, N'school')
INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (6, N'Saun', N'aa', 2, NULL, N'1233', N'E1EBC371A7E4CDEDBD50FD77CA90006DA80EA66E107FDF51892BC8AD7803A0D7', 2, N'1233', 1, N'aaschool')
INSERT [dbo].[Users] ([id], [FirstName], [Surname], [UserTypeId], [CourseCentreId], [Username], [Password], [UserRole_ID], [Email], [isAtSchool], [SchoolName]) VALUES (7, N'shau', N'learn', 1, NULL, N'learn12', N'7B7E55A31B7FBBA7CDAF202C52702529A91ECD7823662F01407D23895E270962', 2, N'learn12', 1, N'school')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeDesc]) VALUES (1, N'junior')
INSERT [dbo].[UserTypes] ([UserTypeId], [UserTypeDesc]) VALUES (2, N'senior')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
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
ALTER TABLE [dbo].[CourseCentres]  WITH CHECK ADD  CONSTRAINT [FK_CourseCentres_Users] FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[CourseCentres] CHECK CONSTRAINT [FK_CourseCentres_Users]
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
