**
FUNCTION TableIsExist
PARAMETER tablename
SQLTABLES(odbc_ant2000, "'TABLE'",  ;
         "TableList")
SELECT COUNT(*) AS tablecount  ;
       FROM TableList WHERE  ;
       UPPER(ALLTRIM(table_name)) ==  ;
       UPPER(tablename) INTO  ;
       CURSOR tmp_count
mtablecount = tablecount
SELECT tablelist
USE
SELECT tmp_count
USE
IF mtablecount = 0
     RETURN .F.
ELSE
     RETURN .T.
ENDIF
ENDFUNC
**
