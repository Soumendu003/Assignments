%{
    #include<stdio.h>
    extern FILE* yyin;
%}
%token LP RP COM SC NL ID DT
%%
S : {} | S S1 {} | S S2 {};
S1 : DT LST NL {printf("\n Variables declaration found");};
S2 : DT ID LP ARG_LST RP SC NL {printf("\n Function declaration found");} 
   | DT ID LP RP SC NL {printf("\n Void Function declaration found");};
LST : ID COM LST {} | ID SC {};
ARG_LST : DT ID COM ARG_LST {} | DT COM ARG_LST {} | DT ID {} | DT {};
%%
void yyerror(char const *s){printf("\nGot yyerror %s",s);}
int main(){
    yyin = fopen("Input8.txt", "r");
	yyparse();
	return 1;
}