/*
	Controller dos fluxos após abrir para edição e visualização
	de um Projeto
*/
# include "../structs/project.cpp"
#include "todoController.cpp"
#include <cstdio>
#include <cstdlib>

void createToDo(){
	char nameToDo[20];
	int duration;
	char responsible[50];
	
    printf("\tCRIAR ToDo");
    printf("\n\tDIGITE O NOME DA ToDo: ");
    gets(nameToDo);
    
    printf("\n\tDIGITE O NOME DOS RESPONSAVEIS: ");
	gets(responsible);
    
    printf("\n\tDIGITE A DURACAO DA ToDo (em dias): ");
	scanf("%d", &duration);
	
	printf("%s %d %s", nameToDo, duration, responsible);
	//repassar dados para fun��o que cria todo e joga no arquivo

    conclusionScreen("ToDo criado");
}

void listarToDO(){
	//chamar fun��o de listagem
}

void editName(char projectName[20]){
	char newName[20];
	printf("\tEDITAR NOME DO PROJETO\n");
	
	printf("\tNOME ATUAL: %s", projectName);
	
    printf("\n\tDIGITE O NOVO NOME: ");
    gets(newName);
	
	printf("%s", newName);
	conclusionScreen("Nome do projeto atualizado");

	//repassar dado para fun��o de edi��o
}

void gerarRelatorio(char projectName[20]){
	//retorna dados do projeto com avalia��o de como est� indo o projeto
	
}

void editToDo(){
	char nameToDo[20];
	
	printf("\n\tDIGITE O NOME DA ToDo: ");
    gets(nameToDo);
    
    //verificar se ToDo existe
    todoMain(nameToDo);
}

void projectMain(char projectName[20]) {
	int choice;

	do{
   		system("cls || clear");
        printf("\n\t===== %s ===== \n\n", projectName);
        printf("\t1. Criar ToDo\n");
        printf("\t2. Editar ToDo\n");
        printf("\t3. Listar ToDo\n");
        printf("\t4. Gerar Relatorio\n");
        printf("\t5. Editar Nome\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        fflush(stdin);
		system("cls || clear");
        switch(choice){
            case 1:
                createToDo();
                break;

            case 2:
                editToDo();
                break;

            case 3:
                printf("%d", choice);
                break;
            
            case 4:
            	printf("%d", choice);
            	break;
            case 5:
            	editName(projectName);
            	break;

            case 0:
                system("\"C:\\workspace\\TODOL\\scripts\\main\\ToDol.exe\" ");
                break;

            default:
                printf("Digite uma opcao valida\n");
        }
        
    } while(choice);
    
} 


