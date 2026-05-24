USE ecommerce;

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'senhaadm123';
CREATE USER 'gerente'@'localhost' IDENTIFIED BY 'senhagerente123';
CREATE USER 'funcionario'@'localhost' IDENTIFIED BY 'senhafuncionario123';

GRANT ALL PRIVILEGES ON ecommerce.* TO 'administrador'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON ecommerce.* TO 'gerente'@'localhost';
GRANT SELECT, INSERT ON ecommerce.venda TO 'funcionario'@'localhost';

