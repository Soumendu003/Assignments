%{
    #include<stdio.h>
    #include<string.h>
    void check_val();
    int max = -1;
    int tem;
%}

char [a-zA-Z]

%%

{char}+ {tem = strlen(yytext); if(tem > max){ max = tem;}}

%%
int yywrap(){
    return 1;
}

int main(){
    yyin = fopen("Input3.txt","r");

    yylex();

    printf("\n Size of longest word = %d",max);
}