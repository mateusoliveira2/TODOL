/* 
	Salva o ToDo em um arquivo, de preferência 
	em uma pasta separada dos scripts
*/

#include "persistenceToDoController.h"

void persistirToDo(string projectName, string _nome, string _descricao, string _responsavel, string _status, int previsao, string _data) {
	ofstream fs;
	
	string dirProject = "./Projects/" + projectName + "/";
	string fileName = _nome + ".txt";
	
	fs.open((dirProject + fileName).c_str());
	
	fs << _nome + "\n";
	fs << _status + "\n";
	fs << _responsavel + "\n";
	fs << _descricao + "\n";
	fs << to_string(previsao) + "\n";
	fs << to_string(time(0));

	fs.close();
}

bool validTodo(string projName, string todoName) {
	ifstream fs;

	fs.open( ("./Projects/" + projName + "/" + todoName + ".txt").c_str() );
	bool ret = true;
	
	if( !fs.is_open() ) ret = false;
	fs.close();

	return ret;
}

vector<string> returnToDo(string projectName, string nameToDo, string extension = ".txt"){
	ifstream fs;
	string dirProject = "./Projects/" + projectName + "/";
	string fileName = nameToDo + extension;

	fs.open( (dirProject + fileName).c_str() );

	vector <string> lines;
	string x;
	
	while( getline(fs, x) ) lines.push_back(x);
	fs.close();

	persistirToDo(projectName, lines[0], lines[3], lines[2], lines[1], stoi(lines[4]), lines[5]);

	return lines;
}

void setNomeToDo(string projectName, string nome, string novoNome){
	vector<string> line;
	string pathAtual = "Projects/" + projectName + "/" + nome + ".txt";
	string pathNovo =  "Projects/" + projectName + "/" + novoNome + ".txt";
	
	line = returnToDo(projectName, nome);
	
	system(("mv " + pathAtual + " " + pathNovo).c_str());

	persistirToDo(projectName, novoNome, line[3], line[2],line[1], stoi(line[4]), line[5]);
}

void setStatusToDo(string projectName, string nome, string status){
	vector<string> line;
	line = returnToDo(projectName, nome);
	persistirToDo(projectName, line[0], line[3], line[2], status, stoi(line[4]), line[5]);
}

void setResponsavelToDo(string projectName, string nome, string responsavel){
	vector<string> line;
	line = returnToDo(projectName, nome);
	persistirToDo(projectName, line[0], line[3], responsavel, line[1], stoi(line[4]), line[5]);
}

void setDataToDo(string projectName, string nome, string data){
	vector<string> line;
	line = returnToDo(projectName, nome);
	persistirToDo(projectName, line[0], line[3], line[2], line[1], stoi(line[4]), data);
}

/*
	Retorna o nome de todas as ToDos (uma por uma) do projeto
*/
vector<string> returnAllTodos(string projectName){
	DIR *dir;
    struct dirent *lsdir;
	string path = "./Projects/" + projectName + "/";
    dir = opendir(path.c_str());

	vector<string> todos;

	if(!dir) return todos;

    while ( ( lsdir = readdir(dir) ) != NULL ){
		string aux = string(lsdir->d_name);
		if(aux != ".." && aux != "." && aux != projectName + ".txt"){
			todos.push_back(aux);
		}
    }

    closedir(dir);

	return todos;
}

/*
	Retorna o conteúdo de todas as ToDos (uma por uma) do projeto.
*/
vector<vector<string> > returnAllTodosContent(string projectName){
	vector<vector<string> > retorno;
	vector<string> nomesToDo;
	vector<string> todo;
	nomesToDo = returnAllTodos(projectName);
	for(int i = 0; i < nomesToDo.size(); i++){
		todo = returnToDo(projectName, nomesToDo[i], "");
		retorno.push_back(todo);
	}
	return retorno;
}
