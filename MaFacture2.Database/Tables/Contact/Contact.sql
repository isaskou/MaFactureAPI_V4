CREATE TABLE [dbo].[Contact]
(
	[ContactId] INT NOT NULL IDENTITY,
	Prenom nvarchar(50),
	Nom nvarchar(50),
	Surnom nvarchar(50),
	Tel nvarchar(50),
	Email nvarchar(50),
	Rue nvarchar(50),
	Num nvarchar(50),
	CodePostal nvarchar(50),
	Ville nvarchar(50),
	Pays nvarchar(50),

	CONSTRAINT PK_ContactId 
		PRIMARY KEY (ContactId),

	CONSTRAINT CK_Contact_Email
		CHECK (Email LIKE '%@%.%')
)