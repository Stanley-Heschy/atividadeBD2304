--Criando Banco de Dados
create database bd_videolocadora
use bd_videolocadora

-- Criando as Tabelas
CREATE TABLE cliente (
	idCliente INT PRIMARY KEY IDENTITY(1, 1),
	nome VARCHAR(100),
	cidade VARCHAR(50)
);

CREATE TABLE filme (
	idFilme INT PRIMARY KEY IDENTITY(1, 1),
	titulo VARCHAR(50),
	genero VARCHAR(50),
	anoLancamento INT
);

CREATE TABLE locacao (
	idLocacao INT PRIMARY KEY IDENTITY(1, 1),
	idCliente INT,
	idFilme INT,
	dataLocacao DATE,
	valor DECIMAL(10, 2)
	FOREIGN KEY (idCliente) REFERENCES cliente(idCliente),
	FOREIGN KEY (idFilme) REFERENCES filme(idFilme)
);

-- Inserção de Dados
INSERT INTO cliente(nome, cidade)
VALUES
('Carlos Silva', 'São Paulo'),
('Ana Souza', 'Rio de Janeiro'),
('Marcos Lima', 'Belo Horizonte'),
('Fernanda Dias', 'São Paulo'),
('Stanley Calebe', 'São Caetano do Sul'),
('Kazuya Shinzato', 'Santo André');

INSERT INTO filme(titulo, genero, anoLancamento)
VALUES
('Matrix', 'Ficção Científica', 1999),
('Titanic', 'Romance', 1997),
('Vingadores', 'Ação', 2012),
('Coringa', 'Drama', 2019),
('Procurando Nemo', 'Animação', 2003),
('Meu Amigo Totoro', 'Animação', 1988),
('O Serviço de Entregas da Kiki', 'Animação', 1989);

INSERT INTO locacao(idCliente, idFilme, dataLocacao, valor)
VALUES
(1, 1, '2023-05-01', 5.00),
(1, 3, '2023-05-03', 6.00),
(2, 2, '2023-05-02', 4.50),
(2, 1, '2023-05-04', 5.00),
(3, 4, '2023-05-01', 6.50),
(4, 1, '2023-05-01', 5.00),
(4, 4, '2023-05-05', 6.50),
(5, 6, '2024-06-02', 7.00),
(5, 7, '2024-07-02', 7.50),
(5, 5, '2024-08-02', 8.00),
(6, 1, '2024-11-01', 5.00),
(6, 6, '2024-12-01', 7.00);

-- Consultas SQL
SELECT * FROM filme;

SELECT * FROM cliente
WHERE cidade = 'São Paulo';

SELECT L.dataLocacao, C.nome, F.titulo
FROM locacao L
INNER JOIN cliente C ON L.idCliente = C.idCliente
INNER JOIN filme F ON L.idFilme = F.idFilme;

SELECT COUNT(*) AS qtdeLocacao, C.nome
FROM cliente C
INNER JOIN locacao L ON C.idCliente = L.idCliente
GROUP BY C.nome;

SELECT titulo, anoLancamento FROM filme
ORDER BY anoLancamento DESC;

SELECT COUNT(*) AS qtdeLocacao, C.nome
FROM cliente C
INNER JOIN locacao L ON C.idCliente = L.idCliente
GROUP BY C.nome
HAVING COUNT(*) > 1;


