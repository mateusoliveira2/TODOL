void conclusionScreen(char acao[20]){
	printf("\n\t%s com sucesso!", acao);

	char choice = 'n';
	do  {
		printf("\n\nDeseja voltar? (s/n): ");
		scanf("%s", &choice);
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
	//repassar dado para fun��o de edi��o
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
        fflush(stdin);
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
                system("\"C:\\workspace\\TODOL\\scripts\\main\\projectController.exe\" ");
                break;

            default:
                printf("Digite uma opcao valida\n");
        }
        
    } while(choice);
    
} 
