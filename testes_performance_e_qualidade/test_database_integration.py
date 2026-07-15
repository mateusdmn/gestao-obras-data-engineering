# ==============================================================================
# TESTE DE INTEGRAÇÃO DO BANCO DE DADOS DA GESTÃO DE OBRAS (SQLITE EM MEMÓRIA)
# Valida se a inserção e gravação de relatórios de materiais funciona.
# ==============================================================================
import sqlite3
import pytest

# Função que salva os dados calculados da obra no banco
def salvar_relatorio_obra(conn, id_obra, custo_total):
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS relatorios (
            id_obra INTEGER PRIMARY KEY,
            custo_total REAL
        )
    """)
    cursor.execute("INSERT INTO relatorios VALUES (?, ?)", (id_obra, custo_total))
    conn.commit()

# Teste de integração usando SQLite em memória (:memory:)
def test_salvar_relatorio_no_banco():
    # Criamos uma conexão isolada em memória para o teste
    conexao_mock = sqlite3.connect(":memory:")
    
    # Executamos a função
    salvar_relatorio_obra(conexao_mock, id_obra=42, custo_total=15000.50)
    
    # Validamos se o dado foi realmente gravado no banco fictício
    cursor = conexao_mock.cursor()
    cursor.execute("SELECT * FROM relatorios WHERE id_obra = 42")
    resultado = cursor.fetchone()
    
    assert resultado is not None
    assert resultado[1] == 15000.50
    
    conexao_mock.close()