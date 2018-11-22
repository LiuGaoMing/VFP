**
FUNCTION GetMinutes
LPARAMETERS s
LOCAL npos
npos = AT(":", s)
IF npos = 0
     RETURN -1
ENDIF
shour = LEFT(s, npos - 1)
IF  .NOT. isinteger(shour)
     RETURN -1
ENDIF
IF VAL(shour) >= 48
     RETURN -1
ENDIF
sminute = SUBSTR(s, npos + 1)
IF  .NOT. isinteger(sminute)
     RETURN -1
ENDIF
IF VAL(sminute) >= 60
     RETURN -1
ENDIF
nresult = VAL(shour) * 60 +  ;
          VAL(sminute)
IF nresult = 0
     nresult = 1
ENDIF
RETURN nresult
ENDFUNC
**
