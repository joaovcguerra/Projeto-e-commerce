USE ecommerce;

CREATE VIEW vendedor_bonus AS
SELECT 
    vendedor.nome,
    COUNT(funcionario_especial.vendedor_id) AS total_bonus,
    SUM(funcionario_especial.bonus) AS valor_bonus
FROM vendedor
INNER JOIN funcionario_especial
ON vendedor.id = funcionario_especial.vendedor_id
GROUP BY vendedor.nome;

CREATE VIEW view_produtos_vendedores AS
SELECT
    vendedor.nome,
    COUNT(produto.id) AS total_produto,
    SUM(produto.valor) AS total_venda 
FROM vendedor
INNER JOIN produto
ON vendedor.id = produto.vendedor_id
GROUP BY vendedor.nome;

CREATE VIEW view_vendas_clientes AS
SELECT 
    clientes.nome,
    COUNT(venda.id) AS total_compras,
    SUM(venda.valor_transporte) AS total_transporte
FROM clientes 
INNER JOIN venda
ON venda.cliente_id = clientes.id
GROUP BY clientes.nome;

CREATE VIEW view_total_vendas_produto AS
SELECT 
    produto.nome,
    SUM(venda_item.quantidade) AS total_vendido,
    SUM(venda_item.quantidade * venda_item.valor_unitario) AS valor_total
FROM produto
INNER JOIN venda_item
ON produto.id = venda_item.produto_id
GROUP BY produto.nome;