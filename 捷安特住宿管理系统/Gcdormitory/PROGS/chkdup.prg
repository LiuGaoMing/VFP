**
FUNCTION ChkDup
PARAMETER CHKDUP_CONDS
CHKDUP_RET = .F.
IF  .NOT. EOF()
CHKDUP_REC = RECNO()
ELSE
CHKDUP_REC = 0
ENDIF
LOCATE FOR &CHKDUP_CONDS
IF  .NOT. EOF()
IF CHKDUP_REC=RECNO()
CONTINUE
IF  .NOT. EOF()
CHKDUP_RET = .T.
ENDIF
ELSE
CHKDUP_RET = .T.
ENDIF
ENDIF
IF CHKDUP_REC>0
GOTO CHKDUP_REC
ENDIF
RETURN CHKDUP_RET
ENDFUNC
**
