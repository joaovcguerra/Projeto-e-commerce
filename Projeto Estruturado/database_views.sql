USE ecommerce;

CREATE VIEW vendedor_bonus AS
SELECT 
    vendedor.nome,
    COUNT(funcionario_especial.vendedor_id) AS total_bonus,
    SUM(funcionario_especial.bonus) AS valor_bonus
FROM vendedor, funcionario_especial
WHERE vendedor.id = funcionario_especial.vendedor_id
GROUP BY vendedor.nome;

CREATE VIEW view_produtos_vendedores AS
SELECT 
    vendedor.nome AS vendedor,
    COUNT(produto.id) AS total_produtos,
    SUM(produto.valor) AS valor_total_produtos
FROM produto, vendedor
WHERE produto.vendedor_id = vendedor.id
GROUP BY vendedor.nome;

CREATE VIEW view_vendas_clientes AS
SELECT 
    clientes.nome,
    COUNT(venda.id) AS total_compras,
    SUM(venda.valor_transporte) AS total_transporte
FROM clientes, venda
WHERE clientes.id = venda.cliente_id
GROUP BY clientes.nome;

CREATE VIEW view_total_vendas_produto AS
SELECT 
    produto.nome,
    SUM(venda_item.quantidade) AS total_vendido,
    SUM(venda_item.quantidade * venda_item.valor_unitario) AS valor_total
FROM produto, venda_item
WHERE produto.id = venda_item.produto_id
GROUP BY produto.nome;
