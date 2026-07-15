# ==============================================================================
# INTEGRIDADE DO SCHEMA DE DADOS DE ENTRADA DO PROJETO DE GESTÃO DE OBRAS
# Garante que a estrutura das tabelas ou arquivos de obras não mude de forma inesperada.
# ==============================================================================
import pandas as pd
import pytest

def processar_dados_obra(df: pd.DataFrame) -> pd.DataFrame:
    # Colunas obrigatórias para o cálculo de materiais
    colunas_obrigatorias = {"id_obra", "material", "quantidade", "preco_unitario"}
    
    # Validação do Schema
    if not colunas_obrigatorias.issubset(df.columns):
        raise ValueError(f"Schema inválido! Colunas faltantes: {colunas_obrigatorias - set(df.columns)}")
        
    # Processamento (Cálculo de Custo Total)
    df["custo_total"] = df["quantidade"] * df["preco_unitario"]
    return df

# Teste unitário para validar o comportamento do schema
def test_schema_faltando_colunas_deve_lancar_erro():
    
    dados_corrompidos = pd.DataFrame({
        "id_obra": [1],
        "material": ["Areia"],
        "quantidade": [10]
    })
    
    with pytest.raises(ValueError, match="Schema inválido"):
        processar_dados_obra(dados_corrompidos)