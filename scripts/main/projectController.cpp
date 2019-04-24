/*
	Controller dos fluxos após abrir para edição e visualização
	de um Projeto
*/

#include "projectController.h"

void createProject(string name, string description, string responsible, int prevision) {
    gravarProjeto(name, description, responsible, prevision);
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

/*
    O Relatório é gerado a partir das informações persistidas durante a modificação do projeto,
    incluindo adição de toDos e mudança de estado destes.
*/
void gerarRelatorio(Project project) {
    system("cls || clear");

    printf("\t ===== Relatório de %s =====\n\n", project.nome.c_str());

    

    conclusionScreen("Relatório gerado");
}

void editToDo() {
	string nameToDo;

	printf("\n\tDIGITE O NOME DA ToDo: ");
    getline (cin, nameToDo);

    //verificar se ToDo existe
    todoMain(nameToDo);
}

void projectMain(string projectName) {
    // proj reconstruído da persistencia
    Project proj = Project( getProject(projectName) );
    
    int choice;

	do {
   		system("cls || clear");
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
                editToDo();
                break;

            case 3:
                printf("%d", choice);
                break;

            case 4:
                filterTodo(projectName);
                break;

            case 5:
                gerarRelatorio(proj);
                break;

            case 6:
                editName(projectName);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }

    } while(choice);
}


