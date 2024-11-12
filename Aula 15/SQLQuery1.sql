SELECT * FROM dbo.AlunosxTurmas;

SELECT t.id_turma, SUM(at.valor) Valor_Total FROM dbo.AlunosxTurmas at
INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
GROUP BY t.id_turma


SELECT t.id_turma, c.nome_curso, SUM(at.valor) Valor_Total FROM dbo.AlunosxTurmas at
INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
INNER JOIN dbo.Cursos C on C.id_curso = T.id_curso
GROUP BY t.id_turma, c.nome_curso

-- Subquery! Wow! - Luiz Carlos Jr.
select sum(v.Valor_Total) from(
	SELECT t.id_turma, c.nome_curso, SUM(at.valor) Valor_Total FROM dbo.AlunosxTurmas at
	INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
	INNER JOIN dbo.Cursos C on C.id_curso = T.id_curso
	GROUP BY t.id_turma, c.nome_curso
) v

-- Count
SELECT t.id_turma, SUM(at.valor) Valor_Total, COUNT(AT.id_aluno) Num_Alunos FROM dbo.AlunosxTurmas at
INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
GROUP BY t.id_turma

SELECT t.id_turma, SUM(at.valor) Valor_Total, COUNT(1) Num_Alunos FROM dbo.AlunosxTurmas at
INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
GROUP BY t.id_turma

-- Average (Média)
SELECT t.id_turma, c.nome_curso, AVG(at.valor) Valor_Médio FROM dbo.AlunosxTurmas at
INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
INNER JOIN dbo.Cursos C on C.id_curso = T.id_curso
GROUP BY t.id_turma, c.nome_curso

-- MAX (Máximo) e MIN (Mínimo)
SELECT t.id_turma, c.nome_curso, MAX(at.valor) Valor_Máximo, MIN (at.valor) Valor_Mínimo,  MAX(at.valor) - MIN (at.valor) as DIFERENÇA FROM dbo.AlunosxTurmas at
INNER JOIN dbo.Turmas T on T.id_turma = at.id_turma
INNER JOIN dbo.Cursos C on C.id_curso = T.id_curso
GROUP BY t.id_turma, c.nome_curso
