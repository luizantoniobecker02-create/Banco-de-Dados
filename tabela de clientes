CREATE DATABASE ERP_Treino;

USE ERP_Treino;

CREATE TABLE Clientes (
	ClienteId INT IDENTITY(1,1) NOT NULL,
	Codigo VARCHAR(20) NOT NULL,
	Nome NVARCHAR(200) NOT NULL,
	Documento VARCHAR(20) NULL,
	Email NVARCHAR (254) NULL,
	Telefone NVARCHAR(30) NULL,
	Ativo BIT NOT NULL DEFAULT 1,
	CriadoEm DATETIME2(0) NOT NULL DEFAULT sysutcdatetime(),
	AtualizadoEm DATETIME2(0) NOT NULL DEFAULT sysutcdatetime(),
	LimiteCompra DECIMAL(18, 2) NULL,

	--Restrições de integridade (chaves e validações)
	CONSTRAINT PK_Clientes PRIMARY KEY (ClienteId),
	CONSTRAINT UQ_Clientes_Codigos UNIQUE (Codigo),
	CONSTRAINT CK_Clientes_Email CHECK (Email IS NULL OR Email LIKE '%@%.%')
);

CREATE TABLE Fornecedores (
	FornecedorId INT IDENTITY(1,1) NOT NULL,
	Codigo VARCHAR(20) NOT NULL,
	RazaoSocial NVARCHAR(200) NOT NULL,
	Documento VARCHAR(20) NULL,
	Email NVARCHAR (254) NULL,
	Telefone NVARCHAR(30) NULL,
	Ativo BIT NOT NULL DEFAULT 1,
	CriadoEm DATETIME2(0) NOT NULL DEFAULT sysutcdatetime(),
	AtualizadoEm DATETIME2(0) NOT NULL DEFAULT sysutcdatetime(),

	--Restrições de integridades
	CONSTRAINT PK_Fornecedores PRIMARY KEY (FornecedorId),
	CONSTRAINT UQ_Fornecedores_Codigos UNIQUE (Codigo),
	CONSTRAINT CK_Fornecedores_Email CHECK (Email IS NULL OR Email LIKE '%@%.%')
);

CREATE TABLE Produtos (
	ProdutoId INT IDENTITY(1,1) NOT NULL,
	SKU VARCHAR(40) NOT NULL,
	Nome NVARCHAR(200) NOT NULL,
	Unidade VARCHAR(10) NOT NULL DEFAULT 'UN',
	PrecoVenda DECIMAL (18, 2) NOT NULL DEFAULT 0,
	CustoPadrao DECIMAL (18, 2) NOT NULL DEFAULT 0,
	Ativo BIT NOT NULL DEFAULT 1,
	CriadoEm DATETIME2(0) NOT NULL DEFAULT sysutcdatetime(),
	AtualizadoEm DATETIME2(0) NOT NULL DEFAULT sysutcdatetime(),

	--Restrições de integridades
	CONSTRAINT PK_Produtos PRIMARY KEY (ProdutoId),
	CONSTRAINT UQ_Produtos_SKU UNIQUE (SKU),
	CONSTRAINT CK_Produtos_Precos CHECK (PrecoVenda >= 0 AND CustoPadrao >= 0)
);

