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

void persistirToDo(string projectName, string _nome, string _descricao, string _responsavel, string _status, int previsao);

vector<string> returnToDO(string projectName, string nameToDo);

string returnAllToDos();

void setNomeToDo(string projectName, string nome, string novoNome);

void setStatusToDo(string projectName, string nome, string status);

void setResponsavelToDo(string projectName, string nome, string responsavel);

/*
	Retorna o caminho de todas as ToDos (uma por uma) do projeto
*/
vector<string> returnAllTodos(string projectName);