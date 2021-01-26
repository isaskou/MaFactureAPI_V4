CREATE TABLE [dbo].[Fournisseur]
(
	[FournisseurId] INT NOT NULL IDENTITY,
	NomSociete nvarchar(50),
	numTVA nvarchar(50) UNIQUE,
	ContactId INT NOT NULL, 
	
	CONSTRAINT PK_FournisseurId primary key (FournisseurId),
	CONSTRAINT FK_Fournisseur_Contact 
		foreign key (ContactId) 
		REFERENCES Contact(ContactId) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE
)
