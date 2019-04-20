/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/

#include <cstdlib>
#include <fstream>
#include <string>
using namespace std;
// Exemplo de função desse controller

/* 
	Salva o projeto em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/
void persistirProjeto(string _nome, string _descricao, string _responsavel, int _previsaoConclusao) {
	ofstream fs;
	string dirProject = "..\\" + _nome + "\\";
	string fileName = _nome + ".txt";
	
	fs.open((dirProject + fileName).c_str());
	
	if(! fs.is_open()){
		
		
		system(("mkdir " + dirProject).c_str());
		fs.open((dirProject + fileName).c_str());
	}
	
	fs << "===Nome===:\t" + _nome + "\n";
	fs << "===Descricao===:\t" + _descricao + "\n"; 
	fs << "===Responsavel===:\t" + _responsavel + "\n";
	char sPrevisaoConclusao[3];
	// convert  to string
	sprintf(sPrevisaoConclusao, "%d", _previsaoConclusao);
	fs << "===Previsao de Conclusao===:\t" + string(sPrevisaoConclusao)+ "\n";

	fs.close();
}

/* 
	Salva o ToDo em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/
/*void persistirToDo(String projectName, ToDo toDo) {
	ofstream fs;
	string dirProject = "../" + projectName + "/";
	string fileName = toDo.titulo ".txt";
	
	fs.open(dirProject + fileName);
	
	fs << "===Titulo===:\t" + toDo.titulo + "\n";
	fs << "===Status===:\t" + toDo.status + "\n";
	fs << "===Responsavel===:\t" + toDo.responsavel + "\n";
	fs << "===Descricao===:\t" + toDo.descricao + "\n";

	fs.close();
}*/

/* acho que n�o se retorna string em c

os sets de todos os atributos de todo e de project

void setName(string nomeToDo, string newName){
}

String getTodo(String nomeToDo){
	return "";
}

String getProject(String nomeProject) {
	return "";
}*/


