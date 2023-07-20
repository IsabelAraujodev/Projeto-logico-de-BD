--inserção de dados e queries
use ecommerce

show tables;

-- Inserção de dados de exemplo
INSERT INTO Client (idClient, Fname, Email) VALUES
    (1, 'Empresa XYZ', 'empresa@xyz.com'),
    (2, 'João Silva', 'joao@email.com'),
    (3, 'Maria Santos', 'maria@email.com');

INSERT INTO Location (idLocation, idClient, Rua, Numero, Cidade, Estado, CEP) VALUES
    (1, 1, 'Rua A', '123', 'São Paulo', 'SP', '01234-567'),
    (2, 2, 'Rua B', '456', 'Rio de Janeiro', 'RJ', '23456-789'),
    (3, 3, 'Rua C', '789', 'Belo Horizonte', 'MG', '34567-890');

INSERT INTO Payments (idPayment, typePayment) VALUES
    (1, 'Cartão'),
    (2, 'Boleto');

INSERT INTO PaymentCash (idClient, idPayment) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 1),
    (3, 3);

INSERT INTO Seller (idSeller, SocialName, Email, contact) VALUES
    (1, 'Pedro Oliveira', 'pedro@email.com', '(11) 98989-7878'),
    (2, 'Ana Souza', 'ana@email.com', '(21) 97777-4545');

INSERT INTO Supplier (idSupplier, SocialName, Email, contact) VALUES
    (1, 'Fornecedor A', 'fornecedorA@email.com', '(11) 98989-7878'),
    (2, 'Fornecedor B', 'fornecedorB@email.com', '(21) 97777-4545');

INSERT INTO Product (idProduct, Pname, Category, Price, Estoque, idSupplier) VALUES
    (1, 'Produto 1', 'Descrição do Produto 1', 50.00, 100, 1),
    (2, 'Produto 2', 'Descrição do Produto 2', 75.00, 50, 2),
    (3, 'Produto 3', 'Descrição do Produto 3', 30.00, 200, 1);

INSERT INTO Orders (idOrders, idClient, idSeller, DateOrder) VALUES
    (1, 1, 1, '2023-07-10'),
    (2, 1, 2, '2023-07-12'),
    (3, 2, 1, '2023-07-14'),
    (4, 3, 2, '2023-07-15');

INSERT INTO ProductOrder (idOrder, idProduct, Quantity) VALUES
    (1, 1, 3),
    (1, 2, 2),
    (2, 3, 1),
    (3, 1, 5),
    (4, 3, 2);

INSERT INTO Delivery (idDelivery, idOrder, deliveryStatus, Tracking) VALUES
    (1, 1, 'Em trânsito', 'ABC123'),
    (2, 2, 'Entregue', 'XYZ789'),
    (3, 3, 'Aguardando envio', NULL),
    (4, 4, 'Em trânsito', 'DEF456');


--para alterar o valor de cada pedido

SELECT idOrder, SUM(Price * Quantity) AS TotalValue FROM Order
JOIN productOrder ON Order.idOrder = productOrder.idOrder
JOIN Product ON ItemPedido.idProduct = Product.idProduct
GROUP BY Order.idOrder;

--para recuperar os detalhes dos pedidos feitos por cada cliente

SELECT idClient, idOrder, DataPedido, idProduct, Quantity
FROM Order
JOIN productOrder ON Order.idOrder = productOrder.idOrder
WHERE idClient = 1;

--calcula o valor total de cada pedido

SELECT idOrder, SUM(Price * Quantity) AS Value FROM Order
JOIN productOrder ON Order.idOrder = productOrder.idOrder
JOIN Produto ON productOrder.idProduct = Product.idProduct
GROUP BY Order.idOrder;
