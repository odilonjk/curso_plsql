CREATE OR REPLACE PROCEDURE formatar_cnpj
    (p_cnpj IN OUT CLIENTE.CNPJ%TYPE)
IS
BEGIN
    p_cnpj := substr(p_cnpj, 1, 2) ||'/'|| substr(p_cnpj, 3);
END;

VARIABLE g_cnpj varchar2(10);
EXECUTE :g_cnpj := '0000000';
PRINT g_cnpj;

EXECUTE formatar_cnpj(:g_cnpj);
PRINT g_cnpj;