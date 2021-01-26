CREATE PROCEDURE [dbo].[SP_GetByName]
	@nom NVARCHAR(50)
AS
	SELECT *
	FROM [Contact]
	WHERE [Nom]=@nom
RETURN 0
