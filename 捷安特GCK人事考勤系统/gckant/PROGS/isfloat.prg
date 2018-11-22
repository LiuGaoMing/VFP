**
FUNCTION IsFloat
LPARAMETERS s
LOCAL noccurs, npos, stmp
noccurs = OCCURS(".", s)
IF noccurs > 1
     RETURN .F.
ENDIF
IF noccurs = 0
     IF  .NOT. isinteger(s)
          RETURN .F.
     ELSE
          RETURN .T.
     ENDIF
ELSE
     npos = AT(".", s)
     stmp = LEFT(s, npos - 1)
     IF  .NOT. EMPTY(stmp)
          IF  .NOT.  ;
              isinteger(stmp)
               RETURN .F.
          ENDIF
     ENDIF
     stmp = SUBSTR(s, npos + 1)
     IF  .NOT. EMPTY(stmp)
          IF  .NOT.  ;
              isinteger(stmp)
               RETURN .F.
          ENDIF
     ENDIF
     RETURN .T.
ENDIF
ENDFUNC
**
