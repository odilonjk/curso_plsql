CREATE OR REPLACE FUNCTION obter_descricao_segmercado
    (p_id IN segmercado.id%type)
    RETURN segmercado.descricao%type
IS
    v_descricao segmercado.descricao%type;
BEGIN
    SELECT descricao INTO v_descricao
        FROM segmercado
        WHERE id = p_id;
    RETURN v_descricao;
END;

--Chamando a função
VARIABLE g_descricao varchar2(100);
EXECUTE :g_descricao := obter_descricao_segmercado(1);
PRINT g_descricao;

--Chamando função dentro de um bloco
SET SERVEROUTPUT ON;
DECLARE
    v_descricao segmercado.descricao%type;
BEGIN
    v_descricao := obter_descricao_segmercado(4);
    dbms_output.put_line('Descrição: ' || v_descricao);
END;