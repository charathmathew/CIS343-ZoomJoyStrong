# CIS343-ZoomJoyStrong

ZoomJoyStrong is the name of a language created in CIS 343.
The language requires a lexer which we will make using flex. 
zoomjoystrong.lex recognizes the defined tokens using regular expressions.


compilation:
bison -d zoomjoystrong.y
flex zoomjoystrong.lex
gcc -o zjs zoomjoystrong.c lex.yy.c zoomjoystrong.tab.c -lSDL2 -lm

run:
./zjs<sample.zjs
