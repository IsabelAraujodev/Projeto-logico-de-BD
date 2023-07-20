-- Criação das tabelas
CREATE TABLE Cliente (
    ClienteID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    TipoCliente ENUM('PJ', 'PF')
);

CREATE TABLE Endereco (
    EnderecoID INT PRIMARY KEY,
    ClienteID INT,
    Rua VARCHAR(100),
    Numero VARCHAR(10),
    Cidade VARCHAR(100),
    Estado VARCHAR(50),
    CEP VARCHAR(10),
    FOREIGN KEY (ClienteID) REFERENCES Cliente (ClienteID)
);

CREATE TABLE FormaPagamento (
    FormaPagamentoID INT PRIMARY KEY,
    Descricao VARCHAR(100)
);

CREATE TABLE ClienteFormaPagamento (
    ClienteID INT,
    FormaPagamentoID INT,
    PRIMARY KEY (ClienteID, FormaPagamentoID),
    FOREIGN KEY (ClienteID) REFERENCES Cliente (ClienteID),
    FOREIGN KEY (FormaPagamentoID) REFERENCES FormaPagamento (FormaPagamentoID)
);

CREATE TABLE Vendedor (
    VendedorID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Fornecedor (
    FornecedorID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Email VARCHAR(100),
    Telefone VARCHAR(20)
);

CREATE TABLE Produto (
    ProdutoID INT PRIMARY KEY,
    Nome VARCHAR(100),
    Descricao VARCHAR(255),
    Preco DECIMAL(10, 2),
    Estoque INT,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedor (FornecedorID)
);

CREATE TABLE Pedido (
    PedidoID INT PRIMARY KEY,
    ClienteID INT,
    VendedorID INT,
    DataPedido DATE,
    FOREIGN KEY (ClienteID) REFERENCES Cliente (ClienteID),
    FOREIGN KEY (VendedorID) REFERENCES Vendedor (VendedorID)
);

CREATE TABLE ItemPedido (
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT,
    PRIMARY KEY (PedidoID, ProdutoID),
    FOREIGN KEY (PedidoID) REFERENCES Pedido (PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produto (ProdutoID)
);

CREATE TABLE Entrega (
    EntregaID INT PRIMARY KEY,
    PedidoID INT,
    Status VARCHAR(50),
    CodigoRastreio VARCHAR(50),
    FOREIGN KEY (PedidoID) REFERENCES Pedido (PedidoID)
);

-- Inserção de dados de exemplo
INSERT INTO Cliente (ClienteID, Nome, Email, Telefone, TipoCliente) VALUES
    (1, 'Empresa XYZ', 'empresa@xyz.com', '(11) 99999-8888', 'PJ'),
    (2, 'João Silva', 'joao@email.com', '(21) 98888-7777', 'PF'),
    (3, 'Maria Santos', 'maria@email.com', '(31) 97777-6666', 'PF');

INSERT INTO Endereco (EnderecoID, ClienteID, Rua, Numero, Cidade, Estado, CEP) VALUES
    (1, 1, 'Rua A', '123', 'São Paulo', 'SP', '01234-567'),
    (2, 2, 'Rua B', '456', 'Rio de Janeiro', 'RJ', '23456-789'),
    (3, 3, 'Rua C', '789', 'Belo Horizonte', 'MG', '34567-890');

INSERT INTO FormaPagamento (FormaPagamentoID, Descricao) VALUES
    (1, 'Cartão de Crédito'),
    (2, 'Boleto'),
    (3, 'Transferência Bancária');

INSERT INTO ClienteFormaPagamento (ClienteID, FormaPagamentoID) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 1),
    (3, 3);

INSERT INTO Vendedor (VendedorID, Nome, Email, Telefone) VALUES
    (1, 'Pedro Oliveira', 'pedro@email.com', '(11) 98989-7878'),
    (2, 'Ana Souza', 'ana@email.com', '(21) 97777-4545');

INSERT INTO Fornecedor (FornecedorID, Nome, Email, Telefone) VALUES
    (1, 'Fornecedor A', 'fornecedorA@email.com', '(11) 98989-7878'),
    (2, 'Fornecedor B', 'fornecedorB@email.com', '(21) 97777-4545');

INSERT INTO Produto (ProdutoID, Nome, Descricao, Preco, Estoque, FornecedorID) VALUES
    (1, 'Produto 1', 'Descrição do Produto 1', 50.00, 100, 1),
    (2, 'Produto 2', 'Descrição do Produto 2', 75.00, 50, 2),
    (3, 'Produto 3', 'Descrição do Produto 3', 30.00, 200, 1);

INSERT INTO Pedido (PedidoID, ClienteID, VendedorID, DataPedido) VALUES
    (1, 1, 1, '2023-07-10'),
    (2, 1, 2, '2023-07-12'),
    (3, 2, 1, '2023-07-14'),
    (4, 3, 2, '2023-07-15');

INSERT INTO ItemPedido (PedidoID, ProdutoID, Quantidade) VALUES
    (1, 1, 3),
    (1, 2, 2),
    (2, 3, 1),
    (3, 1, 5),
    (4, 3, 2);

INSERT INTO Entrega (EntregaID, PedidoID, Status, CodigoRastreio) VALUES
    (1, 1, 'Em trânsito', 'ABC123'),
    (2, 2, 'Entregue', 'XYZ789'),
    (3, 3, 'Aguardando envio', NULL),
    (4, 4, 'Em trânsito', 'DEF456');
