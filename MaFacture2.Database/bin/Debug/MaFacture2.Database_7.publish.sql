/*
Script de déploiement pour MaFacture2.Database

Ce code a été généré par un outil.
La modification de ce fichier peut provoquer un comportement incorrect et sera perdue si
le code est régénéré.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "MaFacture2.Database"
:setvar DefaultFilePrefix "MaFacture2.Database"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\"

GO
:on error exit
GO
/*
Détectez le mode SQLCMD et désactivez l'exécution du script si le mode SQLCMD n'est pas pris en charge.
Pour réactiver le script une fois le mode SQLCMD activé, exécutez ce qui suit :
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'Le mode SQLCMD doit être activé de manière à pouvoir exécuter ce script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Création de $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'Impossible de modifier les paramètres de base de données. Vous devez être administrateur système pour appliquer ces paramètres.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET TEMPORAL_HISTORY_RETENTION ON 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Création de [dbo].[Achat]...';


GO
CREATE TABLE [dbo].[Achat] (
    [AchatId]   INT             IDENTITY (1, 1) NOT NULL,
    [PrixAchat] DECIMAL (10, 2) NOT NULL,
    [DateAchat] DATETIME        NOT NULL,
    [ProductId] INT             NOT NULL,
    CONSTRAINT [PK_Achat] PRIMARY KEY CLUSTERED ([AchatId] ASC),
    CONSTRAINT [UK_DateAchat] UNIQUE NONCLUSTERED ([DateAchat] ASC)
);


GO
PRINT N'Création de [dbo].[Caisse]...';


GO
CREATE TABLE [dbo].[Caisse] (
    [CaisseId]      INT             IDENTITY (1, 1) NOT NULL,
    [DateCaisse]    DATETIME2 (7)   NOT NULL,
    [Montant]       DECIMAL (10, 2) NOT NULL,
    [MoyenPaiement] VARCHAR (50)    NOT NULL,
    [UserId]        INT             NOT NULL,
    [MagasinId]     INT             NOT NULL,
    CONSTRAINT [PK_CaisseId] PRIMARY KEY CLUSTERED ([CaisseId] ASC)
);


GO
PRINT N'Création de [dbo].[Client]...';


GO
CREATE TABLE [dbo].[Client] (
    [ClientId]   INT           IDENTITY (1, 1) NOT NULL,
    [NomSociete] NVARCHAR (50) NULL,
    [NumTVA]     NVARCHAR (50) NULL,
    [ContactId]  INT           NOT NULL,
    CONSTRAINT [PK_ClientId] PRIMARY KEY CLUSTERED ([ClientId] ASC),
    UNIQUE NONCLUSTERED ([NumTVA] ASC)
);


GO
PRINT N'Création de [dbo].[Contact]...';


GO
CREATE TABLE [dbo].[Contact] (
    [ContactId]  INT           IDENTITY (1, 1) NOT NULL,
    [Prenom]     NVARCHAR (50) NULL,
    [Nom]        NVARCHAR (50) NULL,
    [Surnom]     NVARCHAR (50) NULL,
    [Tel]        NVARCHAR (50) NULL,
    [Email]      NVARCHAR (50) NULL,
    [Rue]        NVARCHAR (50) NULL,
    [Num]        NVARCHAR (50) NULL,
    [CodePostal] NVARCHAR (50) NULL,
    [Ville]      NVARCHAR (50) NULL,
    [Pays]       NVARCHAR (50) NULL,
    CONSTRAINT [PK_ContactId] PRIMARY KEY CLUSTERED ([ContactId] ASC)
);


GO
PRINT N'Création de [dbo].[Contact_Magasin]...';


GO
CREATE TABLE [dbo].[Contact_Magasin] (
    [ContactId] INT NOT NULL,
    [MagasinId] INT NOT NULL,
    CONSTRAINT [PK_ContactMagasin] PRIMARY KEY CLUSTERED ([ContactId] ASC, [MagasinId] ASC)
);


GO
PRINT N'Création de [dbo].[EtatFC]...';


GO
CREATE TABLE [dbo].[EtatFC] (
    [NomEtat] VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([NomEtat] ASC)
);


GO
PRINT N'Création de [dbo].[Facture]...';


GO
CREATE TABLE [dbo].[Facture] (
    [FactureId]       INT            IDENTITY (1, 1) NOT NULL,
    [DateFacture]     DATETIME2 (7)  NOT NULL,
    [Libelle]         VARCHAR (2000) NULL,
    [ClientId]        INT            NOT NULL,
    [TemplateId]      INT            NOT NULL,
    [Etat]            VARCHAR (255)  NOT NULL,
    [MagasinId]       INT            NOT NULL,
    [MoyensPaiement]  VARCHAR (50)   NULL,
    [DatePaiement]    DATETIME2 (7)  NULL,
    [MontantPaiement] DECIMAL (18)   NULL,
    CONSTRAINT [PK_FactureId] PRIMARY KEY CLUSTERED ([FactureId] ASC)
);


GO
PRINT N'Création de [dbo].[FamilleProduit]...';


GO
CREATE TABLE [dbo].[FamilleProduit] (
    [Famille] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Famille] ASC)
);


GO
PRINT N'Création de [dbo].[Fournisseur]...';


GO
CREATE TABLE [dbo].[Fournisseur] (
    [FournisseurId] INT           IDENTITY (1, 1) NOT NULL,
    [NomSociete]    NVARCHAR (50) NULL,
    [numTVA]        NVARCHAR (50) NULL,
    [ContactId]     INT           NOT NULL,
    CONSTRAINT [PK_FournisseurId] PRIMARY KEY CLUSTERED ([FournisseurId] ASC),
    UNIQUE NONCLUSTERED ([numTVA] ASC)
);


GO
PRINT N'Création de [dbo].[Ligne_Facture]...';


GO
CREATE TABLE [dbo].[Ligne_Facture] (
    [LigneId]   INT          IDENTITY (1, 1) NOT NULL,
    [Quantite]  REAL         NOT NULL,
    [ProductId] INT          NOT NULL,
    [FactureId] INT          NOT NULL,
    [TypeVente] VARCHAR (50) NOT NULL,
    CONSTRAINT [PK_LigneID] PRIMARY KEY CLUSTERED ([LigneId] ASC)
);


GO
PRINT N'Création de [dbo].[Magasin]...';


GO
CREATE TABLE [dbo].[Magasin] (
    [MagasinId]  INT             IDENTITY (1, 1) NOT NULL,
    [Societe]    NVARCHAR (50)   NOT NULL,
    [numTVA]     NVARCHAR (50)   NOT NULL,
    [Rue]        NVARCHAR (50)   NOT NULL,
    [num]        NVARCHAR (50)   NOT NULL,
    [CodePostal] NVARCHAR (50)   NOT NULL,
    [Ville]      NVARCHAR (50)   NOT NULL,
    [CGV]        NVARCHAR (2500) NOT NULL,
    [Tel]        NVARCHAR (50)   NULL,
    [Email]      NVARCHAR (50)   NULL,
    [Logo]       NVARCHAR (50)   NULL,
    [SiteWeb]    NVARCHAR (200)  NULL,
    CONSTRAINT [PK_MagasinID] PRIMARY KEY CLUSTERED ([MagasinId] ASC)
);


GO
PRINT N'Création de [dbo].[Magasin_Produit]...';


GO
CREATE TABLE [dbo].[Magasin_Produit] (
    [MagasinId] INT NOT NULL,
    [ProductId] INT NOT NULL,
    CONSTRAINT [PK_Magasin_Produit] PRIMARY KEY CLUSTERED ([MagasinId] ASC, [ProductId] ASC)
);


GO
PRINT N'Création de [dbo].[Marge]...';


GO
CREATE TABLE [dbo].[Marge] (
    [MargeId]       INT             IDENTITY (1, 1) NOT NULL,
    [MargeHoreca]   DECIMAL (10, 2) NOT NULL,
    [MargeComptoir] DECIMAL (10, 2) NOT NULL,
    [DateMarge]     DATETIME2 (7)   NOT NULL,
    [ProductId]     INT             NOT NULL,
    CONSTRAINT [PK_MargeId] PRIMARY KEY CLUSTERED ([MargeId] ASC)
);


GO
PRINT N'Création de [dbo].[MoyensPaiement]...';


GO
CREATE TABLE [dbo].[MoyensPaiement] (
    [NomPaiement] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([NomPaiement] ASC)
);


GO
PRINT N'Création de [dbo].[Paiement_Caisse]...';


GO
CREATE TABLE [dbo].[Paiement_Caisse] (
    [NomPaiement] VARCHAR (50) NOT NULL,
    [CaisseId]    INT          NOT NULL,
    CONSTRAINT [PK_Caisse_Paiement] PRIMARY KEY CLUSTERED ([NomPaiement] ASC, [CaisseId] ASC)
);


GO
PRINT N'Création de [dbo].[Produit]...';


GO
CREATE TABLE [dbo].[Produit] (
    [ProductId]     INT            IDENTITY (1, 1) NOT NULL,
    [Nom]           NVARCHAR (50)  NOT NULL,
    [Description]   NVARCHAR (220) NULL,
    [FournisseurId] INT            NOT NULL,
    [TauxTVA]       DECIMAL (4, 2) NOT NULL,
    [Famille]       NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_ProductId] PRIMARY KEY CLUSTERED ([ProductId] ASC)
);


GO
PRINT N'Création de [dbo].[Role]...';


GO
CREATE TABLE [dbo].[Role] (
    [Nom] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Nom] ASC)
);


GO
PRINT N'Création de [dbo].[TauxTVA]...';


GO
CREATE TABLE [dbo].[TauxTVA] (
    [TauxTVA] DECIMAL (4, 2) NOT NULL,
    PRIMARY KEY CLUSTERED ([TauxTVA] ASC)
);


GO
PRINT N'Création de [dbo].[TemplateFC]...';


GO
CREATE TABLE [dbo].[TemplateFC] (
    [TemplateId]   INT           IDENTITY (1, 1) NOT NULL,
    [Nom]          VARCHAR (50)  NOT NULL,
    [Fichier]      VARCHAR (255) NOT NULL,
    [ModifiedDate] DATETIME2 (7) NOT NULL,
    CONSTRAINT [PK_TemplateId] PRIMARY KEY CLUSTERED ([TemplateId] ASC)
);


GO
PRINT N'Création de [dbo].[TypeVente]...';


GO
CREATE TABLE [dbo].[TypeVente] (
    [TypeVente] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([TypeVente] ASC)
);


GO
PRINT N'Création de [dbo].[Utilisateur]...';


GO
CREATE TABLE [dbo].[Utilisateur] (
    [UserId]   INT            IDENTITY (1, 1) NOT NULL,
    [Prenom]   NVARCHAR (50)  NOT NULL,
    [Nom]      NVARCHAR (50)  NOT NULL,
    [Email]    NVARCHAR (200) NOT NULL,
    [Password] VARBINARY (32) NOT NULL,
    [Salt]     NVARCHAR (50)  NOT NULL,
    [Role]     NVARCHAR (50)  NOT NULL,
    CONSTRAINT [PK_UserId] PRIMARY KEY CLUSTERED ([UserId] ASC),
    UNIQUE NONCLUSTERED ([Email] ASC)
);


GO
PRINT N'Création de [dbo].[Utilisateur_Magasin]...';


GO
CREATE TABLE [dbo].[Utilisateur_Magasin] (
    [UserId]    INT NOT NULL,
    [MagasinId] INT NOT NULL,
    CONSTRAINT [PK_Utilisateur_Magasin] PRIMARY KEY CLUSTERED ([UserId] ASC, [MagasinId] ASC)
);


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Achat]...';


GO
ALTER TABLE [dbo].[Achat]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [DateAchat];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Caisse]...';


GO
ALTER TABLE [dbo].[Caisse]
    ADD DEFAULT Current_timestamp FOR [DateCaisse];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Facture]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [DateFacture];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Facture]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD DEFAULT 1 FOR [TemplateId];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Facture]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD DEFAULT 'Draft' FOR [Etat];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[Marge]...';


GO
ALTER TABLE [dbo].[Marge]
    ADD DEFAULT CURRENT_TIMESTAMP FOR [DateMarge];


GO
PRINT N'Création de contrainte sans nom sur [dbo].[TemplateFC]...';


GO
ALTER TABLE [dbo].[TemplateFC]
    ADD DEFAULT Current_TimeStamp FOR [ModifiedDate];


GO
PRINT N'Création de [dbo].[FK_Achat_produit]...';


GO
ALTER TABLE [dbo].[Achat]
    ADD CONSTRAINT [FK_Achat_produit] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Produit] ([ProductId]);


GO
PRINT N'Création de [dbo].[FK_Caisse_UserId]...';


GO
ALTER TABLE [dbo].[Caisse]
    ADD CONSTRAINT [FK_Caisse_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Utilisateur] ([UserId]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Caisse_MagasinId]...';


GO
ALTER TABLE [dbo].[Caisse]
    ADD CONSTRAINT [FK_Caisse_MagasinId] FOREIGN KEY ([MagasinId]) REFERENCES [dbo].[Magasin] ([MagasinId]);


GO
PRINT N'Création de [dbo].[FK_Client_Contact]...';


GO
ALTER TABLE [dbo].[Client]
    ADD CONSTRAINT [FK_Client_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_ContactMagasin_ContactId]...';


GO
ALTER TABLE [dbo].[Contact_Magasin]
    ADD CONSTRAINT [FK_ContactMagasin_ContactId] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId]);


GO
PRINT N'Création de [dbo].[FK_ContactMagasin_MagasinId]...';


GO
ALTER TABLE [dbo].[Contact_Magasin]
    ADD CONSTRAINT [FK_ContactMagasin_MagasinId] FOREIGN KEY ([MagasinId]) REFERENCES [dbo].[Magasin] ([MagasinId]);


GO
PRINT N'Création de [dbo].[FK_Facture_ClientId]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [FK_Facture_ClientId] FOREIGN KEY ([ClientId]) REFERENCES [dbo].[Client] ([ClientId]) ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Facture_TemplateFC]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [FK_Facture_TemplateFC] FOREIGN KEY ([TemplateId]) REFERENCES [dbo].[TemplateFC] ([TemplateId]);


GO
PRINT N'Création de [dbo].[FK_Facture_EtatFC]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [FK_Facture_EtatFC] FOREIGN KEY ([Etat]) REFERENCES [dbo].[EtatFC] ([NomEtat]) ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Facture_MagasinId]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [FK_Facture_MagasinId] FOREIGN KEY ([MagasinId]) REFERENCES [dbo].[Magasin] ([MagasinId]) ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Facture_MoyensPaiement]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [FK_Facture_MoyensPaiement] FOREIGN KEY ([MoyensPaiement]) REFERENCES [dbo].[MoyensPaiement] ([NomPaiement]);


GO
PRINT N'Création de [dbo].[FK_Fournisseur_Contact]...';


GO
ALTER TABLE [dbo].[Fournisseur]
    ADD CONSTRAINT [FK_Fournisseur_Contact] FOREIGN KEY ([ContactId]) REFERENCES [dbo].[Contact] ([ContactId]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_LigneFC_ProductId]...';


GO
ALTER TABLE [dbo].[Ligne_Facture]
    ADD CONSTRAINT [FK_LigneFC_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Produit] ([ProductId]);


GO
PRINT N'Création de [dbo].[FK_LigneFC_FactureId]...';


GO
ALTER TABLE [dbo].[Ligne_Facture]
    ADD CONSTRAINT [FK_LigneFC_FactureId] FOREIGN KEY ([FactureId]) REFERENCES [dbo].[Facture] ([FactureId]);


GO
PRINT N'Création de [dbo].[FK_LigneFC_TypeVente]...';


GO
ALTER TABLE [dbo].[Ligne_Facture]
    ADD CONSTRAINT [FK_LigneFC_TypeVente] FOREIGN KEY ([TypeVente]) REFERENCES [dbo].[TypeVente] ([TypeVente]);


GO
PRINT N'Création de [dbo].[FK_MagasinProduit_MagasinId]...';


GO
ALTER TABLE [dbo].[Magasin_Produit]
    ADD CONSTRAINT [FK_MagasinProduit_MagasinId] FOREIGN KEY ([MagasinId]) REFERENCES [dbo].[Magasin] ([MagasinId]);


GO
PRINT N'Création de [dbo].[FK_MagasinProduit_ProductId]...';


GO
ALTER TABLE [dbo].[Magasin_Produit]
    ADD CONSTRAINT [FK_MagasinProduit_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Produit] ([ProductId]);


GO
PRINT N'Création de [dbo].[FK_ProductId]...';


GO
ALTER TABLE [dbo].[Marge]
    ADD CONSTRAINT [FK_ProductId] FOREIGN KEY ([ProductId]) REFERENCES [dbo].[Produit] ([ProductId]);


GO
PRINT N'Création de [dbo].[FK_PaiementCaisse_Paiement]...';


GO
ALTER TABLE [dbo].[Paiement_Caisse]
    ADD CONSTRAINT [FK_PaiementCaisse_Paiement] FOREIGN KEY ([NomPaiement]) REFERENCES [dbo].[MoyensPaiement] ([NomPaiement]);


GO
PRINT N'Création de [dbo].[FK_PaiementCaisse_CaisseId]...';


GO
ALTER TABLE [dbo].[Paiement_Caisse]
    ADD CONSTRAINT [FK_PaiementCaisse_CaisseId] FOREIGN KEY ([CaisseId]) REFERENCES [dbo].[Caisse] ([CaisseId]);


GO
PRINT N'Création de [dbo].[FK_Produit_FournisseurId]...';


GO
ALTER TABLE [dbo].[Produit]
    ADD CONSTRAINT [FK_Produit_FournisseurId] FOREIGN KEY ([FournisseurId]) REFERENCES [dbo].[Fournisseur] ([FournisseurId]) ON DELETE CASCADE ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Produit_TauxTVA]...';


GO
ALTER TABLE [dbo].[Produit]
    ADD CONSTRAINT [FK_Produit_TauxTVA] FOREIGN KEY ([TauxTVA]) REFERENCES [dbo].[TauxTVA] ([TauxTVA]) ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Produit_FamilleProduit]...';


GO
ALTER TABLE [dbo].[Produit]
    ADD CONSTRAINT [FK_Produit_FamilleProduit] FOREIGN KEY ([Famille]) REFERENCES [dbo].[FamilleProduit] ([Famille]) ON UPDATE CASCADE;


GO
PRINT N'Création de [dbo].[FK_Utilisateur_Role]...';


GO
ALTER TABLE [dbo].[Utilisateur]
    ADD CONSTRAINT [FK_Utilisateur_Role] FOREIGN KEY ([Role]) REFERENCES [dbo].[Role] ([Nom]);


GO
PRINT N'Création de [dbo].[FK_UtilisateurMagasin_UserId]...';


GO
ALTER TABLE [dbo].[Utilisateur_Magasin]
    ADD CONSTRAINT [FK_UtilisateurMagasin_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[Utilisateur] ([UserId]);


GO
PRINT N'Création de [dbo].[FK_UtilisateurMagasin_MagasinId]...';


GO
ALTER TABLE [dbo].[Utilisateur_Magasin]
    ADD CONSTRAINT [FK_UtilisateurMagasin_MagasinId] FOREIGN KEY ([MagasinId]) REFERENCES [dbo].[Magasin] ([MagasinId]);


GO
PRINT N'Création de [dbo].[CK_PrixAchat]...';


GO
ALTER TABLE [dbo].[Achat]
    ADD CONSTRAINT [CK_PrixAchat] CHECK (PrixAchat>=0.00);


GO
PRINT N'Création de [dbo].[CK_DateAchat]...';


GO
ALTER TABLE [dbo].[Achat]
    ADD CONSTRAINT [CK_DateAchat] CHECK (YEAR(DateAchat)>2021);


GO
PRINT N'Création de [dbo].[CK_Montant_Sup0]...';


GO
ALTER TABLE [dbo].[Caisse]
    ADD CONSTRAINT [CK_Montant_Sup0] CHECK (Montant >0.00);


GO
PRINT N'Création de [dbo].[CK_Date_Valide]...';


GO
ALTER TABLE [dbo].[Caisse]
    ADD CONSTRAINT [CK_Date_Valide] CHECK (YEAR(DateCaisse)>2020);


GO
PRINT N'Création de [dbo].[CK_Contact_Email]...';


GO
ALTER TABLE [dbo].[Contact]
    ADD CONSTRAINT [CK_Contact_Email] CHECK (Email LIKE '%@%.%');


GO
PRINT N'Création de [dbo].[CK_DateFacture]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [CK_DateFacture] CHECK (YEAR(DateFacture)>2020);


GO
PRINT N'Création de [dbo].[CK_DatePaiement]...';


GO
ALTER TABLE [dbo].[Facture]
    ADD CONSTRAINT [CK_DatePaiement] CHECK (YEAR(DatePaiement)>2020);


GO
PRINT N'Création de [dbo].[CK_EmailShop]...';


GO
ALTER TABLE [dbo].[Magasin]
    ADD CONSTRAINT [CK_EmailShop] CHECK (Email LIKE '%@%.%');


GO
PRINT N'Création de [dbo].[CK_SiteWeb]...';


GO
ALTER TABLE [dbo].[Magasin]
    ADD CONSTRAINT [CK_SiteWeb] CHECK (SiteWeb LIKE '%.%.%');


GO
PRINT N'Création de [dbo].[CK_MargeHoreca]...';


GO
ALTER TABLE [dbo].[Marge]
    ADD CONSTRAINT [CK_MargeHoreca] CHECK (MargeHoreca>=0);


GO
PRINT N'Création de [dbo].[CK_MargeComptoir]...';


GO
ALTER TABLE [dbo].[Marge]
    ADD CONSTRAINT [CK_MargeComptoir] CHECK (MargeComptoir>=0);


GO
PRINT N'Création de [dbo].[CK_EmailUser]...';


GO
ALTER TABLE [dbo].[Utilisateur]
    ADD CONSTRAINT [CK_EmailUser] CHECK (Email LIKE '%@%.%');


GO
PRINT N'Création de [dbo].[V_Client]...';


GO
CREATE VIEW [dbo].[V_Client]
	AS SELECT cl.NomSociete,cl.NumTVA, co.Prenom, co.Nom, co.Surnom, co.Email, co.Tel, co.Rue, co.Num, co.CodePostal, co.Ville, co.Pays
 FROM Contact co, Client cl
 WHERE co.ContactId=cl.ContactId
 
 


	--CREATE VIEW [dbo].[V_Users]
	--AS SELECT [UserId], [Prenom], [Nom], [Email], [Role] 
	--FROM [Utilisateur]
GO
PRINT N'Création de [dbo].[V_GetRandom]...';


GO
CREATE VIEW [dbo].[V_GetRandom]
	AS SELECT FLOOR(RAND()*10) AS RandomValue
GO
PRINT N'Création de [dbo].[V_Users]...';


GO
CREATE VIEW [dbo].[V_Users]
	AS SELECT [UserId], [Prenom], [Nom], [Email], [Role] 
	FROM [Utilisateur]
GO
PRINT N'Création de [dbo].[SF_GeneratePWD]...';


GO
CREATE FUNCTION [dbo].[SF_GeneratePWD]
(
	@pwd nvarchar(58)
)
RETURNS VARBINARY(32)
AS
BEGIN
	RETURN HASHBYTES ('SHA2_256', @pwd)
END
GO
PRINT N'Création de [dbo].[SF_GenerateSalt]...';


GO
CREATE FUNCTION [dbo].[SF_GenerateSalt]
()
RETURNS NVARCHAR(8)
AS
BEGIN
DECLARE @saltResult NVARCHAR(8),
@randomValue SMALLINT,
@i SMALLINT
SET @i = 0;
WHILE @i < 8
BEGIN
SET @randomValue = (SELECT [RandomValue] FROM [V_GetRandom]);
SET @saltResult = CONCAT(@saltResult,@randomValue);
SET @i = @i + 1;
END

 RETURN @saltResult;
END
GO
PRINT N'Création de [dbo].[SP_AddAccountUser]...';


GO
CREATE PROCEDURE [dbo].[SP_AddAccountUser]
	@prenom NVARCHAR(50),
	@nom NVARCHAR(50),
	@mail NVARCHAR(50),
	@password NVARCHAR(50),
	@role NVARCHAR(50)
AS
	DECLARE @salt NVARCHAR(8)
	SET @salt=dbo.SF_GenerateSalt();
	INSERT INTO [Utilisateur]([Prenom], [Nom], [Email],[Password],[Salt], [Role])
		OUTPUT @@IDENTITY /*remplace le return 0*/
		VALUES (@prenom, @nom, @mail, dbo.SF_GeneratePWD(CONCAT(@salt, @password)),@salt, @role)
