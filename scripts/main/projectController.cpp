/*
	Controller dos fluxos após abrir para edição e visualização
	de um Projeto
*/

#include "projectController.h"

void createProject(string name, string description, string responsible, string status, int prevision) {
    gravarProjeto(name, description, responsible, status, prevision);
}

void sendToDo(string projectName) {
	string nameToDo, description, responsible;
	int duration;

    printf("\tCRIAR ToDo");
    printf("\n\tDIGITE O NOME DA ToDo: ");
    getline (cin, nameToDo);

    printf("\n\tDESCRICAO DA ToDo: ");
	getline (cin, description);

	printf("\n\tDIGITE O NOME DOS RESPONSAVEIS: ");
	getline (cin, responsible);

    printf("\n\tDIGITE A DURACAO DA ToDo (em dias): ");
	scanf("%d", &duration);
    getchar();

	createToDo(projectName, nameToDo, description, responsible, duration);
    conclusionScreen("ToDo criado");
}

void listarToDo() {
	//chamar funcao de listagem
}

void filterTodo(string projectName) {
    filterMain(projectName);
}

void editName(string projectName) {
	string newName;
	printf("\tEDITAR NOME DO PROJETO\n");

	printf("\tNOME ATUAL: %s", projectName.c_str());

    printf("\n\tDIGITE O NOVO NOME: ");
    getline (cin, newName);

	//setNome(newName);
	conclusionScreen("Nome do projeto atualizado");
}

void gerarRelatorio(string projectName) {
	//retorna dados do projeto com avaliacao de como esta indo o projeto
}

void editToDo(string projName) {
	string nameToDo;

	printf("\n\tDIGITE O NOME DA ToDo: ");
    getline (cin, nameToDo);

    system("clear");
    if( todoExists(projName, nameToDo) ) todoMain(nameToDo);
    else printf("\n\tO ToDo REQUISITADO NÃO EXISTE.");
}

void projectMain(string projectName) {

    Project proj = Project( getProject(projectName) );
    
    /*printf("------ %s ------\n", proj[0]);
    printf("-- Descricao: %s --\n", proj[1]);
    printf("-- Responsavel: %s --\n", proj[2]);
    printf("-- Status: %s --\n", proj[3]);
    printf("-- Previsao de Conclusao: %s --\n", proj[4]);
    printf("-------------------------");*/
    
    int choice = 1;

	do {
        system("cls || clear");
        if(choice == -1) printf("Digite uma opcao valida\n");
        printf("\n\t===== %s ===== \n\n", projectName.c_str());
        printf("\t1. Criar ToDo\n");
        printf("\t2. Editar ToDo\n");
        printf("\t3. Listar ToDo\n");
        printf("\t4. Filtrar ToDo\n");
        printf("\t5. Gerar Relatorio\n");
        printf("\t6. Editar Nome do Projeto\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        getchar();

        system("cls || clear");
        switch(choice) {
            case 1:
                sendToDo(projectName);
                break;

            case 2:
                editToDo(projectName);
                break;

            case 3:
                printf("%d", choice);
                break;

            case 4:
                filterTodo(projectName);
                break;

            case 5:
                printf("%d", choice);
                break;

            case 6:
                editName(projectName);
                break;

            case 0:
                break;

            default:
                choice = -1;
                break;
        }

    } while(choice);
}


