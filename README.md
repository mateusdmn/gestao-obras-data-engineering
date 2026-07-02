# 🏗️ Construtec Analytics — Inteligência de Dados para Gestão de Obras

Este projeto é o "coração de dados" de um sistema de gestão de obras (modelo SaaS), onde construtoras e engenheiros gerenciam seus canteiros de obras e escolhem planos de assinatura. 

Desenvolvi esse repositório para aplicar na prática tudo o que aprendi sobre **Banco de Dados (MySQL)** e **Análise de Dados**, focando em organizar tabelas de forma inteligente e criar relatórios que resolvem problemas reais de um negócio.

---

## 📁 O que tem na pasta?

* **`codigo/`**: A pasta com o código da aplicação rodando localmente.
* **`diagrama.png`**: O desenho visual (DER) mostrando como as tabelas se conectam.
* **`schema.sql`**: O script que cria o banco e as tabelas com os tipos de dados certinhos.
* **`seeds.sql`**: Dados fictícios de teste que criei para o banco não ficar vazio.
* **`queries_analiticas.sql`**: O arquivo principal com as análises que criei.

---

## 🛠️ O que eu fiz de melhoria no Banco de Dados?

* **Limpeza Geral:** Joguei fora mais de 20 índices duplicados que o sistema criou sozinho (uma "sujeira" comum de desenvolvimento), deixando a estrutura 100% limpa.
* **Economia de Espaço:** Ajustei colunas como CPF e Telefone. Elas usavam um tamanho gigante sem necessidade, e agora estão otimizadas para ocupar menos memória no servidor.
* **Lógica de Cobrança:** Conectei os usuários diretamente aos planos de monetização através de chaves estrangeiras (`FOREIGN KEY`), o que permitiu fazer as análises financeiras abaixo.


## 🚀 Como testar no seu computador

1. Crie o banco e as tabelas rodando o arquivo `schema.sql`.
2. Adicione os dados de teste rodando o arquivo `seeds.sql`.
3. Execute o arquivo `queries_analiticas.sql` para ver os relatórios e resultados aparecerem na tela!
