:- module(persistenceToDo, [persistirTodo/7, recuperaTodo/7, toDoExists/2, allTodosList/2, addHours/3]).

notEmpty(List):- member(_, List).

problem(NomeProjeto, Element) :-
	atom_string(NomeProjeto, Npa),
	atom_string(Element, Ela),
    (Element = .);
    (Element = ..);
    (Ela == Npa).

normalize(NomeProjeto, [Head|Tail], Auxiliar, Result) :-
	(not( problem(NomeProjeto, Head) )) -> (
		write("not problem with "), write(Head), nl,
		length(Tail, SzList2),
		append(Auxiliar, [Head], NewAux),
		( (SzList2 > 0) -> normalize(NomeProjeto, Tail, NewAux, Result); append(NewAux, [], Result) )
	);
	write("Problem with "), write(Head), nl,
	length(Tail, SzList),
	( (SzList > 0) -> normalize(NomeProjeto, Tail, Auxiliar, Result); append(Auxiliar, [], Result) ).

allTodosList(NomeProjeto, Result) :-
	string_concat("Projects/", NomeProjeto, Aux),
	string_concat(Aux, "/", Path),
	directory_files(Path, AuxiliarList),
	normalize(NomeProjeto, AuxiliarList, [], Result).

urlTodo(Nome, Caminho) :-
    string_concat("Projects/", Nome, Caminho).

urlTodoFile(NomeProjeto, NomeTodo, Caminho):-
    urlTodo(NomeProjeto, UrlTodo),
    string_concat(UrlTodo, "/", Auxiliar),
    string_concat(Auxiliar, NomeTodo, Caminho).

toDoExists(NomeProjeto, NomeTodo) :- 
	urlTodoFile(NomeProjeto, NomeTodo, Path),
	exists_file(Path).

persistirTodo(NomeProjeto, Nome, Descricao, Responsavel, Status, Previsao, Horas) :- 
    string_concat("Projects/", NomeProjeto, Auxiliar1),
    string_concat(Auxiliar1, "/", Auxiliar2),
    string_concat(Auxiliar2, Nome, Caminho),

    open(Caminho, write, P),
    
    write(P, Nome), write(P, "\n"),
    write(P, Descricao), write(P, "\n"),
    write(P, Responsavel), write(P, "\n"),
    write(P, Status), write(P, "\n"),
    write(P, Previsao), write(P, "\n"),
    write(P, Horas), write(P, "\n"),

    close(P).

addHours(NomeProjeto, NomeTodo, Cadastrado) :-
	recuperaTodo(NomeProjeto, NomeTodo, Descricao, Responsavel, Status, Previsao, Horas),
	atom_number(Horas, HorasInt),
	atom_number(Cadastrado, CadastradoInt),
	Soma is CadastradoInt + HorasInt,
	persistirTodo(NomeProjeto, NomeTodo, Descricao, Responsavel, Status, Previsao, Soma).

recuperaTodo(NomeProjeto, NomeTodo, Descricao, Responsavel, Status, Previsao, Horas) :-
    urlTodoFile(NomeProjeto, NomeTodo, Caminho),
    open(Caminho, read, Str),
	read_line_to_string(Str, _),
	read_line_to_string(Str, Descricao),
	read_line_to_string(Str, Responsavel),
	read_line_to_string(Str, Status),
	read_line_to_string(Str, Previsao),
    read_line_to_string(Str, Horas),
    close(Str).
