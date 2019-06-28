:- module(menuProject, [menuProject/1, receiverToDoData/1]).
:- use_module(menuToDo).
:- use_module(persistenceToDo).
:- use_module(utils).

menuProject(NomeProjeto):- repeat,
	recuperaProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao),
	showProject(NomeProjeto, Descricao, Responsavel, Status, Previsao),

   	write("1. Criar ToDo\n"),
    write("2. Editar ToDo\n"),
    write("3. Listar ToDo\n"),
    write("4. Filtrar ToDo\n"),
    write("5. Gerar Relatorio\n"),
    write("6. Editar Nome do Projeto\n"),
    write("0. Sair\n"),
    write("Escolha: \n\n"),
    read_line_to_string(user_input, Choice),
        
    ( Choice = "0" -> !, fail ; true ),
    ( Choice = "1" -> receiverToDoData(NomeProjeto) ; true),
    ( Choice = "3" -> listarToDo(NomeProjeto); true),
    ( Choice = "2" -> editToDo(NomeProjeto); true),
    ( Choice = "5" -> gerarRelatorio(NomeProjeto); true),
    ( Choice = "6" -> editNomeProjeto(NomeProjeto); true),
        
    fail.

barraProgresso(Esperado, Cadastrado, Tam) :-
	Esperado < Cadastrado -> ( write("["), repeatString("+", round(Tam)), write("] 100%\n") );
	(porcentagem(Cadastrado, Esperado, ValorReal), 
	ValorRealFloat is round(ValorReal),
	Valor is round(ValorReal / 100 * Tam),
	Resto is round(Tam) - Valor,
	write("["),
	repeatString("+", Valor),
	repeatString(".", Resto),
	write("] "),
	write(ValorRealFloat),
	write("%\n")).

visaoGeralProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao) :-
	HorasPrevistasTodos = 1999,
	TotalHorasTrabalhadas = 1999,

	write("┌"), repeatString("─", 55), nl,
	write("│ "), write("Projeto previsto para "), write(Previsao), write(" hora(s)\n"),
	write("│ As previsões dos ToDos somam "), write(HorasPrevistasTodos), write(" hora(s)\n"),
	write("│ Foram trabalhadas "), write(TotalHorasTrabalhadas), write(" hora(s)\n"),
    write("└"), repeatString("─", 55), nl.

gerarRelatorio(NomeProjeto) :-
	recuperaProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao),
	showProject(NomeProjeto, Descricao, Responsavel, Status, Previsao),

	write("===== Relatório de "), write(NomeProjeto), write(" =====\n"),

	write("Resumo do progresso do projeto\n"),
	visaoGeralProjeto(NomeProjeto, Descricao, Responsavel, Status, Previsao).
	

receiverToDoData(NomeProjeto):-
    write("\n\n-------CRIAR TODO -------\n"),
    write("Digite o nome da ToDO: \n"),
    read_line_to_string(user_input, ToDoName),
    write("Digite a descrição da ToDo: \n"),
    read_line_to_string(user_input, Description),
    write("Digite os responsaveis pela ToDo: \n"),
    read_line_to_string(user_input, Responsible),
    write("Digite a duração (em horas) da ToDo: \n"),
    read_line_to_string(user_input, Duration),
    persistirTodo(NomeProjeto, ToDoName, Description, Responsible, "A fazer", Duration, "0").

listarToDo(NomeProjeto):-
    write("\n\n-------LISTAR TODOS -------\n"),
    write("Digite o nome da ToDO: \n"),
    read_line_to_string(user_input, ToDoName),
    recuperaTodo(NomeProjeto, ToDoName, Description, Responsible, Status, Duration, Horas),
    write(NomeProjeto),nl,
    write(ToDoName),nl,
    write(Description),nl,
    write(Responsible),nl,
    write(Status),nl,
    write(Duration),nl,
    write(Horas),nl.

editToDo(NomeProjeto):-
    write("\n\n-------EDITAR TODO-------\n"),
    write("Digite o nome da ToDo: \n"),
    read_line_to_string(user_input, ToDoName),
	( toDoExists(NomeProjeto, ToDoName) -> 
		write(ToDoName), write(' selecionado com sucesso!\n'), menuToDo(NomeProjeto, ToDoName); 
		write('ToDo não existe!\n') ),

	menuProject(NomeProjeto).


editNomeProjeto(NomeProjeto):-
    write("\n\n-------EDITAR NOME DO PROJETO-------\n"),
    write("Nome atual: "), write(NomeProjeto),
    write("\n Digite o novo nome: "),
    read_line_to_string(user_input, NewNomeProjeto),
    write("\nNome atualizado com sucesso. Novo nome: "), write(NewNomeProjeto).
