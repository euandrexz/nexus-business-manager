-- =========================================================
-- Consultas SQL - Nexus Business Manager
-- =========================================================

-- =========================================
-- 1. Listar todos os clientes
-- =========================================
SELECT * FROM clientes
ORDER BY nome;

-- =========================================
-- 2. Listar todos os produtos ativos
-- =========================================
SELECT * FROM produtos
WHERE ativo = TRUE
ORDER BY nome;

-- =========================================
-- 3. Listar vendas com nome do cliente
-- =========================================
SELECT
    v.id AS venda_id,
    c.nome AS cliente,
    v.data_venda,
    v.valor_total,
    v.status
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
ORDER BY v.data_venda DESC;

-- =========================================
-- 4. Listar itens de venda com nome do produto
-- =========================================
SELECT
    iv.id,
    iv.venda_id,
    p.nome AS produto,
    iv.quantidade,
    iv.preco_unitario,
    iv.subtotal
FROM itens_venda iv
JOIN produtos p ON iv.produto_id = p.id
ORDER BY iv.venda_id;

-- =========================================
-- 5. Total gasto por cliente
-- =========================================
SELECT
    c.nome AS cliente,
    SUM(v.valor_total) AS total_gasto
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
GROUP BY c.nome
ORDER BY total_gasto DESC;

-- =========================================
-- 6. Quantidade de vendas por status
-- =========================================
SELECT
    status,
    COUNT(*) AS quantidade
FROM vendas
GROUP BY status
ORDER BY quantidade DESC;

-- =========================================
-- 7. Produtos mais vendidos
-- =========================================
SELECT
    p.nome AS produto,
    SUM(iv.quantidade) AS total_vendido
FROM itens_venda iv
JOIN produtos p ON iv.produto_id = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC, produto ASC;

-- =========================================
-- 8. Faturamento total
-- =========================================
SELECT
    SUM(valor_total) AS faturamento_total
FROM vendas
WHERE status = 'CONCLUIDA';

-- =========================================
-- 9. Ticket médio das vendas concluídas
-- =========================================
SELECT
    ROUND(AVG(valor_total), 2) AS ticket_medio
FROM vendas
WHERE status = 'CONCLUIDA';

-- =========================================
-- 10. Cliente que mais comprou
-- =========================================
SELECT
    c.nome AS cliente,
    SUM(v.valor_total) AS total_comprado
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
WHERE v.status = 'CONCLUIDA'
GROUP BY c.nome
ORDER BY total_comprado DESC
LIMIT 1;

-- =========================================
-- 11. Produtos com estoque baixo
-- =========================================
SELECT
    nome,
    estoque,
    categoria
FROM produtos
WHERE estoque <= 10
ORDER BY estoque ASC;

-- =========================================
-- 12. Vendas canceladas
-- =========================================
SELECT
    v.id,
    c.nome AS cliente,
    v.valor_total,
    v.data_venda
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
WHERE v.status = 'CANCELADA';

-- =========================================
-- 13. Produtos e categorias
-- =========================================
SELECT
    categoria,
    COUNT(*) AS quantidade_produtos
FROM produtos
GROUP BY categoria
ORDER BY quantidade_produtos DESC;

-- =========================================
-- 14. Clientes cadastrados recentemente
-- =========================================
SELECT
    nome,
    email,
    data_cadastro
FROM clientes
ORDER BY data_cadastro DESC;

-- =========================================
-- 15. Detalhes completos das vendas
-- =========================================
SELECT
    v.id AS venda_id,
    c.nome AS cliente,
    p.nome AS produto,
    iv.quantidade,
    iv.preco_unitario,
    iv.subtotal,
    v.status,
    v.data_venda
FROM vendas v
JOIN clientes c ON v.cliente_id = c.id
JOIN itens_venda iv ON v.id = iv.venda_id
JOIN produtos p ON iv.produto_id = p.id
ORDER BY v.id, p.nome;