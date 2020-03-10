SELECT c.nome, COUNT(p.numero_pedido) AS qtd FROM pedidos p
JOIN clientes c ON  c.codigo_cliente = p.codigo_cliente
GROUP BY c.nome;

