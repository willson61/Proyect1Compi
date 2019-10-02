package Code;
import static Code.Tokens.*;
%%

%public
%class Lexer
%type Tokens
%char
%line
%column
%unicode

LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

WhiteSpace = {LineTerminator} | [ \t\f]+

ErrorComment = "/*" {InputCharacter}* {LineTerminator}?

/* comments */
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}

TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent       = ( [^*] | \*+ [^/*] )*
EndOfLineComment = "--" {InputCharacter}* {LineTerminator}?

/* identifiers */
Identifier = [:jletter:](([:jletter:]|[:jletterdigit:]|"_")*)

Boolean = (1)|(0)| NULL

DecIntegerLiteral = 0 | [1-9][0-9]*

/* floating point literals */
FloatLiteral  = ({FLit1}|{FLit2}) {Exponent}?

FLit1    = [0-9]+\.[0-9]*
FLit2    = [0-9]+
Exponent = [eE] [+-]? [0-9]+

ErrorString = "'" [^\r\n\u0027]* {LineTerminator}?

String = "'" [^\r\n\u0027]* "'"

%{
    public String lexeme;
    public int lin;
    public int col;
%}

Reserved = 
"ADD"|"EXTERNAL"|"PROCEDURE"|"ALL"|"FETCH"|"PUBLIC"|"ALTER"|"FILE"|"RAISERROR"|"AND"|"FILLFACTOR"|"READ"|
"ANY"|"FOR"|"READTEXT"|"AS"|"FOREIGN"|"RECONFIGURE"|"ASC"|"FREETEXT"|"REFERENCES"|
"AUTHORIZATION"|"FREETEXTTABLE"|"REPLICATION"|"BACKUP"|"FROM"|"RESTORE"|"BEGIN"|"FULL"|"RESTRICT"|
"BETWEEN"|"FUNCTION"|"RETURN"|"BREAK"|"GOTO"|"REVERT"|"BROWSE"|"GRANT"|"REVOKE"|"BULK"|"GROUP"|"RIGHT"|
"BY"|"HAVING"|"ROLLBACK"|"CASCADE"|"HOLDLOCK"|"ROWCOUNT"|"CASE"|"IDENTITY"|"ROWGUIDCOL"|
"CHECK"|"IDENTITY_INSERT"|"RULE"|"CHECKPOINT"|"IDENTITYCOL"|"SAVE"|"CLOSE"|"IF"|"SCHEMA"|
"CLUSTERED"|"IN"|"SECURITYAUDIT"|"COALESCE"|"INDEX"|"SELECT"|"COLLATE"|"INNER"|"SEMANTICKEYPHRASETABLE"|
"COLUMN"|"INSERT"|"SEMANTICSIMILARITYDETAILSTABLE"|"COMMIT"|"INTERSECT"|"SEMANTICSIMILARITYTABLE"|
"COMPUTE"|"INTO"|"SESSION_USER"|"CONSTRAINT"|"IS"|"SET"|"CONTAINS"|"JOIN"|"SETUSER"|"CONTAINSTABLE"|"KEY"|"SHUTDOWN"|
"CONTINUE"|"KILL"|"SOME"|"CONVERT"|"LEFT"|"STATISTICS"|"CREATE"|"LIKE"|"SYSTEM_USER"|"CROSS"|"LINENO"|"TABLE"|
"CURRENT"|"LOAD"|"TABLESAMPLE"|"CURRENT_DATE"|"MERGE"|"TEXTSIZE"|"CURRENT_TIME"|"NATIONAL"|"THEN"|"CURRENT_TIMESTAMP"|"NOCHECK"|"TO"|
"CURRENT_USER"|"NONCLUSTERED"|"TOP"|"CURSOR"|"NOT"|"TRAN"|"DATABASE"|"NULL"|"TRANSACTION"|"DBCC"|"NULLIF"|"TRIGGER"|
"DEALLOCATE"|"OF"|"TRUNCATE"|"DECLARE"|"OFF"|"TRY_CONVERT"|"DEFAULT"|"OFFSETS"|"TSEQUAL"|"DELETE"|"ON"|"UNION"|
"DENY"|"OPEN"|"UNIQUE"|"DESC"|"OPENDATASOURCE"|"UNPIVOT"|"DISK"|"OPENQUERY"|"UPDATE"|"DISTINCT"|"OPENROWSET"|"UPDATETEXT"|
"DISTRIBUTED"|"OPENXML"|"USE"|"DOUBLE"|"OPTION"|"USER"|"DROP"|"OR"|"VALUES"|"DUMP"|"ORDER"|"VARYING"|
"ELSE"|"OUTER"|"VIEW"|"END"|"OVER"|"WAITFOR"|"ERRLVL"|"PERCENT"|"WHEN"|"ESCAPE"|"PIVOT"|"WHERE"|
"EXCEPT"|"PLAN"|"WHILE"|"EXEC"|"PRECISION"|"WITH"|"EXECUTE"|"PRIMARY"|"WITHIN GROUP"|"EXISTS"|"PRINT"|"WRITETEXT"|
"EXIT"|"PROC"|"INCLUDE"|"IMMEDIATE"|"GO"|"SUM"|"AVG"|"COUNT"|"MAX"|"MIN"

DatoEntero = "BIGINT"|"INT"|"SMALLINT"|"TINYINT"
DatoBit = "BIT"
DatoDecimal = "DECIMAL"|"MONEY"|"NUMERIC"|"SMALLMONEY"|"FLOAT"|"REAL"
DatoFechaHora = "DATE"|"DATETIME"|"DATETIME2"|"DATETIMEOFFSET"|"SMALLDATETIME"|"TIME"
DatoTexto = "CHAR"|"TEXT"|"VARCHAR"|"NCHAR"|"NTEXT"|"NVARCHAR"
DatoBin = "BINARY"|"IMAGE"|"VARBINARY"

%%

    {Reserved} { lin=yyline; col=yycolumn; lexeme=yytext(); return Reservada; }

    {DatoEntero} { lin=yyline; col=yycolumn; lexeme=yytext(); return DatoEntero; }

    {DatoBit} { lin=yyline; col=yycolumn; lexeme=yytext(); return DatoBit; }

    {DatoDecimal} { lin=yyline; col=yycolumn; lexeme=yytext(); return DatoDecimal; }

    {DatoFechaHora} { lin=yyline; col=yycolumn; lexeme=yytext(); return DatoFechaHora; }

    {DatoTexto} { lin=yyline; col=yycolumn; lexeme=yytext(); return DatoTexto; }

    {DatoBin} { lin=yyline; col=yycolumn; lexeme=yytext(); return DatoBin; }

    {Boolean} { lin=yyline; col=yycolumn; lexeme=yytext(); return Bit; }

    "+"|"-"|"*"|"/"|"%"|";"|","|"."|"["|"]"|"("|")"|"{"|"}"|"[]"|"()"|"{}"|"@"|"#"|"##" {lin=yyline; col=yycolumn; lexeme=yytext(); return Operador; }

    "<"|"<="|">"|">="|"=="|"!="|"&&"|"||"|"!"|"=" {lin=yyline; col=yycolumn; lexeme=yytext(); return OperadorBooleano; }

    {DecIntegerLiteral} { lin=yyline; col=yycolumn; lexeme=yytext(); return Integer; }

    {FloatLiteral} { lin=yyline; col=yycolumn; lexeme=yytext(); return Float; }

    {ErrorString} { lin=yyline; col=yycolumn; lexeme=yytext(); return VarcharError; }

    {String} { lin=yyline; col=yycolumn; lexeme=yytext(); return Varchar; }

    {ErrorComment} {/*Ignore*/}

    {Comment} {/*Ignore*/}

    {WhiteSpace}+ { /* skip */ }

    {Identifier} { lin=yyline; col=yycolumn; lexeme=yytext(); return Identificador; }

/* error */
    . {lin=yyline; col=yycolumn; lexeme=yytext(); return ERROR;}