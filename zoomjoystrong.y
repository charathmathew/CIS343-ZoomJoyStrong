%{
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include "zoomjoystrong.h"
  int yylex();
  void yyerror(const char* err);
%}

%union{
  int intVal;
  double floatVal;
}

%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token POINT
%token <floatVal> FLOAT
%token <intVal> INT
%token END
%token END_STATEMENT

%%

program:  statement_list END
       ;

statement_list: statement
       |        statement_list statement
       ;

statement:  line
        |    point
        |    circle
        |    rectangle
        |    set_color
        |    end
       ;

line: LINE INT INT INT INT END_STATEMENT{
      line($2,$3,$4,$5);
      };

point: POINT INT INT END_STATEMENT{
       point($2,$3);
      };

circle: CIRCLE INT INT INT END_STATEMENT{
        circle($2,$3,$4);
        };

rectangle: RECTANGLE INT INT INT INT END_STATEMENT{
           rectangle($2,$3,$4,$5);
           };

set_color: SET_COLOR INT INT INT END_STATEMENT{
           set_color($2,$3,$4);
           };

end: END END_STATEMENT{
     finish();
     exit(1);
     };
%%

int main(int argc, char** argv){
  setup();
  yyparse();
  return 0;
}

void yyerror(const char* err){
  printf("%s\n", err);
  yyparse();
}
