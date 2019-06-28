:- use_module(menuProject).
:- use_module(persistenceProject).
:-initialization (main). 
    
menu:-repeat,
        write("\n\n-------TODOL-------"),nl,
        write("1. Criar Projeto\n"),
        write("2. Selecionar Projeto\n"),
        write("3. Concluir projeto\n"),
        write("0. Sair\n\n"),nl,
        write("ESCOLHA: "),nl,
        read_line_to_string(user_input, Choice),
        
        ( Choice = "0" -> !, fail ; true ),
        ( Choice = "1" -> receiverProjectsData; true),
        ( Choice = "2" -> selectProject;
          Choice = "3" -> concludeProject),
        
        fail.

receiverProjectsData:-
        write("\n\n-------CRIAR PROJETO-------\n"),
        write("Digite o nome do projeto: \n"),
		read_line_to_string(user_input, ProjectName),
        write("Digite a descrição do projeto: \n"),
		read_line_to_string(user_input, Description),
        write("Digite os responsaveis pelo projeto: \n"),
		read_line_to_string(user_input, Responsible),
        write("Digite a previsao de termino (em horas): \n"),
		read_line_to_string(user_input, Duration),
        persistirProjeto(ProjectName, Description, Responsible, "A Fazer", Duration, "0"),
        menu.

selectProject:-
        write("\n\n-------SELECIONAR PROJETO-------\n"),
        write("Digite o nome do projeto: \n"),
        read_line_to_string(user_input, ProjectName),
        write(ProjectName), write(' selecionado com sucesso!'), nl,
        menuProject(ProjectName).

concludeProject:-
        write("\n\n-------CONCLUIR PROJETO-------\n"),
        write("Digite o nome do projeto: \n"),
        read_line_to_string(user_input, ProjectName),
        write(ProjectName),write(' concluido com sucesso!').

main :- 
    menu.
