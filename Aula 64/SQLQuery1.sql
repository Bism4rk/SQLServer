select * from dbo.alunos;

CREATE VIEW dbo.vw_ListagemAlunosCompleta AS select * from dbo.alunos;

select * from dbo.vw_ListagemAlunosCompleta;

select [nome], [data_nascimento], [sexo] FROM [dbo].[vw_ListagemAlunosCompleta] WHERE [nome] LIKE 'Ale%';

-- Colchetes???????????´
-- Vem em queries padrao como "Selecionar 1000 Linhas Superiores

-- WHERE funciona em view?????
-- Funciona sim! So ORDER BY que nao!

CREATE VIEW dbo.vw_ListagemAlunosCompleta2 AS select * from dbo.alunos ORDER BY 1;
-- Da erro

-- Erro no "Ale%"??????????

select [nome], [data_nascimento], [sexo] FROM [dbo].[vw_ListagemAlunosCompleta] WHERE [nome] LIKE "Ale%";  -- DÁ ERRO!!!!
select [nome], [data_nascimento], [sexo] FROM [dbo].[vw_ListagemAlunosCompleta] WHERE [nome] LIKE 'Ale%'; -- FUNCIONA!!!	
