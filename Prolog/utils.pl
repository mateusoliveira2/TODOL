
showToDo([Name,Description,Responsable,Status,Prevision,Hour]):-
	write("\n\n┌────────────────────────────────────────────────\n"),
	write("│ Nome: "), writeln(Name),
	write("│ Descricao: "), writeln(Description),
	write("│ Responsavel: "), writeln(Responsable),
	write("│ Status: "), writeln(Status),
	write("│ Previsao: "), writeln(Prevision),
    write("│ Hora(s) cadastrada(s): "), writeln(Hour),
        write("└────────────────────────────────────────────────\n\n").


searchMatching(Key, [], Result):- Result = TRUE.
searchMatching([HK|TK], [HF|TF], Result):-
        (HK =:= HF, searchMatching(TK, TF); Result = FALSE.

searchMatchingAllPrefix(Key, Filter, Result):-
        (length(Key) >= length(Filter), (searchMatching(Key, Filter, Result), Result =:= FALSE, ...); Result = False).

applyFilterByName([], _).
applyFilterByName([[Name,Description,Responsable,Status,Prevision,Hour]|T], Filter):-
        searchMatchingAllPrefix(Name, Filter, Result),
        (Result == TRUE -> showToDo([Name,Description,Responsable,Status,Prevision,Hour]) ),
        applyFilterByName(T, Filter).

filterByNameAllToDos(ProjectName, FilterName):- 
        write("\n\n------- ToDos filtradas por nome -------\n"),
        applyFilterByName(captureAllToDos(ProjectName), FilterName).

applyFilterBySituation([], _).
applyFilterBySituation([[Name,Description,Responsable,Status,Prevision,Hour]|T], Filter):-
        searchMatchingAllPrefix(Status, Filter, Result),
        (Result == TRUE -> showToDo([Name,Description,Responsable,Status,Prevision,Hour]) ),
        applyFilterBySituation(T, Filter).

filterBySituationAllToDos(ProjectName, FilterSituation):-
        write("\n\n------- ToDos filtradas por situacao -------\n"),
        applyFilterBySituation(captureAllToDos(ProjectName), FilterSituation).

applyFilterByResponsable([], _).
applyFilterByResponsable([[Name,Description,Responsable,Status,Prevision,Hour]|T], Filter):-
        searchMatchingAllPrefix(Responsable, Filter, Result),
        (Result == TRUE -> showToDo([Name,Description,Responsable,Status,Prevision,Hour]) ),
        applyFilterByResponsable(T, Filter).

filterByResponsableAllToDos(ProjectName, FilterResponsable):-
        write("\n\n------- ToDos filtradas por responsavel -------\n"),
        applyFilterByResponsable(captureAllToDos(ProjectName), FilterResponsable).