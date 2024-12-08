--Aula 01 - Function Remover_Espa�os
------------------------------------
--Autor: Alessandro Trovato
--Aula 55- Playlist SQL Server
--https://www.youtube.com/aletrovato
------------------------------------

use sql_db_1;
go

-- DROP SCHEMA trovato;
CREATE SCHEMA trovato;

CREATE TABLE trovato.tb01_Nomes(
	NOMES nvarchar(100) NOT NULL
);

INSERT INTO trovato.tb01_Nomes (NOMES) VALUES ('  Jos�   Carlos   Delfinetto   Silva  ')
INSERT INTO trovato.tb01_Nomes (NOMES) VALUES ('Paulo   Karlovisky   J�nior')
INSERT INTO trovato.tb01_Nomes (NOMES) VALUES (' Alberto  Haroldo   Estassenn   ')
INSERT INTO trovato.tb01_Nomes (NOMES) VALUES ('   Juan�lisson  Carlos   Jesus   ')
INSERT INTO trovato.tb01_Nomes (NOMES) VALUES ('Pablo   Paulo   Palacios  ')


select count(*) from trovato.tb01_Nomes;
select * from trovato.tb01_Nomes;
select LTRIM(NOMES) from trovato.tb01_Nomes;
select TRIM(NOMES) from trovato.tb01_Nomes;
select REPLACE(NOMES, '  ', ' ') from trovato.tb01_Nomes;

--RTRIM | Remove os espa�os � direita
--LTRIM | Remove os espa�os � esquerda
--TRIM  | Remove os caracteres n�o imprim�veis
--REPLACE | Substitui��o de caracteres

--------------------------------------------------

CREATE FUNCTION trovato.fn_01_Remover_Espa�os(@Texto as nvarchar(100))
returns nvarchar(100)
as
BEGIN
	
	if @Texto is null return null;

	--Declara��o das vari�veis
	--------------------------
	declare @NovoTexto	nvarchar(100);

	--Inicializar as vari�veis
	--------------------------
	select @NovoTexto = @Texto;

	--Remover os caracteres (espa�o)
	set @NovoTexto = LTRIM(@NovoTexto)
	set @NovoTexto = RTRIM(@NovoTexto)

	while charindex('  ', @NovoTexto) > 0
	begin
		set @NovoTexto = replace(@NovoTexto, '  ', ' ');
	end
	
	return @NovoTexto;

END;

------------------------------------------

select trovato.fn_01_Remover_Espa�os(NOMES) as Nome_Sem_Espa�os from trovato.tb01_Nomes;
