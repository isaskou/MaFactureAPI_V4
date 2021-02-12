CREATE TABLE [dbo].[Client]
(
	[ClientId] INT NOT NULL IDENTITY,
	NomSociete nvarchar(50) null,
	NumTVA nvarchar(50) NULL UNIQUE,
	ContactId INT NOT NULL,

	CONSTRAINT PK_ClientId PRIMARY KEY (ClientId),
	CONSTRAINT FK_Client_Contact 
		FOREIGN KEY (ContactId) 
		REFERENCES Contact(ContactId) 
		ON DELETE CASCADE 
		ON UPDATE CASCADE
);
