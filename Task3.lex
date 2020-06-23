%{
  int currentLine = 1;
  int currentPosition = 1;
  int encounterIntNum = 0;
  int encounterOpNum = 0;
  int encounterParNum = 0;
  int encounterEqNum = 0;  
%}

DIGIT  [0-9]

%%

{DIGIT}+   {printf("NUMBER %s\n", yytext); 
            currentPosition += yyleng;
            encounterIntNum += 1;}

"+"        {printf("PLUS\n"); 
            currentPosition += yyleng;
            encounterOpNum += 1;}

"-"        {printf("MINUS\n"); 
            currentPosition += yyleng;
            encounterOpNum += 1;}

"*"        {printf("MULT\n"); 
            currentPosition += yyleng;
            encounterOpNum += 1;}

"/"        {printf("DIV\n"); 
            currentPosition += yyleng;
            encounterOpNum += 1;}

"("        {printf("L_PAREN\n"); 
            currentPosition += yyleng;
            encounterParNum += 1;}

")"        {printf("R_PAREN\n"); 
            currentPosition += yyleng;
            encounterParNum += 1;}

"="        {printf("EQUAL\n"); 
            currentPosition += yyleng;
            encounterEqNum += 1;}

[ \t]+     {currentPosition += yyleng;}

"\n"       {currentLine += 1; 
            currentPosition += yyleng;}

.          {printf("Unrecognized Character \"%s\"\nthere is an error at line %d and column %d\n", yytext, currentLine, currentPosition);
            exit(0);}

%%

int main(int argc, char** argv)
{
  if(argc >= 2)
  {
    yyin = fopen(argv[1], "r");
    if(yyin == 0)
    {
       printf("File Open Error\n");
       exit(1);
    }
    else if(yyin == NULL)
    {
      yyin = stdin;
    }   
  } 
  else
  {
    yyin = stdin;
  }
  yylex();
  printf("Encountered %d Integers, %d Operators, %d Parentheses, %d Equal Signs\n", encounterIntNum, encounterOpNum, encounterParNum, encounterEqNum);
}
