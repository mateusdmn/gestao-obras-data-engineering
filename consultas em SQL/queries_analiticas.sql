-- ==============================================================================
-- CONSULTAS SQL DO DIA A DIA PARA GESTÃO E TOMADA DE DECISÃO NAS OBRAS
-- ==============================================================================

-- Criando o nosso banco de dados da aplicação
CREATE DATABASE jdm_db;


-- ------------------------------------------------------------------------------
-- 1. ESPIA RÁPIDA NOS DADOS (visualizar os últimos 5 usuários)
-- ------------------------------------------------------------------------------
SELECT name, email, edcadastrado 
FROM users 
ORDER BY createdAt DESC 
LIMIT 5;


-- ------------------------------------------------------------------------------
-- 2. FILTRANDO OBRAS EM ANDAMENTO para ver possíveis prioridades
-- ------------------------------------------------------------------------------
SELECT nomeObra, localObra, progresso 
FROM constructions 
WHERE status = 'Em Andamento' 
ORDER BY progresso ASC;


-- ------------------------------------------------------------------------------
-- 3. PAGINAÇÃO DE DADOS 
-- ------------------------------------------------------------------------------
SELECT nomeObra, localObra 
FROM constructions 
LIMIT 5 OFFSET 5;


-- ------------------------------------------------------------------------------
-- 4. RESUMO DOS PLANOS DE ASSINATURA 
-- ------------------------------------------------------------------------------
SELECT nome_plano, COUNT(id) AS total_usuarios, AVG(valor) AS preco_medio
FROM monetizacoes
WHERE ativo = 1
GROUP BY nome_plano;


-- ------------------------------------------------------------------------------
-- 5. RELACIONANDO DONO E OBRA 
-- ------------------------------------------------------------------------------
SELECT 
    u.name AS engenheiro_responsavel, 
    c.nomeObra AS nome_da_obra, 
    c.localObra AS cidade_estado
FROM users u
INNER JOIN constructions c ON u.id = c.userId;


-- ------------------------------------------------------------------------------
-- 6. LOCALIZANDO OBRAS COM DATA DE TÉRMINO PRÓXIMA (Filtros de Data)
-- "Quais obras têm previsão de término a partir do ano de 2026? 
-- ------------------------------------------------------------------------------
SELECT nomeObra, previsaoTermino, progresso 
FROM constructions 
WHERE previsaoTermino >= '2026-01-01' 
ORDER BY previsaoTermino ASC;