select * from AlunosxTurmas

select a.*
  from Alunos a
 where a.nome = 'Alan Moraes'

select a.*
  from Alunos a
 where a.data_nascimento >= '01/01/2003'

 --to_date('10122003','ddmmyyyy') -- ORACLE

 -- > maior
 -- < menor
 -- >= maior ou igual
 -- <= menor ou igual
 -- <> diferente
 -- =  igual

 select a.* 
   from alunos a
  where a.sexo = 'F'

 select a.*
   from alunos a
  where a.sexo = 'M'

  select a.*
    from alunos a
   where a.sexo = 'M'
     and a.data_nascimento >= '01/01/2003'
	 and a.id_aluno > 500

  select a.nome, a.sexo, year(a.data_nascimento) ano
    from alunos a
   where a.data_nascimento >= '01/01/2003'

  select *
    from AlunosxTurmas
  
  select at.*
    from alunosxturmas at
   where at.valor > 500

select valor FROM AlunosxTurmas;

select at.id_aluno, at.valor * at.valor_desconto as desconto
  from AlunosxTurmas at;

  select at.id_aluno, at.valor * at.valor_desconto as desconto
    from alunosxturmas at
   where at.valor > 500

select floor(a.valor * a.valor_desconto) as desconto
  from AlunosxTurmas a
 where a.valor_desconto > 0
   and a.valor > 500

--Extra

-- joins (JUNTAR ou UNIR)

select t.id_turma, c.nome_curso, t.data_inicio, t.data_termino, 
       floor(at.valor) valor_bruto, floor((at.valor * at.valor_desconto)) as desconto,
	   floor(at.valor - (at.valor * at.valor_desconto)) as Valor_liquido
  from AlunosxTurmas at, Turmas t, Cursos c
 where at.id_turma = t.id_turma
   and t.id_curso = c.id_curso
   and t.id_turma = 10

select * from turmas;



