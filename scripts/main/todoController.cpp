
/*
    Controller dos fluxos após abrir para edição e visualização
    de uma toDo
*/

#include "todoController.h"

void createToDo(string project, string nameToDo, string description, string responsible, int duration, string data){
    gravarToDo(project, nameToDo, description, responsible, "A fazer", duration, data);
}

void editTodoName(string projectName, string name){
	string newName;
	printf("\tEDITAR NOME DO ToDo\n");

	printf("\tNOME ATUAL: %s", name.c_str());

    printf("\n\tDIGITE O NOVO NOME: ");
    getline (cin, newName);

    setNomeToDo(projectName, name, newName);

	conclusionScreen("Nome do ToDo atualizado");
}


void editResponsible(string projectName, string todoName){
	string respon;
	printf("\tEDITAR RESPONSAVEIS DO ToDo\n");

    printf("\n\tDIGITE OS NOVOS RESPONSAVEIS: ");
    getline (cin, respon);

    setResponsavelToDo(projectName, todoName, respon);

	conclusionScreen("Responsaveis do ToDo atualizado");
}

void editSituation(string projectName, string todoName){
	string status;
	printf("\tEDITAR SITUAÇÃO DO ToDo\n");

    printf("\n\tDIGITE O NOVO STATUS: ");
    getline (cin, status);

    setStatusToDo(projectName, todoName, status);

	conclusionScreen("Status do ToDo atualizado");
}

void todoMain(string projName, string todoName) {
	int choice;

	do {
        printf("\n\t===== %s ===== \n\n", todoName.c_str());
        printf("\t1. Editar Nome\n");
        printf("\t2. Editar Responsaveis\n");
        printf("\t3. Editar Situacao\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        getchar();

        system("cls || clear");
        switch(choice){
            case 1:
                editTodoName(projName, todoName);
                break;

            case 2:
                editResponsible(projName, todoName);
                break;

            case 3:
                editSituation(projName, todoName);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }

    } while(choice);

}
