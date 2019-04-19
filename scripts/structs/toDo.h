/*
	Struct (model) de um ToDo, entidade fundamental
	de um Projeto.
*/

#pragma once
#include <ctime>
#include <string>
using namespace std;

struct ToDo {
	string nome;
	string descricao;
	string responsavel;
	string status; // "A fazer", "Em andamento" e "Concluido"

	int previsaoConclusao; // em dias
	time_t dataCriacao;

	ToDo();
	ToDo(string _nome, string _descricao, string _responsavel, int _previsaoConclusao);
	
	string getStatus();
	void setStatus(string novoEstado);

	string getResponsavel();
	void setResponsavel(string novoResponsavel);
};
