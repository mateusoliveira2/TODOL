#pragma once

#include <cstdio>
#include <cstdlib>

#include "../util.h"

void createToDo(string project, string nameToDo, string description, string responsible, int duration);

void conclusionScreen(string acao);

void editTodoName(string name);

void todoMain( string todoName);
