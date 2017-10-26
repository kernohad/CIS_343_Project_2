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
%token INT
%token FLOAT

%%
	
	statement_list: statement_list
					| statement
					
	statement: POINT INT INT
			   | LINE INT INT INT INT
			   | 

%%