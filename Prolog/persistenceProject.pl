:- module(persistenceProject, [persistirProjeto/5]).

createDirectory(Directory):- exists_directory(Directory) -> true; make_directory(Directory).

projectExists(Project) :- 
	string_concat("Projects/", Project, Path),
	exists_directory(Path).

persistirProjeto(Nome, Descricao, Responsavel, Status, Previsao) :- 
    createDirectory("Projects"),
    string_concat("Projects/", Nome, NomeDiretorio),
    createDirectory(NomeDiretorio),
    string_concat(NomeDiretorio, "/", Auxiliar),
    string_concat(Auxiliar, Nome, Caminho),

    open(Caminho, write, P),
    
    write(P, Nome), write(P, "\n"),
    write(P, Descricao), write(P, "\n"),
    write(P, Responsavel), write(P, "\n"),
    write(P, Status), write(P, "\n"),
    write(P, Previsao), write(P, "\n"),

    close(P).
