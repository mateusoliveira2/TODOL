/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/

#pragma once

#include <cstdlib>
#include <fstream>
#include <string>
#include <vector>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>

using namespace std;

bool validProject(string projName);

void persistirProjeto(string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao);

vector<string> returnProjeto(string nameProject);

void setNomeProjeto(string nome, string novoNome);

void setStatusProjeto(string nome, string status);

void setDescricaoProjeto(string nome, string descricao);

void setResponsavelProjeto(string nome, string responsavel);