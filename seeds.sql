-- -----------------------------------------------------
-- Seeds File: População de Dados para Testes e Portfólio
-- -----------------------------------------------------

USE `jdm_db`;

-- Limpeza inicial com reset de contadores AUTO_INCREMENT
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `constructions`;
TRUNCATE TABLE `users`;
TRUNCATE TABLE `monetizacoes`;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. POPULANDO A TABELA DE MONETIZAÇÕES (Planos disponíveis)
INSERT INTO `monetizacoes` (`id`, `nome_plano`, `valor`, `descricao`, `ativo`, `createdAt`, `updatedAt`) VALUES
(1, 'Plano Básico', 49.90, 'Permite gerenciar até 2 obras simultâneas', 1, NOW(), NOW()),
(2, 'Plano Profissional', 149.90, 'Permite gerenciar até 10 obras com relatórios avançados', 1, NOW(), NOW()),
(3, 'Plano Corporativo', 399.90, 'Obras ilimitadas e múltiplos usuários gestores', 1, NOW(), NOW());


-- 2. POPULANDO A TABELA DE USERS 
-- Distribuímos os planos para criar variação financeira nas nossas análises de faturamento
INSERT INTO `users` (`id`, `name`, `email`, `password`, `cpf`, `phone`, `edcadastrado`, `planoId`, `createdAt`, `updatedAt`) VALUES
(1, 'Mateus Dantas', 'mateusd@gmail.com', '$2b$10$AwR36...', '16104405917', '61982522195', 'Itapoã', 1, '2025-11-04 22:09:20', NOW()),
(2, 'Marcos Almeida', 'marcos@gmail.com', '$2b$10$awcd1...', '65498732165', '61982522193', 'Ceilândia', 2, '2025-11-05 16:32:12', NOW()),
(3, 'Francisco de Assis', 'francisco@gmail.com', '$2b$10$4hCw...', '68595785555', '61987326986', 'Paranoá', 1, '2025-11-05 17:00:00', NOW()),
(4, 'Ana Clara Silva', 'anaclara@gmail.com', '$2b$10$abc12...', '12345678901', '11999998888', 'São Paulo', 3, '2025-12-01 10:00:00', NOW()),
(5, 'Ricardo Souza', 'ricardo@gmail.com', '$2b$10$xyz34...', '98765432100', '21988887777', 'Rio de Janeiro', 2, '2026-01-15 14:00:00', NOW());


-- 3. POPULANDO A TABELA DE CONSTRUCTIONS
-- Corrigido para os status em português aceitos pelo ENUM ('Em Planejamento', 'Em Andamento', 'Concluída', 'Suspensa', 'Atrasada')
INSERT INTO `constructions` (`id`, `userId`, `cnpjCpf`, `nomeObra`, `localObra`, `cep`, `dataInicio`, `previsaoTermino`, `fotoObra`, `status`, `progresso`, `createdAt`, `updatedAt`) VALUES
(1, 1, '16104406416', 'Residencial Banco', 'Itapoã DF', '65983258', '2025-11-12', '2026-02-25', NULL, 'Concluída', 100, '2025-11-04 22:10:18', NOW()),
(2, 1, '16104406416', 'Residencial Ceub', 'São Paulo', '65983258', '2025-11-06', '2026-02-06', NULL, 'Atrasada', 85, '2025-11-04 22:15:00', NOW()),
(3, 2, '65498732165', 'Reforma Comercial Centro', 'Ceilândia DF', '72000000', '2026-01-10', '2026-06-30', NULL, 'Em Andamento', 40, '2026-01-05 09:00:00', NOW()),
(4, 3, '16104406416', 'Residencial Itapoã', 'Brasília DF', '65983258', '2025-11-05', '2026-02-19', NULL, 'Concluída', 100, '2025-11-05 16:33:08', NOW()),
(5, 3, '65453232132', 'Residencial Sobradinho', 'Paraná', '65983258', '2025-11-06', '2026-03-27', NULL, 'Concluída', 100, '2025-11-05 16:40:00', NOW()),
(6, 4, '12345678901', 'Prédio Residencial Alvorada', 'São Paulo SP', '01000000', '2026-02-01', '2027-02-01', NULL, 'Em Planejamento', 5, '2026-01-20 11:00:00', NOW()),
(7, 4, '12345678901', 'Reforma Apartamento Jardins', 'São Paulo SP', '02000000', '2026-03-15', '2026-05-15', NULL, 'Em Andamento', 60, '2026-03-01 15:30:00', NOW()),
(8, 5, '98765432100', 'Galpão Logístico Express', 'Rio de Janeiro RJ', '20000000', '2026-02-10', '2026-05-10', NULL, 'Atrasada', 90, '2026-01-20 16:00:00', NOW());
