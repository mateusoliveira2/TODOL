#pragma once

#include <algorithm>

#include "persistence/persistenceController.h"
#include "persistence/persistenceToDoController.h"

string formatarNome(string nome);

void gravarProjeto(string _nome, string _descricao, string _responsavel, int _previsaoConclusao);

void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao);

bool projectExists(string projName);

vector<string> getProject(string projName);

bool searchMatching(string filter, string phrase);

void filterByNameAllToDos(string projectName, string filterName);

void filterBySituationAllToDos(string projectName, string filterSituation);

void filterByDateAllToDos(string projectName);

void filterByResponsableAllToDos(string projectName, string filterResponsable);