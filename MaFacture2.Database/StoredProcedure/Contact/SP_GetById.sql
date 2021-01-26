CREATE PROCEDURE [dbo].[SP_GetById]
	@id INT
AS
	SELECT *
	FROM [Contact]
	WHERE [ContactId]=@id
RETURN 0