/*RETURN 0*/
GO
PRINT N'Création de [dbo].[SP_AddClient]...';


GO
CREATE PROCEDURE [dbo].[SP_AddClient]
	@NomSociete nvarchar(50),
	@NumTVA nvarchar(50),
	@ContactId int
AS
	INSERT INTO [Client]([NomSociete], [NumTVA],[ContactId])
	OUTPUT inserted.ClientId
	VALUES (@NomSociete, @NumTVA,@ContactId)
GO
PRINT N'Création de [dbo].[SP_AddContact]...';


GO
CREATE PROCEDURE [dbo].[SP_AddContact]
	@Prenom nvarchar(50),
	@Nom nvarchar(50),
	@Surnom nvarchar(50),
	@Tel nvarchar(50),
	@Email nvarchar(50),
	@Rue nvarchar(50),
	@Num nvarchar(50),
	@CodePostal nvarchar(50),
	@Ville nvarchar(50),
	@Pays nvarchar(50)
AS
	INSERT INTO [Contact]([Prenom],[Nom],[Surnom],[Tel],[Email], [Rue], [Num] ,[CodePostal] ,[Ville] ,[Pays])
	OUTPUT inserted.ContactId
	VALUES (@Prenom,@Nom,@Surnom,@Tel,@Email,@Rue,@Num ,@CodePostal ,@Ville ,@Pays)
