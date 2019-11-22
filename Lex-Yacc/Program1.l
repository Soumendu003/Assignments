%{
    #include<stdio.h>
    extern FILE *yyin;
    int rel_count = 0, keyword_count = 0, id_count = 0, arithmatic_count = 0;
%}

%%

">"|"<"|">="|"<="|"==" {rel_count += 1;}
"for"|"if"|"else"|"while"|"do"|"return" {keyword_count += 1;}
[a-zA-z][a-zA-z0-9]* {id_count += 1;}
"+"|"+="|"-"|"-="|"++"|"--"|"*"|"*="|"/"|"/="|"%" {arithmatic_count += 1;}

%%
int yywrap(){
    return 1;
}

int main(){
    yyin = fopen("Input1.txt", "r");

    yylex();

    printf("\nRelational Operator count = %d",rel_count);
    printf("\nKeyword count = %d",keyword_count);
    printf("\nIidentifier count = %d",id_count);
    printf("\nArithmatic Operator count = %d",arithmatic_count);
}