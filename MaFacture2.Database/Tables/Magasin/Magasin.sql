CREATE TABLE [dbo].[Magasin]
(
	[MagasinId] INT NOT NULL IDENTITY,
	Societe nvarchar(50) not null, 
	numTVA nvarchar(50) not null,
	Rue nvarchar(50) not null,
	num nvarchar(50) not null,
	CodePostal nvarchar(50) not null,
	Ville nvarchar(50) not null,
	CGV nvarchar(2500) not null,
	Tel nvarchar(50) null,
	Email nvarchar(50) null,
	Logo nvarchar(50) null,
	SiteWeb nvarchar(200) null,

	CONSTRAINT PK_MagasinID 
		PRIMARY KEY (MagasinId),
	CONSTRAINT CK_EmailShop 
		CHECK (Email LIKE '%@%.%'),
	CONSTRAINT CK_SiteWeb
		CHECK (SiteWeb LIKE '%.%.%')
)
