:- module(utils, [showToDo/6, showToDo/2, showProject/5, showList/1, notEmpty/1, showExistentProjects/1, showExistentTodos/1, repeatString/2, porcentagem/3, barraProgresso/3, filterByNameAllToDos/2, filterBySituationAllToDos/2, filterByResponsableAllToDos/2]).
:- use_module(persistenceToDo).

barraProgresso(Esperado, Cadastrado, Tam) :-
	Esperado =< Cadastrado -> ( write("["), repeatString("+", round(Tam)), write("] 100%\n") );
	(porcentagem(Cadastrado, Esperado, ValorReal), 
	ValorRealFloat is round(ValorReal),
	Valor is round(ValorReal / 100 * Tam),
	Resto is round(Tam) - Valor,
	write("["),
	repeatString("+", Valor),
	repeatString(".", Resto),
	write("] "),
	write(ValorRealFloat),
	write("%\n")).

porcentagem(A, B, Res) :-
	A >= B,
	Res is 100.0.

porcentagem(A, B, Res) :-
	Res is A / B * 100.0.

repeatString(String, Num) :-
	write(String), 
	Prox is Num - 1,
	Prox > 0 -> repeatString(String, Prox); write("").

notEmpty(List):- member(_, List).

problem(Element) :-
    (Element == .);
    (Element == ..).

show(Element) :-
    not(problem(Element)) -> write("- "), write(Element), write("\n"); write("").

showList([]) :- write("").
showList( [Head|Tail] ):-
    show(Head),
    (notEmpty(Tail) -> showList(Tail); write("")).

showExistentTodos(Todos) :-
    write("\nTodos existentes: \n"),
    showList(Todos), write("\n").

showExistentProjects(Projects) :-
    write("\nProjetos existentes: \n"),
    showList(Projects), write("\n").

showProject(Name,Description,Responsable,Status,Prevision):-
	write("\n\n"),
	write("┌────────────────────────────────────────────────\n"),
	write("│ Nome: "), writeln(Name),
	write("│ Descricao: "), writeln(Description),
	write("│ Responsavel: "), writeln(Responsable),
	write("│ Status: "), writeln(Status),
    write("│ Previsao: "), write(Prevision), write(" hora(s)\n"),
    write("└────────────────────────────────────────────────\n\n").

showToDo(Name, ProjectName) :-
	recuperaTodo(ProjectName, Name, Descricao, Responsavel, Status, Previsao, Horas),
	write("\n\n"),
	write("┌────────────────────────────────────────────────\n"),
	write("│ Nome: "), writeln(Name),
	write("│ Descricao: "), writeln(Descricao),
	write("│ Responsavel: "), writeln(Responsavel),
	write("│ Status: "), writeln(Status),
    write("│ Previsao: "), writeln(Previsao),
    write("│ Hora(s) cadastrada(s): "), write(Horas), write(" hora(s)\n"),
    write("└────────────────────────────────────────────────\n").

showToDo(Name,Description,Responsable,Status,Prevision,Hour):-
	write("\n\n"),
	write("┌────────────────────────────────────────────────\n"),
	write("│ Nome: "), writeln(Name),
	write("│ Descricao: "), writeln(Description),
	write("│ Responsavel: "), writeln(Responsable),
	write("│ Status: "), writeln(Status),
    write("│ Previsao: "), writeln(Prevision),
    write("│ Hora(s) cadastrada(s): "), write(Hour), write(" hora(s)\n"),
    write("└────────────────────────────────────────────────\n\n").

showToDo([Name,Description,Responsable,Status,Prevision,Hour]):-
	showToDo(Name,Description,Responsable,Status,Prevision,Hour).

searchMatching(Key, Filter):- sub_atom(Key,Before,Length,After,Filter).

applyFilterByName(_, [], _).
applyFilterByName(ProjectName, [NameTodo|T], Filter):-
        recuperaTodo(ProjectName, NameTodo, Description, Responsable, Status, Prevision, Hour),
        searchMatching(NameTodo, Filter) -> (
            showToDo(NameTodo,Description,Responsable,Status,Prevision,Hour),
            applyFilterByName(ProjectName, T, Filter)
            );
        applyFilterByName(ProjectName, T, Filter).

filterByNameAllToDos(ProjectName, FilterName):- 
        write("\n\n------- ToDos filtradas por nome -------\n"),
        allTodosList(ProjectName, Todos),
        applyFilterByName(ProjectName, Todos, FilterName).

applyFilterBySituation(_, [], _).
applyFilterBySituation(ProjectName, [NameTodo|T], Filter):-
        recuperaTodo(ProjectName, NameTodo, Description, Responsable, Status, Prevision, Hour),
        searchMatching(Status, Filter) -> (
            showToDo(NameTodo,Description,Responsable,Status,Prevision,Hour),
            applyFilterBySituation(ProjectName, T, Filter)
            );
        applyFilterBySituation(ProjectName, T, Filter).

filterBySituationAllToDos(ProjectName, FilterSituation):-
        write("\n\n------- ToDos filtradas por situacao -------\n"),
        allTodosList(ProjectName, Todos),
        applyFilterBySituation(ProjectName, Todos, FilterSituation).

applyFilterByResponsable(_,[], _).
applyFilterByResponsable(ProjectName, [NameTodo|T], Filter):-
        recuperaTodo(ProjectName, NameTodo, Description, Responsable, Status, Prevision, Hour),
        searchMatching(Responsable, Filter) -> (
            showToDo(NameTodo,Description,Responsable,Status,Prevision,Hour),
            applyFilterByResponsable(ProjectName, T, Filter)
            );
        applyFilterByResponsable(ProjectName, T, Filter).

filterByResponsableAllToDos(ProjectName, FilterResponsable):-
        write("\n\n------- ToDos filtradas por responsavel -------\n"),
        allTodosList(ProjectName, Todos),
        applyFilterByResponsable(ProjectName, Todos, FilterResponsable).
