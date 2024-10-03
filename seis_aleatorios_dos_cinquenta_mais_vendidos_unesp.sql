/*

2
Unesp
livrariaunesp.com.br (Id: 11216)

TASK: Obter 3 recomendações de produtos que pertençam à categoria do produto mais vendido

*/

-- getSixRandonBooksOfTheFiftyMostSoldOnes
---- Obtém 6 livros aleatórios dos 50 mais vendidos
------ NÃO FUNCIONA (produto "História do inferno" às vezes não é retornado, o mais vendido)
SELECT
	TOP 50 SK.Id AS SKU_ID, COUNT(SK.Id) AS CompradoXVezes, SK.ProductName, SK.ImageUrlBig, CONCAT('https://www.livrariaunesp.com.br', DetailUrl) AS URL, 
	FORMAT(SK.ListPrice, 'C2', 'pt-BR') as ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') as Price, IIF(SK.ListPrice > SK.Price, 1, 0) AS Mostra
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE SK.BrandId = 2000001 AND SK.IsActive = 'true'
GROUP BY SK.Id, SK.ProductName, SK.ImageUrlBig, SK.DetailUrl, SK.Price, SK.ListPrice
ORDER BY CompradoXVezes, NEWDY() DESC

-- getSixRandonBooksOfTheFiftyMostSoldOnes
---- Obtém 6 livros aleatórios dos 50 mais vendidos
------ NÃO FUNCIONA (produto "História do inferno" às vezes não é retornado, o mais vendido)
SELECT
	TOP 50 SK.Id AS SKU_ID, COUNT(SK.Id) AS CompradoXVezes, SK.ProductName, SK.ImageUrlBig, CONCAT('https://www.livrariaunesp.com.br', DetailUrl) AS URL, 
	FORMAT(SK.ListPrice, 'C2', 'pt-BR') as ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') as Price, IIF(SK.ListPrice > SK.Price, 1, 0) AS Mostra
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE SK.BrandId = 2000001 AND SK.IsActive = 'true'
GROUP BY SK.Id, SK.ProductName, SK.ImageUrlBig, SK.DetailUrl, SK.Price, SK.ListPrice
HAVING COUNT(SK.Id) >= 62
ORDER BY NEWID() DESC

-- Obtém os 50 mais vendidos em ordem decrescente
SELECT
	TOP 50 O.SkuId AS SKU_ID, COUNT(O.SkuId) AS CompradoXVezes, SK.ProductName
FROM dt_OrderItem AS O 
INNER JOIN dt_Sku SK 
ON O.SkuId = SK.Id
WHERE SK.BrandId = 2000001
GROUP BY O.SkuId, SK.ProductName
ORDER BY CompradoXVezes DESC

-- getSixRandonBooksOfTheFiftyMostSoldOnes
---- Obtém 6 livros aleatórios dos 50 mais vendidos
------ NÃO FUNCIONA? (ainda não estou certo se os livros retornados se encontram entre os 50 mais vendidos) COMPROVEI QUE NÃO, MAS POR QUÊ?

SELECT
	TOP 6 SK.ProductName, SK.ImageUrlBig, CONCAT('https://www.livrariaunesp.com.br', SK.DetailUrl) AS URL, 
	FORMAT(SK.ListPrice, 'C2', 'pt-BR') as ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') as Price, IIF(SK.ListPrice > SK.Price, 1, 0) AS Mostra
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE SK.BrandId = 2000001 AND 
	SK.IsActive = 'true' AND 
	EXISTS (SELECT TOP 50 ORIT.SkuId AS SKU_ID, COUNT(ORIT.SkuId) AS CompradoXVezes FROM dt_OrderItem AS ORIT
                   GROUP BY ORIT.SkuId
                   ORDER BY CompradoXVezes DESC                   
	       ) 
GROUP BY SK.ProductName, SK.ImageUrlBig, SK.DetailUrl, SK.ListPrice, SK.Price
ORDER BY NEWID() DESC


-- draft
SELECT 
	TOP 6 SK.Id
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE 
	SK.BrandId = 2000001 AND 
	SK.IsActive = 'true' AND
	SK.Id IN (
				SELECT TOP 50 SK.Id, COUNT(SK.Id) AS CompradoXVezes FROM dt_Order AS ORD
				GROUP BY ORD.Id
                ORDER BY CompradoXVezes DESC
			 )
GROUP BY SK.Id
ORDER BY NEWID() DESC                   

