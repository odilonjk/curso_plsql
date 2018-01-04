DECLARE
    v_id segmercado.id%type := 1;
    v_descricao segmercado.descricao%type := 'varejista';
BEGIN
    UPDATE segmercado
        SET descricao = UPPER(v_descricao)
        WHERE id = v_id;
    COMMIT;
    
    v_id := 2;
    v_descricao := 'atacadista';
    UPDATE segmercado
        SET descricao = UPPER(v_descricao)
        WHERE id = v_id;
    COMMIT;
    
END;

SELECT * FROM SEGMERCADO;

DECLARE
    v_id segmercado.id%type := 3;
    v_descricao segmercado.descricao%type := 'esportivo';
BEGIN
    INSERT INTO segmercado VALUES (v_id, UPPER(v_descricao));
    COMMIT;
END;

DECLARE
    v_id segmercado.id%type := 3;
BEGIN
    DELETE FROM segmercado
        WHERE id = v_id;
    COMMIT;
END;