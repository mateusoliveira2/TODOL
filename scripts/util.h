#pragma once

#include <algorithm>

#include "persistence/persistenceController.h"
#include "persistence/persistenceToDoController.h"

string formatWithUnderscore(string word);

string removeFormatWithUnderscore(string word);

void gravarProjeto(string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data);

void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data);

bool projectExists(string projName);

bool todoExists(string projName, string todoName);

vector<string> getProject(string projName);

vector<string> getAllProjectsNames();

vector<string> getAllTodosNames(string projName);

bool searchMatching(string filter, string phrase);

void filterByNameAllToDos(string projectName, string filterName);

void filterBySituationAllToDos(string projectName, string filterSituation);

void filterByResponsableAllToDos(string projectName, string filterResponsable);

void displayProject(string projectName);

void displayToDo(string titleToDo, string situationToDo, string responsableToDo);

void displayAllToDoStatistics(string projectName);

void getAllToDos(string projectName);

void getAllToDos(string projName);

void conclusionScreen(string acao);