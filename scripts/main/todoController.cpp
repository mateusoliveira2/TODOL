#include <cstdio>
#include <cstdlib>
#include "../structs/toDo.cpp"

void createToDo(string project, string nameToDo, string description, string responsible, int duration){
	ToDo(project, nameToDo, description, responsible, duration);
}
void conclusionScreen(char acao[20]){
	printf("\n\t%s com sucesso!", acao);

	char choice = 'n';
	do  {
		printf("\n\nDeseja voltar? (s/n): ");
		scanf("%c", &choice);
        getchar();
	} while(choice != 's');
	
	system("cls || clear");
}

void editTodoName(char name[20]){
	char newName[20];
	printf("\tEDITAR NOME DO ToDo\n");
	
	printf("\tNOME ATUAL: %s", name);
	
    printf("\n\tDIGITE O NOVO NOME: ");
    gets(newName);
	
	//conclusionScreen("Nome do ToDo atualizado");

}

void todoMain( char todoName[20]){
	int choice;

	do{
    
        printf("\n\t===== %s ===== \n\n", todoName);
        printf("\t1. Editar Nome\n");
        printf("\t2. Editar Responsaveis\n");
        printf("\t3. Editar Situacao\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        getchar();
        
        //fflush(stdin);
        //__fpurge(stdin);
		
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
