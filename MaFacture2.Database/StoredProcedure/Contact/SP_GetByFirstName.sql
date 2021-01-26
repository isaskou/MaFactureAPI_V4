CREATE PROCEDURE [dbo].[SP_GetByFirstName]
	@prenom nvarchar(50)
AS
	SELECT *
	FROM [Contact]
	WHERE [Prenom]=@prenom
RETURN 0
