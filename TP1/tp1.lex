package lexsyn;

import jjava_cup.rentime.Symbol;
import java.io.BufferedWritter;
import java.io.FileWriter;
import java.io.IOException;

%%
%cup

%{ 
	String EXIT_FILE = "tokens.txt"

	//FileWriter fw = null;
	//BufferedWriter bw = null;

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
	bw.write("<"+ "rtbrack, >")
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
	bw.write("<" + "type,"+ yytext()+">")
}

(bool) {
	System.out.print(yytext());
	bw.write("<" + "type,"+ yytext()+">");
}

