CREATE PROCEDURE [dbo].[SP_AddAccountUser]
	@prenom NVARCHAR(50),
	@nom NVARCHAR(50),
	@mail NVARCHAR(50),
	@password NVARCHAR(50),
	@role NVARCHAR(50)
AS
	DECLARE @salt NVARCHAR(8)
	SET @salt=dbo.SF_GenerateSalt();
	INSERT INTO [Utilisateur]([Prenom], [Nom], [Email],[Password],[Salt], [Role])
		OUTPUT @@IDENTITY /*remplace le return 0*/
		VALUES (@prenom, @nom, @mail, dbo.SF_GeneratePWD(CONCAT(@salt, @password)),@salt, @role)
/*RETURN 0*/
