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

using namespace std;

bool validTodo(string projName, string todoName);

void persistirToDo(string projectName, string _nome, string _descricao, string _responsavel, string _status, int previsao, string _data);

vector<string> returnToDo(string projectName, string nameToDo, string extension);

void setNomeToDo(string projectName, string nome, string novoNome);

void setStatusToDo(string projectName, string nome, string status);

void setResponsavelToDo(string projectName, string nome, string responsavel);

void setDataToDo(string projectName, string nome, string data);

/*
	Retorna o nome de todas as ToDos (uma por uma) do projeto
*/
vector<string> returnAllTodos(string projectName);

/*
	Retorna o conteúdo de todas as ToDos (uma por uma) do projeto.
*/
vector<vector<string>> returnAllTodosContent(string projectName);