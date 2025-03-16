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
%%

{Integer}   { return new Symbol(sym.INTEGER, Integer.parseInt(yytext())); }
{Name}      { return new Symbol(sym.NAME, yytext()); }
"="         { return new Symbol(sym.EQUALS); }
";"         { return new Symbol(sym.TERM); }

[ \t\r\n]  { /* Ignore whitespace */ }

/* Error fallback */
. {
  // Ignore any other character
  throw new RuntimeException("Illegal syntax: " + yytext());
}
