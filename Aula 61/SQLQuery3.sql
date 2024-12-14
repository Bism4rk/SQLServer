ALTER FUNCTION trovato.fn_05_Consulta_Dados_Pessoais(@CPF numeric(11))
RETURNS @tbSituacao table(Codigo numeric(6) PRIMARY KEY,
                          Dt_Nasc   date,
						  Nome      nvarchar(100), 
						  Sobrenome nvarchar(100), 
						  DDD  numeric(2),
						  Telefone   numeric(9),
						  Endereco  nvarchar(100), 
						  Estado    nvarchar(100),
						  Regiao    nvarchar(50)
						  )
AS
BEGIN

	IF @CPF IS NOT NULL
		INSERT INTO @tbSituacao

		SELECT 
		       P.ID_PESSOA as 'ID Pessoa',
			   P.DT_NASC as 'Data de Nascimento',
			   P.NOME as 'Nome',
			   P.SOBRENOME as 'Sobrenome',
			   InfP.DDD_TEL_CEL as 'DDD',
			   InfP.TEL_CEL as 'Telefone',
			   CONCAT(E.LOGRADOURO, ', ', E.NUMERO) as 'Endereco',
			   Est.NOME_ESTADO as 'Estado',
			   R.NOME 'Nome 2'
		  FROM trovato.tb04_Pessoas P
		       inner join trovato.tb05_Informacoes_Pessoais InfP on InfP.id_pessoa = p.id_pessoa
		       inner join trovato.tb06_Endereco E on E.id_endereco = infP.id_endereco
			   inner join trovato.tb07_Estados Est on Est.id_estado = E.id_estado
			   inner join trovato.tb08_Regiao R on R.id_regiao = est.id_regiao
		 WHERE 
		       P.CPF = @CPf

	RETURN;

END;

select * from trovato.fn_05_Consulta_Dados_Pessoais(11122233399);
