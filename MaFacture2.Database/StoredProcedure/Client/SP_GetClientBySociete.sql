CREATE PROCEDURE [dbo].[SP_GetClientBySociete]
	@NomSociete nvarchar(50)
AS
	SELECT *
	FROM [Client]
	Where [NomSociete]=@NomSociete
RETURN 0
