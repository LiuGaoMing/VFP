**
FUNCTION MinutesToTime
LPARAMETERS nminutes, blocal
nhour = INT(nminutes / 60)
nminute = MOD(nminutes, 60)
IF blocal
     cresult = ALLTRIM(STR(nhour)) +  ;
               "Сʱ" +  ;
               IIF(EMPTY(nminute),  ;
               "",  ;
               ALLTRIM(STR(nminute)) +  ;
               "��")
ELSE
     cresult = ALLTRIM(STR(nhour)) +  ;
               ":" +  ;
               PADL(ALLTRIM(STR(nminute)),  ;
               2, "0")
ENDIF
RETURN cresult
ENDFUNC
**
