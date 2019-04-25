#include "util.h"

string formatarNome(string nome) {
	for(int i = 0; i < nome.size(); i++){
		if(nome[i] == ' ') nome[i] = '_';
	}
	return nome;
}

void gravarProjeto(string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data){
	_nome = formatarNome(_nome);
	persistirProjeto(_nome, _descricao, _responsavel, _status, _previsaoConclusao, _data);
}

void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data){
	_projeto = formatarNome(_projeto);
	_nome = formatarNome(_nome);
	persistirToDo(_projeto, _nome, _descricao, _responsavel, _status, _previsaoConclusao, _data);
}

bool projectExists(string projName) {
	return validProject(projName);
}

bool todoExists(string projName, string todoName) {
	return validTodo(projName, todoName);
}

vector<string> getProject(string projName) {
	return returnProjeto(projName);
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

void displayToDo(string titleToDo, string situationToDo, string responsableToDo){
    
    printf("┌───────────────────────────────────\n");
    printf("│ Nome: %s\n", titleToDo.c_str());
    printf("│ Situação: %s\n", situationToDo.c_str());
    printf("│ Responsaveis: %s\n", responsableToDo.c_str());
    printf("└───────────────────────────────────\n\n");
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
		scanf("%c", &choice);
        getchar();
	} while(choice != 's');

	system("cls || clear");
}