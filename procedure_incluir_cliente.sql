CREATE OR REPLACE PROCEDURE incluir_cliente
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_cnpj cliente.cnpj%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
BEGIN
    v_categoria := categoria_cliente(p_faturamento_previsto);
    INSERT INTO cliente
        VALUES (p_id, UPPER(p_razao_social), p_cnpj, p_segmercado_id, 
                SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

EXECUTE INCLUIR_CLIENTE(2, 'DELL', '9876543210', 2, 1100000);

SELECT * FROM CLIENTE;