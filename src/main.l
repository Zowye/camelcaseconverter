%{
#include <stdio.h>
#include <string.h>
#include "ccc_lib.h"

char vetor[50];
char buffer[300];
int k = 0;
int TAM;
int FLAG_ERRO = 0; // Acusa erro

void zeraVetor(){
	int i;
	for(i=0;i<50;i++) vetor[i] = '\0';
}

void inserePalavraBuffer(char *vetor){
	int i = 0;
	
	while(vetor[i] != '\0'){
		buffer[k++] = vetor[i];
		i++;
	}
}


%}


%%



((([A-Z][a-z]+)+)(([A-Z][a-z]+)+))+ {
	camelcase_to_underline(yytext, vetor);
	inserePalavraBuffer(vetor);
	zeraVetor();
	}

([a-z]+[_][a-z]+)+ {
	underline_to_camelcase(yytext, vetor);
	inserePalavraBuffer(vetor);
	zeraVetor();
	}


[a-z]+([A-Z][a-z]+)+ {
	FLAG_ERRO = 1;
	}

[a-z]+[_][a-z]*[A-Z]([A-Z]|[a-z])* {
	FLAG_ERRO = 1;
	}

[A-Z][A-Za-z]+[_] {
	FLAG_ERRO = 1;
	}


. {
	inserePalavraBuffer(yytext);	
}


[\n] {
	int i =0;
	int TAM = strlen(buffer);
	
	if(!FLAG_ERRO){	

	for(i=0;i<TAM;i++)
	printf("%c", buffer[i]);
	printf("\n");
	}else {
		printf("ERRO\n");	
	}
}

%%



int main() {
  yylex();


 return (0);
}
