/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/

#include <cstdlib>
#include <fstream>
#include <string>
using namespace std;
// Exemplo de função desse controller

/* 
	Salva o projeto em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/

string formatarNome(string nome){
	for(int i = 0; i < nome.size(); i++){
		if(nome[i] == ' ') nome[i] = '_';
	}
	return nome;
}


void persistirProjeto(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	ofstream fs;

	_nome = formatarNome(_nome);
	string dirProject = "..\\" + _nome + "\\";
	string fileName = _nome + ".txt";
	
	fs.open((dirProject + fileName).c_str());
	
	if(! fs.is_open()){
		system(("mkdir " + dirProject).c_str());
		fs.open((dirProject + fileName).c_str());
	}
	
	fs << "===Nome===:\t" + _nome + "\n";
	fs << "===Descricao===:\t" + _descricao + "\n"; 
	fs << "===Responsavel===:\t" + _responsavel + "\n";
	char sPrevisaoConclusao[3];
	// convert  to string
	sprintf(sPrevisaoConclusao, "%d", _previsaoConclusao);
	fs << "===Previsao de Conclusao===:\t" + string(sPrevisaoConclusao)+ "\n";

	fs.close();
}

string returnProjeto(string nameProject){
	return "Not implemented yet";
}

void setNomeProjeto(string nome, string novoNome){

}

void setStatusProjeto(string nome, string status){
	
}

void setResponsavelProjeto(string nome, string responsavel){
	
}

/* 
	Salva o ToDo em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/
void persistirToDo(string projectName, string _nome, string _descricao, string _responsavel, string _status) {
	
	_nome = formatarNome(_nome);
	projectName = formatarNome(projectName);
	
	ofstream fs;
	
	//pode existir verificacao de nome de projeto invalido

	string dirProject = "..\\" + projectName + "\\";;
	string fileName = _nome + ".txt";
	
	fs.open((dirProject + fileName).c_str());
	
	fs << "===Titulo===:\t" + _nome + "\n";
	fs << "===Status===:\t" + _status + "\n";
	fs << "===Responsavel===:\t" + _responsavel + "\n";
	fs << "===Descricao===:\t" + _descricao + "\n";

	fs.close();
}

string returnToDO(String nameToDo){
	return "Not implemented yet";
}

string returnAllToDos(){
	return "Not implemented yet";
}

void setNomeToDo(string nome, string novoNome){

}

void setStatusToDo(string nome, string status){
	
}

void setResponsavelToDo(string nome, string responsavel){
	
}

/* acho que n�o se retorna string em c

os sets de todos os atributos de todo e de project

void setName(string nomeToDo, string newName){
}
*/


