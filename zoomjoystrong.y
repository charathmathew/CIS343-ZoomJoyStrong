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
      if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT){
        line($2,$3,$4,$5);
      }
      else{
        printf("Invalid line parameters\n");
      }
      };

point: POINT INT INT END_STATEMENT{
       if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT) {
        point($2,$3);
       }
       else{
       printf("Invalid point parameters\n");
       }
       };

circle: CIRCLE INT INT INT END_STATEMENT{
        if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT){
          circle($2,$3,$4);
        }else{
          printf("Invalid circle parameters\n");
        }
        };

rectangle: RECTANGLE INT INT INT INT END_STATEMENT{
           if($2 >= 0 && $2 <= WIDTH && $3 >= 0 && $3 <= HEIGHT){
              rectangle($2,$3,$4,$5);
           }else{
              printf("Invalid rectangle parameters\n");
           }
           };

set_color: SET_COLOR INT INT INT END_STATEMENT{
           if($2 >= 0 && $2 <= 255 && $3 >= 0 && $3 <= 255 && $4 >= 0 && $4 <= 255){
              set_color($2,$3,$4);
           }else{
              printf("Invalid color parameters\n");
           }
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
