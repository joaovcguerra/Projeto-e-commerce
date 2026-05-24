USE ecommerce;

DELIMITER //

CREATE PROCEDURE reajuste(
    IN percentual DECIMAL(5,2),
    IN categoria VARCHAR(50)
)
BEGIN

UPDATE vendedor
SET salario = salario + (salario * percentual / 100)
WHERE tipo = categoria;

END //

DELIMITER ;








DELIMITER //

CREATE PROCEDURE sorteio()
BEGIN

DECLARE cliente_nome VARCHAR(100);

SELECT nome
INTO cliente_nome
FROM clientes
ORDER BY RAND()
LIMIT 1;

IF EXISTS (
SELECT *
FROM cliente_especial
WHERE id_cliente = (
SELECT id
FROM clientes
WHERE nome = cliente_nome
LIMIT 1
)
)

THEN

SELECT cliente_nome AS cliente,
'Voucher de R$200' AS premio;

ELSE

SELECT cliente_nome AS cliente,
'Voucher de R$100 ' AS premio;

END IF;

END //

DELIMITER ;








DELIMITER //

CREATE PROCEDURE venda_produto(
    IN produto_id INT,
    IN quantidade_comprada INT
)
BEGIN

UPDATE produto
SET quantidade_estoque = quantidade_estoque - quantidade_comprada
WHERE id = produto_id;

END //

DELIMITER ;