**
PROCEDURE savelog
PARAMETER LOC, MSG
IF  .NOT. FILE("ant.log")
FP = FCREATE("ant.log")
ELSE
FP = FOPEN("ant.log", 11)
ENDIF
IF FP<0
= MESSAGEBOX("log文件打开错误。", 064, "考勤分析系统")
ENDIF
FSEEK(FP, 0, 2)
MS = DTOC(DATE())+" "+TIME()+"  "+LOC+"  "+MSG
FPUTS(FP, MS)
= FCLOSE(FP)
RETURN
ENDPROC
**
