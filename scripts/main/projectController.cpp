/*
	Controller dos fluxos apÃ³s abrir para ediÃ§Ã£o e visualizaÃ§Ã£o
	de um Projeto
*/
# include "../structs/project.cpp"
#include "todoController.cpp"
#include<stdio.h>
#include <stdlib.h>


void createToDo(){
	char nameToDo[20];
	int duration;
	char responsible[50];
	
    printf("\tCRIAR ToDo");
    printf("\n\tDIGITE O NOME DA ToDo: ");
    scanf("%s", nameToDo);
    
    printf("\n\tDIGITE O NOME DOS RESPONSÁVEIS: ");
	scanf("%s", responsible);
    
    printf("\n\tDIGITE A DURAÇÃO DA ToDo: ");
	scanf("%d", &duration);
	
	printf("%s %d %s", nameToDo, duration, responsible);
	//repassar dados para função que cria todo e joga no arquivo
}

void listarToDO(){
	//chamar função de listagem
}

void editName(char projectName[20]){
	char newName[20];
	printf("\tEDITAR NOME DO PROJETO\n");
	
	printf("\tNOME ATUAL: %s", projectName);
	
    printf("\n\tDIGITE O NOVO NOME: ");
    scanf("%s", newName);
	
	printf("%s", newName);
	system("cls || clear");

	//repassar dado para função de edição
}

void gerarRelatorio(char projectName[20]){
	//retorna dados do projeto com avaliação de como está indo o projeto
	
}

void editToDo(){
	char nameToDo[20];
	
	printf("\n\tDIGITE O NOME DA ToDo: ");
    scanf("%s", nameToDo);
    
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
                system("\"C:\\workspace\\C\\include teste\\menu.exe\"");
                break;

            default:
                printf("Digite uma opcao valida\n");
        }
        
    } while(choice);
    
} 


