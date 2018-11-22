sjdate1 = getantenv("3AGZ",  ;
          "SYSGZSDATE")
sjdate2 = getantenv("3AGZ",  ;
          "SYSGZEDATE")
yy = pub_year
mm = pub_month
dd = sjdate2
k = CTOD(STR(yy, 4) + '.' +  ;
    STR(mm, 2) + '.' + STR(dd,  ;
    2)) + 3
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
pub_gzjieshu = mdate
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
pub_gzkaishi = mdate
ENDPROC
**
