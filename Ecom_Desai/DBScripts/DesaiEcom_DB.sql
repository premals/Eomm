USE [DesaiEcom]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 29-11-2016 23:00:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Image] [varchar](50) NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastModifiedBy] [int] NULL,
	[LasModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Content_Master]    Script Date: 29-11-2016 23:00:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Content_Master](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Content_Desc] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Content_Master] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 29-11-2016 23:00:59 ******/
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
SET IDENTITY_INSERT [dbo].[Brands] ON 

GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (1, N'Jabsons Peanuts', NULL, 0, 1, CAST(N'2016-11-13 00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (2, N'Dummy', NULL, 1, 1, CAST(N'2016-11-17 00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (4, N'sa', NULL, 1, 1, CAST(N'1894-07-02 00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (5, N'Wafers', NULL, 0, 1, CAST(N'1894-07-04 00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (6, N'ABC', N'xq_fotos_logo.png', 0, 1, CAST(N'1894-07-04 00:00:00.000' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (7, N'', N'def_pattern.png', 1, 1, CAST(N'1894-07-04 00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (8, N'ss', N'32.gif', 0, 1, CAST(N'1894-07-04 00:00:00.000' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Brands] ([Id], [Name], [Image], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (9, N'Brandxyz', N'32.gif', 0, 1, CAST(N'1894-07-13 00:00:00.000' AS DateTime), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Content_Master] ON 

GO
INSERT [dbo].[Content_Master] ([ContentId], [Name], [Content_Desc], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (1, N'About Us', N'<p>About me</p>
', 0, 1, CAST(N'2016-11-19 00:00:00.000' AS DateTime), NULL, CAST(N'1894-07-03 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[Content_Master] ([ContentId], [Name], [Content_Desc], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (2, N'FAQ', N'Frequently Asked Questions', 0, 1, CAST(N'2016-11-19 00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Content_Master] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

GO
INSERT [dbo].[Users] ([Id], [Name], [UserName], [Password], [IsDeleted], [CreatedBy], [CreatedDate], [LastModifiedBy], [LasModifiedDate]) VALUES (1, N'SuperAdmin', N'superadmin', N'sa', 0, 1, CAST(N'2016-11-11 00:00:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  StoredProcedure [dbo].[Brand_Sp]    Script Date: 29-11-2016 23:00:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Batch submitted through debugger: SQLQuery1.sql|64|0|C:\Users\Premal\AppData\Local\Temp\~vsD078.sql
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Brand_Sp] 
	-- Add the parameters for the stored procedure here
	@BrandId bigint,
	@Name  nvarchar(100),
	@IsDeleted bit,
	@CreatedBy int,
	@CreatedDate datetime,
	@LastModifiedDate datetime,
	@ReturnId bigint out
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	if @BrandId = 0 
	Begin
	Insert into
			Brands(Name,IsDeleted,CreatedBy,CreatedDate,LastModifiedBy,LasModifiedDate)values(@Name,'0',@CreatedBy,GETDATE(),null,null);
			
set @ReturnId=@@identity
End
			if @BrandId > 0
			begin
			update Brands set IsDeleted=@IsDeleted where Id=@BrandId
			end

    -- Insert statements for procedure here
	

END


GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 29-11-2016 23:00:59 ******/
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
