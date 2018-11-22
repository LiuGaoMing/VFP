**
FUNCTION GetAntEnv
PARAMETER section, variable
sret = ""
ssection = ALLTRIM(UPPER(section))
svariable = ALLTRIM(UPPER(variable))
marea = LTRIM(STR(SELECT()))
IF sqlexe_run(00000000014,  ;
   SYS(16),  ;
   "select * from sys_ini where SEC=?ssection and VAR=?sVariable",  ;
   "sys") = 1
     SELECT sys
     IF  .NOT. EOF()
          DO CASE
               CASE typ = 'N'
                    sret = VAL(sys.val)
               CASE typ = 'D'
                    sret = CTOD(sys.val)
               OTHERWISE
                    sret = TRIM(sys.val)
          ENDCASE
     ENDIF
     USE
ELSE
     = MESSAGEBOX("GetAntEnv函数Error！",  ;
       64, "考勤分析系统")
ENDIF
select &marea					
RETURN sret
ENDFUNC
**
