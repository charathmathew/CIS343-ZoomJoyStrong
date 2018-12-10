%{
  #include <stdio.h>
  #include "zoomjoystrong.tab.h"
  int lineNum = 1;
%}

%option noyywrap

%%

end			              { return END;}
;			                { return END_STATEMENT;}
point			            { return POINT;}
line 			            { return LINE;}
circle		            { return CIRCLE;}
rectangle	            { return RECTANGLE;}
set_color	            { return SET_COLOR;}
[0-9]+                { yylval.intVal=atoi(yytext); return INT;}
[0-9]+?\.[0-9]+       { yylval.floatVal=atof(yytext); return FLOAT;}
[ \t]                 ;
\n                    { lineNum++;}
.                     ;
%%
