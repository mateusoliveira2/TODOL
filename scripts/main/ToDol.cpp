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

	printf("\n\tDigite o nome do projeto: ");
	getline (cin, projectName);

	string projName = string(projectName);

	system("clear");
	if( projectExists(projName) ) projectMain(projectName);
	else printf("\n\tO projeto requisitado não existe.");
}

void sendProject(){
	string projectName, description, responsible;
	int prevision;

	printf("\n\tDigite o nome do projeto: ");
	getline (cin, projectName);

	printf("\n\tDigite a descrição do projeto: ");
	getline (cin, description);

	printf("\n\tDigite os responsaveis pelo projeto: ");
	getline (cin, responsible);

	printf("\n\tDigite a previsao de termino (em dias): ");
	scanf("%d", &prevision);
	cin.ignore();

	createProject(projectName, description, responsible, "A fazer", prevision);
	conclusionScreen("Projeto criado");
}

void concludeProject(){
	string projectName;

	printf("\n\tDigite o nome do projeto: ");
	getline (cin, projectName);

	setStatusProjeto(projectName, "Concluido");
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
        cin.ignore();

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
