CREATE OR REPLACE PROCEDURE atualizar_cliente_segmercado
    (p_id cliente.id%type,
     p_segmercado_id cliente.segmercado_id%type)
IS
    e_cliente_id_inexistente exception;
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
    
    -- Retorna TRUE se comando anterior não fez nada.
    IF SQL%NOTFOUND THEN
        --RAISE é o comando que força o erro de execução.
        RAISE e_cliente_id_inexistente;
    END IF;
    COMMIT;
    
    EXCEPTION
        WHEN e_cliente_id_inexistente THEN
            raise_application_error(-20100, 'ID de cliente inexistente.');
END;

--  Executando a procedure em um loop
DECLARE
    v_segmercado_id cliente.segmercado_id%type := 4;
    v_id number(3);
BEGIN
    v_id := 1;
    LOOP
        ATUALIZAR_CLIENTE_SEGMERCADO(v_id, v_segmercado_id);
        v_id := v_id + 1;
        EXIT WHEN v_id > 3;
    END LOOP;
END;

--  Outro exemplo de loop
DECLARE
    v_segmercado_id cliente.segmercado_id%type := 2;
BEGIN
    FOR i in 1..3 LOOP
        ATUALIZAR_CLIENTE_SEGMERCADO(i, v_segmercado_id);
    END LOOP;
END;

SELECT * FROM CLIENTE;

--Testando a exception.
EXECUTE ATUALIZAR_CLIENTE_SEGMERCADO(99, 2);