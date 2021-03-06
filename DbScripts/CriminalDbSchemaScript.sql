USE [NationalCriminalDatabase]
GO
/****** Object:  Table [dbo].[CrimeDetails]    Script Date: 12-07-2016 17:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrimeDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CriminalId] [int] NOT NULL,
	[CrimeTypeId] [int] NULL,
	[CrimeDate] [date] NULL,
	[ConvictedOn] [date] NULL,
	[Duration] [int] NULL,
 CONSTRAINT [PK_CrimeDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CrimeTypes]    Script Date: 12-07-2016 17:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CrimeTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_CrimeTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12-07-2016 17:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Location] [nvarchar](50) NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MD_Criminals]    Script Date: 12-07-2016 17:35:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MD_Criminals](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NULL,
	[LocationId] [int] NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[Nationality] [nvarchar](50) NULL,
	[Height] [int] NULL,
	[Weight] [int] NULL,
	[InPrison] [bit] NULL,
	[Age]  AS (datediff(year,[DateOfBirth],getdate())),
 CONSTRAINT [PK_MD_Criminals] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CrimeDetails]  WITH CHECK ADD  CONSTRAINT [FK_CrimeDetails_CrimeDetails] FOREIGN KEY([CrimeTypeId])
REFERENCES [dbo].[CrimeTypes] ([Id])
GO
ALTER TABLE [dbo].[CrimeDetails] CHECK CONSTRAINT [FK_CrimeDetails_CrimeDetails]
GO
ALTER TABLE [dbo].[MD_Criminals]  WITH CHECK ADD  CONSTRAINT [FK_MD_Criminals_Locations] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[MD_Criminals] CHECK CONSTRAINT [FK_MD_Criminals_Locations]
GO
