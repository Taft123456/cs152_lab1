%{
  int currentLine = 1, currentPosition = 1;  
%}

DIGIT  [0-9]

%%

{DIGIT}+   {printf("NUMBER %s\n", yytext); 
            currentPosition += yyleng;}

"+"        {printf("PLUS\n"); 
            currentPosition += yyleng;}

"-"        {printf("MINUS\n"); 
            currentPosition += yyleng;}

"*"        {printf("MULT\n"); 
            currentPosition += yyleng;}

"/"        {printf("DIV\n"); 
            currentPosition += yyleng;}

"("        {printf("L_PAREN\n"); 
            currentPosition += yyleng;}

")"        {printf("R_PAREN\n"); 
            currentPosition += yyleng;}

"="        {printf("EQUAL\n"); 
            currentPosition += yyleng;}

[ \t]+     {currentPosition += yyleng;}

"\n"       {currentLine += 1; 
            currentPosition += yyleng;}

.          {printf("Unrecognized Character \"%s\"\nthere is an error at line %d and column %d\n", yytext, currentLine, currentPosition);
            exit(0);}

%%

int main(int argc, char** argv)
{
  yylex();
}
