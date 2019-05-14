#include "util.h"

string formatWithUnderscore(string word) {
	for(int i = 0; i < word.size(); i++){
		if(word[i] == ' ') word[i] = '_';
	}
	return word;
}

string removeFormatWithUnderscore(string word){
	for(int i = 0; i < word.size(); i++){
		if(word[i] == '_') word[i] = ' ';
	}
	return word;
}

void gravarProjeto(string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data){
	_nome = formatWithUnderscore(_nome);
	persistirProjeto(_nome, _descricao, _responsavel, _status, _previsaoConclusao, _data);
}

void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data){
	_projeto = formatWithUnderscore(_projeto);
	_nome = formatWithUnderscore(_nome);
	persistirToDo(_projeto, _nome, _descricao, _responsavel, _status, _previsaoConclusao, _data);
}

bool projectExists(string projName) {
	return validProject(formatWithUnderscore(projName));
}

bool todoExists(string projName, string todoName) {
	return validTodo(projName, formatWithUnderscore(todoName));
}

vector<string> getProject(string projName) {
	return returnProjeto(projName);
}

vector<string> getAllProjectsNames() {
	return returnAllProjectsName();
}

vector<string> getAllTodosNames(string projName) {
	return returnAllTodos(projName);
}

bool searchMatching(string filter, string phrase) {
	int matching[100];
	matching[0] = matching[1] = 0;

	string word = filter + "$" + phrase;

	int j;
	for(int i = 2; i <= ((int) word.size()); i++) {
		j = matching[i-1];
		while(true) {
			if(word[i-1] == word[j]) {
				matching[i] = j+1;
				break;
			}

			if(j == 0) {
				matching[i] = 0;
				break;
			}

			j = matching[j];
		}

		if(matching[i] == filter.size()) return true;
	}
	return false;
}

void filterByNameAllToDos(string projectName, string filterName){
	vector<vector<string>> allToDosCont = returnAllTodosContent(projectName);
	transform(filterName.begin(), filterName.end(), filterName.begin(), ::tolower);

	printf("\n\t=== ToDos filtradas por nome ===\n");

	for(int i=0; i<allToDosCont.size(); i++){
		string titleToDo = allToDosCont[i][0];
		string situationToDo = allToDosCont[i][1];
		string responsableToDo = allToDosCont[i][2];

		transform(titleToDo.begin(), titleToDo.end(), titleToDo.begin(), ::tolower);

		if(searchMatching(filterName, titleToDo))
			displayToDo(titleToDo, situationToDo, responsableToDo);
	}

}

void filterBySituationAllToDos(string projectName, string filterSituation){
	vector<vector<string>> allToDosCont = returnAllTodosContent(projectName);
	transform(filterSituation.begin(), filterSituation.end(), filterSituation.begin(), ::tolower);

	printf("\n\t=== ToDos filtradas por situacao ===\n");

	for(int i=0; i<allToDosCont.size(); i++){
		string titleToDo = allToDosCont[i][0];
		string situationToDo = allToDosCont[i][1];
		string responsableToDo = allToDosCont[i][2];

		transform(situationToDo.begin(), situationToDo.end(), situationToDo.begin(), ::tolower);

		if(searchMatching(filterSituation, situationToDo))
			displayToDo(titleToDo, situationToDo, responsableToDo);
	}
}

void filterByResponsableAllToDos(string projectName, string filterResponsable){
	vector<vector<string>> allToDosCont = returnAllTodosContent(projectName);
	transform(filterResponsable.begin(), filterResponsable.end(), filterResponsable.begin(), ::tolower);

	printf("\n\t=== ToDos filtradas por responsavel ===\n");

	for(int i=0; i<allToDosCont.size(); i++){
		string titleToDo = allToDosCont[i][0];
		string situationToDo = allToDosCont[i][1];
		string responsableToDo = allToDosCont[i][2];

		transform(responsableToDo.begin(), responsableToDo.end(), responsableToDo.begin(), ::tolower);

		if(searchMatching(filterResponsable, responsableToDo))
			displayToDo(titleToDo, situationToDo, responsableToDo);
	}
}

void displayProject(string projectName){
    vector<string> proj =  getProject(projectName);

    printf("┌────────────────────────────────────────────────\n");
    printf("│ Descricao: %s\n", removeFormatWithUnderscore(proj[1]).c_str());
    printf("│ Responsavel: %s\n", proj[2].c_str());
    printf("│ Status: %s\n", proj[3].c_str());
    printf("│ Previsao de Conclusao: %s dia(s)\n", proj[4].c_str());
    printf("└────────────────────────────────────────────────\n\n");
}

void displayToDo(string titleToDo, string situationToDo, string responsableToDo){
    
    printf("┌────────────────────────────────────────────────\n");
    printf("│ Nome: %s\n", removeFormatWithUnderscore(titleToDo).c_str());
    printf("│ Situação: %s\n", situationToDo.c_str());
    printf("│ Responsaveis: %s\n", responsableToDo.c_str());
    printf("└────────────────────────────────────────────────\n\n");
}

long long segundosParaDias(long long segundos) {
	return segundos / 86400LL;;
}

long long diasParaSegundos(long long dias){
	return dias * 86400LL;
}

long long diasParaHoras(long long dias){
	return dias * 24LL;
}

long long horasParaDias(long long horas){
	return horas / 24LL;
}

string formatarPlural(long long variavel) {
	if (variavel == 1LL) return " ";
	return "s ";
}

