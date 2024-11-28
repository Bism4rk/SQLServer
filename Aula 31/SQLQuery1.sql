--IF ... ELSE...
--Aula 31
----------------------------------------------

DROP TABLE TTEMP;
select * INTO tTEMP FROM ALUNOS;

IF 10 > 20 
   select '10 é maior que 20'
ELSE
   SELECT '10 é menor que 20';

IF DATENAME(weekday, getdate()) IN ('Sábado', 'Domingo')
   SELECT 'Estamos no fim de semana. Hoje é ' + DATENAME(weekday, getdate())
ELSE
   SELECT 'Estamos em um dia de semana. Hoje é ' + DATENAME(weekday, getdate());

--Vari�veis Globais do SQL

SELECT @@SERVERNAME;
SELECT @@LANGUAGE;
SELECT @@LANGID;
SELECT @@TRANCOUNT;

IF @@LANGUAGE <> 'Português (Brasil)'
   SELECT 'Today is ' + datename(weekday, getdate())
ELSE
   SELECT 'Hoje é ' + datename(weekday, getdate());

IF OBJECT_ID('dbo.Alunos','U') is null
   SELECT 'Esta tabela não existe!'
ELSE
   EXEC sp_columns Alunos;
/*
voc� pode ter visto o c�digo Transact-SQL que transmite cadeias de caracteres usando um prefixo N. 
Isso indica que a seq��ncia subsequente est� em Unicode (o N realmente significa conjunto de 
caracteres do idioma nacional). O que significa que voc� est� passando um valor 
NCHAR, NVARCHAR ou NTEXT, em oposi��o a CHAR, VARCHAR ou TEXT.

Prefixo constantes da cadeia de caracteres Unicode com a letra N. Sem o prefixo N, a cadeia � 
convertida na p�gina de c�digos padr�o do banco de dados. Esta p�gina de c�digo padr�o pode 
n�o reconhecer certos caracteres.
*/

DECLARE @vIdadeMax INT;
DECLARE @vParam    INT;
    SET @vIdadeMax = 21;
	SET @vParam = 29;

IF @vIdadeMax >= @vParam
	SELECT NOME, DATA_NASCIMENTO, DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
	  FROM tTEMP
	 WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) >= @vIdadeMax
	 ORDER BY 3 ASC
ELSE
	SELECT NOME, DATA_NASCIMENTO, DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) IDADE
	  FROM tTEMP
	 WHERE DATEDIFF(YEAR, DATA_NASCIMENTO, GETDATE()) < @vIdadeMax
	 ORDER BY 3 ASC;

DROP TABLE tTEMP