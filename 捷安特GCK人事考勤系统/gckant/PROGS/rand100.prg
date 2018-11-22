**
FUNCTION rand100
PARAMETER k1, k2
nreturn = -1
IF k1 = k2
     nreturn = k1
ELSE
     DO WHILE  .NOT. (nreturn>=k1  ;
        .AND. nreturn<=k2)
          nreturn = INT(RAND() *  ;
                    100)
     ENDDO
ENDIF
RETURN nreturn
ENDFUNC
**
