%{
      #include <stdio.h>
      #include <stdlib.h>
      int cnt=0;
%}
%token TYPE IDEN NUM
%%
S : D';'S
|
;
D : D','I
| TYPE I
;
I : IDEN {c++;}
| IDEN '=' NUM {c++;}
| IDEN C {c++;}
| IDEN C '=' '{'NUM'}' {c++;}
;
C : '['NUM']'C
| '['NUM']'
;
%%
int main(){
      yyparse();
      printf("no of variables:%d",cnt);
      return 0;
}
int yyerror(){
      printf("invalid");
      exit(0);
}