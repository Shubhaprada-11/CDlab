%{
      #include <stdio.h>
      #include <stdlib.h>
%}
%token NUM
%left '+' '-'
%left '*' '/'
%%
S: I {printf("result:%d\n",$$);}
;
I: I '+' I {$$=$1+$3;}
| I '-' I {$$=$1-$3;}
| I '*' I {$$=$1*$3;}
| I '/' I {if($3==0) return yyerror();$$=$1+$3;}
| '('I')' {$$=$2;}
| NUM {$$=$1;}
| '-'NUM {$$=$2;}
;
%%
int main(){
      yyparse();
      return 0;
}
int yyerror(){
      printf("error");
      exit(0);
}