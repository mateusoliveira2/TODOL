#include "filterController.h"

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
    cin.ignore();

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

void filterByResponsable(string projectName) {
    string filterResponsable;

    printf("\n\t===== Filtro por responsavel ===== \n\n");
    printf("\n\tDigite o filtro de responsavel: ");
    getline (cin, filterResponsable);

    filterByResponsableAllToDos(projectName, filterResponsable);
    conclusionScreen("Filtrado por responsavel");
}

void filterMain(string projectName){
    int choice;

    do {
        system("cls || clear");
        printf("\n\t===== Filtro de toDos do Projeto %s ===== \n\n", removeFormatWithUnderscore(projectName).c_str());
        printf("\t1. Filtrar por nome\n");
        printf("\t2. Filtrar por situacao\n");
        printf("\t3. Filtrar por responsavel\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        cin.ignore();

        system("cls || clear");
        switch(choice){
            case 1:
                filterByName(projectName);
                break;

            case 2:
                filterBySituation(projectName);
                break;

            case 3:
                filterByResponsable(projectName);
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }

    } while(choice);
}