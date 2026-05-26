USE ecommerce;

INSERT INTO vendedor (nome, causa_social, tipo, nota_media, salario)
VALUES
('Rodrigo', 'Geek Universe', 'Mangás', 4.8, 2500.00),
('Carlos', 'Otaku World', 'Action Figures', 4.5, 2300.00),
('Fernanda', 'Game Station', 'Produtos Gamer', 4.9, 3200.00),
('Juliana', 'Hero Store', 'Quadrinhos', 4.7, 2800.00),
('Pedro', 'Anime Planet', 'Colecionáveis', 4.6, 2600.00);

INSERT INTO clientes (nome, idade, sexo, data_nascimento)
VALUES
('João Vitor', 21, 'M', '2004-05-20'),
('Maria Eduarda', 19, 'F', '2006-03-11'),
('Lucas Silva', 25, 'M', '2000-01-15'),
('Ana Clara', 22, 'F', '2003-09-10'),
('Bruno Henrique', 30, 'M', '1995-12-02'),
('Camila Souza', 27, 'F', '1998-04-22'),
('Felipe Santos', 18, 'M', '2007-07-30'),
('Larissa Lima', 24, 'F', '2001-06-01'),
('Ricardo Alves', 29, 'M', '1996-08-14'),
('Patricia Gomes', 31, 'F', '1994-10-25');

INSERT INTO transportadora (nome, cidade)
VALUES
('Correios', 'Recife'),
('Jadlog', 'São Paulo'),
('Azul Cargo', 'Fortaleza'),
('Loggi', 'Rio de Janeiro');

INSERT INTO produto (nome, descricao, quantidade_estoque, valor, observacoes, vendedor_id)
VALUES
('Mangá One Piece', 'Volume 1', 100, 29.90, 'Editora Panini', 1),
('Mangá Naruto', 'Volume 5', 80, 32.50, 'Capa especial', 1),
('Funko Pop Gojo', 'Jujutsu Kaisen', 40, 149.90, 'Colecionável', 2),
('Figure Goku SSJ', 'Dragon Ball', 20, 299.90, 'Edição limitada', 2),
('Mouse Gamer RGB', 'Mouse 7200 DPI', 50, 199.90, '7 botões', 3),
('Teclado Mecânico', 'Switch Blue', 35, 350.00, 'RGB', 3),
('Headset Gamer', 'Som surround', 25, 280.00, 'Microfone incluso', 3),
('HQ Batman', 'Ano Um', 60, 45.00, 'DC Comics', 4),
('HQ Homem-Aranha', 'Marvel Deluxe', 55, 52.00, 'Marvel', 4),
('Poster Hunter x Hunter', 'Killua e Gon', 70, 25.00, 'Tamanho A2', 5),
('Camisa Akatsuki', 'Naruto', 40, 89.90, 'Tecido premium', 5),
('Caneca One Piece', 'Luffy', 65, 35.00, 'Cerâmica', 1),
('Action Figure Levi', 'Attack on Titan', 15, 320.00, 'Importado', 2),
('Mousepad Gamer XL', 'RGB lateral', 45, 120.00, 'Antiderrapante', 3),
('Mangá Death Note', 'Black Edition', 30, 70.00, 'Edição especial', 1),
('Poster Dragon Ball', 'Goku Ultra Instinct', 50, 30.00, 'Brilho especial', 5),
('Cadeira Gamer', 'Ergonômica', 10, 1200.00, 'Reclinável', 3),
('Funko Pop Naruto', 'Modo Sábio', 35, 159.90, 'Colecionável', 2),
('HQ Vingadores', 'Guerra Infinita', 40, 60.00, 'Marvel', 4),
('Teclado Gamer Compacto', '60%', 18, 450.00, 'RGB Premium', 3);

INSERT INTO venda (cliente_id, transportadora_id, data_hora, endereco_destino, valor_transporte)
VALUES
(1, 1, '2026-05-19 10:30:00', 'Rua das Flores, Recife', 25.00),
(2, 2, '2026-05-19 14:00:00', 'Av Boa Viagem, Recife', 30.00),
(3, 1, '2026-05-20 09:15:00', 'Rua do Sol, Olinda', 18.00),
(4, 3, '2026-05-20 11:40:00', 'Rua Central, Paulista', 22.00),
(5, 4, '2026-05-21 15:20:00', 'Av Recife, Recife', 35.00);

INSERT INTO venda_item (venda_id, produto_id, quantidade, valor_unitario)
VALUES
(1, 1, 2, 29.90),
(1, 5, 1, 199.90),
(2, 3, 1, 149.90),
(2, 10, 2, 25.00),
(3, 6, 1, 350.00),
(3, 12, 3, 35.00),
(4, 17, 1, 1200.00),
(5, 8, 2, 45.00),
(5, 18, 1, 159.90);