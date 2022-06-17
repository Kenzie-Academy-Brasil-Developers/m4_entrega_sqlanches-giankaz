-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes (nome, lealdade)
  VALUES 
  ('Georgia', 0);

-- 2)

INSERT INTO pedidos (status, cliente_id)
  VALUES 
  ('Recebido', (SELECT id FROM clientes c WHERE c.nome = 'Georgia'));

-- 3)

INSERT INTO produtos_pedidos (pedido_id, produto_id)
  VALUES 
  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes c WHERE c.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Big Serial')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes c WHERE c.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Varchapa')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes c WHERE c.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Fritas')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes c WHERE c.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Coca-Cola')),

  ((SELECT id FROM pedidos ped WHERE ped.cliente_id = (SELECT id FROM clientes c WHERE c.nome = 'Georgia')), 
  (SELECT id FROM produtos prod WHERE prod.nome = 'Coca-Cola'));

--((Selecionando ID do pedido onde o ID do Cliente for igual ao ID do cliente de nome Georgia), (Selecionando o ID do produto de nome Big Serial))

-- Leitura

-- 1)

SELECT * FROM clientes c

JOIN pedidos ped ON ped.cliente_id = c.id
JOIN produtos_pedidos pp ON pp.pedido_id = ped.id
JOIN produtos prod ON prod.id = pp.produto_id

WHERE c.nome = 'Georgia';


-- Atualização

-- 1)

UPDATE clientes 
SET lealdade =
(SELECT SUM(pts_de_lealdade) FROM clientes c

JOIN pedidos ped ON ped.cliente_id = c.id
JOIN produtos_pedidos pp ON pp.pedido_id = ped.id
JOIN produtos prod ON prod.id = pp.produto_id

WHERE c.nome = 'Georgia')
WHERE nome = 'Georgia';


-- Deleção

-- 1)

DELETE FROM clientes c WHERE c.nome = 'Marcelo';
