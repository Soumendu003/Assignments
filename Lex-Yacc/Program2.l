%{
    #include<stdio.h>
    void check_val();
    int val;
%} 
number [0-9]
%%

{number}* { val = atoi(yytext); check_val();}
(.)*    { printf("Obtined = %s",yytext);}

%%

int yywrap(){
    return 1;
}

void check_val(){
    printf("\n Val = %d",val);
    if(val%2 == 0){
        printf("Even number\n");
    }
    else{
        printf("Odd number\n");
    }
}

int main(){
    printf("enter a value : ");
    yylex();
}