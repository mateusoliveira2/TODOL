/*
	Main da aplicacao.
	Controlla o loop principal e a entrada e saida de dados 
	no menu principal para o usuario.
*/

#include <cstdio>
#include <cstdlib>
#include "projectController.cpp"

void selecionarProjeto(){
	char nomeProjeto[20];
	
	printf("\n\tDIGITE O NOME DO PROJETO: ");
	gets(nomeProjeto);
	
	system("cls || clear");
	
	//verifica��o que existe para poder ir pra o nomeProjeto

	projectMain(nomeProjeto);
}

void criarProjeto(){
	char nomeProjeto[20], descricao[100];
	int previsaoConclusao;
	
	printf("\n\tDIGITE O NOME DO PROJETO: ");
	gets(nomeProjeto);
	
		
	printf("\n\tDIGITE A DESCRICAO DO PROJETO: ");
	gets(descricao);
	
	printf("\n\tDIGITE A PREVISAO DE TERMINO: ");
	scanf("%d", &previsaoConclusao);
	
	
	//fun��o de criar projeto com structs e arquivos.

	telaConclusao("Projeto criado");
}

void concluirProjeto(){
	char nomeProjeto[20];
	printf("\n\tDIGITE O NOME DO PROJETO: ");
	gets(nomeProjeto);

	//aqui ja viria o retorno da fun��o que exclui o arquivo.
	telaConclusao("Conclusao feita");
}

int main () {
	int escolha;

    do {
        printf("\n\tTODOL\n\n");
        printf("\t1. Criar Projeto\n");
        printf("\t2. Selecionar Projeto\n");
        printf("\t3. Concluir projeto\n");
        printf("\t0. Sair\n\n");
        printf("\tESCOLHA: ");

        scanf("%d", &escolha);
        fflush(stdin);
		system("cls || clear");
        switch(escolha){
            case 1:
                criarProjeto();
                break;

            case 2:
                selecionarProjeto();
                break;

            case 3:
                concluirProjeto();
                break;

            case 0:
                break;

            default:
                printf("Digite uma opcao valida\n");
        }
        
    } while(escolha);
	
	return 0;
}
