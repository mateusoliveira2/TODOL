:- use_module(utils).

menuProject(ProjectName):- repeat,
        write("\n\n ------- Filtro de ToDos do Projeto "), write(ProjectName), write(" ------- \n\n"),
       	write("1. Filtrar por nome\n"),
        write("2. Fitrar por situacao\n"),
        write("3. Filtrar por responsavel\n"),
        write("0. Sair\n"),
        write("Escolha: \n\n"),
        read_line_to_string(user_input, Choice),
        
        ( Choice = "0" -> !, fail ; true ),
        ( Choice = "1" -> filterByName(ProjectName) ; true),
        ( Choice = "2" -> filterBySituation(ProjectName); true),
        ( Choice = "3" -> filterByResponsable(ProjectName); true),
        
        fail.

filterByName(ProjectName):-
        write("\n\n------- Filtro por nome -------\n"),
        write("Digite o filtro de nome: \n"),
        read_line_to_string(user_input, FilterName),
        filterByNameAllToDos(ProjectName, FilterName).

filterBySituation(ProjectName):-
        write("\n\n------- Filtro por situacao -------\n"),
        write("1. A fazer\n"),
        write("2. Em andamento\n"),
        write("3. Concluido\n"),
        write("Escolha: \n\n"),
        read_line_to_string(user_input, Choice),

        ( Choice = 1 -> filterBySituationAllToDos(ProjectName, "A fazer") ),
        ( Choice = 2 -> filterBySituationAllToDos(ProjectName, "Em andamento") ),
        ( Choice = 3 -> filterBySituationAllToDos(ProjectName, "Concluido") ).

filterByResponsable(ProjectName):-
        write("\n\n------- Filtro por responsavel -------\n"),
        write("Digite o filtro de responsavel: \n"),
        read_line_to_string(user_input, FilterResponsable),
        filterByResponsableAllToDos(ProjectName, FilterResponsable).
