INSERT INTO Turmas(id_turma, id_curso, data_inicio, data_termino, data_cadastro, login_cadastro)
VALUES(1, 4, '17/11/2024', '24/12/2024', '04/11/2024 16:00:00', 'REICH')

select * from turmas;

select * from Alunos;
INSERT INTO AlunosxTurmas(id_turma, id_aluno, valor, valor_desconto, data_cadastro, login_cadastro) 
VALUES (1, 1, 1200, 0.1, GETDATE(), 'REICH')