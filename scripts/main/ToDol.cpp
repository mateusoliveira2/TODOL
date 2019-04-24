/*
	Main da aplicacao.
	Controlla o loop principal e a entrada e saida de dados
	no menu principal para o usuario.
*/

#include <cstdio>
#include <cstdlib>
#include <string>
#include <iostream>

#include "projectController.h"

using namespace std;

void selectProject() {
	string projectName;

	printf("\n\tDIGITE O NOME DO PROJETO: ");
	getline (cin, projectName);
	printf("%s", projectName.c_str());

	string projName = string(projectName);

	system("clear");
	if( projectExists(projName) ) projectMain(projectName);
	else printf("\n\tO PROJETO REQUISITADO NÃO EXISTE.");
}

void sendProject(){
	string projectName, description, responsible;
	int prevision;

	printf("\n\tDIGITE O NOME DO PROJETO: ");
	getline (cin, projectName);

	printf("\n\tDIGITE A DESCRICAO DO PROJETO: ");
	getline (cin, description);

	printf("\n\tDIGITE OS RESPONSAVEIS PELO DO PROJETO: ");
	getline (cin, responsible);

	printf("\n\tDIGITE A PREVISAO DE TERMINO: ");
	scanf("%d", &prevision);
	getchar();

	createProject(projectName, description, responsible, prevision);
	conclusionScreen("Projeto criado");
}

void concludeProject(){
	string projectName;

	printf("\n\tDIGITE O NOME DO PROJETO: ");
	getline (cin, projectName);

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