GO
PRINT N'Création de [dbo].[SP_CheckPassword]...';


GO
CREATE PROCEDURE [dbo].[SP_CheckPassword]
	@mail nvarchar(50),
	@pwd nvarchar(50)

AS
	SELECT [UserId]
		FROM [Utilisateur]
		WHERE @mail = [Email] AND dbo.SF_GeneratePWD([Salt]+@pwd) = [Password]
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetAllClientWithContact]...';


GO
CREATE PROCEDURE [dbo].[SP_GetAllClientWithContact]
	
AS
	SELECT cl.ClientId, co.Prenom, co.Nom, co.Surnom, co.Tel, co.Email, co.Rue, co.Num, co.CodePostal, co.Ville, co.Pays, cl.NomSociete, cl.NumTVA
	FROM Client cl, Contact co
	WHERE co.ContactId=cl.ContactId
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetByFirstName]...';


GO
CREATE PROCEDURE [dbo].[SP_GetByFirstName]
	@prenom nvarchar(50)
AS
	SELECT *
	FROM [Contact]
	WHERE [Prenom]=@prenom
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetById]...';


GO
CREATE PROCEDURE [dbo].[SP_GetById]
	@id INT
AS
	SELECT *
	FROM [Contact]
	WHERE [ContactId]=@id
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetByName]...';


