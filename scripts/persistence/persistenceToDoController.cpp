/* 
	Salva o ToDo em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/

#pragma once
#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include "persistenceToDoController.h"

using namespace std;


void persistirToDo(string projectName, string _nome, string _descricao, string _responsavel, string _status, int previsao) {
	ofstream fs;
	
	string dirProject = "../../Projects/" + projectName + "/";
	string fileName = _nome + ".txt";
	
	fs.open((dirProject + fileName).c_str());
	
	fs << _nome + "\n";
	fs << _status + "\n";
	fs << _responsavel + "\n";
	fs << _descricao + "\n";
	fs << to_string(previsao) + "\n";

	fs.close();
}

vector<string> returnToDO(string projectName, string nameToDo){
	ifstream fs;
	string dirProject = "../../Projects/" + projectName + "/";
	string fileName = nameToDo + ".txt";

	fs.open( (dirProject + fileName).c_str() );

	vector <string> lines;
	string x;
	
	while( getline(fs, x) ) lines.push_back(x);
	fs.close();

	persistirToDo(projectName, lines[0], lines[3], lines[2], lines[1], stoi(lines[4]));

	return lines;
}

void setNomeToDo(string projectName, string nome, string novoNome){
	vector<string> line;
	line = returnToDO(projectName, nome);
	persistirToDo(projectName, novoNome, line[3], line[2],line[1], stoi(line[4]));
}

void setStatusToDo(string projectName, string nome, string status){
	vector<string> line;
	line = returnToDO(projectName, nome);
	persistirToDo(projectName, line[0], line[3], line[2], status, stoi(line[4]));
}

void setResponsavelToDo(string projectName, string nome, string responsavel){
	vector<string> line;
	line = returnToDO(projectName, nome);
	persistirToDo(projectName, line[0], line[3], responsavel, line[1], stoi(line[4]));
}

/*
	Retorna o nome de todas as ToDos (uma por uma) do projeto
*/
vector<string> returnAllTodos(string projectName){
	DIR *dir;
    struct dirent *lsdir;
	string path = "../../Projects/" + projectName + "/";
    dir = opendir(path.c_str());

	vector<string> todos;
	
    while ( ( lsdir = readdir(dir) ) != NULL ){
		string aux = string(lsdir->d_name);
		if(aux != ".." && aux != "."){
			todos.push_back(aux);
		}
    }

    closedir(dir);

	return todos;
}

/*
	Retorna o conteúdo de todas as ToDos (uma por uma) do projeto.
*/
vector<vector<string> > returnAllTodosCont(string projectName){
	vector<vector<string> > retorno;
	vector<string> nomesToDo;
	vector<string> todo;
	nomesToDo = returnAllTodos(projectName);
	for(int i = 0; i < nomesToDo.size(); i++){
		todo = returnToDO(projectName, nomesToDo[i]);
		retorno.push_back(todo);
	}
	return retorno;
}


