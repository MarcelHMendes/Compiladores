package lexsyn;

import java_cup.runtime.Symbol;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

%%
%cup
%{ 
    String EXIT_FILE = "tokens.txt";

    FileWriter fw = null;
    BufferedWriter bw = null;

%}

%init{
    FileWriter fw = new FileWriter(EXIT_FILE);
    BufferedWriter bw = new BufferedWriter(fw);
    
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

[ \t\r\f] { /*eliminando espacos em branco*/
    System.out.print(yytext());
}

[\n] {
    System.out.print(yytext());
    bw.write(yytext());     
}

";" {
    System.out.print(yytext());
    bw.write("<"+ "scolon, >");
}

"{" {
    System.out.print(yytext());
    bw.write("<"+ "lfbrack, >" );
}

"}" {
    System.out.print(yytext());
    bw.write("<"+ "rtbrack, >");
}

"(" {
    System.out.print(yytext());
    bw.write("<"+ "lfparen, >");
}

")" {
    System.out.print(yytext());
    bw.write("<"+ "rtparen, >");
}

(int) {
    System.out.print(yytext());
    bw.write("<" + "type,"+ yytext()+">");
}
(float) {
    System.out.print(yytext());
    bw.write("<" + "type,"+ yytext()+">");
}

(bool) {
    System.out.print(yytext());
    bw.write("<" + "type,"+ yytext()+">");
}

(char) {
    System.out.print(yytext());
    bw.write("<" + "type,"+ yytext()+">");
}

"=" {
    System.out.print(yytext());
    bw.write("<"+ "assign," + yytext()+">");

}

(while) {
    System.out.print(yytext());
    bw.write("<"+ "while, >");
}

(if) {
    System.out.print(yytext());
    bw.write("<" +"if, >" );
}

(else) {
    System.out.print(yytext());
    bw.write("<"+"else, >");
}

[A-Za-z][A-za-z0-9]* {
    System.out.print(yytext());
    bw.write("<"+"id,"+yytext()+">");
}

"<" {
    System.out.print(yytext());
    bw.write("<"+"relop,"+ yytext()+">");
}

"<=" {
    System.out.print(yytext());
    bw.write("<"+ "relop," + yytext()+ ">");
}
">=" {
    System.out.print(yytext());
    bw.write("<" + "relop,"+yytext()+">");
}

"*" {
    System.out.print(yytext());
    bw.write("<" + "operand,"+yytext()+">");
}

"/" {
    System.out.print(yytext());
    bw.write("<"+"operand,"+yytext()+">");
}

"+" {
    System.out.print(yytext());
    bw.write("<"+"operand,"+yytext()+">");
}

"-" {
    System.out.print(yytext());
    bw.write("<"+"operand,"+yytext()+">");
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
