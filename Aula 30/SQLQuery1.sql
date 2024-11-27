--TRANSACTION
--Aula 30

--BEGIN TRANSACTION
--ROLLBACK TRANSACTION
--COMMIT;
----------------------------------------------

DROP TABLE TTEMP;

SELECT *
  INTO tTEMP
  FROM ALUNOS;

SELECT * FROM tTEMP;

BEGIN TRANSACTION;
   UPDATE tTEMP 
      SET SEXO = LOWER(SEXO);
COMMIT;

SELECT * FROM tTEMP;


BEGIN TRANSACTION;
    UPDATE tTEMP SET SEXO = UPPER(SEXO);
ROLLBACK;

SELECT * FROM tTEMP;


BEGIN TRANSACTION;
   DROP TABLE tTEMP;
ROLLBACK;

SELECT * FROM tTEMP;

------------------
DECLARE @TR1 VARCHAR(20);
 SELECT @TR1 = 'Transação Delete';

BEGIN TRANSACTION @TR1;

  DELETE FROM tTEMP 
   WHERE NOME LIKE 'G%';

COMMIT TRANSACTION @TR1;

SELECT * FROM tTEMP;

--M�ltiplos pontos de Transaction
--Nomeando as transa��es
/*
O exemplo a seguir cria uma tabela, gera tr�s n�veis de transa��es aninhadas e, 
em seguida, confirma a transa��o aninhada. Embora cada instru��o COMMIT TRANSACTION 
tenha um par�metro transaction_name, n�o h� nenhuma rela��o entre as instru��es 
COMMIT TRANSACTION e BEGIN TRANSACTION. Os par�metros transaction_name ajudam 
o programador a assegurar que o n�mero correto de confirma��es seja codificado 
para decrementar @@TRANCOUNT para 0 e, assim, confirmar a transa��o externa.
*/
------------------------

IF OBJECT_ID('TabelaTeste','U') is not null
   DROP TABLE TabelaTeste;
GO

CREATE TABLE TabelaTeste (ID int PRIMARY KEY, LETRA char(1));
GO

exec sp_columns TabelaTeste;

--Iniciar a vari�vel de controle de transctions @@TRANCOUNT para 1

BEGIN TRANSACTION TR1;
      PRINT 'Transaction : contador depois do BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (1, 'A');

BEGIN TRANSACTION TR2;
      PRINT 'Transaction : contador depois do 2º BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (2, 'B');

BEGIN TRANSACTION TR3;
      PRINT 'Transaction : contador depois do 3º BEGIN = ' + CAST(@@TRANCOUNT as NVARCHAR(10));
	  INSERT INTO TabelaTeste VALUES (3, 'C');

COMMIT TRANSACTION TR2;
      PRINT 'Transaction : contador depois do COMMIT TR2 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

COMMIT TRANSACTION TR1;
      PRINT 'Transaction : contador depois do COMMIT TR1 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));

COMMIT TRANSACTION TR3;
      PRINT 'Transaction : contador depois do COMMIT TR3 = ' + CAST(@@TRANCOUNT AS NVARCHAR(10));
