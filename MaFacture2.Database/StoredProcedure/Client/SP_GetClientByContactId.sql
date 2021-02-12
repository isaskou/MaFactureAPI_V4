CREATE PROCEDURE [dbo].[SP_GetClientByContactId]
	@ContactId int
AS
	SELECT *
	FROM [Client]
	WHERE [ContactId]=@ContactId
RETURN 0
