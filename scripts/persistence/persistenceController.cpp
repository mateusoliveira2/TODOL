/*
	Controlador de persistência e recuperação de Projetos, ToDos e 
	qualquer outro dado que deva ser armazenado em arquivos.
*/

#include "persistenceController.h"

// Exemplo de função desse controller

/* 
	Salva o projeto em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/

bool validProject(string projName) {
	ifstream fs;

	fs.open( ("./Projects/" + projName + "/" + projName + ".txt").c_str() );
	bool ret = true;
	
	if( !fs.is_open() ) ret = false;
	fs.close();

	return ret;
}

void persistirProjeto(string _nome, string _descricao, string _responsavel, string _status, int _previsaoConclusao, string _data) {
	ofstream fs;

	string dirProject = "./Projects/" + _nome + "/";
	string fileName = _nome + ".txt";
	
	system("mkdir -p ./Projects/");

	fs.open( (dirProject + fileName).c_str());

	if( !fs.is_open() ){
		system( ("mkdir " + dirProject).c_str() );
		fs.open( (dirProject + fileName).c_str());
	}
	
	fs << _nome + "\n";
	fs << _descricao + "\n"; 
	fs << _responsavel + "\n";
	fs << _status + "\n";

	// convert to string
	fs << to_string(_previsaoConclusao) + "\n";
	fs << _data;

	fs.close();
}

vector<string> returnProjeto(string nameProject){
	ifstream fs;
	string dirProject = "./Projects/" + nameProject + "/";
	string fileName = nameProject + ".txt";

	fs.open( (dirProject + fileName).c_str() );

	vector <string> lines;
	string x;
	
	while( getline(fs, x) ) lines.push_back(x);
	fs.close();

	return lines;
}

void setNomeProjeto(string nome, string novoNome){
	vector<string> line;
	string pathAtual = "Projects/" + nome + "/";
	string pathNovo =  "Projects/" + novoNome + "/";
	string fileAtual = nome + ".txt";
	string fileNovo = novoNome + ".txt";

	line = returnProjeto(nome);

	system(("mv " + pathAtual + fileAtual + " " + pathAtual + fileNovo).c_str());
	system(("mv " + pathAtual + " " + pathNovo).c_str());

	persistirProjeto(novoNome, line[1], line[2], line[3], stoi(line[4]), line[5]);
}

void setStatusProjeto(string nome, string status){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(line[0], line[1], line[2], status, stoi(line[4]), line[5]);
}

void setDescricaoProjeto(string nome, string descricao){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(line[0], descricao, line[2], line[3], stoi(line[4]), line[5]);
}

void setResponsavelProjeto(string nome, string responsavel){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(line[0], line[1], responsavel, line[3], stoi(line[4]), line[5]);
}

void setDataProjeto(string nome, string data){
	vector<string> line;
	line = returnProjeto(nome);
	persistirProjeto(line[0], line[1], line[2], line[3], stoi(line[4]), data);
}

/*
	Retorna o nome de todas as ToDos (uma por uma) do projeto
*/
vector<string> returnAllProjectsName(){
	DIR *dir;
    struct dirent *lsdir;
	string path = "./Projects/";
    dir = opendir(path.c_str());

	vector<string> projects;
	
    while ( ( lsdir = readdir(dir) ) != NULL ){
		string aux = string(lsdir->d_name);
		if(aux != ".." && aux != "."){
			projects.push_back(aux);
		}
    }

    closedir(dir);

	return projects;
}

/*
	Retorna o conteúdo de todos os projetos (um por um).
*/
vector<vector<string> > returnAllProjectsContent(){
	vector<string> project;
	vector<string> nomesProjects;
	vector<vector<string> > retorno;

	nomesProjects = returnAllProjectsName();
	
	for(int i = 0; i < nomesProjects.size(); i++){
		project = returnProjeto( nomesProjects[i] );
		retorno.push_back(project);
	}
	return retorno;
}