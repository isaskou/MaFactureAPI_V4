CREATE TABLE [dbo].[Paiement_Caisse]
(
	[NomPaiement] varchar(50) NOT NULL, 
	CaisseId INT NOT NULL,

	CONSTRAINT PK_Caisse_Paiement primary key (NomPaiement, CaisseId),
	CONSTRAINT FK_PaiementCaisse_Paiement foreign key (NomPaiement) references MoyensPaiement(NomPaiement),
	CONSTRAINT FK_PaiementCaisse_CaisseId foreign key (CaisseId) references Caisse(CaisseId)
)
