%{
	#include <stdio.h>
	int yylex();
	int yyerror(char *s);
%} 

%token CADENA ENTERO OTHER PUNTOCOMA CHMOD

%type <cad> CADENA
%type <number>	ENTERO
%type <reservada> CHMOD


%union{
	char cad[20];
	int number;
	char *reservada;
}

%%

prog: 
	INSTRUCCIONES 
;

INSTRUCCIONES:  
			|	INSTRUCCION PUNTOCOMA INSTRUCCIONES 

;

INSTRUCCION: 
			|	CADENA  {printf("(cadena): \"%s\"\n",$1 );}
			|	ENTERO	{printf("(num): \"%d\"\n",$1 );}
			|	OTHER
			|	CHMOD	{printf("(chmod): \"%s\"\n",$1 );}
;

%%

int yyerror(char *s){
	printf(" ->Error Sintactico %s\n",s);
	return 1;
}

int main(int argc,char **argv){
	yyparse();
	return 0;
}