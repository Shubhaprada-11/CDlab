%{
      #include <stdio.h>
      #include <stdlib.h>
      int k=0,i=0,o=0;
%}
%%
"int"|"float"|"char"|"for"|"if" {printf("keyword");k++;}
[a-zA-Z_][_a-zA-Z0-9]* {printf("Identifier\n");i++;}
[-+*/=] {printf("op");o++;}
\n {return 0;}
%%
int main(){
      yylex();
      printf("keyword:%d Identifier:%d op:%d\n", k,i,o);
      return 0;
}
int yywrap(){
      return 1;
}