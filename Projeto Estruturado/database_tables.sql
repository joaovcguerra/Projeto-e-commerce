DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE clientes (
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome varchar(100) NOT NULL,
    idade int DEFAULT NULL,
    sexo enum('M','F','Outro') DEFAULT NULL,
    data_nascimento date DEFAULT NULL,
);

CREATE TABLE cliente_especial (
    id_cliente int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    cashback decimal(10,2) NOT NULL,
    CONSTRAINT cliente_especial_ibfk_1 FOREIGN KEY (id_cliente) REFERENCES clientes (id)
);

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

CREATE TABLE produto (
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
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
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
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
    venda_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    produto_id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    quantidade int NOT NULL,
    valor_unitario decimal(10,2) NOT NULL,
    KEY `produto_id` (`produto_id`),
    CONSTRAINT `venda_item_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`),
    CONSTRAINT `venda_item_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
);

CREATE TABLE transportadora (
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome varchar(100) NOT NULL,
    cidade varchar(100) DEFAULT NULL,
);