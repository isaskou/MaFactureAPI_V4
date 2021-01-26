CREATE TABLE [dbo].[Caisse]
(
	[CaisseId] INT NOT NULL IDENTITY,
	DateCaisse datetime2 NOT NULL DEFAULT Current_timestamp,
	Montant decimal(10,2) NOT NULL ,
	MoyenPaiement varchar(50) NOT NULL, 
	UserId int NOT NULL,
	MagasinId int NOT NULL,

	CONSTRAINT PK_CaisseId 
		Primary Key (CaisseId),
	CONSTRAINT FK_Caisse_UserId 
		Foreign key (UserId) 
		references Utilisateur(UserId) 
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Caisse_MagasinId 
		foreign key (MagasinId) 
		references Magasin(MagasinId),
	CONSTRAINT CK_Montant_Sup0 
		CHECK (Montant >0.00),
	CONSTRAINT CK_Date_Valide
		CHECK (YEAR(DateCaisse)>2020) 

)
