CREATE TABLE [dbo].[Ligne_Facture]
(
	[LigneId] INT NOT NULL IDENTITY,
	Quantite real NOT NULL, 
	ProductId int NOT NULL,
	FactureId int NOT NULL,
	TypeVente varchar(50) NOT NULL,

	CONSTRAINT PK_LigneID 
		PRIMARY KEY (LigneId),
	CONSTRAINT FK_LigneFC_ProductId 
		FOREIGN KEY (ProductId) 
		references Produit(ProductId),
	CONSTRAINT FK_LigneFC_FactureId 
		FOREIGN KEY (FactureId) 
		REFERENCES Facture(FactureId),
	CONSTRAINT FK_LigneFC_TypeVente 
		FOREIGN KEY (TypeVente) 
		references TypeVente(TypeVente)
)
