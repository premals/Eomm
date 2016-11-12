USE [DesaiEcom]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 12-11-2016 22:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NULL,
	[LasModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12-11-2016 22:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NULL,
	[LasModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [Name], [UserName], [Password], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (1, N'SuperAdmin', N'superadmin', N'sa', 0, 1, CAST(N'2016-11-11 00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 12-11-2016 22:00:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CheckLogin] 
	-- Add the parameters for the stored procedure here
	@UserName varchar(50),
	@Password varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
			 * 
	FROM 
			Users
	WHERE
			UserName=@UserName and [Password]=@Password

END

GO

