%{
    #include "y.tab.h"
%}
%%
int|float|char|long|double|signed|unsigned {return DT;}
['('] {return LP;}
[')'] {return RP;}
[','] {return COM;}
[';'] {return SC;}
[\n] {return NL;}
[a-zA-Z_][0-9a-zA-Z_]* {return ID;}
%%
int yywrap() {return 1;}

