/*
	Implementação da struct (model) de um ToDo, entidade 
	fundamental de um Projeto.
*/

#include "toDo.h"
#include "../persistence/persistenceToDoController.cpp"

 
void gravarToDo(string _projeto, string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao){
	persistirToDo(_projeto, _nome, _descricao, _responsavel, _status, _previsaoConclusao);
}
ToDo::ToDo(string _projeto, string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	this->nome = _nome;
	this->descricao = _descricao;
	this->responsavel = _responsavel;
	this->previsaoConclusao = _previsaoConclusao;

	this->status = "A fazer";
	this->dataCriacao = time(0);
	gravarToDo(_projeto, _nome, _descricao, _responsavel, status, _previsaoConclusao);
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
