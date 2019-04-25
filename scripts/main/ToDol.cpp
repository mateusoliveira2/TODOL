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
#include "../util.h"

using namespace std;

bool showExistentProjects() {
	vector<string> projects = getAllProjectsNames();
	
	if(projects.size() > 0) {
		printf("\n\tProjetos existentes:\n");
		for(int i = 0; i < (int) projects.size(); i++) {
			printf("\t%d. %s\n", i+1, projects[i].c_str());
		}
		return true;
	}
	
	printf("\n\tAtenção: Opção inválida. Atualmente não existem projetos cadastrados.\n");
	return false;
}

void selectProject() {
	string projectName;

	if( showExistentProjects() ) {
		printf("\n\tDigite o nome do projeto que você deseja selecionar: ");
		getline(cin, projectName);

		string projName = string(projectName);

		system("clear");
		if( projectExists(projName) ) projectMain(projectName);
		else printf("\n\tO projeto requisitado não existe.");
	}
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
	if( showExistentProjects() ) {
		string projName;

		printf("\n\tDigite o nome do projeto que você deseja marcar como concluído: ");
		getline(cin, projName);

		system("clear");
		if( projectExists(projName) ) {
			setStatusProjeto(projName, "Concluido");
			conclusionScreen("Conclusao feita");
		}
		else printf("\n\tO projeto requisitado não existe.");
	}
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
