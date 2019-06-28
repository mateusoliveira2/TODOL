:- module(persistenceProject, [persistirProjeto/5, recuperaProjeto/5, projectExists/1]).

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
    
    write(P, Nome), write(P, "\n"),
    write(P, Descricao), write(P, "\n"),
    write(P, Responsavel), write(P, "\n"),
    write(P, Status), write(P, "\n"),
    write(P, Previsao), write(P, "\n"),

    close(P).

recuperaProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao) :-
	urlProjectFile(NomeProjeto, Caminho),
    open(Caminho, read, Str),
	read_line_to_string(Str, _),
	read_line_to_string(Str, Descricao),
	read_line_to_string(Str, Responsavel),
	read_line_to_string(Str, Status),
	read_line_to_string(Str, Previsao),
    close(Str).

setNomeProjeto(Nome, NovoNome) :-
	recuperaProjeto(Nome, Descricao, Responsavel, Status, Previsao),
	urlProjectFile(Nome, CaminhoProjeto),
	open(CaminhoProjeto, write, Str),
    
    write(Str, NovoNome), write(Str, "\n"),
    write(Str, Descricao), write(Str, "\n"),
    write(Str, Responsavel), write(Str, "\n"),
    write(Str, Status), write(Str, "\n"),
    write(Str, Previsao), write(Str, "\n"),
	close(Str),

	urlProjectFile(NovoNome, NovoCaminhoProjeto),
	rename_file(CaminhoProjeto, NovoCaminhoProjeto),
	urlProject(Nome, CaminhoDiretorio),
	urlProject(NovoNome, NovoCaminhoDiretorio),
	rename_file(CaminhoProjeto, NovoCaminhoProjeto).

setDescricaoProjeto(Nome, NovaDescricao) :-
	recuperaProjeto(Nome, Descricao, Responsavel, Status, Previsao),
	urlProjectFile(Nome, CaminhoProjeto),
	open(CaminhoProjeto, write, Str),
    
    write(Str, Nome), write(Str, "\n"),
    write(Str, NovaDescricao), write(Str, "\n"),
    write(Str, Responsavel), write(Str, "\n"),
    write(Str, Status), write(Str, "\n"),
    write(Str, Previsao), write(Str, "\n"),
	close(Str).

setResponsavelProjeto(Nome, NovoResponsavel) :-
	recuperaProjeto(Nome, Descricao, Responsavel, Status, Previsao),
	urlProjectFile(Nome, CaminhoProjeto),
	open(CaminhoProjeto, write, Str),
    
    write(Str, Nome), write(Str, "\n"),
    write(Str, Descricao), write(Str, "\n"),
    write(Str, NovoResponsavel), write(Str, "\n"),
    write(Str, Status), write(Str, "\n"),
    write(Str, Previsao), write(Str, "\n"),
	close(Str).


setStatusProjeto(Nome, NovoStatus) :-
	recuperaProjeto(Nome, Descricao, Responsavel, Status, Previsao),
	urlProjectFile(Nome, CaminhoProjeto),
	open(CaminhoProjeto, write, Str),
    
    write(Str, NovoNome), write(Str, "\n"),
    write(Str, Descricao), write(Str, "\n"),
    write(Str, Responsavel), write(Str, "\n"),
    write(Str, NovoStatus), write(Str, "\n"),
    write(Str, Previsao), write(Str, "\n"),
	close(Str).
