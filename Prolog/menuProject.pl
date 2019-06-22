menuProject(NameProject):- repeat,
        write(" ------- "), write(NameProject), write(" ------- "),
       	write ("1. Criar ToDo\n"),
		write ("2. Editar ToDo\n"),
		write ("3. Listar ToDo\n"),
		write ("4. Filtrar ToDo\n"),
		write ("5. Gerar Relatorio\n"),
		write ("6. Editar Nome do Projeto\n"),
		write ("0. Sair\n"),
        write ("Escolha: "\n\n),
        read(Choice),
        
        ( Choice = 0 -> !, fail ; true ),
        
        fail.

receiverProjectsData:-
        write("\n\n-------CRIAR PROJETO-------\n"),
        write("Digite o nome do projeto: \n"),
        read(Name),
        write("Digite a descrição do projeto: \n"),
        read(Description),
        write("Digite os responsaveis pelo projeto: \n"),
        read(Responsible),
        write("Digite a previsao de termino (em horas): \n"),
        read(Duration),
        write(Name),write(" ") , write(Description), write(" "),write(Responsible),
        write(" "), write(Duration),

        menu.

showProject:-
	write ("┌────────────────────────────────────────────────")
	write ("│ Nome: " 
	write ("│ Descrição: " 
	write ("│ Responsável: " 
	write ("│ Status: "
	write ("│ Estimativa: " 
    write ("└────────────────────────────────────────────────\n\n")
