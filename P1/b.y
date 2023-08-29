%{
      #include <stdio.h>
      #include <stdlib.h>
      int yylex();
%}
%%
S:A B
;
A:'a'A'b'
|
;
B:'b'B'c'
|
;
%%
int main(){
      printf("enter string: ");
      yyparse();
      printf("valid string\n");
}
int yyerror(){
      printf("invalid string\n");
      exit(0);
}