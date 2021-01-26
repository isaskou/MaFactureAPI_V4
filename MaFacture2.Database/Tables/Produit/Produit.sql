CREATE TABLE [dbo].[Produit]
(
	[ProductId] INT NOT NULL IDENTITY,
	Nom nvarchar(50) not null,
	[Description] nvarchar(220) null,
	FournisseurId INT NOT NULL,
	TauxTVA decimal(4,2) NOT NULL,
	Famille nvarchar(50) NOT NULL,

	CONSTRAINT PK_ProductId
		PRIMARY KEY (ProductId),
	CONSTRAINT FK_Produit_FournisseurId 
		FOREIGN KEY (FournisseurId)
		REFERENCES Fournisseur(FournisseurId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Produit_TauxTVA 
		FOREIGN KEY (TauxTVA)
		REFERENCES TauxTVA(TauxTVA)
		ON UPDATE CASCADE,
	CONSTRAINT FK_Produit_FamilleProduit
		FOREIGN KEY (Famille)
		REFERENCES FamilleProduit(Famille)
		ON UPDATE CASCADE,
)
