%{
  #include <stdio.h>
  #include "zoomjoystrong.tab.h"
  int lineNum = 1;
%}

%option noyywrap

%%

END               {printf("END\n");}
;                 {printf("END OF STATEMENT\n");}
POINT             {printf("POINT\n");}
LINE              {printf("LINE\n");}
CIRCLE            {printf("CIRCLE\n");}
RECTANGLE         {printf("RECTANGLE\n");}
SET_COLOR         {printf("SET COLOR\n");}
[0-9]+            {printf("INT\n");}
[0-9]+?\.[0-9]+   {printf("FLOAT\n");}
[\t | " "]   ;
\n                {lineNum++;}
.                 {printf("UNRECOGNIZED TOKEN - %s on line %d\n", yytext, lineNum);}
%%

