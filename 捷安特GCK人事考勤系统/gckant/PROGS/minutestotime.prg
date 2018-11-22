**
FUNCTION MinutesToTime
LPARAMETERS nminutes, blocal
nhour = INT(nminutes / 60)
nminute = MOD(nminutes, 60)
IF blocal
     cresult = ALLTRIM(STR(nhour)) +  ;
               "Ð¡Ê±" +  ;
               IIF(EMPTY(nminute),  ;
               "",  ;
               ALLTRIM(STR(nminute)) +  ;
               "·Ö")
ELSE
     cresult = ALLTRIM(STR(nhour)) +  ;
               ":" +  ;
               PADL(ALLTRIM(STR(nminute)),  ;
               2, "0")
ENDIF
RETURN cresult
ENDFUNC
**
