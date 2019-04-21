/*
	Controller dos fluxos após abrir para edição e visualização
	de um Projeto
*/

#include "todoController.cpp"
#include "../structs/project.cpp"
#include <cstdio>
#include <cstdlib>

void createProject(string name, string description, string responsible, int prevision){
	Project(name, description, responsible, prevision);
}
void sendToDo(char projectName[20]){
	char nameToDo[20], description[100], responsible[50];
	int duration;
	
    printf("\tCRIAR ToDo");
    printf("\n\tDIGITE O NOME DA ToDo: ");
    gets(nameToDo);
    
    printf("\n\tDESCRICAO DA ToDo: ");
	gets(description);
	
	printf("\n\tDIGITE O NOME DOS RESPONSAVEIS: ");
	gets(responsible);
    
    printf("\n\tDIGITE A DURACAO DA ToDo (em dias): ");
	scanf("%d", &duration);
		
	createToDo(projectName, nameToDo, description, responsible, duration);
	
    conclusionScreen("ToDo criado");
}

void listarToDO(){
	//chamar funcao de listagem
}

void filterByName(char projectName[20]){
    char filterName[20];

    printf("\n\t===== Filtro por nome ===== \n\n");
    printf("\n\tDigite o filtro de nome: ");
    gets(filterName);

    filterByNameAllToDos(projectName, filterName);
    
    conclusionScreen("Filtrado por nome");
}

void filterBySituation(char projectName[20]){
    string filterSituation;
    int choice;

    printf("\n\t===== Filtro por situacao ===== \n\n");
    printf("\t1. A fazer\n");
    printf("\t2. Em andamento\n");
    printf("\t3. Concluido\n");
    printf("\tEscolha: ");
    scanf("%d", &choice);

    if(choice == 1)         filterSituation = "A fazer";
    else if(choice == 2)    filterSituation = "Em andamento";
    else if(choice == 3)    filterSituation = "Concluido";
    else{
        printf("Opcao invalida... retornando\n");
        return;
    }

    filterBySituationAllToDos(projectName, filterSituation);

    conclusionScreen("Filtrado por situacao");
}

void filterByDate(char projectName[20]){
    char filterDate[50];

    printf("\n\t===== Filtro por data de criacao ===== \n\n");
    printf("\n\tDigite o filtro de data (formato dd-mm-aaaa): ");
    gets(filterDate);

    //filterByDateAllToDos(projectName, filterDate);
    
    conclusionScreen("Filtrado por data");
}

void filterByResponsable(char projectName[20]){
    char filterResponsable[20];

    printf("\n\t===== Filtro por responsavel ===== \n\n");
    printf("\n\tDigite o filtro de responsavel: ");
    gets(filterResponsable);

    filterByResponsableAllToDos(projectName, filterResponsable);
    
    conclusionScreen("Filtrado por responsavel");
}

void filterTodo(char projectName[20]){

    int choice;

    do{
        system("cls || clear");
        printf("\n\t===== %s ===== \n\n", projectName);
        printf("\t1. Filtrar por nome\n");
        printf("\t2. Filtrar por situacao\n");
        printf("\t3. Filtrar por data\n");
        printf("\t4. Filtrar por responsavel\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        fflush(stdin);
        __fpurge(stdin);
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

void editName(char projectName[20]){
	char newName[20];
	printf("\tEDITAR NOME DO PROJETO\n");
	
	printf("\tNOME ATUAL: %s", projectName);
	
    printf("\n\tDIGITE O NOVO NOME: ");
    gets(newName);
	
	//setNome(newName);
	
	conclusionScreen("Nome do projeto atualizado");

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
        printf("\t4. Filtrar ToDo\n");
        printf("\t5. Gerar Relatorio\n");
        printf("\t6. Editar Nome do Projeto\n");
        printf("\t0. Sair\n\n");
        printf("\tEscolha: ");

        scanf("%d", &choice);
        fflush(stdin);
        __fpurge(stdin);
		system("cls || clear");
        switch(choice){
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


