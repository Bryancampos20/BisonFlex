%{
	#include <stdio.h>
	#include <string.h>
	#include "sintacticoBison.tab.h"
	void showError(char* other);
%}

numbers	([0-9])+
alpha	([a-zA-Z])+

%%

"chmod"		{yylval.reservada = yytext; 	return (CHMOD);}
{numbers}   {yylval.number = atoi(yytext); return (ENTERO);}
";"			{return (PUNTOCOMA);}
{alpha}		{sscanf(yytext, "%s",yylval.cad); return (CADENA);}
[ \t\r]		{}

. 			{showError(yytext);   return(OTHER);}
%%

void showError(char* other){
	printf(" 	<<ErrorLexico: \"%s\" >>",other);
}