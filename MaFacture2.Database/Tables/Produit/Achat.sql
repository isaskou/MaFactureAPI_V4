CREATE TABLE [dbo].[Achat]
(
	[AchatId] INT NOT NULL IDENTITY,
	PrixAchat decimal(10,2) not null,
	DateAchat datetime not null DEFAULT CURRENT_TIMESTAMP,
	ProductId int not null,

	CONSTRAINT PK_Achat 
		primary KEY(AchatId),
	CONSTRAINT UK_DateAchat 
		UNIQUE(DateAchat),
	CONSTRAINT FK_Achat_produit
		FOREIGN KEY (ProductId)
		REFERENCES Produit(ProductId),
	CONSTRAINT CK_PrixAchat
		CHECK (PrixAchat>=0.00),
	CONSTRAINT CK_DateAchat
		CHECK (YEAR(DateAchat)>2021)
)
