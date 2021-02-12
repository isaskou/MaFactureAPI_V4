CREATE PROCEDURE [dbo].[SP_AddClient]
	@NomSociete nvarchar(50),
	@NumTVA nvarchar(50),
	@ContactId int
AS
	INSERT INTO [Client]([NomSociete], [NumTVA],[ContactId])
	OUTPUT inserted.ClientId
	VALUES (@NomSociete, @NumTVA,@ContactId)
