CREATE PROCEDURE [dbo].[SP_GetUserById]
	@id int
AS
	SELECT [UserId], [Prenom], [Nom], [Email], '********' As [Password], [Role]
		FROM [Utilisateur]
		WHERE [UserId]=@id
RETURN 0
