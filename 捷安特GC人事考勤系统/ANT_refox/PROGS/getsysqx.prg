**
FUNCTION GETSYSQX
PARAMETER mode
IF pub_banben = "ÑÝÊ¾°æ"
     RETURN "true"
ENDIF
result = "false"
IF sqlexe_run(00000000022,  ;
   SYS(16),  ;
   "select * from sys_user where name=?pub_user",  ;
   "sys") <> 1
     result = "false"
ENDIF
SELECT sys
IF EOF()
     result = "false"
ENDIF
DO CASE
     CASE mode = "kq"
          IF sys.kq > 0
               result = "true"
          ENDIF
     CASE mode = "rs"
          IF sys.rs > 0
               result = "true"
          ENDIF
     CASE mode = "gz"
          IF sys.gz > 0
               result = "true"
          ENDIF
     CASE mode = "ft"
          IF sys.ft > 0
               result = "true"
          ENDIF
     CASE mode = "tools"
          IF sys.tool > 0
               result = "true"
          ENDIF
     OTHERWISE
          result = "false"
ENDCASE
USE
RETURN result
ENDFUNC
**
