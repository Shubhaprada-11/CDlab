%{
      #include <stdio.h>
      int lines=0,ws=0,words=0,ch=0;
%}
%%
[a-zA-Z]+ {
      words++;
      ch+=yyleng;
      }
[' '] {ws++;}
['\n'] {lines++;ws++;}
['\t'] {ws+=4;}
# return 0;
%%
int yywrap(){
      return 1;
}
int main(){
      printf("enter string: ");
      yylex();
      printf("lines:%d words:%d chars:%d ws:%d\n",lines,words,ch,ws);
      return 0;
}