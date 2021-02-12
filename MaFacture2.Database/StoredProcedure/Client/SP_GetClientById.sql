CREATE PROCEDURE [dbo].[SP_GetClientById]
	@ClientId INT
AS
	SELECT *
	FROM [Client]
	WHERE [ClientId]=@ClientId
RETURN 0
