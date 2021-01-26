CREATE TABLE [dbo].[Facture]
(
	[FactureId] INT NOT NULL IDENTITY,
	DateFacture datetime2 NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Libelle varchar(2000) null, 
	ClientId int NOT NULL, 
	TemplateId int NOT NULL DEFAULT 1,
	Etat varchar(255) NOT NULL DEFAULT 'Draft', 
	MagasinId int NOT NULL,
	MoyensPaiement varchar(50) null,
	DatePaiement datetime2 null,
	MontantPaiement decimal null

	CONSTRAINT PK_FactureId 
		primary key (FactureId),
	CONSTRAINT FK_Facture_ClientId 
		Foreign key (ClientId) 
		references Client(ClientId)
		ON UPDATE CASCADE,
	CONSTRAINT FK_Facture_TemplateFC 
		foreign key(TemplateId) 
		references TemplateFC(TemplateId),
	CONSTRAINT FK_Facture_EtatFC 
		foreign key(Etat) 
		references EtatFC(NomEtat)
		ON UPDATE CASCADE,
	CONSTRAINT FK_Facture_MagasinId 
		foreign key(MagasinId) 
		references Magasin(MagasinId)
		ON UPDATE CASCADE,
	CONSTRAINT FK_Facture_MoyensPaiement 
		foreign key(MoyensPaiement) 
		references MoyensPaiement(NomPaiement),
	CONSTRAINT CK_DateFacture
		CHECK (YEAR(DateFacture)>2020),
	CONSTRAINT CK_DatePaiement
		CHECK (YEAR(DatePaiement)>2020), 
)
