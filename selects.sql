-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT ped.id,
       ped.status,
       ped.cliente_id,
       prod.id,
       prod.nome,
       prod.tipo,
       prod.preco,
       prod.pts_de_lealdade 
       
FROM produtos_pedidos pp
       
JOIN pedidos ped 
 ON pp.pedido_id = ped.id
 
JOIN produtos prod
 ON pp.produto_id = prod.id ;

-- 2)

SELECT pp.pedido_id AS id
       
FROM produtos_pedidos pp
       
WHERE pp.produto_id =

(SELECT id FROM produtos prod
 WHERE prod.nome = 'Fritas');

-- 3)

SELECT c.nome AS gostam_de_fritas
       
FROM clientes c 

JOIN pedidos ped ON ped.cliente_id = c.id
JOIN produtos_pedidos pp ON ped.id = pp.pedido_id
JOIN produtos prod ON pp.produto_id = prod.id

WHERE prod.nome = 'Fritas';

-- 4)

SELECT SUM(preco) FROM produtos prod

JOIN produtos_pedidos pp ON pp.produto_id = prod.id
JOIN pedidos ped ON pp.pedido_id = ped.id
JOIN clientes c ON c.id = ped.cliente_id

WHERE c.nome = 'Laura';

-- 5)

SELECT prod.nome, COUNT(*) FROM produtos prod  

JOIN produtos_pedidos pp ON pp.produto_id = prod.id
GROUP BY prod.nome;