**
FUNCTION IsTime
LPARAMETERS s
LOCAL npos
npos = AT(":", s)
IF npos = 0
     RETURN .F.
ENDIF
shour = LEFT(s, npos - 1)
IF  .NOT. isinteger(shour)
     RETURN .F.
ENDIF
sminute = SUBSTR(s, npos + 1)
IF  .NOT. isinteger(sminute)
     RETURN .F.
ENDIF
IF VAL(sminute) >= 60
     RETURN .F.
ENDIF
RETURN .T.
ENDFUNC
**
