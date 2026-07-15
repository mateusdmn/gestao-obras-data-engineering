# ==============================================================================
# QUALIDADE DO DADO QUE VAI CHEGAR QUANDO O USUÁRIO FIZER O CÁLCULO DA OBRA
# Garante que os valores de entrada (como quantidades e preços) sejam válidos e lógicos.
# ==============================================================================
from pydantic import BaseModel, Field, ValidationError
import pytest

# 1. Definimos o esquema ideal do nosso dado de obra
class InsumoObra(BaseModel):
    id_insumo: int = Field(..., gt=0)  
    nome_material: str
    quantidade: float = Field(..., ge=0)  
    preco_unitario: float = Field(..., gt=0) 

# 2. Escrevemos os testes unitários com pytest
def test_insumo_valido():
    # Esse dado está correto, deve passar sem erros
    dados = {
        "id_insumo": 1024,
        "nome_material": "Cimento CP II",
        "quantidade": 150.0,
        "preco_unitario": 34.90
    }
    assert InsumoObra(**dados)

def test_insumo_quantidade_negativa_deve_falhar():
    # Esse dado está incorreto (quantidade negativa)
    dados_invalidos = {
        "id_insumo": 1024,
        "nome_material": "Cimento CP II",
        "quantidade": -10.0,  # Erro aqui!
        "preco_unitario": 34.90
    }
    with pytest.raises(ValidationError):
        InsumoObra(**dados_invalidos)