/****** Object:  Table [dbo].[ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_SECURITYUSER](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProfileID] [bigint] NULL,
	[FullName] [nvarchar](150) NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[BlockIPAccess] [nvarchar](50) NULL,
	[BlockMacAccess] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[AlternateEmail] [nvarchar](150) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[UpdatedBy] [bigint] NULL,
	[RoleID] [bigint] NULL,
	[ActivationKey] [nvarchar](50) NULL,
	[IsActivated] [bit] NULL,
 CONSTRAINT [PK_ALRD_SECURITY_USER] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYUSER] ON
INSERT [dbo].[ALRD_SECURITYUSER] ([COMPID], [ProfileID], [FullName], [UserName], [Password], [BlockIPAccess], [BlockMacAccess], [Status], [AlternateEmail], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [RoleID], [ActivationKey], [IsActivated]) VALUES (1, NULL, N'Admin', N'admin@yopmail.com', N'MTIxMjEy', NULL, NULL, 1, NULL, CAST(0x0000A13900000000 AS DateTime), 1, NULL, NULL, 1, NULL, 0)
INSERT [dbo].[ALRD_SECURITYUSER] ([COMPID], [ProfileID], [FullName], [UserName], [Password], [BlockIPAccess], [BlockMacAccess], [Status], [AlternateEmail], [CreatedOn], [CreatedBy], [UpdatedOn], [UpdatedBy], [RoleID], [ActivationKey], [IsActivated]) VALUES (4, NULL, N'Jhon', N'jhon.snow@yopmail.com', N'cGFzc3dvcmQxMjM=', NULL, NULL, 1, NULL, CAST(0x0000A275003B57A9 AS DateTime), 1, NULL, NULL, 3, NULL, 0)
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYUSER] OFF
/****** Object:  StoredProcedure [dbo].[alrd_securityuser_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuser_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@ProfileID bigint  = NULL,
		@FullName nvarchar (150) = NULL,
		@UserName nvarchar (150) = NULL,
		@Password nvarchar (150) = NULL,
		@BlockIPAccess nvarchar (50) = NULL,
		@BlockMacAccess nvarchar (50) = NULL,
		@Status bit  = NULL,
		@AlternateEmail nvarchar (150) = NULL,
		@CreatedOn datetime  = NULL,
		@CreatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@RoleID bigint  = NULL,
		@ActivationKey nvarchar (50) = NULL,
		@IsActivated bit  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYUSER
		SET
			ProfileID = @ProfileID,
			FullName = @FullName,
			UserName = @UserName,
			Password = @Password,
			BlockIPAccess = @BlockIPAccess,
			BlockMacAccess = @BlockMacAccess,
			Status = @Status,
			AlternateEmail = @AlternateEmail,
			CreatedOn = @CreatedOn,
			CreatedBy = @CreatedBy,
			UpdatedOn = @UpdatedOn,
			UpdatedBy = @UpdatedBy,
			RoleID = @RoleID,
			ActivationKey = @ActivationKey,
			IsActivated = @IsActivated
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuser_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuser_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@ProfileID bigint  = NULL,
		@FullName nvarchar (150) = NULL,
		@UserName nvarchar (150) = NULL,
		@Password nvarchar (150) = NULL,
		@BlockIPAccess nvarchar (50) = NULL,
		@BlockMacAccess nvarchar (50) = NULL,
		@Status bit  = NULL,
		@AlternateEmail nvarchar (150) = NULL,
		@CreatedOn datetime  = NULL,
		@CreatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@RoleID bigint  = NULL,
		@ActivationKey nvarchar (50) = NULL,
		@IsActivated bit  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYUSER
		SET
			ProfileID = Case when (@ProfileID =0 ) then NULL  else Case when (@ProfileID is not null) then @ProfileID else ProfileID end end,
			FullName = Case when (@FullName is not null) then @FullName else FullName end,
			UserName = Case when (@UserName is not null) then @UserName else UserName end,
			Password = Case when (@Password is not null) then @Password else Password end,
			BlockIPAccess = Case when (@BlockIPAccess is not null) then @BlockIPAccess else BlockIPAccess end,
			BlockMacAccess = Case when (@BlockMacAccess is not null) then @BlockMacAccess else BlockMacAccess end,
			Status = Case when (@Status is not null) then @Status else Status end,
			AlternateEmail = Case when (@AlternateEmail is not null) then @AlternateEmail else AlternateEmail end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			RoleID = Case when (@RoleID =0 ) then NULL  else Case when (@RoleID is not null) then @RoleID else RoleID end end,
			ActivationKey = Case when (@ActivationKey is not null) then @ActivationKey else ActivationKey end,
			IsActivated = Case when (@IsActivated is not null) then @IsActivated else IsActivated end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuser_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuser_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@ProfileID bigint  = NULL,
		@FullName nvarchar (150) = NULL,
		@UserName nvarchar (150) = NULL,
		@Password nvarchar (150) = NULL,
		@BlockIPAccess nvarchar (50) = NULL,
		@BlockMacAccess nvarchar (50) = NULL,
		@Status bit  = NULL,
		@AlternateEmail nvarchar (150) = NULL,
		@CreatedOn datetime  = NULL,
		@CreatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@RoleID bigint  = NULL,
		@ActivationKey nvarchar (50) = NULL,
		@IsActivated bit  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_SECURITYUSER (
			ProfileID,
			FullName,
			UserName,
			Password,
			BlockIPAccess,
			BlockMacAccess,
			Status,
			AlternateEmail,
			CreatedOn,
			CreatedBy,
			UpdatedOn,
			UpdatedBy,
			RoleID,
			ActivationKey,
			IsActivated
		)
		VALUES (
			@ProfileID,
			@FullName,
			@UserName,
			@Password,
			@BlockIPAccess,
			@BlockMacAccess,
			@Status,
			@AlternateEmail,
			@CreatedOn,
			@CreatedBy,
			@UpdatedOn,
			@UpdatedBy,
			@RoleID,
			@ActivationKey,
			@IsActivated
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuser_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityuser_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@ProfileID bigint  = NULL,
	@FullName nvarchar (150) = NULL,
	@UserName nvarchar (150) = NULL,
	@Password nvarchar (150) = NULL,
	@BlockIPAccess nvarchar (50) = NULL,
	@BlockMacAccess nvarchar (50) = NULL,
	@Status bit  = NULL,
	@AlternateEmail nvarchar (150) = NULL,
	@CreatedOn datetime  = NULL,
	@CreatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@RoleID bigint  = NULL,
	@ActivationKey nvarchar (50) = NULL,
	@IsActivated bit  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_securityuser
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYUSER.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ProfileID is NULL THEN 1 WHEN ALRD_SECURITYUSER.ProfileID  = @ProfileID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FullName is NULL THEN 1 WHEN ALRD_SECURITYUSER.FullName  LIKE '%' + @FullName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserName is NULL THEN 1 WHEN ALRD_SECURITYUSER.UserName  LIKE '%' + @UserName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Password is NULL THEN 1 WHEN ALRD_SECURITYUSER.Password  LIKE '%' + @Password + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @BlockIPAccess is NULL THEN 1 WHEN ALRD_SECURITYUSER.BlockIPAccess  LIKE '%' + @BlockIPAccess + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @BlockMacAccess is NULL THEN 1 WHEN ALRD_SECURITYUSER.BlockMacAccess  LIKE '%' + @BlockMacAccess + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Status is NULL THEN 1 WHEN ALRD_SECURITYUSER.Status  = @Status THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AlternateEmail is NULL THEN 1 WHEN ALRD_SECURITYUSER.AlternateEmail  LIKE '%' + @AlternateEmail + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSER.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSER.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSER.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSER.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYUSER.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActivationKey is NULL THEN 1 WHEN ALRD_SECURITYUSER.ActivationKey  LIKE '%' + @ActivationKey + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsActivated is NULL THEN 1 WHEN ALRD_SECURITYUSER.IsActivated  = @IsActivated THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_securityuser AS
			(
				  SELECT 
			ALRD_SECURITYUSER.COMPID,
			ALRD_SECURITYUSER.ProfileID,
			ALRD_SECURITYUSER.FullName,
			ALRD_SECURITYUSER.UserName,
			ALRD_SECURITYUSER.Password,
			ALRD_SECURITYUSER.BlockIPAccess,
			ALRD_SECURITYUSER.BlockMacAccess,
			ALRD_SECURITYUSER.Status,
			ALRD_SECURITYUSER.AlternateEmail,
			ALRD_SECURITYUSER.CreatedOn,
			ALRD_SECURITYUSER.CreatedBy,
			ALRD_SECURITYUSER.UpdatedOn,
			ALRD_SECURITYUSER.UpdatedBy,
			ALRD_SECURITYUSER.RoleID,
			ALRD_SECURITYUSER.ActivationKey,
			ALRD_SECURITYUSER.IsActivated
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYUSER.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYUSER.COMPID END DESC,
						CASE WHEN @SortExpression ='ProfileID ASC' THEN ALRD_SECURITYUSER.ProfileID END ASC,
						CASE WHEN @SortExpression ='ProfileID DESC' THEN ALRD_SECURITYUSER.ProfileID END DESC,
						CASE WHEN @SortExpression ='FullName ASC' THEN ALRD_SECURITYUSER.FullName END ASC,
						CASE WHEN @SortExpression ='FullName DESC' THEN ALRD_SECURITYUSER.FullName END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN ALRD_SECURITYUSER.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN ALRD_SECURITYUSER.UserName END DESC,
						CASE WHEN @SortExpression ='Password ASC' THEN ALRD_SECURITYUSER.Password END ASC,
						CASE WHEN @SortExpression ='Password DESC' THEN ALRD_SECURITYUSER.Password END DESC,
						CASE WHEN @SortExpression ='BlockIPAccess ASC' THEN ALRD_SECURITYUSER.BlockIPAccess END ASC,
						CASE WHEN @SortExpression ='BlockIPAccess DESC' THEN ALRD_SECURITYUSER.BlockIPAccess END DESC,
						CASE WHEN @SortExpression ='BlockMacAccess ASC' THEN ALRD_SECURITYUSER.BlockMacAccess END ASC,
						CASE WHEN @SortExpression ='BlockMacAccess DESC' THEN ALRD_SECURITYUSER.BlockMacAccess END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN ALRD_SECURITYUSER.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN ALRD_SECURITYUSER.Status END DESC,
						CASE WHEN @SortExpression ='AlternateEmail ASC' THEN ALRD_SECURITYUSER.AlternateEmail END ASC,
						CASE WHEN @SortExpression ='AlternateEmail DESC' THEN ALRD_SECURITYUSER.AlternateEmail END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYUSER.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYUSER.CreatedOn END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYUSER.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYUSER.CreatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYUSER.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYUSER.UpdatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYUSER.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYUSER.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN ALRD_SECURITYUSER.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN ALRD_SECURITYUSER.RoleID END DESC,
						CASE WHEN @SortExpression ='ActivationKey ASC' THEN ALRD_SECURITYUSER.ActivationKey END ASC,
						CASE WHEN @SortExpression ='ActivationKey DESC' THEN ALRD_SECURITYUSER.ActivationKey END DESC,
						CASE WHEN @SortExpression ='IsActivated ASC' THEN ALRD_SECURITYUSER.IsActivated END ASC,
						CASE WHEN @SortExpression ='IsActivated DESC' THEN ALRD_SECURITYUSER.IsActivated END DESC
				) as RowNumber
		FROM ALRD_SECURITYUSER 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYUSER.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ProfileID is NULL THEN 1 WHEN ALRD_SECURITYUSER.ProfileID  = @ProfileID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FullName is NULL THEN 1 WHEN ALRD_SECURITYUSER.FullName  LIKE '%' + @FullName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN ALRD_SECURITYUSER.UserName  LIKE '%' + @UserName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Password is NULL THEN 1 WHEN ALRD_SECURITYUSER.Password  LIKE '%' + @Password + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @BlockIPAccess is NULL THEN 1 WHEN ALRD_SECURITYUSER.BlockIPAccess  LIKE '%' + @BlockIPAccess + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @BlockMacAccess is NULL THEN 1 WHEN ALRD_SECURITYUSER.BlockMacAccess  LIKE '%' + @BlockMacAccess + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Status is NULL THEN 1 WHEN ALRD_SECURITYUSER.Status  = @Status THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AlternateEmail is NULL THEN 1 WHEN ALRD_SECURITYUSER.AlternateEmail  LIKE '%' + @AlternateEmail + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSER.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSER.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSER.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSER.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYUSER.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActivationKey is NULL THEN 1 WHEN ALRD_SECURITYUSER.ActivationKey  LIKE '%' + @ActivationKey + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsActivated is NULL THEN 1 WHEN ALRD_SECURITYUSER.IsActivated  = @IsActivated THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_securityuser
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuser_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuser_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@ProfileID bigint  = NULL,
		@FullName nvarchar (150) = NULL,
		@UserName nvarchar (150) = NULL,
		@Password nvarchar (150) = NULL,
		@BlockIPAccess nvarchar (50) = NULL,
		@BlockMacAccess nvarchar (50) = NULL,
		@Status bit  = NULL,
		@AlternateEmail nvarchar (150) = NULL,
		@CreatedOn datetime  = NULL,
		@CreatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@RoleID bigint  = NULL,
		@ActivationKey nvarchar (50) = NULL,
		@IsActivated bit  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_SECURITYUSER
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  Table [dbo].[ALRD_SECURITYMENU]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_SECURITYMENU](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[MenuName] [nvarchar](50) NOT NULL,
	[MenuCode] [nvarchar](50) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_SECURITY_MENU] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYMENU] ON
INSERT [dbo].[ALRD_SECURITYMENU] ([COMPID], [MenuName], [MenuCode], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Security', N'SECURITY', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYMENU] ([COMPID], [MenuName], [MenuCode], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Setup', N'SETUP', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYMENU] ([COMPID], [MenuName], [MenuCode], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Govt. Data', N'GOVERNMENT', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYMENU] ([COMPID], [MenuName], [MenuCode], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'Org. Data', N'ORGANIZATION', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYMENU] ([COMPID], [MenuName], [MenuCode], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Report', N'REPORT', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYMENU] OFF
/****** Object:  Table [dbo].[ALRD_SECURITYFORM]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_SECURITYFORM](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[FormName] [nvarchar](150) NOT NULL,
	[MenuID] [bigint] NOT NULL,
	[FormType] [nvarchar](50) NULL,
	[FormCaption] [nvarchar](150) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_SECURITY_FORM] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYFORM] ON
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Role Type', 1, N'PAGE', N'Role Type', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Role Info', 1, N'PAGE', N'Role Info', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'User List', 1, N'PAGE', N'User List', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, N'User Info', 1, N'PAGE', N'User Info', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, N'Division', 2, N'PAGE', N'Division', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, N'District', 2, N'PAGE', N'District', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, N'Upzilla', 2, N'PAGE', N'Upzilla', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, N'Union', 2, N'PAGE', N'Union', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, N'Organization', 2, N'PAGE', N'Organization', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, N'Govt. Khas Land Data', 3, N'PAGE', N'Govt.  Khas Land Data', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, N'Org. Data', 4, N'PAGE', N'Org. Data', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, N'Govt. Khas Land Data List', 3, N'PAGE', N'Govt. Khas Land Data List', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, N'Org. Data List', 4, N'PAGE', N'Org. Data List', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, N'Divisionwise Distributed Kash Land', 5, N'PAGE', N'Divisionwise Distributed Kash Land', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (15, N'Govt. Water Body Data', 3, N'PAGE', N'Govt. Water Body Data', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (17, N'Govt. Water Body Data List', 3, N'PAGE', N'Govt. Water Body Data List', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (18, N'Govt. Forestry Body Data', 3, N'PAGE', N'Govt. Forestry Body Data', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYFORM] ([COMPID], [FormName], [MenuID], [FormType], [FormCaption], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (19, N'Govt. Forestry Body Data List', 3, N'PAGE', N'Govt. Forestry Body Data List', 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYFORM] OFF
/****** Object:  Table [dbo].[ALRD_SECURITYROLE]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_SECURITYROLE](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](150) NOT NULL,
	[ShortName] [nvarchar](150) NULL,
	[LongDescription] [nvarchar](1000) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_SECURITY_ROLE] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYROLE] ON
INSERT [dbo].[ALRD_SECURITYROLE] ([COMPID], [RoleName], [ShortName], [LongDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, N'Super Admin', N'Super Admin', NULL, 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYROLE] ([COMPID], [RoleName], [ShortName], [LongDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, N'Admin', N'Admin', NULL, 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYROLE] ([COMPID], [RoleName], [ShortName], [LongDescription], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, N'Employee', N'Employee', NULL, 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYROLE] OFF
/****** Object:  Table [dbo].[ALRD_SECURITYROLEDETAIL]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_SECURITYROLEDETAIL](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleID] [bigint] NOT NULL,
	[FormID] [bigint] NOT NULL,
	[CanInsert] [bit] NULL,
	[CanUpdate] [bit] NULL,
	[CanDelete] [bit] NULL,
	[IsVisible] [bit] NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_SECURITY_ROLEDETAIL] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ON
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, 1, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34D AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (2, 1, 2, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34D AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (3, 1, 3, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34E AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (4, 1, 4, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34E AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (5, 1, 5, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34E AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (6, 1, 6, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34E AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (7, 1, 7, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34F AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (8, 1, 8, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34F AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (9, 1, 9, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34F AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (10, 1, 10, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C34F AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (11, 1, 11, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C350 AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (12, 1, 12, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C350 AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (13, 1, 13, 1, 1, 1, 1, 1, CAST(0x0000A13900000000 AS DateTime), 1, CAST(0x0000A2890076C350 AS DateTime))
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (14, 1, 14, 1, 1, 1, 1, 1, CAST(0x0000A2890076C350 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (29, 1, 15, 1, 1, 1, 1, 1, CAST(0x0000A29B00EACAF8 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (30, 1, 17, 1, 1, 1, 1, 1, CAST(0x0000A29B00EACAF8 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (31, 1, 18, 1, 1, 1, 1, 1, CAST(0x0000A29B00EACAF8 AS DateTime), NULL, NULL)
INSERT [dbo].[ALRD_SECURITYROLEDETAIL] ([COMPID], [RoleID], [FormID], [CanInsert], [CanUpdate], [CanDelete], [IsVisible], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (32, 1, 19, 1, 1, 1, 1, 1, CAST(0x0000A29B00EACAF8 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ALRD_SECURITYROLEDETAIL] OFF
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityroledetail_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleID bigint  = NULL,
		@CanInsert bit  = NULL,
		@CanUpdate bit  = NULL,
		@CanDelete bit  = NULL,
		@IsVisible bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYROLEDETAIL
		SET
			RoleID = @RoleID,
			FormID = @FormID,
			CanInsert = @CanInsert,
			CanUpdate = @CanUpdate,
			CanDelete = @CanDelete,
			IsVisible = @IsVisible,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityroledetail_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleID bigint  = NULL,
		@CanInsert bit  = NULL,
		@CanUpdate bit  = NULL,
		@CanDelete bit  = NULL,
		@IsVisible bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYROLEDETAIL
		SET
			RoleID = Case when (@RoleID is not null) then @RoleID else RoleID end,
			FormID = Case when (@FormID is not null) then @FormID else FormID end,
			CanInsert = Case when (@CanInsert is not null) then @CanInsert else CanInsert end,
			CanUpdate = Case when (@CanUpdate is not null) then @CanUpdate else CanUpdate end,
			CanDelete = Case when (@CanDelete is not null) then @CanDelete else CanDelete end,
			IsVisible = Case when (@IsVisible is not null) then @IsVisible else IsVisible end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityroledetail_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleID bigint  = NULL,
		@CanInsert bit  = NULL,
		@CanUpdate bit  = NULL,
		@CanDelete bit  = NULL,
		@IsVisible bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_SECURITYROLEDETAIL (
			RoleID,
			FormID,
			CanInsert,
			CanUpdate,
			CanDelete,
			IsVisible,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@RoleID,
			@FormID,
			@CanInsert,
			@CanUpdate,
			@CanDelete,
			@IsVisible,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityroledetail_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@RoleID bigint  = NULL,
	@FormID bigint  = NULL,
	@CanInsert bit  = NULL,
	@CanUpdate bit  = NULL,
	@CanDelete bit  = NULL,
	@IsVisible bit  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_securityroledetail
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.FormID  = @FormID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CanInsert is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanInsert  = @CanInsert THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CanUpdate is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanUpdate  = @CanUpdate THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CanDelete is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanDelete  = @CanDelete THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IsVisible is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.IsVisible  = @IsVisible THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_securityroledetail AS
			(
				  SELECT 
			ALRD_SECURITYROLEDETAIL.COMPID,
			ALRD_SECURITYROLEDETAIL.RoleID,
			ALRD_SECURITYROLEDETAIL.FormID,
			ALRD_SECURITYROLEDETAIL.CanInsert,
			ALRD_SECURITYROLEDETAIL.CanUpdate,
			ALRD_SECURITYROLEDETAIL.CanDelete,
			ALRD_SECURITYROLEDETAIL.IsVisible,
			ALRD_SECURITYROLEDETAIL.CreatedBy,
			ALRD_SECURITYROLEDETAIL.CreatedOn,
			ALRD_SECURITYROLEDETAIL.UpdatedBy,
			ALRD_SECURITYROLEDETAIL.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYROLEDETAIL.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYROLEDETAIL.COMPID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN ALRD_SECURITYROLEDETAIL.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN ALRD_SECURITYROLEDETAIL.RoleID END DESC,
						CASE WHEN @SortExpression ='FormID ASC' THEN ALRD_SECURITYROLEDETAIL.FormID END ASC,
						CASE WHEN @SortExpression ='FormID DESC' THEN ALRD_SECURITYROLEDETAIL.FormID END DESC,
						CASE WHEN @SortExpression ='CanInsert ASC' THEN ALRD_SECURITYROLEDETAIL.CanInsert END ASC,
						CASE WHEN @SortExpression ='CanInsert DESC' THEN ALRD_SECURITYROLEDETAIL.CanInsert END DESC,
						CASE WHEN @SortExpression ='CanUpdate ASC' THEN ALRD_SECURITYROLEDETAIL.CanUpdate END ASC,
						CASE WHEN @SortExpression ='CanUpdate DESC' THEN ALRD_SECURITYROLEDETAIL.CanUpdate END DESC,
						CASE WHEN @SortExpression ='CanDelete ASC' THEN ALRD_SECURITYROLEDETAIL.CanDelete END ASC,
						CASE WHEN @SortExpression ='CanDelete DESC' THEN ALRD_SECURITYROLEDETAIL.CanDelete END DESC,
						CASE WHEN @SortExpression ='IsVisible ASC' THEN ALRD_SECURITYROLEDETAIL.IsVisible END ASC,
						CASE WHEN @SortExpression ='IsVisible DESC' THEN ALRD_SECURITYROLEDETAIL.IsVisible END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYROLEDETAIL.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYROLEDETAIL.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYROLEDETAIL.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYROLEDETAIL.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYROLEDETAIL.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYROLEDETAIL.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYROLEDETAIL.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYROLEDETAIL.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYROLEDETAIL 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.FormID  = @FormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CanInsert is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanInsert  = @CanInsert THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CanUpdate is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanUpdate  = @CanUpdate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CanDelete is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanDelete  = @CanDelete THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsVisible is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.IsVisible  = @IsVisible THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_securityroledetail
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityroledetail_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleID bigint  = NULL,
		@CanInsert bit  = NULL,
		@CanUpdate bit  = NULL,
		@CanDelete bit  = NULL,
		@IsVisible bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_SECURITYROLEDETAIL
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuser_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityuser_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@ProfileID bigint  = NULL,
		@FullName nvarchar (150) = NULL,
		@UserName nvarchar (150) = NULL,
		@Password nvarchar (150) = NULL,
		@BlockIPAccess nvarchar (50) = NULL,
		@BlockMacAccess nvarchar (50) = NULL,
		@Status bit  = NULL,
		@AlternateEmail nvarchar (150) = NULL,
		@CreatedOn datetime  = NULL,
		@CreatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@RoleID bigint  = NULL,
		@ActivationKey nvarchar (50) = NULL,
		@IsActivated bit  = NULL,
		@UserNameLike nvarchar (150) = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYUSER.COMPID,
			ALRD_SECURITYUSER.ProfileID,
			ALRD_SECURITYUSER.FullName,
			ALRD_SECURITYUSER.UserName,
			ALRD_SECURITYUSER.Password,
			ALRD_SECURITYUSER.BlockIPAccess,
			ALRD_SECURITYUSER.BlockMacAccess,
			ALRD_SECURITYUSER.Status,
			ALRD_SECURITYUSER.AlternateEmail,
			ALRD_SECURITYUSER.CreatedOn,
			ALRD_SECURITYUSER.CreatedBy,
			ALRD_SECURITYUSER.UpdatedOn,
			ALRD_SECURITYUSER.UpdatedBy,
			ALRD_SECURITYUSER.RoleID,
			ALRD_SECURITYUSER.ActivationKey,
			ALRD_SECURITYUSER.IsActivated,
			ALRD_SECURITYROLE.RoleName,
			(
			CASE WHEN ISNULL(ALRD_SECURITYUSER.Status, 0) = 1 THEN 'Active' 
				 WHEN ISNULL(ALRD_SECURITYUSER.Status, 0) = 0 THEN 'Inactive'
			END
			) as StatusName,
			ALRD_SECURITYUSER.UserName as Email
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYUSER.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYUSER.COMPID END DESC,
						CASE WHEN @SortExpression ='ProfileID ASC' THEN ALRD_SECURITYUSER.ProfileID END ASC,
						CASE WHEN @SortExpression ='ProfileID DESC' THEN ALRD_SECURITYUSER.ProfileID END DESC,
						CASE WHEN @SortExpression ='FullName ASC' THEN ALRD_SECURITYUSER.FullName END ASC,
						CASE WHEN @SortExpression ='FullName DESC' THEN ALRD_SECURITYUSER.FullName END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN ALRD_SECURITYUSER.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN ALRD_SECURITYUSER.UserName END DESC,
						CASE WHEN @SortExpression ='Password ASC' THEN ALRD_SECURITYUSER.Password END ASC,
						CASE WHEN @SortExpression ='Password DESC' THEN ALRD_SECURITYUSER.Password END DESC,
						CASE WHEN @SortExpression ='BlockIPAccess ASC' THEN ALRD_SECURITYUSER.BlockIPAccess END ASC,
						CASE WHEN @SortExpression ='BlockIPAccess DESC' THEN ALRD_SECURITYUSER.BlockIPAccess END DESC,
						CASE WHEN @SortExpression ='BlockMacAccess ASC' THEN ALRD_SECURITYUSER.BlockMacAccess END ASC,
						CASE WHEN @SortExpression ='BlockMacAccess DESC' THEN ALRD_SECURITYUSER.BlockMacAccess END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN ALRD_SECURITYUSER.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN ALRD_SECURITYUSER.Status END DESC,
						CASE WHEN @SortExpression ='AlternateEmail ASC' THEN ALRD_SECURITYUSER.AlternateEmail END ASC,
						CASE WHEN @SortExpression ='AlternateEmail DESC' THEN ALRD_SECURITYUSER.AlternateEmail END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYUSER.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYUSER.CreatedOn END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYUSER.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYUSER.CreatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYUSER.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYUSER.UpdatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYUSER.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYUSER.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN ALRD_SECURITYUSER.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN ALRD_SECURITYUSER.RoleID END DESC,
						CASE WHEN @SortExpression ='ActivationKey ASC' THEN ALRD_SECURITYUSER.ActivationKey END ASC,
						CASE WHEN @SortExpression ='ActivationKey DESC' THEN ALRD_SECURITYUSER.ActivationKey END DESC,
						CASE WHEN @SortExpression ='IsActivated ASC' THEN ALRD_SECURITYUSER.IsActivated END ASC,
						CASE WHEN @SortExpression ='IsActivated DESC' THEN ALRD_SECURITYUSER.IsActivated END DESC
				) as RowNumber
		FROM ALRD_SECURITYUSER 
		LEFT OUTER JOIN ALRD_SECURITYROLE on ALRD_SECURITYROLE.COMPID = ALRD_SECURITYUSER.RoleID

		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYUSER.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ProfileID is NULL THEN 1 WHEN ALRD_SECURITYUSER.ProfileID  = @ProfileID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FullName is NULL THEN 1 WHEN ALRD_SECURITYUSER.FullName  LIKE '%' + @FullName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN ALRD_SECURITYUSER.UserName  LIKE @UserName THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserNameLike is NULL THEN 1 WHEN ALRD_SECURITYUSER.UserName  LIKE '%' + @UserNameLike + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Password is NULL THEN 1 WHEN ALRD_SECURITYUSER.Password  LIKE @Password THEN 1 ELSE 0 END = 1)
			
			AND (CASE WHEN @BlockIPAccess is NULL THEN 1 WHEN ALRD_SECURITYUSER.BlockIPAccess  LIKE '%' + @BlockIPAccess + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @BlockMacAccess is NULL THEN 1 WHEN ALRD_SECURITYUSER.BlockMacAccess  LIKE '%' + @BlockMacAccess + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Status is NULL THEN 1 WHEN ALRD_SECURITYUSER.Status  = @Status THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AlternateEmail is NULL THEN 1 WHEN ALRD_SECURITYUSER.AlternateEmail  LIKE '%' + @AlternateEmail + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSER.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSER.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSER.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSER.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYUSER.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActivationKey is NULL THEN 1 WHEN ALRD_SECURITYUSER.ActivationKey  LIKE '%' + @ActivationKey + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsActivated is NULL THEN 1 WHEN ALRD_SECURITYUSER.IsActivated  = @IsActivated THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityrole_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityrole_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleName nvarchar (150) = NULL,
		@ShortName nvarchar (150) = NULL,
		@LongDescription nvarchar (1000) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYROLE
		SET
			RoleName = @RoleName,
			ShortName = @ShortName,
			LongDescription = @LongDescription,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityrole_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityrole_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleName nvarchar (150) = NULL,
		@ShortName nvarchar (150) = NULL,
		@LongDescription nvarchar (1000) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYROLE
		SET
			RoleName = Case when (@RoleName is not null) then @RoleName else RoleName end,
			ShortName = Case when (@ShortName is not null) then @ShortName else ShortName end,
			LongDescription = Case when (@LongDescription is not null) then @LongDescription else LongDescription end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityrole_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityrole_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleName nvarchar (150) = NULL,
		@ShortName nvarchar (150) = NULL,
		@LongDescription nvarchar (1000) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_SECURITYROLE (
			RoleName,
			ShortName,
			LongDescription,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@RoleName,
			@ShortName,
			@LongDescription,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityrole_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityrole_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@RoleName nvarchar (150) = NULL,
	@ShortName nvarchar (150) = NULL,
	@LongDescription nvarchar (1000) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_securityrole
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYROLE.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @RoleName is NULL THEN 1 WHEN ALRD_SECURITYROLE.RoleName  LIKE '%' + @RoleName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ShortName is NULL THEN 1 WHEN ALRD_SECURITYROLE.ShortName  LIKE '%' + @ShortName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LongDescription is NULL THEN 1 WHEN ALRD_SECURITYROLE.LongDescription  LIKE '%' + @LongDescription + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLE.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLE.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLE.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLE.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_securityrole AS
			(
				  SELECT 
			ALRD_SECURITYROLE.COMPID,
			ALRD_SECURITYROLE.RoleName,
			ALRD_SECURITYROLE.ShortName,
			ALRD_SECURITYROLE.LongDescription,
			ALRD_SECURITYROLE.CreatedBy,
			ALRD_SECURITYROLE.CreatedOn,
			ALRD_SECURITYROLE.UpdatedBy,
			ALRD_SECURITYROLE.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYROLE.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYROLE.COMPID END DESC,
						CASE WHEN @SortExpression ='RoleName ASC' THEN ALRD_SECURITYROLE.RoleName END ASC,
						CASE WHEN @SortExpression ='RoleName DESC' THEN ALRD_SECURITYROLE.RoleName END DESC,
						CASE WHEN @SortExpression ='ShortName ASC' THEN ALRD_SECURITYROLE.ShortName END ASC,
						CASE WHEN @SortExpression ='ShortName DESC' THEN ALRD_SECURITYROLE.ShortName END DESC,
						CASE WHEN @SortExpression ='LongDescription ASC' THEN ALRD_SECURITYROLE.LongDescription END ASC,
						CASE WHEN @SortExpression ='LongDescription DESC' THEN ALRD_SECURITYROLE.LongDescription END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYROLE.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYROLE.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYROLE.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYROLE.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYROLE.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYROLE.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYROLE.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYROLE.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYROLE 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYROLE.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleName is NULL THEN 1 WHEN ALRD_SECURITYROLE.RoleName  LIKE '%' + @RoleName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ShortName is NULL THEN 1 WHEN ALRD_SECURITYROLE.ShortName  LIKE '%' + @ShortName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LongDescription is NULL THEN 1 WHEN ALRD_SECURITYROLE.LongDescription  LIKE '%' + @LongDescription + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLE.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLE.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLE.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLE.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_securityrole
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityrole_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityrole_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@RoleName nvarchar (150) = NULL,
		@ShortName nvarchar (150) = NULL,
		@LongDescription nvarchar (1000) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYROLE.COMPID,
			ALRD_SECURITYROLE.RoleName,
			ALRD_SECURITYROLE.ShortName,
			ALRD_SECURITYROLE.LongDescription,
			ALRD_SECURITYROLE.CreatedBy,
			ALRD_SECURITYROLE.CreatedOn,
			ALRD_SECURITYROLE.UpdatedBy,
			ALRD_SECURITYROLE.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYROLE.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYROLE.COMPID END DESC,
						CASE WHEN @SortExpression ='RoleName ASC' THEN ALRD_SECURITYROLE.RoleName END ASC,
						CASE WHEN @SortExpression ='RoleName DESC' THEN ALRD_SECURITYROLE.RoleName END DESC,
						CASE WHEN @SortExpression ='ShortName ASC' THEN ALRD_SECURITYROLE.ShortName END ASC,
						CASE WHEN @SortExpression ='ShortName DESC' THEN ALRD_SECURITYROLE.ShortName END DESC,
						CASE WHEN @SortExpression ='LongDescription ASC' THEN ALRD_SECURITYROLE.LongDescription END ASC,
						CASE WHEN @SortExpression ='LongDescription DESC' THEN ALRD_SECURITYROLE.LongDescription END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYROLE.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYROLE.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYROLE.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYROLE.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYROLE.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYROLE.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYROLE.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYROLE.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYROLE 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYROLE.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleName is NULL THEN 1 WHEN ALRD_SECURITYROLE.RoleName  LIKE '%' + @RoleName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ShortName is NULL THEN 1 WHEN ALRD_SECURITYROLE.ShortName  LIKE '%' + @ShortName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LongDescription is NULL THEN 1 WHEN ALRD_SECURITYROLE.LongDescription  LIKE '%' + @LongDescription + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLE.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLE.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLE.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLE.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityrole_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityrole_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@RoleName nvarchar (150) = NULL,
		@ShortName nvarchar (150) = NULL,
		@LongDescription nvarchar (1000) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_SECURITYROLE
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securitymenu_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securitymenu_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@MenuName nvarchar (50) = NULL,
		@MenuCode nvarchar (50) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYMENU
		SET
			MenuName = @MenuName,
			MenuCode = @MenuCode,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securitymenu_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securitymenu_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@MenuName nvarchar (50) = NULL,
		@MenuCode nvarchar (50) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYMENU
		SET
			MenuName = Case when (@MenuName is not null) then @MenuName else MenuName end,
			MenuCode = Case when (@MenuCode is not null) then @MenuCode else MenuCode end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securitymenu_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securitymenu_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@MenuName nvarchar (50) = NULL,
		@MenuCode nvarchar (50) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_SECURITYMENU (
			MenuName,
			MenuCode,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@MenuName,
			@MenuCode,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securitymenu_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securitymenu_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@MenuName nvarchar (50) = NULL,
	@MenuCode nvarchar (50) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_securitymenu
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYMENU.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MenuName is NULL THEN 1 WHEN ALRD_SECURITYMENU.MenuName  LIKE '%' + @MenuName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MenuCode is NULL THEN 1 WHEN ALRD_SECURITYMENU.MenuCode  LIKE '%' + @MenuCode + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYMENU.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYMENU.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYMENU.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYMENU.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_securitymenu AS
			(
				  SELECT 
			ALRD_SECURITYMENU.COMPID,
			ALRD_SECURITYMENU.MenuName,
			ALRD_SECURITYMENU.MenuCode,
			ALRD_SECURITYMENU.CreatedBy,
			ALRD_SECURITYMENU.CreatedOn,
			ALRD_SECURITYMENU.UpdatedBy,
			ALRD_SECURITYMENU.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYMENU.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYMENU.COMPID END DESC,
						CASE WHEN @SortExpression ='MenuName ASC' THEN ALRD_SECURITYMENU.MenuName END ASC,
						CASE WHEN @SortExpression ='MenuName DESC' THEN ALRD_SECURITYMENU.MenuName END DESC,
						CASE WHEN @SortExpression ='MenuCode ASC' THEN ALRD_SECURITYMENU.MenuCode END ASC,
						CASE WHEN @SortExpression ='MenuCode DESC' THEN ALRD_SECURITYMENU.MenuCode END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYMENU.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYMENU.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYMENU.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYMENU.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYMENU.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYMENU.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYMENU.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYMENU.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYMENU 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYMENU.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuName is NULL THEN 1 WHEN ALRD_SECURITYMENU.MenuName  LIKE '%' + @MenuName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuCode is NULL THEN 1 WHEN ALRD_SECURITYMENU.MenuCode  LIKE '%' + @MenuCode + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYMENU.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYMENU.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYMENU.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYMENU.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_securitymenu
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securitymenu_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securitymenu_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@MenuName nvarchar (50) = NULL,
		@MenuCode nvarchar (50) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYMENU.COMPID,
			ALRD_SECURITYMENU.MenuName,
			ALRD_SECURITYMENU.MenuCode,
			ALRD_SECURITYMENU.CreatedBy,
			ALRD_SECURITYMENU.CreatedOn,
			ALRD_SECURITYMENU.UpdatedBy,
			ALRD_SECURITYMENU.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYMENU.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYMENU.COMPID END DESC,
						CASE WHEN @SortExpression ='MenuName ASC' THEN ALRD_SECURITYMENU.MenuName END ASC,
						CASE WHEN @SortExpression ='MenuName DESC' THEN ALRD_SECURITYMENU.MenuName END DESC,
						CASE WHEN @SortExpression ='MenuCode ASC' THEN ALRD_SECURITYMENU.MenuCode END ASC,
						CASE WHEN @SortExpression ='MenuCode DESC' THEN ALRD_SECURITYMENU.MenuCode END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYMENU.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYMENU.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYMENU.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYMENU.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYMENU.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYMENU.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYMENU.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYMENU.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYMENU 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYMENU.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuName is NULL THEN 1 WHEN ALRD_SECURITYMENU.MenuName  LIKE '%' + @MenuName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuCode is NULL THEN 1 WHEN ALRD_SECURITYMENU.MenuCode  LIKE '%' + @MenuCode + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYMENU.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYMENU.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYMENU.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYMENU.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securitymenu_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securitymenu_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@MenuName nvarchar (50) = NULL,
		@MenuCode nvarchar (50) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_SECURITYMENU
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_GetAllByRoleID]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityroledetail_GetAllByRoleID] 
	    	@RoleID bigint  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYROLEDETAIL.COMPID,
			ALRD_SECURITYROLEDETAIL.RoleID,
			ALRD_SECURITYROLEDETAIL.FormID,
			ALRD_SECURITYROLEDETAIL.CanInsert,
			ALRD_SECURITYROLEDETAIL.CanUpdate,
			ALRD_SECURITYROLEDETAIL.CanDelete,
			ALRD_SECURITYROLEDETAIL.IsVisible,
			ALRD_SECURITYROLEDETAIL.CreatedBy,
			ALRD_SECURITYROLEDETAIL.CreatedOn,
			ALRD_SECURITYROLEDETAIL.UpdatedBy,
			ALRD_SECURITYROLEDETAIL.UpdatedOn,
			
			ALRD_SECURITYFORM.FormName,
			ALRD_SECURITYMENU.MenuName,
			ALRD_SECURITYMENU.COMPID as MenuID,
			ALRD_SECURITYMENU.MenuCode,
			ALRD_SECURITYROLE.RoleName
		FROM ALRD_SECURITYROLEDETAIL
		LEFT JOIN ALRD_SECURITYFORM on ALRD_SECURITYFORM.COMPID = ALRD_SECURITYROLEDETAIL.FormID
		LEFT JOIN ALRD_SECURITYMENU on ALRD_SECURITYMENU.COMPID = ALRD_SECURITYFORM.MenuID
		LEFT JOIN ALRD_SECURITYROLE on ALRD_SECURITYROLE.COMPID = ALRD_SECURITYROLEDETAIL.RoleID
		WHERE
			(CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)

		UNION
		
		SELECT 
			NULL as Role_Detail_ID,
			NULL as Role_ID,
			ALRD_SECURITYFORM.COMPID as FormID,
			NULL as Can_Insert,
			NULL as Can_Update,
			NULL as Can_Delete,
			NULL as Is_Visible,
			NULL as CreatedBy,
			NULL as CreatedOn,
			NULL as UpdatedBy,
			NULL as UpdatedOn,
			
			ALRD_SECURITYFORM.FormName,
			ALRD_SECURITYMENU.MenuName,
			ALRD_SECURITYFORM.MenuID,
			ALRD_SECURITYMENU.MenuCode,
			NULL as Role_Name
		FROM ALRD_SECURITYFORM
		LEFT JOIN ALRD_SECURITYMENU on ALRD_SECURITYMENU.COMPID = ALRD_SECURITYFORM.MenuID
		WHERE ALRD_SECURITYFORM.COMPID NOT IN
		(
			SELECT ALRD_SECURITYROLEDETAIL.FormID FROM ALRD_SECURITYROLEDETAIL 
			WHERE
			(CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)

		)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityroledetail_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityroledetail_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@RoleID bigint  = NULL,
		@FormID bigint  = NULL,
		@CanInsert bit  = NULL,
		@CanUpdate bit  = NULL,
		@CanDelete bit  = NULL,
		@IsVisible bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYROLEDETAIL.COMPID,
			ALRD_SECURITYROLEDETAIL.RoleID,
			ALRD_SECURITYROLEDETAIL.FormID,
			ALRD_SECURITYROLEDETAIL.CanInsert,
			ALRD_SECURITYROLEDETAIL.CanUpdate,
			ALRD_SECURITYROLEDETAIL.CanDelete,
			ALRD_SECURITYROLEDETAIL.IsVisible,
			ALRD_SECURITYROLEDETAIL.CreatedBy,
			ALRD_SECURITYROLEDETAIL.CreatedOn,
			ALRD_SECURITYROLEDETAIL.UpdatedBy,
			ALRD_SECURITYROLEDETAIL.UpdatedOn,
			
			ALRD_SECURITYFORM.FormName,
			ALRD_SECURITYMENU.MenuName,
			ALRD_SECURITYMENU.COMPID as MenuID,
			ALRD_SECURITYMENU.MenuCode,
			ALRD_SECURITYROLE.RoleName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYROLEDETAIL.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYROLEDETAIL.COMPID END DESC,
						CASE WHEN @SortExpression ='RoleID ASC' THEN ALRD_SECURITYROLEDETAIL.RoleID END ASC,
						CASE WHEN @SortExpression ='RoleID DESC' THEN ALRD_SECURITYROLEDETAIL.RoleID END DESC,
						CASE WHEN @SortExpression ='FormID ASC' THEN ALRD_SECURITYROLEDETAIL.FormID END ASC,
						CASE WHEN @SortExpression ='FormID DESC' THEN ALRD_SECURITYROLEDETAIL.FormID END DESC,
						CASE WHEN @SortExpression ='CanInsert ASC' THEN ALRD_SECURITYROLEDETAIL.CanInsert END ASC,
						CASE WHEN @SortExpression ='CanInsert DESC' THEN ALRD_SECURITYROLEDETAIL.CanInsert END DESC,
						CASE WHEN @SortExpression ='CanUpdate ASC' THEN ALRD_SECURITYROLEDETAIL.CanUpdate END ASC,
						CASE WHEN @SortExpression ='CanUpdate DESC' THEN ALRD_SECURITYROLEDETAIL.CanUpdate END DESC,
						CASE WHEN @SortExpression ='CanDelete ASC' THEN ALRD_SECURITYROLEDETAIL.CanDelete END ASC,
						CASE WHEN @SortExpression ='CanDelete DESC' THEN ALRD_SECURITYROLEDETAIL.CanDelete END DESC,
						CASE WHEN @SortExpression ='IsVisible ASC' THEN ALRD_SECURITYROLEDETAIL.IsVisible END ASC,
						CASE WHEN @SortExpression ='IsVisible DESC' THEN ALRD_SECURITYROLEDETAIL.IsVisible END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYROLEDETAIL.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYROLEDETAIL.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYROLEDETAIL.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYROLEDETAIL.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYROLEDETAIL.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYROLEDETAIL.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYROLEDETAIL.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYROLEDETAIL.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYROLEDETAIL 
		LEFT JOIN ALRD_SECURITYFORM on ALRD_SECURITYFORM.COMPID = ALRD_SECURITYROLEDETAIL.FormID
		LEFT JOIN ALRD_SECURITYMENU on ALRD_SECURITYMENU.COMPID = ALRD_SECURITYFORM.MenuID
		LEFT JOIN ALRD_SECURITYROLE on ALRD_SECURITYROLE.COMPID = ALRD_SECURITYROLEDETAIL.RoleID
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @RoleID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.RoleID  = @RoleID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormID is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.FormID  = @FormID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CanInsert is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanInsert  = @CanInsert THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CanUpdate is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanUpdate  = @CanUpdate THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CanDelete is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CanDelete  = @CanDelete THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IsVisible is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.IsVisible  = @IsVisible THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYROLEDETAIL.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityform_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityform_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@MenuID bigint  = NULL,
		@FormType nvarchar (50) = NULL,
		@FormCaption nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYFORM
		SET
			FormName = @FormName,
			MenuID = @MenuID,
			FormType = @FormType,
			FormCaption = @FormCaption,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityform_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityform_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@MenuID bigint  = NULL,
		@FormType nvarchar (50) = NULL,
		@FormCaption nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYFORM
		SET
			FormName = Case when (@FormName is not null) then @FormName else FormName end,
			MenuID = Case when (@MenuID is not null) then @MenuID else MenuID end,
			FormType = Case when (@FormType is not null) then @FormType else FormType end,
			FormCaption = Case when (@FormCaption is not null) then @FormCaption else FormCaption end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityform_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityform_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@MenuID bigint  = NULL,
		@FormType nvarchar (50) = NULL,
		@FormCaption nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_SECURITYFORM (
			FormName,
			MenuID,
			FormType,
			FormCaption,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@FormName,
			@MenuID,
			@FormType,
			@FormCaption,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityform_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityform_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@FormName nvarchar (150) = NULL,
	@MenuID bigint  = NULL,
	@FormType nvarchar (50) = NULL,
	@FormCaption nvarchar (150) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_securityform
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYFORM.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormName is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormName  LIKE '%' + @FormName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MenuID is NULL THEN 1 WHEN ALRD_SECURITYFORM.MenuID  = @MenuID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormType is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormType  LIKE '%' + @FormType + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @FormCaption is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormCaption  LIKE '%' + @FormCaption + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYFORM.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYFORM.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYFORM.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYFORM.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_securityform AS
			(
				  SELECT 
			ALRD_SECURITYFORM.COMPID,
			ALRD_SECURITYFORM.FormName,
			ALRD_SECURITYFORM.MenuID,
			ALRD_SECURITYFORM.FormType,
			ALRD_SECURITYFORM.FormCaption,
			ALRD_SECURITYFORM.CreatedBy,
			ALRD_SECURITYFORM.CreatedOn,
			ALRD_SECURITYFORM.UpdatedBy,
			ALRD_SECURITYFORM.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYFORM.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYFORM.COMPID END DESC,
						CASE WHEN @SortExpression ='FormName ASC' THEN ALRD_SECURITYFORM.FormName END ASC,
						CASE WHEN @SortExpression ='FormName DESC' THEN ALRD_SECURITYFORM.FormName END DESC,
						CASE WHEN @SortExpression ='MenuID ASC' THEN ALRD_SECURITYFORM.MenuID END ASC,
						CASE WHEN @SortExpression ='MenuID DESC' THEN ALRD_SECURITYFORM.MenuID END DESC,
						CASE WHEN @SortExpression ='FormType ASC' THEN ALRD_SECURITYFORM.FormType END ASC,
						CASE WHEN @SortExpression ='FormType DESC' THEN ALRD_SECURITYFORM.FormType END DESC,
						CASE WHEN @SortExpression ='FormCaption ASC' THEN ALRD_SECURITYFORM.FormCaption END ASC,
						CASE WHEN @SortExpression ='FormCaption DESC' THEN ALRD_SECURITYFORM.FormCaption END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYFORM.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYFORM.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYFORM.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYFORM.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYFORM.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYFORM.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYFORM.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYFORM.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYFORM 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYFORM.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormName is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormName  LIKE '%' + @FormName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuID is NULL THEN 1 WHEN ALRD_SECURITYFORM.MenuID  = @MenuID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormType is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormType  LIKE '%' + @FormType + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormCaption is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormCaption  LIKE '%' + @FormCaption + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYFORM.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYFORM.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYFORM.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYFORM.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_securityform
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityform_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityform_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@MenuID bigint  = NULL,
		@FormType nvarchar (50) = NULL,
		@FormCaption nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYFORM.COMPID,
			ALRD_SECURITYFORM.FormName,
			ALRD_SECURITYFORM.MenuID,
			ALRD_SECURITYFORM.FormType,
			ALRD_SECURITYFORM.FormCaption,
			ALRD_SECURITYFORM.CreatedBy,
			ALRD_SECURITYFORM.CreatedOn,
			ALRD_SECURITYFORM.UpdatedBy,
			ALRD_SECURITYFORM.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_SECURITYFORM.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_SECURITYFORM.COMPID END DESC,
						CASE WHEN @SortExpression ='FormName ASC' THEN ALRD_SECURITYFORM.FormName END ASC,
						CASE WHEN @SortExpression ='FormName DESC' THEN ALRD_SECURITYFORM.FormName END DESC,
						CASE WHEN @SortExpression ='MenuID ASC' THEN ALRD_SECURITYFORM.MenuID END ASC,
						CASE WHEN @SortExpression ='MenuID DESC' THEN ALRD_SECURITYFORM.MenuID END DESC,
						CASE WHEN @SortExpression ='FormType ASC' THEN ALRD_SECURITYFORM.FormType END ASC,
						CASE WHEN @SortExpression ='FormType DESC' THEN ALRD_SECURITYFORM.FormType END DESC,
						CASE WHEN @SortExpression ='FormCaption ASC' THEN ALRD_SECURITYFORM.FormCaption END ASC,
						CASE WHEN @SortExpression ='FormCaption DESC' THEN ALRD_SECURITYFORM.FormCaption END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYFORM.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYFORM.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYFORM.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYFORM.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYFORM.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYFORM.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYFORM.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYFORM.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYFORM 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_SECURITYFORM.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormName is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormName  LIKE '%' + @FormName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MenuID is NULL THEN 1 WHEN ALRD_SECURITYFORM.MenuID  = @MenuID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormType is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormType  LIKE '%' + @FormType + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @FormCaption is NULL THEN 1 WHEN ALRD_SECURITYFORM.FormCaption  LIKE '%' + @FormCaption + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYFORM.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYFORM.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYFORM.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYFORM.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityform_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityform_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@FormName nvarchar (150) = NULL,
		@MenuID bigint  = NULL,
		@FormType nvarchar (50) = NULL,
		@FormCaption nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_SECURITYFORM
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  Table [dbo].[ALRD_ORGANIZATIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_ORGANIZATIONINFO](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[DESCRIPT] [nvarchar](150) NOT NULL,
	[NameOfCEO] [nvarchar](150) NULL,
	[TelephoneNo] [nvarchar](20) NULL,
	[MobileNo] [nvarchar](20) NULL,
	[Email] [nvarchar](150) NULL,
	[WebSite] [nvarchar](150) NULL,
	[Fax] [nvarchar](20) NULL,
	[Status] [bit] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_ORGANIZAIONINFO] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationinfo_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationinfo_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@NameOfCEO nvarchar (150) = NULL,
		@TelephoneNo nvarchar (20) = NULL,
		@MobileNo nvarchar (20) = NULL,
		@Email nvarchar (150) = NULL,
		@WebSite nvarchar (150) = NULL,
		@Fax nvarchar (20) = NULL,
		@Status bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_ORGANIZATIONINFO
		SET
			DESCRIPT = @DESCRIPT,
			NameOfCEO = @NameOfCEO,
			TelephoneNo = @TelephoneNo,
			MobileNo = @MobileNo,
			Email = @Email,
			WebSite = @WebSite,
			Fax = @Fax,
			Status = @Status,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationinfo_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationinfo_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@NameOfCEO nvarchar (150) = NULL,
		@TelephoneNo nvarchar (20) = NULL,
		@MobileNo nvarchar (20) = NULL,
		@Email nvarchar (150) = NULL,
		@WebSite nvarchar (150) = NULL,
		@Fax nvarchar (20) = NULL,
		@Status bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_ORGANIZATIONINFO
		SET
			DESCRIPT = Case when (@DESCRIPT is not null) then @DESCRIPT else DESCRIPT end,
			NameOfCEO = Case when (@NameOfCEO is not null) then @NameOfCEO else NameOfCEO end,
			TelephoneNo = Case when (@TelephoneNo is not null) then @TelephoneNo else TelephoneNo end,
			MobileNo = Case when (@MobileNo is not null) then @MobileNo else MobileNo end,
			Email = Case when (@Email is not null) then @Email else Email end,
			WebSite = Case when (@WebSite is not null) then @WebSite else WebSite end,
			Fax = Case when (@Fax is not null) then @Fax else Fax end,
			Status = Case when (@Status is not null) then @Status else Status end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationinfo_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationinfo_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@NameOfCEO nvarchar (150) = NULL,
		@TelephoneNo nvarchar (20) = NULL,
		@MobileNo nvarchar (20) = NULL,
		@Email nvarchar (150) = NULL,
		@WebSite nvarchar (150) = NULL,
		@Fax nvarchar (20) = NULL,
		@Status bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_ORGANIZATIONINFO (
			DESCRIPT,
			NameOfCEO,
			TelephoneNo,
			MobileNo,
			Email,
			WebSite,
			Fax,
			Status,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@DESCRIPT,
			@NameOfCEO,
			@TelephoneNo,
			@MobileNo,
			@Email,
			@WebSite,
			@Fax,
			@Status,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationinfo_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_organizationinfo_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@DESCRIPT nvarchar (150) = NULL,
	@NameOfCEO nvarchar (150) = NULL,
	@TelephoneNo nvarchar (20) = NULL,
	@MobileNo nvarchar (20) = NULL,
	@Email nvarchar (150) = NULL,
	@WebSite nvarchar (150) = NULL,
	@Fax nvarchar (20) = NULL,
	@Status bit  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_organizationinfo
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NameOfCEO is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.NameOfCEO  LIKE '%' + @NameOfCEO + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TelephoneNo is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.TelephoneNo  LIKE '%' + @TelephoneNo + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MobileNo is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.MobileNo  LIKE '%' + @MobileNo + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Email is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Email  LIKE '%' + @Email + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @WebSite is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.WebSite  LIKE '%' + @WebSite + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Fax is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Fax  LIKE '%' + @Fax + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Status is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Status  = @Status THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_organizationinfo AS
			(
				  SELECT 
			ALRD_ORGANIZATIONINFO.COMPID,
			ALRD_ORGANIZATIONINFO.DESCRIPT,
			ALRD_ORGANIZATIONINFO.NameOfCEO,
			ALRD_ORGANIZATIONINFO.TelephoneNo,
			ALRD_ORGANIZATIONINFO.MobileNo,
			ALRD_ORGANIZATIONINFO.Email,
			ALRD_ORGANIZATIONINFO.WebSite,
			ALRD_ORGANIZATIONINFO.Fax,
			ALRD_ORGANIZATIONINFO.Status,
			ALRD_ORGANIZATIONINFO.CreatedBy,
			ALRD_ORGANIZATIONINFO.CreatedOn,
			ALRD_ORGANIZATIONINFO.UpdatedBy,
			ALRD_ORGANIZATIONINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_ORGANIZATIONINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_ORGANIZATIONINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_ORGANIZATIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_ORGANIZATIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='NameOfCEO ASC' THEN ALRD_ORGANIZATIONINFO.NameOfCEO END ASC,
						CASE WHEN @SortExpression ='NameOfCEO DESC' THEN ALRD_ORGANIZATIONINFO.NameOfCEO END DESC,
						CASE WHEN @SortExpression ='TelephoneNo ASC' THEN ALRD_ORGANIZATIONINFO.TelephoneNo END ASC,
						CASE WHEN @SortExpression ='TelephoneNo DESC' THEN ALRD_ORGANIZATIONINFO.TelephoneNo END DESC,
						CASE WHEN @SortExpression ='MobileNo ASC' THEN ALRD_ORGANIZATIONINFO.MobileNo END ASC,
						CASE WHEN @SortExpression ='MobileNo DESC' THEN ALRD_ORGANIZATIONINFO.MobileNo END DESC,
						CASE WHEN @SortExpression ='Email ASC' THEN ALRD_ORGANIZATIONINFO.Email END ASC,
						CASE WHEN @SortExpression ='Email DESC' THEN ALRD_ORGANIZATIONINFO.Email END DESC,
						CASE WHEN @SortExpression ='WebSite ASC' THEN ALRD_ORGANIZATIONINFO.WebSite END ASC,
						CASE WHEN @SortExpression ='WebSite DESC' THEN ALRD_ORGANIZATIONINFO.WebSite END DESC,
						CASE WHEN @SortExpression ='Fax ASC' THEN ALRD_ORGANIZATIONINFO.Fax END ASC,
						CASE WHEN @SortExpression ='Fax DESC' THEN ALRD_ORGANIZATIONINFO.Fax END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN ALRD_ORGANIZATIONINFO.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN ALRD_ORGANIZATIONINFO.Status END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_ORGANIZATIONINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_ORGANIZATIONINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_ORGANIZATIONINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_ORGANIZATIONINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_ORGANIZATIONINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_ORGANIZATIONINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_ORGANIZATIONINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_ORGANIZATIONINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_ORGANIZATIONINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NameOfCEO is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.NameOfCEO  LIKE '%' + @NameOfCEO + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TelephoneNo is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.TelephoneNo  LIKE '%' + @TelephoneNo + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MobileNo is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.MobileNo  LIKE '%' + @MobileNo + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Email is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Email  LIKE '%' + @Email + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @WebSite is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.WebSite  LIKE '%' + @WebSite + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Fax is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Fax  LIKE '%' + @Fax + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Status is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Status  = @Status THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_organizationinfo
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationinfo_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_organizationinfo_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@NameOfCEO nvarchar (150) = NULL,
		@TelephoneNo nvarchar (20) = NULL,
		@MobileNo nvarchar (20) = NULL,
		@Email nvarchar (150) = NULL,
		@WebSite nvarchar (150) = NULL,
		@Fax nvarchar (20) = NULL,
		@Status bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_ORGANIZATIONINFO.COMPID,
			ALRD_ORGANIZATIONINFO.DESCRIPT,
			ALRD_ORGANIZATIONINFO.NameOfCEO,
			ALRD_ORGANIZATIONINFO.TelephoneNo,
			ALRD_ORGANIZATIONINFO.MobileNo,
			ALRD_ORGANIZATIONINFO.Email,
			ALRD_ORGANIZATIONINFO.WebSite,
			ALRD_ORGANIZATIONINFO.Fax,
			ALRD_ORGANIZATIONINFO.Status,
			ALRD_ORGANIZATIONINFO.CreatedBy,
			ALRD_ORGANIZATIONINFO.CreatedOn,
			ALRD_ORGANIZATIONINFO.UpdatedBy,
			ALRD_ORGANIZATIONINFO.UpdatedOn,
			(CASE WHEN ALRD_ORGANIZATIONINFO.Status = 1 THEN 'Active' ELSE 'Inactive' END) as StatusName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_ORGANIZATIONINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_ORGANIZATIONINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_ORGANIZATIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_ORGANIZATIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='NameOfCEO ASC' THEN ALRD_ORGANIZATIONINFO.NameOfCEO END ASC,
						CASE WHEN @SortExpression ='NameOfCEO DESC' THEN ALRD_ORGANIZATIONINFO.NameOfCEO END DESC,
						CASE WHEN @SortExpression ='TelephoneNo ASC' THEN ALRD_ORGANIZATIONINFO.TelephoneNo END ASC,
						CASE WHEN @SortExpression ='TelephoneNo DESC' THEN ALRD_ORGANIZATIONINFO.TelephoneNo END DESC,
						CASE WHEN @SortExpression ='MobileNo ASC' THEN ALRD_ORGANIZATIONINFO.MobileNo END ASC,
						CASE WHEN @SortExpression ='MobileNo DESC' THEN ALRD_ORGANIZATIONINFO.MobileNo END DESC,
						CASE WHEN @SortExpression ='Email ASC' THEN ALRD_ORGANIZATIONINFO.Email END ASC,
						CASE WHEN @SortExpression ='Email DESC' THEN ALRD_ORGANIZATIONINFO.Email END DESC,
						CASE WHEN @SortExpression ='WebSite ASC' THEN ALRD_ORGANIZATIONINFO.WebSite END ASC,
						CASE WHEN @SortExpression ='WebSite DESC' THEN ALRD_ORGANIZATIONINFO.WebSite END DESC,
						CASE WHEN @SortExpression ='Fax ASC' THEN ALRD_ORGANIZATIONINFO.Fax END ASC,
						CASE WHEN @SortExpression ='Fax DESC' THEN ALRD_ORGANIZATIONINFO.Fax END DESC,
						CASE WHEN @SortExpression ='Status ASC' THEN ALRD_ORGANIZATIONINFO.Status END ASC,
						CASE WHEN @SortExpression ='Status DESC' THEN ALRD_ORGANIZATIONINFO.Status END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_ORGANIZATIONINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_ORGANIZATIONINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_ORGANIZATIONINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_ORGANIZATIONINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_ORGANIZATIONINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_ORGANIZATIONINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_ORGANIZATIONINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_ORGANIZATIONINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_ORGANIZATIONINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NameOfCEO is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.NameOfCEO  LIKE '%' + @NameOfCEO + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TelephoneNo is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.TelephoneNo  LIKE '%' + @TelephoneNo + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MobileNo is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.MobileNo  LIKE '%' + @MobileNo + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Email is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Email  LIKE '%' + @Email + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @WebSite is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.WebSite  LIKE '%' + @WebSite + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Fax is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Fax  LIKE '%' + @Fax + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Status is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.Status  = @Status THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationinfo_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationinfo_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@NameOfCEO nvarchar (150) = NULL,
		@TelephoneNo nvarchar (20) = NULL,
		@MobileNo nvarchar (20) = NULL,
		@Email nvarchar (150) = NULL,
		@WebSite nvarchar (150) = NULL,
		@Fax nvarchar (20) = NULL,
		@Status bit  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_ORGANIZATIONINFO
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  Table [dbo].[ALRD_UPAZILAINFO]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_UPAZILAINFO](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[DESCRIPT] [nvarchar](150) NOT NULL,
	[DistrictID] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_UPAZILAINFO] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALRD_UNIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_UNIONINFO](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[DESCRIPT] [nvarchar](150) NOT NULL,
	[UpazilaID] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_UNIONINFO] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALRD_DIVISIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_DIVISIONINFO](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[DESCRIPT] [nvarchar](150) NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_DIVISIONINFO] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_ALRD_DIVISIONINFO] ON [dbo].[ALRD_DIVISIONINFO] 
(
	[DESCRIPT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALRD_DISTRICTINFO]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_DISTRICTINFO](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[DESCRIPT] [nvarchar](150) NOT NULL,
	[DivisionID] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_DISTRICTINFO] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ALRD_ORGANIZATIONDATA]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_ORGANIZATIONDATA](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[CollectionMonth] [bigint] NOT NULL,
	[CollCollectionYear] [bigint] NOT NULL,
	[CollOrganizationID] [bigint] NOT NULL,
	[ActKhaLand] [bit] NULL,
	[ActKhaWater] [bit] NULL,
	[ActAdibasi] [bit] NULL,
	[ActLanServey] [bit] NULL,
	[ActAwareness] [bit] NULL,
	[ActVestedProp] [bit] NULL,
	[DivisionID] [bigint] NULL,
	[DistrictID] [bigint] NULL,
	[UpazilaID] [bigint] NULL,
	[UnionID] [bigint] NULL,
	[TotalKhasLandGov11] [decimal](18, 2) NULL,
	[DistributedKhasLandGov12] [decimal](18, 2) NULL,
	[DistributableKhasLandGov13] [decimal](18, 2) NULL,
	[TotalLandlessFamilyGov14] [decimal](18, 2) NULL,
	[NoOfFamilyGotKhasLandGov15] [decimal](18, 2) NULL,
	[IllegalOccupiedKhasLandGov16] [decimal](18, 2) NULL,
	[TotalKhasLandOrg21] [decimal](18, 2) NULL,
	[DistributedKhasLandOrg22] [decimal](18, 2) NULL,
	[DistributableKhasLandOrg23] [decimal](18, 2) NULL,
	[TotalLandlessFamilyOrg24] [decimal](18, 2) NULL,
	[NoOfFamilyGotKhasLandOrg25] [decimal](18, 2) NULL,
	[NoOfFamilyEvictedKhasLandOrg26] [decimal](18, 2) NULL,
	[NoOfViolenceKhasLandOrg27] [decimal](18, 2) NULL,
	[NoOfLitigationKhasLandOrg28] [decimal](18, 2) NULL,
	[NoOfInitiativeGathOrg29] [bigint] NULL,
	[NoOfInitiativeRallyOrg29] [bigint] NULL,
	[NoOfInitiativeMemoOrg29] [bigint] NULL,
	[NoOfInitiativeLegalOrg29] [bigint] NULL,
	[NoOfInitiativeMeetOrg29] [bigint] NULL,
	[NoOfInitiativeOthOrg29] [bigint] NULL,
	[TotalLess20KhasWaterGov31] [decimal](18, 2) NULL,
	[TotalMore20KhasWaterGov32] [decimal](18, 2) NULL,
	[TotalLeaseLess20KhasWaterGov33] [decimal](18, 2) NULL,
	[TotalLeaseMore20KhasWaterGov34] [decimal](18, 2) NULL,
	[TotalLess20KhasWaterOrg41] [decimal](18, 2) NULL,
	[TotalMore20KhasWaterOrg42] [decimal](18, 2) NULL,
	[TotalLeaseLess20KhasWaterOrg43] [decimal](18, 2) NULL,
	[TotalLeaseMore20KhasWaterOrg44] [decimal](18, 2) NULL,
	[NoOfFamilyFishingOrg45] [decimal](18, 2) NULL,
	[NoOfRegFisherFolkCoOrg46] [decimal](18, 2) NULL,
	[NoOfFisherFolkCoOrg47] [decimal](18, 2) NULL,
	[NoOfLitigationKhasWaterOrg48] [decimal](18, 2) NULL,
	[NoOfMovKhasWaterOrg49] [decimal](18, 2) NULL,
	[NoOfCaseEvictionKhasWaterOrg410] [decimal](18, 2) NULL,
	[NoOfInitiativeGathOrg411] [decimal](18, 2) NULL,
	[NoOfInitiativeRallyOrg411] [decimal](18, 2) NULL,
	[NoOfInitiativeMemoOrg411] [decimal](18, 2) NULL,
	[NoOfInitiativeLegalOrg411] [decimal](18, 2) NULL,
	[NoOfInitiativeMeetOrg411] [decimal](18, 2) NULL,
	[NoOfInitiativeOthOrg411] [decimal](18, 2) NULL,
	[TotalLand51] [decimal](18, 2) NULL,
	[TotalPrivateProp52] [decimal](18, 2) NULL,
	[TotalAgriLand53] [decimal](18, 2) NULL,
	[TotalNonAgriLand54] [decimal](18, 2) NULL,
	[TotalForestLand55] [decimal](18, 2) NULL,
	[TotalCommLan56] [decimal](18, 2) NULL,
	[TotalAgriCommLastYear57] [decimal](18, 2) NULL,
	[TotalAgriComm58] [decimal](18, 2) NULL,
	[NoOfFamilyAgriComm59] [decimal](18, 2) NULL,
	[TotalCharLand510] [decimal](18, 2) NULL,
	[NatAgriCommTobacco511] [decimal](18, 2) NULL,
	[NatAgriCommRubber511] [decimal](18, 2) NULL,
	[NatAgriCommBricks511] [decimal](18, 2) NULL,
	[NatAgriCommIndustry511] [decimal](18, 2) NULL,
	[Remarks512] [nvarchar](300) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_ORGANIZATIONSDATA] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationdata_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationdata_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@CollOrganizationID bigint  = NULL,
		@ActKhaLand bit  = NULL,
		@ActKhaWater bit  = NULL,
		@ActAdibasi bit  = NULL,
		@ActLanServey bit  = NULL,
		@ActAwareness bit  = NULL,
		@ActVestedProp bit  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@UnionID bigint  = NULL,
		@TotalKhasLandGov11 decimal (18, 2) = NULL,
		@DistributedKhasLandGov12 decimal (18, 2) = NULL,
		@DistributableKhasLandGov13 decimal (18, 2) = NULL,
		@TotalLandlessFamilyGov14 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandGov15 decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandGov16 decimal (18, 2) = NULL,
		@TotalKhasLandOrg21 decimal (18, 2) = NULL,
		@DistributedKhasLandOrg22 decimal (18, 2) = NULL,
		@DistributableKhasLandOrg23 decimal (18, 2) = NULL,
		@TotalLandlessFamilyOrg24 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandOrg25 decimal (18, 2) = NULL,
		@NoOfFamilyEvictedKhasLandOrg26 decimal (18, 2) = NULL,
		@NoOfViolenceKhasLandOrg27 decimal (18, 2) = NULL,
		@NoOfLitigationKhasLandOrg28 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg29 bigint = NULL,
		@NoOfInitiativeRallyOrg29 bigint = NULL,
		@NoOfInitiativeMemoOrg29 bigint = NULL,
		@NoOfInitiativeLegalOrg29 bigint = NULL,
		@NoOfInitiativeMeetOrg29 bigint = NULL,
		@NoOfInitiativeOthOrg29 bigint = NULL,
		@TotalLess20KhasWaterGov31 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterGov32 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterGov33 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterGov34 decimal (18, 2) = NULL,
		@TotalLess20KhasWaterOrg41 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterOrg42 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterOrg43 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterOrg44 decimal (18, 2) = NULL,
		@NoOfFamilyFishingOrg45 decimal (18, 2) = NULL,
		@NoOfRegFisherFolkCoOrg46 decimal (18, 2) = NULL,
		@NoOfFisherFolkCoOrg47 decimal (18, 2) = NULL,
		@NoOfLitigationKhasWaterOrg48 decimal (18, 2) = NULL,
		@NoOfMovKhasWaterOrg49 decimal (18, 2) = NULL,
		@NoOfCaseEvictionKhasWaterOrg410 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeRallyOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMemoOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeLegalOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMeetOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeOthOrg411 decimal (18, 2) = NULL,
		@TotalLand51 decimal (18, 2) = NULL,
		@TotalPrivateProp52 decimal (18, 2) = NULL,
		@TotalAgriLand53 decimal (18, 2) = NULL,
		@TotalNonAgriLand54 decimal (18, 2) = NULL,
		@TotalForestLand55 decimal (18, 2) = NULL,
		@TotalCommLan56 decimal (18, 2) = NULL,
		@TotalAgriCommLastYear57 decimal (18, 2) = NULL,
		@TotalAgriComm58 decimal (18, 2) = NULL,
		@NoOfFamilyAgriComm59 decimal (18, 2) = NULL,
		@TotalCharLand510 decimal (18, 2) = NULL,
		@NatAgriCommTobacco511 decimal (18, 2) = NULL,
		@NatAgriCommRubber511 decimal (18, 2) = NULL,
		@NatAgriCommBricks511 decimal (18, 2) = NULL,
		@NatAgriCommIndustry511 decimal (18, 2) = NULL,
		@Remarks512 nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_ORGANIZATIONDATA
		SET
			CollectionMonth = @CollectionMonth,
			CollCollectionYear = @CollCollectionYear,
			CollOrganizationID = @CollOrganizationID,
			ActKhaLand = @ActKhaLand,
			ActKhaWater = @ActKhaWater,
			ActAdibasi = @ActAdibasi,
			ActLanServey = @ActLanServey,
			ActAwareness = @ActAwareness,
			ActVestedProp = @ActVestedProp,
			DivisionID = @DivisionID,
			DistrictID = @DistrictID,
			UpazilaID = @UpazilaID,
			UnionID = @UnionID,
			TotalKhasLandGov11 = @TotalKhasLandGov11,
			DistributedKhasLandGov12 = @DistributedKhasLandGov12,
			DistributableKhasLandGov13 = @DistributableKhasLandGov13,
			TotalLandlessFamilyGov14 = @TotalLandlessFamilyGov14,
			NoOfFamilyGotKhasLandGov15 = @NoOfFamilyGotKhasLandGov15,
			IllegalOccupiedKhasLandGov16 = @IllegalOccupiedKhasLandGov16,
			TotalKhasLandOrg21 = @TotalKhasLandOrg21,
			DistributedKhasLandOrg22 = @DistributedKhasLandOrg22,
			DistributableKhasLandOrg23 = @DistributableKhasLandOrg23,
			TotalLandlessFamilyOrg24 = @TotalLandlessFamilyOrg24,
			NoOfFamilyGotKhasLandOrg25 = @NoOfFamilyGotKhasLandOrg25,
			NoOfFamilyEvictedKhasLandOrg26 = @NoOfFamilyEvictedKhasLandOrg26,
			NoOfViolenceKhasLandOrg27 = @NoOfViolenceKhasLandOrg27,
			NoOfLitigationKhasLandOrg28 = @NoOfLitigationKhasLandOrg28,
			NoOfInitiativeGathOrg29 = @NoOfInitiativeGathOrg29,
			NoOfInitiativeRallyOrg29 = @NoOfInitiativeRallyOrg29,
			NoOfInitiativeMemoOrg29 = @NoOfInitiativeMemoOrg29,
			NoOfInitiativeLegalOrg29 = @NoOfInitiativeLegalOrg29,
			NoOfInitiativeMeetOrg29 = @NoOfInitiativeMeetOrg29,
			NoOfInitiativeOthOrg29 = @NoOfInitiativeOthOrg29,
			TotalLess20KhasWaterGov31 = @TotalLess20KhasWaterGov31,
			TotalMore20KhasWaterGov32 = @TotalMore20KhasWaterGov32,
			TotalLeaseLess20KhasWaterGov33 = @TotalLeaseLess20KhasWaterGov33,
			TotalLeaseMore20KhasWaterGov34 = @TotalLeaseMore20KhasWaterGov34,
			TotalLess20KhasWaterOrg41 = @TotalLess20KhasWaterOrg41,
			TotalMore20KhasWaterOrg42 = @TotalMore20KhasWaterOrg42,
			TotalLeaseLess20KhasWaterOrg43 = @TotalLeaseLess20KhasWaterOrg43,
			TotalLeaseMore20KhasWaterOrg44 = @TotalLeaseMore20KhasWaterOrg44,
			NoOfFamilyFishingOrg45 = @NoOfFamilyFishingOrg45,
			NoOfRegFisherFolkCoOrg46 = @NoOfRegFisherFolkCoOrg46,
			NoOfFisherFolkCoOrg47 = @NoOfFisherFolkCoOrg47,
			NoOfLitigationKhasWaterOrg48 = @NoOfLitigationKhasWaterOrg48,
			NoOfMovKhasWaterOrg49 = @NoOfMovKhasWaterOrg49,
			NoOfCaseEvictionKhasWaterOrg410 = @NoOfCaseEvictionKhasWaterOrg410,
			NoOfInitiativeGathOrg411 = @NoOfInitiativeGathOrg411,
			NoOfInitiativeRallyOrg411 = @NoOfInitiativeRallyOrg411,
			NoOfInitiativeMemoOrg411 = @NoOfInitiativeMemoOrg411,
			NoOfInitiativeLegalOrg411 = @NoOfInitiativeLegalOrg411,
			NoOfInitiativeMeetOrg411 = @NoOfInitiativeMeetOrg411,
			NoOfInitiativeOthOrg411 = @NoOfInitiativeOthOrg411,
			TotalLand51 = @TotalLand51,
			TotalPrivateProp52 = @TotalPrivateProp52,
			TotalAgriLand53 = @TotalAgriLand53,
			TotalNonAgriLand54 = @TotalNonAgriLand54,
			TotalForestLand55 = @TotalForestLand55,
			TotalCommLan56 = @TotalCommLan56,
			TotalAgriCommLastYear57 = @TotalAgriCommLastYear57,
			TotalAgriComm58 = @TotalAgriComm58,
			NoOfFamilyAgriComm59 = @NoOfFamilyAgriComm59,
			TotalCharLand510 = @TotalCharLand510,
			NatAgriCommTobacco511 = @NatAgriCommTobacco511,
			NatAgriCommRubber511 = @NatAgriCommRubber511,
			NatAgriCommBricks511 = @NatAgriCommBricks511,
			NatAgriCommIndustry511 = @NatAgriCommIndustry511,
			Remarks512 = @Remarks512,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationdata_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationdata_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@CollOrganizationID bigint  = NULL,
		@ActKhaLand bit  = NULL,
		@ActKhaWater bit  = NULL,
		@ActAdibasi bit  = NULL,
		@ActLanServey bit  = NULL,
		@ActAwareness bit  = NULL,
		@ActVestedProp bit  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@UnionID bigint  = NULL,
		@TotalKhasLandGov11 decimal (18, 2) = NULL,
		@DistributedKhasLandGov12 decimal (18, 2) = NULL,
		@DistributableKhasLandGov13 decimal (18, 2) = NULL,
		@TotalLandlessFamilyGov14 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandGov15 decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandGov16 decimal (18, 2) = NULL,
		@TotalKhasLandOrg21 decimal (18, 2) = NULL,
		@DistributedKhasLandOrg22 decimal (18, 2) = NULL,
		@DistributableKhasLandOrg23 decimal (18, 2) = NULL,
		@TotalLandlessFamilyOrg24 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandOrg25 decimal (18, 2) = NULL,
		@NoOfFamilyEvictedKhasLandOrg26 decimal (18, 2) = NULL,
		@NoOfViolenceKhasLandOrg27 decimal (18, 2) = NULL,
		@NoOfLitigationKhasLandOrg28 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg29 bigint = NULL,
		@NoOfInitiativeRallyOrg29 bigint = NULL,
		@NoOfInitiativeMemoOrg29 bigint = NULL,
		@NoOfInitiativeLegalOrg29 bigint = NULL,
		@NoOfInitiativeMeetOrg29 bigint = NULL,
		@NoOfInitiativeOthOrg29 bigint = NULL,
		@TotalLess20KhasWaterGov31 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterGov32 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterGov33 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterGov34 decimal (18, 2) = NULL,
		@TotalLess20KhasWaterOrg41 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterOrg42 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterOrg43 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterOrg44 decimal (18, 2) = NULL,
		@NoOfFamilyFishingOrg45 decimal (18, 2) = NULL,
		@NoOfRegFisherFolkCoOrg46 decimal (18, 2) = NULL,
		@NoOfFisherFolkCoOrg47 decimal (18, 2) = NULL,
		@NoOfLitigationKhasWaterOrg48 decimal (18, 2) = NULL,
		@NoOfMovKhasWaterOrg49 decimal (18, 2) = NULL,
		@NoOfCaseEvictionKhasWaterOrg410 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeRallyOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMemoOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeLegalOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMeetOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeOthOrg411 decimal (18, 2) = NULL,
		@TotalLand51 decimal (18, 2) = NULL,
		@TotalPrivateProp52 decimal (18, 2) = NULL,
		@TotalAgriLand53 decimal (18, 2) = NULL,
		@TotalNonAgriLand54 decimal (18, 2) = NULL,
		@TotalForestLand55 decimal (18, 2) = NULL,
		@TotalCommLan56 decimal (18, 2) = NULL,
		@TotalAgriCommLastYear57 decimal (18, 2) = NULL,
		@TotalAgriComm58 decimal (18, 2) = NULL,
		@NoOfFamilyAgriComm59 decimal (18, 2) = NULL,
		@TotalCharLand510 decimal (18, 2) = NULL,
		@NatAgriCommTobacco511 decimal (18, 2) = NULL,
		@NatAgriCommRubber511 decimal (18, 2) = NULL,
		@NatAgriCommBricks511 decimal (18, 2) = NULL,
		@NatAgriCommIndustry511 decimal (18, 2) = NULL,
		@Remarks512 nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_ORGANIZATIONDATA
		SET
			CollectionMonth = Case when (@CollectionMonth is not null) then @CollectionMonth else CollectionMonth end,
			CollCollectionYear = Case when (@CollCollectionYear is not null) then @CollCollectionYear else CollCollectionYear end,
			CollOrganizationID = Case when (@CollOrganizationID is not null) then @CollOrganizationID else CollOrganizationID end,
			ActKhaLand = Case when (@ActKhaLand is not null) then @ActKhaLand else ActKhaLand end,
			ActKhaWater = Case when (@ActKhaWater is not null) then @ActKhaWater else ActKhaWater end,
			ActAdibasi = Case when (@ActAdibasi is not null) then @ActAdibasi else ActAdibasi end,
			ActLanServey = Case when (@ActLanServey is not null) then @ActLanServey else ActLanServey end,
			ActAwareness = Case when (@ActAwareness is not null) then @ActAwareness else ActAwareness end,
			ActVestedProp = Case when (@ActVestedProp is not null) then @ActVestedProp else ActVestedProp end,
			DivisionID = Case when (@DivisionID =0 ) then NULL  else Case when (@DivisionID is not null) then @DivisionID else DivisionID end end,
			DistrictID = Case when (@DistrictID =0 ) then NULL  else Case when (@DistrictID is not null) then @DistrictID else DistrictID end end,
			UpazilaID = Case when (@UpazilaID =0 ) then NULL  else Case when (@UpazilaID is not null) then @UpazilaID else UpazilaID end end,
			UnionID = Case when (@UnionID =0 ) then NULL  else Case when (@UnionID is not null) then @UnionID else UnionID end end,
			TotalKhasLandGov11 = Case when (@TotalKhasLandGov11 is not null) then @TotalKhasLandGov11 else TotalKhasLandGov11 end,
			DistributedKhasLandGov12 = Case when (@DistributedKhasLandGov12 is not null) then @DistributedKhasLandGov12 else DistributedKhasLandGov12 end,
			DistributableKhasLandGov13 = Case when (@DistributableKhasLandGov13 is not null) then @DistributableKhasLandGov13 else DistributableKhasLandGov13 end,
			TotalLandlessFamilyGov14 = Case when (@TotalLandlessFamilyGov14 is not null) then @TotalLandlessFamilyGov14 else TotalLandlessFamilyGov14 end,
			NoOfFamilyGotKhasLandGov15 = Case when (@NoOfFamilyGotKhasLandGov15 is not null) then @NoOfFamilyGotKhasLandGov15 else NoOfFamilyGotKhasLandGov15 end,
			IllegalOccupiedKhasLandGov16 = Case when (@IllegalOccupiedKhasLandGov16 is not null) then @IllegalOccupiedKhasLandGov16 else IllegalOccupiedKhasLandGov16 end,
			TotalKhasLandOrg21 = Case when (@TotalKhasLandOrg21 is not null) then @TotalKhasLandOrg21 else TotalKhasLandOrg21 end,
			DistributedKhasLandOrg22 = Case when (@DistributedKhasLandOrg22 is not null) then @DistributedKhasLandOrg22 else DistributedKhasLandOrg22 end,
			DistributableKhasLandOrg23 = Case when (@DistributableKhasLandOrg23 is not null) then @DistributableKhasLandOrg23 else DistributableKhasLandOrg23 end,
			TotalLandlessFamilyOrg24 = Case when (@TotalLandlessFamilyOrg24 is not null) then @TotalLandlessFamilyOrg24 else TotalLandlessFamilyOrg24 end,
			NoOfFamilyGotKhasLandOrg25 = Case when (@NoOfFamilyGotKhasLandOrg25 is not null) then @NoOfFamilyGotKhasLandOrg25 else NoOfFamilyGotKhasLandOrg25 end,
			NoOfFamilyEvictedKhasLandOrg26 = Case when (@NoOfFamilyEvictedKhasLandOrg26 is not null) then @NoOfFamilyEvictedKhasLandOrg26 else NoOfFamilyEvictedKhasLandOrg26 end,
			NoOfViolenceKhasLandOrg27 = Case when (@NoOfViolenceKhasLandOrg27 is not null) then @NoOfViolenceKhasLandOrg27 else NoOfViolenceKhasLandOrg27 end,
			NoOfLitigationKhasLandOrg28 = Case when (@NoOfLitigationKhasLandOrg28 is not null) then @NoOfLitigationKhasLandOrg28 else NoOfLitigationKhasLandOrg28 end,
			NoOfInitiativeGathOrg29 = Case when (@NoOfInitiativeGathOrg29 is not null) then @NoOfInitiativeGathOrg29 else NoOfInitiativeGathOrg29 end,
			NoOfInitiativeRallyOrg29 = Case when (@NoOfInitiativeRallyOrg29 is not null) then @NoOfInitiativeRallyOrg29 else NoOfInitiativeRallyOrg29 end,
			NoOfInitiativeMemoOrg29 = Case when (@NoOfInitiativeMemoOrg29 is not null) then @NoOfInitiativeMemoOrg29 else NoOfInitiativeMemoOrg29 end,
			NoOfInitiativeLegalOrg29 = Case when (@NoOfInitiativeLegalOrg29 is not null) then @NoOfInitiativeLegalOrg29 else NoOfInitiativeLegalOrg29 end,
			NoOfInitiativeMeetOrg29 = Case when (@NoOfInitiativeMeetOrg29 is not null) then @NoOfInitiativeMeetOrg29 else NoOfInitiativeMeetOrg29 end,
			NoOfInitiativeOthOrg29 = Case when (@NoOfInitiativeOthOrg29 is not null) then @NoOfInitiativeOthOrg29 else NoOfInitiativeOthOrg29 end,
			TotalLess20KhasWaterGov31 = Case when (@TotalLess20KhasWaterGov31 is not null) then @TotalLess20KhasWaterGov31 else TotalLess20KhasWaterGov31 end,
			TotalMore20KhasWaterGov32 = Case when (@TotalMore20KhasWaterGov32 is not null) then @TotalMore20KhasWaterGov32 else TotalMore20KhasWaterGov32 end,
			TotalLeaseLess20KhasWaterGov33 = Case when (@TotalLeaseLess20KhasWaterGov33 is not null) then @TotalLeaseLess20KhasWaterGov33 else TotalLeaseLess20KhasWaterGov33 end,
			TotalLeaseMore20KhasWaterGov34 = Case when (@TotalLeaseMore20KhasWaterGov34 is not null) then @TotalLeaseMore20KhasWaterGov34 else TotalLeaseMore20KhasWaterGov34 end,
			TotalLess20KhasWaterOrg41 = Case when (@TotalLess20KhasWaterOrg41 is not null) then @TotalLess20KhasWaterOrg41 else TotalLess20KhasWaterOrg41 end,
			TotalMore20KhasWaterOrg42 = Case when (@TotalMore20KhasWaterOrg42 is not null) then @TotalMore20KhasWaterOrg42 else TotalMore20KhasWaterOrg42 end,
			TotalLeaseLess20KhasWaterOrg43 = Case when (@TotalLeaseLess20KhasWaterOrg43 is not null) then @TotalLeaseLess20KhasWaterOrg43 else TotalLeaseLess20KhasWaterOrg43 end,
			TotalLeaseMore20KhasWaterOrg44 = Case when (@TotalLeaseMore20KhasWaterOrg44 is not null) then @TotalLeaseMore20KhasWaterOrg44 else TotalLeaseMore20KhasWaterOrg44 end,
			NoOfFamilyFishingOrg45 = Case when (@NoOfFamilyFishingOrg45 is not null) then @NoOfFamilyFishingOrg45 else NoOfFamilyFishingOrg45 end,
			NoOfRegFisherFolkCoOrg46 = Case when (@NoOfRegFisherFolkCoOrg46 is not null) then @NoOfRegFisherFolkCoOrg46 else NoOfRegFisherFolkCoOrg46 end,
			NoOfFisherFolkCoOrg47 = Case when (@NoOfFisherFolkCoOrg47 is not null) then @NoOfFisherFolkCoOrg47 else NoOfFisherFolkCoOrg47 end,
			NoOfLitigationKhasWaterOrg48 = Case when (@NoOfLitigationKhasWaterOrg48 is not null) then @NoOfLitigationKhasWaterOrg48 else NoOfLitigationKhasWaterOrg48 end,
			NoOfMovKhasWaterOrg49 = Case when (@NoOfMovKhasWaterOrg49 is not null) then @NoOfMovKhasWaterOrg49 else NoOfMovKhasWaterOrg49 end,
			NoOfCaseEvictionKhasWaterOrg410 = Case when (@NoOfCaseEvictionKhasWaterOrg410 is not null) then @NoOfCaseEvictionKhasWaterOrg410 else NoOfCaseEvictionKhasWaterOrg410 end,
			NoOfInitiativeGathOrg411 = Case when (@NoOfInitiativeGathOrg411 is not null) then @NoOfInitiativeGathOrg411 else NoOfInitiativeGathOrg411 end,
			NoOfInitiativeRallyOrg411 = Case when (@NoOfInitiativeRallyOrg411 is not null) then @NoOfInitiativeRallyOrg411 else NoOfInitiativeRallyOrg411 end,
			NoOfInitiativeMemoOrg411 = Case when (@NoOfInitiativeMemoOrg411 is not null) then @NoOfInitiativeMemoOrg411 else NoOfInitiativeMemoOrg411 end,
			NoOfInitiativeLegalOrg411 = Case when (@NoOfInitiativeLegalOrg411 is not null) then @NoOfInitiativeLegalOrg411 else NoOfInitiativeLegalOrg411 end,
			NoOfInitiativeMeetOrg411 = Case when (@NoOfInitiativeMeetOrg411 is not null) then @NoOfInitiativeMeetOrg411 else NoOfInitiativeMeetOrg411 end,
			NoOfInitiativeOthOrg411 = Case when (@NoOfInitiativeOthOrg411 is not null) then @NoOfInitiativeOthOrg411 else NoOfInitiativeOthOrg411 end,
			TotalLand51 = Case when (@TotalLand51 is not null) then @TotalLand51 else TotalLand51 end,
			TotalPrivateProp52 = Case when (@TotalPrivateProp52 is not null) then @TotalPrivateProp52 else TotalPrivateProp52 end,
			TotalAgriLand53 = Case when (@TotalAgriLand53 is not null) then @TotalAgriLand53 else TotalAgriLand53 end,
			TotalNonAgriLand54 = Case when (@TotalNonAgriLand54 is not null) then @TotalNonAgriLand54 else TotalNonAgriLand54 end,
			TotalForestLand55 = Case when (@TotalForestLand55 is not null) then @TotalForestLand55 else TotalForestLand55 end,
			TotalCommLan56 = Case when (@TotalCommLan56 is not null) then @TotalCommLan56 else TotalCommLan56 end,
			TotalAgriCommLastYear57 = Case when (@TotalAgriCommLastYear57 is not null) then @TotalAgriCommLastYear57 else TotalAgriCommLastYear57 end,
			TotalAgriComm58 = Case when (@TotalAgriComm58 is not null) then @TotalAgriComm58 else TotalAgriComm58 end,
			NoOfFamilyAgriComm59 = Case when (@NoOfFamilyAgriComm59 is not null) then @NoOfFamilyAgriComm59 else NoOfFamilyAgriComm59 end,
			TotalCharLand510 = Case when (@TotalCharLand510 is not null) then @TotalCharLand510 else TotalCharLand510 end,
			NatAgriCommTobacco511 = Case when (@NatAgriCommTobacco511 is not null) then @NatAgriCommTobacco511 else NatAgriCommTobacco511 end,
			NatAgriCommRubber511 = Case when (@NatAgriCommRubber511 is not null) then @NatAgriCommRubber511 else NatAgriCommRubber511 end,
			NatAgriCommBricks511 = Case when (@NatAgriCommBricks511 is not null) then @NatAgriCommBricks511 else NatAgriCommBricks511 end,
			NatAgriCommIndustry511 = Case when (@NatAgriCommIndustry511 is not null) then @NatAgriCommIndustry511 else NatAgriCommIndustry511 end,
			Remarks512 = Case when (@Remarks512 is not null) then @Remarks512 else Remarks512 end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationdata_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationdata_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@CollOrganizationID bigint  = NULL,
		@ActKhaLand bit  = NULL,
		@ActKhaWater bit  = NULL,
		@ActAdibasi bit  = NULL,
		@ActLanServey bit  = NULL,
		@ActAwareness bit  = NULL,
		@ActVestedProp bit  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@UnionID bigint  = NULL,
		@TotalKhasLandGov11 decimal (18, 4) = NULL,
		@DistributedKhasLandGov12 decimal (18, 4) = NULL,
		@DistributableKhasLandGov13 decimal (18, 4) = NULL,
		@TotalLandlessFamilyGov14 decimal (18, 4) = NULL,
		@NoOfFamilyGotKhasLandGov15 decimal (18, 4) = NULL,
		@IllegalOccupiedKhasLandGov16 decimal (18, 4) = NULL,
		@TotalKhasLandOrg21 decimal (18, 4) = NULL,
		@DistributedKhasLandOrg22 decimal (18, 4) = NULL,
		@DistributableKhasLandOrg23 decimal (18, 4) = NULL,
		@TotalLandlessFamilyOrg24 decimal (18, 4) = NULL,
		@NoOfFamilyGotKhasLandOrg25 decimal (18, 4) = NULL,
		@NoOfFamilyEvictedKhasLandOrg26 decimal (18, 4) = NULL,
		@NoOfViolenceKhasLandOrg27 decimal (18, 4) = NULL,
		@NoOfLitigationKhasLandOrg28 decimal (18, 4) = NULL,
		@NoOfInitiativeGathOrg29 bigint = NULL,
		@NoOfInitiativeRallyOrg29 bigint = NULL,
		@NoOfInitiativeMemoOrg29 bigint = NULL,
		@NoOfInitiativeLegalOrg29 bigint = NULL,
		@NoOfInitiativeMeetOrg29 bigint = NULL,
		@NoOfInitiativeOthOrg29 bigint = NULL,
		@TotalLess20KhasWaterGov31 decimal (18, 4) = NULL,
		@TotalMore20KhasWaterGov32 decimal (18, 4) = NULL,
		@TotalLeaseLess20KhasWaterGov33 decimal (18, 4) = NULL,
		@TotalLeaseMore20KhasWaterGov34 decimal (18, 4) = NULL,
		@TotalLess20KhasWaterOrg41 decimal (18, 4) = NULL,
		@TotalMore20KhasWaterOrg42 decimal (18, 4) = NULL,
		@TotalLeaseLess20KhasWaterOrg43 decimal (18, 4) = NULL,
		@TotalLeaseMore20KhasWaterOrg44 decimal (18, 4) = NULL,
		@NoOfFamilyFishingOrg45 decimal (18, 4) = NULL,
		@NoOfRegFisherFolkCoOrg46 decimal (18, 4) = NULL,
		@NoOfFisherFolkCoOrg47 decimal (18, 4) = NULL,
		@NoOfLitigationKhasWaterOrg48 decimal (18, 4) = NULL,
		@NoOfMovKhasWaterOrg49 decimal (18, 4) = NULL,
		@NoOfCaseEvictionKhasWaterOrg410 decimal (18, 4) = NULL,
		@NoOfInitiativeGathOrg411 decimal (18, 4) = NULL,
		@NoOfInitiativeRallyOrg411 decimal (18, 4) = NULL,
		@NoOfInitiativeMemoOrg411 decimal (18, 4) = NULL,
		@NoOfInitiativeLegalOrg411 decimal (18, 4) = NULL,
		@NoOfInitiativeMeetOrg411 decimal (18, 4) = NULL,
		@NoOfInitiativeOthOrg411 decimal (18, 4) = NULL,
		@TotalLand51 decimal (18, 4) = NULL,
		@TotalPrivateProp52 decimal (18, 4) = NULL,
		@TotalAgriLand53 decimal (18, 4) = NULL,
		@TotalNonAgriLand54 decimal (18, 4) = NULL,
		@TotalForestLand55 decimal (18, 4) = NULL,
		@TotalCommLan56 decimal (18, 4) = NULL,
		@TotalAgriCommLastYear57 decimal (18, 4) = NULL,
		@TotalAgriComm58 decimal (18, 4) = NULL,
		@NoOfFamilyAgriComm59 decimal (18, 4) = NULL,
		@TotalCharLand510 decimal (18, 4) = NULL,
		@NatAgriCommTobacco511 decimal (18, 4) = NULL,
		@NatAgriCommRubber511 decimal (18, 4) = NULL,
		@NatAgriCommBricks511 decimal (18, 4) = NULL,
		@NatAgriCommIndustry511 decimal (18, 4) = NULL,
		@Remarks512 nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_ORGANIZATIONDATA (
			CollectionMonth,
			CollCollectionYear,
			CollOrganizationID,
			ActKhaLand,
			ActKhaWater,
			ActAdibasi,
			ActLanServey,
			ActAwareness,
			ActVestedProp,
			DivisionID,
			DistrictID,
			UpazilaID,
			UnionID,
			TotalKhasLandGov11,
			DistributedKhasLandGov12,
			DistributableKhasLandGov13,
			TotalLandlessFamilyGov14,
			NoOfFamilyGotKhasLandGov15,
			IllegalOccupiedKhasLandGov16,
			TotalKhasLandOrg21,
			DistributedKhasLandOrg22,
			DistributableKhasLandOrg23,
			TotalLandlessFamilyOrg24,
			NoOfFamilyGotKhasLandOrg25,
			NoOfFamilyEvictedKhasLandOrg26,
			NoOfViolenceKhasLandOrg27,
			NoOfLitigationKhasLandOrg28,
			NoOfInitiativeGathOrg29,
			NoOfInitiativeRallyOrg29,
			NoOfInitiativeMemoOrg29,
			NoOfInitiativeLegalOrg29,
			NoOfInitiativeMeetOrg29,
			NoOfInitiativeOthOrg29,
			TotalLess20KhasWaterGov31,
			TotalMore20KhasWaterGov32,
			TotalLeaseLess20KhasWaterGov33,
			TotalLeaseMore20KhasWaterGov34,
			TotalLess20KhasWaterOrg41,
			TotalMore20KhasWaterOrg42,
			TotalLeaseLess20KhasWaterOrg43,
			TotalLeaseMore20KhasWaterOrg44,
			NoOfFamilyFishingOrg45,
			NoOfRegFisherFolkCoOrg46,
			NoOfFisherFolkCoOrg47,
			NoOfLitigationKhasWaterOrg48,
			NoOfMovKhasWaterOrg49,
			NoOfCaseEvictionKhasWaterOrg410,
			NoOfInitiativeGathOrg411,
			NoOfInitiativeRallyOrg411,
			NoOfInitiativeMemoOrg411,
			NoOfInitiativeLegalOrg411,
			NoOfInitiativeMeetOrg411,
			NoOfInitiativeOthOrg411,
			TotalLand51,
			TotalPrivateProp52,
			TotalAgriLand53,
			TotalNonAgriLand54,
			TotalForestLand55,
			TotalCommLan56,
			TotalAgriCommLastYear57,
			TotalAgriComm58,
			NoOfFamilyAgriComm59,
			TotalCharLand510,
			NatAgriCommTobacco511,
			NatAgriCommRubber511,
			NatAgriCommBricks511,
			NatAgriCommIndustry511,
			Remarks512,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@CollectionMonth,
			@CollCollectionYear,
			@CollOrganizationID,
			@ActKhaLand,
			@ActKhaWater,
			@ActAdibasi,
			@ActLanServey,
			@ActAwareness,
			@ActVestedProp,
			@DivisionID,
			@DistrictID,
			@UpazilaID,
			@UnionID,
			@TotalKhasLandGov11,
			@DistributedKhasLandGov12,
			@DistributableKhasLandGov13,
			@TotalLandlessFamilyGov14,
			@NoOfFamilyGotKhasLandGov15,
			@IllegalOccupiedKhasLandGov16,
			@TotalKhasLandOrg21,
			@DistributedKhasLandOrg22,
			@DistributableKhasLandOrg23,
			@TotalLandlessFamilyOrg24,
			@NoOfFamilyGotKhasLandOrg25,
			@NoOfFamilyEvictedKhasLandOrg26,
			@NoOfViolenceKhasLandOrg27,
			@NoOfLitigationKhasLandOrg28,
			@NoOfInitiativeGathOrg29,
			@NoOfInitiativeRallyOrg29,
			@NoOfInitiativeMemoOrg29,
			@NoOfInitiativeLegalOrg29,
			@NoOfInitiativeMeetOrg29,
			@NoOfInitiativeOthOrg29,
			@TotalLess20KhasWaterGov31,
			@TotalMore20KhasWaterGov32,
			@TotalLeaseLess20KhasWaterGov33,
			@TotalLeaseMore20KhasWaterGov34,
			@TotalLess20KhasWaterOrg41,
			@TotalMore20KhasWaterOrg42,
			@TotalLeaseLess20KhasWaterOrg43,
			@TotalLeaseMore20KhasWaterOrg44,
			@NoOfFamilyFishingOrg45,
			@NoOfRegFisherFolkCoOrg46,
			@NoOfFisherFolkCoOrg47,
			@NoOfLitigationKhasWaterOrg48,
			@NoOfMovKhasWaterOrg49,
			@NoOfCaseEvictionKhasWaterOrg410,
			@NoOfInitiativeGathOrg411,
			@NoOfInitiativeRallyOrg411,
			@NoOfInitiativeMemoOrg411,
			@NoOfInitiativeLegalOrg411,
			@NoOfInitiativeMeetOrg411,
			@NoOfInitiativeOthOrg411,
			@TotalLand51,
			@TotalPrivateProp52,
			@TotalAgriLand53,
			@TotalNonAgriLand54,
			@TotalForestLand55,
			@TotalCommLan56,
			@TotalAgriCommLastYear57,
			@TotalAgriComm58,
			@NoOfFamilyAgriComm59,
			@TotalCharLand510,
			@NatAgriCommTobacco511,
			@NatAgriCommRubber511,
			@NatAgriCommBricks511,
			@NatAgriCommIndustry511,
			@Remarks512,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationdata_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_organizationdata_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@CollectionMonth bigint  = NULL,
	@CollCollectionYear bigint  = NULL,
	@CollOrganizationID bigint  = NULL,
	@ActKhaLand bit  = NULL,
	@ActKhaWater bit  = NULL,
	@ActAdibasi bit  = NULL,
	@ActLanServey bit  = NULL,
	@ActAwareness bit  = NULL,
	@ActVestedProp bit  = NULL,
	@DivisionID bigint  = NULL,
	@DistrictID bigint  = NULL,
	@UpazilaID bigint  = NULL,
	@UnionID bigint  = NULL,
	@TotalKhasLandGov11 decimal (18, 2) = NULL,
	@DistributedKhasLandGov12 decimal (18, 2) = NULL,
	@DistributableKhasLandGov13 decimal (18, 2) = NULL,
	@TotalLandlessFamilyGov14 decimal (18, 2) = NULL,
	@NoOfFamilyGotKhasLandGov15 decimal (18, 2) = NULL,
	@IllegalOccupiedKhasLandGov16 decimal (18, 2) = NULL,
	@TotalKhasLandOrg21 decimal (18, 2) = NULL,
	@DistributedKhasLandOrg22 decimal (18, 2) = NULL,
	@DistributableKhasLandOrg23 decimal (18, 2) = NULL,
	@TotalLandlessFamilyOrg24 decimal (18, 2) = NULL,
	@NoOfFamilyGotKhasLandOrg25 decimal (18, 2) = NULL,
	@NoOfFamilyEvictedKhasLandOrg26 decimal (18, 2) = NULL,
	@NoOfViolenceKhasLandOrg27 decimal (18, 2) = NULL,
	@NoOfLitigationKhasLandOrg28 decimal (18, 2) = NULL,
	@NoOfInitiativeGathOrg29 bigint = NULL,
	@NoOfInitiativeRallyOrg29 bigint = NULL,
	@NoOfInitiativeMemoOrg29 bigint = NULL,
	@NoOfInitiativeLegalOrg29 bigint = NULL,
	@NoOfInitiativeMeetOrg29 bigint = NULL,
	@NoOfInitiativeOthOrg29 bigint = NULL,
	@TotalLess20KhasWaterGov31 decimal (18, 2) = NULL,
	@TotalMore20KhasWaterGov32 decimal (18, 2) = NULL,
	@TotalLeaseLess20KhasWaterGov33 decimal (18, 2) = NULL,
	@TotalLeaseMore20KhasWaterGov34 decimal (18, 2) = NULL,
	@TotalLess20KhasWaterOrg41 decimal (18, 2) = NULL,
	@TotalMore20KhasWaterOrg42 decimal (18, 2) = NULL,
	@TotalLeaseLess20KhasWaterOrg43 decimal (18, 2) = NULL,
	@TotalLeaseMore20KhasWaterOrg44 decimal (18, 2) = NULL,
	@NoOfFamilyFishingOrg45 decimal (18, 2) = NULL,
	@NoOfRegFisherFolkCoOrg46 decimal (18, 2) = NULL,
	@NoOfFisherFolkCoOrg47 decimal (18, 2) = NULL,
	@NoOfLitigationKhasWaterOrg48 decimal (18, 2) = NULL,
	@NoOfMovKhasWaterOrg49 decimal (18, 2) = NULL,
	@NoOfCaseEvictionKhasWaterOrg410 decimal (18, 2) = NULL,
	@NoOfInitiativeGathOrg411 decimal (18, 2) = NULL,
	@NoOfInitiativeRallyOrg411 decimal (18, 2) = NULL,
	@NoOfInitiativeMemoOrg411 decimal (18, 2) = NULL,
	@NoOfInitiativeLegalOrg411 decimal (18, 2) = NULL,
	@NoOfInitiativeMeetOrg411 decimal (18, 2) = NULL,
	@NoOfInitiativeOthOrg411 decimal (18, 2) = NULL,
	@TotalLand51 decimal (18, 2) = NULL,
	@TotalPrivateProp52 decimal (18, 2) = NULL,
	@TotalAgriLand53 decimal (18, 2) = NULL,
	@TotalNonAgriLand54 decimal (18, 2) = NULL,
	@TotalForestLand55 decimal (18, 2) = NULL,
	@TotalCommLan56 decimal (18, 2) = NULL,
	@TotalAgriCommLastYear57 decimal (18, 2) = NULL,
	@TotalAgriComm58 decimal (18, 2) = NULL,
	@NoOfFamilyAgriComm59 decimal (18, 2) = NULL,
	@TotalCharLand510 decimal (18, 2) = NULL,
	@NatAgriCommTobacco511 decimal (18, 2) = NULL,
	@NatAgriCommRubber511 decimal (18, 2) = NULL,
	@NatAgriCommBricks511 decimal (18, 2) = NULL,
	@NatAgriCommIndustry511 decimal (18, 2) = NULL,
	@Remarks512 nvarchar (300) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_organizationdata
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollOrganizationID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollOrganizationID  = @CollOrganizationID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActKhaLand is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActKhaLand  = @ActKhaLand THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActKhaWater is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActKhaWater  = @ActKhaWater THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActAdibasi is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActAdibasi  = @ActAdibasi THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActLanServey is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActLanServey  = @ActLanServey THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActAwareness is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActAwareness  = @ActAwareness THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @ActVestedProp is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActVestedProp  = @ActVestedProp THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UnionID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UnionID  = @UnionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalKhasLandGov11 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11  = @TotalKhasLandGov11 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributedKhasLandGov12 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12  = @DistributedKhasLandGov12 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributableKhasLandGov13 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13  = @DistributableKhasLandGov13 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLandlessFamilyGov14 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14  = @TotalLandlessFamilyGov14 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyGotKhasLandGov15 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15  = @NoOfFamilyGotKhasLandGov15 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IllegalOccupiedKhasLandGov16 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16  = @IllegalOccupiedKhasLandGov16 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalKhasLandOrg21 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21  = @TotalKhasLandOrg21 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributedKhasLandOrg22 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22  = @DistributedKhasLandOrg22 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributableKhasLandOrg23 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23  = @DistributableKhasLandOrg23 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLandlessFamilyOrg24 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24  = @TotalLandlessFamilyOrg24 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyGotKhasLandOrg25 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25  = @NoOfFamilyGotKhasLandOrg25 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyEvictedKhasLandOrg26 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26  = @NoOfFamilyEvictedKhasLandOrg26 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfViolenceKhasLandOrg27 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27  = @NoOfViolenceKhasLandOrg27 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfLitigationKhasLandOrg28 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28  = @NoOfLitigationKhasLandOrg28 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeGathOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29  = @NoOfInitiativeGathOrg29 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeRallyOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29  = @NoOfInitiativeRallyOrg29 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeMemoOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29  = @NoOfInitiativeMemoOrg29 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeLegalOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29  = @NoOfInitiativeLegalOrg29 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeMeetOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29  = @NoOfInitiativeMeetOrg29 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeOthOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29  = @NoOfInitiativeOthOrg29 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLess20KhasWaterGov31 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31  = @TotalLess20KhasWaterGov31 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalMore20KhasWaterGov32 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32  = @TotalMore20KhasWaterGov32 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLeaseLess20KhasWaterGov33 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33  = @TotalLeaseLess20KhasWaterGov33 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLeaseMore20KhasWaterGov34 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34  = @TotalLeaseMore20KhasWaterGov34 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLess20KhasWaterOrg41 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41  = @TotalLess20KhasWaterOrg41 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalMore20KhasWaterOrg42 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42  = @TotalMore20KhasWaterOrg42 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLeaseLess20KhasWaterOrg43 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43  = @TotalLeaseLess20KhasWaterOrg43 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLeaseMore20KhasWaterOrg44 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44  = @TotalLeaseMore20KhasWaterOrg44 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyFishingOrg45 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45  = @NoOfFamilyFishingOrg45 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfRegFisherFolkCoOrg46 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46  = @NoOfRegFisherFolkCoOrg46 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFisherFolkCoOrg47 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47  = @NoOfFisherFolkCoOrg47 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfLitigationKhasWaterOrg48 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48  = @NoOfLitigationKhasWaterOrg48 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfMovKhasWaterOrg49 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49  = @NoOfMovKhasWaterOrg49 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfCaseEvictionKhasWaterOrg410 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410  = @NoOfCaseEvictionKhasWaterOrg410 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeGathOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411  = @NoOfInitiativeGathOrg411 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeRallyOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411  = @NoOfInitiativeRallyOrg411 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeMemoOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411  = @NoOfInitiativeMemoOrg411 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeLegalOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411  = @NoOfInitiativeLegalOrg411 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeMeetOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411  = @NoOfInitiativeMeetOrg411 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfInitiativeOthOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411  = @NoOfInitiativeOthOrg411 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalLand51 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLand51  = @TotalLand51 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalPrivateProp52 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52  = @TotalPrivateProp52 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalAgriLand53 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriLand53  = @TotalAgriLand53 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalNonAgriLand54 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54  = @TotalNonAgriLand54 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalForestLand55 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalForestLand55  = @TotalForestLand55 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalCommLan56 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalCommLan56  = @TotalCommLan56 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalAgriCommLastYear57 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57  = @TotalAgriCommLastYear57 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalAgriComm58 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriComm58  = @TotalAgriComm58 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyAgriComm59 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59  = @NoOfFamilyAgriComm59 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalCharLand510 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalCharLand510  = @TotalCharLand510 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NatAgriCommTobacco511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511  = @NatAgriCommTobacco511 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NatAgriCommRubber511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511  = @NatAgriCommRubber511 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NatAgriCommBricks511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511  = @NatAgriCommBricks511 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NatAgriCommIndustry511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511  = @NatAgriCommIndustry511 THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Remarks512 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.Remarks512  LIKE '%' + @Remarks512 + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_organizationdata AS
			(
				  SELECT 
			ALRD_ORGANIZATIONDATA.COMPID,
			ALRD_ORGANIZATIONDATA.CollectionMonth,
			ALRD_ORGANIZATIONDATA.CollCollectionYear,
			ALRD_ORGANIZATIONDATA.CollOrganizationID,
			ALRD_ORGANIZATIONDATA.ActKhaLand,
			ALRD_ORGANIZATIONDATA.ActKhaWater,
			ALRD_ORGANIZATIONDATA.ActAdibasi,
			ALRD_ORGANIZATIONDATA.ActLanServey,
			ALRD_ORGANIZATIONDATA.ActAwareness,
			ALRD_ORGANIZATIONDATA.ActVestedProp,
			ALRD_ORGANIZATIONDATA.DivisionID,
			ALRD_ORGANIZATIONDATA.DistrictID,
			ALRD_ORGANIZATIONDATA.UpazilaID,
			ALRD_ORGANIZATIONDATA.UnionID,
			ALRD_ORGANIZATIONDATA.TotalKhasLandGov11,
			ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12,
			ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13,
			ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14,
			ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15,
			ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16,
			ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21,
			ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22,
			ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23,
			ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24,
			ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25,
			ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26,
			ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27,
			ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29,
			ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31,
			ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32,
			ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33,
			ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34,
			ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41,
			ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42,
			ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43,
			ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44,
			ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45,
			ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46,
			ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47,
			ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48,
			ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49,
			ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411,
			ALRD_ORGANIZATIONDATA.TotalLand51,
			ALRD_ORGANIZATIONDATA.TotalPrivateProp52,
			ALRD_ORGANIZATIONDATA.TotalAgriLand53,
			ALRD_ORGANIZATIONDATA.TotalNonAgriLand54,
			ALRD_ORGANIZATIONDATA.TotalForestLand55,
			ALRD_ORGANIZATIONDATA.TotalCommLan56,
			ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57,
			ALRD_ORGANIZATIONDATA.TotalAgriComm58,
			ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59,
			ALRD_ORGANIZATIONDATA.TotalCharLand510,
			ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511,
			ALRD_ORGANIZATIONDATA.NatAgriCommRubber511,
			ALRD_ORGANIZATIONDATA.NatAgriCommBricks511,
			ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511,
			ALRD_ORGANIZATIONDATA.Remarks512,
			ALRD_ORGANIZATIONDATA.CreatedBy,
			ALRD_ORGANIZATIONDATA.CreatedOn,
			ALRD_ORGANIZATIONDATA.UpdatedBy,
			ALRD_ORGANIZATIONDATA.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_ORGANIZATIONDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_ORGANIZATIONDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_ORGANIZATIONDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_ORGANIZATIONDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_ORGANIZATIONDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_ORGANIZATIONDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='CollOrganizationID ASC' THEN ALRD_ORGANIZATIONDATA.CollOrganizationID END ASC,
						CASE WHEN @SortExpression ='CollOrganizationID DESC' THEN ALRD_ORGANIZATIONDATA.CollOrganizationID END DESC,
						CASE WHEN @SortExpression ='ActKhaLand ASC' THEN ALRD_ORGANIZATIONDATA.ActKhaLand END ASC,
						CASE WHEN @SortExpression ='ActKhaLand DESC' THEN ALRD_ORGANIZATIONDATA.ActKhaLand END DESC,
						CASE WHEN @SortExpression ='ActKhaWater ASC' THEN ALRD_ORGANIZATIONDATA.ActKhaWater END ASC,
						CASE WHEN @SortExpression ='ActKhaWater DESC' THEN ALRD_ORGANIZATIONDATA.ActKhaWater END DESC,
						CASE WHEN @SortExpression ='ActAdibasi ASC' THEN ALRD_ORGANIZATIONDATA.ActAdibasi END ASC,
						CASE WHEN @SortExpression ='ActAdibasi DESC' THEN ALRD_ORGANIZATIONDATA.ActAdibasi END DESC,
						CASE WHEN @SortExpression ='ActLanServey ASC' THEN ALRD_ORGANIZATIONDATA.ActLanServey END ASC,
						CASE WHEN @SortExpression ='ActLanServey DESC' THEN ALRD_ORGANIZATIONDATA.ActLanServey END DESC,
						CASE WHEN @SortExpression ='ActAwareness ASC' THEN ALRD_ORGANIZATIONDATA.ActAwareness END ASC,
						CASE WHEN @SortExpression ='ActAwareness DESC' THEN ALRD_ORGANIZATIONDATA.ActAwareness END DESC,
						CASE WHEN @SortExpression ='ActVestedProp ASC' THEN ALRD_ORGANIZATIONDATA.ActVestedProp END ASC,
						CASE WHEN @SortExpression ='ActVestedProp DESC' THEN ALRD_ORGANIZATIONDATA.ActVestedProp END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_ORGANIZATIONDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_ORGANIZATIONDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_ORGANIZATIONDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_ORGANIZATIONDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_ORGANIZATIONDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_ORGANIZATIONDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='UnionID ASC' THEN ALRD_ORGANIZATIONDATA.UnionID END ASC,
						CASE WHEN @SortExpression ='UnionID DESC' THEN ALRD_ORGANIZATIONDATA.UnionID END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandGov11 ASC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11 END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandGov11 DESC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11 END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandGov12 ASC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12 END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandGov12 DESC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12 END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandGov13 ASC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13 END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandGov13 DESC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13 END DESC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyGov14 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14 END ASC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyGov14 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandGov15 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandGov15 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15 END DESC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandGov16 ASC' THEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16 END ASC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandGov16 DESC' THEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16 END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandOrg21 ASC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21 END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandOrg21 DESC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21 END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandOrg22 ASC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22 END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandOrg22 DESC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22 END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandOrg23 ASC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23 END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandOrg23 DESC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23 END DESC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyOrg24 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24 END ASC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyOrg24 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandOrg25 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandOrg25 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyEvictedKhasLandOrg26 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyEvictedKhasLandOrg26 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26 END DESC,
						CASE WHEN @SortExpression ='NoOfViolenceKhasLandOrg27 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27 END ASC,
						CASE WHEN @SortExpression ='NoOfViolenceKhasLandOrg27 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27 END DESC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasLandOrg28 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28 END ASC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasLandOrg28 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29 END DESC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterGov31 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31 END ASC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterGov31 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31 END DESC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterGov32 ASC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32 END ASC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterGov32 DESC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterGov33 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterGov33 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterGov34 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterGov34 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34 END DESC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterOrg41 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41 END ASC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterOrg41 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41 END DESC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterOrg42 ASC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42 END ASC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterOrg42 DESC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterOrg43 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterOrg43 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterOrg44 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterOrg44 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyFishingOrg45 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyFishingOrg45 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45 END DESC,
						CASE WHEN @SortExpression ='NoOfRegFisherFolkCoOrg46 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46 END ASC,
						CASE WHEN @SortExpression ='NoOfRegFisherFolkCoOrg46 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46 END DESC,
						CASE WHEN @SortExpression ='NoOfFisherFolkCoOrg47 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47 END ASC,
						CASE WHEN @SortExpression ='NoOfFisherFolkCoOrg47 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47 END DESC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasWaterOrg48 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48 END ASC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasWaterOrg48 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48 END DESC,
						CASE WHEN @SortExpression ='NoOfMovKhasWaterOrg49 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49 END ASC,
						CASE WHEN @SortExpression ='NoOfMovKhasWaterOrg49 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49 END DESC,
						CASE WHEN @SortExpression ='NoOfCaseEvictionKhasWaterOrg410 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410 END ASC,
						CASE WHEN @SortExpression ='NoOfCaseEvictionKhasWaterOrg410 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411 END DESC,
						CASE WHEN @SortExpression ='TotalLand51 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLand51 END ASC,
						CASE WHEN @SortExpression ='TotalLand51 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLand51 END DESC,
						CASE WHEN @SortExpression ='TotalPrivateProp52 ASC' THEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52 END ASC,
						CASE WHEN @SortExpression ='TotalPrivateProp52 DESC' THEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52 END DESC,
						CASE WHEN @SortExpression ='TotalAgriLand53 ASC' THEN ALRD_ORGANIZATIONDATA.TotalAgriLand53 END ASC,
						CASE WHEN @SortExpression ='TotalAgriLand53 DESC' THEN ALRD_ORGANIZATIONDATA.TotalAgriLand53 END DESC,
						CASE WHEN @SortExpression ='TotalNonAgriLand54 ASC' THEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54 END ASC,
						CASE WHEN @SortExpression ='TotalNonAgriLand54 DESC' THEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54 END DESC,
						CASE WHEN @SortExpression ='TotalForestLand55 ASC' THEN ALRD_ORGANIZATIONDATA.TotalForestLand55 END ASC,
						CASE WHEN @SortExpression ='TotalForestLand55 DESC' THEN ALRD_ORGANIZATIONDATA.TotalForestLand55 END DESC,
						CASE WHEN @SortExpression ='TotalCommLan56 ASC' THEN ALRD_ORGANIZATIONDATA.TotalCommLan56 END ASC,
						CASE WHEN @SortExpression ='TotalCommLan56 DESC' THEN ALRD_ORGANIZATIONDATA.TotalCommLan56 END DESC,
						CASE WHEN @SortExpression ='TotalAgriCommLastYear57 ASC' THEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57 END ASC,
						CASE WHEN @SortExpression ='TotalAgriCommLastYear57 DESC' THEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57 END DESC,
						CASE WHEN @SortExpression ='TotalAgriComm58 ASC' THEN ALRD_ORGANIZATIONDATA.TotalAgriComm58 END ASC,
						CASE WHEN @SortExpression ='TotalAgriComm58 DESC' THEN ALRD_ORGANIZATIONDATA.TotalAgriComm58 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyAgriComm59 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyAgriComm59 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59 END DESC,
						CASE WHEN @SortExpression ='TotalCharLand510 ASC' THEN ALRD_ORGANIZATIONDATA.TotalCharLand510 END ASC,
						CASE WHEN @SortExpression ='TotalCharLand510 DESC' THEN ALRD_ORGANIZATIONDATA.TotalCharLand510 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommTobacco511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommTobacco511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommRubber511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommRubber511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommBricks511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommBricks511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommIndustry511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommIndustry511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511 END DESC,
						CASE WHEN @SortExpression ='Remarks512 ASC' THEN ALRD_ORGANIZATIONDATA.Remarks512 END ASC,
						CASE WHEN @SortExpression ='Remarks512 DESC' THEN ALRD_ORGANIZATIONDATA.Remarks512 END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_ORGANIZATIONDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_ORGANIZATIONDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_ORGANIZATIONDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_ORGANIZATIONDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_ORGANIZATIONDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_ORGANIZATIONDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_ORGANIZATIONDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_ORGANIZATIONDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_ORGANIZATIONDATA 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollOrganizationID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollOrganizationID  = @CollOrganizationID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActKhaLand is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActKhaLand  = @ActKhaLand THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActKhaWater is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActKhaWater  = @ActKhaWater THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActAdibasi is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActAdibasi  = @ActAdibasi THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActLanServey is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActLanServey  = @ActLanServey THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActAwareness is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActAwareness  = @ActAwareness THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActVestedProp is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActVestedProp  = @ActVestedProp THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UnionID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UnionID  = @UnionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandGov11 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11  = @TotalKhasLandGov11 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandGov12 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12  = @DistributedKhasLandGov12 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandGov13 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13  = @DistributableKhasLandGov13 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLandlessFamilyGov14 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14  = @TotalLandlessFamilyGov14 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandGov15 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15  = @NoOfFamilyGotKhasLandGov15 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IllegalOccupiedKhasLandGov16 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16  = @IllegalOccupiedKhasLandGov16 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandOrg21 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21  = @TotalKhasLandOrg21 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandOrg22 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22  = @DistributedKhasLandOrg22 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandOrg23 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23  = @DistributableKhasLandOrg23 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLandlessFamilyOrg24 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24  = @TotalLandlessFamilyOrg24 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandOrg25 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25  = @NoOfFamilyGotKhasLandOrg25 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyEvictedKhasLandOrg26 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26  = @NoOfFamilyEvictedKhasLandOrg26 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfViolenceKhasLandOrg27 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27  = @NoOfViolenceKhasLandOrg27 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfLitigationKhasLandOrg28 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28  = @NoOfLitigationKhasLandOrg28 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeGathOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29  = @NoOfInitiativeGathOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeRallyOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29  = @NoOfInitiativeRallyOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMemoOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29  = @NoOfInitiativeMemoOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeLegalOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29  = @NoOfInitiativeLegalOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMeetOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29  = @NoOfInitiativeMeetOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeOthOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29  = @NoOfInitiativeOthOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLess20KhasWaterGov31 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31  = @TotalLess20KhasWaterGov31 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalMore20KhasWaterGov32 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32  = @TotalMore20KhasWaterGov32 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseLess20KhasWaterGov33 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33  = @TotalLeaseLess20KhasWaterGov33 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseMore20KhasWaterGov34 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34  = @TotalLeaseMore20KhasWaterGov34 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLess20KhasWaterOrg41 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41  = @TotalLess20KhasWaterOrg41 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalMore20KhasWaterOrg42 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42  = @TotalMore20KhasWaterOrg42 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseLess20KhasWaterOrg43 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43  = @TotalLeaseLess20KhasWaterOrg43 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseMore20KhasWaterOrg44 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44  = @TotalLeaseMore20KhasWaterOrg44 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyFishingOrg45 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45  = @NoOfFamilyFishingOrg45 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfRegFisherFolkCoOrg46 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46  = @NoOfRegFisherFolkCoOrg46 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFisherFolkCoOrg47 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47  = @NoOfFisherFolkCoOrg47 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfLitigationKhasWaterOrg48 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48  = @NoOfLitigationKhasWaterOrg48 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfMovKhasWaterOrg49 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49  = @NoOfMovKhasWaterOrg49 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfCaseEvictionKhasWaterOrg410 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410  = @NoOfCaseEvictionKhasWaterOrg410 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeGathOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411  = @NoOfInitiativeGathOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeRallyOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411  = @NoOfInitiativeRallyOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMemoOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411  = @NoOfInitiativeMemoOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeLegalOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411  = @NoOfInitiativeLegalOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMeetOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411  = @NoOfInitiativeMeetOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeOthOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411  = @NoOfInitiativeOthOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLand51 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLand51  = @TotalLand51 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalPrivateProp52 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52  = @TotalPrivateProp52 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalAgriLand53 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriLand53  = @TotalAgriLand53 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalNonAgriLand54 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54  = @TotalNonAgriLand54 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalForestLand55 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalForestLand55  = @TotalForestLand55 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCommLan56 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalCommLan56  = @TotalCommLan56 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalAgriCommLastYear57 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57  = @TotalAgriCommLastYear57 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalAgriComm58 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriComm58  = @TotalAgriComm58 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyAgriComm59 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59  = @NoOfFamilyAgriComm59 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCharLand510 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalCharLand510  = @TotalCharLand510 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommTobacco511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511  = @NatAgriCommTobacco511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommRubber511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511  = @NatAgriCommRubber511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommBricks511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511  = @NatAgriCommBricks511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommIndustry511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511  = @NatAgriCommIndustry511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks512 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.Remarks512  LIKE '%' + @Remarks512 + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_organizationdata
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationdata_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_organizationdata_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@CollOrganizationID bigint  = NULL,
		@ActKhaLand bit  = NULL,
		@ActKhaWater bit  = NULL,
		@ActAdibasi bit  = NULL,
		@ActLanServey bit  = NULL,
		@ActAwareness bit  = NULL,
		@ActVestedProp bit  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@UnionID bigint  = NULL,
		@TotalKhasLandGov11 decimal (18, 2) = NULL,
		@DistributedKhasLandGov12 decimal (18, 2) = NULL,
		@DistributableKhasLandGov13 decimal (18, 2) = NULL,
		@TotalLandlessFamilyGov14 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandGov15 decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandGov16 decimal (18, 2) = NULL,
		@TotalKhasLandOrg21 decimal (18, 2) = NULL,
		@DistributedKhasLandOrg22 decimal (18, 2) = NULL,
		@DistributableKhasLandOrg23 decimal (18, 2) = NULL,
		@TotalLandlessFamilyOrg24 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandOrg25 decimal (18, 2) = NULL,
		@NoOfFamilyEvictedKhasLandOrg26 decimal (18, 2) = NULL,
		@NoOfViolenceKhasLandOrg27 decimal (18, 2) = NULL,
		@NoOfLitigationKhasLandOrg28 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg29 bigint = NULL,
		@NoOfInitiativeRallyOrg29 bigint = NULL,
		@NoOfInitiativeMemoOrg29 bigint = NULL,
		@NoOfInitiativeLegalOrg29 bigint = NULL,
		@NoOfInitiativeMeetOrg29 bigint = NULL,
		@NoOfInitiativeOthOrg29 bigint = NULL,
		@TotalLess20KhasWaterGov31 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterGov32 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterGov33 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterGov34 decimal (18, 2) = NULL,
		@TotalLess20KhasWaterOrg41 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterOrg42 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterOrg43 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterOrg44 decimal (18, 2) = NULL,
		@NoOfFamilyFishingOrg45 decimal (18, 2) = NULL,
		@NoOfRegFisherFolkCoOrg46 decimal (18, 2) = NULL,
		@NoOfFisherFolkCoOrg47 decimal (18, 2) = NULL,
		@NoOfLitigationKhasWaterOrg48 decimal (18, 2) = NULL,
		@NoOfMovKhasWaterOrg49 decimal (18, 2) = NULL,
		@NoOfCaseEvictionKhasWaterOrg410 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeRallyOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMemoOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeLegalOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMeetOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeOthOrg411 decimal (18, 2) = NULL,
		@TotalLand51 decimal (18, 2) = NULL,
		@TotalPrivateProp52 decimal (18, 2) = NULL,
		@TotalAgriLand53 decimal (18, 2) = NULL,
		@TotalNonAgriLand54 decimal (18, 2) = NULL,
		@TotalForestLand55 decimal (18, 2) = NULL,
		@TotalCommLan56 decimal (18, 2) = NULL,
		@TotalAgriCommLastYear57 decimal (18, 2) = NULL,
		@TotalAgriComm58 decimal (18, 2) = NULL,
		@NoOfFamilyAgriComm59 decimal (18, 2) = NULL,
		@TotalCharLand510 decimal (18, 2) = NULL,
		@NatAgriCommTobacco511 decimal (18, 2) = NULL,
		@NatAgriCommRubber511 decimal (18, 2) = NULL,
		@NatAgriCommBricks511 decimal (18, 2) = NULL,
		@NatAgriCommIndustry511 decimal (18, 2) = NULL,
		@Remarks512 nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_ORGANIZATIONDATA
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  Table [dbo].[ALRD_GOVERNMENTWATERBODYDATA]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[CollectionMonth] [bigint] NOT NULL,
	[CollCollectionYear] [bigint] NOT NULL,
	[DivisionID] [bigint] NOT NULL,
	[DistrictID] [bigint] NULL,
	[UpazilaID] [bigint] NULL,
	[NoOfWaterBody20Under] [decimal](18, 2) NULL,
	[NoOfWaterBody20Over] [decimal](18, 2) NULL,
	[AreaOfWaterbody20Under] [decimal](18, 2) NULL,
	[AreaOfWaterbody20Over] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](300) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_GOVERNMENTWATERBODYDATA] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentwaterbodydata_Update]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentwaterbodydata_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@NoOfWaterBody20Under decimal (18, 2) = NULL,
		@NoOfWaterBody20Over decimal (18, 2) = NULL,
		@AreaOfWaterbody20Under decimal (18, 2) = NULL,
		@AreaOfWaterbody20Over decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_GOVERNMENTWATERBODYDATA
		SET
			CollectionMonth = @CollectionMonth,
			CollCollectionYear = @CollCollectionYear,
			DivisionID = @DivisionID,
			DistrictID = @DistrictID,
			UpazilaID = @UpazilaID,
			NoOfWaterBody20Under = @NoOfWaterBody20Under,
			NoOfWaterBody20Over = @NoOfWaterBody20Over,
			AreaOfWaterbody20Under = @AreaOfWaterbody20Under,
			AreaOfWaterbody20Over = @AreaOfWaterbody20Over,
			Remarks = @Remarks,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentwaterbodydata_PertialUpdate]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentwaterbodydata_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@NoOfWaterBody20Under decimal (18, 2) = NULL,
		@NoOfWaterBody20Over decimal (18, 2) = NULL,
		@AreaOfWaterbody20Under decimal (18, 2) = NULL,
		@AreaOfWaterbody20Over decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_GOVERNMENTWATERBODYDATA
		SET
			CollectionMonth = Case when (@CollectionMonth is not null) then @CollectionMonth else CollectionMonth end,
			CollCollectionYear = Case when (@CollCollectionYear is not null) then @CollCollectionYear else CollCollectionYear end,
			DivisionID = Case when (@DivisionID is not null) then @DivisionID else DivisionID end,
			DistrictID = Case when (@DistrictID =0 ) then NULL  else Case when (@DistrictID is not null) then @DistrictID else DistrictID end end,
			UpazilaID = Case when (@UpazilaID =0 ) then NULL  else Case when (@UpazilaID is not null) then @UpazilaID else UpazilaID end end,
			NoOfWaterBody20Under = Case when (@NoOfWaterBody20Under is not null) then @NoOfWaterBody20Under else NoOfWaterBody20Under end,
			NoOfWaterBody20Over = Case when (@NoOfWaterBody20Over is not null) then @NoOfWaterBody20Over else NoOfWaterBody20Over end,
			AreaOfWaterbody20Under = Case when (@AreaOfWaterbody20Under is not null) then @AreaOfWaterbody20Under else AreaOfWaterbody20Under end,
			AreaOfWaterbody20Over = Case when (@AreaOfWaterbody20Over is not null) then @AreaOfWaterbody20Over else AreaOfWaterbody20Over end,
			Remarks = Case when (@Remarks is not null) then @Remarks else Remarks end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentwaterbodydata_Insert]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentwaterbodydata_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@NoOfWaterBody20Under decimal (18, 2) = NULL,
		@NoOfWaterBody20Over decimal (18, 2) = NULL,
		@AreaOfWaterbody20Under decimal (18, 2) = NULL,
		@AreaOfWaterbody20Over decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_GOVERNMENTWATERBODYDATA (
			CollectionMonth,
			CollCollectionYear,
			DivisionID,
			DistrictID,
			UpazilaID,
			NoOfWaterBody20Under,
			NoOfWaterBody20Over,
			AreaOfWaterbody20Under,
			AreaOfWaterbody20Over,
			Remarks,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@CollectionMonth,
			@CollCollectionYear,
			@DivisionID,
			@DistrictID,
			@UpazilaID,
			@NoOfWaterBody20Under,
			@NoOfWaterBody20Over,
			@AreaOfWaterbody20Under,
			@AreaOfWaterbody20Over,
			@Remarks,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentwaterbodydata_GetAllByPages]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_governmentwaterbodydata_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@CollectionMonth bigint  = NULL,
	@CollCollectionYear bigint  = NULL,
	@DivisionID bigint  = NULL,
	@DistrictID bigint  = NULL,
	@UpazilaID bigint  = NULL,
	@NoOfWaterBody20Under decimal (18, 2) = NULL,
	@NoOfWaterBody20Over decimal (18, 2) = NULL,
	@AreaOfWaterbody20Under decimal (18, 2) = NULL,
	@AreaOfWaterbody20Over decimal (18, 2) = NULL,
	@Remarks nvarchar (300) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_governmentwaterbodydata
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfWaterBody20Under is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under  = @NoOfWaterBody20Under THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfWaterBody20Over is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over  = @NoOfWaterBody20Over THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AreaOfWaterbody20Under is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under  = @AreaOfWaterbody20Under THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @AreaOfWaterbody20Over is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over  = @AreaOfWaterbody20Over THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_governmentwaterbodydata AS
			(
				  SELECT 
			ALRD_GOVERNMENTWATERBODYDATA.COMPID,
			ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth,
			ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear,
			ALRD_GOVERNMENTWATERBODYDATA.DivisionID,
			ALRD_GOVERNMENTWATERBODYDATA.DistrictID,
			ALRD_GOVERNMENTWATERBODYDATA.UpazilaID,
			ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under,
			ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over,
			ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under,
			ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over,
			ALRD_GOVERNMENTWATERBODYDATA.Remarks,
			ALRD_GOVERNMENTWATERBODYDATA.CreatedBy,
			ALRD_GOVERNMENTWATERBODYDATA.CreatedOn,
			ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy,
			ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Under ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under END ASC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Under DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under END DESC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Over ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over END ASC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Over DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over END DESC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Under ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under END ASC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Under DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under END DESC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Over ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over END ASC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Over DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.Remarks END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_GOVERNMENTWATERBODYDATA 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfWaterBody20Under is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under  = @NoOfWaterBody20Under THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfWaterBody20Over is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over  = @NoOfWaterBody20Over THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AreaOfWaterbody20Under is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under  = @AreaOfWaterbody20Under THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AreaOfWaterbody20Over is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over  = @AreaOfWaterbody20Over THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_governmentwaterbodydata
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentwaterbodydata_Delete]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentwaterbodydata_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@NoOfWaterBody20Under decimal (18, 2) = NULL,
		@NoOfWaterBody20Over decimal (18, 2) = NULL,
		@AreaOfWaterbody20Under decimal (18, 2) = NULL,
		@AreaOfWaterbody20Over decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_GOVERNMENTWATERBODYDATA
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  Table [dbo].[ALRD_GOVERNMENTKHASLANDDATA]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[CollectionMonth] [bigint] NOT NULL,
	[CollCollectionYear] [bigint] NOT NULL,
	[DivisionID] [bigint] NOT NULL,
	[DistrictID] [bigint] NULL,
	[UpazilaID] [bigint] NULL,
	[TotalKhasLandAgri] [decimal](18, 2) NULL,
	[TotalKhasLandNonAgri] [decimal](18, 2) NULL,
	[DistributedKhasLandAgri] [decimal](18, 2) NULL,
	[DistributedKhasLandNonAgri] [decimal](18, 2) NULL,
	[DistributableKhasLandAgri] [decimal](18, 2) NULL,
	[DistributableKhasLandNonAgri] [decimal](18, 2) NULL,
	[NoOfFamilyGotKhasLandAgri] [decimal](18, 2) NULL,
	[NoOfFamilyGotKhasLandNonAgri] [decimal](18, 2) NULL,
	[IllegalOccupiedKhasLandAgri] [decimal](18, 2) NULL,
	[IllegalOccupiedKhasLandNonAgri] [decimal](18, 2) NULL,
	[KhasLandWithSuitCaseAgri] [decimal](18, 2) NULL,
	[KhasLandWithSuitCaseNonAgri] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](300) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_GOVERNMENTKHASLANDDATA] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentkhaslanddata_Update]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentkhaslanddata_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalKhasLandAgri decimal (18, 2) = NULL,
		@TotalKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributedKhasLandAgri decimal (18, 2) = NULL,
		@DistributedKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributableKhasLandAgri decimal (18, 2) = NULL,
		@DistributableKhasLandNonAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandNonAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandNonAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseNonAgri decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_GOVERNMENTKHASLANDDATA
		SET
			CollectionMonth = @CollectionMonth,
			CollCollectionYear = @CollCollectionYear,
			DivisionID = @DivisionID,
			DistrictID = @DistrictID,
			UpazilaID = @UpazilaID,
			TotalKhasLandAgri = @TotalKhasLandAgri,
			TotalKhasLandNonAgri = @TotalKhasLandNonAgri,
			DistributedKhasLandAgri = @DistributedKhasLandAgri,
			DistributedKhasLandNonAgri = @DistributedKhasLandNonAgri,
			DistributableKhasLandAgri = @DistributableKhasLandAgri,
			DistributableKhasLandNonAgri = @DistributableKhasLandNonAgri,
			NoOfFamilyGotKhasLandAgri = @NoOfFamilyGotKhasLandAgri,
			NoOfFamilyGotKhasLandNonAgri = @NoOfFamilyGotKhasLandNonAgri,
			IllegalOccupiedKhasLandAgri = @IllegalOccupiedKhasLandAgri,
			IllegalOccupiedKhasLandNonAgri = @IllegalOccupiedKhasLandNonAgri,
			KhasLandWithSuitCaseAgri = @KhasLandWithSuitCaseAgri,
			KhasLandWithSuitCaseNonAgri = @KhasLandWithSuitCaseNonAgri,
			Remarks = @Remarks,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentkhaslanddata_PertialUpdate]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentkhaslanddata_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalKhasLandAgri decimal (18, 2) = NULL,
		@TotalKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributedKhasLandAgri decimal (18, 2) = NULL,
		@DistributedKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributableKhasLandAgri decimal (18, 2) = NULL,
		@DistributableKhasLandNonAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandNonAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandNonAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseNonAgri decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_GOVERNMENTKHASLANDDATA
		SET
			CollectionMonth = Case when (@CollectionMonth is not null) then @CollectionMonth else CollectionMonth end,
			CollCollectionYear = Case when (@CollCollectionYear is not null) then @CollCollectionYear else CollCollectionYear end,
			DivisionID = Case when (@DivisionID is not null) then @DivisionID else DivisionID end,
			DistrictID = Case when (@DistrictID =0 ) then NULL  else Case when (@DistrictID is not null) then @DistrictID else DistrictID end end,
			UpazilaID = Case when (@UpazilaID =0 ) then NULL  else Case when (@UpazilaID is not null) then @UpazilaID else UpazilaID end end,
			TotalKhasLandAgri = Case when (@TotalKhasLandAgri is not null) then @TotalKhasLandAgri else TotalKhasLandAgri end,
			TotalKhasLandNonAgri = Case when (@TotalKhasLandNonAgri is not null) then @TotalKhasLandNonAgri else TotalKhasLandNonAgri end,
			DistributedKhasLandAgri = Case when (@DistributedKhasLandAgri is not null) then @DistributedKhasLandAgri else DistributedKhasLandAgri end,
			DistributedKhasLandNonAgri = Case when (@DistributedKhasLandNonAgri is not null) then @DistributedKhasLandNonAgri else DistributedKhasLandNonAgri end,
			DistributableKhasLandAgri = Case when (@DistributableKhasLandAgri is not null) then @DistributableKhasLandAgri else DistributableKhasLandAgri end,
			DistributableKhasLandNonAgri = Case when (@DistributableKhasLandNonAgri is not null) then @DistributableKhasLandNonAgri else DistributableKhasLandNonAgri end,
			NoOfFamilyGotKhasLandAgri = Case when (@NoOfFamilyGotKhasLandAgri is not null) then @NoOfFamilyGotKhasLandAgri else NoOfFamilyGotKhasLandAgri end,
			NoOfFamilyGotKhasLandNonAgri = Case when (@NoOfFamilyGotKhasLandNonAgri is not null) then @NoOfFamilyGotKhasLandNonAgri else NoOfFamilyGotKhasLandNonAgri end,
			IllegalOccupiedKhasLandAgri = Case when (@IllegalOccupiedKhasLandAgri is not null) then @IllegalOccupiedKhasLandAgri else IllegalOccupiedKhasLandAgri end,
			IllegalOccupiedKhasLandNonAgri = Case when (@IllegalOccupiedKhasLandNonAgri is not null) then @IllegalOccupiedKhasLandNonAgri else IllegalOccupiedKhasLandNonAgri end,
			KhasLandWithSuitCaseAgri = Case when (@KhasLandWithSuitCaseAgri is not null) then @KhasLandWithSuitCaseAgri else KhasLandWithSuitCaseAgri end,
			KhasLandWithSuitCaseNonAgri = Case when (@KhasLandWithSuitCaseNonAgri is not null) then @KhasLandWithSuitCaseNonAgri else KhasLandWithSuitCaseNonAgri end,
			Remarks = Case when (@Remarks is not null) then @Remarks else Remarks end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentkhaslanddata_Insert]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentkhaslanddata_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalKhasLandAgri decimal (18, 2) = NULL,
		@TotalKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributedKhasLandAgri decimal (18, 2) = NULL,
		@DistributedKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributableKhasLandAgri decimal (18, 2) = NULL,
		@DistributableKhasLandNonAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandNonAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandNonAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseNonAgri decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_GOVERNMENTKHASLANDDATA (
			CollectionMonth,
			CollCollectionYear,
			DivisionID,
			DistrictID,
			UpazilaID,
			TotalKhasLandAgri,
			TotalKhasLandNonAgri,
			DistributedKhasLandAgri,
			DistributedKhasLandNonAgri,
			DistributableKhasLandAgri,
			DistributableKhasLandNonAgri,
			NoOfFamilyGotKhasLandAgri,
			NoOfFamilyGotKhasLandNonAgri,
			IllegalOccupiedKhasLandAgri,
			IllegalOccupiedKhasLandNonAgri,
			KhasLandWithSuitCaseAgri,
			KhasLandWithSuitCaseNonAgri,
			Remarks,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@CollectionMonth,
			@CollCollectionYear,
			@DivisionID,
			@DistrictID,
			@UpazilaID,
			@TotalKhasLandAgri,
			@TotalKhasLandNonAgri,
			@DistributedKhasLandAgri,
			@DistributedKhasLandNonAgri,
			@DistributableKhasLandAgri,
			@DistributableKhasLandNonAgri,
			@NoOfFamilyGotKhasLandAgri,
			@NoOfFamilyGotKhasLandNonAgri,
			@IllegalOccupiedKhasLandAgri,
			@IllegalOccupiedKhasLandNonAgri,
			@KhasLandWithSuitCaseAgri,
			@KhasLandWithSuitCaseNonAgri,
			@Remarks,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentkhaslanddata_GetAllByPages]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_governmentkhaslanddata_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@CollectionMonth bigint  = NULL,
	@CollCollectionYear bigint  = NULL,
	@DivisionID bigint  = NULL,
	@DistrictID bigint  = NULL,
	@UpazilaID bigint  = NULL,
	@TotalKhasLandAgri decimal (18, 2) = NULL,
	@TotalKhasLandNonAgri decimal (18, 2) = NULL,
	@DistributedKhasLandAgri decimal (18, 2) = NULL,
	@DistributedKhasLandNonAgri decimal (18, 2) = NULL,
	@DistributableKhasLandAgri decimal (18, 2) = NULL,
	@DistributableKhasLandNonAgri decimal (18, 2) = NULL,
	@NoOfFamilyGotKhasLandAgri decimal (18, 2) = NULL,
	@NoOfFamilyGotKhasLandNonAgri decimal (18, 2) = NULL,
	@IllegalOccupiedKhasLandAgri decimal (18, 2) = NULL,
	@IllegalOccupiedKhasLandNonAgri decimal (18, 2) = NULL,
	@KhasLandWithSuitCaseAgri decimal (18, 2) = NULL,
	@KhasLandWithSuitCaseNonAgri decimal (18, 2) = NULL,
	@Remarks nvarchar (300) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_governmentkhaslanddata
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri  = @TotalKhasLandAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri  = @TotalKhasLandNonAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributedKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri  = @DistributedKhasLandAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributedKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri  = @DistributedKhasLandNonAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributableKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri  = @DistributableKhasLandAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistributableKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri  = @DistributableKhasLandNonAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyGotKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri  = @NoOfFamilyGotKhasLandAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfFamilyGotKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri  = @NoOfFamilyGotKhasLandNonAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IllegalOccupiedKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri  = @IllegalOccupiedKhasLandAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @IllegalOccupiedKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri  = @IllegalOccupiedKhasLandNonAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @KhasLandWithSuitCaseAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri  = @KhasLandWithSuitCaseAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @KhasLandWithSuitCaseNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri  = @KhasLandWithSuitCaseNonAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_governmentkhaslanddata AS
			(
				  SELECT 
			ALRD_GOVERNMENTKHASLANDDATA.COMPID,
			ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth,
			ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear,
			ALRD_GOVERNMENTKHASLANDDATA.DivisionID,
			ALRD_GOVERNMENTKHASLANDDATA.DistrictID,
			ALRD_GOVERNMENTKHASLANDDATA.UpazilaID,
			ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri,
			ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.Remarks,
			ALRD_GOVERNMENTKHASLANDDATA.CreatedBy,
			ALRD_GOVERNMENTKHASLANDDATA.CreatedOn,
			ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy,
			ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri END ASC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri END DESC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri END ASC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.Remarks END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_GOVERNMENTKHASLANDDATA 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri  = @TotalKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri  = @TotalKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri  = @DistributedKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri  = @DistributedKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri  = @DistributableKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri  = @DistributableKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri  = @NoOfFamilyGotKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri  = @NoOfFamilyGotKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IllegalOccupiedKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri  = @IllegalOccupiedKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IllegalOccupiedKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri  = @IllegalOccupiedKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @KhasLandWithSuitCaseAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri  = @KhasLandWithSuitCaseAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @KhasLandWithSuitCaseNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri  = @KhasLandWithSuitCaseNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_governmentkhaslanddata
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentkhaslanddata_Delete]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentkhaslanddata_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalKhasLandAgri decimal (18, 2) = NULL,
		@TotalKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributedKhasLandAgri decimal (18, 2) = NULL,
		@DistributedKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributableKhasLandAgri decimal (18, 2) = NULL,
		@DistributableKhasLandNonAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandNonAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandNonAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseNonAgri decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_GOVERNMENTKHASLANDDATA
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  Table [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[CollectionMonth] [bigint] NOT NULL,
	[CollCollectionYear] [bigint] NOT NULL,
	[DivisionID] [bigint] NOT NULL,
	[DistrictID] [bigint] NULL,
	[UpazilaID] [bigint] NULL,
	[TotalCurtailedAreaWoodlot] [decimal](18, 2) NULL,
	[TotalCurtailedAreaAgri] [decimal](18, 2) NULL,
	[TotalCurtailedAreaStrip] [decimal](18, 2) NULL,
	[NoOfBeneficiary] [decimal](18, 2) NULL,
	[MoneyDistributed] [decimal](18, 2) NULL,
	[Remarks] [nvarchar](300) NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_GOVERNMENTFORESTRYBODYDATA] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentforestrybodydata_Update]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentforestrybodydata_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalCurtailedAreaWoodlot decimal (18, 2) = NULL,
		@TotalCurtailedAreaAgri decimal (18, 2) = NULL,
		@TotalCurtailedAreaStrip decimal (18, 2) = NULL,
		@NoOfBeneficiary decimal (18, 2) = NULL,
		@MoneyDistributed decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_GOVERNMENTFORESTRYBODYDATA
		SET
			CollectionMonth = @CollectionMonth,
			CollCollectionYear = @CollCollectionYear,
			DivisionID = @DivisionID,
			DistrictID = @DistrictID,
			UpazilaID = @UpazilaID,
			TotalCurtailedAreaWoodlot = @TotalCurtailedAreaWoodlot,
			TotalCurtailedAreaAgri = @TotalCurtailedAreaAgri,
			TotalCurtailedAreaStrip = @TotalCurtailedAreaStrip,
			NoOfBeneficiary = @NoOfBeneficiary,
			MoneyDistributed = @MoneyDistributed,
			Remarks = @Remarks,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentforestrybodydata_PertialUpdate]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentforestrybodydata_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalCurtailedAreaWoodlot decimal (18, 2) = NULL,
		@TotalCurtailedAreaAgri decimal (18, 2) = NULL,
		@TotalCurtailedAreaStrip decimal (18, 2) = NULL,
		@NoOfBeneficiary decimal (18, 2) = NULL,
		@MoneyDistributed decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_GOVERNMENTFORESTRYBODYDATA
		SET
			CollectionMonth = Case when (@CollectionMonth is not null) then @CollectionMonth else CollectionMonth end,
			CollCollectionYear = Case when (@CollCollectionYear is not null) then @CollCollectionYear else CollCollectionYear end,
			DivisionID = Case when (@DivisionID is not null) then @DivisionID else DivisionID end,
			DistrictID = Case when (@DistrictID =0 ) then NULL  else Case when (@DistrictID is not null) then @DistrictID else DistrictID end end,
			UpazilaID = Case when (@UpazilaID =0 ) then NULL  else Case when (@UpazilaID is not null) then @UpazilaID else UpazilaID end end,
			TotalCurtailedAreaWoodlot = Case when (@TotalCurtailedAreaWoodlot is not null) then @TotalCurtailedAreaWoodlot else TotalCurtailedAreaWoodlot end,
			TotalCurtailedAreaAgri = Case when (@TotalCurtailedAreaAgri is not null) then @TotalCurtailedAreaAgri else TotalCurtailedAreaAgri end,
			TotalCurtailedAreaStrip = Case when (@TotalCurtailedAreaStrip is not null) then @TotalCurtailedAreaStrip else TotalCurtailedAreaStrip end,
			NoOfBeneficiary = Case when (@NoOfBeneficiary is not null) then @NoOfBeneficiary else NoOfBeneficiary end,
			MoneyDistributed = Case when (@MoneyDistributed is not null) then @MoneyDistributed else MoneyDistributed end,
			Remarks = Case when (@Remarks is not null) then @Remarks else Remarks end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentforestrybodydata_Insert]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentforestrybodydata_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalCurtailedAreaWoodlot decimal (18, 2) = NULL,
		@TotalCurtailedAreaAgri decimal (18, 2) = NULL,
		@TotalCurtailedAreaStrip decimal (18, 2) = NULL,
		@NoOfBeneficiary decimal (18, 2) = NULL,
		@MoneyDistributed decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_GOVERNMENTFORESTRYBODYDATA (
			CollectionMonth,
			CollCollectionYear,
			DivisionID,
			DistrictID,
			UpazilaID,
			TotalCurtailedAreaWoodlot,
			TotalCurtailedAreaAgri,
			TotalCurtailedAreaStrip,
			NoOfBeneficiary,
			MoneyDistributed,
			Remarks,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@CollectionMonth,
			@CollCollectionYear,
			@DivisionID,
			@DistrictID,
			@UpazilaID,
			@TotalCurtailedAreaWoodlot,
			@TotalCurtailedAreaAgri,
			@TotalCurtailedAreaStrip,
			@NoOfBeneficiary,
			@MoneyDistributed,
			@Remarks,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentforestrybodydata_GetAllByPages]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_governmentforestrybodydata_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@CollectionMonth bigint  = NULL,
	@CollCollectionYear bigint  = NULL,
	@DivisionID bigint  = NULL,
	@DistrictID bigint  = NULL,
	@UpazilaID bigint  = NULL,
	@TotalCurtailedAreaWoodlot decimal (18, 2) = NULL,
	@TotalCurtailedAreaAgri decimal (18, 2) = NULL,
	@TotalCurtailedAreaStrip decimal (18, 2) = NULL,
	@NoOfBeneficiary decimal (18, 2) = NULL,
	@MoneyDistributed decimal (18, 2) = NULL,
	@Remarks nvarchar (300) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_governmentforestrybodydata
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalCurtailedAreaWoodlot is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot  = @TotalCurtailedAreaWoodlot THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalCurtailedAreaAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri  = @TotalCurtailedAreaAgri THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @TotalCurtailedAreaStrip is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip  = @TotalCurtailedAreaStrip THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @NoOfBeneficiary is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary  = @NoOfBeneficiary THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @MoneyDistributed is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed  = @MoneyDistributed THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_governmentforestrybodydata AS
			(
				  SELECT 
			ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear,
			ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot,
			ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri,
			ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip,
			ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary,
			ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed,
			ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn,
			ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy,
			ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaWoodlot ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot END ASC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaWoodlot DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot END DESC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaAgri ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri END ASC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaAgri DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri END DESC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaStrip ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip END ASC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaStrip DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip END DESC,
						CASE WHEN @SortExpression ='NoOfBeneficiary ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary END ASC,
						CASE WHEN @SortExpression ='NoOfBeneficiary DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary END DESC,
						CASE WHEN @SortExpression ='MoneyDistributed ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed END ASC,
						CASE WHEN @SortExpression ='MoneyDistributed DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_GOVERNMENTFORESTRYBODYDATA 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCurtailedAreaWoodlot is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot  = @TotalCurtailedAreaWoodlot THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCurtailedAreaAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri  = @TotalCurtailedAreaAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCurtailedAreaStrip is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip  = @TotalCurtailedAreaStrip THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfBeneficiary is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary  = @NoOfBeneficiary THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MoneyDistributed is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed  = @MoneyDistributed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_governmentforestrybodydata
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentforestrybodydata_Delete]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_governmentforestrybodydata_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalCurtailedAreaWoodlot decimal (18, 2) = NULL,
		@TotalCurtailedAreaAgri decimal (18, 2) = NULL,
		@TotalCurtailedAreaStrip decimal (18, 2) = NULL,
		@NoOfBeneficiary decimal (18, 2) = NULL,
		@MoneyDistributed decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_GOVERNMENTFORESTRYBODYDATA
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_divisioninfo_Update]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_divisioninfo_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_DIVISIONINFO
		SET
			DESCRIPT = @DESCRIPT,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_divisioninfo_PertialUpdate]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_divisioninfo_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_DIVISIONINFO
		SET
			DESCRIPT = Case when (@DESCRIPT is not null) then @DESCRIPT else DESCRIPT end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_divisioninfo_Insert]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_divisioninfo_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_DIVISIONINFO (
			DESCRIPT,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@DESCRIPT,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_divisioninfo_GetAllByPages]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_divisioninfo_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@DESCRIPT nvarchar (150) = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_divisioninfo
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_DIVISIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_DIVISIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_DIVISIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_DIVISIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_DIVISIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_DIVISIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_divisioninfo AS
			(
				  SELECT 
			ALRD_DIVISIONINFO.COMPID,
			ALRD_DIVISIONINFO.DESCRIPT,
			ALRD_DIVISIONINFO.CreatedBy,
			ALRD_DIVISIONINFO.CreatedOn,
			ALRD_DIVISIONINFO.UpdatedBy,
			ALRD_DIVISIONINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_DIVISIONINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_DIVISIONINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_DIVISIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_DIVISIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_DIVISIONINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_DIVISIONINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_DIVISIONINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_DIVISIONINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_DIVISIONINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_DIVISIONINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_DIVISIONINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_DIVISIONINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_DIVISIONINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_DIVISIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_DIVISIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_DIVISIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_DIVISIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_DIVISIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_DIVISIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_divisioninfo
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_divisioninfo_GetAll]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_divisioninfo_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_DIVISIONINFO.COMPID,
			ALRD_DIVISIONINFO.DESCRIPT,
			ALRD_DIVISIONINFO.CreatedBy,
			ALRD_DIVISIONINFO.CreatedOn,
			ALRD_DIVISIONINFO.UpdatedBy,
			ALRD_DIVISIONINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_DIVISIONINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_DIVISIONINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_DIVISIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_DIVISIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_DIVISIONINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_DIVISIONINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_DIVISIONINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_DIVISIONINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_DIVISIONINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_DIVISIONINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_DIVISIONINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_DIVISIONINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_DIVISIONINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_DIVISIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_DIVISIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_DIVISIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_DIVISIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_DIVISIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_DIVISIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_divisioninfo_Delete]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_divisioninfo_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_DIVISIONINFO
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_districtinfo_Update]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_districtinfo_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DivisionID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_DISTRICTINFO
		SET
			DESCRIPT = @DESCRIPT,
			DivisionID = @DivisionID,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_districtinfo_PertialUpdate]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_districtinfo_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DivisionID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_DISTRICTINFO
		SET
			DESCRIPT = Case when (@DESCRIPT is not null) then @DESCRIPT else DESCRIPT end,
			DivisionID = Case when (@DivisionID is not null) then @DivisionID else DivisionID end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_districtinfo_Insert]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_districtinfo_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DivisionID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_DISTRICTINFO (
			DESCRIPT,
			DivisionID,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@DESCRIPT,
			@DivisionID,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_districtinfo_GetAllByPages]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_districtinfo_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@DESCRIPT nvarchar (150) = NULL,
	@DivisionID bigint  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_districtinfo
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_DISTRICTINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_DISTRICTINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_DISTRICTINFO.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_DISTRICTINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_DISTRICTINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_DISTRICTINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_DISTRICTINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_districtinfo AS
			(
				  SELECT 
			ALRD_DISTRICTINFO.COMPID,
			ALRD_DISTRICTINFO.DESCRIPT,
			ALRD_DISTRICTINFO.DivisionID,
			ALRD_DISTRICTINFO.CreatedBy,
			ALRD_DISTRICTINFO.CreatedOn,
			ALRD_DISTRICTINFO.UpdatedBy,
			ALRD_DISTRICTINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_DISTRICTINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_DISTRICTINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_DISTRICTINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_DISTRICTINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_DISTRICTINFO.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_DISTRICTINFO.DivisionID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_DISTRICTINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_DISTRICTINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_DISTRICTINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_DISTRICTINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_DISTRICTINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_DISTRICTINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_DISTRICTINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_DISTRICTINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_DISTRICTINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_DISTRICTINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_DISTRICTINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_DISTRICTINFO.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_DISTRICTINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_DISTRICTINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_DISTRICTINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_DISTRICTINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_districtinfo
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_districtinfo_GetAll]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_districtinfo_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DivisionID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_DISTRICTINFO.COMPID,
			ALRD_DISTRICTINFO.DESCRIPT,
			ALRD_DISTRICTINFO.DivisionID,
			ALRD_DISTRICTINFO.CreatedBy,
			ALRD_DISTRICTINFO.CreatedOn,
			ALRD_DISTRICTINFO.UpdatedBy,
			ALRD_DISTRICTINFO.UpdatedOn,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_DISTRICTINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_DISTRICTINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_DISTRICTINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_DISTRICTINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_DISTRICTINFO.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_DISTRICTINFO.DivisionID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_DISTRICTINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_DISTRICTINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_DISTRICTINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_DISTRICTINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_DISTRICTINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_DISTRICTINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_DISTRICTINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_DISTRICTINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_DISTRICTINFO 
		INNER JOIN ALRD_DIVISIONINFO on ALRD_DIVISIONINFO.COMPID = ALRD_DISTRICTINFO.DivisionID
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_DISTRICTINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_DISTRICTINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_DISTRICTINFO.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_DISTRICTINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_DISTRICTINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_DISTRICTINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_DISTRICTINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_districtinfo_Delete]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_districtinfo_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DivisionID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_DISTRICTINFO
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[RPT_DivisionWiseDistributedKashLand]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[RPT_DivisionWiseDistributedKashLand] 
		@FromYear bigint  = NULL,
		@FromMonth bigint  = NULL,
		@ToYear bigint  = NULL,
		@ToMonth bigint  = NULL

	AS
	BEGIN
		SELECT 
			
			ALRD_GOVERNMENTKHASLANDDATA.DivisionID,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName, 
			CONVERT(BIGINT,COUNT(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.UpazilaID,0))) as NoOfUpazila,
			CONVERT(BIGINT,(SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri,0)) + SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri,0)))/ COUNT(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.UpazilaID,1))) as FamilyPerUpazila,
			CONVERT(DECIMAL(18,4),SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri,0)) + SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri,0))) as TotalDistributableAgriKashland,
			CONVERT(BIGINT,SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri,0)) + SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri,0))) as DistributedToNumberOfFamily,
			CONVERT(DECIMAL(18,4),SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri,0)) + SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri,0))) as DistributedKashland,
			CONVERT(DECIMAL(18,4),(SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri,0)) + SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri,0)))) - (SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri,0)) + SUM(ISNULL(ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri,0))) as AvailableDistributableKashland,
			'' as Remarks

			
		FROM ALRD_GOVERNMENTKHASLANDDATA
		INNER JOIN ALRD_DIVISIONINFO on ALRD_DIVISIONINFO.COMPID = ALRD_GOVERNMENTKHASLANDDATA.DivisionID
		WHERE
		CAST( CAST(ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear AS VARCHAR(4)) +  RIGHT('0' + CAST(ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth AS VARCHAR(2)), 2) + RIGHT('0' + CAST(1 AS VARCHAR(2)), 2) AS DATETIME)
		>=
		CAST( CAST(@FromYear AS VARCHAR(4)) +  RIGHT('0' + CAST(@FromMonth AS VARCHAR(2)), 2) + RIGHT('0' + CAST(1 AS VARCHAR(2)), 2) AS DATETIME)
		AND
		CAST( CAST(ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear AS VARCHAR(4)) +  RIGHT('0' + CAST(ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth AS VARCHAR(2)), 2) + RIGHT('0' + CAST(1 AS VARCHAR(2)), 2) AS DATETIME)
		<=
		CAST( CAST(@ToYear AS VARCHAR(4)) +  RIGHT('0' + CAST(@ToMonth AS VARCHAR(2)), 2) + RIGHT('0' + CAST(30 AS VARCHAR(2)), 2) AS DATETIME)

		GROUP BY ALRD_GOVERNMENTKHASLANDDATA.DivisionID, ALRD_DIVISIONINFO.DESCRIPT	
	END
GO
/****** Object:  Table [dbo].[ALRD_USERINFO]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_USERINFO](
	[COMPID] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginID] [bigint] NOT NULL,
	[UserName] [nvarchar](150) NOT NULL,
	[UserLevel] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_USERINFO] PRIMARY KEY CLUSTERED 
(
	[COMPID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ALRD_USERINFO] ON
INSERT [dbo].[ALRD_USERINFO] ([COMPID], [LoginID], [UserName], [UserLevel], [CreatedBy], [CreatedOn], [UpdatedBy], [UpdatedOn]) VALUES (1, 1, N'Admin', 5, 1, CAST(0x0000A13900000000 AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[ALRD_USERINFO] OFF
/****** Object:  StoredProcedure [dbo].[alrd_userinfo_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_userinfo_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@LoginID bigint  = NULL,
		@UserName nvarchar (150) = NULL,
		@UserLevel bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_USERINFO
		SET
			LoginID = @LoginID,
			UserName = @UserName,
			UserLevel = @UserLevel,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_userinfo_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_userinfo_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@LoginID bigint  = NULL,
		@UserName nvarchar (150) = NULL,
		@UserLevel bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_USERINFO
		SET
			LoginID = Case when (@LoginID is not null) then @LoginID else LoginID end,
			UserName = Case when (@UserName is not null) then @UserName else UserName end,
			UserLevel = Case when (@UserLevel is not null) then @UserLevel else UserLevel end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_userinfo_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_userinfo_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@LoginID bigint  = NULL,
		@UserName nvarchar (150) = NULL,
		@UserLevel bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_USERINFO (
			LoginID,
			UserName,
			UserLevel,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@LoginID,
			@UserName,
			@UserLevel,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_userinfo_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_userinfo_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@LoginID bigint  = NULL,
	@UserName nvarchar (150) = NULL,
	@UserLevel bigint  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_userinfo
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_USERINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @LoginID is NULL THEN 1 WHEN ALRD_USERINFO.LoginID  = @LoginID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserName is NULL THEN 1 WHEN ALRD_USERINFO.UserName  LIKE '%' + @UserName + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UserLevel is NULL THEN 1 WHEN ALRD_USERINFO.UserLevel  = @UserLevel THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_USERINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_USERINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_USERINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_USERINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_userinfo AS
			(
				  SELECT 
			ALRD_USERINFO.COMPID,
			ALRD_USERINFO.LoginID,
			ALRD_USERINFO.UserName,
			ALRD_USERINFO.UserLevel,
			ALRD_USERINFO.CreatedBy,
			ALRD_USERINFO.CreatedOn,
			ALRD_USERINFO.UpdatedBy,
			ALRD_USERINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_USERINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_USERINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='LoginID ASC' THEN ALRD_USERINFO.LoginID END ASC,
						CASE WHEN @SortExpression ='LoginID DESC' THEN ALRD_USERINFO.LoginID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN ALRD_USERINFO.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN ALRD_USERINFO.UserName END DESC,
						CASE WHEN @SortExpression ='UserLevel ASC' THEN ALRD_USERINFO.UserLevel END ASC,
						CASE WHEN @SortExpression ='UserLevel DESC' THEN ALRD_USERINFO.UserLevel END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_USERINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_USERINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_USERINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_USERINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_USERINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_USERINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_USERINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_USERINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_USERINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_USERINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginID is NULL THEN 1 WHEN ALRD_USERINFO.LoginID  = @LoginID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN ALRD_USERINFO.UserName  LIKE '%' + @UserName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserLevel is NULL THEN 1 WHEN ALRD_USERINFO.UserLevel  = @UserLevel THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_USERINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_USERINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_USERINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_USERINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_userinfo
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_userinfo_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_userinfo_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@LoginID bigint  = NULL,
		@UserName nvarchar (150) = NULL,
		@UserLevel bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_USERINFO.COMPID,
			ALRD_USERINFO.LoginID,
			ALRD_USERINFO.UserName,
			ALRD_USERINFO.UserLevel,
			ALRD_USERINFO.CreatedBy,
			ALRD_USERINFO.CreatedOn,
			ALRD_USERINFO.UpdatedBy,
			ALRD_USERINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_USERINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_USERINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='LoginID ASC' THEN ALRD_USERINFO.LoginID END ASC,
						CASE WHEN @SortExpression ='LoginID DESC' THEN ALRD_USERINFO.LoginID END DESC,
						CASE WHEN @SortExpression ='UserName ASC' THEN ALRD_USERINFO.UserName END ASC,
						CASE WHEN @SortExpression ='UserName DESC' THEN ALRD_USERINFO.UserName END DESC,
						CASE WHEN @SortExpression ='UserLevel ASC' THEN ALRD_USERINFO.UserLevel END ASC,
						CASE WHEN @SortExpression ='UserLevel DESC' THEN ALRD_USERINFO.UserLevel END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_USERINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_USERINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_USERINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_USERINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_USERINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_USERINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_USERINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_USERINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_USERINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_USERINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @LoginID is NULL THEN 1 WHEN ALRD_USERINFO.LoginID  = @LoginID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserName is NULL THEN 1 WHEN ALRD_USERINFO.UserName  LIKE '%' + @UserName + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UserLevel is NULL THEN 1 WHEN ALRD_USERINFO.UserLevel  = @UserLevel THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_USERINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_USERINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_USERINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_USERINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_userinfo_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_userinfo_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@LoginID bigint  = NULL,
		@UserName nvarchar (150) = NULL,
		@UserLevel bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_USERINFO
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_upazilainfo_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_upazilainfo_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DistrictID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_UPAZILAINFO
		SET
			DESCRIPT = @DESCRIPT,
			DistrictID = @DistrictID,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_upazilainfo_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_upazilainfo_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DistrictID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_UPAZILAINFO
		SET
			DESCRIPT = Case when (@DESCRIPT is not null) then @DESCRIPT else DESCRIPT end,
			DistrictID = Case when (@DistrictID is not null) then @DistrictID else DistrictID end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_upazilainfo_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_upazilainfo_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DistrictID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_UPAZILAINFO (
			DESCRIPT,
			DistrictID,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@DESCRIPT,
			@DistrictID,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_upazilainfo_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_upazilainfo_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@DESCRIPT nvarchar (150) = NULL,
	@DistrictID bigint  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_upazilainfo
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_UPAZILAINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_UPAZILAINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_UPAZILAINFO.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_UPAZILAINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_UPAZILAINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_UPAZILAINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_UPAZILAINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_upazilainfo AS
			(
				  SELECT 
			ALRD_UPAZILAINFO.COMPID,
			ALRD_UPAZILAINFO.DESCRIPT,
			ALRD_UPAZILAINFO.DistrictID,
			ALRD_UPAZILAINFO.CreatedBy,
			ALRD_UPAZILAINFO.CreatedOn,
			ALRD_UPAZILAINFO.UpdatedBy,
			ALRD_UPAZILAINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_UPAZILAINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_UPAZILAINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_UPAZILAINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_UPAZILAINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_UPAZILAINFO.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_UPAZILAINFO.DistrictID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_UPAZILAINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_UPAZILAINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_UPAZILAINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_UPAZILAINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_UPAZILAINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_UPAZILAINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_UPAZILAINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_UPAZILAINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_UPAZILAINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_UPAZILAINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_UPAZILAINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_UPAZILAINFO.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_UPAZILAINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_UPAZILAINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_UPAZILAINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_UPAZILAINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_upazilainfo
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_upazilainfo_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_upazilainfo_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DistrictID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_UPAZILAINFO.COMPID,
			ALRD_UPAZILAINFO.DESCRIPT,
			ALRD_UPAZILAINFO.DistrictID,
			ALRD_UPAZILAINFO.CreatedBy,
			ALRD_UPAZILAINFO.CreatedOn,
			ALRD_UPAZILAINFO.UpdatedBy,
			ALRD_UPAZILAINFO.UpdatedOn,
			ALRD_DISTRICTINFO.DESCRIPT as DistrictName,
			ALRD_DIVISIONINFO.COMPID as DivisionID,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_UPAZILAINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_UPAZILAINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_UPAZILAINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_UPAZILAINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_UPAZILAINFO.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_UPAZILAINFO.DistrictID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_UPAZILAINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_UPAZILAINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_UPAZILAINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_UPAZILAINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_UPAZILAINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_UPAZILAINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_UPAZILAINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_UPAZILAINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_UPAZILAINFO 
		INNER JOIN ALRD_DISTRICTINFO on ALRD_DISTRICTINFO.COMPID = ALRD_UPAZILAINFO.DistrictID
		INNER JOIN ALRD_DIVISIONINFO on ALRD_DIVISIONINFO.COMPID = ALRD_DISTRICTINFO.DivisionID
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_UPAZILAINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_UPAZILAINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_UPAZILAINFO.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_UPAZILAINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_UPAZILAINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_UPAZILAINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_UPAZILAINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_upazilainfo_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_upazilainfo_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@DistrictID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_UPAZILAINFO
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentwaterbodydata_GetAll]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_governmentwaterbodydata_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@NoOfWaterBody20Under decimal (18, 2) = NULL,
		@NoOfWaterBody20Over decimal (18, 2) = NULL,
		@AreaOfWaterbody20Under decimal (18, 2) = NULL,
		@AreaOfWaterbody20Over decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_GOVERNMENTWATERBODYDATA.COMPID,
			ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth,
			ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear,
			ALRD_GOVERNMENTWATERBODYDATA.DivisionID,
			ALRD_GOVERNMENTWATERBODYDATA.DistrictID,
			ALRD_GOVERNMENTWATERBODYDATA.UpazilaID,
			ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under,
			ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over,
			ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under,
			ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over,
			ALRD_GOVERNMENTWATERBODYDATA.Remarks,
			ALRD_GOVERNMENTWATERBODYDATA.CreatedBy,
			ALRD_GOVERNMENTWATERBODYDATA.CreatedOn,
			ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy,
			ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn,
			(
			CASE
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 1 THEN 'January'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 2 THEN 'Februray'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 3 THEN 'March'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 4 THEN 'April'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 5 THEN 'May'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 6 THEN 'June'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 7 THEN 'July'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 8 THEN 'August'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 9 THEN 'September'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 10 THEN 'October'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 11 THEN 'November'
			WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth = 12 THEN 'December'
			ELSE '' END
			) as MonthName,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName,
			ALRD_DISTRICTINFO.DESCRIPT as DistrictName,
			ALRD_UPAZILAINFO.DESCRIPT as UpazilaName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Under ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under END ASC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Under DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under END DESC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Over ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over END ASC,
						CASE WHEN @SortExpression ='NoOfWaterBody20Over DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over END DESC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Under ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under END ASC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Under DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under END DESC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Over ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over END ASC,
						CASE WHEN @SortExpression ='AreaOfWaterbody20Over DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.Remarks END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_GOVERNMENTWATERBODYDATA 
		LEFT JOIN ALRD_DIVISIONINFO ON ALRD_DIVISIONINFO.COMPID = ALRD_GOVERNMENTWATERBODYDATA.DivisionID
		LEFT JOIN ALRD_DISTRICTINFO ON ALRD_DISTRICTINFO.COMPID = ALRD_GOVERNMENTWATERBODYDATA.DistrictID
		LEFT JOIN ALRD_UPAZILAINFO ON ALRD_UPAZILAINFO.COMPID = ALRD_GOVERNMENTWATERBODYDATA.UpazilaID		
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfWaterBody20Under is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Under  = @NoOfWaterBody20Under THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfWaterBody20Over is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.NoOfWaterBody20Over  = @NoOfWaterBody20Over THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AreaOfWaterbody20Under is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Under  = @AreaOfWaterbody20Under THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @AreaOfWaterbody20Over is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.AreaOfWaterbody20Over  = @AreaOfWaterbody20Over THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTWATERBODYDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentkhaslanddata_GetAll]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_governmentkhaslanddata_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalKhasLandAgri decimal (18, 2) = NULL,
		@TotalKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributedKhasLandAgri decimal (18, 2) = NULL,
		@DistributedKhasLandNonAgri decimal (18, 2) = NULL,
		@DistributableKhasLandAgri decimal (18, 2) = NULL,
		@DistributableKhasLandNonAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandAgri decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandNonAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandAgri decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandNonAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseAgri decimal (18, 2) = NULL,
		@KhasLandWithSuitCaseNonAgri decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_GOVERNMENTKHASLANDDATA.COMPID,
			ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth,
			ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear,
			ALRD_GOVERNMENTKHASLANDDATA.DivisionID,
			ALRD_GOVERNMENTKHASLANDDATA.DistrictID,
			ALRD_GOVERNMENTKHASLANDDATA.UpazilaID,
			ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri,
			ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri,
			ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri,
			ALRD_GOVERNMENTKHASLANDDATA.Remarks,
			ALRD_GOVERNMENTKHASLANDDATA.CreatedBy,
			ALRD_GOVERNMENTKHASLANDDATA.CreatedOn,
			ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy,
			ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn,
			(
			CASE
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 1 THEN 'January'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 2 THEN 'Februray'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 3 THEN 'March'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 4 THEN 'April'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 5 THEN 'May'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 6 THEN 'June'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 7 THEN 'July'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 8 THEN 'August'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 9 THEN 'September'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 10 THEN 'October'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 11 THEN 'November'
			WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth = 12 THEN 'December'
			ELSE '' END
			) as MonthName,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName,
			ALRD_DISTRICTINFO.DESCRIPT as DistrictName,
			ALRD_UPAZILAINFO.DESCRIPT as UpazilaName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri END ASC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri END DESC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri END ASC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri END DESC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri END ASC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri END DESC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseNonAgri ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri END ASC,
						CASE WHEN @SortExpression ='KhasLandWithSuitCaseNonAgri DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.Remarks END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_GOVERNMENTKHASLANDDATA 
		LEFT JOIN ALRD_DIVISIONINFO ON ALRD_DIVISIONINFO.COMPID = ALRD_GOVERNMENTKHASLANDDATA.DivisionID
		LEFT JOIN ALRD_DISTRICTINFO ON ALRD_DISTRICTINFO.COMPID = ALRD_GOVERNMENTKHASLANDDATA.DistrictID
		LEFT JOIN ALRD_UPAZILAINFO ON ALRD_UPAZILAINFO.COMPID = ALRD_GOVERNMENTKHASLANDDATA.UpazilaID		
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandAgri  = @TotalKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.TotalKhasLandNonAgri  = @TotalKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandAgri  = @DistributedKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributedKhasLandNonAgri  = @DistributedKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandAgri  = @DistributableKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.DistributableKhasLandNonAgri  = @DistributableKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandAgri  = @NoOfFamilyGotKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.NoOfFamilyGotKhasLandNonAgri  = @NoOfFamilyGotKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IllegalOccupiedKhasLandAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandAgri  = @IllegalOccupiedKhasLandAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IllegalOccupiedKhasLandNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.IllegalOccupiedKhasLandNonAgri  = @IllegalOccupiedKhasLandNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @KhasLandWithSuitCaseAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseAgri  = @KhasLandWithSuitCaseAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @KhasLandWithSuitCaseNonAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.KhasLandWithSuitCaseNonAgri  = @KhasLandWithSuitCaseNonAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTKHASLANDDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_governmentforestrybodydata_GetAll]    Script Date: 01/12/2014 22:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_governmentforestrybodydata_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@TotalCurtailedAreaWoodlot decimal (18, 2) = NULL,
		@TotalCurtailedAreaAgri decimal (18, 2) = NULL,
		@TotalCurtailedAreaStrip decimal (18, 2) = NULL,
		@NoOfBeneficiary decimal (18, 2) = NULL,
		@MoneyDistributed decimal (18, 2) = NULL,
		@Remarks nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear,
			ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID,
			ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot,
			ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri,
			ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip,
			ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary,
			ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed,
			ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy,
			ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn,
			ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy,
			ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn,
			(
			CASE
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 1 THEN 'January'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 2 THEN 'Februray'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 3 THEN 'March'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 4 THEN 'April'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 5 THEN 'May'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 6 THEN 'June'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 7 THEN 'July'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 8 THEN 'August'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 9 THEN 'September'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 10 THEN 'October'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 11 THEN 'November'
			WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth = 12 THEN 'December'
			ELSE '' END
			) as MonthName,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName,
			ALRD_DISTRICTINFO.DESCRIPT as DistrictName,
			ALRD_UPAZILAINFO.DESCRIPT as UpazilaName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaWoodlot ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot END ASC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaWoodlot DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot END DESC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaAgri ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri END ASC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaAgri DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri END DESC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaStrip ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip END ASC,
						CASE WHEN @SortExpression ='TotalCurtailedAreaStrip DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip END DESC,
						CASE WHEN @SortExpression ='NoOfBeneficiary ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary END ASC,
						CASE WHEN @SortExpression ='NoOfBeneficiary DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary END DESC,
						CASE WHEN @SortExpression ='MoneyDistributed ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed END ASC,
						CASE WHEN @SortExpression ='MoneyDistributed DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed END DESC,
						CASE WHEN @SortExpression ='Remarks ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks END ASC,
						CASE WHEN @SortExpression ='Remarks DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_GOVERNMENTFORESTRYBODYDATA 
		LEFT JOIN ALRD_DIVISIONINFO ON ALRD_DIVISIONINFO.COMPID = ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID
		LEFT JOIN ALRD_DISTRICTINFO ON ALRD_DISTRICTINFO.COMPID = ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID
		LEFT JOIN ALRD_UPAZILAINFO ON ALRD_UPAZILAINFO.COMPID = ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCurtailedAreaWoodlot is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaWoodlot  = @TotalCurtailedAreaWoodlot THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCurtailedAreaAgri is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaAgri  = @TotalCurtailedAreaAgri THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCurtailedAreaStrip is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.TotalCurtailedAreaStrip  = @TotalCurtailedAreaStrip THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfBeneficiary is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.NoOfBeneficiary  = @NoOfBeneficiary THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @MoneyDistributed is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.MoneyDistributed  = @MoneyDistributed THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.Remarks  LIKE '%' + @Remarks + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_GOVERNMENTFORESTRYBODYDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_unioninfo_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_unioninfo_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@UpazilaID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_UNIONINFO
		SET
			DESCRIPT = @DESCRIPT,
			UpazilaID = @UpazilaID,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_unioninfo_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_unioninfo_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@UpazilaID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_UNIONINFO
		SET
			DESCRIPT = Case when (@DESCRIPT is not null) then @DESCRIPT else DESCRIPT end,
			UpazilaID = Case when (@UpazilaID is not null) then @UpazilaID else UpazilaID end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_unioninfo_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_unioninfo_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@UpazilaID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_UNIONINFO (
			DESCRIPT,
			UpazilaID,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@DESCRIPT,
			@UpazilaID,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_unioninfo_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_unioninfo_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@COMPID bigint  = NULL,
	@DESCRIPT nvarchar (150) = NULL,
	@UpazilaID bigint  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_unioninfo
				WHERE 
					(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_UNIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_UNIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_UNIONINFO.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_UNIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_UNIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_UNIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_UNIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_unioninfo AS
			(
				  SELECT 
			ALRD_UNIONINFO.COMPID,
			ALRD_UNIONINFO.DESCRIPT,
			ALRD_UNIONINFO.UpazilaID,
			ALRD_UNIONINFO.CreatedBy,
			ALRD_UNIONINFO.CreatedOn,
			ALRD_UNIONINFO.UpdatedBy,
			ALRD_UNIONINFO.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_UNIONINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_UNIONINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_UNIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_UNIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_UNIONINFO.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_UNIONINFO.UpazilaID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_UNIONINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_UNIONINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_UNIONINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_UNIONINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_UNIONINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_UNIONINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_UNIONINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_UNIONINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_UNIONINFO 
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_UNIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_UNIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_UNIONINFO.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_UNIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_UNIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_UNIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_UNIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_unioninfo
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_unioninfo_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_unioninfo_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@UpazilaID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_UNIONINFO.COMPID,
			ALRD_UNIONINFO.DESCRIPT,
			ALRD_UNIONINFO.UpazilaID,
			ALRD_UNIONINFO.CreatedBy,
			ALRD_UNIONINFO.CreatedOn,
			ALRD_UNIONINFO.UpdatedBy,
			ALRD_UNIONINFO.UpdatedOn,
			ALRD_UPAZILAINFO.DESCRIPT as UpazilaName,
			ALRD_DISTRICTINFO.COMPID as DistrictID,
			ALRD_DISTRICTINFO.DESCRIPT as DistrictName,
			ALRD_DIVISIONINFO.COMPID as DivisionID,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_UNIONINFO.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_UNIONINFO.COMPID END DESC,
						CASE WHEN @SortExpression ='DESCRIPT ASC' THEN ALRD_UNIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='DESCRIPT DESC' THEN ALRD_UNIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_UNIONINFO.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_UNIONINFO.UpazilaID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_UNIONINFO.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_UNIONINFO.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_UNIONINFO.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_UNIONINFO.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_UNIONINFO.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_UNIONINFO.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_UNIONINFO.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_UNIONINFO.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_UNIONINFO 
		INNER JOIN ALRD_UPAZILAINFO on ALRD_UPAZILAINFO.COMPID = ALRD_UNIONINFO.UpazilaID
		INNER JOIN ALRD_DISTRICTINFO on ALRD_DISTRICTINFO.COMPID = ALRD_UPAZILAINFO.DistrictID
		INNER JOIN ALRD_DIVISIONINFO on ALRD_DIVISIONINFO.COMPID = ALRD_DISTRICTINFO.DivisionID
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_UNIONINFO.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DESCRIPT is NULL THEN 1 WHEN ALRD_UNIONINFO.DESCRIPT  LIKE '%' + @DESCRIPT + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_UNIONINFO.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_UNIONINFO.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_UNIONINFO.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_UNIONINFO.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_UNIONINFO.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_unioninfo_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_unioninfo_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@COMPID bigint  = NULL,
		@DESCRIPT nvarchar (150) = NULL,
		@UpazilaID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_UNIONINFO
		WHERE 
					COMPID = @COMPID

		
		SET @RETURN_KEY = @COMPID
		
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_organizationdata_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_organizationdata_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@COMPID bigint  = NULL,
		@CollectionMonth bigint  = NULL,
		@CollCollectionYear bigint  = NULL,
		@CollOrganizationID bigint  = NULL,
		@ActKhaLand bit  = NULL,
		@ActKhaWater bit  = NULL,
		@ActAdibasi bit  = NULL,
		@ActLanServey bit  = NULL,
		@ActAwareness bit  = NULL,
		@ActVestedProp bit  = NULL,
		@DivisionID bigint  = NULL,
		@DistrictID bigint  = NULL,
		@UpazilaID bigint  = NULL,
		@UnionID bigint  = NULL,
		@TotalKhasLandGov11 decimal (18, 2) = NULL,
		@DistributedKhasLandGov12 decimal (18, 2) = NULL,
		@DistributableKhasLandGov13 decimal (18, 2) = NULL,
		@TotalLandlessFamilyGov14 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandGov15 decimal (18, 2) = NULL,
		@IllegalOccupiedKhasLandGov16 decimal (18, 2) = NULL,
		@TotalKhasLandOrg21 decimal (18, 2) = NULL,
		@DistributedKhasLandOrg22 decimal (18, 2) = NULL,
		@DistributableKhasLandOrg23 decimal (18, 2) = NULL,
		@TotalLandlessFamilyOrg24 decimal (18, 2) = NULL,
		@NoOfFamilyGotKhasLandOrg25 decimal (18, 2) = NULL,
		@NoOfFamilyEvictedKhasLandOrg26 decimal (18, 2) = NULL,
		@NoOfViolenceKhasLandOrg27 decimal (18, 2) = NULL,
		@NoOfLitigationKhasLandOrg28 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg29 bigint = NULL,
		@NoOfInitiativeRallyOrg29 bigint = NULL,
		@NoOfInitiativeMemoOrg29 bigint = NULL,
		@NoOfInitiativeLegalOrg29 bigint = NULL,
		@NoOfInitiativeMeetOrg29 bigint = NULL,
		@NoOfInitiativeOthOrg29 bigint = NULL,
		@TotalLess20KhasWaterGov31 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterGov32 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterGov33 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterGov34 decimal (18, 2) = NULL,
		@TotalLess20KhasWaterOrg41 decimal (18, 2) = NULL,
		@TotalMore20KhasWaterOrg42 decimal (18, 2) = NULL,
		@TotalLeaseLess20KhasWaterOrg43 decimal (18, 2) = NULL,
		@TotalLeaseMore20KhasWaterOrg44 decimal (18, 2) = NULL,
		@NoOfFamilyFishingOrg45 decimal (18, 2) = NULL,
		@NoOfRegFisherFolkCoOrg46 decimal (18, 2) = NULL,
		@NoOfFisherFolkCoOrg47 decimal (18, 2) = NULL,
		@NoOfLitigationKhasWaterOrg48 decimal (18, 2) = NULL,
		@NoOfMovKhasWaterOrg49 decimal (18, 2) = NULL,
		@NoOfCaseEvictionKhasWaterOrg410 decimal (18, 2) = NULL,
		@NoOfInitiativeGathOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeRallyOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMemoOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeLegalOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeMeetOrg411 decimal (18, 2) = NULL,
		@NoOfInitiativeOthOrg411 decimal (18, 2) = NULL,
		@TotalLand51 decimal (18, 2) = NULL,
		@TotalPrivateProp52 decimal (18, 2) = NULL,
		@TotalAgriLand53 decimal (18, 2) = NULL,
		@TotalNonAgriLand54 decimal (18, 2) = NULL,
		@TotalForestLand55 decimal (18, 2) = NULL,
		@TotalCommLan56 decimal (18, 2) = NULL,
		@TotalAgriCommLastYear57 decimal (18, 2) = NULL,
		@TotalAgriComm58 decimal (18, 2) = NULL,
		@NoOfFamilyAgriComm59 decimal (18, 2) = NULL,
		@TotalCharLand510 decimal (18, 2) = NULL,
		@NatAgriCommTobacco511 decimal (18, 2) = NULL,
		@NatAgriCommRubber511 decimal (18, 2) = NULL,
		@NatAgriCommBricks511 decimal (18, 2) = NULL,
		@NatAgriCommIndustry511 decimal (18, 2) = NULL,
		@Remarks512 nvarchar (300) = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_ORGANIZATIONDATA.COMPID,
			ALRD_ORGANIZATIONDATA.CollectionMonth,
			ALRD_ORGANIZATIONDATA.CollCollectionYear,
			ALRD_ORGANIZATIONDATA.CollOrganizationID,
			ALRD_ORGANIZATIONDATA.ActKhaLand,
			ALRD_ORGANIZATIONDATA.ActKhaWater,
			ALRD_ORGANIZATIONDATA.ActAdibasi,
			ALRD_ORGANIZATIONDATA.ActLanServey,
			ALRD_ORGANIZATIONDATA.ActAwareness,
			ALRD_ORGANIZATIONDATA.ActVestedProp,
			ALRD_ORGANIZATIONDATA.DivisionID,
			ALRD_ORGANIZATIONDATA.DistrictID,
			ALRD_ORGANIZATIONDATA.UpazilaID,
			ALRD_ORGANIZATIONDATA.UnionID,
			ALRD_ORGANIZATIONDATA.TotalKhasLandGov11,
			ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12,
			ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13,
			ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14,
			ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15,
			ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16,
			ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21,
			ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22,
			ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23,
			ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24,
			ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25,
			ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26,
			ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27,
			ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29,
			ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31,
			ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32,
			ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33,
			ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34,
			ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41,
			ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42,
			ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43,
			ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44,
			ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45,
			ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46,
			ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47,
			ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48,
			ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49,
			ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411,
			ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411,
			ALRD_ORGANIZATIONDATA.TotalLand51,
			ALRD_ORGANIZATIONDATA.TotalPrivateProp52,
			ALRD_ORGANIZATIONDATA.TotalAgriLand53,
			ALRD_ORGANIZATIONDATA.TotalNonAgriLand54,
			ALRD_ORGANIZATIONDATA.TotalForestLand55,
			ALRD_ORGANIZATIONDATA.TotalCommLan56,
			ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57,
			ALRD_ORGANIZATIONDATA.TotalAgriComm58,
			ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59,
			ALRD_ORGANIZATIONDATA.TotalCharLand510,
			ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511,
			ALRD_ORGANIZATIONDATA.NatAgriCommRubber511,
			ALRD_ORGANIZATIONDATA.NatAgriCommBricks511,
			ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511,
			ALRD_ORGANIZATIONDATA.Remarks512,
			ALRD_ORGANIZATIONDATA.CreatedBy,
			ALRD_ORGANIZATIONDATA.CreatedOn,
			ALRD_ORGANIZATIONDATA.UpdatedBy,
			ALRD_ORGANIZATIONDATA.UpdatedOn,
			(
			CASE
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 1 THEN 'January'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 2 THEN 'Februray'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 3 THEN 'March'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 4 THEN 'April'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 5 THEN 'May'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 6 THEN 'June'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 7 THEN 'July'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 8 THEN 'August'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 9 THEN 'September'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 10 THEN 'October'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 11 THEN 'November'
			WHEN ALRD_ORGANIZATIONDATA.CollectionMonth = 12 THEN 'December'
			ELSE '' END
			) as MonthName,
			ALRD_ORGANIZATIONINFO.DESCRIPT as OrgName,
			ALRD_DIVISIONINFO.DESCRIPT as DivisionName,
			ALRD_DISTRICTINFO.DESCRIPT as DistrictName,
			ALRD_UPAZILAINFO.DESCRIPT as UpazilaName,
			ALRD_UNIONINFO.DESCRIPT as UnionName
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='COMPID ASC' THEN ALRD_ORGANIZATIONDATA.COMPID END ASC,
						CASE WHEN @SortExpression ='COMPID DESC' THEN ALRD_ORGANIZATIONDATA.COMPID END DESC,
						CASE WHEN @SortExpression ='CollectionMonth ASC' THEN ALRD_ORGANIZATIONDATA.CollectionMonth END ASC,
						CASE WHEN @SortExpression ='CollectionMonth DESC' THEN ALRD_ORGANIZATIONDATA.CollectionMonth END DESC,
						CASE WHEN @SortExpression ='CollCollectionYear ASC' THEN ALRD_ORGANIZATIONDATA.CollCollectionYear END ASC,
						CASE WHEN @SortExpression ='CollCollectionYear DESC' THEN ALRD_ORGANIZATIONDATA.CollCollectionYear END DESC,
						CASE WHEN @SortExpression ='CollOrganizationID ASC' THEN ALRD_ORGANIZATIONDATA.CollOrganizationID END ASC,
						CASE WHEN @SortExpression ='CollOrganizationID DESC' THEN ALRD_ORGANIZATIONDATA.CollOrganizationID END DESC,
						CASE WHEN @SortExpression ='OrgName ASC' THEN ALRD_ORGANIZATIONINFO.DESCRIPT END ASC,
						CASE WHEN @SortExpression ='OrgName DESC' THEN ALRD_ORGANIZATIONINFO.DESCRIPT END DESC,
						CASE WHEN @SortExpression ='ActKhaLand ASC' THEN ALRD_ORGANIZATIONDATA.ActKhaLand END ASC,
						CASE WHEN @SortExpression ='ActKhaLand DESC' THEN ALRD_ORGANIZATIONDATA.ActKhaLand END DESC,
						CASE WHEN @SortExpression ='ActKhaWater ASC' THEN ALRD_ORGANIZATIONDATA.ActKhaWater END ASC,
						CASE WHEN @SortExpression ='ActKhaWater DESC' THEN ALRD_ORGANIZATIONDATA.ActKhaWater END DESC,
						CASE WHEN @SortExpression ='ActAdibasi ASC' THEN ALRD_ORGANIZATIONDATA.ActAdibasi END ASC,
						CASE WHEN @SortExpression ='ActAdibasi DESC' THEN ALRD_ORGANIZATIONDATA.ActAdibasi END DESC,
						CASE WHEN @SortExpression ='ActLanServey ASC' THEN ALRD_ORGANIZATIONDATA.ActLanServey END ASC,
						CASE WHEN @SortExpression ='ActLanServey DESC' THEN ALRD_ORGANIZATIONDATA.ActLanServey END DESC,
						CASE WHEN @SortExpression ='ActAwareness ASC' THEN ALRD_ORGANIZATIONDATA.ActAwareness END ASC,
						CASE WHEN @SortExpression ='ActAwareness DESC' THEN ALRD_ORGANIZATIONDATA.ActAwareness END DESC,
						CASE WHEN @SortExpression ='ActVestedProp ASC' THEN ALRD_ORGANIZATIONDATA.ActVestedProp END ASC,
						CASE WHEN @SortExpression ='ActVestedProp DESC' THEN ALRD_ORGANIZATIONDATA.ActVestedProp END DESC,
						CASE WHEN @SortExpression ='DivisionID ASC' THEN ALRD_ORGANIZATIONDATA.DivisionID END ASC,
						CASE WHEN @SortExpression ='DivisionID DESC' THEN ALRD_ORGANIZATIONDATA.DivisionID END DESC,
						CASE WHEN @SortExpression ='DistrictID ASC' THEN ALRD_ORGANIZATIONDATA.DistrictID END ASC,
						CASE WHEN @SortExpression ='DistrictID DESC' THEN ALRD_ORGANIZATIONDATA.DistrictID END DESC,
						CASE WHEN @SortExpression ='UpazilaID ASC' THEN ALRD_ORGANIZATIONDATA.UpazilaID END ASC,
						CASE WHEN @SortExpression ='UpazilaID DESC' THEN ALRD_ORGANIZATIONDATA.UpazilaID END DESC,
						CASE WHEN @SortExpression ='UnionID ASC' THEN ALRD_ORGANIZATIONDATA.UnionID END ASC,
						CASE WHEN @SortExpression ='UnionID DESC' THEN ALRD_ORGANIZATIONDATA.UnionID END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandGov11 ASC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11 END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandGov11 DESC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11 END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandGov12 ASC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12 END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandGov12 DESC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12 END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandGov13 ASC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13 END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandGov13 DESC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13 END DESC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyGov14 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14 END ASC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyGov14 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandGov15 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandGov15 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15 END DESC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandGov16 ASC' THEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16 END ASC,
						CASE WHEN @SortExpression ='IllegalOccupiedKhasLandGov16 DESC' THEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16 END DESC,
						CASE WHEN @SortExpression ='TotalKhasLandOrg21 ASC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21 END ASC,
						CASE WHEN @SortExpression ='TotalKhasLandOrg21 DESC' THEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21 END DESC,
						CASE WHEN @SortExpression ='DistributedKhasLandOrg22 ASC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22 END ASC,
						CASE WHEN @SortExpression ='DistributedKhasLandOrg22 DESC' THEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22 END DESC,
						CASE WHEN @SortExpression ='DistributableKhasLandOrg23 ASC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23 END ASC,
						CASE WHEN @SortExpression ='DistributableKhasLandOrg23 DESC' THEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23 END DESC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyOrg24 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24 END ASC,
						CASE WHEN @SortExpression ='TotalLandlessFamilyOrg24 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandOrg25 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyGotKhasLandOrg25 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyEvictedKhasLandOrg26 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyEvictedKhasLandOrg26 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26 END DESC,
						CASE WHEN @SortExpression ='NoOfViolenceKhasLandOrg27 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27 END ASC,
						CASE WHEN @SortExpression ='NoOfViolenceKhasLandOrg27 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27 END DESC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasLandOrg28 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28 END ASC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasLandOrg28 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg29 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg29 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29 END DESC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterGov31 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31 END ASC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterGov31 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31 END DESC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterGov32 ASC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32 END ASC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterGov32 DESC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterGov33 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterGov33 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterGov34 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterGov34 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34 END DESC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterOrg41 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41 END ASC,
						CASE WHEN @SortExpression ='TotalLess20KhasWaterOrg41 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41 END DESC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterOrg42 ASC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42 END ASC,
						CASE WHEN @SortExpression ='TotalMore20KhasWaterOrg42 DESC' THEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterOrg43 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseLess20KhasWaterOrg43 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43 END DESC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterOrg44 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44 END ASC,
						CASE WHEN @SortExpression ='TotalLeaseMore20KhasWaterOrg44 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyFishingOrg45 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyFishingOrg45 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45 END DESC,
						CASE WHEN @SortExpression ='NoOfRegFisherFolkCoOrg46 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46 END ASC,
						CASE WHEN @SortExpression ='NoOfRegFisherFolkCoOrg46 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46 END DESC,
						CASE WHEN @SortExpression ='NoOfFisherFolkCoOrg47 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47 END ASC,
						CASE WHEN @SortExpression ='NoOfFisherFolkCoOrg47 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47 END DESC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasWaterOrg48 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48 END ASC,
						CASE WHEN @SortExpression ='NoOfLitigationKhasWaterOrg48 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48 END DESC,
						CASE WHEN @SortExpression ='NoOfMovKhasWaterOrg49 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49 END ASC,
						CASE WHEN @SortExpression ='NoOfMovKhasWaterOrg49 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49 END DESC,
						CASE WHEN @SortExpression ='NoOfCaseEvictionKhasWaterOrg410 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410 END ASC,
						CASE WHEN @SortExpression ='NoOfCaseEvictionKhasWaterOrg410 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeGathOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeRallyOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMemoOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeLegalOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeMeetOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411 END DESC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg411 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411 END ASC,
						CASE WHEN @SortExpression ='NoOfInitiativeOthOrg411 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411 END DESC,
						CASE WHEN @SortExpression ='TotalLand51 ASC' THEN ALRD_ORGANIZATIONDATA.TotalLand51 END ASC,
						CASE WHEN @SortExpression ='TotalLand51 DESC' THEN ALRD_ORGANIZATIONDATA.TotalLand51 END DESC,
						CASE WHEN @SortExpression ='TotalPrivateProp52 ASC' THEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52 END ASC,
						CASE WHEN @SortExpression ='TotalPrivateProp52 DESC' THEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52 END DESC,
						CASE WHEN @SortExpression ='TotalAgriLand53 ASC' THEN ALRD_ORGANIZATIONDATA.TotalAgriLand53 END ASC,
						CASE WHEN @SortExpression ='TotalAgriLand53 DESC' THEN ALRD_ORGANIZATIONDATA.TotalAgriLand53 END DESC,
						CASE WHEN @SortExpression ='TotalNonAgriLand54 ASC' THEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54 END ASC,
						CASE WHEN @SortExpression ='TotalNonAgriLand54 DESC' THEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54 END DESC,
						CASE WHEN @SortExpression ='TotalForestLand55 ASC' THEN ALRD_ORGANIZATIONDATA.TotalForestLand55 END ASC,
						CASE WHEN @SortExpression ='TotalForestLand55 DESC' THEN ALRD_ORGANIZATIONDATA.TotalForestLand55 END DESC,
						CASE WHEN @SortExpression ='TotalCommLan56 ASC' THEN ALRD_ORGANIZATIONDATA.TotalCommLan56 END ASC,
						CASE WHEN @SortExpression ='TotalCommLan56 DESC' THEN ALRD_ORGANIZATIONDATA.TotalCommLan56 END DESC,
						CASE WHEN @SortExpression ='TotalAgriCommLastYear57 ASC' THEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57 END ASC,
						CASE WHEN @SortExpression ='TotalAgriCommLastYear57 DESC' THEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57 END DESC,
						CASE WHEN @SortExpression ='TotalAgriComm58 ASC' THEN ALRD_ORGANIZATIONDATA.TotalAgriComm58 END ASC,
						CASE WHEN @SortExpression ='TotalAgriComm58 DESC' THEN ALRD_ORGANIZATIONDATA.TotalAgriComm58 END DESC,
						CASE WHEN @SortExpression ='NoOfFamilyAgriComm59 ASC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59 END ASC,
						CASE WHEN @SortExpression ='NoOfFamilyAgriComm59 DESC' THEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59 END DESC,
						CASE WHEN @SortExpression ='TotalCharLand510 ASC' THEN ALRD_ORGANIZATIONDATA.TotalCharLand510 END ASC,
						CASE WHEN @SortExpression ='TotalCharLand510 DESC' THEN ALRD_ORGANIZATIONDATA.TotalCharLand510 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommTobacco511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommTobacco511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommRubber511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommRubber511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommBricks511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommBricks511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511 END DESC,
						CASE WHEN @SortExpression ='NatAgriCommIndustry511 ASC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511 END ASC,
						CASE WHEN @SortExpression ='NatAgriCommIndustry511 DESC' THEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511 END DESC,
						CASE WHEN @SortExpression ='Remarks512 ASC' THEN ALRD_ORGANIZATIONDATA.Remarks512 END ASC,
						CASE WHEN @SortExpression ='Remarks512 DESC' THEN ALRD_ORGANIZATIONDATA.Remarks512 END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_ORGANIZATIONDATA.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_ORGANIZATIONDATA.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_ORGANIZATIONDATA.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_ORGANIZATIONDATA.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_ORGANIZATIONDATA.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_ORGANIZATIONDATA.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_ORGANIZATIONDATA.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_ORGANIZATIONDATA.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_ORGANIZATIONDATA 
		INNER JOIN ALRD_ORGANIZATIONINFO ON ALRD_ORGANIZATIONINFO.COMPID = ALRD_ORGANIZATIONDATA.CollOrganizationID
		LEFT JOIN ALRD_DIVISIONINFO ON ALRD_DIVISIONINFO.COMPID = ALRD_ORGANIZATIONDATA.DivisionID
		LEFT JOIN ALRD_DISTRICTINFO ON ALRD_DISTRICTINFO.COMPID = ALRD_ORGANIZATIONDATA.DistrictID
		LEFT JOIN ALRD_UPAZILAINFO ON ALRD_UPAZILAINFO.COMPID = ALRD_ORGANIZATIONDATA.UpazilaID
		LEFT JOIN ALRD_UNIONINFO ON ALRD_UNIONINFO.COMPID = ALRD_ORGANIZATIONDATA.UnionID
		where
			(CASE WHEN @COMPID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.COMPID  = @COMPID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollectionMonth is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollectionMonth  = @CollectionMonth THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollCollectionYear is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollCollectionYear  = @CollCollectionYear THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CollOrganizationID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CollOrganizationID  = @CollOrganizationID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActKhaLand is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActKhaLand  = @ActKhaLand THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActKhaWater is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActKhaWater  = @ActKhaWater THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActAdibasi is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActAdibasi  = @ActAdibasi THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActLanServey is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActLanServey  = @ActLanServey THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActAwareness is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActAwareness  = @ActAwareness THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @ActVestedProp is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.ActVestedProp  = @ActVestedProp THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DivisionID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DivisionID  = @DivisionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistrictID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistrictID  = @DistrictID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpazilaID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpazilaID  = @UpazilaID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UnionID is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UnionID  = @UnionID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandGov11 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalKhasLandGov11  = @TotalKhasLandGov11 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandGov12 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributedKhasLandGov12  = @DistributedKhasLandGov12 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandGov13 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributableKhasLandGov13  = @DistributableKhasLandGov13 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLandlessFamilyGov14 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyGov14  = @TotalLandlessFamilyGov14 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandGov15 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandGov15  = @NoOfFamilyGotKhasLandGov15 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @IllegalOccupiedKhasLandGov16 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.IllegalOccupiedKhasLandGov16  = @IllegalOccupiedKhasLandGov16 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalKhasLandOrg21 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalKhasLandOrg21  = @TotalKhasLandOrg21 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributedKhasLandOrg22 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributedKhasLandOrg22  = @DistributedKhasLandOrg22 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @DistributableKhasLandOrg23 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.DistributableKhasLandOrg23  = @DistributableKhasLandOrg23 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLandlessFamilyOrg24 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLandlessFamilyOrg24  = @TotalLandlessFamilyOrg24 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyGotKhasLandOrg25 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyGotKhasLandOrg25  = @NoOfFamilyGotKhasLandOrg25 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyEvictedKhasLandOrg26 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyEvictedKhasLandOrg26  = @NoOfFamilyEvictedKhasLandOrg26 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfViolenceKhasLandOrg27 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfViolenceKhasLandOrg27  = @NoOfViolenceKhasLandOrg27 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfLitigationKhasLandOrg28 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasLandOrg28  = @NoOfLitigationKhasLandOrg28 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeGathOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg29  = @NoOfInitiativeGathOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeRallyOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg29  = @NoOfInitiativeRallyOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMemoOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg29  = @NoOfInitiativeMemoOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeLegalOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg29  = @NoOfInitiativeLegalOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMeetOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg29  = @NoOfInitiativeMeetOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeOthOrg29 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg29  = @NoOfInitiativeOthOrg29 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLess20KhasWaterGov31 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterGov31  = @TotalLess20KhasWaterGov31 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalMore20KhasWaterGov32 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterGov32  = @TotalMore20KhasWaterGov32 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseLess20KhasWaterGov33 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterGov33  = @TotalLeaseLess20KhasWaterGov33 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseMore20KhasWaterGov34 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterGov34  = @TotalLeaseMore20KhasWaterGov34 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLess20KhasWaterOrg41 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLess20KhasWaterOrg41  = @TotalLess20KhasWaterOrg41 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalMore20KhasWaterOrg42 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalMore20KhasWaterOrg42  = @TotalMore20KhasWaterOrg42 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseLess20KhasWaterOrg43 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseLess20KhasWaterOrg43  = @TotalLeaseLess20KhasWaterOrg43 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLeaseMore20KhasWaterOrg44 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLeaseMore20KhasWaterOrg44  = @TotalLeaseMore20KhasWaterOrg44 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyFishingOrg45 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyFishingOrg45  = @NoOfFamilyFishingOrg45 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfRegFisherFolkCoOrg46 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfRegFisherFolkCoOrg46  = @NoOfRegFisherFolkCoOrg46 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFisherFolkCoOrg47 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFisherFolkCoOrg47  = @NoOfFisherFolkCoOrg47 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfLitigationKhasWaterOrg48 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfLitigationKhasWaterOrg48  = @NoOfLitigationKhasWaterOrg48 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfMovKhasWaterOrg49 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfMovKhasWaterOrg49  = @NoOfMovKhasWaterOrg49 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfCaseEvictionKhasWaterOrg410 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfCaseEvictionKhasWaterOrg410  = @NoOfCaseEvictionKhasWaterOrg410 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeGathOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeGathOrg411  = @NoOfInitiativeGathOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeRallyOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeRallyOrg411  = @NoOfInitiativeRallyOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMemoOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMemoOrg411  = @NoOfInitiativeMemoOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeLegalOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeLegalOrg411  = @NoOfInitiativeLegalOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeMeetOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeMeetOrg411  = @NoOfInitiativeMeetOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfInitiativeOthOrg411 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfInitiativeOthOrg411  = @NoOfInitiativeOthOrg411 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalLand51 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalLand51  = @TotalLand51 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalPrivateProp52 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalPrivateProp52  = @TotalPrivateProp52 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalAgriLand53 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriLand53  = @TotalAgriLand53 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalNonAgriLand54 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalNonAgriLand54  = @TotalNonAgriLand54 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalForestLand55 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalForestLand55  = @TotalForestLand55 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCommLan56 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalCommLan56  = @TotalCommLan56 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalAgriCommLastYear57 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriCommLastYear57  = @TotalAgriCommLastYear57 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalAgriComm58 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalAgriComm58  = @TotalAgriComm58 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NoOfFamilyAgriComm59 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NoOfFamilyAgriComm59  = @NoOfFamilyAgriComm59 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @TotalCharLand510 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.TotalCharLand510  = @TotalCharLand510 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommTobacco511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommTobacco511  = @NatAgriCommTobacco511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommRubber511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommRubber511  = @NatAgriCommRubber511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommBricks511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommBricks511  = @NatAgriCommBricks511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @NatAgriCommIndustry511 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.NatAgriCommIndustry511  = @NatAgriCommIndustry511 THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Remarks512 is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.Remarks512  LIKE '%' + @Remarks512 + '%' THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_ORGANIZATIONDATA.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  Table [dbo].[ALRD_SECURITYUSERROLEMAPPING]    Script Date: 01/12/2014 22:35:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALRD_SECURITYUSERROLEMAPPING](
	[User_Role_Mapping_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[User_ID] [bigint] NOT NULL,
	[Role_Detail_ID] [bigint] NOT NULL,
	[CreatedBy] [bigint] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedBy] [bigint] NULL,
	[UpdatedOn] [datetime] NULL,
 CONSTRAINT [PK_ALRD_SECURITY_USERROLEMAPPING] PRIMARY KEY CLUSTERED 
(
	[User_Role_Mapping_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuserrolemapping_Update]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuserrolemapping_Update]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@User_Role_Mapping_ID bigint  = NULL,
		@User_ID bigint  = NULL,
		@Role_Detail_ID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYUSERROLEMAPPING
		SET
			User_ID = @User_ID,
			Role_Detail_ID = @Role_Detail_ID,
			CreatedBy = @CreatedBy,
			CreatedOn = @CreatedOn,
			UpdatedBy = @UpdatedBy,
			UpdatedOn = @UpdatedOn
		WHERE
					User_Role_Mapping_ID = @User_Role_Mapping_ID

		
		SET @RETURN_KEY = @User_Role_Mapping_ID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuserrolemapping_PertialUpdate]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuserrolemapping_PertialUpdate]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@User_Role_Mapping_ID bigint  = NULL,
		@User_ID bigint  = NULL,
		@Role_Detail_ID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL

	AS
	BEGIN
		UPDATE ALRD_SECURITYUSERROLEMAPPING
		SET
			User_ID = Case when (@User_ID is not null) then @User_ID else User_ID end,
			Role_Detail_ID = Case when (@Role_Detail_ID is not null) then @Role_Detail_ID else Role_Detail_ID end,
			CreatedBy = Case when (@CreatedBy is not null) then @CreatedBy else CreatedBy end,
			CreatedOn = Case when (@CreatedOn is not null) then @CreatedOn else CreatedOn end,
			UpdatedBy = Case when (@UpdatedBy =0 ) then NULL  else Case when (@UpdatedBy is not null) then @UpdatedBy else UpdatedBy end end,
			UpdatedOn = Case when (@UpdatedOn ='1/1/1754' ) then NULL  else Case when (@UpdatedOn is not null) then @UpdatedOn else UpdatedOn end end
		WHERE
					User_Role_Mapping_ID = @User_Role_Mapping_ID

		
		SET @RETURN_KEY = @User_Role_Mapping_ID
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuserrolemapping_Insert]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuserrolemapping_Insert] 
		@RETURN_KEY bigint = null output,
        @EntryUserKey bigint  = NULL,
		@EntryDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@User_Role_Mapping_ID bigint  = NULL,
		@User_ID bigint  = NULL,
		@Role_Detail_ID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		
        
		INSERT INTO ALRD_SECURITYUSERROLEMAPPING (
			User_ID,
			Role_Detail_ID,
			CreatedBy,
			CreatedOn,
			UpdatedBy,
			UpdatedOn
		)
		VALUES (
			@User_ID,
			@Role_Detail_ID,
			@CreatedBy,
			@CreatedOn,
			@UpdatedBy,
			@UpdatedOn
		)
		SET @RETURN_KEY = SCOPE_IDENTITY()
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuserrolemapping_GetAllByPages]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityuserrolemapping_GetAllByPages] 
	@CurrentPage BIGINT  = NULL,
	@PageSize BIGINT = NULL,
	@TotalRecord bigint = null output,
	@SortExpression VARCHAR(MAX)  = NULL,
	@User_Role_Mapping_ID bigint  = NULL,
	@User_ID bigint  = NULL,
	@Role_Detail_ID bigint  = NULL,
	@CreatedBy bigint  = NULL,
	@CreatedOn datetime  = NULL,
	@UpdatedBy bigint  = NULL,
	@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DECLARE @UpperBand int, @LowerBand int
		
		
		
		SET @TotalRecord = 
			(
				SELECT 
					COUNT(*)
				FROM 
					alrd_securityuserrolemapping
				WHERE 
					(CASE WHEN @User_Role_Mapping_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID  = @User_Role_Mapping_ID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @User_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.User_ID  = @User_ID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @Role_Detail_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID  = @Role_Detail_ID THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
					AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
		SET @LowerBand  = (@CurrentPage - 1) * @PageSize
		SET @UpperBand  = (@CurrentPage * @PageSize) + 1
		
		
		BEGIN
			WITH tempPagedalrd_securityuserrolemapping AS
			(
				  SELECT 
			ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID,
			ALRD_SECURITYUSERROLEMAPPING.User_ID,
			ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID,
			ALRD_SECURITYUSERROLEMAPPING.CreatedBy,
			ALRD_SECURITYUSERROLEMAPPING.CreatedOn,
			ALRD_SECURITYUSERROLEMAPPING.UpdatedBy,
			ALRD_SECURITYUSERROLEMAPPING.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='User_Role_Mapping_ID ASC' THEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID END ASC,
						CASE WHEN @SortExpression ='User_Role_Mapping_ID DESC' THEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID END DESC,
						CASE WHEN @SortExpression ='User_ID ASC' THEN ALRD_SECURITYUSERROLEMAPPING.User_ID END ASC,
						CASE WHEN @SortExpression ='User_ID DESC' THEN ALRD_SECURITYUSERROLEMAPPING.User_ID END DESC,
						CASE WHEN @SortExpression ='Role_Detail_ID ASC' THEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID END ASC,
						CASE WHEN @SortExpression ='Role_Detail_ID DESC' THEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYUSERROLEMAPPING 
		where
			(CASE WHEN @User_Role_Mapping_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID  = @User_Role_Mapping_ID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @User_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.User_ID  = @User_ID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Role_Detail_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID  = @Role_Detail_ID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
			)
			SELECT * 
			FROM  tempPagedalrd_securityuserrolemapping
			WHERE RowNumber > @LowerBand AND RowNumber < @UpperBand
			end

	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuserrolemapping_GetAll]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--GET ALL
CREATE PROCEDURE [dbo].[alrd_securityuserrolemapping_GetAll] 
	    @SortExpression VARCHAR(MAX)  = NULL,
		@User_Role_Mapping_ID bigint  = NULL,
		@User_ID bigint  = NULL,
		@Role_Detail_ID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		SELECT 
			ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID,
			ALRD_SECURITYUSERROLEMAPPING.User_ID,
			ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID,
			ALRD_SECURITYUSERROLEMAPPING.CreatedBy,
			ALRD_SECURITYUSERROLEMAPPING.CreatedOn,
			ALRD_SECURITYUSERROLEMAPPING.UpdatedBy,
			ALRD_SECURITYUSERROLEMAPPING.UpdatedOn
			,ROW_NUMBER() OVER
				(
					ORDER BY
						CASE WHEN @SortExpression ='User_Role_Mapping_ID ASC' THEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID END ASC,
						CASE WHEN @SortExpression ='User_Role_Mapping_ID DESC' THEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID END DESC,
						CASE WHEN @SortExpression ='User_ID ASC' THEN ALRD_SECURITYUSERROLEMAPPING.User_ID END ASC,
						CASE WHEN @SortExpression ='User_ID DESC' THEN ALRD_SECURITYUSERROLEMAPPING.User_ID END DESC,
						CASE WHEN @SortExpression ='Role_Detail_ID ASC' THEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID END ASC,
						CASE WHEN @SortExpression ='Role_Detail_ID DESC' THEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID END DESC,
						CASE WHEN @SortExpression ='CreatedBy ASC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy END ASC,
						CASE WHEN @SortExpression ='CreatedBy DESC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy END DESC,
						CASE WHEN @SortExpression ='CreatedOn ASC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn END ASC,
						CASE WHEN @SortExpression ='CreatedOn DESC' THEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn END DESC,
						CASE WHEN @SortExpression ='UpdatedBy ASC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy END ASC,
						CASE WHEN @SortExpression ='UpdatedBy DESC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy END DESC,
						CASE WHEN @SortExpression ='UpdatedOn ASC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn END ASC,
						CASE WHEN @SortExpression ='UpdatedOn DESC' THEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn END DESC
				) as RowNumber
		FROM ALRD_SECURITYUSERROLEMAPPING 
		where
			(CASE WHEN @User_Role_Mapping_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.User_Role_Mapping_ID  = @User_Role_Mapping_ID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @User_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.User_ID  = @User_ID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @Role_Detail_ID is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.Role_Detail_ID  = @Role_Detail_ID THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.CreatedBy  = @CreatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @CreatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.CreatedOn  = @CreatedOn THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedBy is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.UpdatedBy  = @UpdatedBy THEN 1 ELSE 0 END = 1)
			AND (CASE WHEN @UpdatedOn is NULL THEN 1 WHEN ALRD_SECURITYUSERROLEMAPPING.UpdatedOn  = @UpdatedOn THEN 1 ELSE 0 END = 1)
	END
GO
/****** Object:  StoredProcedure [dbo].[alrd_securityuserrolemapping_Delete]    Script Date: 01/12/2014 22:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[alrd_securityuserrolemapping_Delete]
		@RETURN_KEY bigint = null output,
        @LastUpdateUserKey bigint  = NULL,
		@LastUpdateDate DATETIME  = NULL,
		@FormID bigint  = NULL,
        
		@User_Role_Mapping_ID bigint  = NULL,
		@User_ID bigint  = NULL,
		@Role_Detail_ID bigint  = NULL,
		@CreatedBy bigint  = NULL,
		@CreatedOn datetime  = NULL,
		@UpdatedBy bigint  = NULL,
		@UpdatedOn datetime  = NULL
	AS
	BEGIN
		DELETE FROM ALRD_SECURITYUSERROLEMAPPING
		WHERE 
					User_Role_Mapping_ID = @User_Role_Mapping_ID

		
		SET @RETURN_KEY = @User_Role_Mapping_ID
		
	END
GO
/****** Object:  Default [DF_ALRD_SECURITY_USER_IsActivated]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYUSER] ADD  CONSTRAINT [DF_ALRD_SECURITY_USER_IsActivated]  DEFAULT ((0)) FOR [IsActivated]
GO
/****** Object:  ForeignKey [FK_ALRD_DISTRICTINFO_ALRD_DIVISIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_DISTRICTINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_DISTRICTINFO_ALRD_DIVISIONINFO] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[ALRD_DIVISIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_DISTRICTINFO] CHECK CONSTRAINT [FK_ALRD_DISTRICTINFO_ALRD_DIVISIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_DISTRICTINFO_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_DISTRICTINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_DISTRICTINFO_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_DISTRICTINFO] CHECK CONSTRAINT [FK_ALRD_DISTRICTINFO_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_DISTRICTINFO_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_DISTRICTINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_DISTRICTINFO_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_DISTRICTINFO] CHECK CONSTRAINT [FK_ALRD_DISTRICTINFO_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_DIVISIONINFO_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_DIVISIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_DIVISIONINFO_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_DIVISIONINFO] CHECK CONSTRAINT [FK_ALRD_DIVISIONINFO_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_DIVISIONINFO_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_DIVISIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_DIVISIONINFO_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_DIVISIONINFO] CHECK CONSTRAINT [FK_ALRD_DIVISIONINFO_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_DISTRICTINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_DISTRICTINFO] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[ALRD_DISTRICTINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_DISTRICTINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_DIVISIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_DIVISIONINFO] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[ALRD_DIVISIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_DIVISIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_UPAZILAINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_UPAZILAINFO] FOREIGN KEY([UpazilaID])
REFERENCES [dbo].[ALRD_UPAZILAINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTFORESTRYBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTFORESTRYBODYDATA_ALRD_UPAZILAINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_DISTRICTINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_DISTRICTINFO] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[ALRD_DISTRICTINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_DISTRICTINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_DIVISIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_DIVISIONINFO] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[ALRD_DIVISIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_DIVISIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_UPAZILAINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_UPAZILAINFO] FOREIGN KEY([UpazilaID])
REFERENCES [dbo].[ALRD_UPAZILAINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTKHASLANDDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTKHASLANDDATA_ALRD_UPAZILAINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_DISTRICTINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_DISTRICTINFO] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[ALRD_DISTRICTINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_DISTRICTINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_DIVISIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_DIVISIONINFO] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[ALRD_DIVISIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_DIVISIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_UPAZILAINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_UPAZILAINFO] FOREIGN KEY([UpazilaID])
REFERENCES [dbo].[ALRD_UPAZILAINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_GOVERNMENTWATERBODYDATA] CHECK CONSTRAINT [FK_ALRD_GOVERNMENTWATERBODYDATA_ALRD_UPAZILAINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_DISTRICTINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_DISTRICTINFO] FOREIGN KEY([DistrictID])
REFERENCES [dbo].[ALRD_DISTRICTINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_DISTRICTINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_DIVISIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_DIVISIONINFO] FOREIGN KEY([DivisionID])
REFERENCES [dbo].[ALRD_DIVISIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_DIVISIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_ORGANIZATIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_ORGANIZATIONINFO] FOREIGN KEY([CollOrganizationID])
REFERENCES [dbo].[ALRD_ORGANIZATIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_ORGANIZATIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_UNIONINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_UNIONINFO] FOREIGN KEY([UnionID])
REFERENCES [dbo].[ALRD_UNIONINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_UNIONINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONDATA_ALRD_UPAZILAINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_UPAZILAINFO] FOREIGN KEY([UpazilaID])
REFERENCES [dbo].[ALRD_UPAZILAINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONDATA] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONDATA_ALRD_UPAZILAINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONINFO_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONINFO_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONINFO] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONINFO_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_ORGANIZATIONINFO_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_ORGANIZATIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_ORGANIZATIONINFO_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_ORGANIZATIONINFO] CHECK CONSTRAINT [FK_ALRD_ORGANIZATIONINFO_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYFORM_ALRD_SECURITYMENU]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYFORM]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYFORM_ALRD_SECURITYMENU] FOREIGN KEY([MenuID])
REFERENCES [dbo].[ALRD_SECURITYMENU] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYFORM] CHECK CONSTRAINT [FK_ALRD_SECURITYFORM_ALRD_SECURITYMENU]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYFORM_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYFORM]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYFORM_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYFORM] CHECK CONSTRAINT [FK_ALRD_SECURITYFORM_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYFORM_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYFORM]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYFORM_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYFORM] CHECK CONSTRAINT [FK_ALRD_SECURITYFORM_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYMENU_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYMENU]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYMENU_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYMENU] CHECK CONSTRAINT [FK_ALRD_SECURITYMENU_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYMENU_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYMENU]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYMENU_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYMENU] CHECK CONSTRAINT [FK_ALRD_SECURITYMENU_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYROLE_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYROLE]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYROLE_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYROLE] CHECK CONSTRAINT [FK_ALRD_SECURITYROLE_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYROLE_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYROLE]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYROLE_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYROLE] CHECK CONSTRAINT [FK_ALRD_SECURITYROLE_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYFORM]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYFORM] FOREIGN KEY([FormID])
REFERENCES [dbo].[ALRD_SECURITYFORM] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL] CHECK CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYFORM]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYROLE]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYROLE] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ALRD_SECURITYROLE] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL] CHECK CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYROLE]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL] CHECK CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYROLEDETAIL] CHECK CONSTRAINT [FK_ALRD_SECURITYROLEDETAIL_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYUSER_ALRD_SECURITYROLE]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYUSER]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYUSER_ALRD_SECURITYROLE] FOREIGN KEY([RoleID])
REFERENCES [dbo].[ALRD_SECURITYROLE] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYUSER] CHECK CONSTRAINT [FK_ALRD_SECURITYUSER_ALRD_SECURITYROLE]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYUSER_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYUSER]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYUSER_ALRD_SECURITYUSER] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYUSER] CHECK CONSTRAINT [FK_ALRD_SECURITYUSER_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_SECURITYUSER_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_SECURITYUSER]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_SECURITYUSER_ALRD_SECURITYUSER1] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_SECURITYUSER] CHECK CONSTRAINT [FK_ALRD_SECURITYUSER_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_UNIONINFO_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_UNIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_UNIONINFO_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_UNIONINFO] CHECK CONSTRAINT [FK_ALRD_UNIONINFO_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_UNIONINFO_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_UNIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_UNIONINFO_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_UNIONINFO] CHECK CONSTRAINT [FK_ALRD_UNIONINFO_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_UNIONINFO_ALRD_UPAZILAINFO]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_UNIONINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_UNIONINFO_ALRD_UPAZILAINFO] FOREIGN KEY([UpazilaID])
REFERENCES [dbo].[ALRD_UPAZILAINFO] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_UNIONINFO] CHECK CONSTRAINT [FK_ALRD_UNIONINFO_ALRD_UPAZILAINFO]
GO
/****** Object:  ForeignKey [FK_ALRD_UPAZILAINFO_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_UPAZILAINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_UPAZILAINFO_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_UPAZILAINFO] CHECK CONSTRAINT [FK_ALRD_UPAZILAINFO_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_UPAZILAINFO_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_UPAZILAINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_UPAZILAINFO_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_UPAZILAINFO] CHECK CONSTRAINT [FK_ALRD_UPAZILAINFO_ALRD_SECURITYUSER1]
GO
/****** Object:  ForeignKey [FK_ALRD_USERINFO_ALRD_SECURITYUSER]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_USERINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_USERINFO_ALRD_SECURITYUSER] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_USERINFO] CHECK CONSTRAINT [FK_ALRD_USERINFO_ALRD_SECURITYUSER]
GO
/****** Object:  ForeignKey [FK_ALRD_USERINFO_ALRD_SECURITYUSER1]    Script Date: 01/12/2014 22:35:05 ******/
ALTER TABLE [dbo].[ALRD_USERINFO]  WITH CHECK ADD  CONSTRAINT [FK_ALRD_USERINFO_ALRD_SECURITYUSER1] FOREIGN KEY([UpdatedBy])
REFERENCES [dbo].[ALRD_SECURITYUSER] ([COMPID])
GO
ALTER TABLE [dbo].[ALRD_USERINFO] CHECK CONSTRAINT [FK_ALRD_USERINFO_ALRD_SECURITYUSER1]
GO
