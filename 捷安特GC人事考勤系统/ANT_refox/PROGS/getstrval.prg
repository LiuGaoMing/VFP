**
FUNCTION GetStrVal
LPARAMETERS gsv_pfd, gsv_psgn
gsv_str = &gsv_pfd     
gsv_sgn = gsv_psgn
IF TYPE("gsv_str") = 'N'
     RETURN gsv_str
ELSE
     IF EMPTY(gsv_str)
          RETURN 0
     ELSE
          gsv_start = AT(gsv_sgn,  ;
                      gsv_str)
          gsv_len = LEN(ALLTRIM(gsv_str))
          IF gsv_start = 0
               gsv_ret = 0
          ELSE
               gsv_str1 = SUBSTR(gsv_str,  ;
                          gsv_start,  ;
                          255)
               gsv_end = AT(',',  ;
                         gsv_str1)
               IF gsv_end > 0
                    gsv_ret = VAL(SUBSTR(gsv_str1,  ;
                              2,  ;
                              gsv_end -  ;
                              1))
               ELSE
                    gsv_ret = VAL(SUBSTR(gsv_str1,  ;
                              2,  ;
                              255))
               ENDIF
          ENDIF
     ENDIF
ENDIF
RETURN gsv_ret
ENDFUNC
**
