CREATE TABLE vendedor (
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome varchar(255) NOT NULL,
    causa_social varchar(255),
    tipo varchar(50) NOT NULL,
    nota_media decimal(2,1),
    salario decimal(10,2) NOT NULL
);

CREATE TABLE funcionario_especial (
    vendedor_id int PRIMARY KEY NOT NULL,
    bonus decimal(10,2) NOT NULL,
    FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);

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

INSERT INTO produto (nome, descricao, quantidade_estoque, valor, observacoes, vendedor_id)
VALUES
('Mangá One Piece', 'Volume 1', 100, 29.90, 'Traduzido pela editora Panini', 1);

INSERTO INTO vendedor (tipo)
VALUES
('Vendedor de Mangás')

INSERTO INTO clientes (nome, idade, sexo, data_nascimento)
VALUES
('João Vitor', 21, 'M', '20-05-2004');