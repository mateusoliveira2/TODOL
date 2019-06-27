:- module(persistenceProject, [persistirProjeto/5, recuperaProjeto/5]).

createDirectory(Directory):- exists_directory(Directory) -> true; make_directory(Directory).

urlProject(Nome, Caminho) :-
	string_concat("Projects/", Nome, Caminho).

urlProjectFile(Nome, Caminho):-
	urlProject(Nome, UrlProjeto),
	string_concat(UrlProjeto, "/", Auxiliar),
	string_concat(Auxiliar, Nome, Caminho).

projectExists(Project) :- 
	urlProject(Project, Path),
	exists_directory(Path).

persistirProjeto(Nome, Descricao, Responsavel, Status, Previsao) :- 
    createDirectory("Projects"),
	urlProject(Nome, CaminhoDiretorio),
    createDirectory(CaminhoDiretorio),
	urlProjectFile(Nome, CaminhoProjeto),

    open(CaminhoProjeto, write, P),
    
    write(P, Nome), write(P, ".\n"),
    write(P, Descricao), write(P, ".\n"),
    write(P, Responsavel), write(P, ".\n"),
    write(P, Status), write(P, ".\n"),
    write(P, Previsao), write(P, ".\n"),

    close(P).

recuperaProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao) :-
	urlProjectFile(NomeProjeto, Caminho),
	open(Caminho, read, Str),
	read(Str, _),
	read(Str, Descricao),
	read(Str, Responsavel),
	read(Str, Status),
	read(Str, Previsao),
	close(Str).