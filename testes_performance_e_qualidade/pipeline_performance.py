import time
import random
import matplotlib.pyplot as plt

# ---  GERADOR DE DADOS DE ENGENHARIA CIVIL ---
def gerar_insumos_da_obra(tamanho):
    """
    Simula uma lista de IDs de insumos de materiais de construção civil.
    Intervalo de IDs baseado na codificação padrão de insumos .
    """
    return [random.randint(100000, 999999) for _ in range(tamanho)]

# ---  PIPELINE DE TESTES ---
def processar_e_testar_performance():
    # Testando com volumes crescentes de dados de obras
    volumes_dados = [100, 1_000, 10_000, 50_000, 100_000, 250_000, 500_000]
    
    resultados = {
        'Volume (N)': [],
        'Tempo (ms) - Crescente': [],
        'Tempo (ms) - Decrescente': []
    }
    
    print("=== PIPELINE DE DADOS: ORDENAÇÃO DE MATERIAIS ===")
    
    for N in volumes_dados:
        print(f"Processando e ordenando lote de {N:,} insumos de materiais...")
        ids_materiais = gerar_insumos_da_obra(N)
        
        # Teste Crescente (Prioridade de entrega/ID padrão)
        lote_crescente = ids_materiais.copy()
        inicio = time.perf_counter()
        radix_sort_int(lote_crescente, crescente=True)
        tempo_crescente = (time.perf_counter() - inicio) * 1000
        
        # Teste Decrescente (Prioridade invertida)
        lote_decrescente = ids_materiais.copy()
        inicio = time.perf_counter()
        radix_sort_int(lote_decrescente, crescente=False)
        tempo_decrescente = (time.perf_counter() - inicio) * 1000
        
        # Armazenando métricas do pipeline
        resultados['Volume (N)'].append(N)
        resultados['Tempo (ms) - Crescente'].append(tempo_crescente)
        resultados['Tempo (ms) - Decrescente'].append(tempo_decrescente)
        
    return resultados

# ---  VISUALIZAÇÃO DE BI (DASHBOARD DE PERFORMANCE) ---
def gerar_grafico_performance_obras(dados):
    plt.figure(figsize=(10, 6))
    
    plt.plot(dados['Volume (N)'], dados['Tempo (ms) - Crescente'], 
             label='Ordenação IDs Crescente (Mais Antigos Primeiro)', 
             marker='o', linestyle='-', color='#1f77b4', linewidth=2)

    plt.plot(dados['Volume (N)'], dados['Tempo (ms) - Decrescente'], 
             label='Ordenação IDs Decrescente (Lançamentos Recentes)', 
             marker='x', linestyle='--', color='#d62728', linewidth=2)

    plt.title('Performance do Pipeline: Ordenação de Insumos de Obras (Radix Sort)', 
              fontsize=13, fontweight='bold', pad=15)
    plt.xlabel('Volume de Materiais Processados (N)', fontsize=11)
    plt.ylabel('Tempo de Processamento (ms)', fontsize=11)
    plt.legend(fontsize=10)
    plt.grid(True, linestyle=':', alpha=0.6)
    plt.ticklabel_format(style='plain', axis='x')
    plt.xlim(left=0)
    plt.tight_layout()
    
    
    print("\n[SUCESSO] Gráfico  gerado e salvo!")
    plt.show()

# ---  EXECUÇÃO DO PIPELINE ---
if __name__ == '__main__':
    metricas = processar_e_testar_performance()
    gerar_grafico_performance_obras(metricas)