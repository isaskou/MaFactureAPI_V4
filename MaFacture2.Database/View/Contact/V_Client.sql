CREATE VIEW [dbo].[V_Client]
	AS SELECT cl.NomSociete,cl.NumTVA, co.Prenom, co.Nom, co.Surnom, co.Email, co.Tel, co.Rue, co.Num, co.CodePostal, co.Ville, co.Pays
 FROM Contact co, Client cl
 WHERE co.ContactId=cl.ContactId
 
 


	--CREATE VIEW [dbo].[V_Users]
	--AS SELECT [UserId], [Prenom], [Nom], [Email], [Role] 
	--FROM [Utilisateur]
