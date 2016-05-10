/*
 *  The scanner definition for COOL.
 */

/*
 *  Stuff enclosed in %{ %} in the first section is copied verbatim to the
 *  output, so headers and global definitions are placed here to be visible
 * to the code in the file.  Don't remove anything that was here initially
 */
%{
#include <cool-parse.h>
#include <stringtab.h>
#include <utilities.h>

/* The compiler assumes these identifiers. */
#define yylval cool_yylval
#define yylex  cool_yylex

/* Max size of string constants */
#define MAX_STR_CONST 1025
#define YY_NO_UNPUT   /* keep g++ happy */

extern FILE *fin; /* we read from this file */

/* define YY_INPUT so we read from the FILE fin:
 * This change makes it possible to use this scanner in
 * the Cool compiler.
 */
#undef YY_INPUT
#define YY_INPUT(buf,result,max_size) \
	if ( (result = fread( (char*)buf, sizeof(char), max_size, fin)) < 0) \
		YY_FATAL_ERROR( "read() in flex scanner failed");

char string_buf[MAX_STR_CONST]; /* to assemble string constants */
char *string_buf_ptr;

extern int curr_lineno;
extern int verbose_flag;

extern YYSTYPE cool_yylval;

int comment_level;

%}
%x STR COMMENT INVALID_STRING


/*
 * Define names for regular expressions here.
 */

DARROW =>
DIGIT [0-9]
DIGITS {DIGIT}+
WHITESPACE [ \t\f\r\v]
CLASS (C|c)(L|l)(A|a)(S|s)(S|s)
ELSE (e|E)(L|l)(S|s)(E|e)
FALSE f(A|a)(L|l)(S|s)(E|e)
FI (F|f)(I|i)
IF (I|i)(F|f)
INHERITS (I|i)(N|n)(H|h)(E|e)(R|r)(I|i)(T|t)(S|s)
IN (I|i)(N|n)
ISVOID (I|i)(S|s)(V|v)(O|o)(I|i)(D|d)
LET (L|l)(E|e)(T|t)
LOOP (L|l)(O|o)(O|o)(P|p)
POOL (P|p)(O|o)(O|o)(L|l)
THEN (T|t)(H|h)(E|e)(N|n)
WHILE (W|w)(H|h)(I|i)(L|l)(E|e)
CASE (C|c)(A|a)(S|s)(E|e)
ESAC (E|e)(S|s)(A|a)(C|c)
NEW (N|n)(E|e)(W|w)
OF (O|o)(F|f)
NOT (N|n)(O|o)(T|t)
TRUE t(r|R)(U|u)(E|e)
OPEN_COMMENT (*
DOUBLE_QUOTE \"
ASSIGNMENT <-
KEYWORD ({CLASS}|{ELSE}|{FALSE}|{FI}|{IF}|{IN}|{INHERITS}|{ISVOID}|{LET}|{LOOP}|{POOL}|{THEN}|{WHILE}|{CASE}|{ESAC}|{NEW}|{OF}|{NOT}|{TRUE})
LOWER_CASE [a-z]
CAPITAL [A-Z]
TYPE_IDENTIFIER {CAPITAL}[a-zA-Z0-9_]*
OBJECT_IDENTIFIER {LOWER_CASE}[a-zA-Z0-9_]*


%%

 /*
  *  Nested comments
  */

<INITIAL,COMMENT>"(*" {++comment_level;BEGIN(COMMENT);}
	<COMMENT>"*"+")" {
		if(--comment_level < 1){
			BEGIN(INITIAL);
		}
	}
	<COMMENT>\\.		     ;
	<COMMENT>[^(*\\\n]*          ;
    	<COMMENT>"("+[^(*\\\n]*      ; 
    	<COMMENT>"*"+[^)*\\\n]*      ;
	<COMMENT><<EOF>> {
		BEGIN(INITIAL);
		cool_yylval.error_msg = "EOF in comment";
		return ERROR;
	}
	<COMMENT>\n {++curr_lineno;}
	<COMMENT>\\\n {++curr_lineno;}

"*)" {
	cool_yylval.error_msg = "Unmatched *)";
        return ERROR;
}

"--".* ;

 /*
  *  The multiple-character operators.
  */

{DARROW} { return DARROW; }
{ASSIGNMENT} { return ASSIGN; }
"<=" return LE;
"(" return '(';
")" return ')';
"." return '.';
"@" return '@';
"~" return '~';
"*" return '*';
"/" return '/';
"+" return '+';
"-" return '-';
"<" return '<';
"=" return '=';
"{" return '{';
"}" return '}';
":" return ':';
"," return ',';
";" return ';';

{DOUBLE_QUOTE} { 
	string_buf_ptr = string_buf;
	BEGIN(STR);
}
	<STR>[^\\\"\n\0]* {
		if (string_buf_ptr + yyleng > &string_buf[MAX_STR_CONST - 1]) {
			BEGIN(INVALID_STRING);
			cool_yylval.error_msg = "String constant too long";
			return ERROR;
		}
		strcpy(string_buf_ptr,yytext);
		string_buf_ptr += yyleng;
	}
	<STR>\n {
		curr_lineno++;
		BEGIN(INITIAL);
		cool_yylval.error_msg = "Unterminated string constant";
		return ERROR;
	}
	<STR>\\\n {
		curr_lineno++;
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
		*string_buf_ptr++ = '\n';
		cool_yylval.error_msg = "String contains null character";
	}

	<STR>\\n {
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
		*string_buf_ptr++ = '\n';
	}
	<STR>\\t {
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
                *string_buf_ptr++ = '\t';
        }
	<STR>\\b {
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
		*string_buf_ptr++ = '\b';
        }
	<STR>\\f {
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
		*string_buf_ptr++ = '\f';
        }
	<STR>\\\" {
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
		*string_buf_ptr++ = '\"';
	}
	<STR>\\[^\0] {
		if (string_buf_ptr + 1 > &string_buf[MAX_STR_CONST - 1]) {
                        BEGIN(INVALID_STRING);
                        cool_yylval.error_msg = "String constant too long";
                        return ERROR;
                }
		*string_buf_ptr++ = yytext[1];
	}	
	<STR><<EOF>> {
		BEGIN(INITIAL);
                cool_yylval.error_msg = "EOF in string constant";
		return ERROR;
        }
	<STR>\\?\0 {
		BEGIN(INVALID_STRING);
		cool_yylval.error_msg = "String contains null character";
		return ERROR;
	}
	
	<STR>\" {
		*string_buf_ptr = '\0';
		cool_yylval.symbol = stringtable.add_string(string_buf);
		BEGIN(INITIAL);
		return STR_CONST;
	}

