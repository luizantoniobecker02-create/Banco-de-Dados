

ERP-Treino
USE [master]
GO
CREATE DATABASE [ERP_Treino]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ERP_Treino', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ERP_Treino.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ERP_Treino_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ERP_Treino_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ERP_Treino] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ERP_Treino].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ERP_Treino] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ERP_Treino] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ERP_Treino] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ERP_Treino] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ERP_Treino] SET ARITHABORT OFF 
GO
ALTER DATABASE [ERP_Treino] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ERP_Treino] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ERP_Treino] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ERP_Treino] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ERP_Treino] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ERP_Treino] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ERP_Treino] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ERP_Treino] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ERP_Treino] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ERP_Treino] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ERP_Treino] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ERP_Treino] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ERP_Treino] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ERP_Treino] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ERP_Treino] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ERP_Treino] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ERP_Treino] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ERP_Treino] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ERP_Treino] SET  MULTI_USER 
GO
ALTER DATABASE [ERP_Treino] SET PAGE_VERIFY CHECKSUM   
GO
ALTER DATABASE [ERP_Treino] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ERP_Treino] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ERP_Treino] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ERP_Treino] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ERP_Treino] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ERP_Treino] SET QUERY_STORE = ON
GO
ALTER DATABASE [ERP_Treino] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ERP_Treino]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produtos](
[ProdutoId] [int] IDENTITY(1,1) NOT NULL,
[SKU] [varchar](40) NOT NULL,
[Nome] [nvarchar](200) NOT NULL,
[Unidade] [varchar](10) NOT NULL,
[PrecoVenda] [decimal](18, 2) NOT NULL,
[CustoPadrao] [decimal](18, 2) NOT NULL,
[Ativo] [bit] NOT NULL,
[CriadoEm] [datetime2](0) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED 
(
[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Produtos_SKU] UNIQUE NONCLUSTERED 
(
[SKU] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Armazens](
[ArmazemId] [int] IDENTITY(1,1) NOT NULL,
[Codigo] [varchar](20) NOT NULL,
[Nome] [nvarchar](120) NOT NULL,
[Ativo] [bit] NOT NULL,
[CriadoEm] [datetime2](0) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Armazens] PRIMARY KEY CLUSTERED 
(
[ArmazemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Armazens_Codigo] UNIQUE NONCLUSTERED 
(
[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaClientes](
[AuditId] [int] IDENTITY(1,1) NOT NULL,
[ClienteId] [int] NULL,
[Usuario] [nvarchar](128) NULL,
[DataInsercao] [datetime] NULL,
[Operacao] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditoriaGlobal](
[AuditId] [int] IDENTITY(1,1) NOT NULL,
[TabelaAfetada] [varchar](50) NULL,
[Operacao] [varchar](50) NULL,
[Usuario] [nvarchar](128) NULL,
[DataEvento] [datetime] NULL,
[Detalhes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
[AuditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
[ClienteId] [int] IDENTITY(1,1) NOT NULL,
[Codigo] [varchar](20) NOT NULL,
[Nome] [nvarchar](200) NOT NULL,
[Documento] [varchar](20) NULL,
[Email] [nvarchar](254) NULL,
[Telefone] [nvarchar](30) NULL,
[Ativo] [bit] NOT NULL,
[CriadoEm] [datetime2](0) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
[LimiteCompra] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
[ClienteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Clientes_Codigo] UNIQUE NONCLUSTERED 
(
[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
[CompraId] [int] IDENTITY(1,1) NOT NULL,
[Numero] [varchar](30) NOT NULL,
[FornecedorId] [int] NOT NULL,
[Status] [varchar](12) NOT NULL,
[DataCompra] [date] NOT NULL,
[TotalProdutos] [decimal](18, 2) NOT NULL,
[TotalCompra]  AS ([TotalProdutos]) PERSISTED NOT NULL,
[CriadoEm] [datetime2](0) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Compras] PRIMARY KEY CLUSTERED 
(
[CompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Compras_Numero] UNIQUE NONCLUSTERED 
(
[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComprasItens](
[CompraItemId] [int] IDENTITY(1,1) NOT NULL,
[CompraId] [int] NOT NULL,
[ProdutoId] [int] NOT NULL,
[Quantidade] [decimal](18, 3) NOT NULL,
[CustoUnitario] [decimal](18, 2) NOT NULL,
[TotalItem]  AS ([Quantidade]*[CustoUnitario]) PERSISTED,
 CONSTRAINT [PK_ComprasItens] PRIMARY KEY CLUSTERED 
(
[CompraItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estoques](
[EstoqueId] [int] IDENTITY(1,1) NOT NULL,
[ProdutoId] [int] NOT NULL,
[ArmazemId] [int] NOT NULL,
[Quantidade] [decimal](18, 3) NOT NULL,
[QuantidadeMin] [decimal](18, 3) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Estoques] PRIMARY KEY CLUSTERED 
(
[EstoqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Estoques_Produto_Armazem] UNIQUE NONCLUSTERED 
(
[ProdutoId] ASC,
[ArmazemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fornecedores](
[FornecedorId] [int] IDENTITY(1,1) NOT NULL,
[Codigo] [varchar](20) NOT NULL,
[RazaoSocial] [nvarchar](200) NOT NULL,
[Documento] [varchar](20) NULL,
[Email] [nvarchar](254) NULL,
[Telefone] [nvarchar](30) NULL,
[Ativo] [bit] NOT NULL,
[CriadoEm] [datetime2](0) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_Fornecedores] PRIMARY KEY CLUSTERED 
(
[FornecedorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_Fornecedores_Codigo] UNIQUE NONCLUSTERED 
(
[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimentosEstoque](
[MovimentoId] [bigint] IDENTITY(1,1) NOT NULL,
[ProdutoId] [int] NOT NULL,
[ArmazemId] [int] NOT NULL,
[Tipo] [char](1) NOT NULL,
[Quantidade] [decimal](18, 3) NOT NULL,
[CustoUnitario] [decimal](18, 2) NULL,
[Referencia] [nvarchar](60) NULL,
[Observacao] [nvarchar](400) NULL,
[CriadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_MovimentosEstoque] PRIMARY KEY CLUSTERED 
(
[MovimentoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosVenda](
[PedidoVendaId] [int] IDENTITY(1,1) NOT NULL,
[Numero] [varchar](30) NOT NULL,
[ClienteId] [int] NOT NULL,
[Status] [varchar](12) NOT NULL,
[DataPedido] [date] NOT NULL,
[TotalProdutos] [decimal](18, 2) NOT NULL,
[TotalPedido]  AS ([TotalProdutos]) PERSISTED NOT NULL,
[CriadoEm] [datetime2](0) NOT NULL,
[AtualizadoEm] [datetime2](0) NOT NULL,
 CONSTRAINT [PK_PedidosVenda] PRIMARY KEY CLUSTERED 
(
[PedidoVendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UQ_PedidosVenda_Numero] UNIQUE NONCLUSTERED 
(
[Numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PedidosVendaItens](
[PedidoVendaItemId] [int] IDENTITY(1,1) NOT NULL,
[PedidoVendaId] [int] NOT NULL,
[ProdutoId] [int] NOT NULL,
[Quantidade] [decimal](18, 3) NOT NULL,
[PrecoUnitario] [decimal](18, 2) NOT NULL,
[TotalItem]  AS ([Quantidade]*[PrecoUnitario]) PERSISTED,
 CONSTRAINT [PK_PedidosVendaItens] PRIMARY KEY CLUSTERED 
(
[PedidoVendaItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_Clientes_Nome] ON [dbo].[Clientes]
(
[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OC_Fornecedor_Data] ON [dbo].[Compras]
(
[FornecedorId] ASC,
[DataCompra] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OCI_Compra] ON [dbo].[ComprasItens]
(
[CompraId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_OCI_Produto] ON [dbo].[ComprasItens]
(
[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Estoques_Armazem] ON [dbo].[Estoques]
(
[ArmazemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Estoques_Produto] ON [dbo].[Estoques]
(
[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_Fornecedores_Razao] ON [dbo].[Fornecedores]
(
[RazaoSocial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_MovEst_Data] ON [dbo].[MovimentosEstoque]
(
[CriadoEm] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_MovEst_ProdutoArmazem] ON [dbo].[MovimentosEstoque]
(
[ProdutoId] ASC,
[ArmazemId] ASC,
[CriadoEm] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PV_Cliente_Data] ON [dbo].[PedidosVenda]
(
[ClienteId] ASC,
[DataPedido] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PVI_Pedido] ON [dbo].[PedidosVendaItens]
(
[PedidoVendaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_PVI_Produto] ON [dbo].[PedidosVendaItens]
(
[ProdutoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
CREATE NONCLUSTERED INDEX [IX_Produtos_Nome] ON [dbo].[Produtos]
(
[Nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Armazens] ADD  CONSTRAINT [DF_Armazens_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Armazens] ADD  CONSTRAINT [DF_Armazens_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Armazens] ADD  CONSTRAINT [DF_Armazens_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[AuditoriaClientes] ADD  DEFAULT (getdate()) FOR [DataInsercao]
GO
ALTER TABLE [dbo].[AuditoriaClientes] ADD  DEFAULT ('INSERT') FOR [Operacao]
GO
ALTER TABLE [dbo].[AuditoriaGlobal] ADD  DEFAULT (getdate()) FOR [DataEvento]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Clientes] ADD  CONSTRAINT [DF_Clientes_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_OC_Status]  DEFAULT ('ABERTA') FOR [Status]
GO
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_OC_Data]  DEFAULT (CONVERT([date],getdate())) FOR [DataCompra]
GO
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_OC_TotalProd]  DEFAULT ((0)) FOR [TotalProdutos]
GO
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_OC_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Compras] ADD  CONSTRAINT [DF_OC_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[Estoques] ADD  CONSTRAINT [DF_Estoques_Qtd]  DEFAULT ((0)) FOR [Quantidade]
GO
ALTER TABLE [dbo].[Estoques] ADD  CONSTRAINT [DF_Estoques_QtdMin]  DEFAULT ((0)) FOR [QuantidadeMin]
GO
ALTER TABLE [dbo].[Estoques] ADD  CONSTRAINT [DF_Estoques_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[Fornecedores] ADD  CONSTRAINT [DF_Fornecedores_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Fornecedores] ADD  CONSTRAINT [DF_Fornecedores_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Fornecedores] ADD  CONSTRAINT [DF_Fornecedores_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[MovimentosEstoque] ADD  CONSTRAINT [DF_MovEst_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[PedidosVenda] ADD  CONSTRAINT [DF_PV_Status]  DEFAULT ('ABERTO') FOR [Status]
GO
ALTER TABLE [dbo].[PedidosVenda] ADD  CONSTRAINT [DF_PV_Data]  DEFAULT (CONVERT([date],getdate())) FOR [DataPedido]
GO
ALTER TABLE [dbo].[PedidosVenda] ADD  CONSTRAINT [DF_PV_TotalProd]  DEFAULT ((0)) FOR [TotalProdutos]
GO
ALTER TABLE [dbo].[PedidosVenda] ADD  CONSTRAINT [DF_PV_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[PedidosVenda] ADD  CONSTRAINT [DF_PV_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[Produtos] ADD  CONSTRAINT [DF_Produtos_Unidade]  DEFAULT ('UN') FOR [Unidade]
GO
ALTER TABLE [dbo].[Produtos] ADD  CONSTRAINT [DF_Produtos_PrecoVenda]  DEFAULT ((0)) FOR [PrecoVenda]
GO
ALTER TABLE [dbo].[Produtos] ADD  CONSTRAINT [DF_Produtos_CustoPadrao]  DEFAULT ((0)) FOR [CustoPadrao]
GO
ALTER TABLE [dbo].[Produtos] ADD  CONSTRAINT [DF_Produtos_Ativo]  DEFAULT ((1)) FOR [Ativo]
GO
ALTER TABLE [dbo].[Produtos] ADD  CONSTRAINT [DF_Produtos_CriadoEm]  DEFAULT (sysutcdatetime()) FOR [CriadoEm]
GO
ALTER TABLE [dbo].[Produtos] ADD  CONSTRAINT [DF_Produtos_AtualizadoEm]  DEFAULT (sysutcdatetime()) FOR [AtualizadoEm]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [FK_OC_Fornecedores] FOREIGN KEY([FornecedorId])
REFERENCES [dbo].[Fornecedores] ([FornecedorId])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [FK_OC_Fornecedores]
GO
ALTER TABLE [dbo].[ComprasItens]  WITH CHECK ADD  CONSTRAINT [FK_OCI_OC] FOREIGN KEY([CompraId])
REFERENCES [dbo].[Compras] ([CompraId])
GO
ALTER TABLE [dbo].[ComprasItens] CHECK CONSTRAINT [FK_OCI_OC]
GO
ALTER TABLE [dbo].[ComprasItens]  WITH CHECK ADD  CONSTRAINT [FK_OCI_Produtos] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produtos] ([ProdutoId])
GO
ALTER TABLE [dbo].[ComprasItens] CHECK CONSTRAINT [FK_OCI_Produtos]
GO
ALTER TABLE [dbo].[Estoques]  WITH CHECK ADD  CONSTRAINT [FK_Estoques_Armazens] FOREIGN KEY([ArmazemId])
REFERENCES [dbo].[Armazens] ([ArmazemId])
GO
ALTER TABLE [dbo].[Estoques] CHECK CONSTRAINT [FK_Estoques_Armazens]
GO
ALTER TABLE [dbo].[Estoques]  WITH CHECK ADD  CONSTRAINT [FK_Estoques_Produtos] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produtos] ([ProdutoId])
GO
ALTER TABLE [dbo].[Estoques] CHECK CONSTRAINT [FK_Estoques_Produtos]
GO
ALTER TABLE [dbo].[MovimentosEstoque]  WITH CHECK ADD  CONSTRAINT [FK_MovEst_Armazens] FOREIGN KEY([ArmazemId])
REFERENCES [dbo].[Armazens] ([ArmazemId])
GO
ALTER TABLE [dbo].[MovimentosEstoque] CHECK CONSTRAINT [FK_MovEst_Armazens]
GO
ALTER TABLE [dbo].[MovimentosEstoque]  WITH CHECK ADD  CONSTRAINT [FK_MovEst_Produtos] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produtos] ([ProdutoId])
GO
ALTER TABLE [dbo].[MovimentosEstoque] CHECK CONSTRAINT [FK_MovEst_Produtos]
GO
ALTER TABLE [dbo].[PedidosVenda]  WITH CHECK ADD  CONSTRAINT [FK_PV_Clientes] FOREIGN KEY([ClienteId])
REFERENCES [dbo].[Clientes] ([ClienteId])
GO
ALTER TABLE [dbo].[PedidosVenda] CHECK CONSTRAINT [FK_PV_Clientes]
GO
ALTER TABLE [dbo].[PedidosVendaItens]  WITH CHECK ADD  CONSTRAINT [FK_PVI_Produtos] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produtos] ([ProdutoId])
GO
ALTER TABLE [dbo].[PedidosVendaItens] CHECK CONSTRAINT [FK_PVI_Produtos]
GO
ALTER TABLE [dbo].[PedidosVendaItens]  WITH CHECK ADD  CONSTRAINT [FK_PVI_PV] FOREIGN KEY([PedidoVendaId])
REFERENCES [dbo].[PedidosVenda] ([PedidoVendaId])
GO
ALTER TABLE [dbo].[PedidosVendaItens] CHECK CONSTRAINT [FK_PVI_PV]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [CK_Clientes_Email] CHECK  (([Email] IS NULL OR [Email] like N'%_@_%._%'))
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [CK_Clientes_Email]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [CK_OC_Status] CHECK  (([Status]='CANCELADA' OR [Status]='RECEBIDA' OR [Status]='ABERTA'))
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [CK_OC_Status]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [CK_OC_Total] CHECK  (([TotalProdutos]>=(0)))
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [CK_OC_Total]
GO
ALTER TABLE [dbo].[ComprasItens]  WITH CHECK ADD  CONSTRAINT [CK_OCI_Custo] CHECK  (([CustoUnitario]>=(0)))
GO
ALTER TABLE [dbo].[ComprasItens] CHECK CONSTRAINT [CK_OCI_Custo]
GO
ALTER TABLE [dbo].[ComprasItens]  WITH CHECK ADD  CONSTRAINT [CK_OCI_Qtd] CHECK  (([Quantidade]>(0)))
GO
ALTER TABLE [dbo].[ComprasItens] CHECK CONSTRAINT [CK_OCI_Qtd]
GO
ALTER TABLE [dbo].[Estoques]  WITH CHECK ADD  CONSTRAINT [CK_Estoques_Qtd] CHECK  (([Quantidade]>=(0) AND [QuantidadeMin]>=(0)))
GO
ALTER TABLE [dbo].[Estoques] CHECK CONSTRAINT [CK_Estoques_Qtd]
GO
ALTER TABLE [dbo].[Fornecedores]  WITH CHECK ADD  CONSTRAINT [CK_Fornecedores_Email] CHECK  (([Email] IS NULL OR [Email] like N'%_@_%._%'))
GO
ALTER TABLE [dbo].[Fornecedores] CHECK CONSTRAINT [CK_Fornecedores_Email]
GO
ALTER TABLE [dbo].[MovimentosEstoque]  WITH CHECK ADD  CONSTRAINT [CK_MovEst_Custo] CHECK  (([CustoUnitario] IS NULL OR [CustoUnitario]>=(0)))
GO
ALTER TABLE [dbo].[MovimentosEstoque] CHECK CONSTRAINT [CK_MovEst_Custo]
GO
ALTER TABLE [dbo].[MovimentosEstoque]  WITH CHECK ADD  CONSTRAINT [CK_MovEst_Qtd] CHECK  (([Quantidade]>(0)))
GO
ALTER TABLE [dbo].[MovimentosEstoque] CHECK CONSTRAINT [CK_MovEst_Qtd]
GO
ALTER TABLE [dbo].[MovimentosEstoque]  WITH CHECK ADD  CONSTRAINT [CK_MovEst_Tipo] CHECK  (([Tipo]='A' OR [Tipo]='S' OR [Tipo]='E'))
GO
ALTER TABLE [dbo].[MovimentosEstoque] CHECK CONSTRAINT [CK_MovEst_Tipo]
GO
ALTER TABLE [dbo].[PedidosVenda]  WITH CHECK ADD  CONSTRAINT [CK_PV_Status] CHECK  (([Status]='CANCELADO' OR [Status]='FATURADO' OR [Status]='ABERTO'))
GO
ALTER TABLE [dbo].[PedidosVenda] CHECK CONSTRAINT [CK_PV_Status]
GO
ALTER TABLE [dbo].[PedidosVenda]  WITH CHECK ADD  CONSTRAINT [CK_PV_Total] CHECK  (([TotalProdutos]>=(0)))
GO
ALTER TABLE [dbo].[PedidosVenda] CHECK CONSTRAINT [CK_PV_Total]
GO
ALTER TABLE [dbo].[PedidosVendaItens]  WITH CHECK ADD  CONSTRAINT [CK_PVI_Preco] CHECK  (([PrecoUnitario]>=(0)))
GO
ALTER TABLE [dbo].[PedidosVendaItens] CHECK CONSTRAINT [CK_PVI_Preco]
GO
ALTER TABLE [dbo].[PedidosVendaItens]  WITH CHECK ADD  CONSTRAINT [CK_PVI_Qtd] CHECK  (([Quantidade]>(0)))
GO
ALTER TABLE [dbo].[PedidosVendaItens] CHECK CONSTRAINT [CK_PVI_Qtd]
GO
ALTER TABLE [dbo].[Produtos]  WITH CHECK ADD  CONSTRAINT [CK_Produtos_Precos] CHECK  (([PrecoVenda]>=(0) AND [CustoPadrao]>=(0)))
GO
ALTER TABLE [dbo].[Produtos] CHECK CONSTRAINT [CK_Produtos_Precos]
GO
USE [master]
GO
ALTER DATABASE [ERP_Treino] SET  READ_WRITE 
GO
USE ERP_Treino;
GO
CREATE TABLE dbo.ContasAReceber (
    ID_Conta INT PRIMARY KEY IDENTITY(1,1),
    Cliente VARCHAR(100) NOT NULL,
    Descricao VARCHAR(255),
    Valor DECIMAL(18, 2) NOT NULL,
    Data_Vencimento DATE NOT NULL,
    Status_Pagamento VARCHAR(20) DEFAULT 'Pendente'
);
GO

select * from Fornecedores;

select * from Clientes;

select * from Produtos;

insert into Clientes(Codigo, Nome,Documento,Email,Telefone)
values ('PRO4263','CAIXA DE SOM',50,99.90,19.89);

UPDATE Clientes
Set Email= 
Where Email = 

USE ERP_Treino;
GO

SET NOCOUNT ON;
SET XACT_ABORT ON;

BEGIN TRY
    BEGIN TRAN;

    IF (SELECT COUNT(*) FROM dbo.Clientes) < 5
    BEGIN
        ;WITH src AS (
            SELECT * FROM (VALUES
                ('CLI0001', N'Cliente Alpha Ltda',  '11111111111',  N'alpha@skirr.com',  N'+55 11 99999-1001', 1),
                ('CLI0002', N'Cliente Beta ME',     '22222222222',  N'beta@skirr.com',   N'+55 11 99999-1002', 1),
                ('CLI0003', N'Cliente Gama SA',     '33333333333',  N'gama@skirr.com',   N'+55 11 99999-1003', 1),
                ('CLI0004', N'Cliente Delta EPP',   '44444444444',  N'delta@skirr.com',  N'+55 11 99999-1004', 1),
                ('CLI0005', N'Cliente Épsilon',     '55555555555',  N'epsilon@skirr.com',N'+55 11 99999-1005', 1)
            ) v(Codigo, Nome, Documento, Email, Telefone, Ativo)
        )
        INSERT INTO dbo.Clientes (Codigo, Nome, Documento, Email, Telefone, Ativo)
        SELECT s.Codigo, s.Nome, s.Documento, s.Email, s.Telefone, s.Ativo
        FROM src s
        WHERE NOT EXISTS (SELECT 1 FROM dbo.Clientes c WHERE c.Codigo = s.Codigo);
    END

    IF (SELECT COUNT(*) FROM dbo.Fornecedores) < 5
    BEGIN
        ;WITH src AS (
            SELECT * FROM (VALUES
                ('FOR0001', N'Fornecedor Aço Forte LTDA',    '12345678000199', N'acoforte@skirr.com',   N'+55 11 3333-2001', 1),
                ('FOR0002', N'Fornecedor Papel & Cia SA',    '22345678000199', N'papelcia@skirr.com',   N'+55 11 3333-2002', 1),
                ('FOR0003', N'Fornecedor Química Norte ME',  '32345678000199', N'quimicanorte@skirr.com',N'+55 11 3333-2003', 1),
                ('FOR0004', N'Fornecedor Tech Parts EPP',    '42345678000199', N'techparts@skirr.com',  N'+55 11 3333-2004', 1),
                ('FOR0005', N'Fornecedor Agro Sul LTDA',     '52345678000199', N'agrosul@skirr.com',    N'+55 11 3333-2005', 1)
            ) v(Codigo, RazaoSocial, Documento, Email, Telefone, Ativo)
        )
        INSERT INTO dbo.Fornecedores (Codigo, RazaoSocial, Documento, Email, Telefone, Ativo)
        SELECT s.Codigo, s.RazaoSocial, s.Documento, s.Email, s.Telefone, s.Ativo
        FROM src s
        WHERE NOT EXISTS (SELECT 1 FROM dbo.Fornecedores f WHERE f.Codigo = s.Codigo);
    END

    IF (SELECT COUNT(*) FROM dbo.Armazens) < 5
    BEGIN
        ;WITH src AS (
            SELECT * FROM (VALUES
                ('MATRIZ',  N'Armazém Matriz', 1),
                ('FILIAL1', N'Armazém Filial 1', 1),
                ('FILIAL2', N'Armazém Filial 2', 1),
                ('CD01',    N'Centro de Distribuição 01', 1),
                ('OUTLET',  N'Loja/Outlet', 1)
            ) v(Codigo, Nome, Ativo)
        )
        INSERT INTO dbo.Armazens (Codigo, Nome, Ativo)
        SELECT s.Codigo, s.Nome, s.Ativo
        FROM src s
        WHERE NOT EXISTS (SELECT 1 FROM dbo.Armazens a WHERE a.Codigo = s.Codigo);
    END

    IF (SELECT COUNT(*) FROM dbo.Produtos) < 5
    BEGIN
        ;WITH src AS (
            SELECT * FROM (VALUES
                ('SKU-001', N'Parafuso Aço 10mm', 'UN', CAST(1.50 AS DECIMAL(18,2)), CAST(0.60 AS DECIMAL(18,2)), 1),
                ('SKU-002', N'Porca Aço 10mm',    'UN', CAST(1.10 AS DECIMAL(18,2)), CAST(0.40 AS DECIMAL(18,2)), 1),
                ('SKU-003', N'Arruela 10mm',      'UN', CAST(0.35 AS DECIMAL(18,2)), CAST(0.10 AS DECIMAL(18,2)), 1),
                ('SKU-004', N'Tinta Acrílica 1L', 'UN', CAST(29.90 AS DECIMAL(18,2)),CAST(18.00 AS DECIMAL(18,2)),1),
                ('SKU-005', N'Cabo Elétrico 2,5mm','M', CAST(4.90 AS DECIMAL(18,2)), CAST(2.70 AS DECIMAL(18,2)), 1)
            ) v(SKU, Nome, Unidade, PrecoVenda, CustoPadrao, Ativo)
        )
        INSERT INTO dbo.Produtos (SKU, Nome, Unidade, PrecoVenda, CustoPadrao, Ativo)
        SELECT s.SKU, s.Nome, s.Unidade, s.PrecoVenda, s.CustoPadrao, s.Ativo
        FROM src s
        WHERE NOT EXISTS (SELECT 1 FROM dbo.Produtos p WHERE p.SKU = s.SKU);
    END

    IF (SELECT COUNT(*) FROM dbo.Estoques) < 5
    BEGIN
        ;WITH combos AS (
            SELECT TOP (5)
                p.ProdutoId,
                a.ArmazemId
            FROM dbo.Produtos p
            CROSS JOIN dbo.Armazens a
            ORDER BY p.ProdutoId, a.ArmazemId
        )
        INSERT INTO dbo.Estoques (ProdutoId, ArmazemId, Quantidade, QuantidadeMin)
        SELECT c.ProdutoId, c.ArmazemId, CAST(0 AS DECIMAL(18,3)), CAST(5 AS DECIMAL(18,3))
        FROM combos c
        WHERE NOT EXISTS (
            SELECT 1 FROM dbo.Estoques e
            WHERE e.ProdutoId = c.ProdutoId AND e.ArmazemId = c.ArmazemId
        );
    END

    IF (SELECT COUNT(*) FROM dbo.Compras) < 5
    BEGIN
        DECLARE @F1 INT = (SELECT TOP 1 FornecedorId FROM dbo.Fornecedores WHERE Codigo='FOR0001');
        DECLARE @F2 INT = (SELECT TOP 1 FornecedorId FROM dbo.Fornecedores WHERE Codigo='FOR0002');
        DECLARE @F3 INT = (SELECT TOP 1 FornecedorId FROM dbo.Fornecedores WHERE Codigo='FOR0003');
        DECLARE @F4 INT = (SELECT TOP 1 FornecedorId FROM dbo.Fornecedores WHERE Codigo='FOR0004');
        DECLARE @F5 INT = (SELECT TOP 1 FornecedorId FROM dbo.Fornecedores WHERE Codigo='FOR0005');

        ;WITH src AS (
            SELECT * FROM (VALUES
                ('OC-0001', @F1, 'RECEBIDA', CONVERT(date, DATEADD(day,-20,GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('OC-0002', @F2, 'RECEBIDA', CONVERT(date, DATEADD(day,-15,GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('OC-0003', @F3, 'RECEBIDA', CONVERT(date, DATEADD(day,-10,GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('OC-0004', @F4, 'ABERTA',   CONVERT(date, DATEADD(day,-5, GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('OC-0005', @F5, 'ABERTA',   CONVERT(date, DATEADD(day,-2, GETDATE())), CAST(0 AS DECIMAL(18,2)))
            ) v(Numero, FornecedorId, Status, DataCompra, TotalProdutos)
        )
        INSERT INTO dbo.Compras (Numero, FornecedorId, Status, DataCompra, TotalProdutos)
        SELECT s.Numero, s.FornecedorId, s.Status, s.DataCompra, s.TotalProdutos
        FROM src s
        WHERE s.FornecedorId IS NOT NULL
          AND NOT EXISTS (SELECT 1 FROM dbo.Compras c WHERE c.Numero = s.Numero);
    END

    IF (SELECT COUNT(*) FROM dbo.ComprasItens) < 5
    BEGIN
        DECLARE @OC1 INT = (SELECT TOP 1 CompraId FROM dbo.Compras WHERE Numero='OC-0001');
        DECLARE @OC2 INT = (SELECT TOP 1 CompraId FROM dbo.Compras WHERE Numero='OC-0002');
        DECLARE @OC3 INT = (SELECT TOP 1 CompraId FROM dbo.Compras WHERE Numero='OC-0003');
        DECLARE @OC4 INT = (SELECT TOP 1 CompraId FROM dbo.Compras WHERE Numero='OC-0004');
        DECLARE @OC5 INT = (SELECT TOP 1 CompraId FROM dbo.Compras WHERE Numero='OC-0005');

        DECLARE @P1 INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-001');
        DECLARE @P2 INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-002');
        DECLARE @P3 INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-003');
        DECLARE @P4 INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-004');
        DECLARE @P5 INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-005');

        ;WITH src AS (
            SELECT * FROM (VALUES
                (@OC1, @P1, CAST(100 AS DECIMAL(18,3)), CAST(0.60 AS DECIMAL(18,2))),
                (@OC2, @P2, CAST(120 AS DECIMAL(18,3)), CAST(0.40 AS DECIMAL(18,2))),
                (@OC3, @P3, CAST(300 AS DECIMAL(18,3)), CAST(0.10 AS DECIMAL(18,2))),
                (@OC4, @P4, CAST(20  AS DECIMAL(18,3)), CAST(18.00 AS DECIMAL(18,2))),
                (@OC5, @P5, CAST(200 AS DECIMAL(18,3)), CAST(2.70 AS DECIMAL(18,2)))
            ) v(CompraId, ProdutoId, Quantidade, CustoUnitario)
        )
        INSERT INTO dbo.ComprasItens (CompraId, ProdutoId, Quantidade, CustoUnitario)
        SELECT s.CompraId, s.ProdutoId, s.Quantidade, s.CustoUnitario
        FROM src s
        WHERE s.CompraId IS NOT NULL AND s.ProdutoId IS NOT NULL
          AND NOT EXISTS (
              SELECT 1 FROM dbo.ComprasItens ci
              WHERE ci.CompraId = s.CompraId AND ci.ProdutoId = s.ProdutoId
          );
    END

    UPDATE c
       SET c.TotalProdutos = x.Total
    FROM dbo.Compras c
    JOIN (
        SELECT CompraId, CAST(SUM(Quantidade * CustoUnitario) AS DECIMAL(18,2)) AS Total
        FROM dbo.ComprasItens
        GROUP BY CompraId
    ) x ON x.CompraId = c.CompraId;

    IF (SELECT COUNT(*) FROM dbo.PedidosVenda) < 5
    BEGIN
        DECLARE @C1 INT = (SELECT TOP 1 ClienteId FROM dbo.Clientes WHERE Codigo='CLI0001');
        DECLARE @C2 INT = (SELECT TOP 1 ClienteId FROM dbo.Clientes WHERE Codigo='CLI0002');
        DECLARE @C3 INT = (SELECT TOP 1 ClienteId FROM dbo.Clientes WHERE Codigo='CLI0003');
        DECLARE @C4 INT = (SELECT TOP 1 ClienteId FROM dbo.Clientes WHERE Codigo='CLI0004');
        DECLARE @C5 INT = (SELECT TOP 1 ClienteId FROM dbo.Clientes WHERE Codigo='CLI0005');

        ;WITH src AS (
            SELECT * FROM (VALUES
                ('PV-0001', @C1, 'FATURADO', CONVERT(date, DATEADD(day,-12,GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('PV-0002', @C2, 'FATURADO', CONVERT(date, DATEADD(day,-9, GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('PV-0003', @C3, 'ABERTO',   CONVERT(date, DATEADD(day,-4, GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('PV-0004', @C4, 'ABERTO',   CONVERT(date, DATEADD(day,-1, GETDATE())), CAST(0 AS DECIMAL(18,2))),
                ('PV-0005', @C5, 'CANCELADO',CONVERT(date, DATEADD(day,-3, GETDATE())), CAST(0 AS DECIMAL(18,2)))
            ) v(Numero, ClienteId, Status, DataPedido, TotalProdutos)
        )
        INSERT INTO dbo.PedidosVenda (Numero, ClienteId, Status, DataPedido, TotalProdutos)
        SELECT s.Numero, s.ClienteId, s.Status, s.DataPedido, s.TotalProdutos
        FROM src s
        WHERE s.ClienteId IS NOT NULL
          AND NOT EXISTS (SELECT 1 FROM dbo.PedidosVenda pv WHERE pv.Numero = s.Numero);
    END

    IF (SELECT COUNT(*) FROM dbo.PedidosVendaItens) < 5
    BEGIN
        DECLARE @PV1 INT = (SELECT TOP 1 PedidoVendaId FROM dbo.PedidosVenda WHERE Numero='PV-0001');
        DECLARE @PV2 INT = (SELECT TOP 1 PedidoVendaId FROM dbo.PedidosVenda WHERE Numero='PV-0002');
        DECLARE @PV3 INT = (SELECT TOP 1 PedidoVendaId FROM dbo.PedidosVenda WHERE Numero='PV-0003');
        DECLARE @PV4 INT = (SELECT TOP 1 PedidoVendaId FROM dbo.PedidosVenda WHERE Numero='PV-0004');

        DECLARE @P1v INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-001');
        DECLARE @P2v INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-002');
        DECLARE @P3v INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-003');
        DECLARE @P4v INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-004');
        DECLARE @P5v INT = (SELECT TOP 1 ProdutoId FROM dbo.Produtos WHERE SKU='SKU-005');

        ;WITH src AS (
            SELECT * FROM (VALUES
                (@PV1, @P1v, CAST(10 AS DECIMAL(18,3)), CAST(1.50 AS DECIMAL(18,2))),
                (@PV1, @P2v, CAST(5  AS DECIMAL(18,3)), CAST(1.10 AS DECIMAL(18,2))),
                (@PV2, @P4v, CAST(2  AS DECIMAL(18,3)), CAST(29.90 AS DECIMAL(18,2))),
                (@PV3, @P5v, CAST(30 AS DECIMAL(18,3)), CAST(4.90 AS DECIMAL(18,2))),
                (@PV4, @P3v, CAST(50 AS DECIMAL(18,3)), CAST(0.35 AS DECIMAL(18,2)))
            ) v(PedidoVendaId, ProdutoId, Quantidade, PrecoUnitario)
        )
        INSERT INTO dbo.PedidosVendaItens (PedidoVendaId, ProdutoId, Quantidade, PrecoUnitario)
        SELECT s.PedidoVendaId, s.ProdutoId, s.Quantidade, s.PrecoUnitario
        FROM src s
        WHERE s.PedidoVendaId IS NOT NULL AND s.ProdutoId IS NOT NULL
          AND NOT EXISTS (
              SELECT 1 FROM dbo.PedidosVendaItens pvi
              WHERE pvi.PedidoVendaId = s.PedidoVendaId AND pvi.ProdutoId = s.ProdutoId
          );
    END

    UPDATE pv
       SET pv.TotalProdutos = x.Total
    FROM dbo.PedidosVenda pv
    JOIN (
        SELECT PedidoVendaId, CAST(SUM(Quantidade * PrecoUnitario) AS DECIMAL(18,2)) AS Total
        FROM dbo.PedidosVendaItens
        GROUP BY PedidoVendaId
    ) x ON x.PedidoVendaId = pv.PedidoVendaId;

    IF (SELECT COUNT(*) FROM dbo.MovimentosEstoque) < 5
    BEGIN
        DECLARE @A1 INT = (SELECT TOP 1 ArmazemId FROM dbo.Armazens WHERE Codigo='MATRIZ');

        ;WITH base AS (
            SELECT TOP (5)
                ci.ProdutoId,
                @A1 AS ArmazemId,
                CAST('E' AS CHAR(1)) AS Tipo,
                ci.Quantidade,
                ci.CustoUnitario,
                CONCAT(N'OC:', c.Numero) AS Referencia,
                CONCAT(N'Entrada via compra ', c.Numero) AS Observacao
            FROM dbo.ComprasItens ci
            JOIN dbo.Compras c ON c.CompraId = ci.CompraId
            ORDER BY c.CompraId, ci.ProdutoId
        )
        INSERT INTO dbo.MovimentosEstoque (ProdutoId, ArmazemId, Tipo, Quantidade, CustoUnitario, Referencia, Observacao)
        SELECT b.ProdutoId, b.ArmazemId, b.Tipo, b.Quantidade, b.CustoUnitario, b.Referencia, b.Observacao
        FROM base b
        WHERE NOT EXISTS (
            SELECT 1 FROM dbo.MovimentosEstoque m
            WHERE m.Referencia = b.Referencia
              AND m.ProdutoId = b.ProdutoId
              AND m.ArmazemId = b.ArmazemId
              AND m.Tipo = b.Tipo
        );

        INSERT INTO dbo.Estoques (ProdutoId, ArmazemId, Quantidade, QuantidadeMin)
        SELECT DISTINCT m.ProdutoId, m.ArmazemId, CAST(0 AS DECIMAL(18,3)), CAST(5 AS DECIMAL(18,3))
        FROM dbo.MovimentosEstoque m
        WHERE m.ArmazemId = @A1
          AND NOT EXISTS (
              SELECT 1 FROM dbo.Estoques e
              WHERE e.ProdutoId = m.ProdutoId AND e.ArmazemId = m.ArmazemId
          );

        ;WITH mov AS (
            SELECT
                ProdutoId,
                ArmazemId,
                SUM(CASE Tipo WHEN 'S' THEN -Quantidade ELSE Quantidade END) AS Delta
            FROM dbo.MovimentosEstoque
            GROUP BY ProdutoId, ArmazemId
        )
        UPDATE e
           SET e.Quantidade = CASE WHEN (e.Quantidade + m.Delta) < 0 THEN 0 ELSE (e.Quantidade + m.Delta) END,
               e.AtualizadoEm = SYSUTCDATETIME()
        FROM dbo.Estoques e
        JOIN mov m
          ON m.ProdutoId = e.ProdutoId AND m.ArmazemId = e.ArmazemId;
    END

    COMMIT;

END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0 ROLLBACK;
    THROW;
END CATCH
GO 

SELECT 'Clientes'            AS Tabela, COUNT(*) AS Linhas FROM dbo.Clientes UNION ALL
SELECT 'Fornecedores',              COUNT(*) FROM dbo.Fornecedores UNION ALL
SELECT 'Produtos',                  COUNT(*) FROM dbo.Produtos UNION ALL
SELECT 'Armazens',                  COUNT(*) FROM dbo.Armazens UNION ALL
SELECT 'Estoques',                  COUNT(*) FROM dbo.Estoques UNION ALL
SELECT 'MovimentosEstoque',         COUNT(*) FROM dbo.MovimentosEstoque UNION ALL
SELECT 'PedidosVenda',              COUNT(*) FROM dbo.PedidosVenda UNION ALL
SELECT 'PedidosVendaItens',         COUNT(*) FROM dbo.PedidosVendaItens UNION ALL
SELECT 'Compras',                   COUNT(*) FROM dbo.Compras UNION ALL
SELECT 'ComprasItens',              COUNT(*) FROM dbo.ComprasItens;
GO

select SKU, Nome, Unidade, PrecoVenda from Produtos 
where ativo = 1
order by Unidade ASC, PrecoVenda desc;

select COUNT (*) as TotalProdutosAtivos,
AVG(PrecoVenda) As PrecoMedio,
MAX(PrecoVenda) as PrecoMaximo,
MIN(PrecoVenda) as PrecoMinimo
from Produtos
where ativo=1

