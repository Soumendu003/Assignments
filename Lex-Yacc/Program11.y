%{
    #include <stdio.h>
    extern FILE* yyin;
%}
%token LP RP NL ID COM SC DT FOR WHILE IF ELSE OP 
%%
S : {} | Sfl S {} | Swl S {} | Sifel S {} | Sfc S {} | Shdr S {};

rval : ID OP rval {} | ID {};
expr : {} | ID OP rval {};
idlst : ID {} | ID COM idlst {};
Arg_lst_dt : DT ID COM Arg_lst_dt {} | DT ID {};

Sfl : FOR LP expr SC expr SC expr RP SC NL {printf("\n For loop identified");};

Swl : WHILE LP expr RP SC NL {printf("\n While loop identified");};

Sifel : IF LP expr RP NL ELSE NL {printf("\n If Else identified");};

Sfc : ID LP idlst RP SC NL {printf("\n Function call identified");}
    | ID LP RP SC NL {printf("\n Function call identified");};

Shdr : DT ID LP Arg_lst_dt RP NL {printf("\n Function Header found");}
    | DT ID LP RP NL {printf("\n Void Function Header found");};

%%
void yyerror(char const *s){printf("\nGot yyerror %s",s);}
int main(){
    yyin = fopen("Input11.txt", "r");
	yyparse();
	return 1;
}

