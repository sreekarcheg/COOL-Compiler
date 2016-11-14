lexer grammar CoolLexer;


tokens{
	ERROR,
	TYPEID,
	OBJECTID,
	BOOL_CONST,
	INT_CONST,
	STR_CONST,
	LPAREN,
	RPAREN,
	COLON,
	ATSYM,
	SEMICOLON,
	COMMA,
	PLUS,
	MINUS,
	STAR,
	SLASH,
	TILDE,
	LT,
	EQUALS,
	LBRACE,
	RBRACE,
	DOT,
	DARROW,
	LE,
	ASSIGN,
	CLASS,
	ELSE,
	FI,
	IF,
	IN,
	INHERITS,
	LET,
	LOOP,
	POOL,
	THEN,
	WHILE,
	CASE,
	ESAC,
	OF,
	NEW,
	ISVOID,
	NOT
}

/*
  DO NOT EDIT CODE ABOVE THIS LINE
*/



@members{

	/*
		YOU CAN ADD YOUR MEMBER VARIABLES AND METHODS HERE
	*/


	/**
	* Function to report errors.
	* Use this function whenever your lexer encounters any erroneous input
	* DO NOT EDIT THIS FUNCTION
	*/
	public void reportError(String errorString){
		setText(errorString);
		setType(ERROR);
	}

	public void processString() {
		Token t = _factory.create(_tokenFactorySourcePair, _type, _text, _channel, _tokenStartCharIndex, getCharIndex()-1, _tokenStartLine, _tokenStartCharPositionInLine);
		String text = t.getText();
		String ret  = "";
		//write your code to test strings here
		if(text.length()>1024) reportError("String constant too long");
		else
		{
			text = text.substring(1,text.length()-1);
			int i = 0;
			while(i<text.length()) //while loop iterates over the characters of the strings.
			{
				if(text.charAt(i)=='\0') reportError("String contains null character");
				else if(text.charAt(i)=='\n') reportError("Unterminated string constant");
				else if(text.charAt(i)=='\\')
				{
					if(text.charAt(i+1)=='n'|| text.charAt(i+1)=='\n')ret=ret.concat("\n");
					else if(text.charAt(i+1)=='b') ret=ret.concat("\b");
					else if(text.charAt(i+1)=='t') ret=ret.concat("\t");
					else if(text.charAt(i+1)=='f') ret=ret.concat("\f");
					else if(text.charAt(i+1)=='0') ret=ret.concat("0");
					else ret=ret.concat(String.valueOf(text.charAt(i+1)));
					i=i+2;
					continue;
					
				}
				else ret=ret.concat(String.valueOf(text.charAt(i)));
				i=i+1;
			}
			setText(ret);
		}
	}
	public void reportUnmatched(){
		Token t = _factory.create(_tokenFactorySourcePair, _type, _text, _channel, _tokenStartCharIndex, getCharIndex()-1, _tokenStartLine, _tokenStartCharPositionInLine);

		String text = t.getText();
		
		reportError(text);

	}

}


/*
	WRITE ALL LEXER RULES BELOW
*/



//---------------------------------------
//	SPECIAL SYNTACTIC SYMBOLS
//---------------------------------------

DARROW      : '=>';
DOT 		: '.';
ATSYM  		: '@';
TILDE		: '~';
STAR		: '*';
SLASH		: '/';
PLUS		: '+';
MINUS		: '-';
LE          : '<=';
LT          : '<';
EQUALS      : '=';
ASSIGN      : '<-' ;
SEMICOLON   : ';';
LPAREN      : '(';
RPAREN		: ')';
LBRACE		: '{';
RBRACE		: '}';
COMMA		: ',';
COLON		: ':';


//---------------------------------------
//	KEYWORDS
//---------------------------------------

OF 		    : ('o'|'O')('f'|'F');
IF          : ('i'|'I')('f'|'F');
IN          : ('i'|'I')('n'|'N');
FI          : ('i'|'I')('F'|'f');
NEW         : ('n'|'N')('e'|'E')('w'|'W');
NOT         : ('n'|'N')('o'|'O')('T'|'T');
LET         : ('l'|'L')('e'|'E')('t'|'T');
ELSE        : ('e'|'E')('l'|'L')('s'|'S')('e'|'E');
THEN        : ('t'|'T')('h'|'H')('e'|'E')('n'|'N');
CASE        : ('c'|'C')('a'|'A')('s'|'S')('e'|'E');
ESAC        : ('e'|'E')('s'|'S')('a'|'A')('c'|'C');
LOOP        : ('l'|'L')('o'|'O')('o'|'O')('p'|'P');
POOL        : ('p'|'P')('o'|'O')('o'|'O')('l'|'L');
WHILE       : ('w'|'W')('h'|'H')('i'|'I')('l'|'L')('e'|'E');
CLASS       : ('c'|'C')('l'|'L')('a'|'A')('s'|'S')('s'|'S');
ISVOID      : ('i'|'I')('s'|'S')('v'|'V')('o'|'O')('i'|'I')('d'|'D');
INHERITS    : ('i'|'I')('n'|'N')('h'|'H')('e'|'E')('r'|'R')('i'|'I')('t'|'T')('s'|'S');




BOOL_CONST 			: TRUE | FALSE;


SINGLE_BACKSLASH	: ('"')('\\')('"') {reportError("Single backslash in string");};
EOF_STRING			: ('"' ( '\\' | WS | ~('\\'|'"') )* )(EOF){reportError("EOF in string");};
STR_CONST 			: '"' ( '\\' | WS | ~('\\'|'"') )* '"' {processString();};



INT_CONST       	: DIGIT+;

COMMENT				: '--'(.)*? ('\n'|'\r') -> skip;

MULTILINE_COMMENT 	: '(*' (MULTILINE_COMMENT|.)*? '*)' -> skip ;

TYPEID				: (UPPER)(LETTER|DIGIT|'_')*;
OBJECTID    		: (LOWER)(LETTER|DIGIT|'_')*;

WS					: (' ' | '\t' | '\n' | '\r' | '\f') -> skip;


ERROR_COMMENT		: '*)' {reportError("Unmatched comment identifier.");};
UNMATCHED           : .{reportUnmatched();}; //to only print the token and nothing else

fragment UPPER  	: 'A'..'Z';
fragment LOWER  	: 'a'..'z';
fragment LETTER 	: (UPPER | LOWER);
fragment DIGIT  	: '0'..'9';
fragment TRUE		: 't'('r'|'R')('u'|'U')('e'|'E');
fragment FALSE		: 'f'('a'|'A')('l'|'L')('s'|'S')('e'|'E');




 






	
