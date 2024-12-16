CREATE TABLE CPF_CNPJ(
	NUMERO_DOCUMENTO NUMERIC(14, 0) NOT NULL
); 

SELECT * FROM CPF_CNPJ;

INSERT INTO CPF_CNPJ (NUMERO_DOCUMENTO) VALUES (11122233344);
INSERT INTO CPF_CNPJ (NUMERO_DOCUMENTO) VALUES (11222333000101);
INSERT INTO CPF_CNPJ (NUMERO_DOCUMENTO) VALUES (11);
INSERT INTO CPF_CNPJ (NUMERO_DOCUMENTO) VALUES (00111222000102);

-- CPF: 11 caracteres - 111.222.333-44
-- CNPJ: 14 caracteres - 11.222.333/0001-01

SELECT LEN(NUMERO_DOCUMENTO) from CPF_CNPJ;

-- Identificando CPF e CNPJ

SELECT 
	NUMERO_DOCUMENTO, 
	CASE WHEN LEN(NUMERO_DOCUMENTO) <= 11 THEN 'Pessoa F�sica' ELSE 'Pessoa Jur�dica' END as TIPO
FROM CPF_CNPJ;

-- Formata��o do resultado
SELECT 
	NUMERO_DOCUMENTO, 
	CASE WHEN LEN(NUMERO_DOCUMENTO) <= 11 THEN 'CPF' ELSE 'CNPJ' END as TIPO,
	CASE WHEN LEN(NUMERO_DOCUMENTO) <= 11 THEN FORMAT(NUMERO_DOCUMENTO, '0##\.###\.###-##') ELSE FORMAT(NUMERO_DOCUMENTO, '0#\.###\.###\/####-##') END as FORMATADO
FROM CPF_CNPJ
