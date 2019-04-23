#pragma once
#include "persistence/persistenceController.cpp"
#include "persistence/persistenceToDoController.cpp"
#include <algorithm>

string formatarNome(string nome) {
	for(int i = 0; i < nome.size(); i++){
		if(nome[i] == ' ') nome[i] = '_';
	}
	return nome;
}

void gravarProjeto(string _nome, string _descricao, string _responsavel, int _previsaoConclusao){
	_nome = formatarNome(_nome);
	persistirProjeto(_nome, _descricao, _responsavel, _previsaoConclusao);
}

void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao){
	_projeto = formatarNome(_projeto);
	_nome = formatarNome(_nome);
	persistirToDo(_projeto, _nome, _descricao, _responsavel, _status, _previsaoConclusao);
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
	vector<string> allToDos = returnAllTodos(projectName);

	string line;
	transform(filterName.begin(), filterName.end(), filterName.begin(), ::tolower);

	for(int i=0; i<allToDos.size(); i++){
		string pathToDo = allToDos[i];

		ifstream toDo(pathToDo.c_str());
		if(!toDo) { toDo.close(); continue; }

  		while(getline(toDo, line)){
  			transform(line.begin(), line.end(), line.begin(), ::tolower);
  			if(searchMatching("===titulo===", line) &&
  				searchMatching(filterName, line)){
  				printf("\t%s\n", pathToDo.c_str());
  			}
  		}

  		toDo.close();
	}

}

void filterBySituationAllToDos(string projectName, string filterSituation){
	vector<string> allToDos = returnAllTodos(projectName);

	string line;
	transform(filterSituation.begin(), filterSituation.end(), filterSituation.begin(), ::tolower);

	for(int i=0; i<allToDos.size(); i++){
		string pathToDo = allToDos[i];
		ifstream toDo(pathToDo.c_str());
		if(!toDo) { toDo.close(); continue; }

  		while(getline(toDo, line)){
  			transform(line.begin(), line.end(), line.begin(), ::tolower);
  			if(searchMatching("===status===", line) &&
  				searchMatching(filterSituation, line)){
  				printf("%s\n", pathToDo.c_str());
  			}
  		}

  		toDo.close();
	}
}

void filterByDateAllToDos(char projectName[20]){
	// TBD
}

void filterByResponsableAllToDos(string projectName, string filterResponsable){
	vector<string> allToDos = returnAllTodos(projectName);

	string line;
	transform(filterResponsable.begin(), filterResponsable.end(), filterResponsable.begin(), ::tolower);

	for(int i=0; i<allToDos.size(); i++){
		string pathToDo = allToDos[i];
		ifstream toDo(pathToDo.c_str());
		if(!toDo) { toDo.close(); continue; }

  		while(getline(toDo, line)){
  			transform(line.begin(), line.end(), line.begin(), ::tolower);
  			if(searchMatching("===responsavel===", line) &&
  				searchMatching(filterResponsable, line)){
  				printf("%s\n", pathToDo.c_str());
  			}
  		}

  		toDo.close();
	}
}
