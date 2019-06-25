:- module(menuProject, [menuProject/1, receiverToDoData/1, showProject/0]).
:- use_module(menuToDo).

menuProject(ProjectName):- repeat,
        write("\n\n ------- "), write(ProjectName), write(" ------- \n\n"),
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
        ( Choice = 1 -> receiverToDoData(ProjectName) ; true),
        ( Choice = 2 -> editToDo(ProjectName); true),
        ( Choice = 6 -> editProjectName(ProjectName); true),
        
        fail.

receiverToDoData(ProjectName):-
        write("\n\n-------CRIAR TODO -------\n"),
        write("Digite o nome da ToDO: \n"),
        read(ToDoName),
        write("Digite a descrição da ToDo: \n"),
        read(Description),
        write("Digite os responsaveis pela ToDo: \n"),
        read(Responsible),
        write("Digite a duração (em horas) da ToDo: \n"),
        read(Duration),
        write(ToDoName), write(" "), write(ProjectName),write(" ") , write(Description), write(" "),write(Responsible),
        write(" "), write(Duration).

editToDo(ProjectName):-
        write("\n\n-------EDITAR TODO-------\n"),
        write("Digite o nome da ToDo: \n"),
        read(ToDoName),
        write(ToDoName),write(' selecionado com sucesso!'),
        menuToDo(ProjectName, ToDoName).

editProjectName(ProjectName):-
        write("\n\n-------EDITAR NOME DO PROJETO-------\n"),
        write("Nome atual: "), write(ProjectName),
        write("\n Digite o novo nome: "),
        read(NewProjectName),
        write("\nNome atualizado com sucesso. Novo nome: "), write(NewProjectName).

showProject:-
	write("\n\n┌────────────────────────────────────────────────\n"),
	write("│ Nome: \n" ),
	write("│ Descrição: \n") ,
	write("│ Responsável: \n") ,
	write("│ Status: \n"),
	write("│ Estimativa: \n") ,
        write("└────────────────────────────────────────────────\n\n").
