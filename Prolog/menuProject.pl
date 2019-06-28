:- module(menuProject, [menuProject/1, receiverToDoData/1]).
:- use_module(menuToDo).
:- use_module(persistenceToDo).
:- use_module(utils).
:- use_module(menuFilter).

menuProject(NomeProjeto):- repeat,
	recuperaProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao),
	showProject(NomeProjeto, Descricao, Responsavel, Status, Previsao),

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
    ( Choice = "1" -> receiverToDoData(NomeProjeto) ; true),
    ( Choice = "3" -> listarToDo(NomeProjeto); true),
    ( Choice = "2" -> editToDo(NomeProjeto); true),
    ( Choice = "4" -> menuFilter(NomeProjeto); true),
    ( Choice = "5" -> gerarRelatorio(NomeProjeto); true),
    ( Choice = "6" -> editNomeProjeto(NomeProjeto); true),
        
    fail.
listarToDo([], NomeProjeto) :- write("").
listTodos([H|T], NomeProjeto) :-
	List == [] -> write("\n"); 
	(visaoGeralTodo(NomeProjeto, H), 
	listTodos(T, NomeProjeto)). 

somaHoras([], NomeProjeto, Soma) :- Soma is 0.
somaHoras([H|T], NomeProjeto, Soma) :- 
	somaHoras(T, NomeProjeto, Resto),
	getHoras(H, NomeProjeto, Horas),
	Soma is Resto + Horas.

somaPrevisoes([], NomeProjeto, Soma) :- Soma is 0.
somaPrevisoes([H|T], NomeProjeto, Soma) :- 
	somaPrevisoes(T, NomeProjeto, Resto),
	getPrevisao(H, NomeProjeto, Previsao),
	Soma is Resto + Previsao.

visaoGeralProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao, TodoList) :-
	somaPrevisoes(TodoList, NomeProjeto, HorasPrevistasTodos),
	somaHoras(TodoList, NomeProjeto, TotalHorasTrabalhadas),
	
	write("┌"), repeatString("─", 55), nl,
	write("│ "), write("Projeto previsto para "), write(Previsao), write(" hora(s)\n"),
	write("│ As previsões dos ToDos somam "), write(HorasPrevistasTodos), write(" hora(s)\n"),
	write("│ Foram trabalhadas "), write(TotalHorasTrabalhadas), write(" hora(s)\n"),
	write("│ "), barraProgresso(HorasPrevistasTodos, TotalHorasTrabalhadas, 50),
    write("└"), repeatString("─", 55), nl.

gerarRelatorio(NomeProjeto) :-
	recuperaProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao),
	showProject(NomeProjeto, Descricao, Responsavel, Status, Previsao),
	allTodosList(NomeProjeto, TodoList),

	write("===== Relatório de "), write(NomeProjeto), write(" =====\n"),

	write("Resumo do progresso do projeto\n"),
	visaoGeralProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao, TodoList),
	
	write("Resumo do progresso dos ToDos\n"),
	listTodos(TodoList, NomeProjeto).
	

receiverToDoData(NomeProjeto):-
    write("\n\n-------CRIAR TODO -------\n"),
    write("Digite o nome da ToDO: \n"),
    read_line_to_string(user_input, ToDoName),
    write("Digite a descrição da ToDo: \n"),
    read_line_to_string(user_input, Description),
    write("Digite os responsaveis pela ToDo: \n"),
    read_line_to_string(user_input, Responsible),
    write("Digite a duração (em horas) da ToDo: \n"),
    read_line_to_string(user_input, Duration),
    persistirTodo(NomeProjeto, ToDoName, Description, Responsible, "A fazer", Duration, "0").

listarToDo(NomeProjeto):-
    write("\n\n-------LISTAR TODOS -------\n"),
    write("Digite o nome da ToDO: \n"),
    read_line_to_string(user_input, ToDoName),
    recuperaTodo(NomeProjeto, ToDoName, Description, Responsible, Status, Duration, Horas),
    write(NomeProjeto),nl,
    write(ToDoName),nl,
    write(Description),nl,
    write(Responsible),nl,
    write(Status),nl,
    write(Duration),nl,
    write(Horas),nl.

editToDo(ProjectName):-
    allTodosList(ProjectName, Todos),
    length(Todos, SzList),

    (SzList > 0) -> (
        write("\n\n-------EDITAR TODO-------\n"),
        showExistentTodos(Todos),
        write("Digite o nome da ToDo: \n"),
        read_line_to_string(user_input, ToDoName),
        ( toDoExists(ProjectName, ToDoName) -> 
            write(ToDoName), write(' selecionado com sucesso!\n'), menuToDo(ProjectName, ToDoName)
            );
        write("\nO toDo selecionado não existe.")
    );
    write("\nNão há todos a serem editados."),
    menuProject(ProjectName).

editNomeProjeto(NomeProjeto):-
    write("\n\n-------EDITAR NOME DO PROJETO-------\n"),
    write("Nome atual: "), write(NomeProjeto),
    write("\n Digite o novo nome: "),
    read_line_to_string(user_input, NewNomeProjeto),
    write("\nNome atualizado com sucesso. Novo nome: "), write(NewNomeProjeto).
