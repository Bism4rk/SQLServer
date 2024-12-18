CREATE TABLE dbo.DADOS(
	REGISTRO varchar(100)
);

INSERT INTO dbo.DADOS (REGISTRO) VALUES ('Registro 1; Registro 1');
INSERT INTO dbo.DADOS (REGISTRO) VALUES ('Registro 2; REGISTRO 2');
INSERT INTO dbo.DADOS (REGISTRO) VALUES ('Registro 3; Registro 4');

TRUNCATE TABLE dbo.DADOS;

select * from dbo.DADOS;

CREATE FUNCTION dbo.FN_IdentificaDuplicidade(@vTextoOriginal varchar(100))
RETURNS VARCHAR (100)
AS BEGIN
	declare @vPosicao as int -- contar onde estar o ;
	declare @vTextoParte1 as varchar(100) -- Primeira palavra
	declare @vTextoParte2 as varchar (100) -- Segunda palavra
	declare @Resultado as varchar(100) -- Resultado da análise

	set @vPosicao = charindex(';', @vTextoOriginal)
	set @vTextoParte1 = SUBSTRING(@vTextoOriginal, 1, @vPosicao - 1)
	set @vTextoParte2 = SUBSTRING(@vTextoOriginal, @vPosicao + 1, 100)

	-- tratamento para eliminar espaços

	set @vTextoParte1= trim(ltrim(rtrim(@vTextoParte1)))
	set @vTextoParte2= trim(ltrim(rtrim(@vTextoParte2)))

	-- Saída resultado
	if @vTextoParte1 = @vTextoParte2 set @Resultado = 'Iguais' else set @Resultado = 'Diferentes'


	RETURN @Resultado


END;

select REGISTRO, dbo.FN_IdentificaDuplicidade(REGISTRO) FROM dbo.DADOS;
