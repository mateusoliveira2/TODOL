#pragma once

#include <iostream>
#include <cstdio>
#include <cstdlib>

#include "todoController.h"
#include "../util.h"
#include "../structs/project.h"

void createProject(string name, string description, string responsible, int prevision);

void sendToDo(string projectName);

void listarToDo();

void filterByName(string projectName);

void filterBySituation(string projectName);

void filterByDate(string projectName);

void filterByResponsable(string projectName);

void filterTodo(string projectName);

void editName(string projectName);

void gerarRelatorio(string projectName);

void editToDo();

void projectMain(string projectName);
