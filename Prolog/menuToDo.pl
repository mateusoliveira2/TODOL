:- module(menuToDo, [menuToDo/2]).

menuToDo(ProjectName, ToDoName):- repeat,
        write("\n\n ------- "), write(ToDoName), write(" ------- \n\n"),
        write("1. Editar Nome\n"),
        write("2. Editar Responsaveis\n"),
        write("3. Editar Situacao\n"),
        write("4. Cadastrar horas\n"),
        write("0. Sair\n"),
        write("Escolha: \n\n"),
        read(Choice),
        
        ( Choice = 0 -> !, fail ; true ),
        
        fail.
