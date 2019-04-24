#pragma once

#include <algorithm>

#include "persistence/persistenceController.h"
#include "persistence/persistenceToDoController.h"

string formatarNome(string nome);

void gravarProjeto(string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data);

void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data);

bool projectExists(string projName);

bool todoExists(string projName, string todoName);

vector<string> getProject(string projName);

bool searchMatching(string filter, string phrase);

void filterByNameAllToDos(string projectName, string filterName);

void filterBySituationAllToDos(string projectName, string filterSituation);

void filterByResponsableAllToDos(string projectName, string filterResponsable);

void conclusionScreen(string acao);

void getAllToDos(string projName);