GO
CREATE PROCEDURE [dbo].[SP_GetByName]
	@nom NVARCHAR(50)
AS
	SELECT *
	FROM [Contact]
	WHERE [Nom]=@nom
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetBySurname]...';


GO
CREATE PROCEDURE [dbo].[SP_GetBySurname]
	@surnom NVARCHAR(50)
AS
	SELECT *
	FROM [Contact]
	Where [Surnom]=@surnom
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetClientByContactId]...';


GO
CREATE PROCEDURE [dbo].[SP_GetClientByContactId]
	@ContactId int
AS
	SELECT *
	FROM [Client]
	WHERE [ContactId]=@ContactId
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetClientById]...';


GO
CREATE PROCEDURE [dbo].[SP_GetClientById]
	@ClientId INT
AS
	SELECT *
	FROM [Client]
	WHERE [ClientId]=@ClientId
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetClientBySociete]...';


GO
CREATE PROCEDURE [dbo].[SP_GetClientBySociete]
	@NomSociete nvarchar(50)
AS
	SELECT *
	FROM [Client]
	Where [NomSociete]=@NomSociete
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetClientByTVA]...';


GO
CREATE PROCEDURE [dbo].[SP_GetClientByTVA]
	@NumTVA nvarchar(50)
AS
	SELECT *
	FROM [Client]
	Where [NumTVA]=@NumTVA
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetUserById]...';


