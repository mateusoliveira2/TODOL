/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/

#pragma once
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
#include <iostream>
#include <experimental/filesystem>
using namespace std;

// Exemplo de função desse controller

/* 
	Salva o projeto em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/


bool validProject(string projName) {
	ifstream fs;
	fs.open( ("../../Projects/" + projName + "/" + projName + ".txt").c_str() );
	bool ret = true;
	if( !fs.is_open() ) ret = false;
	fs.close();

	return ret;
}

void persistirProjeto(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	ofstream fs;

	string dirProject = "../../Projects/" + _nome + "/";
	string fileName = _nome + ".txt";
	
	system("mkdir -p ../../Projects/");

	fs.open( (dirProject + fileName).c_str());

	if( !fs.is_open() ){
		system( ("mkdir " + dirProject).c_str() );
		fs.open( (dirProject + fileName).c_str());
	}
	
	fs << _nome + "\n";
	fs << _descricao + "\n"; 
	fs << _responsavel + "\n";

	// convert to string
	fs << to_string(_previsaoConclusao) + "\n";

	fs.close();
}

vector<string> returnProjeto(string nameProject){
	ifstream fs;
	string dirProject = "../../Projects/" + nameProject + "/";
	string fileName = nameProject + ".txt";

	fs.open( (dirProject + fileName).c_str() );

	vector <string> lines;
	string x;
	
	while( getline(fs, x) ) lines.push_back(x);
	fs.close();

	persistirProjeto(lines[0], lines[1], lines[2], stoi(lines[3]));

	return lines;
}

void setNomeProjeto(string nome, string novoNome){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(novoNome, line[1], line[2], stoi(line[3]));

}

void setStatusProjeto(string nome, string status){
	// TBD
}

void setDescricaoProjeto(string nome, string descricao){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(line[0], descricao, line[2], stoi(line[3]));
}

void setResponsavelProjeto(string nome, string responsavel){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(line[0], line[1], responsavel, stoi(line[3]));
}