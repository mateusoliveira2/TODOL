/*
	Implementação da struct (model) de um ToDo, entidade 
	fundamental de um Projeto.
*/

#pragma once
#include "toDo.h"

ToDo::ToDo(string _projeto, string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	this->nome = _nome;
	this->descricao = _descricao;
	this->responsavel = _responsavel;
	this->previsaoConclusao = _previsaoConclusao;

	this->status = "A fazer";
	this->dataCriacao = time(0);
}

string ToDo::getStatus() { 
	return this->status;
}

void ToDo::setStatus(string novoEstado) {
	if(novoEstado == "A fazer") this->status = novoEstado;
	if(novoEstado == "Em andamento") this->status = novoEstado;
	if(novoEstado == "Concluido") this->status = novoEstado;
}

string ToDo::getResponsavel() {
	return this->responsavel;
}

void ToDo::setResponsavel(string novoResponsavel) {
	this->responsavel = novoResponsavel;
}
