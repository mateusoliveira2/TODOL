/*
	Implementação da struct (model) de um Projeto.
*/

#include "project.h"

Project::Project(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	this->nome = _nome;
	this->descricao = _descricao;
	this->responsavel = _responsavel;
	
	this->status = "A fazer";
	this->previsaoConclusao = _previsaoConclusao;
	this->dataCriacao = time(0);
}

Project::Project(vector<string> parametros) {
	this->nome = parametros[0];
	this->descricao = parametros[1];
	this->responsavel = parametros[2];
	this->status = parametros[3];
	this->previsaoConclusao = stoi(parametros[4]);
}

void Project::setNome(string novoNome) {
	this->nome = novoNome;
}

void Project::setResponsavel(string novoResponsavel) {
	this->responsavel = novoResponsavel;
}

void Project::setStatus(string novoEstado) {
	if(novoEstado == "A fazer") this->status = novoEstado;
	if(novoEstado == "Em andamento") this->status = novoEstado;
	if(novoEstado == "Concluido") this->status = novoEstado;
	//setStatusProjeto(this->nome, this->status);
}

void Project::excluirToDo(string nomeToDo) {
	// TBD
}

void Project::criarToDo(string _descricao, string _responsavel, int _previsaoConclusao) {
	// TBD
}

void Project::getRelatorio() {
	// TBD
}