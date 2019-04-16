/*
	Implementação da struct (model) de um ToDo, entidade 
	fundamental de um Projeto.
*/

#include "toDo.h"

ToDo(string _descricao, string _responsavel, int _previsaoConclusao) {
	this->descricao = _descricao;
	this->responsavel = _responsavel;
	this->previsaoConclusao = _previsaoConclusao;

	this->status = "A fazer";
	this->dataCriacao = time(0);
}

string getStatus() { 
	return this->status;
}

void setStatus(string novoEstado) {
	if(novoEstado == "A fazer") this->status = novoEstado;
	if(novoEstado == "Em andamento") this->status = novoEstado;
	if(novoEstado == "Concluido") this->status = novoEstado;
}

string getResponsavel() {
	return this->responsavel;
}

void setResponsavel(string novoResponsavel) {
	this->responsavel = novoResponsavel;
}