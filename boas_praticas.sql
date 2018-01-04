DECLARE
    -- Não é uma boa pratica declarar o tipo da variável
    v_id number(5) := 1;
    v_descricao varchar2(100) := 'varejo';
BEGIN
    INSERT INTO segmercado VALUES (v_id, v_descricao);
    COMMIT;
END;

DECLARE
    -- Este comando pega o tipo de dado usado na coluna ID da tabela SEGMERCADO.
    -- Desta forma caso o DBA altere o tipo da coluna, o bloco ainda vai funcionar.
    v_id segmercado.id%type := 2;
    v_descricao segmercado.descricao%type := 'atacado';
BEGIN
    INSERT INTO segmercado VALUES (v_id, UPPER(v_descricao));
    COMMIT;
END;

SELECT * FROM SEGMERCADO;