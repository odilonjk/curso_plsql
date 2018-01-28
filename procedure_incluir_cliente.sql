CREATE OR REPLACE PROCEDURE incluir_cliente
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_cnpj IN cliente.cnpj%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
    v_cnpj cliente.cnpj%type := p_cnpj;
    --Componente exception
    e_null EXCEPTION;
    PRAGMA exception_init (e_null, -1400);
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto);
    formatar_cnpj(v_cnpj);
    INSERT INTO cliente
        VALUES (p_id, UPPER(p_razao_social), v_cnpj, p_segmercado_id, 
                SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;

    EXCEPTION
        --Tratando a exception de primary key.
        WHEN dup_val_on_index THEN
            raise_application_error(-20010,'ID já esta em uso.');
        --Tratando a exception de NULL.                
        WHEN e_null THEN
            raise_application_error(-20015, 'A coluna ID tem preenchimento obrigatório.');
        -- Erro others pega erros não previstos. Sempre precisa ser o último.
        WHEN others THEN
            raise_application_error(-20020, 'Erro ocorrido: ' || sqlerrm());
            
END;

EXECUTE INCLUIR_CLIENTE(3, 'ATLASSIAN', '12121212', 4, 400000);

SELECT * FROM CLIENTE;