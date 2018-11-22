**
FUNCTION GetShift
LPARAMETERS gs_sdate, gs_edate
FOR gs_i = 1 TO shiftmax
     shifttype(gs_i) = ""
     shiftbegin(gs_i) = CTOD("")
     shiftend(gs_i) = CTOD("")
     shiftattr(gs_i) = 0
ENDFOR
shiftcount = 0
v_ksbc = ALLTRIM(zg.ksbc)
DO WHILE .T.
     IF EMPTY(v_ksbc) .OR.  ;
        shiftcount >= shiftmax
          EXIT
     ENDIF
     shiftcount = shiftcount + 1
     mat1 = AT(",", v_ksbc)
     mbc = LEFT(v_ksbc, IIF(mat1 =  ;
           0, LEN(v_ksbc), mat1 -  ;
           1))
     mat2 = AT("(", mbc)
     shifttype(shiftcount) =  ;
              LEFT(mbc, IIF(mat2 =  ;
              0, LEN(mbc), mat2 -  ;
              1))
     mbc = RIGHT(mbc, LEN(mbc) -  ;
           mat2)
     mat3 = AT("-", mbc)
     IF mat3 = 0
          mat3 = AT(")", mbc)
          IF mat3 > 0
               mbc = LEFT(mbc,  ;
                     mat3 - 1)
          ENDIF
          IF CTOD(mbc) <>  ;
             CTOD("")
               shiftbegin(shiftcount) =  ;
                         CTOD(mbc)
               shiftend(shiftcount) =  ;
                       CTOD(mbc)
               shiftattr(shiftcount) =  ;
                        2
          ENDIF
     ELSE
          IF LEN(mbc) < 15
               mbc = LEFT(mbc,  ;
                     mat3 - 1)
               IF CTOD(mbc) <>  ;
                  CTOD("")
                    shiftbegin(shiftcount) =  ;
                              CTOD(mbc)
                    shiftattr(shiftcount) =  ;
                             1
               ENDIF
          ELSE
               mbc1 = LEFT(mbc,  ;
                      mat3 - 1)
               IF CTOD(mbc1) <>  ;
                  CTOD("")
                    mat4 = AT(")",  ;
                           mbc)
                    IF mat4 > 0
                         mbc2 = SUBSTR(mbc,  ;
                                mat3 +  ;
                                1,  ;
                                mat4 -  ;
                                mat3 -  ;
                                1)
                         IF CTOD(mbc2) <>  ;
                            CTOD("")
                              shiftbegin(shiftcount) =  ;
                               CTOD(mbc1)
                              shiftend(shiftcount) =  ;
                               CTOD(mbc2)
                              shiftattr(shiftcount) =  ;
                               2
                         ENDIF
                    ENDIF
               ENDIF
          ENDIF
     ENDIF
     IF mat1 > 0
          v_ksbc = SUBSTR(v_ksbc,  ;
                   mat1 + 1,  ;
                   254)
     ELSE
          v_ksbc = ""
     ENDIF
ENDDO
gs_i = 1
gs_normal = 0
DO WHILE gs_i<=shiftcount
     IF shiftbegin(gs_i) =  ;
        CTOD("")
          shiftbegin(gs_i) =  ;
                    gs_sdate
     ENDIF
     IF shiftend(gs_i) = CTOD("")
          shiftend(gs_i) =  ;
                  gs_edate
     ENDIF
     IF shiftattr(gs_i) = 0 .AND.  ;
        gs_normal = 0
          gs_normal = 1
          gs_i = gs_i + 1
     ELSE
          IF shiftattr(gs_i) = 0
               FOR gs_j = gs_i TO  ;
                   shiftcount -  ;
                   1
                    shifttype(gs_j) =  ;
                             shifttype(gs_j +  ;
                             1)
                    shiftbegin(gs_j) =  ;
                              shiftbegin(gs_j +  ;
                              1)
                    shiftend(gs_j) =  ;
                            shiftend(gs_j +  ;
                            1)
                    shiftattr(gs_j) =  ;
                             shiftattr(gs_j +  ;
                             1)
               ENDFOR
               shiftcount = shiftcount -  ;
                            1
          ELSE
               gs_i = gs_i + 1
          ENDIF
     ENDIF
ENDDO
FOR gs_i = 1 TO shiftcount - 1
     FOR gs_j = gs_i TO  ;
         shiftcount
          IF shiftattr(gs_j) >  ;
             shiftattr(gs_i)
               gs_shifttype = shifttype(gs_i)
               gs_shiftbegin = shiftbegin(gs_i)
               gs_shiftend = shiftend(gs_i)
               gs_shiftattr = shiftattr(gs_i)
               shifttype(gs_i) =  ;
                        shifttype(gs_j)
               shiftbegin(gs_i) =  ;
                         shiftbegin(gs_j)
               shiftend(gs_i) =  ;
                       shiftend(gs_j)
               shiftattr(gs_i) =  ;
                        shiftattr(gs_j)
               shifttype(gs_j) =  ;
                        gs_shifttype
               shiftbegin(gs_j) =  ;
                         gs_shiftbegin
               shiftend(gs_j) =  ;
                       gs_shiftend
               shiftattr(gs_j) =  ;
                        gs_shiftattr
          ENDIF
     ENDFOR
ENDFOR
RETURN shiftcount
ENDFUNC
**
