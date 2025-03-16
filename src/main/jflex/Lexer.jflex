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
Boolean=true|false
%%

"if"        { return new Symbol(sym.IF); }
"else"      { return new Symbol(sym.ELSE); }
{Boolean}   { return new Symbol(sym.BOOLEAN, Boolean.parseBoolean(yytext())); }
{Integer}   { return new Symbol(sym.INTEGER, Integer.parseInt(yytext())); }
{Input}     { return new Symbol(sym.INPUT); }
{Name}      { return new Symbol(sym.NAME, yytext()); }
"="         { return new Symbol(sym.EQUALS); }
";"         { return new Symbol(sym.TERM); }
"("         { return new Symbol(sym.LEFT_PAR); }
")"         { return new Symbol(sym.RIGHT_PAR); }
"*"         { return new Symbol(sym.MULTIPLY); }
"/"         { return new Symbol(sym.DIVIDE); }
"+"         { return new Symbol(sym.PLUS); }
"-"         { return new Symbol(sym.MINUS); }
"<"         { return new Symbol(sym.LESS_THAN); }
"<="         { return new Symbol(sym.LESS_THAN_EQ); }
">"         { return new Symbol(sym.GREATER_THAN); }
">="         { return new Symbol(sym.GREATER_THAN_EQ); }
"!="         { return new Symbol(sym.NOTEQUAL); }
"=="         { return new Symbol(sym.ISEQUAL); }
"{"         { return new Symbol(sym.LEFT_KEY); }
"}"         { return new Symbol(sym.RIGHT_KEY); }


[ \t\r\n]  { /* Ignore whitespace */ }

/* Error fallback */
. {
  // Ignore any other character
  throw new RuntimeException("Illegal syntax: " + yytext());
}
