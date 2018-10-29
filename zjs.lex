%{
  #include <stdio.h>
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
[\t | " " | \n]   ;
.                 {printf("UNRECOGNIZED TOKEN\n");}
%%

int main(int argc, char** argv){
  yylex();
  return 0;
}
