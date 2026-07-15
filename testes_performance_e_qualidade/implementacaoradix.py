def radix_sort_int(lista, crescente=True):
    """
    Ordenação Radix Sort para inteiros positivos.
    """
    if not lista:
        return lista
    
    max_val = max(lista)
    exp = 1
    while max_val // exp > 0:
        # Counting Sort para o dígito atual
        output = [0] * len(lista)
        count = [0] * 10
        
        for i in range(len(lista)):
            index = (lista[i] // exp) % 10
            count[index] += 1
            
        for i in range(1, 10):
            count[i] += count[i - 1]
            
        i = len(lista) - 1
        while i >= 0:
            index = (lista[i] // exp) % 10
            output[count[index] - 1] = lista[i]
            count[index] -= 1
            i -= 1
            
        for i in range(len(lista)):
            lista[i] = output[i]
            
        exp *= 10
        
    if not crescente:
        lista.reverse()
    return lista