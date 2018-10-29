%{
  #include <stdio.h>
  int lineNum = 1;
%}

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

int main(int argc, char** argv){
  yylex();
  return 0;
}