<INVALID_STRING>{
    \"          BEGIN(INITIAL);
    \n          {
                    ++curr_lineno;
                    BEGIN(INITIAL);
                }
    \\\n        ++curr_lineno;
    \\.         ;
    [^\\\n\"]+  ;
}

 /*
  * Keywords are case-insensitive except for the values true and false,
  * which must begin with a lower-case letter.
  */

{IN} {return IN;}
{CLASS} {return CLASS;}
{INHERITS} {return INHERITS;}
{IF} {return IF;}
{FI} {return FI;}
{OF} {return OF;}
{THEN} {return THEN;}
{ELSE} {return ELSE;}
{WHILE} {return WHILE;}
{LOOP} {return LOOP;}
{POOL} {return POOL;}
{CASE} {return CASE;}
{ESAC} {return ESAC;}
{LET} {return LET;}
{NEW} {return NEW;}
{ISVOID} {return ISVOID;}
{NOT} {return NOT;}
{TRUE} {
	cool_yylval.boolean = true;
	return BOOL_CONST;
}
{FALSE} {
	cool_yylval.boolean = false;
	return BOOL_CONST;
}

{TYPE_IDENTIFIER} {cool_yylval.symbol = idtable.add_string(yytext);return TYPEID;}
{OBJECT_IDENTIFIER} {cool_yylval.symbol = idtable.add_string(yytext);return OBJECTID;}

 /*
  *  String constants (C syntax)
  *  Escape sequence \c is accepted for all characters c. Except for 
  *  \n \t \b \f, the result is c.
  *
  */

{DIGITS} {
	cool_yylval.symbol = inttable.add_string(yytext);
	return INT_CONST;
}

{WHITESPACE}+ ;

\n {curr_lineno++;}

[^\n] {
	cool_yylval.error_msg = yytext;
	return ERROR;
}

%%
