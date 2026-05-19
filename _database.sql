create table vendedor (
    id int AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome varchar(255) NOT NULL,
    causa_social varchar(255),
    tipo varchar(50) NOT NULL,
    nota_media decimal(2,1),
    salario decimal(10,2) NOT NULL
);

create table funcionario_especial (
    vendedor_id int PRIMARY KEY NOT NULL,
    bonus decimal(10,2) NOT NULL,
    FOREIGN KEY (vendedor_id) REFERENCES vendedor(id)
);