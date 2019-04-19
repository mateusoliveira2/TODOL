/*
	Implementação da struct (model) de um Projeto.
*/
#include "../persistence/persistenceController.cpp"
#include "project.h"

void gravar(string _nome, string _descricao, string _responsavel, int _previsaoConclusao){
	persistirProjeto(_nome, _descricao, _responsavel, _previsaoConclusao);
}

Project::Project(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	this->nome = _nome;
	this->descricao = _descricao;
	this->responsavel = _responsavel;

	this->previsaoConclusao = _previsaoConclusao;
	this->dataCriacao = time(0);
	gravar(_nome, _descricao, _responsavel, _previsaoConclusao);
}



void Project::setNome(string novoNome) {
	this->nome = novoNome;
}

void Project::setResponsavel(string novoResponsavel) {
	this->responsavel = novoResponsavel;
}

void Project::setStatus(string novoStatus) {
	// checar validade de novoStatus
	this->status = novoStatus;
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

// filterNome()
// filterSituacao()
// filterData()
