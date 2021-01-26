CREATE PROCEDURE [dbo].[SP_GetUserByMail]
	@mail nvarchar(200)
AS
	SELECT [UserId], [Prenom], [Nom], [Email], '********' As [Password], [Role]
		FROM [Utilisateur]
		WHERE [Email]=@mail
RETURN 0

