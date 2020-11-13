USE [locusnine_assignmentDb]
GO

/****** Object:  Table [dbo].[UserDetails]    Script Date: 13-11-2020 08:25:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[emailPersonal] [varchar](50) NOT NULL,
	[emailOfficial] [varchar](50) NULL,
	[mobileNo] [varchar](50) NULL,
	[roleType] [varchar](50) NOT NULL,
	[status] [varchar](50) NOT NULL,
	[createdAt] [datetime] NOT NULL,
	[lastUpdatedAt] [datetime] NULL,
 CONSTRAINT [PK_UserDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_EmailOfficial] UNIQUE NONCLUSTERED 
(
	[emailOfficial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_EmailPersonal] UNIQUE NONCLUSTERED 
(
	[emailPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO





