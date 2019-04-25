#pragma once

#include <cstdio>
#include <iostream>
#include <cstdlib>

#include "../util.h"
#include "../structs/toDo.h"

void createToDo(string project, string nameToDo, string description, string responsible, int duration);

void editTodoName(string projectName, string name);

void todoMain(string projName, string todoName);
