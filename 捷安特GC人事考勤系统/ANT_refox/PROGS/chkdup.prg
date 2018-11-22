**
FUNCTION ChkDup
PARAMETER chkdup_conds
chkdup_ret = .F.
IF  .NOT. EOF()
     chkdup_rec = RECNO()
ELSE
     chkdup_rec = 0
ENDIF
LOCATE FOR &chkdup_conds
IF  .NOT. EOF()
     IF chkdup_rec = RECNO()
          CONTINUE
          IF  .NOT. EOF()
               chkdup_ret = .T.
          ENDIF
     ELSE
          chkdup_ret = .T.
     ENDIF
ENDIF
IF chkdup_rec > 0
     GOTO chkdup_rec
ENDIF
RETURN chkdup_ret
ENDFUNC
**
