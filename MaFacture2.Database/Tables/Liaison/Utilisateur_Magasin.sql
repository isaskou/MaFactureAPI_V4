CREATE TABLE [dbo].[Utilisateur_Magasin]
(
	UserId INT NOT NULL,
	MagasinId INT NOT NULL,

	CONSTRAINT PK_Utilisateur_Magasin Primary key (UserId, MagasinId),
	CONSTRAINT FK_UtilisateurMagasin_UserId foreign key (UserId) references Utilisateur(UserId),
	CONSTRAINT FK_UtilisateurMagasin_MagasinId foreign key (MagasinId) references Magasin(MagasinId)
)
