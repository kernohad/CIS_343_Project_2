%{
	
	#include "zoomjoystrong.h"
	#include <stdio.h>

	/**************************
	* Returns an error message 
	***************************/
	void yyerror(char *s) {
    	fprintf(stderr, "ERROR: %s\n", s);
	}

	int yylex();

%}


%start program

%union {
  int iVal;
  float fVal;
  char* sval;
}

%token END
%token END_STATEMENT
%token <sVal> POINT
%token <sVal> LINE
%token <sVal> CIRCLE
%token <sVal> RECTANGLE
%token <sVal> SET_COLOR
%token <iVal> INT
%token <fVal> FLOAT


%%

program:			statement_list END END_STATEMENT			{
																	finish(); 
																	exit(0);
																};

statement_list: 	statement
				| 	statement statement_list
				;
					
statement:			POINT INT INT END_STATEMENT					{
																	if( $2 > WIDTH || $3 > HEIGHT ) { yyerror("Point not valid."); }
																	else {point($2, $3);}
																}

				|	LINE INT INT INT INT END_STATEMENT 			{
																	if( $2 > WIDTH || $3 > HEIGHT || $4 > WIDTH || $5 > HEIGHT) { yyerror("Line not valid.");}
																	else {line($2, $3, $4, $5);}
																}
				|	CIRCLE INT INT INT END_STATEMENT 			{
																	if( $2 > WIDTH || $3 > HEIGHT ) { yyerror("Circle not valid."); }
																	else {circle($2, $3, $4);}
																}
				|	RECTANGLE INT INT INT INT END_STATEMENT			{
																	if( $2 > WIDTH || $3 > HEIGHT || $4 > (WIDTH - $2) || $5 > (HEIGHT - $3)) { yyerror("Rectangle not valid."); }
																	else {rectangle($2, $3, $4, $5);}
																}
				|	SET_COLOR INT INT INT END_STATEMENT 		{
																	if( $2 > 255 || $3 > 255 || $4 > 255) { yyerror("Color not valid."); }
																	else {set_color($2, $3, $4);}
																}
				;

%%

/********************************************************************************
* Main Driver that sets up the graphical part and calls yyparse for every token
*********************************************************************************/
int main (int argc, char** argv ){
	setup();
	yyparse();
	return 0;
}