void getAllToDos(string projectName){
	vector<vector<string>> allToDos = returnAllTodosContent(projectName);

	for(int i=0; i<allToDos.size(); i++){
		string titleToDo = allToDos[i][0];
		string situationToDo = allToDos[i][1];
		string responsableToDo = allToDos[i][2];

		displayToDo(titleToDo, situationToDo, responsableToDo);
	}
}

void conclusionScreen(string acao){
	
	printf("\n\t%s com sucesso!", acao.c_str());

	char choice = 'n';
	do  {
		printf("\n\nDeseja voltar? (s/n): ");
		cin >> choice;
	} while(choice != 's');

	system("cls || clear");
}

long long saldoParaConclusaoProjeto(string projectName, long long estimativaTotal) {
	vector<string> project =  getProject(projectName);
	long long previsaoConclusaoProject = stoi(project[4]);
	long long saldo = previsaoConclusaoProject - estimativaTotal;

	return saldo; // em dias
}

void displaySituacaoPrevisao(long long saldoDiasTrabalho) {
	printf("\n");
	if (saldoDiasTrabalho < 0) {
		printf("\t!! Atualmente são necessários mais dias do que o previsto para concluir o projeto !!");
		printf("- Deficit de %lld dia%s\n", abs(saldoDiasTrabalho), formatarPlural(abs(saldoDiasTrabalho)).c_str());

	} else {
		printf("\t!! O projeto deve ser concluído a tempo do previsto !!");
		printf("- Saldo de %lld dia%s\n", abs(saldoDiasTrabalho), formatarPlural(abs(saldoDiasTrabalho)).c_str());
	}
}

void estatisticasDesenvolvedores(string projectName, long long estimativaConcluida, long long estimativaTotal, long long saldoHoras) {
	vector<string> project =  getProject(projectName);
	long long previsaoConclusaoProject = stoi(project[4]);
	printf("\n\nDeseja ver previsões para a equipe? (s/n): ");
	char choice;
	cin >> choice;

	if (choice == 's') {
		int numeroDesenvolvedores;
		int horasDiarias;

		printf("Quantos desenvolvedores na equipe? ");
		cin >> numeroDesenvolvedores;
		printf("Qual a carga horária diária de trabalho? ");
		cin >> horasDiarias;

		long long totalHorasDia = numeroDesenvolvedores * horasDiarias;

		long long diasRestantes = (estimativaTotal - estimativaConcluida + totalHorasDia - 1LL) / totalHorasDia;
		
		printf("\nSão necessários %lld dia%spara concluir o projeto com esse time\n", diasRestantes, formatarPlural(diasRestantes).c_str());

		if (previsaoConclusaoProject >= diasRestantes) {
			printf("É possível concluir o projeto conforme previsto");
			if (saldoHoras < 0) printf(", porém os ToDos estão com estimativas excessivas");
			printf("\n");
						
		} else {
			printf("Não é possível concluir o projeto conforme previsto");
			if (saldoHoras >= 0) printf(", porém os ToDos possuem estimativas otimistas");
			printf("\n");

			long long horasNecessarias = (diasRestantes - previsaoConclusaoProject) * 24LL;
			long long horasPorDiaNecessarias = (horasNecessarias + diasRestantes - 1LL) / diasRestantes;
			long long devsNecessarios = (horasPorDiaNecessarias - 1LL + horasDiarias) / horasDiarias;

			printf("Considerando que tudo ocorra como previsto, são necessários mais %lld pessoa%sno time de desenvolvimento\n",
					devsNecessarios, formatarPlural(devsNecessarios).c_str());
		}
	}

	cin.ignore();
}

void displayAllToDoStatistics(string projectName) {
	vector< vector<string> > allToDos = returnAllTodosContent(projectName);
	int toDosConcluidos = 0;
	int toDosEmAndamento = 0;
	int toDosAFazer = 0;
	long long estimativaTotal = 0;
	long long estimativaConcluida = 0;

	if (allToDos.size() == 0) {
		printf("\t Não há nenhum toDo cadastrado nesse projeto!\n");
		return;
	}
	
	for (vector <string> toDo : allToDos) {
		string situationToDo = toDo[1];
		long long previsaoToDo = stoi(toDo[4]);
		long long criacaoToDo = stoi(toDo[5]);

		if (situationToDo == "A fazer") toDosAFazer++;
		if (situationToDo == "Em andamento") toDosEmAndamento++;
		if (situationToDo == "Concluido") {
			estimativaConcluida += diasParaHoras(previsaoToDo);
			toDosConcluidos++;

		} else {
			estimativaTotal += diasParaHoras(previsaoToDo);
		}
	}
	
	printf("\t %d ToDo%sa fazer\n", toDosAFazer, formatarPlural(toDosAFazer).c_str());
	printf("\t %d ToDo%sem andamento\n", toDosEmAndamento, formatarPlural(toDosEmAndamento).c_str());
	printf("\t %d ToDo%sconcluído%s\n", toDosConcluidos, formatarPlural(toDosConcluidos).c_str(), formatarPlural(toDosConcluidos).c_str());

	printf("\n\t Estimativa total para concluir todos os ToDos: %lld hora%s- %lld dia%s\n",
					estimativaTotal, formatarPlural(estimativaTotal).c_str(), horasParaDias(estimativaTotal), formatarPlural(horasParaDias(estimativaTotal)).c_str());

	long long saldoHoras = saldoParaConclusaoProjeto(projectName, horasParaDias(estimativaTotal));

	displaySituacaoPrevisao(saldoHoras);

	estatisticasDesenvolvedores(projectName, estimativaConcluida, estimativaTotal, saldoHoras);

	printf("\n\n");
}
