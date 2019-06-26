:- module(persistenceProject, [persistirProjeto/5]).

createDirectory(Directory):- exists_directory(Directory) -> true; make_directory(Directory).

persistirProjeto(Nome, Descricao, Responsavel, Status, Previsao) :- 
    createDirectory("Projects"),
    string_concat("Projects/", Nome, NomeDiretorio),
    createDirectory(NomeDiretorio).