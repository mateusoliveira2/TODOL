:- module(menuProject, [menuProject/1, showProject/0]).

menuProject(NameProject):- repeat,
        write("\n\n ------- "), write(NameProject), write(" ------- \n\n"),
       	write("1. Criar ToDo\n"),
        write("2. Editar ToDo\n"),
        write("3. Listar ToDo\n"),
        write("4. Filtrar ToDo\n"),
        write("5. Gerar Relatorio\n"),
        write("6. Editar Nome do Projeto\n"),
        write("0. Sair\n"),
        write("Escolha: \n\n"),
        read(Choice),
        
        ( Choice = 0 -> !, fail ; true ),
        
        fail.

showProject:-
	write("\n\n┌────────────────────────────────────────────────\n"),
	write("│ Nome: \n" ),
	write("│ Descrição: \n") ,
	write("│ Responsável: \n") ,
	write("│ Status: \n"),
	write("│ Estimativa: \n") ,
        write("└────────────────────────────────────────────────\n\n").