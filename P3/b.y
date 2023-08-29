%{
      #include <stdio.h>
      #include <stdlib.h>    
      int count=0;  
%}
%token FOR NUM IDEN
%%
S: I
;
I: FOR A B {count++;}
;
A: '('E';'E';'E')'
|
B:'{'B1'}'
|B1;
B1: E';'B1
| I
|
;
E: IDEN Z IDEN
| IDEN U
| IDEN Z NUM
| IDEN
;
Z: '='|'>'|'<'|'<''='|'>''='|'=''+'|'=''-'
;
U: '+''+'|'-''-';
;
%%
int main()
{
	printf("Enter the snippet:\n");
	yyparse();
	printf("Count of for : %d\n",count);
	return 0;
}
int yyerror()
{
	printf("Invalid\n");
	exit(0);
}