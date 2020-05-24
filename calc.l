/* recognize tokens for the calculator and print them out */
%{
# include "calc.tab.h"
%}
%%
"+"         { return ADD; }
"-"         { return SUB; }
"*"         { return MUL; }
"/"         { return DIV; }
"|"         { return ABS; }
[0-9]+      { yylval = atoi(yytext); return NUMBER;  }
0x[a-f0-9]+ { char *ptr; yylval = strtol(yytext, &ptr, 16); return NUMBER;  }
\n          { return EOL; }
"("         { return OP; }
")"         { return CP; }
"//".*      /* comment, do nothing */
[ \t]       /* ignore whitespace */
.           { printf("Mystery character %c\n", *yytext); }
%%
