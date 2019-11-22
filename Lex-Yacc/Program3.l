%{
    #include<stdio.h>
    #include<string.h>
    int line_count = 0, char_count = 0, word_count = 0;
    extern FILE* yyin;
%}

char [a-zA-Z]

%%

[\n] {line_count += 1;}
{char}+ {word_count+= 1; char_count += strlen(yytext);}

%%

int yywrap(){
    return 1;
}

int main(){
    yyin = fopen("Input3.txt","r");

    yylex();

    printf("\n Number of Char = %d",char_count);
    printf("\n Number of Word = %d",word_count);
    printf("\n Number of Line = %d",line_count);
}