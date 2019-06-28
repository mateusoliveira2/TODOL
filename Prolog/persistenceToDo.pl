:- module(persistenceToDo, [persistirTodo/7, recuperaTodo/7, recuperaAllTodos/2]).

urlProject(Nome, Caminho) :-
    string_concat("Projects/", Nome, Caminho).

urlTodoFile(NomeProjeto, NomeTodo, Caminho):-
    urlProject(NomeProjeto, UrlTodo),
    string_concat(UrlTodo, "/", Auxiliar),
    string_concat(Auxiliar, NomeTodo, Caminho).

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

/*
    A comparação de H \= NomeProjeto para evitar de pegar o arquivo com o nome do projeto
    está dando errado, acredito que seja algo com o tipo ser diferente. Atom, String, ...

    no trecho que tem recuperaTodo(NomeProjeto, H, ...) deve formar a lista descrita no
    comentário mais abaixo, com a informação recuperada.
*/
forEachRecuperaTodo(NomeProjeto, [H|T], Todos) :-
    H \= '.', H \= '..', H \= NomeProjeto -> (
        write(NomeTodo), nl,
        recuperaTodo(NomeProjeto, H, )
        forEachRecuperaTodo(NomeProjeto, T, Todos) );
        forEachRecuperaTodo(NomeProjeto, T, Todos).

/*
 Todos deveria ser algo como se fosse uma lista com informações das toDos como:
 [[Nome1, Descricao1, Status1, ...],[Nome2, Descricao2, Status2, ...]]
*/

recuperaAllTodos(NomeProjeto, Todos) :-
    urlProject(NomeProjeto, UrlProj),
    directory_files(UrlProj, NomeTodos),
    forEachRecuperaTodo(NomeProjeto, NomeTodos, Todos).
