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

ErrorIdentifier = ([:jletterdigit:]|"_")(([:jletter:]|[:jletterdigit:]|"_")*)

Boolean = (1)|(0)| NULL

DecIntegerLiteral = [0-9][0-9]*

/* floating point literals */
FloatLiteral  = ({FLit1}) {Exponent}?

FLit1    = [0-9]+\.[0-9]*
Exponent = [eE] [+-]? [0-9]+

ErrorString = "'" [^\r\n\u0027]* {LineTerminator}?

String = "'" [^\r\n\u0027]* "'"

%{
    public String lexeme;
    public int lin;
    public int col;
%}

%%

    "ADD" { lin=yyline; col=yycolumn; lexeme=yytext(); return ADD; }
    "EXTERNAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return EXTERNAL; }
    "PROCEDURE" { lin=yyline; col=yycolumn; lexeme=yytext(); return PROCEDURE; }
    "ALL" { lin=yyline; col=yycolumn; lexeme=yytext(); return ALL; }
    "OUT" { lin=yyline; col=yycolumn; lexeme=yytext(); return OUT; }
    "READONLY" { lin=yyline; col=yycolumn; lexeme=yytext(); return READONLY; }
    "ENCRYPTION" { lin=yyline; col=yycolumn; lexeme=yytext(); return ENCRYPTION; }
    "RETURNS" { lin=yyline; col=yycolumn; lexeme=yytext(); return RETURNS; }
    "SCHEMABINDING" { lin=yyline; col=yycolumn; lexeme=yytext(); return SCHEMABINDING; }
    "CALLED" { lin=yyline; col=yycolumn; lexeme=yytext(); return CALLED; }
    "INLINE" { lin=yyline; col=yycolumn; lexeme=yytext(); return INLINE; }
    "CALLER" { lin=yyline; col=yycolumn; lexeme=yytext(); return CALLER; }
    "SELF" { lin=yyline; col=yycolumn; lexeme=yytext(); return SELF; }
    "OWNER" { lin=yyline; col=yycolumn; lexeme=yytext(); return OWNER; }
    "RECOMPILE" { lin=yyline; col=yycolumn; lexeme=yytext(); return RECOMPILE; }
    "MARK" { lin=yyline; col=yycolumn; lexeme=yytext(); return MARK; }
    "FORWARD_ONLY" { lin=yyline; col=yycolumn; lexeme=yytext(); return FORWARDONLY; }
    "STATIC" { lin=yyline; col=yycolumn; lexeme=yytext(); return STATIC; }
    "KEYSET" { lin=yyline; col=yycolumn; lexeme=yytext(); return KEYSET; }
    "DYNAMIC" { lin=yyline; col=yycolumn; lexeme=yytext(); return DYNAMIC; }
    "FAST_FORWARD" { lin=yyline; col=yycolumn; lexeme=yytext(); return FASTFORWARD; }
    "READ_ONLY" { lin=yyline; col=yycolumn; lexeme=yytext(); return READ_ONLY; }
    "SCROLL_LOCKS" { lin=yyline; col=yycolumn; lexeme=yytext(); return SCROLLLOCKS; }
    "OPTIMISTIC" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPTIMISTIC; }
    "TYPE_WARNING" { lin=yyline; col=yycolumn; lexeme=yytext(); return TYPEWARNING; }
    "FETCH" { lin=yyline; col=yycolumn; lexeme=yytext(); return FETCH; }
    "PUBLIC" { lin=yyline; col=yycolumn; lexeme=yytext(); return PUBLIC; }
    "ALTER" { lin=yyline; col=yycolumn; lexeme=yytext(); return ALTER; }
    "FILE" { lin=yyline; col=yycolumn; lexeme=yytext(); return FILE; }
    "RAISERROR" { lin=yyline; col=yycolumn; lexeme=yytext(); return RAISERROR; }
    "AND" { lin=yyline; col=yycolumn; lexeme=yytext(); return AND; }
    "FILLFACTOR" { lin=yyline; col=yycolumn; lexeme=yytext(); return FILLFACTOR; }
    "READ" { lin=yyline; col=yycolumn; lexeme=yytext(); return READ; }
    "ANY" { lin=yyline; col=yycolumn; lexeme=yytext(); return ANY; }
    "FOR" { lin=yyline; col=yycolumn; lexeme=yytext(); return FOR; }
    "READTEXT" { lin=yyline; col=yycolumn; lexeme=yytext(); return READTEXT; }
    "AS" { lin=yyline; col=yycolumn; lexeme=yytext(); return AS; }
    "FOREIGN" { lin=yyline; col=yycolumn; lexeme=yytext(); return FOREIGN; }
    "RECONFIGURE" { lin=yyline; col=yycolumn; lexeme=yytext(); return RECONFIGURE; }
    "ASC" { lin=yyline; col=yycolumn; lexeme=yytext(); return ASC; }
    "FREETEXT" { lin=yyline; col=yycolumn; lexeme=yytext(); return FREETEXT; }
    "REFERENCES" { lin=yyline; col=yycolumn; lexeme=yytext(); return REFERENCES; }
    "AUTHORIZATION" { lin=yyline; col=yycolumn; lexeme=yytext(); return AUTHORIZATION; }
    "FREETEXTTABLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return FREETEXTTABLE; }
    "REPLICATION" { lin=yyline; col=yycolumn; lexeme=yytext(); return REPLICATION; }
    "BACKUP" { lin=yyline; col=yycolumn; lexeme=yytext(); return BACKUP; }
    "FROM" { lin=yyline; col=yycolumn; lexeme=yytext(); return FROM; }
    "RESTORE" { lin=yyline; col=yycolumn; lexeme=yytext(); return RESTORE; }
    "BEGIN" { lin=yyline; col=yycolumn; lexeme=yytext(); return BEGIN; }
    "FULL" { lin=yyline; col=yycolumn; lexeme=yytext(); return FULL; }
    "RESTRICT" { lin=yyline; col=yycolumn; lexeme=yytext(); return RESTRICT; }
    "BETWEEN" { lin=yyline; col=yycolumn; lexeme=yytext(); return BETWEEN; }
    "FUNCTION" { lin=yyline; col=yycolumn; lexeme=yytext(); return FUNCTION; }
    "RETURN" { lin=yyline; col=yycolumn; lexeme=yytext(); return RETURN; }
    "BREAK" { lin=yyline; col=yycolumn; lexeme=yytext(); return BREAK; }
    "GOTO" { lin=yyline; col=yycolumn; lexeme=yytext(); return GOTO; }
    "REVERT" { lin=yyline; col=yycolumn; lexeme=yytext(); return REVERT; }
    "BROWSE" { lin=yyline; col=yycolumn; lexeme=yytext(); return BROWSE; }
    "GRANT" { lin=yyline; col=yycolumn; lexeme=yytext(); return GRANT; }
    "REVOKE" { lin=yyline; col=yycolumn; lexeme=yytext(); return REVOKE; }
    "BULK" { lin=yyline; col=yycolumn; lexeme=yytext(); return BULK; }
    "GROUP" { lin=yyline; col=yycolumn; lexeme=yytext(); return GROUP; }
    "RIGHT" { lin=yyline; col=yycolumn; lexeme=yytext(); return RIGHT; }
    "BY" { lin=yyline; col=yycolumn; lexeme=yytext(); return BY; }
    "HAVING" { lin=yyline; col=yycolumn; lexeme=yytext(); return HAVING; }
    "ROLLBACK" { lin=yyline; col=yycolumn; lexeme=yytext(); return ROLLBACK; }
    "CASCADE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CASCADE; }
    "HOLDLOCK" { lin=yyline; col=yycolumn; lexeme=yytext(); return HOLDLOCK; }
    "ROWCOUNT" { lin=yyline; col=yycolumn; lexeme=yytext(); return ROWCOUNT; }
    "CASE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CASE; }
    "IDENTITY" { lin=yyline; col=yycolumn; lexeme=yytext(); return IDENTITY; }
    "ROWGUIDCOL" { lin=yyline; col=yycolumn; lexeme=yytext(); return ROWGUIDCOL; }
    "CHECK" { lin=yyline; col=yycolumn; lexeme=yytext(); return CHECK; }
    "IDENTITY_INSERT" { lin=yyline; col=yycolumn; lexeme=yytext(); return IDENTITY_INSERT; }
    "RULE" { lin=yyline; col=yycolumn; lexeme=yytext(); return RULE; }
    "CHECKPOINT" { lin=yyline; col=yycolumn; lexeme=yytext(); return CHECKPOINT; }
    "IDENTITYCOL" { lin=yyline; col=yycolumn; lexeme=yytext(); return IDENTITYCOL; }
    "SAVE" { lin=yyline; col=yycolumn; lexeme=yytext(); return SAVE; }
    "CLOSE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CLOSE; }
    "IF" { lin=yyline; col=yycolumn; lexeme=yytext(); return IF; }
    "SCHEMA" { lin=yyline; col=yycolumn; lexeme=yytext(); return SCHEMA; }
    "CLUSTERED" { lin=yyline; col=yycolumn; lexeme=yytext(); return CLUSTERED; }
    "IN" { lin=yyline; col=yycolumn; lexeme=yytext(); return IN; }
    "SECURITYAUDIT" { lin=yyline; col=yycolumn; lexeme=yytext(); return SECURITYAUDIT; }
    "COALESCE" { lin=yyline; col=yycolumn; lexeme=yytext(); return COALESCE; }
    "INDEX" { lin=yyline; col=yycolumn; lexeme=yytext(); return INDEX; }
    "SELECT" { lin=yyline; col=yycolumn; lexeme=yytext(); return SELECT; }
    "COLLATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return COLLATE; }
    "INNER" { lin=yyline; col=yycolumn; lexeme=yytext(); return INNER; }
    "SEMANTICKEYPHRASETABLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return SEMANTICKEYPHRASETABLE; }
    "COLUMN" { lin=yyline; col=yycolumn; lexeme=yytext(); return COLUMN; }
    "INSERT" { lin=yyline; col=yycolumn; lexeme=yytext(); return INSERT; }
    "SEMANTICSIMILARITYDETAILSTABLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return SEMANTICSIMILARITYDETAILSTABLE; }
    "COMMIT" { lin=yyline; col=yycolumn; lexeme=yytext(); return COMMIT; }
    "INTERSECT" { lin=yyline; col=yycolumn; lexeme=yytext(); return INTERSECT; }
    "SEMANTICSIMILARITYTABLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return SEMANTICSIMILARITYTABLE; }
    "COMPUTE" { lin=yyline; col=yycolumn; lexeme=yytext(); return COMPUTE; }
    "INTO" { lin=yyline; col=yycolumn; lexeme=yytext(); return INTO; }
    "SESSION_USER" { lin=yyline; col=yycolumn; lexeme=yytext(); return SESSION_USER; }
    "CONSTRAINT" { lin=yyline; col=yycolumn; lexeme=yytext(); return CONSTRAINT; }
    "IS" { lin=yyline; col=yycolumn; lexeme=yytext(); return IS; }
    "SET" { lin=yyline; col=yycolumn; lexeme=yytext(); return SET; }
    "CONTAINS" { lin=yyline; col=yycolumn; lexeme=yytext(); return CONTAINS; }
    "JOIN" { lin=yyline; col=yycolumn; lexeme=yytext(); return JOIN; }
    "SETUSER" { lin=yyline; col=yycolumn; lexeme=yytext(); return SETUSER; }
    "CONTAINSTABLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CONTAINSTABLE; }
    "KEY" { lin=yyline; col=yycolumn; lexeme=yytext(); return KEY; }
    "SHUTDOWN" { lin=yyline; col=yycolumn; lexeme=yytext(); return SHUTDOWN; }
    "CONTINUE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CONTINUE; }
    "KILL" { lin=yyline; col=yycolumn; lexeme=yytext(); return KILL; }
    "SOME" { lin=yyline; col=yycolumn; lexeme=yytext(); return SOME; }
    "CONVERT" { lin=yyline; col=yycolumn; lexeme=yytext(); return CONVERT; }
    "LEFT" { lin=yyline; col=yycolumn; lexeme=yytext(); return LEFT; }
    "STATISTICS" { lin=yyline; col=yycolumn; lexeme=yytext(); return STATISTICS; }
    "CREATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CREATE; }
    "LIKE" { lin=yyline; col=yycolumn; lexeme=yytext(); return LIKE; }
    "SYSTEM_USER" { lin=yyline; col=yycolumn; lexeme=yytext(); return SYSTEM_USER; }
    "CROSS" { lin=yyline; col=yycolumn; lexeme=yytext(); return CROSS; }
    "LINENO" { lin=yyline; col=yycolumn; lexeme=yytext(); return LINENO; }
    "TABLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return TABLE; }
    "CURRENT" { lin=yyline; col=yycolumn; lexeme=yytext(); return CURRENT; }
    "LOAD" { lin=yyline; col=yycolumn; lexeme=yytext(); return LOAD; }
    "TABLESAMPLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return TABLESAMPLE; }
    "CURRENT_DATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return CURRENT_DATE; }
    "MERGE" { lin=yyline; col=yycolumn; lexeme=yytext(); return MERGE; }
    "TEXTSIZE" { lin=yyline; col=yycolumn; lexeme=yytext(); return TEXTSIZE; }
    "CURRENT_TIME" { lin=yyline; col=yycolumn; lexeme=yytext(); return CURRENT_TIME; }
    "NATIONAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return NATIONAL; }
    "THEN" { lin=yyline; col=yycolumn; lexeme=yytext(); return THEN; }
    "CURRENT_TIMESTAMP" { lin=yyline; col=yycolumn; lexeme=yytext(); return CURRENT_TIMESTAMP; }
    "NOCHECK" { lin=yyline; col=yycolumn; lexeme=yytext(); return NOCHECK; }
    "TO" { lin=yyline; col=yycolumn; lexeme=yytext(); return TO; }
    "CURRENT_USER" { lin=yyline; col=yycolumn; lexeme=yytext(); return CURRENT_USER; }
    "NONCLUSTERED" { lin=yyline; col=yycolumn; lexeme=yytext(); return NONCLUSTERED; }
    "TOP" { lin=yyline; col=yycolumn; lexeme=yytext(); return TOP; }
    "CURSOR" { lin=yyline; col=yycolumn; lexeme=yytext(); return CURSOR; }
    "NOT" { lin=yyline; col=yycolumn; lexeme=yytext(); return NOT; }
    "TRAN" { lin=yyline; col=yycolumn; lexeme=yytext(); return TRAN; }
    "DATABASE" { lin=yyline; col=yycolumn; lexeme=yytext(); return DATABASE; }
    "NULL" { lin=yyline; col=yycolumn; lexeme=yytext(); return NULL; }
    "TRANSACTION" { lin=yyline; col=yycolumn; lexeme=yytext(); return TRANSACTION; }
    "DBCC" { lin=yyline; col=yycolumn; lexeme=yytext(); return DBCC; }
    "NULLIF" { lin=yyline; col=yycolumn; lexeme=yytext(); return NULLIF; }
    "TRIGGER" { lin=yyline; col=yycolumn; lexeme=yytext(); return TRIGGER; }
    "DEALLOCATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return DEALLOCATE; }
    "OF" { lin=yyline; col=yycolumn; lexeme=yytext(); return OF; }
    "TRUNCATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return TRUNCATE; }
    "DECLARE" { lin=yyline; col=yycolumn; lexeme=yytext(); return DECLARE; }
    "OFF" { lin=yyline; col=yycolumn; lexeme=yytext(); return OFF; }
    "TRY_CONVERT" { lin=yyline; col=yycolumn; lexeme=yytext(); return TRY_CONVERT; }
    "DEFAULT" { lin=yyline; col=yycolumn; lexeme=yytext(); return DEFAULT; }
    "OFFSETS" { lin=yyline; col=yycolumn; lexeme=yytext(); return OFFSETS; }
    "TSEQUAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return TSEQUAL; }
    "DELETE" { lin=yyline; col=yycolumn; lexeme=yytext(); return DELETE; }
    "ON" { lin=yyline; col=yycolumn; lexeme=yytext(); return ON; }
    "UNION" { lin=yyline; col=yycolumn; lexeme=yytext(); return UNION; }
    "DENY" { lin=yyline; col=yycolumn; lexeme=yytext(); return DENY; }
    "OPEN" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPEN; }
    "UNIQUE" { lin=yyline; col=yycolumn; lexeme=yytext(); return UNIQUE; }
    "DESC" { lin=yyline; col=yycolumn; lexeme=yytext(); return DESC; }
    "OPENDATASOURCE" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPENDATASOURCE; }
    "UNPIVOT" { lin=yyline; col=yycolumn; lexeme=yytext(); return UNPIVOT; }
    "DISK" { lin=yyline; col=yycolumn; lexeme=yytext(); return DISK; }
    "OPENQUERY" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPENQUERY; }
    "UPDATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return UPDATE; }
    "DISTINCT" { lin=yyline; col=yycolumn; lexeme=yytext(); return DISTINCT; }
    "OPENROWSET" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPENROWSET; }
    "UPDATETEXT" { lin=yyline; col=yycolumn; lexeme=yytext(); return UPDATETEXT; }
    "DISTRIBUTED" { lin=yyline; col=yycolumn; lexeme=yytext(); return DISTRIBUTED; }
    "OPENXML" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPENXML; }
    "USE" { lin=yyline; col=yycolumn; lexeme=yytext(); return USE; }
    "DOUBLE" { lin=yyline; col=yycolumn; lexeme=yytext(); return DOUBLE; }
    "OPTION" { lin=yyline; col=yycolumn; lexeme=yytext(); return OPTION; }
    "USER" { lin=yyline; col=yycolumn; lexeme=yytext(); return USER; }
    "DROP" { lin=yyline; col=yycolumn; lexeme=yytext(); return DROP; }
    "OR" { lin=yyline; col=yycolumn; lexeme=yytext(); return OR; }
    "VALUES" { lin=yyline; col=yycolumn; lexeme=yytext(); return VALUES; }
    "DUMP" { lin=yyline; col=yycolumn; lexeme=yytext(); return DUMP; }
    "ORDER" { lin=yyline; col=yycolumn; lexeme=yytext(); return ORDER; }
    "VARYING" { lin=yyline; col=yycolumn; lexeme=yytext(); return VARYING; }
    "ELSE" { lin=yyline; col=yycolumn; lexeme=yytext(); return ELSE; }
    "OUTER" { lin=yyline; col=yycolumn; lexeme=yytext(); return OUTER; }
    "VIEW" { lin=yyline; col=yycolumn; lexeme=yytext(); return VIEW; }
    "END" { lin=yyline; col=yycolumn; lexeme=yytext(); return END; }
    "OVER" { lin=yyline; col=yycolumn; lexeme=yytext(); return OVER; }
    "WAITFOR" { lin=yyline; col=yycolumn; lexeme=yytext(); return WAITFOR; }
    "ERRLVL" { lin=yyline; col=yycolumn; lexeme=yytext(); return ERRLVL; }
    "PERCENT" { lin=yyline; col=yycolumn; lexeme=yytext(); return PERCENT; }
    "WHEN" { lin=yyline; col=yycolumn; lexeme=yytext(); return WHEN; }
    "ESCAPE" { lin=yyline; col=yycolumn; lexeme=yytext(); return ESCAPE; }
    "PIVOT" { lin=yyline; col=yycolumn; lexeme=yytext(); return PIVOT; }
    "WHERE" { lin=yyline; col=yycolumn; lexeme=yytext(); return WHERE; }
    "EXCEPT" { lin=yyline; col=yycolumn; lexeme=yytext(); return EXCEPT; }
    "PLAN" { lin=yyline; col=yycolumn; lexeme=yytext(); return PLAN; }
    "WHILE" { lin=yyline; col=yycolumn; lexeme=yytext(); return WHILE; }
    "EXEC" { lin=yyline; col=yycolumn; lexeme=yytext(); return EXEC; }
    "PRECISION" { lin=yyline; col=yycolumn; lexeme=yytext(); return PRECISION; }
    "WITH" { lin=yyline; col=yycolumn; lexeme=yytext(); return WITH; }
    "EXECUTE" { lin=yyline; col=yycolumn; lexeme=yytext(); return EXECUTE; }
    "PRIMARY" { lin=yyline; col=yycolumn; lexeme=yytext(); return PRIMARY; }
    "WITHIN GROUP" { lin=yyline; col=yycolumn; lexeme=yytext(); return WITHINGROUP; }
    "EXISTS" { lin=yyline; col=yycolumn; lexeme=yytext(); return EXISTS; }
    "PRINT" { lin=yyline; col=yycolumn; lexeme=yytext(); return PRINT; }
    "WRITETEXT" { lin=yyline; col=yycolumn; lexeme=yytext(); return WRITETEXT; }
    "EXIT" { lin=yyline; col=yycolumn; lexeme=yytext(); return EXIT; }
    "PROC" { lin=yyline; col=yycolumn; lexeme=yytext(); return PROC; }
    "INCLUDE" { lin=yyline; col=yycolumn; lexeme=yytext(); return INCLUDE; }
    "IMMEDIATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return IMMEDIATE; }
    "GO" { lin=yyline; col=yycolumn; lexeme=yytext(); return GO; }
    "SUM" { lin=yyline; col=yycolumn; lexeme=yytext(); return SUM; }
    "AVG" { lin=yyline; col=yycolumn; lexeme=yytext(); return AVG; }
    "COUNT" { lin=yyline; col=yycolumn; lexeme=yytext(); return COUNT; }
    "MAX" { lin=yyline; col=yycolumn; lexeme=yytext(); return MAX; }
    "MIN" { lin=yyline; col=yycolumn; lexeme=yytext(); return MIN; }
    "KB" { lin=yyline; col=yycolumn; lexeme=yytext(); return KB; }
    "GB" { lin=yyline; col=yycolumn; lexeme=yytext(); return GB; }
    "TB" { lin=yyline; col=yycolumn; lexeme=yytext(); return TB; }
    "MB" { lin=yyline; col=yycolumn; lexeme=yytext(); return MB; }
    "BIGINT" { lin=yyline; col=yycolumn; lexeme=yytext(); return BIGINT; }
    "INT" { lin=yyline; col=yycolumn; lexeme=yytext(); return INT; }
    "SMALLINT" { lin=yyline; col=yycolumn; lexeme=yytext(); return SMALLINT; }
    "TINYINT" { lin=yyline; col=yycolumn; lexeme=yytext(); return TINYINT; }
    "BIT" { lin=yyline; col=yycolumn; lexeme=yytext(); return BIT; }
    "DECIMAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return DECIMAL; }
    "MONEY" { lin=yyline; col=yycolumn; lexeme=yytext(); return MONEY; }
    "NUMERIC" { lin=yyline; col=yycolumn; lexeme=yytext(); return NUMERIC; }
    "SMALLMONEY" { lin=yyline; col=yycolumn; lexeme=yytext(); return SMALLMONEY; }
    "FLOAT" { lin=yyline; col=yycolumn; lexeme=yytext(); return FLOAT; }
    "REAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return REAL; }
    "DATE" { lin=yyline; col=yycolumn; lexeme=yytext(); return DATE; }
    "DATETIME" { lin=yyline; col=yycolumn; lexeme=yytext(); return DATETIME; }
    "DATETIME2" { lin=yyline; col=yycolumn; lexeme=yytext(); return DATETIME2; }
    "DATETIMEOFFSET" { lin=yyline; col=yycolumn; lexeme=yytext(); return DATETIMEOFFSET; }
    "SMALLDATETIME" { lin=yyline; col=yycolumn; lexeme=yytext(); return SMALLDATETIME; }
    "TIME" { lin=yyline; col=yycolumn; lexeme=yytext(); return TIME; }
    "CHAR" { lin=yyline; col=yycolumn; lexeme=yytext(); return CHAR; }
    "TEXT" { lin=yyline; col=yycolumn; lexeme=yytext(); return TEXT; }
    "VARCHAR" { lin=yyline; col=yycolumn; lexeme=yytext(); return VARCHAR; }
    "NCHAR" { lin=yyline; col=yycolumn; lexeme=yytext(); return NCHAR; }
    "NTEXT" { lin=yyline; col=yycolumn; lexeme=yytext(); return NTEXT; }
    "NVARCHAR" { lin=yyline; col=yycolumn; lexeme=yytext(); return NVARCHAR; }
    "BINARY" { lin=yyline; col=yycolumn; lexeme=yytext(); return BINARY; }
    "IMAGE" { lin=yyline; col=yycolumn; lexeme=yytext(); return IMAGE; }
    "VARBINARY" { lin=yyline; col=yycolumn; lexeme=yytext(); return VARBINARY; }
    "FILENAME" { lin=yyline; col=yycolumn; lexeme=yytext(); return FILENAME; }
    "NAME" { lin=yyline; col=yycolumn; lexeme=yytext(); return NAME; }
    "NAMES" { lin=yyline; col=yycolumn; lexeme=yytext(); return NAMES; }
    "SIZE" { lin=yyline; col=yycolumn; lexeme=yytext(); return SIZE; }
    "MAXSIZE" { lin=yyline; col=yycolumn; lexeme=yytext(); return MAXSIZE; }
    "FILEGROWTH" { lin=yyline; col=yycolumn; lexeme=yytext(); return FILEGROWTH; }
    "UNLIMITED" { lin=yyline; col=yycolumn; lexeme=yytext(); return UNLIMITED; }
    "OUTPUT" { lin=yyline; col=yycolumn; lexeme=yytext(); return OUTPUT; }
    "INPUT" { lin=yyline; col=yycolumn; lexeme=yytext(); return INPUT; }
    "LOCAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return LOCAL; }
    "GLOBAL" { lin=yyline; col=yycolumn; lexeme=yytext(); return GLOBAL; }
    "SCROLL" { lin=yyline; col=yycolumn; lexeme=yytext(); return SCROLL; }

    {Boolean} { lin=yyline; col=yycolumn; lexeme=yytext(); return Bit; }

    "+" { lin=yyline; col=yycolumn; lexeme=yytext(); return Suma; }
    "-" { lin=yyline; col=yycolumn; lexeme=yytext(); return Resta; }
    "*" { lin=yyline; col=yycolumn; lexeme=yytext(); return Mul; }
    "/" { lin=yyline; col=yycolumn; lexeme=yytext(); return Div; }
    "%" { lin=yyline; col=yycolumn; lexeme=yytext(); return Porce; }
    ";" { lin=yyline; col=yycolumn; lexeme=yytext(); return PuntoYComa; }
    "," { lin=yyline; col=yycolumn; lexeme=yytext(); return Coma; }
    "." { lin=yyline; col=yycolumn; lexeme=yytext(); return Punto; }
    "[" { lin=yyline; col=yycolumn; lexeme=yytext(); return Acorchete; }
    "]" { lin=yyline; col=yycolumn; lexeme=yytext(); return Ccorchete; }
    "(" { lin=yyline; col=yycolumn; lexeme=yytext(); return Aparentesis; }
    ")" { lin=yyline; col=yycolumn; lexeme=yytext(); return Cparentesis; }
    "{" { lin=yyline; col=yycolumn; lexeme=yytext(); return Allave; }
    "}" { lin=yyline; col=yycolumn; lexeme=yytext(); return Cllave; }
    "[]" { lin=yyline; col=yycolumn; lexeme=yytext(); return Dcorchete; }
    "()" { lin=yyline; col=yycolumn; lexeme=yytext(); return Dparentesis; }
    "{}" { lin=yyline; col=yycolumn; lexeme=yytext(); return Dllaves; }
    "@" { lin=yyline; col=yycolumn; lexeme=yytext(); return Arroba; }
    "#" { lin=yyline; col=yycolumn; lexeme=yytext(); return Hashtag; }
    "##" { lin=yyline; col=yycolumn; lexeme=yytext(); return Dhashtag; }
    "<" { lin=yyline; col=yycolumn; lexeme=yytext(); return Menor; }
    "<=" { lin=yyline; col=yycolumn; lexeme=yytext(); return MenorIgual; }
    ">" { lin=yyline; col=yycolumn; lexeme=yytext(); return Mayor; }
    ">=" { lin=yyline; col=yycolumn; lexeme=yytext(); return MayorIgual; }
    "==" { lin=yyline; col=yycolumn; lexeme=yytext(); return Digual; }
    "!=" { lin=yyline; col=yycolumn; lexeme=yytext(); return Diferente; }
    "&&" { lin=yyline; col=yycolumn; lexeme=yytext(); return Dampersand; }
    "||" { lin=yyline; col=yycolumn; lexeme=yytext(); return Dbarra; }
    "!" { lin=yyline; col=yycolumn; lexeme=yytext(); return Exclamacion; }
    "=" { lin=yyline; col=yycolumn; lexeme=yytext(); return Igual; }

    {DecIntegerLiteral} { lin=yyline; col=yycolumn; lexeme=yytext(); return Integer; }

    {FloatLiteral} { lin=yyline; col=yycolumn; lexeme=yytext(); return Float; }

    {ErrorString} { lin=yyline; col=yycolumn; lexeme=yytext(); return VarcharError; }

    {String} { lin=yyline; col=yycolumn; lexeme=yytext(); return Varchar; }

    {ErrorComment} {/*Ignore*/}

    {Comment} {/*Ignore*/}

    {WhiteSpace}+ { /* skip */ }

    {Identifier} { lin=yyline; col=yycolumn; lexeme=yytext(); return Identificador; }

    {ErrorIdentifier} { lin=yyline; col=yycolumn; lexeme=yytext(); return IdentificadorError; }

/* error */
    . {lin=yyline; col=yycolumn; lexeme=yytext(); return ERROR;}