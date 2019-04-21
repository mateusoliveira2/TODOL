/* 
	Salva o ToDo em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/

#pragma once
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

void persistirToDo(string projectName, string _nome, string _descricao, string _responsavel, string _status, int previsao) {
	ofstream fs;
	
	//pode existir verificacao de nome de projeto invalido

	string dirProject = "..\\" + projectName + "\\";;
	string fileName = _nome + ".txt";
	
	fs.open((dirProject + fileName).c_str());
	
	fs << "===Titulo===:\t" + _nome + "\n";
	fs << "===Status===:\t" + _status + "\n";
	fs << "===Responsavel===:\t" + _responsavel + "\n";
	fs << "===Descricao===:\t" + _descricao + "\n";
	char sPrevisao[3];
	sprintf(sPrevisao, "%d", previsao);
	fs << "===Previsao===:\t" + string(sPrevisao) + "\n";

	fs.close();
}

string returnToDO(string nameToDo){
	return "Not implemented yet";
}

string returnAllToDos(){
	return "Not implemented yet";
}

void setNomeToDo(string nome, string novoNome){
	// TBD
}

void setStatusToDo(string nome, string status){
	// TBD
}

void setResponsavelToDo(string nome, string responsavel){
	// TBD
}

/* acho que n�o se retorna string em c
os sets de todos os atributos de todo e de project
void setName(string nomeToDo, string newName){
=======

void setNomeToDo(string nome, string novoNome){

}

void setStatusToDo(string nome, string status){
	
>>>>>>> master
}
*/

/*
	Retorna o caminho de todas as ToDos (uma por uma) do projeto
*/
vector<string> returnAllTodos(string projectName){
	// TBD

	vector<string> teste;
	teste.push_back("/home/whispher/Documentos/TODOL/toDo1");
	teste.push_back("/home/whispher/Documentos/TODOL/toDo2");
	teste.push_back("/home/whispher/Documentos/TODOL/toDo3");

	return teste;
}


