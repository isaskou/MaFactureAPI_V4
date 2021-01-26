CREATE PROCEDURE [dbo].[SP_UpdateContact]
	@ContactId int,
	@Prenom nvarchar(50),
	@Nom nvarchar(50),
	@Surnom nvarchar(50),
	@Tel nvarchar(50),
	@Email nvarchar(50),
	@Rue nvarchar(50),
	@Num nvarchar(50),
	@CodePostal nvarchar(50),
	@Ville nvarchar(50),
	@Pays nvarchar(50)
AS
BEGIN
	UPDATE Contact 
	SET Prenom=@Prenom, Nom=@Nom, Surnom=@Surnom, Tel=@Tel, Email=@Email, Rue=@Rue, Num=@Num, CodePostal=@CodePostal, Ville=@Ville, Pays=@Pays
	WHERE ContactId=@ContactId
END