**
FUNCTION GETSYSQX
PARAMETER MODE
IF PUB_BANBEN="��ʾ��"
RETURN "true"
ENDIF
RESULT = "false"
IF SQLEXE_RUN(00000000022, SYS(16), "select * from sys_user where name=?pub_user", "sys")<>1
RESULT = "false"
ENDIF
SELECT SYS
IF EOF()
RESULT = "false"
ENDIF
DO CASE
CASE MODE="kq"
IF SYS.KQ>0
RESULT = "true"
ENDIF
CASE MODE="rs"
IF SYS.RS>0
RESULT = "true"
ENDIF
CASE MODE="gz"
IF SYS.GZ>0
RESULT = "true"
ENDIF
CASE MODE="ft"
IF SYS.FT>0
RESULT = "true"
ENDIF
CASE MODE="tools"
IF SYS.TOOL>0
RESULT = "true"
ENDIF
OTHERWISE
RESULT = "false"
ENDCASE
USE
RETURN RESULT
ENDFUNC
**
