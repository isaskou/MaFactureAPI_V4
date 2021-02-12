CREATE PROCEDURE [dbo].[SP_UpdateClient]
	@ClientId int,
	@NomSociete nvarchar(50),
	@NumTVA nvarchar(50),
	@ContactId int
AS
	BEGIN
		UPDATE Client
		SET NomSociete=@NomSociete, NumTVA=@NumTVA, ContactId=@ContactId
		WHERE ClientId=@ClientId
	END
