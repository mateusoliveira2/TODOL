/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/
#include "../structs/project.cpp"
#include "../structs/toDo.cpp"

#include <cstdlib>
#include <fstream>
// Exemplo de função desse controller

/* 
	Salva o projeto em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/
void persistirProjeto(Project project) {
	ofstream fs;
	string dirProject = "../" + project.nome + "/";
	string fileName = project.nome ".txt";
	
	fs.open(dirProject + fileName);
	
	if(! fs.is_open()){
		system("mkdir " + dirProject + fileName);
		fs.open(dirProject + fileName);
	}
	
	fs << "===Nome===:\t" + project.nome + "\n";
	fs << "===Status===:\t" + project.status + "\n";
	fs << "===Responsavel===:\t" + project.responsavel + "\n";
	fs << "===Descricao===:\t" + project.descricao + "\n";

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

String getTodo(String nomeToDo){
	return "";
}

String getProject(String nomeProject) {
	return "";
}