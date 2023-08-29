%{
      #include <stdio.h>
      int negf=0,posf=0,negint=0,posint=0;
%}
%%
[1-9][0-9]*[/][1-9][0-9]* {posf++;}
[-][1-9][0-9]*[/][1-9][0-9]* {negf++;}
[1-9][0-9]*[/][-][1-9][0-9]* {negf++;}
[-][1-9][0-9]*[/][-][1-9][0-9]* {posf++;}
[1-9][0-9]* {posint++;}
[-][1-9][0-9]* {negint++;}
\n {return 0;}
%%
int yywrap(){
      return 1;
}
int main(){
      yylex();
      printf("pi:%d ni:%d pf:%d nf:%d\n",posint,negint,posf,negf);
      return 0;
}