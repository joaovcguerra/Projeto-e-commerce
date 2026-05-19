DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clientes (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) NOT NULL,
    idade int DEFAULT NULL,
    sexo enum('M','F','Outro') DEFAULT NULL,
    data_nascimento date DEFAULT NULL
);

CREATE TABLE cliente_especial (
    id_cliente int NOT NULL PRIMARY KEY,
    cashback decimal(10,2) NOT NULL,
    CONSTRAINT cliente_especial_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

CREATE TABLE vendedor (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL,
    causa_social varchar(255),
    tipo varchar(50) NOT NULL,
    nota_media decimal(2,1),
    salario decimal(10,2) NOT NULL
);

CREATE TABLE funcionario_especial (
    vendedor_id int NOT NULL PRIMARY KEY,
    bonus decimal(10,2) NOT NULL,
    FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);

CREATE TABLE transportadora (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) NOT NULL,
    cidade varchar(100) DEFAULT NULL
);

CREATE TABLE produto (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) NOT NULL,
    descricao text DEFAULT NULL,
    quantidade_estoque int NOT NULL,
    valor decimal(10,2) NOT NULL,
    observacoes text DEFAULT NULL,
    vendedor_id int NOT NULL,
    KEY vendedor_id (vendedor_id),
    CONSTRAINT produto_ibfk_1 FOREIGN KEY (vendedor_id) REFERENCES vendedor (id)
);

CREATE TABLE venda (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id int NOT NULL,
    transportadora_id int NOT NULL,
    data_hora datetime NOT NULL,
    endereco_destino varchar(255) NOT NULL,
    valor_transporte decimal(10,2) NOT NULL,
    KEY cliente_id (cliente_id),
    KEY transportadora_id (transportadora_id),
    CONSTRAINT venda_ibfk_1 FOREIGN KEY (cliente_id) REFERENCES clientes (id),
    CONSTRAINT venda_ibfk_2 FOREIGN KEY (transportadora_id) REFERENCES transportadora (id)
);

CREATE TABLE venda_item (
    venda_id int NOT NULL,
    produto_id int NOT NULL,
    quantidade int NOT NULL,
    valor_unitario decimal(10,2) NOT NULL,
    PRIMARY KEY (venda_id, produto_id),
    KEY produto_id (produto_id),
    CONSTRAINT venda_item_ibfk_1 FOREIGN KEY (venda_id) REFERENCES venda (id),
    CONSTRAINT venda_item_ibfk_2 FOREIGN KEY (produto_id) REFERENCES produto (id)
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

INSERT INTO vendedor (nome, tipo, salario) 
VALUES ('Rodrigo', 'Vendedor de Mangás', 2000.00);

INSERT INTO clientes (nome, idade, sexo, data_nascimento) 
VALUES ('João Vitor', 21, 'M', '2004-05-20');

INSERT INTO produto (nome, descricao, quantidade_estoque, valor, observacoes, vendedor_id) 
VALUES ('Mangá One Piece', 'Volume 1', 100, 29.90, 'Traduzido pela editora Panini', 1);