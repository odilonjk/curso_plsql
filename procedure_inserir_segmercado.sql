CREATE OR REPLACE PROCEDURE incluir_segmercado
    (p_id IN segmercado.id%type,
     p_descricao IN segmercado.descricao%type)
IS
BEGIN
    INSERT INTO segmercado VALUES (p_id, UPPER(p_descricao));
    COMMIT;
END;

EXECUTE incluir_segmercado(3, 'Farmacêutico');

SELECT * FROM SEGMERCADO;

-- Chamando uma procedure de dentro de um bloco
BEGIN
    incluir_segmercado(4, 'industrial');
    COMMIT;
END;