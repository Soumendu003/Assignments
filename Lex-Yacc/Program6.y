%{
    #include<stdio.h>
    extern FILE* yyin;
%}

%token A B C NL

%%

S : {}| S S1 {};

S1 : ST NL {printf("\n Valid");};

ST : LM RM {};

LM : {} | A LM B {};
RM : {} | B RM C {};

%%

void yyerror(char const *s)
{
    printf("Got yyerror %s",s);
}

int main()
{
    yyin = fopen("Input6.txt", "r");
	yyparse();
	return 1;
}