**
FUNCTION ChkCHStr
LPARAMETERS ccs_string,  ;
            ccs_stoplen
ccs_ret = LEFT(ccs_string,  ;
          ccs_stoplen)
IF ASC(SUBSTR(ccs_string,  ;
   ccs_stoplen, 1)) > 127
     ccs_cnt = 0
     FOR ccs_i = 1 TO ccs_stoplen
          IF ASC(SUBSTR(ccs_string,  ;
             ccs_i, 1)) > 127
               ccs_cnt = ccs_cnt +  ;
                         1
          ELSE
               ccs_cnt = 0
          ENDIF
     ENDFOR
     IF MOD(ccs_cnt, 2) = 1
          ccs_ret = LEFT(ccs_string,  ;
                    ccs_stoplen -  ;
                    1)
     ENDIF
ENDIF
RETURN ccs_ret
ENDFUNC
**
