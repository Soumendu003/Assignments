%{
    #include<stdio.h>
    int count = 0;
    extern FILE* yyin;
%}
%token ZERO ONE NL

%%

S : {}| S S1 {};

S1 : ST NL {printf("\n No of digit = %d",count); count = 0;}

ST : ZERO ST {count++;} | ONE ST {count++;} | ZERO {count++;} | ONE {count++;};

%%

void yyerror(char const *s)
{
    printf("Got yyerror %s",s);
}

int main()
{
    yyin = fopen("Input5.txt", "r");
	yyparse();
	return 1;
}
