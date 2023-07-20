--para alterar o valor de cada pedido

SELECT PedidoID, SUM(Preco * Quantidade) AS ValorTotal FROM Pedido
JOIN ItemPedido ON Pedido.PedidoID = ItemPedido.PedidoID
JOIN Produto ON ItemPedido.ProdutoID = Produto.ProdutoID
GROUP BY Pedido.PedidoID;

--para recuperar os detalhes dos pedidos feitos por cada cliente

SELECT ClienteID, PedidoID, DataPedido, ProdutoID, Quantidade
FROM Pedido
JOIN ItemPedido ON Pedido.PedidoID = ItemPedido.PedidoID
WHERE ClienteID = 1;
