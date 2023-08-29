%{
   #include<stdio.h>
   #include<stdlib.h>
%}
%token TYPE RET IDEN NUM
%left '+' '-'
%left '*''/'
%%
S: FUN {printf("accepted\n");}
;
FUN: TYPE IDEN'('PARAMS')''{'BODY'}'
| TYPE IDEN'('')''{'BODY'}'
;
PARAMS: PARAMS',' PARAM
| PARAM;
PARAM: TYPE IDEN;
BODY: STMT BODY
| RET E';'
|
;
STMT: PARAM ';'
| E ';'
| A ';'
;
A: IDEN '=' E; 
E: E '+' E
| E '-' E
| E '*' E
| E '/' E
| '('E')'
| IDEN
| NUM
%%
int yyerror(){
      printf("error\n");
      exit(0);
}
int main(){
      yyparse();
      return 0;
}