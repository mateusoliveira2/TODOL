:- module(menuToDo, [menuToDo/2]).
:- use_module(utils).
:- use_module(persistenceToDo).

menuToDo(ProjectName, ToDoName):- repeat,
		recuperaTodo(ProjectName, ToDoName, Descricao, Responsavel, Status, Previsao, Horas),
		showToDo(ToDoName, Descricao, Responsavel, Status, Previsao, Horas),
        
		write("1. Editar Nome\n"),
        write("2. Editar Responsaveis\n"),
        write("3. Editar Situacao\n"),
        write("4. Cadastrar horas\n"),
        write("0. Sair\n"),
        write("Escolha: \n\n"),
        read_line_to_string(user_input, Choice),
        
        ( Choice = "0" -> !, fail ; true ),
        ( Choice = "1" -> editToDoName(ProjectName, ToDoName) ; true ),
        ( Choice = "2" -> editResponsible(ProjectName, ToDoName) ; true ),
        ( Choice = "3" -> editSituation(ProjectName, ToDoName) ; true ),
        ( Choice = "4" -> editHours(ProjectName, ToDoName) ; true ),
        fail.


editTodoName(ProjectName, ToDoName):-
        write("Editar nome do ToDo\n\n"),
        write("Nome atual: "), write(ToDoName),
        write("\nDigite o novo nome: "),
        read_line_to_string(user_input, NewName),
    
        write("\nNome atuaizado com sucesso: "), write(NewName).

editResponsible(ProjectName, ToDoName):-
        write("Editar Responsáveis pela ToDo\n\n"),
        write("\nDigite os novos responsaveis: "),
        read_line_to_string(user_input, NewResponsible),
    
        write("\nResponsáveis atualizados com sucesso: "), write(NewResponsible).

editSituation(ProjectName, ToDoName):-
        write("Editar Situação da ToDo\n\n"),
        write("1. A fazer\n"),
        write("2. Em andamento\n"),
        write("3. Concluido\n"),
        write("Escolha: \n"),
        read_line_to_string(user_input, ChoiceSituation),
        write(ChoiceSituation).

editHours(ProjectName, ToDoName) :-
        write("Cadastrar horas da ToDo\n\n"),
        write("Quantas horas deseja cadastrar?"),
        read_line_to_string(user_input, Hours),
		addHours(ProjectName, ToDoName, Hours),
        write("Horas cadastradas").
