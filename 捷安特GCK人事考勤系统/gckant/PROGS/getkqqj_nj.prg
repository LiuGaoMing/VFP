yy = pub_nd
mm = pub_yf
IF mm > 1
     mm = mm - 1
ELSE
     mm = 12
     yy = yy - 1
ENDIF
dd = sjdate2
mdate = CTOD(STR(yy, 4) + '.' +  ;
        STR(mm, 2) + '.' + STR(dd,  ;
        2))
i = 1
DO WHILE CTOD("")=mdate .AND. i<5
     dd = dd - 1
     mdate = CTOD(STR(yy, 4) +  ;
             '.' + STR(mm, 2) +  ;
             '.' + STR(dd, 2))
     i = i + 1
ENDDO
IF i >= 5
     mdate = CTOD("")
ENDIF
pub_kqjieshu = mdate
IF pub_kqjieshu < CTOD(STR(pub_nd,  ;
   4) + '/' + STR(pub_yf, 1) +  ;
   '/01')
     yy = pub_nd
     mm = pub_yf
     dd = sjdate2
     mdate = CTOD(STR(yy, 4) +  ;
             '.' + STR(mm, 2) +  ;
             '.' + STR(dd, 2))
     i = 1
     DO WHILE CTOD("")=mdate  ;
        .AND. i<5
          dd = dd - 1
          mdate = CTOD(STR(yy, 4) +  ;
                  '.' + STR(mm,  ;
                  2) + '.' +  ;
                  STR(dd, 2))
          i = i + 1
     ENDDO
     IF i >= 5
          mdate = CTOD("")
     ENDIF
     pub_kqjieshu = mdate
ENDIF
dd = sjdate1
IF ABS(sjdate2 - sjdate1) >= 30
     mdate = CTOD(STR(yy, 4) +  ;
             '.' + STR(mm, 2) +  ;
             '.' + STR(dd, 2))
ELSE
     IF mm = 1
          mdate = CTOD(STR(yy - 1,  ;
                  4) + '.' +  ;
                  STR(12, 2) +  ;
                  '.' + STR(dd,  ;
                  2))
     ELSE
          mdate = CTOD(STR(yy, 4) +  ;
                  '.' + STR(mm -  ;
                  1, 2) + '.' +  ;
                  STR(dd, 2))
     ENDIF
ENDIF
i = 1
DO WHILE CTOD("")=mdate .AND. i<5
     dd = dd - 1
     mdate = CTOD(STR(yy, 4) +  ;
             '.' + STR(mm, 2) +  ;
             '.' + STR(dd, 2))
     i = i + 1
ENDDO
IF i >= 5
     mdate = CTOD("")
ENDIF
pub_kqkaishi = mdate
ENDPROC
**