-- draft (a query externa deveria voltar os 6 resultados da query interna em ordem aleatória, mas não ocorre)
SELECT
	TOP 6 SK.ProductName, SK.BrandName, SK.ImageUrlBig, CONCAT('https://www.livrariaunesp.com.br', SK.DetailUrl) AS URL, 
	FORMAT(SK.ListPrice, 'C2', 'pt-BR') AS ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') AS Price, IIF(SK.ListPrice > SK.Price, 1, 0) AS Mostra
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE 
SK.BrandId = 2000001 AND 
	SK.IsActive = 'true' AND 
	EXISTS (SELECT TOP 6 ORIT.SkuId AS SKU_ID, COUNT(ORIT.SkuId) AS CompradoXVezes FROM dt_OrderItem AS ORIT
                   INNER JOIN dt_Order ORD
				   ON CONCAT('00-',ORD.OrderId) = ORIT.OrderId
				   INNER JOIN dt_Sku SK 
                   ON ORIT.SkuId = SK.Id
                   WHERE SK.BrandId = 2000001 AND
                   SK.IsActive = 'true'
                   GROUP BY ORIT.SkuId
                   ORDER BY CompradoXVezes DESC                   
	       ) 
GROUP BY SK.ProductName, SK.BrandName, SK.ImageUrlBig, SK.DetailUrl, SK.ListPrice, SK.Price
ORDER BY NEWID() DESC

-- draft (não funciona porque pega 10 do total de 2000 em vez dos 50 mais vendidos, e não cumpre a aleatoriedade)
SELECT
	TOP 10 SK.BrandName, SK.ProductName, OI.SkuId, COUNT(OI.SkuId) AS QuantasVezesComprado
FROM dt_Order AS O 
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE SK.BrandId = 2000001
GROUP BY OI.SkuId, SK.BrandName, SK.ProductName
ORDER BY QuantasVezesComprado DESC, NEWID()

-- draft (deveria voltar sempre os mesmos produtos, apenas mudando a ordem deles, mas sempre volta uma coleção diferente)
SELECT
	TOP 6 SK.Id, SK.ProductName, SK.BrandName
FROM dt_Order AS O 
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE 
SK.BrandId = 2000001 AND
SK.IsActive = 'true' AND
EXISTS (
   SELECT TOP 6 ORIT.SkuId AS SKU_ID, COUNT(ORIT.SkuId) AS CompradoXVezes FROM dt_OrderItem AS ORIT
GROUP BY ORIT.SkuId
ORDER BY CompradoXVezes DESC
)
ORDER BY NEWID()


-- getSixOfTheFixtyMostSoldBooksRandomly
---- Obtém 6 livros aleatórios dos 50 mais vendidos (comprados ao menos 62 vezes até hoje segundo levantamento)
------ draft (funciona, mas às vezes não traz o mais vendido, mesmo sem limitar pra TOP 6, e me parece errado isso, mesmo tendo os registros obedecendo os critérios)
SELECT
	TOP 6 O.SkuId AS SKU_ID, COUNT(O.SkuId) AS CompradoXVezes, SK.ProductName, SK.BrandName
FROM dt_OrderItem AS O 
INNER JOIN dt_Order ORD
ON CONCAT('00-',ORD.OrderId) = O.OrderId
INNER JOIN dt_Sku SK 
ON O.SkuId = SK.Id
WHERE SK.BrandId = 2000001 AND
SK.IsActive = 'true'
GROUP BY O.SkuId, SK.ProductName, SK.BrandName
HAVING COUNT(O.SkuId) >= 62
-- ORDER BY CompradoXVezes DESC                   
ORDER BY NEWID()


-- getSixOfTheFixtyMostSoldBooksRandomly
---- Obtém 6 livros aleatórios dos 50 mais vendidos (versão implementada ao final)

SELECT
	TOP 6 O.SkuId AS SKU_ID, COUNT(O.SkuId) AS CompradoXVezes, SK.ProductName, SK.ImageUrlBig, CONCAT('https://www.livrariaunesp.com.br', SK.DetailUrl) AS URL, 
FORMAT(SK.ListPrice, 'C2', 'pt-BR') AS ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') AS Price, IIF(SK.ListPrice > SK.Price, 1, 0) AS Mostra
FROM dt_OrderItem AS O
INNER JOIN dt_Order ORD
ON CONCAT('00-',ORD.OrderId) = O.OrderId
INNER JOIN dt_Sku SK 
ON O.SkuId = SK.Id
WHERE SK.BrandId = 2000001 AND
SK.IsActive = 'true'
GROUP BY O.SkuId, SK.ProductName, SK.ImageUrlBig, SK.DetailUrl, SK.ListPrice, SK.Price
HAVING COUNT(O.SkuId) >= 62
-- ORDER BY CompradoXVezes DESC                   
ORDER BY NEWID()