DROP DATABASE IF EXISTS ecommerce;
CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clientes (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(100) NOT NULL,
    idade int DEFAULT NULL,
    sexo enum('M','F','Outro') DEFAULT NULL,
    data_nascimento date DEFAULT NULL,
    total_comprado decimal(10,2) DEFAULT 0.00
);

CREATE TABLE cliente_especial (
    id_cliente int NOT NULL PRIMARY KEY,
    cashback decimal(10,2) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

CREATE TABLE vendedor (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome varchar(255) NOT NULL,
    causa_social varchar(255),
    tipo varchar(50) NOT NULL,
    nota_media decimal(2,1),
    salario decimal(10,2) NOT NULL,
    total_vendido decimal(10,2) DEFAULT 0.00
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
    FOREIGN KEY (vendedor_id) REFERENCES vendedor (id)
);

CREATE TABLE venda (
    id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cliente_id int NOT NULL,
    transportadora_id int NOT NULL,
    data_hora datetime NOT NULL,
    endereco_destino varchar(255) NOT NULL,
    valor_transporte decimal(10,2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id),
    FOREIGN KEY (transportadora_id) REFERENCES transportadora (id)
);

CREATE TABLE venda_item (
    venda_id int NOT NULL,
    produto_id int NOT NULL,
    quantidade int NOT NULL,
    valor_unitario decimal(10,2) NOT NULL,
    PRIMARY KEY (venda_id, produto_id),
    FOREIGN KEY (venda_id) REFERENCES venda (id),
    FOREIGN KEY (produto_id) REFERENCES produto (id)
);