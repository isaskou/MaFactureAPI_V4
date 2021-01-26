CREATE TABLE [dbo].[TemplateFC]
(
	[TemplateId] INT NOT NULL IDENTITY,
	Nom varchar(50) NOT NULL,
	Fichier varchar(255) NOT NULL,
	[ModifiedDate] datetime2 not null DEFAULT Current_TimeStamp

	CONSTRAINT PK_TemplateId
		PRIMARY KEY (TemplateId),
	
)
