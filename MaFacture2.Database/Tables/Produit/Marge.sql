CREATE TABLE [dbo].[Marge]
(
	[MargeId] INT NOT NULL IDENTITY,
	MargeHoreca decimal(10,2) NOT null, 
	MargeComptoir decimal(10,2) NOT null,
	DateMarge datetime2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ProductId int not null,

	CONSTRAINT PK_MargeId
		PRIMARY KEY (MargeId),
	CONSTRAINT FK_ProductId
		FOREIGN KEY (ProductId)
		REFERENCES Produit(ProductId),
	CONSTRAINT CK_MargeHoreca
		CHECK (MargeHoreca>=0),
	CONSTRAINT CK_MargeComptoir
		CHECK (MargeComptoir>=0)
)
