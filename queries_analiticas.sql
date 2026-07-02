CREATE DATABASE jdm_db;
SELECT * FROM jdm_db.users;
SELECT * FROM jdm_db.constructions;
SELECT * FROM jdm_db.monetizacoes;
-- Pergunta de negócio: Quantas obras nós temos em cada status e 
-- Qual é o progresso médio dos projetos para identificar gargalos operacionais?
SELECT 
    status,
    COUNT(id) AS total_obras,
    ROUND(AVG(progresso), 2) AS progresso_medio_percentual
FROM constructions
GROUP BY status
ORDER BY total_obras DESC;

-- Pergunta de negócio: Qual é a distribuição regional dos nossos usuários 
-- cadastrados para direcionar campanhas de marketing?

SELECT 
    edcadastrado AS regiao_usuario,
    COUNT(id) AS quantidade_usuarios
FROM users
GROUP BY edcadastrado
ORDER BY quantidade_usuarios DESC;

-- Pergunta de negócio: Quem são os nossos clientes mais ativos
-- Quantas obras cada um possui e qual o status geral dos seus projetos?

SELECT 
    u.name AS cliente,
    u.email,
    COUNT(o.id) AS total_obras_cadastradas,
    SUM(CASE WHEN o.status = 'Concluída' THEN 1 ELSE 0 END) AS obras_concluidas,
    SUM(CASE WHEN o.status = 'Atrasada' THEN 1 ELSE 0 END) AS obras_atrasadas,
    SUM(CASE WHEN o.status = 'Em Andamento' THEN 1 ELSE 0 END) AS obras_em_andamento
FROM users u
LEFT JOIN constructions o ON u.id = o.userId
GROUP BY u.id, u.name, u.email
ORDER BY total_obras_cadastradas DESC;