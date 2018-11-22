**
FUNCTION BanZuStrCpu
LPARAMETERS sbzin1, sbzin2
sreturn = ""
IF banzustrchk(sbzin1) <> 1
     RETURN ""
ENDIF
IF banzustrchk(sbzin2) <> 1
     RETURN ""
ENDIF
sbzin1 = ALLTRIM(sbzin1)
sbzin2 = ALLTRIM(sbzin2)
DIMENSION narrbz(26)
FOR n = 1 TO 26
     narrbz(n) = 0
ENDFOR
lsremainstr = sbzin1
DO WHILE LEN(lsremainstr)>0
     lsvn = UPPER(LEFT(lsremainstr,  ;
            1))
     lsremainstr = RIGHT(lsremainstr,  ;
                   LEN(lsremainstr) -  ;
                   1)
     FOR i = 1 TO  ;
         LEN(lsremainstr)
          IF UPPER(SUBSTR(lsremainstr,  ;
             i, 1)) $  ;
             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
               lsval = LEFT(lsremainstr,  ;
                       i - 1)
               lsremainstr = RIGHT(lsremainstr,  ;
                             LEN(lsremainstr) -  ;
                             i +  ;
                             1)
               narrbz(ASC(lsvn) -  ;
                     65 + 1) =  ;
                     narrbz(ASC(lsvn) -  ;
                     65 + 1) +  ;
                     VAL(lsval)
               EXIT
          ELSE
               IF i >=  ;
                  LEN(lsremainstr)
                    narrbz(ASC(lsvn) -  ;
                          65 + 1) =  ;
                          narrbz(ASC(lsvn) -  ;
                          65 + 1) +  ;
                          VAL(lsremainstr)
                    lsremainstr =  ;
                     ""
                    EXIT
               ENDIF
          ENDIF
     ENDFOR
ENDDO
lsremainstr = sbzin2
DO WHILE LEN(lsremainstr)>0
     lsvn = UPPER(LEFT(lsremainstr,  ;
            1))
     lsremainstr = RIGHT(lsremainstr,  ;
                   LEN(lsremainstr) -  ;
                   1)
     FOR i = 1 TO  ;
         LEN(lsremainstr)
          IF UPPER(SUBSTR(lsremainstr,  ;
             i, 1)) $  ;
             "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
               lsval = LEFT(lsremainstr,  ;
                       i - 1)
               lsremainstr = RIGHT(lsremainstr,  ;
                             LEN(lsremainstr) -  ;
                             i +  ;
                             1)
               narrbz(ASC(lsvn) -  ;
                     65 + 1) =  ;
                     narrbz(ASC(lsvn) -  ;
                     65 + 1) +  ;
                     VAL(lsval)
               EXIT
          ELSE
               IF i >=  ;
                  LEN(lsremainstr)
                    narrbz(ASC(lsvn) -  ;
                          65 + 1) =  ;
                          narrbz(ASC(lsvn) -  ;
                          65 + 1) +  ;
                          VAL(lsremainstr)
                    lsremainstr =  ;
                     ""
                    EXIT
               ENDIF
          ENDIF
     ENDFOR
ENDDO
lsmsg = ""
lsret = ""
FOR n = 1 TO 26
     IF narrbz(n) > 0
          lsret = lsret + CHR(65 +  ;
                  n - 1) +  ;
                  banzustrfmt0(ALLTRIM(STR(narrbz(n),  ;
                  12, 4)))
     ENDIF
ENDFOR
sreturn = lsret
RETURN sreturn
ENDFUNC
**
