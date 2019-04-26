#pragma once

#include <iostream>
#include <cstdio>
#include <cstdlib>

#include "todoController.h"
#include "filterController.h"
#include "../util.h"
#include "../structs/project.h"

void createProject(string name, string description, string responsible, string status, int prevision);

void sendToDo(string projectName);

void listarToDo();

void listToDos();

void filterTodo(string projectName);

string editName(string projectName);

void gerarRelatorio(string projectName);

void editToDo(string projName);

void listToDos(string projName);

void projectMain(string projectName);

