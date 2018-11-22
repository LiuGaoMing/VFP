SELECT nj_sh
LOCATE FOR classid = zg.njlb
IF EOF()
     SELECT nj_0_curr
     LOOP
ENDIF
DO CASE
     CASE checkday = 0
          menddate = DATE()
          IF YEAR(menddate) <>  ;
             pub_nd .OR.  ;
             MONTH(menddate) <>  ;
             pub_yf
               menddate = CTOD(STR(pub_nd,  ;
                          4) +  ;
                          '/' +  ;
                          STR(pub_yf,  ;
                          2) +  ;
                          '/' +  ;
                          STR(sjdate2,  ;
                          2))
               IF menddate =  ;
                  CTOD("")
                    menddate = CTOD(STR(pub_nd,  ;
                               4) +  ;
                               '/' +  ;
                               STR(pub_yf,  ;
                               2) +  ;
                               '/' +  ;
                               STR(sjdate2 -  ;
                               1,  ;
                               2))
                    IF menddate =  ;
                       CTOD("")
                         menddate =  ;
                          CTOD(STR(pub_nd,  ;
                          4) +  ;
                          '/' +  ;
                          STR(pub_yf,  ;
                          2) +  ;
                          '/' +  ;
                          STR(sjdate2 -  ;
                          2, 2))
                         IF menddate =  ;
                            CTOD("")
                              menddate =  ;
                               CTOD(STR(pub_nd,  ;
                               4) +  ;
                               '/' +  ;
                               STR(pub_yf,  ;
                               2) +  ;
                               '/' +  ;
                               STR(sjdate2 -  ;
                               3,  ;
                               2))
                         ENDIF
                    ENDIF
               ENDIF
          ENDIF
     CASE checkday >= 1 .AND.  ;
          checkday <= 31
          menddate = CTOD(STR(pub_nd,  ;
                     4) + '/' +  ;
                     STR(pub_yf,  ;
                     2) + '/' +  ;
                     STR(checkday,  ;
                     2))
          IF menddate = CTOD("")
               menddate = CTOD(STR(pub_nd,  ;
                          4) +  ;
                          '/' +  ;
                          STR(pub_yf,  ;
                          2) +  ;
                          '/' +  ;
                          STR(checkday -  ;
                          1, 2))
               IF menddate =  ;
                  CTOD("")
                    IF menddate =  ;
                       CTOD("")
                         menddate =  ;
                          CTOD(STR(pub_nd,  ;
                          4) +  ;
                          '/' +  ;
                          STR(pub_yf,  ;
                          2) +  ;
                          '/' +  ;
                          STR(checkday -  ;
                          3, 2))
                    ENDIF
                    menddate = CTOD(STR(pub_nd,  ;
                               4) +  ;
                               '/' +  ;
                               STR(pub_yf,  ;
                               2) +  ;
                               '/' +  ;
                               STR(checkday -  ;
                               2,  ;
                               2))
               ENDIF
          ENDIF
     OTHERWISE
          menddate = CTOD(STR(p_nd,  ;
                     4) + '/' +  ;
                     STR(p_yf, 2) +  ;
                     '/' +  ;
                     STR(sjdate1,  ;
                     2))
ENDCASE
my2 = YEAR(menddate)
mm2 = MONTH(menddate)
md2 = DAY(menddate)
mbrith = CTOD(zg.jzsj)
my1 = YEAR(mbrith)
mm1 = MONTH(mbrith)
md1 = DAY(mbrith)
IF menddate - mbrith <= 0
     mnds = 0
     myfs = 0
ELSE
     DO CASE
          CASE mm2 = mm1 .AND.  ;
               md2 >= md1
               mnds = my2 - my1
               myfs = 0
          CASE mm2 > mm1
               mnds = my2 - my1
               IF md2 >= md1
                    myfs = mm2 -  ;
                           mm1
               ELSE
                    myfs = mm2 -  ;
                           mm1 -  ;
                           1
               ENDIF
          OTHERWISE
               mnds = my2 - my1 -  ;
                      1
               myfs = 12 - mm1 +  ;
                      mm2
               IF md2 < md1
                    myfs = myfs -  ;
                           1
               ENDIF
     ENDCASE
ENDIF
ENDPROC
**
