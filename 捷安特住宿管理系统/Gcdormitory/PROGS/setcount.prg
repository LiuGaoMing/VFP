**
PROCEDURE SetCount
PARAMETER SETCOUNT_XUHAO, SETCOUNT_JISHUQI
IF SETCOUNT_JISHUQI>0
= SQLEXE_RUN(00000000009, SYS(16), "update sys_counter set jishuqi=?SetCount_JiShuQi,flag=' ' where xuhao=?SetCount_XuHao", "")
ELSE
= SQLEXE_RUN(00000000011, SYS(16), "update sys_counter set flag=' ' where xuhao=?SetCount_XuHao", "")
ENDIF
RETURN
ENDPROC
**
