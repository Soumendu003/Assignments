%{
    #include "y.tab.h"
%}
%%
['('] {return LP;}
[')'] {return RP;}
[\n] {return NL;}
[','] {return COM;}
[';'] {return SC;}
"+"|"-"|"*"|"/"|">"|"<"|">="|"<="|"=="|"+="|"-="|"=" {return OP;}
int|float|char|long|double|signed|unsigned {return DT;}
for {return FOR;}
while {return WHILE;}
if {return IF;}
else {return ELSE;}
[a-zA-Z_][0-9a-zA-Z_]* {return ID;}

%%
int yywrap() {return 1;}
