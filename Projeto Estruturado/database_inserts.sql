USE ecommerce;

INSERT INTO vendedor (nome, tipo, salario) 
VALUES ('Rodrigo', 'Vendedor de Mangás', 2000.00);

INSERT INTO clientes (nome, idade, sexo, data_nascimento) 
VALUES ('João Vitor', 21, 'M', '2004-05-20');

INSERT INTO produto (nome, descricao, quantidade_estoque, valor, observacoes, vendedor_id) 
VALUES ('Mangá One Piece', 'Volume 1', 100, 29.90, 'Traduzido pela editora Panini', 1);