/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/

#pragma once
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
using namespace std;

// Exemplo de função desse controller

/* 
	Salva o projeto em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/

bool validProject(string projName) {
	ofstream fs;
	fs.open( ("../../Projects/" + projName + "/" + projName + ".txt").c_str() );

	if( !fs.is_open() ) return false;
	return true;
}

void persistirProjeto(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	ofstream fs;

	string dirProject = "../../Projects/" + _nome + "/";
	string fileName = _nome + ".txt";
	
	system("mkdir -p ../../Projects/");
	fs.open( (dirProject + fileName).c_str() );
	
	if( !fs.is_open() ){
		system( ("mkdir " + dirProject).c_str() );
		fs.open( (dirProject + fileName).c_str() );
	}
	
	fs << "===Nome===:\t" + _nome + "\n";
	fs << "===Descricao===:\t" + _descricao + "\n"; 
	fs << "===Responsavel===:\t" + _responsavel + "\n";
	char sPrevisaoConclusao[3];

	// convert to string
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



