CREATE TABLE [dbo].[Contact_Magasin]
(
	ContactId INT NOT NULL, 
	MagasinId INT NOT NULL,

	Constraint PK_ContactMagasin 
		primary key(ContactId, MagasinId),
	Constraint FK_ContactMagasin_ContactId 
		foreign key (ContactId) 
		references Contact(ContactId),
	Constraint FK_ContactMagasin_MagasinId 
		foreign key (MagasinId) 
		references Magasin(MagasinId),
)
