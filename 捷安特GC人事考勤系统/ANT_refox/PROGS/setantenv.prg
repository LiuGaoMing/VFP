**
FUNCTION SetAntEnv
PARAMETER section, variable,  ;
          value
sret = -1
ssection = ALLTRIM(UPPER(section))
svariable = ALLTRIM(UPPER(variable))
marea = LTRIM(STR(SELECT()))
IF sqlexe_run(00000000015,  ;
   SYS(16),  ;
   "select * from sys_ini where SEC=?sSection and VAR=?sVariable",  ;
   "sys") = 1
     DO CASE
          CASE typ = 'N'
               svalue = LTRIM(STR(value,  ;
                        8, 2))
          CASE typ = 'D'
               svalue = DTOC(value)
          OTHERWISE
               svalue = ALLTRIM(value)
               IF LEN(svalue) = 0
                    svalue = " "
               ENDIF
     ENDCASE
     IF  .NOT. EOF()
          sret = sqlexe_run(00000000029,  ;
                 SYS(16),  ;
                 "update sys_ini set VAL=?sValue where SEC=?sSection and VAR=?sVariable",  ;
                 "sys")
     ELSE
          sret = sqlexe_run(00000000031,  ;
                 SYS(16),  ;
                 "insert into sys_ini (SEC,VAR,VAL) values (?sSection,?sVariable,?sValue)",  ;
                 "sys")
     ENDIF
ELSE
     = MESSAGEBOX("SetAntEnv函数Error！",  ;
       64, "考勤分析系统")
ENDIF
select &marea					
RETURN sret
ENDFUNC
**
