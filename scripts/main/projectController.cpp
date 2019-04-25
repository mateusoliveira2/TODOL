/*
	Controller dos fluxos após abrir para edição e visualização
	de um Projeto
*/

#include "projectController.h"

void createProject(string name, string description, string responsible, string status, int prevision) {
    //converte data para string e passa para o gravar projeto
    string data = "dd/mm/aaaa"; //

    gravarProjeto(name, description, responsible, status, prevision, data);
}

void sendToDo(string projectName) {
	string nameToDo, description, responsible;
	int duration;

    //criar checagem para impedir se o projeto estiver concluido

    printf("\tCriar ToDo");
    printf("\n\tDigite o nome da ToDo: ");
    getline (cin, nameToDo);

    printf("\n\tDescricao da ToDo: ");
	getline (cin, description);

	printf("\n\tDigite o nome dos responsaveis: ");
	getline (cin, responsible);

    printf("\n\tDigite a duração da ToDo (em dias): ");
	scanf("%d", &duration);
    cin.ignore();

	createToDo(projectName, nameToDo, description, responsible, duration);
    conclusionScreen("ToDo criado");
}

void filterTodo(string projectName) {
    filterMain(projectName);
}

string editName(string projectName) {
	string newName;
    printf("\tEditar nome do projeto\n");

	printf("\tNome atual: %s", removeFormatWithUnderscore(projectName).c_str());

    printf("\n\tDigite o novo nome: ");
    getline (cin, newName);

    projectName = formatWithUnderscore(projectName);
    newName = formatWithUnderscore(newName);

    if(projectName == newName){
        system("cls || clear");
        printf("\n\tOs nomes de projeto são iguais");
        return projectName;
    }

	setNomeProjeto(projectName, newName);
	conclusionScreen("Nome do projeto atualizado");

    return newName;
}

void gerarRelatorio(string projectName) {
	//retorna dados do projeto com avaliacao de como esta indo o projeto
}

void editToDo(string projName) {
	string nameToDo;

    printf("\n\tDigite o nome da ToDo: ");
    getline (cin, nameToDo);

    system("clear");
    if( todoExists(projName, nameToDo) ) todoMain(projName, nameToDo);
    else printf("\n\tO ToDo requisitado não existe.");
}

void listToDos(string projName){
    getAllToDos(projName);
    conclusionScreen("Listagem de ToDos");
}

void projectMain(string projectName) {
    projectName = formatWithUnderscore(projectName);

    system("cls || clear");
    int choice = 1;

	do {
        printf("\n\t===== %s ===== \n", removeFormatWithUnderscore(projectName).c_str());

        displayProject(projectName);

        printf("\t1. Criar ToDo\n");
        printf("\t2. Editar ToDo\n");
        printf("\t3. Listar ToDo\n");
        printf("\t4. Filtrar ToDo\n");
        printf("\t5. Gerar Relatorio\n");
        printf("\t6. Editar Nome do Projeto\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        cin.ignore();

        system("cls || clear");
        switch(choice) {
            case 1:
                sendToDo(projectName);
                break;

            case 2:
                editToDo(projectName);
                break;

            case 3:
                listToDos(projectName);
                break;

            case 4:
                filterTodo(projectName);
                break;

            case 5:
                printf("%d", choice);
                break;

            case 6:
                projectName = editName(projectName);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
                break;
        }

    } while(choice);
}


