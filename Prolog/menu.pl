:- initialization (main).

run_opt(Choice):-
    write(Choice).
        
menu:-repeat,
        write("\n\n-------TODOL-------"),nl,
        write("1. Criar Projeto\n"),
        write("2. Selecionar Projeto\n"),
        write("3. Concluir projeto\n"),
        write("4. Sair\n\n"),nl,
        write("ESCOLHA: "),nl,
        read(Choice),
        
        ( Choice = 4 -> !, fail ; true ),
        ( Choice = 2 -> selectProject;
        Choice = 3 -> concludeProject),
        
        fail.

selectProject:-
        write("\n\n-------SELECIONAR PROJETO-------\n"),
        write("Digite o nome do projeto: \n"),
        read(Name),
        write(Name),write(' selecionado com sucesso!').

        menu.

concludeProject:-
        write("\n\n-------CONCLUIR PROJETO-------\n"),
        write("Digite o nome do projeto: \n"),
        read(Name),
        write(Name),write(' concluido com sucesso!').

        menu.


main :- 
    menu.
