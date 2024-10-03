/*

2
Unesp
livrariaunesp.com.br (Id: 11216)

TASK: Obter 3 recomendações de produtos que pertençam à categoria do produto mais vendido

*/

-- getSixMostSoldByUnesp (versão completa)
---- Obtém os 6 livros mais vendidos da editora Unesp 

SELECT
	TOP 6 SK.Id AS SKU_ID, COUNT(SK.Id) AS CompradoXVezes, SK.BrandName, SK.ProductName, SK.ProductCategoryIds, C.Name AS Categoria, SK.ImageUrlBig, 
	CONCAT('https://www.livrariaunesp.com.br', DetailUrl) AS URL, FORMAT(SK.ListPrice, 'C2', 'pt-BR') as ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') as Price
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
INNER JOIN dt_Product P
ON SK.ProductID = P.ProductID
INNER JOIN dt_Category C
ON P.CategoryID = C.CategoryID
WHERE SK.BrandId = 2000001
GROUP BY BrandName, SK.Id, SK.ProductName, C.Name, SK.ProductCategoryIds, SK.ImageUrlBig, SK.DetailUrl, SK.Price, SK.ListPrice
ORDER BY CompradoXVezes DESC

-- getSixMostSoldByUnesp (versão necessária)
---- Obtém os 6 livros mais vendidos da editora Unesp 

SELECT
	TOP 6 SK.Id AS SKU_ID, COUNT(SK.Id) AS CompradoXVezes, SK.ProductName, SK.ImageUrlBig, CONCAT('https://www.livrariaunesp.com.br', DetailUrl) AS URL, 
	FORMAT(SK.ListPrice, 'C2', 'pt-BR') AS ListPrice, FORMAT(SK.Price, 'C2', 'pt-BR') AS Price, IIF(SK.ListPrice > SK.Price, 1, 0) AS Mostra
FROM dt_Order AS O
INNER JOIN dt_OrderItem OI 
ON CONCAT('00-',O.OrderId) = OI.OrderId
INNER JOIN dt_Sku SK 
ON OI.SkuId = SK.Id
WHERE SK.BrandId = 2000001 AND SK.IsActive = 'true'
GROUP BY SK.Id, SK.ProductName, SK.ImageUrlBig, SK.DetailUrl, SK.Price, SK.ListPrice
ORDER BY CompradoXVezes DESC


/**********************************************************************************************************************/
/**********************************************************************************************************************/

/*
<var rows="GetRowsByTemplate('getSixMostSoldByUnesp')"/>
<if condition="rows.Count > 0">
<center>
<h3>Os 6 mais vendidos da Editora Unesp</h3>

<table bgcolor="#c1c3c3">
<tr>
  <td>
   <table cellspacing="0" cellpadding="0" width="650px">
	<tbody>
	 <tr> <!-- primeira linha & primeira coluna -->
	  <td> <!-- primeira linha & primeira coluna -->
		 <table cellspacing="0" cellpadding="0" width="650px" border="0" bgcolor="#dffaf9">
			<tbody>
				<tr>
					<td style="padding:2px; text-align:center;"><b>${rows[0]['ProductName']}</b></td>
					<td style="padding:2px; text-align:center;"><b>${rows[1]['ProductName']}</b></td>
					<td style="padding:2px; text-align:center;"><b>${rows[2]['ProductName']}</b></td>
				</tr>
				<tr>
					<td style="padding:2px; text-align:center;"><a href="${rows[0]['URL']}" target="_blank"><img src="${rows[0]['ImageUrlBig']}" style="display: block; border: 0" width="220px" height="220px"></a></td>
					<td style="padding:2px; text-align:center;"><a href="${rows[1]['URL']}" target="_blank"><img src="${rows[1]['ImageUrlBig']}" style="display: block; border: 0" width="220px" height="220px"></a></td>
					<td style="padding:2px; text-align:center;"><a href="${rows[2]['URL']}" target="_blank"><img src="${rows[2]['ImageUrlBig']}" style="display: block; border: 0" width="220px" height="220px"></a></td>
				</tr>
				<tr>
					<td style="padding:2px; text-align:center;"><if condition="rows[0]['Mostra'] == 'true'"><s>De: ${rows[0]['ListPrice']}</s> => Por: ${rows[0]['Price']} </if><else>${rows[0]['Price']}</else></td>
					<td style="padding:2px; text-align:center;"><if condition="rows[1]['Mostra'] == 'true'"><s>De: ${rows[1]['ListPrice']}</s> => Por: ${rows[1]['Price']} </if><else>${rows[1]['Price']}</else></td>
					<td style="padding:2px; text-align:center;"><if condition="rows[2]['Mostra'] == 'true'"><s>De: ${rows[2]['ListPrice']}</s> => Por: ${rows[2]['Price']} </if><else>${rows[2]['Price']}</else></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="padding:2px; text-align:center;"><b>${rows[3]['ProductName']}</b></td>
					<td style="padding:2px; text-align:center;"><b>${rows[4]['ProductName'	]}</b></td>
					<td style="padding:2px; text-align:center;"><b>${rows[5]['ProductName']}</b></td>
				</tr>
				<tr>
					<td style="padding:2px; text-align:center;"><a href="${rows[3]['URL']}" target="_blank"><img src="${rows[3]['ImageUrlBig']}" style="display: block; border: 0" width="220px" height="220px"></a></td>
					<td style="padding:2px; text-align:center;"><a href="${rows[4]['URL']}" target="_blank"><img src="${rows[4]['ImageUrlBig']}" style="display: block; border: 0" width="220px" height="220px"></a></td>
					<td style="padding:2px; text-align:center;"><a href="${rows[5]['URL']}" target="_blank"><img src="${rows[5]['ImageUrlBig']}" style="display: block; border: 0" width="220px" height="220px"></a></td>
				</tr>
				<tr>
					<td style="padding:2px; text-align:center;"><if condition="rows[3]['Mostra'] == 'true'"><s>De: ${rows[3]['ListPrice']}</s> => Por: ${rows[3]['Price']} </if><else>${rows[3]['Price']}</else></td>
					<td style="padding:2px; text-align:center;"><if condition="rows[4]['Mostra'] == 'true'"><s>De: ${rows[4]['ListPrice']}</s> => Por: ${rows[4]['Price']} </if><else>${rows[4]['Price']}</else></td>
					<td style="padding:2px; text-align:center;"><if condition="rows[5]['Mostra'] == 'true'"><s>De: ${rows[5]['ListPrice']}</s> => Por: ${rows[5]['Price']} </if><else>${rows[5]['Price']}</else></td>
				</tr>
			</tbody>
		 </table>
	  </td>
	 </tr>
	</tbody>
   </table>
 </td>
</tr>
</table>
</center>
</if>
*/