%{
    #include "y.tab.h"
%}

%%

[\n] {return NL;}
['('] {return LP;}
[')'] {return RP;}

%%

int yywrap() {return 1;}