/*
	Struct (model) de um Projeto.
*/

#pragma once

#include <string>
#include <ctime>
#include <algorithm>
#include <vector>

using namespace std;

struct Project {
	string nome;
	string descricao;
	string status;
	string responsavel;

	int previsaoConclusao; // em dias
	time_t dataCriacao;

	Project(string _nome, string _descricao, string _responsavel, int _previsaoConclusao);

	void setNome(string novoNome);
	void setResponsavel(string novoResponsavel);
	void setStatus(string novoStatus);

	void excluirToDo(string nomeToDo);
	void criarToDo(string _descricao, string _responsavel, int _previsaoConclusao);

	void getRelatorio();
};
