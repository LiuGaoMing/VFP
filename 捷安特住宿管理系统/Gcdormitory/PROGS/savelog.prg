**
PROCEDURE savelog
PARAMETER LOC, MSG
IF  .NOT. FILE("ant.log")
FP = FCREATE("ant.log")
ELSE
FP = FOPEN("ant.log", 11)
ENDIF
IF FP<0
= MESSAGEBOX("log�ļ��򿪴���", 064, "���ڷ���ϵͳ")
ENDIF
FSEEK(FP, 0, 2)
MS = DTOC(DATE())+" "+TIME()+"  "+LOC+"  "+MSG
FPUTS(FP, MS)
= FCLOSE(FP)
RETURN
ENDPROC
**
