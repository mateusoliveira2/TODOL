/*
	Implementação da struct (model) de um Projeto.
*/

#include "project.h"

Project(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	this->nome = _nome;
	this->descricao = _descricao;
	this->responsavel = _responsavel;

	this->previsaoConclusao = _previsaoConclusao;
	this->dataCriacao = time(0);
}

void setNome(string novoNome) {
	this->nome = novoNome;
}

void setResponsavel(string novoResponsavel) {
	this->responsavel = novoResponsavel;
}

void setStatus(string novoStatus) {
	// checar validade de novoStatus
	this->status = novoStatus;
}

void excluirToDo(string nomeToDo) {
	// TBD
}

void criarToDo(string _descricao, string _responsavel, int _previsaoConclusao) {
	// TBD
}

void getRelatorio(string nome) {
	// TBD
}

// filterNome()
// filterSituacao()
// filterData()