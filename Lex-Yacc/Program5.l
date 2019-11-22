%{
    #include<stdio.h> 
    #include "y.tab.h"
%}

%%
[\n] {  return NL;}
[0] {   return ZERO;}
[1] {  return ONE;}
%%

int yywrap() 
{
    return 1; 
}