

DROP DATABASE IF EXISTS ecommerce;

CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE categoria (
    id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    descricao TEXT,
    PRIMARY KEY (id)
);

CREATE TABLE produto (
    id INT AUTO_INCREMENT,
    nome VARCHAR(150),
    descricao TEXT,
    preco DECIMAL(10,2),
    estoque INT,
    categoria_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

-- 1º PASSO: Inserir dados na tabela 'categoria' (Tabela Pai)
INSERT INTO categoria (nome, descricao) VALUES 
('Eletrônicos', 'Smartphones, TVs e Computadores'),
('Livros', 'Livros físicos e e-books');

-- 2º PASSO: Inserir dados na tabela 'produto' (Tabela Filha)
-- O campo categoria_id precisa corresponder aos IDs criados acima (1 ou 2)
INSERT INTO produto (nome, descricao, preco, estoque, categoria_id) VALUES 
('Smartphone Galaxy', 'Celular 128GB', 1500.00, 20, 1),
('Notebook Dell', 'Notebook 16GB RAM', 4500.00, 10, 1),
('O Senhor dos Anéis', 'Edição de colecionador', 120.00, 15, 2);

-- Alterando apenas a descrição da categoria de ID 2 (Livros)
UPDATE categoria 
SET descricao = 'Livros físicos, e-books e audiolivros' 
WHERE id = 2;

-- Alterando o preço e o estoque de um produto específico (ID 1)
UPDATE produto 
SET preco = 1350.00, estoque = 25 
WHERE id = 1;

-- Aumentando em 10% o preço de TODOS os produtos que pertencem à categoria 1 (Eletrônicos)
UPDATE produto 
SET preco = preco * 1.10 
WHERE categoria_id = 1;

-- Zerando o estoque de produtos que custam menos de 150 reais
UPDATE produto 
SET estoque = 0 
WHERE preco < 150.00;

-- Inserindo as 3 categorias que faltavam (IDs 3, 4 e 5)
INSERT INTO categoria (nome, descricao) VALUES 
('Vestuário', 'Roupas masculinas, femininas e infantis'),
('Casa e Decoração', 'Móveis, utensílios, cama, mesa e banho'),
('Esportes', 'Artigos esportivos, roupas térmicas e acessórios');

-- Inserindo os 2 produtos que faltavam (IDs 4 e 5)
-- Note que estamos vinculando eles às novas categorias (IDs 3 e 5)
INSERT INTO produto (nome, descricao, preco, estoque, categoria_id) VALUES 
('Camiseta Básica Preta', 'Camiseta 100% algodão tamanho M', 49.90, 50, 3),
('Bola de Futebol', 'Bola de campo tamanho oficial', 119.50, 30, 5);
-- --- Completando as modificações em CATEGORIA ---

-- Modificando o nome de uma categoria buscando pelo ID
UPDATE categoria 
SET nome = 'Moda e Vestuário' 
WHERE id = 3;

-- Modificando a descrição buscando pelo nome atual (útil se você não souber o ID)
UPDATE categoria 
SET descricao = 'Móveis e itens de decoração exclusivos para o lar' 
WHERE nome = 'Casa e Decoração';

-- Adicionando um texto ao final da descrição que já existe (Usando a função CONCAT)
UPDATE categoria 
SET descricao = CONCAT(descricao, ' - COM DESCONTO') 
WHERE id = 5;


-- --- Completando as modificações em PRODUTO ---

-- Modificando apenas o preço de um produto específico
UPDATE produto 
SET preco = 39.90 
WHERE id = 4;

-- Diminuindo o estoque atual em 5 unidades (simulando uma venda)
UPDATE produto 
SET estoque = estoque - 5 
WHERE id = 5;

SELECT * FROM categoria LIMIT 5;


