DIMENSION bcmark1(bctabbou),  ;
          bcmark2(bctabbou),  ;
          bcmark3(bctabbou),  ;
          bcmark4(bctabbou)
SELECT ardata_
IF EOF()
     RETURN
ENDIF
v_rec = RECNO()
GOTO v_rec
SET RELATION TO zgbh INTO 3
GOTO TOP
DO WHILE  .NOT. EOF()
     mrec = RECNO()
     mzgbh = zgbh
     mdate = date
     IF getbctab_() < 1
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate=date
               SKIP
          ENDDO
          IF EOF()
               EXIT
          ENDIF
          LOOP
     ENDIF
     FOR i = 1 TO bctabcnt
          bcmark1(i) = 9999
          bcmark2(i) = 9999
          bcmark3(i) = 0
          bcmark4(i) = 0
     ENDFOR
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        date
          mdelta1 = 9999
          j = 0
          FOR i = 1 TO bctabcnt
               mdelta2 = IIF(time >=  ;
                         bctabsb(i),  ;
                         time -  ;
                         bctabsb(i),  ;
                         1440 +  ;
                         time -  ;
                         bctabsb(i))
               mdelta3 = IIF(bctabsb(i) >=  ;
                         time,  ;
                         bctabsb(i) -  ;
                         time,  ;
                         1440 +  ;
                         bctabsb(i) -  ;
                         time)
               mdelta4 = IIF(mdelta2 >  ;
                         mdelta3,  ;
                         mdelta3,  ;
                         mdelta2)
               mdelta2 = IIF(time >=  ;
                         bctabxb(i),  ;
                         time -  ;
                         bctabxb(i),  ;
                         1440 +  ;
                         time -  ;
                         bctabxb(i))
               mdelta3 = IIF(bctabxb(i) >=  ;
                         time,  ;
                         bctabxb(i) -  ;
                         time,  ;
                         1440 +  ;
                         bctabxb(i) -  ;
                         time)
               mdelta5 = IIF(mdelta2 >  ;
                         mdelta3,  ;
                         mdelta3,  ;
                         mdelta2)
               IF mdelta4 <  ;
                  mdelta5
                    IF mdelta1 >  ;
                       mdelta4
                         mdelta1 =  ;
                          mdelta4
                         j = -1 *  ;
                              i
                    ENDIF
               ELSE
                    IF mdelta1 >  ;
                       mdelta5
                         mdelta1 =  ;
                          mdelta5
                         j = i
                    ENDIF
               ENDIF
          ENDFOR
          IF mdelta1 < 9999
               IF j < 0 .AND.  ;
                  bcmark1(ABS(j)) >  ;
                  mdelta1
                    bcmark1(ABS(j)) =  ;
                           mdelta1
                    bcmark3(ABS(j)) =  ;
                           RECNO()
               ENDIF
               IF j > 0 .AND.  ;
                  bcmark2(j) >  ;
                  mdelta1
                    bcmark2(j) =  ;
                           mdelta1
                    bcmark4(j) =  ;
                           RECNO()
               ENDIF
          ENDIF
          SKIP
     ENDDO
     GOTO mrec
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        date
          mflag = .F.
          FOR i = 1 TO bctabcnt
               IF bcmark3(i) =  ;
                  RECNO() .OR.  ;
                  bcmark4(i) =  ;
                  RECNO()
                    mflag = .T.
                    EXIT
               ENDIF
          ENDFOR
          IF  .NOT. mflag
               DELETE
          ENDIF
          SKIP
     ENDDO
ENDDO
SELECT 1
RELEASE bcmark1, bcmark2, bcmark3
RETURN
ENDPROC
**
FUNCTION GetBcTab_
bctabcnt = 0
v_ksbc = ALLTRIM(c.ksbc)
mbc = LEFT(v_ksbc, IIF(AT(",",  ;
      v_ksbc) = 0, 3, AT(",",  ;
      v_ksbc) - 1))
v_ksbc = RIGHT(v_ksbc,  ;
         LEN(v_ksbc) - LEN(mbc) -  ;
         1)
SELECT 2
DO WHILE  .NOT. EMPTY(mbc)
     SEEK mbc 
     DO WHILE  .NOT. EOF() .AND.  ;
        bc=mbc
          bctabcnt = bctabcnt + 1
          IF bctabcnt > bctabbou
               RETURN -1
          ENDIF
          bctabsb(bctabcnt) =  ;
                 sbsj
          bctabxb(bctabcnt) =  ;
                 xbsj
          SKIP
     ENDDO
     mbc = LEFT(v_ksbc, IIF(AT( ;
           ",", v_ksbc) = 0, 3,  ;
           AT(",", v_ksbc) - 1))
     v_ksbc = RIGHT(v_ksbc,  ;
              LEN(v_ksbc) -  ;
              LEN(mbc) - 1)
ENDDO
SELECT 1
RETURN bctabcnt
ENDFUNC
**
