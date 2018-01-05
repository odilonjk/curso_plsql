CREATE OR REPLACE PROCEDURE atualizar_cliente_segmercado
    (p_id cliente.id%type,
     p_segmercado_id cliente.segmercado_id%type)
IS
BEGIN
    UPDATE cliente
        SET segmercado_id = p_segmercado_id
        WHERE id = p_id;
    COMMIT;
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

