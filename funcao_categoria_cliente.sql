CREATE OR REPLACE FUNCTION categoria_cliente
    (p_faturamento_previsto IN CLIENTE.FATURAMENTO_PREVISTO%TYPE)
    RETURN CLIENTE.CATEGORIA%TYPE
IS
BEGIN
    IF p_faturamento_previsto < 10000 THEN
        RETURN 'PEQUENO';
    ELSIF p_faturamento_previsto < 50000 THEN
        RETURN 'MÉDIO';
    ELSIF p_faturamento_previsto < 100000 THEN
        RETURN 'MÉDIO GRANDE';
    ELSE
        RETURN 'GRANDE';
    END IF;
END;