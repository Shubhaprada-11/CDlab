%{
      #include "y.tab.h"
%}
%%
[_a-zA-Z][a-zA-Z0-9]* {yylval.exp=strdup(yytext);return IDEN;}
[0-9]+ {yylval.exp=strdup(yytext);return NUM;}
[()=] return yytext[0];
[-+*/] return yytext[0];
[\n] return '\n';
. ;
%%