CREATE TABLE Itens_Estoque(
idItem INT NOT NULL AUTO_INCREMENT,
descricaoItem VARCHAR(200),
setorItem VARCHAR(200),
precoVendaItem DOUBLE(9,2),
estoqueItem INT,
PRIMARY KEY (idItem)
);

INSERT INTO Itens_Estoque
(descricaoItem,setorItem,precoVendaItem,estoqueItem)VALUES
('Suco de Laranja','Bebidas','7.50',250),
('Macarrão 1kg','Alimentos','5.20',180),
('Sabão em pó','Limpeza','12.90',90),
('Café Torrado','Alimentos','15.80',120),
('Iogurte Natural','Laticínios','4.30',350),
('Biscoito Integral',NULL,'3.90',210),
('Molho de Tomate','Alimentos','2.80',500);

SELECT * FROM Itens_Estoque;

select setorItem
from Itens_Estoque
where descricaoItem = 'Iogurte Natural';

select setorItem, precoVendaItem
from Itens_Estoque
where descricaoItem = 'Iogurte Natural';

SELECT precoVendaItem, estoqueItem
from Itens_Estoque
where descricaoItem = 'Biscoito Integral' and setorItem IS NULL ;

SELECT descricaoItem, setorItem
from `Itens_Estoque`
where `idItem` = 1 or `precoVendaItem` > 30;

SELECT descricaoItem
from `Itens_Estoque`
WHERE `precoVendaItem` BETWEEN 1.00 and 7.50;

SELECT*FROM Itens_Estoque
WHERE setorItem IN ('Limpeza','Alimentos','Laticínios');

SELECT*FROM Itens_Estoque
WHERE setorItem not IN ('Limpeza','Bebidas','Laticínios');

set @minha_idade = 25;

set@nome_produto = 'pc'
SELECT (precoVendaItem * 2) as total
from `Itens_Estoque`;

 select precoVendaItem, setorItem
 FROM `Itens_Estoque`
 WHERE `setorItem`

SELECT count(descricaoItem)
from `Itens_Estoque`
where `descricaoItem` like '%u%';

select MIN(`estoqueItem`)
FROM `Itens_Estoque`;

-- 1) verificar de quantidade de itens por setor
select setorItem, COUNT(estoqueItem)
from `Itens_Estoque`
GROUP BY `setorItem`;

-- 2) verificar média valor produto por setor
SELECT setorItem , AVG(precoVendaItem) as MD
from `Itens_Estoque`
GROUP BY `setorItem`;

-- 3) verificar valor min e max por setor
SELECT setorItem, min(estoqueItem)
from `Itens_Estoque`
GROUP BY `setorItem`;

SELECT SUM(precoVendaItem) as total
FROM `Itens_Estoque`;

SELECT setorItem,
    sum(precoVendaItem)
from Itens_Estoque
GROUP BY setorItem; 

SELECT SUM(precoVendaItem) as total, sum(estoqueItem) as estoque, setorItem
from Itens_Estoque
GROUP BY setorItem;

SELECT sum(idItem) as Soma_ID, sum(precoVendaItem) as Preço, setorItem
from Itens_Estoque
GROUP BY setorItem;

SELECT setorItem as Nome_Setor,
    sum(precoVendaItem * estoqueItem) as valor_total,
    precoVendaItem as Preço_Unitário,
    estoqueItem as Item
from Itens_Estoque
GROUP BY idItem
ORDER BY setorItem;

