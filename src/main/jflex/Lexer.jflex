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
%%

{Integer}      { return new Symbol(sym.INTEGER); }

[ \t\r\n]  { /* Ignore whitespace */ }

/* Error fallback */
. {
  // Ignore any other character
  throw new RuntimeException("Illegal syntax: " + yytext());
}
