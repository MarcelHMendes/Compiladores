
package lexsyn;

import java_cup.runtime.Symbol;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.System.*;

%%
%cup
%{ 
    String EXIT_FILE = "tokens.txt";
    FileWriter fw = new FileWriter(EXIT_FILE);
    BufferedWriter bw = new BufferedWriter(fw);
    
%}

%init{
       
%init}

%initthrow{
    IOException
%initthrow}

%eof{
    bw.close();
    fw.close();
%eof}

%eofthrow{
    IOException
%eofthrow}


%%

[\t| |\r|\f|] { /*eliminando espacos em branco*/
    System.out.print(yytext());
}

[\n] {
    System.out.print(yytext());
   bw.write(yytext());     
}

(program) {
  System.out.print(yytext());
  bw.write("<"+ "program, >");
  return new Symbol(sym.PROGRAM);

}

(begin) {
    System.out.print(yytext());
   bw.write("<"+ "begin, >");
   return new Symbol(sym.BEGIN);
}

(end) {
    System.out.print(yytext());
   bw.write("<"+ "end, >");
      return new Symbol(sym.END);

}

";" {
  System.out.print(yytext());
  bw.write("<"+ "scolon, >");
  return new Symbol(sym.SCOLON);

}

":" {
	System.out.print(yytext());
	bw.write("<"+"colon, >");
  return new Symbol(sym.COLON);

}	

"," {
	System.out.print(yytext());
	bw.write("<"+"comma, >");
  return new Symbol(sym.COMMA);

}

"(" {
  System.out.print(yytext());
  bw.write("<"+ "lfparen, >");
  return new Symbol(sym.LFPAREN);

}

")" {
  System.out.print(yytext());
  bw.write("<"+ "rtparen, >");
  return new Symbol(sym.RTPAREN);
}

(int) {
  System.out.print(yytext());
  bw.write("<" + "type,"+ yytext()+">");
  return new Symbol(sym.INT);
}

(real) {
  System.out.print(yytext());
  bw.write("<" + "type,"+ yytext()+">");
  return new Symbol(sym.REAL);
}

(boolean) {
  System.out.print(yytext());
  bw.write("<" + "type,"+ yytext()+">");
  return new Symbol(sym.BOOLEAN);

}

(char) {
  System.out.print(yytext());
  bw.write("<" + "type,"+ yytext()+">");
  return new Symbol(sym.CHAR);
}

":=" {
  System.out.print(yytext());
  bw.write("<"+ "assign," + yytext()+">");
  return new Symbol(sym.ASSIGN);
}

/*(while) {
  System.out.print(yytext());
  bw.write("<"+ "while, >");
  return new Symbol(sym.WHILE);
}*/

(if) {
  System.out.print(yytext());
  bw.write("<" +"if, >" );
  return new Symbol(sym.IF);

}

(else) {
  System.out.print(yytext());
  bw.write("<"+"else, >");
  return new Symbol(sym.ELSE);

}

(then) {
  System.out.print(yytext());
  bw.write("<"+"then, >");
  return new Symbol(sym.THEN);
}

(repeat) {
  System.out.print(yytext());
  bw.write("<"+ "repeat, >");
  return new Symbol(sym.REPEAT);
}

(until) {
  System.out.print(yytext());
  bw.write("<"+"until, >");
  return new Symbol(sym.UNTIL);
}

(read) {
  System.out.print(yytext());
  bw.write("<"+"read, >");
  return new Symbol(sym.READ);
}
(write) {
  System.out.print(yytext());
  bw.write("<"+"write, >");
  return new Symbol(sym.WRITE);
}

(false) {
  System.out.print(yytext());
  bw.write("<"+"bool,"+yytext()+">");
  return new Symbol(sym.FALSE);
}

(true) {
  System.out.print(yytext());
  bw.write("<"+"bool,"+yytext()+">");
  return new Symbol(sym.TRUE);

}

(value) {
  System.out.print(yytext());
  bw.write("<"+"value, >");
  return new Symbol(sym.VALUE);
}

(reference) {
  System.out.print(yytext());
  bw.write("<"+"reference, >");
  return new Symbol(sym.REFERENCE);
}

(not) {
  System.out.print(yytext());
  bw.write("<"+"not, >"); 
  return new Symbol(sym.NOT);

}

(mod) {
  System.out.print(yytext());
  bw.write("<"+"mulop,"+yytext()+">");
  return new Symbol(sym.MOD);
}

(and) {
  System.out.print(yytext());
  bw.write("<"+"mulop,"+yytext()+">");
  return new Symbol(sym.AND);
}

(or) {
  System.out.print(yytext());
  bw.write("<"+"addop,"+yytext()+">");
  return new Symbol(sym.OR);
}


[A-Za-z][A-za-z0-9]* {
    System.out.print(yytext());
   bw.write("<"+"id,"+yytext()+">");
}

"<" {
    System.out.print(yytext());
   bw.write("<"+"relop,"+ yytext()+">");
   return new Symbol(sym.LT);
}

">" {
  System.out.print(yytext());
  bw.write("<"+"relop,"+ yytext()+">");
  return new Symbol(sym.GT);
}

"<=" {
  System.out.print(yytext());
  bw.write("<"+ "relop," + yytext()+ ">");
  return new Symbol(sym.LE);
}
">=" {
  System.out.print(yytext());
  bw.write("<" + "relop,"+yytext()+">");
  return new Symbol(sym.GE);
}

"!=" {
  System.out.print(yytext());
  bw.write("<"+ "relop," + yytext()+ ">");
  return new Symbol(sym.NQ);

}
"=" {

  System.out.print(yytext());
  bw.write("<"+ "relop," + yytext()+ ">");
  return new Symbol(sym.EQ);
}

"*" {
  System.out.print(yytext());
  bw.write("<" + "mulop,"+yytext()+">");
  return new Symbol(sym.MUL);
}

"/" {
  System.out.print(yytext());
  bw.write("<"+"mulop,"+yytext()+">");
  return new Symbol(sym.DIV);

}


"+" {
  System.out.print(yytext());
  bw.write("<"+"addop,"+yytext()+">");
  return new Symbol(sym.PLUS);

}

"-" {
  System.out.print(yytext());
  bw.write("<"+"addop,"+yytext()+">");
  return new Symbol(sym.MINUS);
}



[+|-]?[0-9]*[.][0-9]+([E|e][+|-]?[0-9]+)? { //Real
  System.out.print(yytext());
  bw.write("<" + "num,"+ yytext()+">");
}

[+|-]?[0-9]+([E|e][+|-]?[0-9]+)? { //inteiro
    System.out.print(yytext());
   bw.write("<"+"num,"+yytext()+">");
}

. {
    System.out.println(" Invalid character "+yytext());
    System.exit(1);
}
