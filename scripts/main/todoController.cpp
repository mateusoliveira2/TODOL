
/*
    Controller dos fluxos após abrir para edição e visualização
    de uma toDo
*/

#include "todoController.h"

void createToDo(string project, string nameToDo, string description, string responsible, int duration){
    gravarToDo(project, nameToDo, description, responsible, "A fazer", duration);
}

void editTodoName(string name){
	string newName;
	printf("\tEDITAR NOME DO ToDo\n");

	printf("\tNOME ATUAL: %s", name.c_str());

    printf("\n\tDIGITE O NOVO NOME: ");
    getline (cin, newName);

	//conclusionScreen("Nome do ToDo atualizado");
}

void todoMain(string todoName) {
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
                editTodoName(todoName);
                break;

            case 2:
                printf("%d", choice);
                break;

            case 3:
                printf("%d", choice);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }

    } while(choice);

}
