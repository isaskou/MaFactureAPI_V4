CREATE TABLE [dbo].[Magasin_Produit]
(
	MagasinId INT NOT NULL, 
	ProductId INT NOT NULL,

	CONSTRAINT PK_Magasin_Produit primary key (MagasinId, ProductId),
	CONSTRAINT FK_MagasinProduit_MagasinId foreign key (MagasinId) references Magasin(MagasinId),
	CONSTRAINT FK_MagasinProduit_ProductId foreign Key (ProductId) references Produit(ProductId)
)
