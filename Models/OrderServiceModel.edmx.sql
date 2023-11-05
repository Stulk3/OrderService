
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/05/2023 03:45:15
-- Generated from EDMX file: C:\AppDev\OrderService\OrderService\Models\OrderServiceModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [OrderServiceData];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_SuppliersSupplies]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SuppliesSet] DROP CONSTRAINT [FK_SuppliersSupplies];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersEmployees]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[OrdersSet] DROP CONSTRAINT [FK_OrdersEmployees];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductsSupplies]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SuppliesSet] DROP CONSTRAINT [FK_ProductsSupplies];
GO
IF OBJECT_ID(N'[dbo].[FK_OrdersProducts]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductsSet] DROP CONSTRAINT [FK_OrdersProducts];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[OrdersSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[OrdersSet];
GO
IF OBJECT_ID(N'[dbo].[EmployeesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EmployeesSet];
GO
IF OBJECT_ID(N'[dbo].[ProductsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductsSet];
GO
IF OBJECT_ID(N'[dbo].[SuppliesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SuppliesSet];
GO
IF OBJECT_ID(N'[dbo].[SuppliersSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SuppliersSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'OrdersSet'
CREATE TABLE [dbo].[OrdersSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreatedDate] nvarchar(max)  NOT NULL,
    [DoneDate] nvarchar(max)  NOT NULL,
    [ClientID] nvarchar(max)  NOT NULL,
    [Employees_Id] int  NOT NULL
);
GO

-- Creating table 'EmployeesSet'
CREATE TABLE [dbo].[EmployeesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Appointment] nvarchar(max)  NOT NULL,
    [PhoneNumber] nvarchar(max)  NOT NULL,
    [Subordinates] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'ProductsSet'
CREATE TABLE [dbo].[ProductsSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Weight] nvarchar(max)  NOT NULL,
    [ExpirationDate] nvarchar(max)  NOT NULL,
    [StorageTemperature] nvarchar(max)  NOT NULL,
    [Price] nvarchar(max)  NOT NULL,
    [OrdersId] int  NOT NULL
);
GO

-- Creating table 'SuppliesSet'
CREATE TABLE [dbo].[SuppliesSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SuppliersId] int  NOT NULL,
    [Products_Id] int  NOT NULL
);
GO

-- Creating table 'SuppliersSet'
CREATE TABLE [dbo].[SuppliersSet] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Manager] nvarchar(max)  NOT NULL,
    [TradePrice] nvarchar(max)  NOT NULL,
    [RetailPrice] nvarchar(max)  NOT NULL,
    [Discount] nvarchar(max)  NOT NULL,
    [Available] nvarchar(max)  NOT NULL,
    [Specials] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'OrdersSet'
ALTER TABLE [dbo].[OrdersSet]
ADD CONSTRAINT [PK_OrdersSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'EmployeesSet'
ALTER TABLE [dbo].[EmployeesSet]
ADD CONSTRAINT [PK_EmployeesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductsSet'
ALTER TABLE [dbo].[ProductsSet]
ADD CONSTRAINT [PK_ProductsSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SuppliesSet'
ALTER TABLE [dbo].[SuppliesSet]
ADD CONSTRAINT [PK_SuppliesSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SuppliersSet'
ALTER TABLE [dbo].[SuppliersSet]
ADD CONSTRAINT [PK_SuppliersSet]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [SuppliersId] in table 'SuppliesSet'
ALTER TABLE [dbo].[SuppliesSet]
ADD CONSTRAINT [FK_SuppliersSupplies]
    FOREIGN KEY ([SuppliersId])
    REFERENCES [dbo].[SuppliersSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SuppliersSupplies'
CREATE INDEX [IX_FK_SuppliersSupplies]
ON [dbo].[SuppliesSet]
    ([SuppliersId]);
GO

-- Creating foreign key on [Employees_Id] in table 'OrdersSet'
ALTER TABLE [dbo].[OrdersSet]
ADD CONSTRAINT [FK_OrdersEmployees]
    FOREIGN KEY ([Employees_Id])
    REFERENCES [dbo].[EmployeesSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersEmployees'
CREATE INDEX [IX_FK_OrdersEmployees]
ON [dbo].[OrdersSet]
    ([Employees_Id]);
GO

-- Creating foreign key on [Products_Id] in table 'SuppliesSet'
ALTER TABLE [dbo].[SuppliesSet]
ADD CONSTRAINT [FK_ProductsSupplies]
    FOREIGN KEY ([Products_Id])
    REFERENCES [dbo].[ProductsSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductsSupplies'
CREATE INDEX [IX_FK_ProductsSupplies]
ON [dbo].[SuppliesSet]
    ([Products_Id]);
GO

-- Creating foreign key on [OrdersId] in table 'ProductsSet'
ALTER TABLE [dbo].[ProductsSet]
ADD CONSTRAINT [FK_OrdersProducts]
    FOREIGN KEY ([OrdersId])
    REFERENCES [dbo].[OrdersSet]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_OrdersProducts'
CREATE INDEX [IX_FK_OrdersProducts]
ON [dbo].[ProductsSet]
    ([OrdersId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------