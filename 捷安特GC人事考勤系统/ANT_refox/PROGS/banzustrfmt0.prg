**
FUNCTION BanZuStrFmt0
LPARAMETERS sin
sreturn = ""
IF LEN(sin) > 0
     ls1 = sin
     DO WHILE RIGHT(ls1, 1)="0"
          ls1 = LEFT(ls1,  ;
                LEN(ls1) - 1)
     ENDDO
     IF RIGHT(ls1, 1) = "."
          ls1 = LEFT(ls1,  ;
                LEN(ls1) - 1)
          sreturn = ls1
     ELSE
          sreturn = ls1
     ENDIF
     RETURN sreturn
ENDIF
RETURN sreturn
ENDFUNC
**
