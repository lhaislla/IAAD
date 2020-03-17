SELECT * FROM info_bebidas infob
LEFT JOIN bebidas i ON (i.nome_bebida = infob.nome_bebida)
WHERE i.nome_bebida IS NULL;
