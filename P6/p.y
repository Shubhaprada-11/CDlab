%{
      #include <stdio.h>
      #include <stdlib.h>
      void quadruples();
      void threeaddresscode();
      typedef char* string;
      struct{
            string op1,op2,res;
            char op;
      }code[100];
      int idx=-1;
      string addtotable(string ,string ,char);
%}
%union {
    char * exp;
}
%token<exp> IDEN NUM 
%type<exp> EXP REXP 
%left '+' '-'
%left '*' '/'
%right '='
%%
STMTS: STMT STMTS
| STMT
;
STMT: REXP '\n'
;
REXP: IDEN '=' EXP {$$=addtotable($1,$3,'=');}
| EXP
;
EXP: IDEN {$$=$1;}
| NUM {$$=$1;}
| '('EXP')' {$$=$2;}
| EXP '+' EXP {$$=addtotable($1,$3,'+');}
| EXP '-' EXP {$$=addtotable($1,$3,'-');}
| EXP '*' EXP {$$=addtotable($1,$3,'*');}
| EXP '/' EXP {$$=addtotable($1,$3,'/');}
;
%%
int main(){
      yyparse();
      threeaddresscode();
      quadruples();
      return 0;
}
string addtotable(string op1,string op2, char op){
      if(op=='='){
            idx++;
            code[idx].op1=op2;
            code[idx].res=op1;
            code[idx].op=op;
            code[idx].op2=" ";
            return op1;
      }
      else{
            string res=malloc(3);
            sprintf(res,"@%c",idx+'A');
           idx++;
            code[idx].op1=op1;
            code[idx].res=res;
            code[idx].op=op;
            code[idx].op2=op2;
            return res; 
      }
}
void threeaddresscode(){
      printf("res op1 op op2\n");
      for(int i=0;i<=idx;i++){
            printf("%s %s %c %s\n",code[i].res,code[i].op1,code[i].op,code[i].op2);
      }
}
void quadruples(){
      printf("i:res op1 op op2\n");
      for(int i=0;i<=idx;i++){
            printf("%d: %s %s %c %s\n",i,code[i].res,code[i].op1,code[i].op,code[i].op2);
      }
}
int yyerror(){
      printf("error");
      exit(0);
}