/*
	Implementação da struct (model) de um Projeto.
*/
#include "../persistence/persistenceController.cpp"
#include "project.h"
#include <iostream>

void gravar(string _nome, string _descricao, string _responsavel, int _previsaoConclusao){
	persistirProjeto(_nome, _descricao, _responsavel, _previsaoConclusao);
}

Project::Project(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	this->nome = _nome;
	this->descricao = _descricao;
	this->responsavel = _responsavel;
	
	this->previsaoConclusao = _previsaoConclusao;
	this->dataCriacao = time(0);
	gravar(_nome, _descricao, _responsavel, _previsaoConclusao);
}

void Project::setNome(string novoNome) {
	this->nome = novoNome;
}

void Project::setResponsavel(string novoResponsavel) {
	this->responsavel = novoResponsavel;
}

void Project::setStatus(string novoStatus) {
	// checar validade de novoStatus
	this->status = novoStatus;
}

void Project::excluirToDo(string nomeToDo) {
	// TBD
}

void Project::criarToDo(string _descricao, string _responsavel, int _previsaoConclusao) {
	// TBD
}

void Project::getRelatorio() {
	// TBD
}

bool searchMatching(string filter, string phrase) {
	int maching[100];
	maching[0] = maching[1] = 0;

	string word = filter + "$" + phrase;

	int j;
	for(int i = 2; i <= ((int) word.size()); i++) {
		j = maching[i-1];
		while(true) {
			if(word[i-1] == word[j]) {
				maching[i] = j+1;
				break;
			}

			if(j == 0) {
				maching[i] = 0;
				break;
			}

			j = maching[j];
		}
		if(maching[i] == filter.size())
			return true;
	}
	return false;
}

void filterByNameAllToDos(char projectName[20], string filterName){
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

void filterBySituationAllToDos(char projectName[20], string filterSituation){
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
	//TB
}

void filterByResponsableAllToDos(char projectName[20], string filterResponsable){
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