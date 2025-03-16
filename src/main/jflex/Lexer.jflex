package org.morsaprogramando.piton_language;

import java_cup.runtime.*;

%%
%cup
%class LexerGenerated
%unicode
%line
%column

Digit = [0-9]
Integer = 0|[1-9]{Digit}*
Name=[a-zA-Z][a-zA-Z0-9]*
Input=read\(\)
%%

{Integer}   { return new Symbol(sym.INTEGER, Integer.parseInt(yytext())); }
{Name}      { return new Symbol(sym.NAME, yytext()); }
{Input}         { return new Symbol(sym.INPUT); }
"="         { return new Symbol(sym.EQUALS); }
";"         { return new Symbol(sym.TERM); }
"("         { return new Symbol(sym.LEFT_PAR); }
")"         { return new Symbol(sym.RIGHT_PAR); }
"*"         { return new Symbol(sym.MULTIPLY); }
"/"         { return new Symbol(sym.DIVIDE); }
"+"         { return new Symbol(sym.PLUS); }
"-"         { return new Symbol(sym.MINUS); }


[ \t\r\n]  { /* Ignore whitespace */ }

/* Error fallback */
. {
  // Ignore any other character
  throw new RuntimeException("Illegal syntax: " + yytext());
}
