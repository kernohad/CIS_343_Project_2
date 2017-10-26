%{
  
  #include "zoomjoystrong.h"

%}

%%
  
  END               {return END; }
  END_STATEMENT     {return END_STATEMENT; }
  POINT             {return POINT; }
  LINE              {return LINE; }
  CIRCLE            {return CIRCLE; }
  RECTANGLE         {return RECTANGLE; }
  SET_COLOR         { return SET_COLOR; }
  INT               { yylval.iVal = atoi(yytext);
                      return INT;
                    }
  FLOAT             { return FLOAT; }

  // A way to match tabs, spaces, or newlines, and to ignore them
  // A way to match anything not listed above, and to tell the user they messed up. 
  

%%