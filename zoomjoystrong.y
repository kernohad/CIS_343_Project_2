%{
	
	#include "zoomjoystrong.h"

%}

%union {
  int iVal;
  float fVal;
  char* sval;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <iVal> INT
%token <fVal> FLOAT

%%

program:			statement_list END END_STATEMENT;

statement_list: 	statement
				| 	statement statement_list
				;
					
statement:			POINT INT INT END_STATEMENT						{point($2, $3)}
				|	LINE INT INT INT INT END_STATEMENT 				{line($2, $3, $4, $5)}
				|	CIRCLE INT INT INT END_STATEMENT 				{circle($2, $3, $4)}
				|	RECTANGLE INT INT INT INT END_STATEMENT			{rectangle($2, $3, $4, $5)}
				|	SET_COLOR INT INT INT END_STATEMENT 			{set_color($2, $3, $4)}
				;

%%

int main (int argc, char** argv ){
	
	// Call setup
	yyparse();
	return 0;
}