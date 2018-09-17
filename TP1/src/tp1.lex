//package lexsyn;

//import java_cup.runtime.Symbol;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.System.*;

%%
%class lexAnalysis
%standalone

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

"begin" {
    System.out.print(yytext());
   bw.write("<"+ "begin, >");
}

"end" {
    System.out.print(yytext());
   bw.write("<"+ "end, >");
}

";" {
    System.out.print(yytext());
   bw.write("<"+ "scolon, >");
}

":" {
	System.out.print(yytext());
	bw.write("<"+"colon, >");
}	

"," {
	System.out.print(yytext());
	bw.write("<"+"comma, >");
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

(real) {
    System.out.print(yytext());
   bw.write("<" + "type,"+ yytext()+">");
}

(boolean) {
    System.out.print(yytext());
   bw.write("<" + "type,"+ yytext()+">");
}

(char) {
  System.out.print(yytext());
  bw.write("<" + "type,"+ yytext()+">");
}

":=" {
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

(then) {
  System.out.print(yytext());
  bw.write("<"+"then, >");
}

(repeat) {
    System.out.print(yytext());
   bw.write("<"+ "repeat, >");
}

(until) {
    System.out.print(yytext());
   bw.write("<"+"until, >");
}

(read) {
    System.out.print(yytext());
   bw.write("<"+"read, >");
}
(write) {
    System.out.print(yytext());
   bw.write("<"+"write, >");
}


(false) {
    System.out.print(yytext());
   bw.write("<"+"bool,"+yytext()+">");
}

(true) {
    System.out.print(yytext());
   bw.write("<"+"bool,"+yytext()+">");
}

(value) {
    System.out.print(yytext());
   bw.write("<"+"value, >");
}
(reference) {
    System.out.print(yytext());
   bw.write("<"+"reference, >");
}

(not) {
   System.out.print(yytext());
   bw.write("<"+"not, >"); 
}


[A-Za-z][A-za-z0-9]* {
    System.out.print(yytext());
   bw.write("<"+"id,"+yytext()+">");
}

"<" {
    System.out.print(yytext());
   bw.write("<"+"relop,"+ yytext()+">");
}

">" {
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

"!=" {
    System.out.print(yytext());
   bw.write("<"+ "relop," + yytext()+ ">");
}
"="{

  System.out.print(yytext());
   bw.write("<"+ "relop," + yytext()+ ">");
}
"*" {
    System.out.print(yytext());
   bw.write("<" + "mulop,"+yytext()+">");
}

"/" {
    System.out.print(yytext());
   bw.write("<"+"mulop,"+yytext()+">");
}
(mod) {
    System.out.print(yytext());
   bw.write("<"+"mulop,"+yytext()+">");
}

(and) {
    System.out.print(yytext());
   bw.write("<"+"mulop,"+yytext()+">");
}

"+" {
    System.out.print(yytext());
   bw.write("<"+"addop,"+yytext()+">");
}

"-" {
    System.out.print(yytext());
   bw.write("<"+"addop,"+yytext()+">");
}

(or) {
    System.out.print(yytext());
   bw.write("<"+"addop,"+yytext()+">");
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
