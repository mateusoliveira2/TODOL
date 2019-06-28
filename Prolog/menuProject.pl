:- module(menuProject, [menuProject/1, receiverToDoData/1]).
:- use_module(menuToDo).
:- use_module(persistenceToDo).
:- use_module(utils).

menuProject(ProjectName):- repeat,
	recuperaProjeto(ProjectName, Descricao, Responsavel, Status, Previsao),
	showProject(ProjectName, Descricao, Responsavel, Status, Previsao),

   	write("1. Criar ToDo\n"),
    write("2. Editar ToDo\n"),
    write("3. Listar ToDo\n"),
    write("4. Filtrar ToDo\n"),
    write("5. Gerar Relatorio\n"),
    write("6. Editar Nome do Projeto\n"),
    write("0. Sair\n"),
    write("Escolha: \n\n"),
    read_line_to_string(user_input, Choice),
        
    ( Choice = "0" -> !, fail ; true ),
    ( Choice = "1" -> receiverToDoData(ProjectName) ; true),
    ( Choice = "3" -> listarToDo(ProjectName); true),
    ( Choice = "2" -> editToDo(ProjectName); true),
    ( Choice = "6" -> editProjectName(ProjectName); true),
        
    fail.

receiverToDoData(ProjectName):-
    write("\n\n-------CRIAR TODO -------\n"),
    write("Digite o nome da ToDO: \n"),
    read_line_to_string(user_input, ToDoName),
    write("Digite a descrição da ToDo: \n"),
    read_line_to_string(user_input, Description),
    write("Digite os responsaveis pela ToDo: \n"),
    read_line_to_string(user_input, Responsible),
    write("Digite a duração (em horas) da ToDo: \n"),
    read_line_to_string(user_input, Duration),
    persistirTodo(ProjectName, ToDoName, Description, Responsible, "A fazer", Duration, "0").

listarToDo(ProjectName):-
    write("\n\n-------LISTAR TODOS -------\n"),
    write("Digite o nome da ToDO: \n"),
    read_line_to_string(user_input, ToDoName),
    recuperaTodo(ProjectName, ToDoName, Description, Responsible, Status, Duration, Horas),
    write(ProjectName),nl,
    write(ToDoName),nl,
    write(Description),nl,
    write(Responsible),nl,
    write(Status),nl,
    write(Duration),nl,
    write(Horas),nl.

editToDo(ProjectName):-
    write("\n\n-------EDITAR TODO-------\n"),
    write("Digite o nome da ToDo: \n"),
    read_line_to_string(user_input, ToDoName),
	( toDoExists(ProjectName, ToDoName) -> 
		write(ToDoName), write(' selecionado com sucesso!\n'), menuToDo(ProjectName, ToDoName); 
		write('ToDo não existe!\n') ),

	menuProject(ProjectName).


editProjectName(ProjectName):-
    write("\n\n-------EDITAR NOME DO PROJETO-------\n"),
    write("Nome atual: "), write(ProjectName),
    write("\n Digite o novo nome: "),
    read_line_to_string(user_input, NewProjectName),
    write("\nNome atualizado com sucesso. Novo nome: "), write(NewProjectName).