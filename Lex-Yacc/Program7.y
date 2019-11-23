%{
    #include<stdio.h>
    extern FILE* yyin;
%}
%token RP LP NL

%%

S : {} | S S1 {};
S1 : BP NL {printf("\n Balanced Paranthesis found");}
BP : LP BP RP {}| LP RP {};

%%

void yyerror(char const *s)
{
    printf("\nGot yyerror %s",s);
}

int main()
{
    yyin = fopen("Input7.txt", "r");
	yyparse();
	return 1;
}