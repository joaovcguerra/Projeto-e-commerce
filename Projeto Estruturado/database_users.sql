USE ecommerce;

DROP USER IF EXISTS 'administrador'@'localhost';
DROP USER IF EXISTS 'gerente'@'localhost';
DROP USER IF EXISTS 'funcionario'@'localhost';

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'senha4321';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senha1234';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'senha1231';

GRANT ALL PRIVILEGES ON ecommerce.* TO 'administrador'@'localhost';
GRANT SELECT, UPDATE, DELETE ON ecommerce.* TO 'gerente'@'localhost';
GRANT SELECT, INSERT ON ecommerce.venda TO 'funcionario'@'localhost';
GRANT SELECT, INSERT ON ecommerce.venda_item TO 'funcionario'@'localhost';