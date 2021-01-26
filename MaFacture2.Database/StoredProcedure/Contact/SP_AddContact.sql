CREATE PROCEDURE [dbo].[SP_AddContact]
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
	INSERT INTO [Contact]([Prenom],[Nom],[Surnom],[Tel],[Email], [Rue], [Num] ,[CodePostal] ,[Ville] ,[Pays])
	OUTPUT inserted.ContactId
	VALUES (@Prenom,@Nom,@Surnom,@Tel,@Email,@Rue,@Num ,@CodePostal ,@Ville ,@Pays)
