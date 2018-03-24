#include <stdio.h>
#include "ccc_lib.h"

void camelcase_to_underline(char *input, char *output) {
	int i = 0;
	int j = 0;
	while(input[i] != '\0'){	// Nao percorre vetor inteiro, apenas ate final palavra
		if(input[i] >= 65 && input[i] <= 90){		// Entre 65 e 90 eh [A-Z]
			if(i == 0){
				output[j] = input[i] + 32;		
			}else{
				output[j] = '_';
				j++;								
				output[j] = input[i] + 32;
			}

		}else {
			output[j] = input[i];
		}
		j++;	
		i++;
			
	}
  return;
}


void underline_to_camelcase(char *input, char *output) {
	int i = 0;
	int j = 0;

	output[0] = input[0] - 32;
	j++;
	i++;
	while(input[i] != '\0'){	// Nao percorre vetor inteiro, apenas ate final palavra
		if(input[i] == '_'){
			output[j] = input[++i] - 32;			
		}else{
			output[j] = input[i];				
		}
		j++;
		i++;
	}				

  return;
}


// CamelCaseTeste -> camel_case_teste

// input - CxCx
// output- Cx_Cx
