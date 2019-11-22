%{
    #include<stdio.h> 
    #include "y.tab.h"
%}

%%

[\n] {return NL;}
[a] {return A;}
[b] {return B;}
[c] {return C;}
[^'\n'abc]  {printf("\n out of alphabet");}

%%

int yywrap() 
{
    return 1; 
}