GO
CREATE PROCEDURE [dbo].[SP_GetUserById]
	@id int
AS
	SELECT [UserId], [Prenom], [Nom], [Email], '********' As [Password], [Role]
		FROM [Utilisateur]
		WHERE [UserId]=@id
RETURN 0
GO
PRINT N'Création de [dbo].[SP_GetUserByMail]...';


GO
CREATE PROCEDURE [dbo].[SP_GetUserByMail]
	@mail nvarchar(200)
AS
	SELECT [UserId], [Prenom], [Nom], [Email], '********' As [Password], [Role]
		FROM [Utilisateur]
		WHERE [Email]=@mail
RETURN 0
GO
PRINT N'Création de [dbo].[SP_UpdateClient]...';


GO
CREATE PROCEDURE [dbo].[SP_UpdateClient]
	@ClientId int,
	@NomSociete nvarchar(50),
	@NumTVA nvarchar(50),
	@ContactId int
AS
	BEGIN
		UPDATE Client
		SET NomSociete=@NomSociete, NumTVA=@NumTVA, ContactId=@ContactId
		WHERE ClientId=@ClientId
	END
GO
PRINT N'Création de [dbo].[SP_UpdateContact]...';


GO
CREATE PROCEDURE [dbo].[SP_UpdateContact]
	@ContactId int,
	@Prenom nvarchar(50),
	@Nom nvarchar(50),
	@Surnom nvarchar(50),
	@Tel nvarchar(50),
	@Email nvarchar(50),
	@Rue nvarchar(50),
	@Num nvarchar(50),
	@CodePostal nvarchar(50),
	@Ville nvarchar(50),
	@Pays nvarchar(50)
AS
BEGIN
	UPDATE Contact 
	SET Prenom=@Prenom, Nom=@Nom, Surnom=@Surnom, Tel=@Tel, Email=@Email, Rue=@Rue, Num=@Num, CodePostal=@CodePostal, Ville=@Ville, Pays=@Pays
	WHERE ContactId=@ContactId
END
GO
PRINT N'Création de [dbo].[SP-GetByMail]...';


GO
CREATE PROCEDURE [dbo].[SP-GetByMail]
	@email NVARCHAR(200)
AS
	SELECT *
	FROM [Contact]
	WHERE [Email]=@email
RETURN 0
GO
/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
INSERT INTO dbo.Role 
VALUES 
('Admin'), 
('Gerant'), 
('Vendeur')
GO



/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

EXEC SP_AddAccountUser
@prenom='Isabel', 
@nom ='Skou', 
@mail='isabel.skou@yahoo.fr',
@password='test', 
@role='Admin'
GO

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Mise à jour terminée.';


GO
