:- module(utils, [showToDo/6, showProject/5]).

showProject(Name,Description,Responsable,Status,Prevision):-
	write("\n\n"),
	write("┌────────────────────────────────────────────────\n"),
	write("│ Nome: "), writeln(Name),
	write("│ Descricao: "), writeln(Description),
	write("│ Responsavel: "), writeln(Responsable),
	write("│ Status: "), writeln(Status),
    write("│ Previsao: "), writeln(Prevision),
    write("└────────────────────────────────────────────────\n\n").

showToDo(Name,Description,Responsable,Status,Prevision,Hour):-
	write("\n\n"),
	write("┌────────────────────────────────────────────────\n"),
	write("│ Nome: "), writeln(Name),
	write("│ Descricao: "), writeln(Description),
	write("│ Responsavel: "), writeln(Responsable),
	write("│ Status: "), writeln(Status),
    write("│ Previsao: "), writeln(Prevision),
    write("│ Hora(s) cadastrada(s): "), writeln(Hour),
    write("└────────────────────────────────────────────────\n\n").

showToDo([Name,Description,Responsable,Status,Prevision,Hour]):-
	showToDo(Name,Description,Responsable,Status,Prevision,Hour).

searchMatching(Key, Filter):- sub_atom(Key,Before,Length,After,Filter).

applyFilterByName([], _).
applyFilterByName([[Name,Description,Responsable,Status,Prevision,Hour]|T], Filter):-
        (searchMatching(Name, Filter), showToDo([Name,Description,Responsable,Status,Prevision,Hour]), applyFilterByName(T, Filter));
        applyFilterByName(T, Filter).

filterByNameAllToDos(ProjectName, FilterName):- 
        write("\n\n------- ToDos filtradas por nome -------\n"),
        captureAllTodos(ProjectName, Todos),
        applyFilterByName(Todos, FilterName).

applyFilterBySituation([], _).
applyFilterBySituation([[Name,Description,Responsable,Status,Prevision,Hour]|T], Filter):-
        (searchMatching(Status, Filter), showToDo([Name,Description,Responsable,Status,Prevision,Hour]), applyFilterBySituation(T, Filter));
        applyFilterBySituation(T, Filter).

filterBySituationAllToDos(ProjectName, FilterSituation):-
        write("\n\n------- ToDos filtradas por situacao -------\n"),
        captureAllTodos(ProjectName, Todos),
        applyFilterBySituation(Todos, FilterSituation).

applyFilterByResponsable([], _).
applyFilterByResponsable([[Name,Description,Responsable,Status,Prevision,Hour]|T], Filter):-
        (searchMatching(Responsable, Filter), showToDo([Name,Description,Responsable,Status,Prevision,Hour]), applyFilterByResponsable(T, Filter));
        applyFilterByResponsable(T, Filter).

filterByResponsableAllToDos(ProjectName, FilterResponsable):-
        write("\n\n------- ToDos filtradas por responsavel -------\n"),
        captureAllTodos(ProjectName, Todos),
        applyFilterByResponsable(Todos, FilterResponsable).
