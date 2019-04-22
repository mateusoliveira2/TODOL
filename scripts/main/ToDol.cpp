/*
	Main da aplicacao.
	Controlla o loop principal e a entrada e saida de dados
	no menu principal para o usuario.
*/

#include <cstdio>
#include <cstdlib>
#include "projectController.cpp"

void selectProject() {
	char projectName[20];

	printf("\n\tDIGITE O NOME DO PROJETO: ");
	fgets(projectName, 20, stdin);

	string projName = string(projectName);

	system("clear");
	if( projectExists(projName) ) projectMain(projectName);
	else printf("\n\tO PROJETO REQUISITADO NÃO EXISTE.");
}

void sendProject(){
	char projectName[30], description[100], responsible[100];
	int prevision;

	printf("\n\tDIGITE O NOME DO PROJETO: ");
	fgets(projectName, 30, stdin);

	printf("\n\tDIGITE A DESCRICAO DO PROJETO: ");
	fgets(description, 100, stdin);

	printf("\n\tDIGITE OS RESPONSAVEIS PELO DO PROJETO: ");
	fgets(responsible, 100, stdin);

	printf("\n\tDIGITE A PREVISAO DE TERMINO: ");
	scanf("%d", &prevision);
	getchar();

	createProject(projectName, description, responsible, prevision);
	conclusionScreen("Projeto criado");
}

void concludeProject(){
	char projectName[20];

	printf("\n\tDIGITE O NOME DO PROJETO: ");
	fgets(projectName, 20, stdin);

	//chama setStatus de projeto
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
        getchar();

		system("cls || clear");
        switch(choice){
            case 1:
                sendProject();
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
