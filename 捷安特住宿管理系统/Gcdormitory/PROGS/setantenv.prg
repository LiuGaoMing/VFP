**
FUNCTION SetAntEnv
PARAMETER SECTION, VARIABLE, VALUE
SRET = -1
SSECTION = ALLTRIM(UPPER(SECTION))
SVARIABLE = ALLTRIM(UPPER(VARIABLE))
MAREA = LTRIM(STR(SELECT()))
IF SQLEXE_RUN(00000000015, SYS(16), "select * from sys_ini where SEC=?sSection and VAR=?sVariable", "sys")=1
DO CASE
CASE TYP='N'
SVALUE = LTRIM(STR(VALUE, 8, 2))
CASE TYP='D'
SVALUE = DTOC(VALUE)
OTHERWISE
SVALUE = ALLTRIM(VALUE)
IF LEN(SVALUE)=0
SVALUE = " "
ENDIF
ENDCASE
SRET = SQLEXE_RUN(00000000027, SYS(16), "update sys_ini set VAL=?sValue where SEC=?sSection and VAR=?sVariable", "sys")
ELSE
= MESSAGEBOX("SetAntEnv����Error��", 64, "���ڷ���ϵͳ")
ENDIF
SELECT &MAREA					
RETURN SRET
ENDFUNC
**
