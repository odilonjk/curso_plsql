DECLARE
    v_id cliente.id%type;
    v_segmercado_id cliente.segmercado_id%type := 2;
    CURSOR cur_cliente IS
        SELECT id FROM cliente;
BEGIN
    /*É neste momento que ele executa o select
    e guarda o resultado em memória.*/
    OPEN cur_cliente;
    
    LOOP
        FETCH cur_cliente INTO v_id;
        EXIT WHEN cur_cliente%NOTFOUND;
        ATUALIZAR_CLIENTE_SEGMERCADO(v_id, v_segmercado_id);
    END LOOP;
    
    -- Fechar o cursor para liberar as linhas que estão em memória
    CLOSE cur_cliente;
    
    COMMIT;
END;

SELECT * FROM cliente;

-- Escrevendo o bloco de uma forma resumida:
DECLARE
    v_segmercado_id cliente.segmercado_id%type := 3;
    CURSOR cur_cliente IS
        SELECT id FROM cliente;
BEGIN   
    FOR cli_rec IN cur_cliente LOOP
        ATUALIZAR_CLIENTE_SEGMERCADO(cli_rec.id, v_segmercado_id);
    END LOOP; 
    
    COMMIT;
END;