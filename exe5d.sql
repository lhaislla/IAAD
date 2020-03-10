SELECT p.numero_pedido, c.nome, v.nome_vendedor FROM pedidos p
JOIN clientes c ON (p.codigo_cliente = c.codigo_cliente)
JOIN vendedores v ON (v.codigo_vendedor = p.codigo_vendedor)