CREATE PROCEDURE [dbo].[SP_GetClientByTVA]
	@NumTVA nvarchar(50)
AS
	SELECT *
	FROM [Client]
	Where [NumTVA]=@NumTVA
RETURN 0
