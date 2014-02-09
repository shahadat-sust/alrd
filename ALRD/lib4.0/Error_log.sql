											 
CREATE TABLE Error_Log(
	LogID int IDENTITY(1,1) NOT NULL,
	Severity nvarchar(32) NOT NULL,
	Title nvarchar(256) NOT NULL,
	LogDate datetime NOT NULL,
	Message text NOT NULL,
	InnerMessage text NULL,
	ClassName nvarchar(150) NOT NULL,
	MethodName nvarchar(150) NOT NULL,
	LoginUserID bigint NOT NULL,
 CONSTRAINT PK_CUSTOMLog PRIMARY KEY CLUSTERED 
(
	LogID ASC
))

GO

Create PROCEDURE CustomWriteLog
(

	@Severity nvarchar(32), 
	@Title nvarchar(256), 
	@Message Text=null,
	@InnerMessage Text =null,
	@ClassName ntext=null,
	@MethodName ntext=null,
	@LoginUserID bigint,
	@LogId int OUTPUT
)
AS 

Begin
INSERT INTO Error_Log
           (
           Severity
           ,Title
           ,LogDate
           ,Message
           ,InnerMessage
           ,ClassName
           ,MethodName
           ,LoginUserID
           )
     VALUES
           (
           @Severity, 
		@Title, 
		GETDATE(),
		@Message
		 ,@InnerMessage
           ,@ClassName
           ,@MethodName
           ,@LoginUserID
           )
		



	SET @LogID = @@IDENTITY
	RETURN @LogID

End
GO

