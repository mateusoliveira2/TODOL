
/*
    Controller dos fluxos após abrir para edição e visualização
    de uma toDo
*/

#include "todoController.h"

void createToDo(string project, string nameToDo, string description, string responsible, int duration){
    //converte data para string e passa para o gravar toDo
    string data = "dd/mm/aaaa"; //

    gravarToDo(project, nameToDo, description, responsible, "A fazer", duration, data);
}

string editTodoName(string projectName, string name){
	string newName;
	printf("\tEditar nome do ToDo\n");

	printf("\tNome atual: %s", removeFormatWithUnderscore(name).c_str());

    printf("\n\tDigite o novo nome: ");
    getline (cin, newName);

    name = formatWithUnderscore(name);
    newName = formatWithUnderscore(newName);

    if(name == newName){
        system("cls || clear");
        printf("\n\tOs nomes de ToDos são iguais");
        return name;
    }

    setNomeToDo(projectName, name, newName);

	conclusionScreen("Nome do ToDo atualizado");

    return newName;
}


void editResponsible(string projectName, string todoName){
	string respon;
    printf("\tEditar responsaveis do ToDo\n");

    printf("\n\tDigite os novos responsaveis: ");
    getline (cin, respon);

    setResponsavelToDo(projectName, todoName, respon);

	conclusionScreen("Responsaveis do ToDo atualizado");
}

void editSituation(string projectName, string todoName){
	string status;
    int choice;

	printf("\tEditar situação do ToDo\n");

    printf("\t1. A fazer\n");
    printf("\t2. Em andamento\n");
    printf("\t3. Concluido\n");
    printf("\tEscolha: ");

    scanf("%d", &choice);
    cin.ignore();

    if(choice == 1)         status = "A fazer";
    else if(choice == 2)    status = "Em andamento";
    else if(choice == 3)    status = "Concluido";
    else {
        printf("Opcao invalida... retornando\n");
        return;
    }

    setStatusToDo(projectName, todoName, status);

	conclusionScreen("Status do ToDo atualizado");
}

void todoMain(string projName, string todoName) {
    todoName = formatWithUnderscore(todoName);

	int choice;

	do {
        printf("\n\t===== %s ===== \n\n", removeFormatWithUnderscore(todoName).c_str());
        printf("\t1. Editar Nome\n");
        printf("\t2. Editar Responsaveis\n");
        printf("\t3. Editar Situacao\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        cin.ignore();

        system("cls || clear");
        switch(choice){
            case 1:
                todoName = editTodoName(projName, todoName);
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
