CREATE PROCEDURE [dbo].[SP_GetBySurname]
	@surnom NVARCHAR(50)
AS
	SELECT *
	FROM [Contact]
	Where [Surnom]=@surnom
RETURN 0
