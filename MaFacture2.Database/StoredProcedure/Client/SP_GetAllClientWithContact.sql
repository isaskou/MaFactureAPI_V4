CREATE PROCEDURE [dbo].[SP_GetAllClientWithContact]
	
AS
	SELECT cl.ClientId, co.Prenom, co.Nom, co.Surnom, co.Tel, co.Email, co.Rue, co.Num, co.CodePostal, co.Ville, co.Pays, cl.NomSociete, cl.NumTVA
	FROM Client cl, Contact co
	WHERE co.ContactId=cl.ContactId
RETURN 0
