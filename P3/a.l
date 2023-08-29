%{
      #include <stdio.h>
      #include <stdlib.h>
      int s=0,m=0,mlines=0;
%}
%%
"//"[^'\n']* {s++;}
"/*"[^*]*"*/" {
      m++;
      for(int i=0;i<yyleng;i++){
            if(yytext[i]=='\n') mlines++;
      }
}
%%
int main(){
      yyin=fopen("a.txt","r");
      yyout=fopen("acopy.txt","w");
      yylex();
      printf("S:%d m:%d mlines:%d\n", s,m,mlines);
      return 0;
}
int yywrap(){
      return 1;
}