void editTodoName(char name[20]){
	char newName[20];
	printf("\tEDITAR NOME DO ToDo\n");
	
	printf("\tNOME ATUAL: %s", name);
	
    printf("\n\tDIGITE O NOVO NOME: ");
    scanf("%s", newName);
	
	system("cls || clear");
	printf("%s", newName);
	//repassar dado para função de edição
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
                system("\"C:\\workspace\\C\\include teste\\projetoMenu.exe\" ");
                break;

            default:
                printf("Digite uma opcao valida\n");
        }
        
    } while(choice);
    
} 
