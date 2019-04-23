/*
	Controller dos fluxos após abrir para edição e visualização
	de um Projeto
*/

#pragma once
#include <iostream>
#include "todoController.cpp"
#include "../util.cpp"
#include <cstdio>
#include <cstdlib>

void createProject(string name, string description, string responsible, int prevision) {
    gravarProjeto(name, description, responsible, prevision);
}

void sendToDo(string projectName) {
	string nameToDo, description, responsible;
	int duration;

    printf("\tCRIAR ToDo");
    printf("\n\tDIGITE O NOME DA ToDo: ");
    getline (cin, nameToDo);

    printf("\n\tDESCRICAO DA ToDo: ");
	getline (cin, description);

	printf("\n\tDIGITE O NOME DOS RESPONSAVEIS: ");
	getline (cin, responsible);

    printf("\n\tDIGITE A DURACAO DA ToDo (em dias): ");
	scanf("%d", &duration);
    getchar();

	createToDo(projectName, nameToDo, description, responsible, duration);
    conclusionScreen("ToDo criado");
}

void listarToDo() {
	//chamar funcao de listagem
}

void filterByName(string projectName) {
    string filterName;

    printf("\n\t===== Filtro por nome ===== \n\n");
    printf("\n\tDigite o filtro de nome: ");
    getline (cin, filterName);

    filterByNameAllToDos(projectName, filterName);
    conclusionScreen("Filtrado por nome");
}

void filterBySituation(string projectName ){
    string filterSituation;
    int choice;

    printf("\n\t===== Filtro por situacao ===== \n\n");
    printf("\t1. A fazer\n");
    printf("\t2. Em andamento\n");
    printf("\t3. Concluido\n");
    printf("\tEscolha: ");

    scanf("%d", &choice);
    getchar();

    if(choice == 1)         filterSituation = "A fazer";
    else if(choice == 2)    filterSituation = "Em andamento";
    else if(choice == 3)    filterSituation = "Concluido";
    else {
        printf("Opcao invalida... retornando\n");
        return;
    }

    filterBySituationAllToDos(projectName, filterSituation);
    conclusionScreen("Filtrado por situacao");
}

void filterByDate(string projectName) {
    string filterDate;

    printf("\n\t===== Filtro por data de criacao ===== \n\n");
    printf("\n\tDigite o filtro de data (formato dd-mm-aaaa): ");
    getline (cin, filterDate);


    //filterByDateAllToDos(projectName, filterDate);
    conclusionScreen("Filtrado por data");
}

void filterByResponsable(string projectName) {
    string filterResponsable;

    printf("\n\t===== Filtro por responsavel ===== \n\n");
    printf("\n\tDigite o filtro de responsavel: ");
    getline (cin, filterResponsable);

    filterByResponsableAllToDos(projectName, filterResponsable);
    conclusionScreen("Filtrado por responsavel");
}

void filterTodo(string projectName) {
    int choice;

    do{
        system("cls || clear");
        printf("\n\t===== %s ===== \n\n", projectName.c_str());
        printf("\t1. Filtrar por nome\n");
        printf("\t2. Filtrar por situacao\n");
        printf("\t3. Filtrar por data\n");
        printf("\t4. Filtrar por responsavel\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        getchar();

        system("cls || clear");
        switch(choice){
            case 1:
                filterByName(projectName);
                break;

            case 2:
                filterBySituation(projectName);
                break;

            case 3:
                filterByDate(projectName);
                break;

            case 4:
                filterByResponsable(projectName);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }

    } while(choice);

}

void editName(string projectName) {
	string newName;
	printf("\tEDITAR NOME DO PROJETO\n");

	printf("\tNOME ATUAL: %s", projectName.c_str());

    printf("\n\tDIGITE O NOVO NOME: ");
    getline (cin, newName);

	//setNome(newName);
	conclusionScreen("Nome do projeto atualizado");

}

void gerarRelatorio(string projectName) {
	//retorna dados do projeto com avalia��o de como est� indo o projeto
}

void editToDo() {
	string nameToDo;

	printf("\n\tDIGITE O NOME DA ToDo: ");
    getline (cin, nameToDo);

    //verificar se ToDo existe
    todoMain(nameToDo);
}

void projectMain(string projectName ){
	int choice;

	do{
   		system("cls || clear");
        printf("\n\t===== %s ===== \n\n", projectName.c_str());
        printf("\t1. Criar ToDo\n");
        printf("\t2. Editar ToDo\n");
        printf("\t3. Listar ToDo\n");
        printf("\t4. Filtrar ToDo\n");
        printf("\t5. Gerar Relatorio\n");
        printf("\t6. Editar Nome do Projeto\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        getchar();

        system("cls || clear");
        switch(choice) {
            case 1:
                sendToDo(projectName);
                break;

            case 2:
                editToDo();
                break;

            case 3:
                printf("%d", choice);
                break;

            case 4:
                filterTodo(projectName);
                break;

            case 5:
                printf("%d", choice);
                break;

            case 6:
                editName(projectName);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }

    } while(choice);

}


