package org.morsaprogramando.piton_language;

import java_cup.runtime.*;

%%
%cup
%class LexerGenerated
%unicode
%line
%column

%%

"hello"    { return new Symbol(sym.HELLO); }
"bye"    { return new Symbol(sym.BYE); }
[ \t\r\n]  { /* Ignore whitespace */ }

/* Error fallback */
. {
  // Ignore any other character
  throw new RuntimeException("Illegal syntax: " + yytext());
}
