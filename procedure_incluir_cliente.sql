CREATE OR REPLACE PROCEDURE incluir_cliente
   (p_id in cliente.id%type,
    p_razao_social IN cliente.razao_social%type,
    p_cnpj cliente.cnpj%type ,
    p_segmercado_id IN cliente.segmercado_id%type,
    p_faturamento_previsto IN cliente.faturamento_previsto%type)
IS
    v_categoria cliente.categoria%type;
BEGIN
    IF p_faturamento_previsto < 10000 THEN
        v_categoria := 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        v_categoria := 'MÉDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        v_categoria := 'MÉDIO GRANDE';
    ELSE
        v_categoria := 'GRANDE';
    END IF;
    INSERT INTO cliente
        VALUES (p_id, UPPER(p_razao_social), p_cnpj, p_segmercado_id, 
                SYSDATE, p_faturamento_previsto, v_categoria);
    COMMIT;
END;

EXECUTE INCLUIR_CLIENTE(1, 'KROGERCODE CO.', '0123456789', 1, 20000);

SELECT * FROM CLIENTE;