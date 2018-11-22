gkq_yy = YEAR(DATE())
gkq_mm = MONTH(DATE())
IF gkq_mm > 1
     gkq_mm = gkq_mm - 1
ELSE
     gkq_mm = 12
     gkq_yy = gkq_yy - 1
ENDIF
gkq_dd = sjdate2
mdate = CTOD(STR(gkq_yy, 4) + '.' +  ;
        STR(gkq_mm, 2) + '.' +  ;
        STR(gkq_dd, 2))
i = 1
DO WHILE CTOD("")=mdate .AND. i<5
     gkq_dd = gkq_dd - 1
     mdate = CTOD(STR(gkq_yy, 4) +  ;
             '.' + STR(gkq_mm, 2) +  ;
             '.' + STR(gkq_dd,  ;
             2))
     i = i + 1
ENDDO
IF i >= 5
     mdate = CTOD("")
ENDIF
pub_kqjieshu = mdate
IF DATE() - pub_kqjieshu > sjdays
     gkq_yy = YEAR(DATE())
     gkq_mm = MONTH(DATE())
     gkq_dd = sjdate2
     mdate = CTOD(STR(gkq_yy, 4) +  ;
             '.' + STR(gkq_mm, 2) +  ;
             '.' + STR(gkq_dd,  ;
             2))
     i = 1
     DO WHILE CTOD("")=mdate  ;
        .AND. i<5
          gkq_dd = gkq_dd - 1
          mdate = CTOD(STR(gkq_yy,  ;
                  4) + '.' +  ;
                  STR(gkq_mm, 2) +  ;
                  '.' +  ;
                  STR(gkq_dd,  ;
                  2))
          i = i + 1
     ENDDO
     IF i >= 5
          mdate = CTOD("")
     ENDIF
     pub_kqjieshu = mdate
ENDIF
IF DATE() - pub_kqjieshu > sjdays
     gkq_yy = YEAR(pub_kqjieshu)
     gkq_mm = MONTH(pub_kqjieshu)
     IF gkq_mm < 12
          gkq_mm = gkq_mm + 1
     ELSE
          gkq_mm = 1
          gkq_yy = gkq_yy + 1
     ENDIF
     gkq_dd = sjdate2
     mdate = CTOD(STR(gkq_yy, 4) +  ;
             '.' + STR(gkq_mm, 2) +  ;
             '.' + STR(gkq_dd,  ;
             2))
     i = 1
     DO WHILE CTOD("")=mdate  ;
        .AND. i<5
          gkq_dd = gkq_dd - 1
          mdate = CTOD(STR(gkq_yy,  ;
                  4) + '.' +  ;
                  STR(gkq_mm, 2) +  ;
                  '.' +  ;
                  STR(gkq_dd,  ;
                  2))
          i = i + 1
     ENDDO
     IF i >= 5
          mdate = CTOD("")
     ENDIF
     pub_kqjieshu = mdate
ENDIF
gkq_dd = sjdate1
IF ABS(sjdate2 - sjdate1) >= 30
     mdate = CTOD(STR(gkq_yy, 4) +  ;
             '.' + STR(gkq_mm, 2) +  ;
             '.' + STR(gkq_dd,  ;
             2))
ELSE
     IF gkq_mm = 1
          mdate = CTOD(STR(gkq_yy -  ;
                  1, 4) + '.' +  ;
                  STR(12, 2) +  ;
                  '.' +  ;
                  STR(gkq_dd,  ;
                  2))
     ELSE
          mdate = CTOD(STR(gkq_yy,  ;
                  4) + '.' +  ;
                  STR(gkq_mm - 1,  ;
                  2) + '.' +  ;
                  STR(gkq_dd,  ;
                  2))
     ENDIF
ENDIF
i = 1
DO WHILE CTOD("")=mdate .AND. i<5
     gkq_dd = gkq_dd - 1
     mdate = CTOD(STR(gkq_yy, 4) +  ;
             '.' + STR(gkq_mm, 2) +  ;
             '.' + STR(gkq_dd,  ;
             2))
     i = i + 1
ENDDO
IF i >= 5
     mdate = CTOD("")
ENDIF
pub_kqkaishi = mdate
IF DATE() < pub_kqjieshu
     pub_kqjieshu = DATE()
ENDIF
ENDPROC
**
