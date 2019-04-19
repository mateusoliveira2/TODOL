/*
	Main da aplicacao.
	Controlla o loop principal e a entrada e saida de dados 
	no menu principal para o usuario.
*/

#include <cstdio>
#include <cstdlib>
#include "projectController.cpp"
#include "../structs/project.cpp"

void selectProject(){
	char projectName[20];
	
	printf("\n\tDIGITE O NOME DO PROJETO: ");
	gets(projectName);
	
	system("cls || clear");
	
	//verifica��o que existe para poder ir pra o projectName

	projectMain(projectName);
}

void createProject(){
	char projectName[20], description[100], responsible[50];
	int prevision;
	
	printf("\n\tDIGITE O NOME DO PROJETO: ");
	gets(projectName);
	
		
	printf("\n\tDIGITE A DESCRICAO DO PROJETO: ");
	gets(description);

	printf("\n\tDIGITE OS RESPONSAVEIS PELO DO PROJETO: ");
	gets(responsible);
	
	printf("\n\tDIGITE A PREVISAO DE TERMINO: ");
	scanf("%d", &prevision);
	
	
	Project(projectName, description, responsible, prevision);

	conclusionScreen("Projeto criado");
}

void concludeProject(){
	char projectName[20];
	printf("\n\tDIGITE O NOME DO PROJETO: ");
	gets(projectName);

	//aqui ja viria o retorno da fun��o que exclui o arquivo.
	conclusionScreen("Conclusao feita");
}

int main () {
	int choice;

    do {
        printf("\n\tTODOL\n\n");
        printf("\t1. Criar Projeto\n");
        printf("\t2. Selecionar Projeto\n");
        printf("\t3. Concluir projeto\n");
        printf("\t0. Sair\n\n");
        printf("\tESCOLHA: ");

        scanf("%d", &choice);
        fflush(stdin);
		system("cls || clear");
        switch(choice){
            case 1:
                createProject();
                break;

            case 2:
                selectProject();
                break;

            case 3:
                concludeProject();
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }
        
    } while(choice);
	
	return 0;
}
