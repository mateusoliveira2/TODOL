:- module(utils, [showToDo/6, showProject/5, showList/1, notEmpty/1, showExistentProjects/1, showExistentTodos/1, repeatString/2, porcentagem/3, barraProgresso/3]).

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
