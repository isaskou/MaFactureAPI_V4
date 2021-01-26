CREATE PROCEDURE [dbo].[SP-GetByMail]
	@email NVARCHAR(200)
AS
	SELECT *
	FROM [Contact]
	WHERE [Email]=@email
RETURN 0
