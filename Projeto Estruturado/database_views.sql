USE ecommerce;

CREATE VIEW vendedor_bonus AS
SELECT
    v.id,
    v.nome,
    v.salario as salario_base,
    fe.bonus,
    (v.salario + fe.bonus) as salario_total
FROM
    vendedor v
INNER JOIN
    funcionario_especial fe ON v.id = fe.vendedor_id;