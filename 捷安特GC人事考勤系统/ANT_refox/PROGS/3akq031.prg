DO prginit
DO WHILE  .NOT. pub_escape .AND.   ;
   .NOT. EOF()
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                DTOC(mdate)
     IF EMPTY(mzgbh)
          SKIP
          mzgbh = zgbh
          mdate = CTOD(riqi) - 1
          recptr = RECNO()
          LOOP
     ENDIF
     m = getbctab()
     DO CASE
          CASE m = 0
               DO skipnext
               LOOP
          CASE m = -1
               = MESSAGEBOX( ;
                 "个人可上班次定义太多 " +  ;
                 TRIM(mzgbh), 064,  ;
                 "考勤分析系统")
               RELEASE sktabbou,  ;
                       sktabsel,  ;
                       sktabcnt,  ;
                       bctabbou,  ;
                       bctabsel,  ;
                       bctabcnt,  ;
                       addedflagtab
               RELEASE sktab,  ;
                       bctabbh,  ;
                       bctabsb,  ;
                       bctabxb,  ;
                       bctabss,  ;
                       bctablb,  ;
                       bctabcl,  ;
                       pub_12h,  ;
                       pub_bctabsel,  ;
                       pub_flag1,  ;
                       pub_flag2,  ;
                       pub_delta1,  ;
                       pub_delta2
               RELEASE delta2,  ;
                       delta3,  ;
                       delta4,  ;
                       delta8,  ;
                       delta9,  ;
                       delta9max,  ;
                       mzgbh,  ;
                       mdate
               RELEASE clbc, dsb,  ;
                       dxb, dlb,  ;
                       dxx, dss,  ;
                       dmark,  ;
                       wtsb1,  ;
                       wtxb1,  ;
                       wtsb2,  ;
                       wtxb2
               RELEASE mdate5
               RELEASE gs_entry,  ;
                       gs_recno
               RELEASE i_jbdelta,  ;
                       i_jbdelta1,  ;
                       i_qjdelta
               RELEASE itwo,  ;
                       ithree,  ;
                       imode
               RELEASE idengji,  ;
                       idengji1,  ;
                       pub_menjin
               RELEASE pub_lastdate,  ;
                       pub_lastbc,  ;
                       modisk_1440_sb,  ;
                       modisk_1440_xb
               RELEASE pub_jbss,  ;
                       pub_jblb,  ;
                       pub_jbks,  ;
                       pub_jbjs,  ;
                       pub_jbbc,  ;
                       pub_jbbcks,  ;
                       pub_jbbcjs,  ;
                       pub_jbbcss,  ;
                       pub_jbqj_no
               RELEASE pub_qjss,  ;
                       pub_qjlb,  ;
                       pub_qjks,  ;
                       pub_qjjs,  ;
                       pub_qjbc,  ;
                       pub_qjbcks,  ;
                       pub_qjbcjs,  ;
                       pub_qjbcss
               RELEASE pub_cqss,  ;
                       pub_cqks,  ;
                       pub_cqjs,  ;
                       pub_cqbc,  ;
                       pub_cqbcks,  ;
                       pub_cqbcjs,  ;
                       pub_cqbcss
               SET ESCAPE OFF
               RETURN
     ENDCASE
     IF mdate > pub_jieshuriqi
          DO skipnext
          LOOP
     ENDIF
     IF pub_menjin = "YES"
          DO 3AKQ0311
     ENDIF
     IF mdate < CTOD(riqi)
          SELECT xjjl_d
          SET EXACT OFF
          SEEK mzgbh +  ;
               DTOC(mdate) 
          SET EXACT ON
          IF  .NOT. EOF() .AND.  ;
              kqlb >= 93 .AND.  ;
              kqlb <= 94 .AND.  ;
              kssj > 0
               SELECT ardata_
               APPEND BLANK
               REPLACE zgbh WITH  ;
                       xjjl_d.zgbh,  ;
                       riqi WITH  ;
                       xjjl_d.riqi,  ;
                       shijian  ;
                       WITH  ;
                       xjjl_d.kssj
               recptr = RECNO()
               IF xjjl_d.jssj > 0
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.jssj
                    IF xjjl_d.jssj >=  ;
                       xjjl_d.kssj
                         REPLACE riqi  ;
                                 WITH  ;
                                 xjjl_d.riqi
                    ELSE
                         REPLACE riqi  ;
                                 WITH  ;
                                 DTOC(CTOD(xjjl_d.riqi) +  ;
                                 1)
                    ENDIF
               ENDIF
               GOTO recptr
          ENDIF
     ENDIF
     DO getjbqj
     DO getsktab
     DO skproc
     DO setmark
ENDDO
DO prgterm
RETURN
ENDPROC
**
PROCEDURE PrgInit
IF pub_language
     obj_form4.txt_msg.value = "Be loading the datas,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在加载考勤关联资料，请等待..."
ENDIF
PUBLIC sktabbou, sktabsel,  ;
       sktabcnt, bctabbou,  ;
       bctabsel, bctabcnt,  ;
       pub_12h, pub_bctabsel,  ;
       pub_flag1, pub_flag2,  ;
       pub_delta1, pub_delta2
PUBLIC itwo, ithree, imode
PUBLIC idengji, idengji1
sktabbou = 10
bctabbou = 30
PUBLIC sktab(sktabbou),  ;
       bztab(sktabbou),  ;
       bctabbh(bctabbou),  ;
       addedflagtab(bctabbou)
PUBLIC bctabsb(bctabbou),  ;
       bctabxb(bctabbou),  ;
       bctabss(bctabbou),  ;
       bctablb(bctabbou),  ;
       bctabcl(bctabbou)
PUBLIC delta0, delta2, delta3,  ;
       delta4, delta8, delta9,  ;
       delta9max, wtsb1, wtxb1,  ;
       wtsb2, wtxb2, mzgbh, mdate,  ;
       recptr, tabptr, mdate1
PUBLIC clbc(bctabbou),  ;
       dsb(bctabbou),  ;
       dxb(bctabbou),  ;
       dlb(bctabbou),  ;
       dxx(bctabbou),  ;
       dss(bctabbou),  ;
       dmark(bctabbou)
PUBLIC mdate5
PUBLIC gs_entry, gs_recno
PUBLIC i_jbdelta, i_jbdelta1,  ;
       i_qjdelta, pub_menjin
PUBLIC pub_lastdate, pub_lastbc,  ;
       modisk_1440_sb,  ;
       modisk_1440_xb
PUBLIC pub_jbss(3, 3), pub_jblb(3,  ;
       3), pub_jbks(3, 3),  ;
       pub_jbjs(3, 3), pub_jbbc(3,  ;
       3), pub_jbbcks(3, 3),  ;
       pub_jbbcjs(3, 3),  ;
       pub_jbbcss(3, 3)
PUBLIC pub_qjss(3, 3), pub_qjlb(3,  ;
       3), pub_qjks(3, 3),  ;
       pub_qjjs(3, 3), pub_qjbc(3,  ;
       3), pub_qjbcks(3, 3),  ;
       pub_qjbcjs(3, 3),  ;
       pub_qjbcss(3, 3)
PUBLIC pub_cqss(3, 3), pub_cqks(3,  ;
       3), pub_cqjs(3, 3),  ;
       pub_cqbc(3, 3),  ;
       pub_cqbcks(3, 3),  ;
       pub_cqbcjs(3, 3),  ;
       pub_cqbcss(3, 3)
PUBLIC pub_jbqj_no
pub_lastdate = CTOD("")
pub_lastbc = ""
i_qjdelta = 60
gs_entry = 0
gs_recno = 0
mdate5 = CTOD("")
mdate = CTOD("")
pub_escape = .F.
mquan = 0
delta0 = getantenv("FXPARA",  ;
         "DELTA0")
delta2 = getantenv("FXPARA",  ;
         "DELTA2")
delta3 = getantenv("FXPARA",  ;
         "DELTA3")
delta4 = getantenv("FXPARA",  ;
         "DELTA4")
wtsb1 = getantenv("FXPARA",  ;
        "WTSB1")
wtxb1 = getantenv("FXPARA",  ;
        "WTXB1")
wtsb2 = getantenv("FXPARA",  ;
        "WTSB2")
wtxb2 = getantenv("FXPARA",  ;
        "WTXB2")
delta8 = 360
delta9 = 0.3 
delta9max = 120
pub_menjin = getantenv("FXPARA",  ;
             "MENJIN")
strsql = "SELECT * from kq_ZG WHERE " +  ;
         STRTRAN(str_bmbh, "@",  ;
         "BMBH") +  ;
         STRTRAN(pub_zgbh_filter,  ;
         "@", "kq_zg")
sqlexe_run((00000000153), SYS(16),  ;
          strsql, "zg")
SELECT zg
INDEX ON zgbh TO zg
sqlexe_run((00000000157), SYS(16),  ;
          "select * from kq_BcType where lb<>' '",  ;
          "BcType")
SELECT bctype
INDEX ON lb TAG lb
sqlexe_run((00000000161), SYS(16),  ;
          "select * from kq_time",  ;
          "time")
SELECT time
INDEX ON bc TO time
sqlexe_run((00000000165), SYS(16),  ;
          "select * from kq_time where bc<>' '",  ;
          "bctmp")
SELECT bctmp
INDEX ON bc TO bctmp
ndate = DTOC(pub_kaishiriqi)
kdate = DTOC(pub_jieshuriqi)
strsql = "select distinct kq_xjjl_d.ID,kq_xjjl_d.ZGBH,kq_xjjl_d.RIQI,kq_xjjl_d.KQLB,kq_xjjl_d.BC,kq_xjjl_d.SS,kq_xjjl_d.TS,kq_xjjl_d.JBATTR,kq_xjjl_d.KSSJ,kq_xjjl_d.JSSJ"
strsql = strsql +  ;
         ",0 as mark from kq_xjjl_d,kq_zg where kq_xjjl_d.RIQI>=?ndate and kq_xjjl_d.RIQI<=?kdate"
strsql = strsql +  ;
         " and kq_xjjl_d.zgbh=kq_zg.zgbh and " +  ;
         STRTRAN(str_bmbh, "@",  ;
         "kq_zg.BMBH")
strsql = strsql +  ;
         STRTRAN(pub_zgbh_filter,  ;
         "@", "kq_xjjl_d")
sqlexe_run((00000000177), SYS(16),  ;
          strsql, "xjjl_d")
SELECT xjjl_d
INDEX ON zgbh + riqi TO XJJL_D
DO preprocess
SET ESCAPE ON
ON ESCAPE DO P_ESC		
IF pub_language
     obj_form4.txt_msg.value = "Be processing the time records,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在处理考勤刷卡数据，请等待..."
ENDIF
RETURN
ENDPROC
**
PROCEDURE PrgTerm
IF  .NOT. pub_escape
     obj_form4.txt_msg1.value = ""
     IF pub_language
          obj_form4.txt_msg.value =  ;
           "It is ready for analysis,please wait a minute..."
     ELSE
          obj_form4.txt_msg.value =  ;
           "正在进行分析准备工作，请等待..."
     ENDIF
     DO savecl1
     DO savecl2
     SELECT ardata_
     COPY TO ardata
     USE ardata ALIAS ardata IN 0
     SELECT ardata
     INDEX ON zgbh + riqi +  ;
           STR(shijian, 4) TO  ;
           ARDATA
     SCAN
          IF EMPTY(donedate)  ;
             .AND. CTOD(riqi) <  ;
             pub_jieshuriqi
               REPLACE donedate  ;
                       WITH riqi
          ENDIF
     ENDSCAN
ENDIF
RELEASE sktabbou, sktabsel,  ;
        sktabcnt, bctabbou,  ;
        bctabsel, bctabcnt,  ;
        addedflagtab
RELEASE sktab, bctabbh, bctabsb,  ;
        bctabxb, bctabss, bctablb,  ;
        bctabcl, pub_12h,  ;
        pub_bctabsel, pub_flag1,  ;
        pub_flag2, pub_delta1,  ;
        pub_delta2
RELEASE delta2, delta3, delta4,  ;
        delta8, delta9, delta9max,  ;
        mzgbh, mdate
RELEASE clbc, dsb, dxb, dlb, dxx,  ;
        dss, dmark, wtsb1, wtxb1,  ;
        wtsb2, wtxb2
RELEASE mdate5
RELEASE gs_entry, gs_recno
RELEASE i_jbdelta, i_jbdelta1,  ;
        i_qjdelta
RELEASE itwo, ithree, imode
RELEASE idengji, idengji1,  ;
        pub_menjin
RELEASE pub_lastdate, pub_lastbc,  ;
        modisk_1440_sb,  ;
        modisk_1440_xb
RELEASE pub_jbss, pub_jblb,  ;
        pub_jbks, pub_jbjs,  ;
        pub_jbbc, pub_jbbcks,  ;
        pub_jbbcjs, pub_jbbcss,  ;
        pub_jbqj_no
RELEASE pub_qjss, pub_qjlb,  ;
        pub_qjks, pub_qjjs,  ;
        pub_qjbc, pub_qjbcks,  ;
        pub_qjbcjs, pub_qjbcss
RELEASE pub_cqss, pub_cqks,  ;
        pub_cqjs, pub_cqbc,  ;
        pub_cqbcks, pub_cqbcjs,  ;
        pub_cqbcss
SELECT ardata_
USE
SET ESCAPE OFF
SET EXACT OFF
RETURN
ENDPROC
**
FUNCTION GetBcTab
bctabcnt = 0
v_ksbc = ALLTRIM(zg.ksbc)
mbc = LEFT(v_ksbc, IIF(AT(",",  ;
      v_ksbc) = 0, 3, AT(",",  ;
      v_ksbc) - 1))
v_ksbc = RIGHT(v_ksbc,  ;
         LEN(v_ksbc) - LEN(mbc) -  ;
         1)
SELECT time
DO WHILE  .NOT. EMPTY(mbc)
     SEEK mbc 
     DO WHILE  .NOT. EOF() .AND.  ;
        bc=mbc
          bctabcnt = bctabcnt + 1
          IF bctabcnt > bctabbou
               RETURN -1
          ENDIF
          bctabbh(bctabcnt) = bc
          bctabsb(bctabcnt) =  ;
                 sbsj
          IF xbsj <= sbsj
               bctabxb(bctabcnt) =  ;
                      xbsj +  ;
                      1440
          ELSE
               bctabxb(bctabcnt) =  ;
                      xbsj
          ENDIF
          bctabss(bctabcnt) = ss
          bctablb(bctabcnt) = lb
          SKIP
     ENDDO
     mbc = LEFT(v_ksbc, IIF(AT( ;
           ",", v_ksbc) = 0, 3,  ;
           AT(",", v_ksbc) - 1))
     v_ksbc = RIGHT(v_ksbc,  ;
              LEN(v_ksbc) -  ;
              LEN(mbc) - 1)
ENDDO
SELECT ardata_
RETURN bctabcnt
ENDFUNC
**
PROCEDURE GetSkTab
PRIVATE mzg
SELECT ardata_
GOTO recptr
SKIP -1
mzg = zgbh
mdate5 = CTOD(riqi)
GOTO recptr
IF gs_recno = RECNO()
     gs_entry = gs_entry + 1
ELSE
     gs_recno = RECNO()
     gs_entry = 0
ENDIF
itwo = 0
ithree = 0
sktabcnt = 0
tabptr = 1
rp = 0
DO WHILE sktabcnt<sktabbou .AND.   ;
   .NOT. EOF() .AND. mzgbh=zgbh  ;
   .AND. mdate=CTOD(riqi)
     sktabcnt = sktabcnt + 1
     DO CASE
          CASE mdate = CTOD(riqi) +  ;
               1
               sktab(sktabcnt) =  ;
                    shijian -  ;
                    1440
          CASE mdate = CTOD(riqi)
               sktab(sktabcnt) =  ;
                    shijian
     ENDCASE
     bztab(sktabcnt) = 9
     addedflagtab(sktabcnt) =  ;
                 addedflag
     SKIP
ENDDO
DO WHILE sktabcnt<sktabbou .AND.   ;
   .NOT. EOF() .AND. mzgbh=zgbh  ;
   .AND. mdate=CTOD(riqi)-1
     sktabcnt = sktabcnt + 1
     IF itwo = 0 .AND. shijian >  ;
        delta0
          itwo = sktabcnt
     ENDIF
     sktab(sktabcnt) = shijian +  ;
          1440
     bztab(sktabcnt) = 9
     addedflagtab(sktabcnt) =  ;
                 addedflag
     SKIP
ENDDO
DO WHILE sktabcnt<sktabbou .AND.   ;
   .NOT. EOF() .AND. mzgbh=zgbh  ;
   .AND. mdate=CTOD(riqi)-2
     sktabcnt = sktabcnt + 1
     IF ithree = 0 .AND. shijian >  ;
        delta0
          sktab(sktabcnt) =  ;
               shijian + 2880
          bztab(sktabcnt) = 9
          addedflagtab(sktabcnt) =  ;
                      addedflag
          ithree = sktabcnt
          EXIT
     ELSE
          IF itwo = 0 .AND.  ;
             shijian <= delta0
               itwo = sktabcnt
          ENDIF
     ENDIF
     sktab(sktabcnt) = shijian +  ;
          2880
     bztab(sktabcnt) = 9
     addedflagtab(sktabcnt) =  ;
                 addedflag
     SKIP
ENDDO
IF rp <> 0
     IF EOF()
          GOTO BOTTOM
     ENDIF
     rp1 = RECNO()
     GOTO rp
     SKIP
     recptr = RECNO()
     GOTO rp1
ENDIF
RETURN
ENDPROC
**
PROCEDURE SkProc
FOR i = 1 TO sktabbou
     bctabcl(i) = .F.
ENDFOR
mloop = .T.
pub_lastbc = ""
pub_lastdate = CTOD("")
mresults = ""
FOR skscan = 1 TO 10
     IF  .NOT. mloop
          FOR i = 1 TO sktabcnt
               FOR p = i TO  ;
                   sktabcnt
                    IF bztab(p) <>  ;
                       9 .OR.  ;
                       sktab(p) >=  ;
                       1440 +  ;
                       delta0
                         EXIT
                    ENDIF
               ENDFOR
               IF p > i + 1 .AND.  ;
                  p <= sktabcnt
                    FOR q = i TO  ;
                        p - 1
                         bztab(q) =  ;
                              3
                    ENDFOR
                    i = p
               ENDIF
               IF bztab(i) = 9
                    bztab(i) = 3
                    IF sktab(i) <  ;
                       1440 +  ;
                       delta0
                         mcnt = 0
                         mcnt1 = 0
                         FOR j =  ;
                             i -  ;
                             1 TO  ;
                             1  ;
                             STEP - ;
                             1
                              IF bztab(j) =  ;
                                 1
                                   mcnt = mcnt + 1
                                   IF mcnt1 = 0
                                        mcnt1 = j
                                   ENDIF
                              ENDIF
                              IF mcnt >  ;
                                 1
                                   EXIT
                              ENDIF
                         ENDFOR
                         IF mcnt >  ;
                            1
                              tabptr =  ;
                               j
                              bctabsel = - ;
                               1
                              k =  ;
                               chkbc(mcnt1)
                              mbctabsel =  ;
                               bctabsel
                              tabptr =  ;
                               j
                              bctabsel = - ;
                               1
                              k =  ;
                               chkbc(i)
                              IF bctabsel >  ;
                                 0  ;
                                 .AND.  ;
                                 mbctabsel =  ;
                                 bctabsel
                                   IF mcnt1 > tabptr + 1 .AND. sktab(mcnt1 - 1) >= bctabxb(bctabsel) - sjzt1
                                        bztab(mcnt1 - 1) = 1
                                        bztab(mcnt1) = 3
                                        msele = LTRIM(STR(SELECT()))
                                        SELECT clfx
                                        mrec = RECNO()
                                        DO WHILE mzgbh=zgbh .AND. mdate=CTOD(riqi) .AND.  .NOT. BOF()
                                             SKIP -1
                                        ENDDO
                                        SKIP
                                        DO WHILE mzgbh=zgbh .AND. mdate=CTOD(riqi) .AND.  .NOT. EOF()
                                             IF (bc = bctabbh(bctabsel) .OR. EMPTY(bc)) .AND. xbsk = sktab(mcnt1)
                                                  REPLACE xbsk WITH IIF(sktab(mcnt1 - 1) > 1440, sktab(mcnt1 - 1) - 1440, sktab(mcnt1 - 1))
                                                  DO skproc_end_modify
                                                  EXIT
                                             ENDIF
                                             SKIP
                                        ENDDO
                                        GOTO mrec
                                        SELECT &msele
                                   ELSE
                                        FOR x = mcnt1 TO i - 1
                                             bztab(x) = 2
                                        ENDFOR
                                        bztab(i) = 1
                                        msele = LTRIM(STR(SELECT()))
                                        SELECT clfx
                                        mrec = RECNO()
                                        DO WHILE mzgbh=zgbh .AND. mdate=CTOD(riqi) .AND.  .NOT. BOF()
                                             SKIP -1
                                        ENDDO
                                        SKIP
                                        DO WHILE mzgbh=zgbh .AND. mdate=CTOD(riqi) .AND.  .NOT. EOF()
                                             IF (bc = bctabbh(bctabsel) .OR. EMPTY(bc)) .AND. xbsk = sktab(mcnt1)
                                                  REPLACE xbsk WITH IIF(sktab(i) > 1440, sktab(i) - 1440, sktab(i))
                                                  DO skproc_end_modify
                                                  EXIT
                                             ENDIF
                                             SKIP
                                        ENDDO
                                        GOTO mrec
                                        SELECT &msele
                                   ENDIF
                              ENDIF
                         ELSE
                              mcnt =  ;
                               0
                              mcnt1 =  ;
                               0
                              FOR  ;
                               j =  ;
                               i +  ;
                               1  ;
                               TO  ;
                               sktabcnt
                                   IF (itwo > 0 .AND. j >= itwo) .OR. (ithree > 0 .AND. j >= ithree)
                                        EXIT
                                   ENDIF
                                   IF bztab(j) = 1
                                        mcnt = mcnt + 1
                                        IF mcnt1 = 0
                                             mcnt1 = j
                                        ENDIF
                                   ENDIF
                                   IF mcnt > 1
                                        EXIT
                                   ENDIF
                              ENDFOR
                              IF mcnt >  ;
                                 1
                                   tabptr = mcnt1
                                   bctabsel = -1
                                   k = chkbc(j)
                                   mbctabsel = bctabsel
                                   tabptr = i
                                   bctabsel = -1
                                   k = chkbc(j)
                                   IF k < 9999 .AND. bctabsel > 0 .AND. mbctabsel = bctabsel
                                        FOR x = mcnt1 TO i - 1
                                             bztab(x) = 2
                                        ENDFOR
                                        bztab(i) = 1
                                        msele = LTRIM(STR(SELECT()))
                                        SELECT clfx
                                        mrec = RECNO()
                                        DO WHILE mzgbh=zgbh .AND. mdate=CTOD(riqi) .AND.  .NOT. BOF()
                                             SKIP -1
                                        ENDDO
                                        SKIP
                                        DO WHILE mzgbh=zgbh .AND. mdate=CTOD(riqi) .AND.  .NOT. EOF()
                                             IF (bc = bctabbh(bctabsel) .OR. EMPTY(bc)) .AND. sbsk = sktab(mcnt1)
                                                  REPLACE sbsk WITH IIF(sktab(i) > 1440, sktab(i) - 1440, sktab(i))
                                                  DO skproc_end_modify
                                                  EXIT
                                             ENDIF
                                             SKIP
                                        ENDDO
                                        GOTO mrec
                                        SELECT &msele
                                   ENDIF
                              ENDIF
                         ENDIF
                    ENDIF
               ENDIF
          ENDFOR
          EXIT
     ENDIF
     FOR y = sktabcnt TO 1 STEP - ;
         1
          IF bztab(y) <> 3
               EXIT
          ENDIF
     ENDFOR
     sktabcnt = y
     mloop = .F.
     i1 = -1
     j1 = -1
     k1 = 1
     d1 = 9999
     d = 9999
     mbtb = .F.
     bctabsel = -1
     sktabsel = -1
     iflag1 = 0
     iflag2 = 0
     idelta1 = 9999
     idelta2 = 9999
     imode1 = 0
     idengji1 = .F.
     idengji = .F.
     FOR tabptr = 1 TO sktabcnt -  ;
         1
          IF bztab(tabptr) <> 9
               LOOP
          ENDIF
          FOR i = sktabcnt TO  ;
              tabptr + 1 STEP -1
               IF bztab(i) <> 9
                    LOOP
               ENDIF
               FOR p = tabptr + 1  ;
                   TO i - 1
                    IF bztab(p) =  ;
                       1
                         EXIT
                    ENDIF
               ENDFOR
               IF p <= i - 1
                    LOOP
               ENDIF
               d = chkbc(i)
               IF d = -9999
                    IF pub_jblb(1,  ;
                       pub_jbqj_no) =  ;
                       92
                         IF j1 >  ;
                            0  ;
                            .AND.  ;
                            d1 <  ;
                            9999
                              DO modisk_1440  ;
                                 WITH  ;
                                 sktab(tabptr),  ;
                                 sktab(i)
                              isb =  ;
                               modisk_1440_sb
                              ixb =  ;
                               modisk_1440_xb
                              DO modisk_1440  ;
                                 WITH  ;
                                 sktab(k1),  ;
                                 sktab(i1)
                              ksb =  ;
                               IIF(modisk_1440_sb <  ;
                               bctabsb(j1),  ;
                               modisk_1440_sb,  ;
                               bctabsb(j1))
                              kxb =  ;
                               IIF(modisk_1440_xb >  ;
                               bctabxb(j1),  ;
                               modisk_1440_xb,  ;
                               bctabxb(j1))
                              kdelta9 =  ;
                               IIF(delta9 *  ;
                               pub_jbss(1,  ;
                               pub_jbqj_no) <  ;
                               delta9max,  ;
                               delta9 *  ;
                               pub_jbss(1,  ;
                               pub_jbqj_no),  ;
                               delta9max)
                              DO CASE
                                   CASE isb < ksb .AND. ixb >= ksb .AND. ixb <= kxb .AND. ksb - isb < kdelta9
                                        DO CASE
                                             CASE i1 = i + 1 .AND. (sktab(i1) - sktab(k1)) / pub_jbss(1, pub_jbqj_no) > 1.2 
                                                  msw = .F.
                                             CASE i1 > i + 1 .AND. sktab(i1) - sktab(i + 1) > sjcq * 0.7 
                                                  msw = .F.
                                             OTHERWISE
                                                  msw = .T.
                                        ENDCASE
                                   CASE isb >= ksb .AND. isb <= kxb .AND. ixb > kxb .AND. ixb - kxb < kdelta9
                                        DO CASE
                                             CASE k1 = tabptr - 1 .AND. (sktab(i1) - sktab(k1)) / pub_jbss(1, pub_jbqj_no) > 1.2 
                                                  msw = .F.
                                             CASE k1 < tabptr - 1 .AND. sktab(tabptr - 1) - sktab(k1) > sjcq * 0.7 
                                                  msw = .F.
                                             OTHERWISE
                                                  msw = .T.
                                        ENDCASE
                                   CASE isb >= ksb .AND. isb <= kxb .AND. ixb >= ksb .AND. ixb <= kxb
                                        DO CASE
                                             CASE (sktab(i1) - sktab(k1)) / sjcq < 0.8 
                                                  msw = .F.
                                             CASE i1 = i + 1 .AND. (sktab(i1) - sktab(k1)) / pub_jbss(1, pub_jbqj_no) > 1.2 
                                                  msw = .F.
                                             CASE i1 > i + 1 .AND. sktab(i1) - sktab(i + 1) > sjcq * 0.7 
                                                  msw = .F.
                                             CASE k1 = tabptr - 1 .AND. (sktab(i1) - sktab(k1)) / pub_jbss(1, pub_jbqj_no) > 1.2 
                                                  msw = .F.
                                             CASE k1 < tabptr - 1 .AND. sktab(tabptr - 1) - sktab(k1) > sjcq * 0.7 
                                                  msw = .F.
                                             OTHERWISE
                                                  msw = .T.
                                        ENDCASE
                                   OTHERWISE
                                        IF j1 > 0 .AND. LEN(TRIM(bctabbh(j1))) > 2
                                             msw = .T.
                                        ELSE
                                             msw = .F.
                                        ENDIF
                              ENDCASE
                              IF msw
                                   bctabsel = -1
                                   sktabsel = -1
                                   LOOP
                              ENDIF
                         ENDIF
                         IF tabptr +  ;
                            1 <  ;
                            i
                              bctabsel = - ;
                               1
                              sktabsel = - ;
                               1
                              LOOP
                         ENDIF
                         IF tabptr =  ;
                            2
                              bctabsel = - ;
                               1
                              sktabsel = - ;
                               1
                              LOOP
                         ENDIF
                    ELSE
                         IF itwo >  ;
                            0  ;
                            .AND.  ;
                            tabptr >=  ;
                            itwo  ;
                            .AND.  ;
                            pub_jblb(2,  ;
                            pub_jbqj_no) =  ;
                            93  ;
                            .AND.  ;
                            tabptr =  ;
                            2
                              bctabsel = - ;
                               1
                              sktabsel = - ;
                               1
                              LOOP
                         ENDIF
                    ENDIF
                    sktabsel = i
                    EXIT
               ENDIF
               IF pub_jblb(1,  ;
                  pub_jbqj_no) >  ;
                  91 .AND.  ;
                  pub_jblb(1,  ;
                  pub_jbqj_no) <  ;
                  95 .AND. (itwo =  ;
                  0 .OR. tabptr <  ;
                  itwo)
                    isb = IIF(sktab(tabptr) >  ;
                          2880 +  ;
                          delta0,  ;
                          sktab(tabptr) -  ;
                          2880,  ;
                          IIF(sktab(tabptr) >  ;
                          1440 +  ;
                          delta0,  ;
                          sktab(tabptr) -  ;
                          1440,  ;
                          sktab(tabptr)))
                    ixb = IIF(sktab(tabptr) >  ;
                          2880 +  ;
                          delta0,  ;
                          sktab(i) -  ;
                          2880,  ;
                          IIF(sktab(tabptr) >  ;
                          1440 +  ;
                          delta0,  ;
                          sktab(i) -  ;
                          1440,  ;
                          sktab(i)))
                    d = d +  ;
                        chkjb(isb,  ;
                        ixb, 0)
               ENDIF
               mflag = .F.
               DO CASE
                    CASE bctabsel >  ;
                         0 .AND.  ;
                         j1 <= 0
                         mflag = .T.
                    CASE bctabsel >  ;
                         0 .AND.  ;
                         j1 > 0  ;
                         .AND.  ;
                         LEN(TRIM(bctabbh(j1))) >=  ;
                         3 .AND.  ;
                         bctabbh(j1) =  ;
                         bctabbh(bctabsel)
                         mflag = .T.
                    CASE bctabsel >  ;
                         0 .AND.  ;
                         j1 > 0  ;
                         .AND.  ;
                         LEN(TRIM(bctabbh(j1))) <  ;
                         3
                         mflag = .T.
               ENDCASE
               IF bctabsel > 0
                    mflag1 = 0
                    IF mflag1 = 0  ;
                       .AND.  ;
                       ABS(d1 -  ;
                       d) <= 30  ;
                       .AND. j1 <>  ;
                       bctabsel  ;
                       .AND. k1 =  ;
                       tabptr
                         mflag1 =  ;
                          2
                    ENDIF
                    IF mflag1 = 0  ;
                       .AND.  ;
                       ABS(d1 -  ;
                       d) <=  ;
                       delta8
                         mflag11 =  ;
                          0
                         DO CASE
                              CASE  ;
                               k1 >=  ;
                               ithree  ;
                               .AND.  ;
                               ithree >  ;
                               0
                                   mday = 3
                              CASE  ;
                               k1 >=  ;
                               itwo  ;
                               .AND.  ;
                               itwo >  ;
                               0
                                   mday = 2
                              OTHERWISE
                                   mday = 1
                         ENDCASE
                         IF i1 >  ;
                            0  ;
                            .AND.  ;
                            pub_jbss(mday,  ;
                            pub_jbqj_no) >  ;
                            0
                              mflag11 =  ;
                               chkdup(sktab(k1),  ;
                               sktab(i1),  ;
                               pub_jbks(mday,  ;
                               pub_jbqj_no),  ;
                               pub_jbjs(mday,  ;
                               pub_jbqj_no))
                         ENDIF
                         IF i1 >  ;
                            0  ;
                            .AND.  ;
                            pub_qjss(mday,  ;
                            pub_jbqj_no) >  ;
                            0
                              mflag11 =  ;
                               chkdup(sktab(k1),  ;
                               sktab(i1),  ;
                               pub_qjks(mday,  ;
                               pub_jbqj_no),  ;
                               pub_qjjs(mday,  ;
                               pub_jbqj_no))
                         ENDIF
                         mflag12 =  ;
                          0
                         DO CASE
                              CASE  ;
                               tabptr >=  ;
                               ithree  ;
                               .AND.  ;
                               ithree >  ;
                               0
                                   mday = 3
                              CASE  ;
                               tabptr >=  ;
                               itwo  ;
                               .AND.  ;
                               itwo >  ;
                               0
                                   mday = 2
                              OTHERWISE
                                   mday = 1
                         ENDCASE
                         IF pub_jbss(mday,  ;
                            pub_jbqj_no) >  ;
                            0
                              mflag10 =  ;
                               0
                              IF i1 =  ;
                                 tabptr
                                   mflag10 = chkdupforall(tabptr + 1, i, mday)
                              ENDIF
                              IF mflag10 =  ;
                                 0
                                   mflag12 = chkdup(sktab(tabptr), sktab(i), pub_jbks(mday, pub_jbqj_no), pub_jbjs(mday, pub_jbqj_no))
                              ELSE
                                   IF mday > 1
                                        sktabcnt = mflag10 - 1
                                        EXIT
                                   ENDIF
                              ENDIF
                         ENDIF
                         IF pub_qjss(mday,  ;
                            pub_jbqj_no) >  ;
                            0
                              mflag12 =  ;
                               chkdup(sktab(tabptr),  ;
                               sktab(i),  ;
                               pub_qjks(mday,  ;
                               pub_jbqj_no),  ;
                               pub_qjjs(mday,  ;
                               pub_jbqj_no))
                         ENDIF
                         IF pub_qjss(mday,  ;
                            pub_jbqj_no) >  ;
                            0
                              IF mflag12 =  ;
                                 2  ;
                                 .AND.  ;
                                 mflag11 <>  ;
                                 2  ;
                                 .AND.  ;
                                 tabptr +  ;
                                 1 =  ;
                                 i  ;
                                 .AND.   ;
                                 .NOT.  ;
                                 (tabptr >=  ;
                                 k1  ;
                                 .AND.  ;
                                 i <=  ;
                                 i1)
                                   mflag1 = 2
                              ENDIF
                         ELSE
                              IF mflag12 >  ;
                                 mflag11
                                   mflag1 = 2
                              ENDIF
                         ENDIF
                         IF mflag1 =  ;
                            0  ;
                            .AND.  ;
                            itwo >  ;
                            0  ;
                            .AND.  ;
                            k1 <  ;
                            itwo  ;
                            .AND.  ;
                            tabptr =  ;
                            k1  ;
                            .AND.  ;
                            i <  ;
                            itwo  ;
                            .AND.  ;
                            i1 >=  ;
                            itwo  ;
                            .AND.  ;
                            bctabsel <>  ;
                            j1
                              mflag1 =  ;
                               2
                         ENDIF
                    ENDIF
                    IF mflag1 = 0  ;
                       .AND. (d1 >  ;
                       d + delta8  ;
                       .OR. (d <  ;
                       delta8 / 4  ;
                       .AND. d1 >  ;
                       delta8 * 3 /  ;
                       4))
                         IF  .NOT.  ;
                             (ABS(d1 -  ;
                             d) <=  ;
                             delta8  ;
                             .AND.  ;
                             k1 =  ;
                             1  ;
                             .AND.  ;
                             i1 =  ;
                             tabptr  ;
                             .AND.  ;
                             itwo >  ;
                             0  ;
                             .AND.  ;
                             i >=  ;
                             itwo)
                              mflag1 =  ;
                               2
                         ENDIF
                    ENDIF
                    IF mflag1 = 0  ;
                       .AND. d1 -  ;
                       d >= 0  ;
                       .AND. d1 -  ;
                       d <=  ;
                       delta8
                         IF j1 >  ;
                            0  ;
                            .AND.  ;
                            ((bctabbh(bctabsel) =  ;
                            bctabbh(j1)  ;
                            .AND.  ;
                            LEN(TRIM(bctabbh(bctabsel))) >  ;
                            2  ;
                            .AND.  ;
                            idengji1 =  ;
                            idengji)  ;
                            .OR.  ;
                            (  ;
                            .NOT.  ;
                            idengji1  ;
                            .AND.  ;
                            idengji))  ;
                            .AND.  ;
                            tabptr <=  ;
                            i1
                              mflag1 =  ;
                               2
                         ENDIF
                    ENDIF
                    IF mflag1 = 2
                         i1 = i
                         j1 = bctabsel
                         k1 = tabptr
                         d1 = d
                         idelta1 =  ;
                          pub_delta1
                         idelta2 =  ;
                          pub_delta2
                         iflag1 =  ;
                          pub_flag1
                         iflag2 =  ;
                          pub_flag2
                         imode1 =  ;
                          imode
                         idengji1 =  ;
                          idengji
                    ENDIF
               ENDIF
               bctabsel = -1
               sktabsel = -1
          ENDFOR
          IF d = -9999
               EXIT
          ENDIF
     ENDFOR
     IF d1 < d
          d = d1
     ENDIF
     SELECT clfx
     IF d = -9999 .AND. sktabsel >  ;
        0
          mloop = .T.
          mtemp = .T.
          IF tabptr = 1 .AND.  ;
             (tabptr = itwo .OR.  ;
             tabptr = ithree)
               FOR i = 1 TO  ;
                   sktabcnt
                    bztab(i) = 3
               ENDFOR
               mloop = .F.
               mtemp = .F.
          ENDIF
          IF mtemp .AND. (itwo >  ;
             0 .AND. tabptr >=  ;
             itwo) .OR. (ithree >  ;
             0 .AND. tabptr >=  ;
             ithree)
               FOR i = tabptr TO  ;
                   sktabcnt
                    bztab(i) = 3
               ENDFOR
               mtemp = .F.
          ENDIF
          IF mtemp
               bztab(tabptr) = 1
               bztab(sktabsel) =  ;
                    1
               FOR i = tabptr + 1  ;
                   TO sktabsel -  ;
                   1
                    bztab(i) = 2
               ENDFOR
               DO appejbsk
               pub_jblb(1,  ;
                       pub_jbqj_no) =  ;
                       0
          ENDIF
     ELSE
          sktabsel = i1
          bctabsel = j1
          tabptr = k1
          IF  .NOT. (idelta1 >  ;
              iflag1 * delta4  ;
              .OR. idelta2 >  ;
              iflag2 * delta4  ;
              .OR. sktabsel = -1  ;
              .OR. bctabsel = -1  ;
              .OR.  ;
              (LEN(TRIM(mresults)) =  ;
              2 .AND. d >  ;
              delta4))
               mflag = .F.
               IF itwo > 0 .AND.  ;
                  tabptr >= itwo  ;
                  .AND.  ;
                  sktab(tabptr) <=  ;
                  1440 + delta0
                    SELECT time
                    SEEK bctabbh(bctabsel) 
                    IF EOF()
                         mflag = .T.
                    ELSE
                         IF lb <>  ;
                            '3'  ;
                            .AND.  ;
                            lb <>  ;
                            '4'
                              mflag =  ;
                               .T.
                         ENDIF
                    ENDIF
                    SELECT clfx
               ENDIF
               IF mflag .OR.  ;
                  (itwo > 0 .AND.  ;
                  tabptr >= itwo  ;
                  .AND.  ;
                  sktab(tabptr) >  ;
                  1440 + delta0)  ;
                  .OR. (ithree >  ;
                  0 .AND. tabptr >=  ;
                  ithree)
                    FOR i =  ;
                        tabptr TO  ;
                        sktabcnt
                         bztab(i) =  ;
                              3
                    ENDFOR
               ELSE
                    bctabcl(bctabsel) =  ;
                           .T.
                    mresults = bctabbh(bctabsel)
                    DO appetwosk
                    bztab(tabptr) =  ;
                         1
                    bztab(sktabsel) =  ;
                         1
                    FOR i =  ;
                        tabptr +  ;
                        1 TO  ;
                        sktabsel -  ;
                        1
                         bztab(i) =  ;
                              2
                    ENDFOR
                    IF sktabcnt >  ;
                       sktabsel  ;
                       .AND.  ;
                       ((itwo > 0  ;
                       .AND.  ;
                       sktabsel +  ;
                       1 >= itwo)  ;
                       .OR.  ;
                       (ithree >  ;
                       0 .AND.  ;
                       sktabsel +  ;
                       1 >=  ;
                       ithree))
                         FOR i =  ;
                             sktabsel +  ;
                             1 TO  ;
                             sktabcnt
                              bztab(i) =  ;
                               3
                         ENDFOR
                    ENDIF
               ENDIF
               mloop = .T.
          ENDIF
     ENDIF
ENDFOR
SELECT ardata_
RETURN
ENDPROC
**
PROCEDURE SkipNext
m = zgbh
DO WHILE  .NOT. pub_escape .AND.   ;
   .NOT. EOF() .AND. m=zgbh
     SKIP
ENDDO
IF  .NOT. EOF()
     recptr = RECNO()
     mzgbh = zgbh
     mdate = CTOD(riqi) - 1
ENDIF
RETURN
ENDPROC
**
FUNCTION ChkSbXb
PARAMETER t, b
IF t < delta0
     t = 1440 + delta0
ENDIF
dj = t - bctabsb(1)
dk = t - bctabxb(1)
b = bctabbh(1)
j = 1
k = 1
FOR i = 2 TO bctabcnt
     IF ABS(dj) > ABS(t -  ;
        bctabsb(i))
          dj = t - bctabsb(i)
          j = i
     ENDIF
     IF ABS(dk) > ABS(t -  ;
        bctabxb(i))
          dk = t - bctabxb(i)
          k = i
     ENDIF
ENDFOR
DO CASE
     CASE ABS(dj) < delta4 / 3  ;
          .AND. ABS(dk) >= delta4 /  ;
          3
          ret = 0
          b = bctabbh(j)
     CASE ABS(dj) >= delta4 / 3  ;
          .AND. ABS(dk) < delta4 /  ;
          3
          ret = 1
          b = bctabbh(k)
     OTHERWISE
          IF ABS(ABS(dj) -  ;
             ABS(dk)) < delta4 /  ;
             4 .AND. dj > 0 .AND.  ;
             dk > 0
               ret = 1
               b = bctabbh(k)
          ELSE
               ret = 0
               b = bctabbh(j)
          ENDIF
ENDCASE
RETURN ret
ENDFUNC
**
PROCEDURE AppeTwoSk
APPEND BLANK
m = IIF(sktab(tabptr) >= 0,  ;
    sktab(tabptr), 1440 +  ;
    sktab(tabptr))
n = IIF(sktab(sktabsel) >= 0,  ;
    sktab(sktabsel), 1440 +  ;
    sktab(sktabsel))
REPLACE zgbh WITH mzgbh, riqi  ;
        WITH DTOC(mdate)
IF addedflagtab(tabptr) = 0
     REPLACE sbsk WITH m
ENDIF
IF addedflagtab(sktabsel) = 0
     REPLACE xbsk WITH n
ENDIF
REPLACE bc WITH bctabbh(bctabsel),  ;
        lb WITH time.lb
REPLACE sbsj WITH  ;
        bctabsb(bctabsel), xbsj  ;
        WITH bctabxb(bctabsel)
REPLACE zdcl WITH 98
pub_lastdate = mdate
pub_lastbc = bc
mcd = sbsk - sbsj
mzt = xbsj - xbsk
IF mcd > sjcd1 .OR. mzt > sjzt1
     IF  .NOT. chk98(mzgbh,  ;
         DTOC(mdate))
          IF mcd > sjcd1
               REPLACE cdss WITH  ;
                       IIF(sjcd2 >  ;
                       1, sjcd2 *  ;
                       (INT(mcd /  ;
                       sjcd2) +  ;
                       1), mcd)
               REPLACE zdcl WITH  ;
                       80
          ENDIF
          IF mzt > sjzt1
               REPLACE ztss WITH  ;
                       IIF(sjzt2 >  ;
                       1, sjzt2 *  ;
                       (INT(mzt /  ;
                       sjzt2) +  ;
                       1), mzt)
               REPLACE zdcl WITH  ;
                       IIF(zdcl =  ;
                       80, 82,  ;
                       81)
          ENDIF
     ENDIF
ENDIF
IF cdss >= sjcd3 .OR. ztss >=  ;
   sjzt3
     IF (sbsj > 0 .AND. sbsk <  ;
        sbsj .AND. xbsk < sbsj)  ;
        .OR. (xbsj > 0 .AND. sbsk >  ;
        xbsj .AND. xbsk > xbsj)
          REPLACE sbsj WITH 0,  ;
                  xbsj WITH 0, bc  ;
                  WITH '', lb  ;
                  WITH '', cdss  ;
                  WITH 0, ztss  ;
                  WITH 0, zdcl  ;
                  WITH 0
     ELSE
          REPLACE kgss WITH  ;
                  bctabss(bctabsel)
          REPLACE zdcl WITH 85
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0
     ENDIF
ELSE
     REPLACE cqss WITH  ;
             bctabss(bctabsel)
ENDIF
DO writeztwc
RETURN
ENDPROC
**
PROCEDURE AppeJbSk
APPEND BLANK
m = IIF(sktab(tabptr) >= 0,  ;
    sktab(tabptr), 1440 +  ;
    sktab(tabptr))
n = IIF(sktab(sktabsel) >= 0,  ;
    sktab(sktabsel), 1440 +  ;
    sktab(sktabsel))
REPLACE zgbh WITH mzgbh, riqi  ;
        WITH DTOC(mdate)
IF addedflagtab(tabptr) = 0
     REPLACE sbsk WITH m
ENDIF
IF addedflagtab(sktabsel) = 0
     REPLACE xbsk WITH n
ENDIF
m_zjks = 0
m_zjjs = 0
IF bctabsel > 0
     REPLACE bc WITH  ;
             bctabbh(bctabsel)
     REPLACE lb WITH time.lb
     REPLACE sbsj WITH  ;
             bctabsb(bctabsel),  ;
             xbsj WITH  ;
             bctabxb(bctabsel)
     m_zjks = time.zjks
     m_zjjs = IIF(time.zjks >  ;
              time.zjjs, 1440, 0) +  ;
              time.zjjs
ELSE
     REPLACE bc WITH xjjl_d.bc
     SELECT time
     SEEK xjjl_d.bc 
     SELECT clfx
     IF  .NOT. EOF("XJJL_D")
          REPLACE lb WITH time.lb
          REPLACE sbsj WITH  ;
                  time.sbsj, xbsj  ;
                  WITH time.xbsj
          m_zjks = time.zjks
          m_zjjs = IIF(time.zjks >  ;
                   time.zjjs,  ;
                   1440, 0) +  ;
                   time.zjjs
     ENDIF
ENDIF
DO writeztwc
RETURN
ENDPROC
**
FUNCTION ChkBc
PARAMETER n
pub_jbqj_no = 1
ret = 9999
mdelta = 9999
pub_bctabsel = -1
mbctabsel = -1
t_sb = sktab(tabptr)
t_xb = sktab(n)
DO CASE
     CASE ithree > 0 .AND. tabptr >=  ;
          ithree
          mday = 3
     CASE itwo > 0 .AND. tabptr >=  ;
          itwo
          mday = 2
     OTHERWISE
          mday = 1
ENDCASE
DO modisk_1440 WITH sktab(tabptr),  ;
   sktab(n)
sktab_tabptr = modisk_1440_sb
sktab_n = modisk_1440_xb
t_sb = sktab_tabptr
t_xb = sktab_n
IF mday = 1 .AND. pub_cqss(1, 1) >  ;
   0
     IF t_sb - 60 > pub_cqks(1,  ;
        1) .AND. t_sb + 60 <  ;
        pub_cqjs(1, 1)
          RETURN ret
     ENDIF
     IF t_xb - 60 > pub_cqks(1,  ;
        1) .AND. t_xb + 60 <  ;
        pub_cqjs(1, 1)
          RETURN ret
     ENDIF
ENDIF
mentry = .F.
FOR jb_no = 1 TO 3
     IF pub_cqss(mday, jb_no) = 0  ;
        .AND. pub_jblb(mday,  ;
        jb_no) = 0 .AND.  ;
        pub_qjlb(mday, jb_no) = 0  ;
        .AND.  .NOT. (sktab_n >  ;
        1440 .AND. mday < 3 .AND.  ;
        pub_jblb(mday + 1, 1) >  ;
        92 .AND. pub_jblb(mday +  ;
        1, 1) < 95)
          LOOP
     ENDIF
     DO CASE
          CASE pub_cqss(mday,  ;
               jb_no) > 0
               IF pub_cqks(mday,  ;
                  jb_no) = 0  ;
                  .AND.  ;
                  pub_cqjs(mday,  ;
                  jb_no) = 0
                    IF pub_cqss(mday,  ;
                       jb_no) >  ;
                       0
                         mdt = pub_cqss(mday,  ;
                               jb_no) /  ;
                               (sktab_n -  ;
                               sktab_tabptr)
                         IF mdt >  ;
                            0.8   ;
                            .AND.  ;
                            mdt <  ;
                            1.2 
                              IF EMPTY(pub_cqbc(mday,  ;
                                 jb_no))
                                   trybc(sktab_tabptr, sktab_n)
                                   mbctabsel = pub_bctabsel
                              ELSE
                                   pub_bctabsel = getselbc(pub_cqbc(mday, jb_no))
                              ENDIF
                              ret = - ;
                               9999
                         ENDIF
                    ENDIF
               ELSE
                    i_jbks = 9999
                    i_jbjs = 9999
                    i_jbtype = 0
                    DO CASE
                         CASE pub_cqks(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) <=  ;
                              sktab_n
                              i_jbks =  ;
                               pub_cqks(mday,  ;
                               jb_no) -  ;
                               sktab_tabptr
                              i_jbjs =  ;
                               sktab_n -  ;
                               pub_cqjs(mday,  ;
                               jb_no)
                              i_jbtype =  ;
                               1
                         CASE pub_cqks(mday,  ;
                              jb_no) <=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) >=  ;
                              sktab_n
                              i_jbks =  ;
                               sktab_tabptr -  ;
                               pub_cqks(mday,  ;
                               jb_no)
                              i_jbjs =  ;
                               pub_cqjs(mday,  ;
                               jb_no) -  ;
                               sktab_n
                              i_jbtype =  ;
                               2
                         CASE pub_cqks(mday,  ;
                              jb_no) <=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) <=  ;
                              sktab_n
                              i_jbks =  ;
                               sktab_tabptr -  ;
                               pub_cqks(mday,  ;
                               jb_no)
                              i_jbjs =  ;
                               sktab_n -  ;
                               pub_cqjs(mday,  ;
                               jb_no)
                              i_jbtype =  ;
                               3
                         CASE pub_cqks(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_cqjs(mday,  ;
                              jb_no) >=  ;
                              sktab_n
                              i_jbks =  ;
                               pub_cqks(mday,  ;
                               jb_no) -  ;
                               sktab_tabptr
                              i_jbjs =  ;
                               pub_cqjs(mday,  ;
                               jb_no) -  ;
                               sktab_n
                              i_jbtype =  ;
                               4
                    ENDCASE
                    kdelta9 = IIF(delta9 *  ;
                              pub_cqss(mday,  ;
                              jb_no) <  ;
                              delta9max,  ;
                              delta9 *  ;
                              pub_cqss(mday,  ;
                              jb_no),  ;
                              delta9max)
                    IF i_jbks <  ;
                       kdelta9  ;
                       .AND.  ;
                       i_jbjs <  ;
                       kdelta9
                         IF EMPTY(pub_cqbc(mday,  ;
                            jb_no))
                              trybc(sktab_tabptr,  ;
                               sktab_n)
                              mbctabsel =  ;
                               pub_bctabsel
                         ELSE
                              pub_bctabsel =  ;
                               getselbc(pub_cqbc(mday,  ;
                               jb_no))
                         ENDIF
                         ret = -9999
                    ENDIF
               ENDIF
          CASE pub_jblb(mday,  ;
               jb_no) = 97
               IF pub_jbks(mday,  ;
                  jb_no) = 0  ;
                  .AND.  ;
                  pub_jbjs(mday,  ;
                  jb_no) = 0
                    t_xb = sktab_n -  ;
                           pub_jbss(mday,  ;
                           jb_no)
                    idengji = .T.
               ELSE
                    DO CASE
                         CASE ABS(pub_jbks(mday,  ;
                              jb_no) -  ;
                              sktab_tabptr) <  ;
                              ABS(pub_jbjs(mday,  ;
                              jb_no) -  ;
                              sktab_n)
                              IF ABS(pub_jbks(mday,  ;
                                 jb_no) -  ;
                                 sktab_tabptr) <  ;
                                 120
                                   t_sb = pub_jbjs(mday, jb_no)
                                   t_xb = sktab_n
                                   idengji = .T.
                              ENDIF
                         CASE ABS(pub_jbks(mday,  ;
                              jb_no) -  ;
                              sktab_tabptr) >=  ;
                              ABS(pub_jbjs(mday,  ;
                              jb_no) -  ;
                              sktab_n)
                              IF ABS(pub_jbjs(mday,  ;
                                 jb_no) -  ;
                                 sktab_n) <  ;
                                 120
                                   t_sb = sktab_tabptr
                                   t_xb = pub_jbks(mday, jb_no)
                                   idengji = .T.
                              ENDIF
                    ENDCASE
               ENDIF
          CASE pub_jblb(mday,  ;
               jb_no) = 92
               IF pub_jbks(mday,  ;
                  jb_no) = 0  ;
                  .AND.  ;
                  pub_jbjs(mday,  ;
                  jb_no) = 0
                    IF pub_jbss(mday,  ;
                       jb_no) >  ;
                       0
                         mdt = pub_jbss(mday,  ;
                               jb_no) /  ;
                               (sktab_n -  ;
                               sktab_tabptr -  ;
                               getrest(sktab_tabptr,  ;
                               sktab_n))
                         IF mdt >  ;
                            0.8   ;
                            .AND.  ;
                            mdt <  ;
                            1.2 
                              = trybc(sktab_tabptr,  ;
                                sktab_n)
                              ret = - ;
                               9999
                         ELSE
                              IF pub_jbss(mday,  ;
                                 jb_no) <  ;
                                 (450^1)
                                   try1 = trybc(sktab_tabptr, sktab_n - pub_jbss(mday, jb_no))
                                   try2 = trybc(sktab_tabptr + pub_jbss(mday, jb_no), sktab_n)
                                   IF try1 < 120 .OR. try2 < 120
                                        IF try1 <= try2
                                             IF sktab_n - pub_jbss(mday, jb_no) > t_sb
                                                  t_xb = sktab_n - pub_jbss(mday, jb_no)
                                                  idengji = .T.
                                             ENDIF
                                        ELSE
                                             IF sktab_tabptr + pub_jbss(mday, jb_no) < t_xb
                                                  t_sb = sktab_tabptr + pub_jbss(mday, jb_no)
                                                  idengji = .T.
                                             ENDIF
                                        ENDIF
                                   ENDIF
                              ENDIF
                         ENDIF
                    ENDIF
               ELSE
                    i_jbks = 9999
                    i_jbjs = 9999
                    i_jbtype = 0
                    DO CASE
                         CASE pub_jbks(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) <=  ;
                              sktab_n
                              i_jbks =  ;
                               pub_jbks(mday,  ;
                               jb_no) -  ;
                               sktab_tabptr
                              i_jbjs =  ;
                               sktab_n -  ;
                               pub_jbjs(mday,  ;
                               jb_no)
                              i_jbtype =  ;
                               1
                         CASE pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_n
                              i_jbks =  ;
                               sktab_tabptr -  ;
                               pub_jbks(mday,  ;
                               jb_no)
                              i_jbjs =  ;
                               pub_jbjs(mday,  ;
                               jb_no) -  ;
                               sktab_n
                              i_jbtype =  ;
                               2
                         CASE pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) <=  ;
                              sktab_n
                              i_jbks =  ;
                               sktab_tabptr -  ;
                               pub_jbks(mday,  ;
                               jb_no)
                              i_jbjs =  ;
                               sktab_n -  ;
                               pub_jbjs(mday,  ;
                               jb_no)
                              i_jbtype =  ;
                               3
                         CASE pub_jbks(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_n
                              i_jbks =  ;
                               pub_jbks(mday,  ;
                               jb_no) -  ;
                               sktab_tabptr
                              i_jbjs =  ;
                               pub_jbjs(mday,  ;
                               jb_no) -  ;
                               sktab_n
                              i_jbtype =  ;
                               4
                    ENDCASE
                    kdelta9 = IIF(delta9 *  ;
                              pub_jbss(mday,  ;
                              jb_no) <  ;
                              delta9max,  ;
                              delta9 *  ;
                              pub_jbss(mday,  ;
                              jb_no),  ;
                              delta9max)
                    DO CASE
                         CASE i_jbks <  ;
                              kdelta9  ;
                              .AND.  ;
                              i_jbjs <  ;
                              kdelta9
                              ret = - ;
                               9999
                         CASE i_jbks =  ;
                              9999  ;
                              .AND.  ;
                              i_jbjs =  ;
                              9999
                         OTHERWISE
                              DO CASE
                                   CASE i_jbtype = 1
                                        IF i_jbks <= i_jbjs
                                             IF i_jbks < 120
                                                  t_sb = pub_jbjs(mday, jb_no)
                                                  idengji = .T.
                                             ENDIF
                                        ELSE
                                             IF i_jbjs < 120
                                                  t_xb = pub_jbks(mday, jb_no)
                                                  idengji = .T.
                                             ENDIF
                                        ENDIF
                                   CASE i_jbtype = 3 .AND. i_jbks < 120
                                        t_sb = pub_jbjs(mday, jb_no)
                                        idengji = .T.
                                   CASE i_jbtype = 4 .AND. i_jbjs < 120
                                        t_xb = pub_jbks(mday, jb_no)
                                        idengji = .T.
                              ENDCASE
                    ENDCASE
               ENDIF
          CASE pub_jblb(mday,  ;
               jb_no) > 92 .AND.  ;
               pub_jblb(mday,  ;
               jb_no) < 95
               IF pub_jbks(mday,  ;
                  jb_no) = 0  ;
                  .AND.  ;
                  pub_jbjs(mday,  ;
                  jb_no) = 0
                    IF pub_jbss(mday,  ;
                       jb_no) >  ;
                       0
                         mdt = pub_jbss(mday,  ;
                               jb_no) /  ;
                               (sktab_n -  ;
                               sktab_tabptr)
                         IF mdt >  ;
                            0.8   ;
                            .AND.  ;
                            mdt <  ;
                            1.2 
                              IF EMPTY(pub_jbbc(mday,  ;
                                 jb_no))
                                   trybc(sktab_tabptr, sktab_n)
                                   mbctabsel = pub_bctabsel
                              ELSE
                                   pub_bctabsel = getselbc(pub_jbbc(mday, jb_no))
                              ENDIF
                              ret = - ;
                               9999
                         ENDIF
                    ENDIF
               ELSE
                    i_jbks = 9999
                    i_jbjs = 9999
                    i_jbtype = 0
                    DO CASE
                         CASE pub_jbks(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) <=  ;
                              sktab_n
                              i_jbks =  ;
                               pub_jbks(mday,  ;
                               jb_no) -  ;
                               sktab_tabptr
                              i_jbjs =  ;
                               sktab_n -  ;
                               pub_jbjs(mday,  ;
                               jb_no)
                              i_jbtype =  ;
                               1
                         CASE pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_n
                              i_jbks =  ;
                               sktab_tabptr -  ;
                               pub_jbks(mday,  ;
                               jb_no)
                              i_jbjs =  ;
                               pub_jbjs(mday,  ;
                               jb_no) -  ;
                               sktab_n
                              i_jbtype =  ;
                               2
                         CASE pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) <=  ;
                              sktab_n
                              i_jbks =  ;
                               sktab_tabptr -  ;
                               pub_jbks(mday,  ;
                               jb_no)
                              i_jbjs =  ;
                               sktab_n -  ;
                               pub_jbjs(mday,  ;
                               jb_no)
                              i_jbtype =  ;
                               3
                         CASE pub_jbks(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbks(mday,  ;
                              jb_no) <=  ;
                              sktab_n  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_tabptr  ;
                              .AND.  ;
                              pub_jbjs(mday,  ;
                              jb_no) >=  ;
                              sktab_n
                              i_jbks =  ;
                               pub_jbks(mday,  ;
                               jb_no) -  ;
                               sktab_tabptr
                              i_jbjs =  ;
                               pub_jbjs(mday,  ;
                               jb_no) -  ;
                               sktab_n
                              i_jbtype =  ;
                               4
                    ENDCASE
                    kdelta9 = IIF(delta9 *  ;
                              pub_jbss(mday,  ;
                              jb_no) <  ;
                              delta9max,  ;
                              delta9 *  ;
                              pub_jbss(mday,  ;
                              jb_no),  ;
                              delta9max)
                    IF i_jbks <  ;
                       kdelta9  ;
                       .AND.  ;
                       i_jbjs <  ;
                       kdelta9
                         IF EMPTY(pub_jbbc(mday,  ;
                            jb_no))
                              trybc(sktab_tabptr,  ;
                               sktab_n)
                              mbctabsel =  ;
                               pub_bctabsel
                         ELSE
                              pub_bctabsel =  ;
                               getselbc(pub_jbbc(mday,  ;
                               jb_no))
                         ENDIF
                         ret = -9999
                    ENDIF
               ENDIF
          CASE sktab_n > 1440  ;
               .AND. mday = 1  ;
               .AND.  ;
               pub_jblb(mday + 1,  ;
               1) > 92 .AND.  ;
               pub_jblb(mday + 1,  ;
               1) < 95
               IF pub_jbks(mday +  ;
                  1, 1) = 0
                    IF pub_jbss(mday +  ;
                       1, 1) > 0
                         t_xb = sktab_n -  ;
                                pub_jbss(mday +  ;
                                1,  ;
                                1)
                         idengji =  ;
                          .T.
                    ENDIF
               ELSE
                    IF sktab_n >  ;
                       1440 +  ;
                       pub_jbks(mday +  ;
                       1, 1)  ;
                       .AND.  ;
                       pub_jbss(mday +  ;
                       1, 1) > 0
                         t_xb = sktab_n -  ;
                                pub_jbss(mday +  ;
                                1,  ;
                                1)
                         idengji =  ;
                          .T.
                    ENDIF
               ENDIF
     ENDCASE
     IF pub_qjlb(mday, jb_no) > 0  ;
        .AND. pub_qjlb(mday,  ;
        jb_no) < 31
          IF pub_qjks(mday,  ;
             jb_no) = 0 .AND.  ;
             pub_qjjs(mday,  ;
             jb_no) = 0
               IF  .NOT.  ;
                   EMPTY(pub_qjbc(mday,  ;
                   jb_no))
                    IF ABS(pub_qjbcks(mday,  ;
                       jb_no) -  ;
                       sktab_tabptr) <  ;
                       ABS(pub_qjbcjs(mday,  ;
                       jb_no) -  ;
                       sktab_n)
                         t_sb = sktab_tabptr
                         t_xb = pub_qjbcjs(mday,  ;
                                jb_no)
                    ELSE
                         t_sb = pub_qjbcks(mday,  ;
                                jb_no)
                         t_xb = sktab_n
                    ENDIF
                    idengji = .T.
               ELSE
                    IF sktab_n -  ;
                       sktab_tabptr -  ;
                       pub_qjss(mday,  ;
                       jb_no) <  ;
                       sjcq
                         IF ABS(sktab_tabptr -  ;
                            480) >  ;
                            ABS(sktab_n -  ;
                            1020)
                              t_sb =  ;
                               sktab_tabptr
                              t_xb =  ;
                               sktab_n +  ;
                               pub_qjss(mday,  ;
                               jb_no)
                         ELSE
                              t_sb =  ;
                               sktab_tabptr -  ;
                               pub_qjss(mday,  ;
                               jb_no)
                              t_xb =  ;
                               sktab_n
                         ENDIF
                         idengji =  ;
                          .T.
                    ENDIF
               ENDIF
          ELSE
               kdelta9 = IIF(delta9 *  ;
                         pub_qjss(mday,  ;
                         jb_no) <  ;
                         delta9max,  ;
                         delta9 *  ;
                         pub_qjss(mday,  ;
                         jb_no),  ;
                         delta9max)
               DO CASE
                    CASE pub_qjks(mday,  ;
                         jb_no) <=  ;
                         sktab_tabptr  ;
                         .AND.  ;
                         pub_qjjs(mday,  ;
                         jb_no) <=  ;
                         sktab_tabptr
                         IF sktab_tabptr -  ;
                            pub_qjjs(mday,  ;
                            jb_no) <  ;
                            kdelta9
                              t_sb =  ;
                               pub_qjks(mday,  ;
                               jb_no)
                              idengji =  ;
                               .T.
                         ENDIF
                    CASE pub_qjks(mday,  ;
                         jb_no) >=  ;
                         sktab_n  ;
                         .AND.  ;
                         pub_qjjs(mday,  ;
                         jb_no) >=  ;
                         sktab_n
                         IF pub_qjks(mday,  ;
                            jb_no) -  ;
                            sktab_n <  ;
                            kdelta9
                              t_xb =  ;
                               pub_qjjs(mday,  ;
                               jb_no)
                              idengji =  ;
                               .T.
                         ENDIF
                    CASE pub_qjks(mday,  ;
                         jb_no) <=  ;
                         sktab_tabptr  ;
                         .AND.  ;
                         pub_qjjs(mday,  ;
                         jb_no) >=  ;
                         sktab_tabptr  ;
                         .AND.  ;
                         pub_qjjs(mday,  ;
                         jb_no) <=  ;
                         sktab_n  ;
                         .AND.  ;
                         sktab_n -  ;
                         pub_qjks(mday,  ;
                         jb_no) <  ;
                         2 *  ;
                         sjcq
                         t_sb = pub_qjks(mday,  ;
                                jb_no)
                         idengji =  ;
                          .T.
                    CASE pub_qjks(mday,  ;
                         jb_no) >=  ;
                         sktab_tabptr  ;
                         .AND.  ;
                         pub_qjks(mday,  ;
                         jb_no) <=  ;
                         sktab_n  ;
                         .AND.  ;
                         pub_qjjs(mday,  ;
                         jb_no) >=  ;
                         sktab_n  ;
                         .AND.  ;
                         pub_qjjs(mday,  ;
                         jb_no) -  ;
                         sktab_tabptr <  ;
                         2 *  ;
                         sjcq
                         t_xb = pub_qjjs(mday,  ;
                                jb_no)
                         idengji =  ;
                          .T.
               ENDCASE
          ENDIF
     ENDIF
     IF ret = -9999
          pub_jbqj_no = jb_no
          mbctabsel = pub_bctabsel
          mentry = .T.
          EXIT
     ELSE
          mdelta1 = trybc(t_sb,  ;
                    t_xb)
          IF mdelta > mdelta1
               pub_jbqj_no = jb_no
               mdelta = mdelta1
               mbctabsel = pub_bctabsel
               mentry = .T.
          ENDIF
     ENDIF
ENDFOR
IF  .NOT. mentry
     mdelta = trybc(t_sb, t_xb)
     mbctabsel = pub_bctabsel
ENDIF
IF mbctabsel > 0
     IF bctablb(mbctabsel) <> '3'  ;
        .AND. sktab(tabptr) -  ;
        1440 > 0 .AND.  ;
        sktab(tabptr) - 1440 <  ;
        delta0 .AND. ret <> - ;
        9999
          ret = 9999
     ELSE
          pub_bctabsel = mbctabsel
          bctabsel = pub_bctabsel
     ENDIF
ENDIF
IF ret <> -9999
     ret = mdelta
ENDIF
RETURN ret
ENDFUNC
**
FUNCTION TryBc
PARAMETER t_sb, t_xb
DO modisk_1440 WITH t_sb, t_xb
t_sb = modisk_1440_sb
t_xb = modisk_1440_xb
pub_bctabsel = 0
pub_delta1 = 9999
pub_delta2 = 9999
pub_flag1 = 0
pub_flag2 = 0
FOR x = 1 TO bctabcnt
     i_sb = bctabsb(x)
     i_xb = bctabxb(x)
     DO CASE
          CASE t_sb >= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb <= i_xb .AND.  ;
               ((t_xb <= 1440  ;
               .AND. i_xb <=  ;
               1440) .OR. (t_xb >  ;
               1440 .AND. i_xb >  ;
               1440))
               mx = (t_sb - i_sb) *  ;
                    wtsb2
               my = (i_xb - t_xb) *  ;
                    wtxb2
               mf1 = wtsb2
               mf2 = wtxb2
               imode = 0
          CASE t_sb <= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb >= i_xb .AND.  ;
               ((t_xb <= 1440  ;
               .AND. i_xb <=  ;
               1440) .OR. (t_xb >  ;
               1440 .AND. i_xb >  ;
               1440))
               mx = (i_sb - t_sb) *  ;
                    wtsb1
               my = (t_xb - i_xb) *  ;
                    wtxb1
               mf1 = wtsb1
               mf2 = wtxb1
               imode = 1
          CASE t_sb >= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb >= i_xb .AND.  ;
               ((t_xb <= 1440  ;
               .AND. i_xb <=  ;
               1440) .OR. (t_xb >  ;
               1440 .AND. i_xb >  ;
               1440))
               mx = (t_sb - i_sb) *  ;
                    wtsb2
               my = (t_xb - i_xb) *  ;
                    wtxb1
               mf1 = wtsb2
               mf2 = wtxb1
               imode = 0
          CASE t_sb <= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb <= i_xb .AND.  ;
               ((t_xb <= 1440  ;
               .AND. i_xb <=  ;
               1440) .OR. (t_xb >  ;
               1440 .AND. i_xb >  ;
               1440))
               mx = (i_sb - t_sb) *  ;
                    wtsb1
               my = (i_xb - t_xb) *  ;
                    wtxb2
               mf1 = wtsb1 +  ;
                     wtxb2
               mf2 = wtsb1 +  ;
                     wtxb2
               imode = 0
          CASE t_sb >= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb <= i_xb .AND.  ;
               t_xb <= 1440 .AND.  ;
               i_xb > 1440
               mx = (t_sb - i_sb) *  ;
                    wtsb2
               my = (i_xb - t_xb) *  ;
                    wtxb2
               mf1 = wtsb2
               mf2 = wtxb2
               imode = 0
          CASE t_sb < delta0  ;
               .AND. 1440 + t_sb >=  ;
               i_sb .AND. 1440 +  ;
               t_sb <= i_xb .AND.  ;
               1440 + t_xb >=  ;
               i_sb .AND. 1440 +  ;
               t_xb <= i_xb .AND.  ;
               t_xb <= 1440 .AND.  ;
               i_xb > 1440
               mx = (1440 + t_sb -  ;
                    i_sb) *  ;
                    wtsb2
               my = (1440 + i_xb -  ;
                    t_xb) *  ;
                    wtxb2
               mf1 = wtsb2
               mf2 = wtxb2
               imode = 0
          CASE t_sb <= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb <= i_xb .AND.  ;
               t_xb <= 1440 .AND.  ;
               i_xb > 1440
               mx = (i_sb - t_sb) *  ;
                    wtsb1
               my = (i_xb - t_xb) *  ;
                    wtxb2
               mf1 = wtsb1
               mf2 = wtxb2
               imode = 0
          CASE t_sb < delta0  ;
               .AND. 1440 + t_sb >=  ;
               i_sb .AND. 1440 +  ;
               t_sb <= i_xb .AND.  ;
               1440 + t_xb >=  ;
               i_sb .AND. 1440 +  ;
               t_xb >= i_xb .AND.  ;
               t_xb <= 1440 .AND.  ;
               i_xb > 1440
               mx = (1440 + t_sb -  ;
                    i_sb) *  ;
                    wtsb2
               my = (1440 + t_xb -  ;
                    i_xb) *  ;
                    wtxb1
               mf1 = wtsb2
               mf2 = wtxb1
               imode = 0
          CASE t_sb <= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb >= i_xb .AND.  ;
               t_xb > 1440 .AND.  ;
               i_xb <= 1440
               mx = (i_sb - t_sb) *  ;
                    wtsb1
               my = (t_xb - i_xb) *  ;
                    wtxb1
               mf1 = wtsb1
               mf2 = wtxb1
               imode = 2
          CASE t_sb <= 1440 +  ;
               i_sb .AND. t_sb <=  ;
               1440 + i_xb .AND.  ;
               t_xb >= 1440 +  ;
               i_sb .AND. t_xb >=  ;
               1440 + i_xb .AND.  ;
               t_xb > 1440 .AND.  ;
               i_xb <= 1440
               mx = (1440 + i_sb -  ;
                    t_sb) *  ;
                    wtsb1
               my = (t_xb - i_xb -  ;
                    1440) *  ;
                    wtxb1
               mf1 = wtsb1
               mf2 = wtxb1
               imode = 3
          CASE t_sb >= i_sb .AND.  ;
               t_sb <= i_xb .AND.  ;
               t_xb >= i_sb .AND.  ;
               t_xb >= i_xb .AND.  ;
               t_xb > 1440 .AND.  ;
               i_xb <= 1440
               mx = (t_sb - i_sb) *  ;
                    wtsb2
               my = (t_xb - i_xb) *  ;
                    wtxb1
               mf1 = wtsb2
               mf2 = wtxb1
               imode = 0
          CASE t_sb <= 1440 +  ;
               i_sb .AND. t_sb <=  ;
               1440 + i_xb .AND.  ;
               t_xb >= 1440 +  ;
               i_sb .AND. t_xb <=  ;
               1440 + i_xb .AND.  ;
               t_xb > 1440 .AND.  ;
               i_xb <= 1440
               mx = (1440 + i_sb -  ;
                    t_sb) *  ;
                    wtsb1
               my = (1440 + i_xb -  ;
                    t_xb) *  ;
                    wtxb2
               mf1 = wtsb1
               mf2 = wtxb2
               imode = 0
          OTHERWISE
               mx = 9999
               my = 9999
               mf1 = 0
               mf2 = 0
               imode = 0
     ENDCASE
     IF mx + my < pub_delta1 +  ;
        pub_delta2
          pub_delta1 = mx
          pub_delta2 = my
          pub_flag1 = mf1
          pub_flag2 = mf2
          pub_bctabsel = x
     ENDIF
ENDFOR
IF pub_delta1 < pub_flag1 *  ;
   delta4 .AND. pub_delta2 <  ;
   pub_flag2 * delta4
     iret = pub_delta1 +  ;
            pub_delta2
ELSE
     iret = 9999
ENDIF
RETURN iret
ENDFUNC
**
PROCEDURE SetMark
k = IIF(itwo > 0, itwo,  ;
    IIF(ithree > 0, ithree, 0))
i = 0
FOR j = 1 TO sktabcnt
     IF bztab(j) = 1
          i = i + 1
     ENDIF
     IF k > 0 .AND. j >= k .AND.  ;
        MOD(i, 2) = 0
          EXIT
     ENDIF
ENDFOR
IF j > sktabcnt
     j = j - 1
ENDIF
IF j > 0 .AND. bztab(j) <> 1  ;
   .AND. j >= k .AND. k > 0
     j = j - 1
ENDIF
mdays = 0
SELECT ardata_
GOTO recptr
FOR i = 1 TO j
     REPLACE mark WITH  ;
             IIF(bztab(i) = 9, 3,  ;
             bztab(i))
     IF bztab(i) < 3 .AND.  ;
        EMPTY(donedate)
          REPLACE donedate WITH  ;
                  DTOC(mdate)
     ENDIF
     mmdate = CTOD(riqi)
     mmrec = RECNO()
     mmmark = mark
     mdays = CTOD(riqi) - mdate
     SKIP
ENDFOR
IF  .NOT. EOF()
     SKIP
ENDIF
IF  .NOT. EOF()
     IF j > 0 .AND. mmdate >  ;
        mdate .AND. mmdate <  ;
        CTOD(riqi) .AND. mmmark =  ;
        3
          GOTO mmrec
     ELSE
          SKIP -1
     ENDIF
ELSE
     GOTO BOTTOM
     IF  .NOT. EOF() .AND. mzgbh =  ;
         zgbh .AND. mdate + mdays =  ;
         CTOD(riqi) .AND. mark >  ;
         0
          SKIP
     ENDIF
ENDIF
IF  .NOT. EOF()
     recptr = RECNO()
     IF mzgbh <> zgbh
          mdate = CTOD(riqi) - 1
     ELSE
          mdate = IIF(CTOD(riqi) >  ;
                  mdate + 1 .AND.  ;
                  shijian <  ;
                  delta0,  ;
                  CTOD(riqi) - 1,  ;
                  CTOD(riqi))
     ENDIF
     mzgbh = zgbh
ENDIF
RETURN
ENDPROC
**
PROCEDURE SaveCl1
DO modibc
SELECT clfx
INDEX ON zgbh + riqi + bc TO CLFX  ;
      FOR LEN(TRIM(bc)) = 3 .OR.  ;
      EMPTY(bc)
GOTO TOP
DO WHILE  .NOT. EOF()
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF EMPTY(bc)
          SKIP
          LOOP
     ENDIF
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mbc = bc
     cnt = 0
     mcqss = 0
     mcqss1 = 0
     rec = RECNO()
     SELECT time
     SEEK LEFT(mbc, 2) 
     v_scq = 0
     DO WHILE  .NOT. EOF() .AND.  ;
        LEFT(mbc, 2)=LEFT(bc, 2)
          IF cnt >= bctabbou
               WAIT WINDOW  ;
                    "错误: 分段班次太多!"
               RETURN
          ENDIF
          cnt = cnt + 1
          clbc(cnt) = bc
          dlb(cnt) = lb
          dsb(cnt) = sbsj
          dxb(cnt) = xbsj
          dxx(cnt) = zjxx
          dss(cnt) = ss
          v_scq = v_scq + (xbsj -  ;
                  sbsj)
          dmark(cnt) = 0
          SKIP
     ENDDO
     SELECT clfx
     IF LEN(TRIM(mbc)) = 3
          SKIP
          i = 2
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi) .AND. i<= ;
             cnt
               IF LEFT(mbc, 2) <>  ;
                  LEFT(bc, 2)
                    REPLACE bc  ;
                            WITH  ;
                            clbc(i),  ;
                            lb  ;
                            WITH  ;
                            dlb(i)
                    REPLACE sbsj  ;
                            WITH  ;
                            dsb(i),  ;
                            xbsj  ;
                            WITH  ;
                            dxb(i),  ;
                            zdcl  ;
                            WITH  ;
                            98
                    REPLACE cdss  ;
                            WITH  ;
                            0,  ;
                            ztss  ;
                            WITH  ;
                            0
                    mcd = sbsk -  ;
                          sbsj
                    IF mcd >  ;
                       sjcd1
                         REPLACE cdss  ;
                                 WITH  ;
                                 IIF(sjcd2 >  ;
                                 1,  ;
                                 sjcd2 *  ;
                                 (INT(mcd /  ;
                                 sjcd2) +  ;
                                 1),  ;
                                 mcd)
                         REPLACE zdcl  ;
                                 WITH  ;
                                 80
                    ENDIF
                    mzt = xbsj -  ;
                          xbsk
                    IF mzt >  ;
                       sjzt1
                         REPLACE ztss  ;
                                 WITH  ;
                                 IIF(sjzt2 >  ;
                                 1,  ;
                                 sjzt2 *  ;
                                 (INT(mzt /  ;
                                 sjzt2) +  ;
                                 1),  ;
                                 mzt)
                         REPLACE zdcl  ;
                                 WITH  ;
                                 IIF(zdcl =  ;
                                 80,  ;
                                 82,  ;
                                 81)
                    ENDIF
                    IF cdss >=  ;
                       sjcd3 .OR.  ;
                       ztss >=  ;
                       sjzt3
                         REPLACE zdcl  ;
                                 WITH  ;
                                 85
                         REPLACE kgss  ;
                                 WITH  ;
                                 dss(i)
                         REPLACE cdss  ;
                                 WITH  ;
                                 0,  ;
                                 ztss  ;
                                 WITH  ;
                                 0
                    ELSE
                         REPLACE cqss  ;
                                 WITH  ;
                                 dss(i)
                    ENDIF
               ENDIF
               SKIP
               i = i + 1
          ENDDO
     ENDIF
     GOTO rec
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        CTOD(riqi)
          IF  .NOT. EMPTY(bc)
               mcqss = mcqss +  ;
                       IIF(cqss >  ;
                       0, cqss,  ;
                       xbsk -  ;
                       sbsk)
               DO setdmark
          ENDIF
          SKIP
     ENDDO
     IF mcqss < v_scq
          SELECT clfx
          FOR i = 1 TO cnt
               IF dmark(i) = 0
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            mzgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(mdate)
                    REPLACE bc  ;
                            WITH  ;
                            clbc(i),  ;
                            lb  ;
                            WITH  ;
                            dlb(i),  ;
                            zdcl  ;
                            WITH  ;
                            85
                    REPLACE kgss  ;
                            WITH  ;
                            dss(i)
                    REPLACE sbsj  ;
                            WITH  ;
                            dsb(i),  ;
                            xbsj  ;
                            WITH  ;
                            dxb(i)
               ENDIF
          ENDFOR
          GOTO rec
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi)
               SKIP
          ENDDO
     ELSE
          SELECT clfx
          FOR i = 1 TO cnt
               IF dmark(i) = 0
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            mzgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(mdate)
                    REPLACE bc  ;
                            WITH  ;
                            clbc(i),  ;
                            lb  ;
                            WITH  ;
                            dlb(i),  ;
                            zdcl  ;
                            WITH  ;
                            98
                    REPLACE cqss  ;
                            WITH  ;
                            dss(i)
                    REPLACE sbsj  ;
                            WITH  ;
                            dsb(i),  ;
                            xbsj  ;
                            WITH  ;
                            dxb(i)
               ENDIF
          ENDFOR
          GOTO rec
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi)
               SKIP
          ENDDO
     ENDIF
ENDDO
RETURN
ENDPROC
**
PROCEDURE SaveCl2
SELECT clfx
INDEX ON zgbh + riqi +  ;
      STR(IIF(sbsk > 0, sbsk,  ;
      xbsk), 4) TO CLFX
SELECT ardata_
SET RELATION TO zgbh INTO zg
GOTO TOP
mzg = ''
DO WHILE  .NOT. EOF()
     IF CTOD(riqi) <  ;
        pub_kaishiriqi
          SKIP
          LOOP
     ENDIF
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     DO CASE
          CASE mark = 3
               mzgbh = zgbh
               mdate = CTOD(riqi)
               SELECT clfx
               SEEK mzgbh +  ;
                    DTOC(mdate) 
               IF FOUND() .AND.   ;
                  .NOT. EMPTY(bc)  ;
                  .AND. zdcl <>  ;
                  98 .AND. rgcl =  ;
                  0 .AND. (sbsk =  ;
                  0 .OR. xbsk =  ;
                  0)
                    sw = .F.
                    DO WHILE   ;
                       .NOT.  ;
                       EOF()  ;
                       .AND. zgbh= ;
                       mzgbh  ;
                       .AND. riqi= ;
                       DTOC(mdate)
                         IF zdcl =  ;
                            85
                              DO CASE
                                   CASE sbsk = 0
                                        REPLACE sbsk WITH ardata_.shijian
                                        REPLACE zdcl WITH 73
                                   CASE xbsk = 0
                                        REPLACE xbsk WITH ardata_.shijian
                                        REPLACE zdcl WITH 73
                              ENDCASE
                              sw =  ;
                               .T.
                         ENDIF
                         SKIP
                    ENDDO
                    IF  .NOT. sw
                         SKIP -1
                         SELECT ardata_
                         mtime1 =  ;
                          shijian
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            zgbh= ;
                            mzgbh  ;
                            .AND.  ;
                            riqi= ;
                            DTOC(mdate)
                              SKIP
                         ENDDO
                         SKIP -1
                         mtime2 =  ;
                          shijian
                         SELECT clfx
                         IF ardata_.shijian -  ;
                            xbsj >  ;
                            0
                              REPLACE  ;
                               xbsk  ;
                               WITH  ;
                               ardata_.shijian
                              mzt =  ;
                               xbsj -  ;
                               xbsk
                              IF mzt >  ;
                                 sjzt1
                                   REPLACE ztss WITH IIF(sjzt2 > 1, sjzt2 * (INT(mzt / sjzt2) + 1), mzt)
                                   REPLACE zdcl WITH IIF(zdcl = 80, 82, 81)
                              ELSE
                                   v_1 = zdcl
                                   IF v_1 = 82
                                        v_1 = 80
                                   ELSE
                                        IF v_1 = 81
                                             v_1 = 98
                                        ENDIF
                                   ENDIF
                                   REPLACE ztss WITH 0, zdcl WITH v_1
                              ENDIF
                         ELSE
                              APPEND  ;
                               BLANK
                              REPLACE  ;
                               zgbh  ;
                               WITH  ;
                               ardata_.zgbh,  ;
                               riqi  ;
                               WITH  ;
                               ardata_.riqi
                              REPLACE  ;
                               zdcl  ;
                               WITH  ;
                               72,  ;
                               xbsk  ;
                               WITH  ;
                               ardata_.shijian,  ;
                               bc  ;
                               WITH  ;
                               ""
                              IF ardata_.shijian <  ;
                                 delta0
                                   REPLACE riqi WITH DTOC(CTOD(ardata_.riqi) - 1)
                              ENDIF
                         ENDIF
                    ENDIF
               ELSE
                    IF mzg <>  ;
                       ardata_.zgbh
                         mzg = ardata_.zgbh
                         = getbctab()
                         SELECT clfx
                    ENDIF
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            ardata_.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            ardata_.riqi,  ;
                            bc  ;
                            WITH  ;
                            ""
                    b = ''
                    IF chksbxb(ardata_.shijian,  ;
                       b) = 0
                         REPLACE zdcl  ;
                                 WITH  ;
                                 71,  ;
                                 sbsk  ;
                                 WITH  ;
                                 ardata_.shijian
                    ELSE
                         REPLACE zdcl  ;
                                 WITH  ;
                                 72,  ;
                                 xbsk  ;
                                 WITH  ;
                                 ardata_.shijian
                         IF ardata_.shijian <  ;
                            delta0
                              REPLACE  ;
                               riqi  ;
                               WITH  ;
                               DTOC(CTOD(ardata_.riqi) -  ;
                               1)
                         ENDIF
                    ENDIF
               ENDIF
     ENDCASE
     SELECT ardata_
     SKIP
ENDDO
SELECT clfx
SET RELATION TO zgbh INTO zg
GOTO TOP
mzgbh = zgbh
mdate = CTOD(riqi)
rec = -1
t1 = -1
t2 = -1
mtogether = 0
DO WHILE  .NOT. EOF()
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF mzgbh <> zgbh .OR. mdate <>  ;
        CTOD(riqi)
          IF t2 >= 0 .AND.  ;
             mtogether > 0
               GOTO rec
               REPLACE sbsk WITH  ;
                       t1, xbsk  ;
                       WITH t2,  ;
                       zdcl WITH  ;
                       73
               SKIP
               DO WHILE  .NOT.  ;
                  EOF() .AND.  ;
                  mzgbh=zgbh  ;
                  .AND. mdate= ;
                  CTOD(riqi)
                    IF EMPTY(bc)
                         DELETE
                    ENDIF
                    SKIP
               ENDDO
          ENDIF
          t1 = -1
          t2 = -1
          mtogether = 0
          rec = RECNO()
          mzgbh = zgbh
          mdate = CTOD(riqi)
     ENDIF
     IF zdcl = 71 .OR. zdcl = 72
          IF mtogether = 0
               t1 = IIF(zdcl = 71,  ;
                    sbsk, xbsk)
               rec = RECNO()
          ELSE
               t2 = IIF(zdcl = 71,  ;
                    sbsk, xbsk)
          ENDIF
          mtogether = mtogether +  ;
                      1
     ELSE
          IF mtogether < 2
               t1 = -1
               t2 = -1
               mtogether = 0
               rec = RECNO()
          ENDIF
     ENDIF
     IF (zg.mk = '1' .OR. zg.mk =  ;
        '4' .OR. zg.mk = '5' .OR.  ;
        zg.mk = '7') .AND. (zdcl <  ;
        71 .OR. zdcl > 73) .AND.  ;
        zdcl <> 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  jbss WITH 0
          REPLACE cqss WITH xbsk -  ;
                  sbsk, zdcl WITH  ;
                  98
     ENDIF
     SKIP
ENDDO
IF t2 >= 0 .AND. EOF() .AND.  ;
   mtogether > 0
     GOTO rec
     REPLACE sbsk WITH t1, xbsk  ;
             WITH t2, zdcl WITH  ;
             73
     SKIP
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        CTOD(riqi)
          IF EMPTY(bc)
               DELETE
          ENDIF
          SKIP
     ENDDO
     GOTO rec
     IF (zg.mk = '1' .OR. zg.mk =  ;
        '4' .OR. zg.mk = '5' .OR.  ;
        zg.mk = '7') .AND. (zdcl <  ;
        71 .OR. zdcl > 73) .AND.  ;
        zdcl <> 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  jbss WITH 0
          REPLACE cqss WITH xbsk -  ;
                  sbsk, zdcl WITH  ;
                  98
     ENDIF
ENDIF
SELECT clfx
GOTO TOP
DO WHILE  .NOT. EOF()
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF sbsk > 0 .AND. xbsk > 0
          SKIP
          LOOP
     ENDIF
     mzgbh = zgbh
     mdate = CTOD(riqi)
     SKIP
     IF  .NOT. EOF() .AND. sbsk >  ;
         0 .AND. xbsk > 0
          SKIP
          LOOP
     ENDIF
     IF  .NOT. EOF() .AND. mdate <>  ;
         CTOD(riqi) - 1 .OR. sbsk >  ;
         delta0 .OR. xbsk >  ;
         delta0
          SKIP
          LOOP
     ENDIF
     msk2 = IIF(sbsk > 0, sbsk,  ;
            xbsk)
     SKIP -1
     IF xbsk > 0
          REPLACE sbsk WITH xbsk
     ENDIF
     REPLACE xbsk WITH msk2, zdcl  ;
             WITH 0
     IF  .NOT. EOF()
          SKIP
     ENDIF
     DELETE
     IF  .NOT. EOF()
          SKIP
     ENDIF
ENDDO
SELECT clfx
mzgbh = ""
mdate = CTOD("")
mzdcl = 0
mbc = ""
SCAN
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     DO CASE
          CASE zdcl >= 92 .AND.  ;
               zdcl <= 94
          CASE zdcl >= 71 .AND.  ;
               zdcl <= 73 .AND.  ;
               ((sbsk > 0 .AND.  ;
               xbsk = 0) .OR.  ;
               (sbsk = 0 .AND.  ;
               xbsk > 0))
          CASE mzdcl = 85
               IF zdcl = 98 .AND.  ;
                  zgbh = mzgbh  ;
                  .AND.  ;
                  CTOD(riqi) =  ;
                  mdate
                    SKIP -1
                    REPLACE zdcl  ;
                            WITH  ;
                            0,  ;
                            kgss  ;
                            WITH  ;
                            0,  ;
                            kgts  ;
                            WITH  ;
                            0
                    SKIP
               ENDIF
          CASE zdcl = 85
               IF mzdcl = 98  ;
                  .AND. zgbh =  ;
                  mzgbh .AND.  ;
                  CTOD(riqi) =  ;
                  mdate
                    REPLACE zdcl  ;
                            WITH  ;
                            0,  ;
                            kgss  ;
                            WITH  ;
                            0,  ;
                            kgts  ;
                            WITH  ;
                            0
               ENDIF
     ENDCASE
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mzdcl = zdcl
     mbc = bc
ENDSCAN
SELECT clfx
SET RELATION TO lb INTO bctype
SCAN
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF  .NOT. EMPTY(lb) .AND.  ;
         bctype.day2th = "1"
          REPLACE riqi WITH  ;
                  DTOC(CTOD(riqi) +  ;
                  1)
     ENDIF
ENDSCAN
RETURN
ENDPROC
**
PROCEDURE SetDMark
FOR i = 1 TO cnt
     IF bc = clbc(i)
          dmark(i) = 1
          EXIT
     ENDIF
ENDFOR
RETURN
ENDPROC
**
PROCEDURE ModiBC
DIMENSION sc_rec(3), sc_bc(3),  ;
          sc_sb(3), sc_xb(3),  ;
          sc_bc1(3), sc_bc2(3)
SELECT clfx
INDEX ON zgbh + riqi TO CLFX
GOTO TOP
DO WHILE  .NOT. EOF()
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mbc = bc
     cnt = 0
     sw = .F.
     sw1 = .F.
     rec = RECNO()
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        CTOD(riqi) .AND. cnt<3
          cnt = cnt + 1
          IF LEFT(mbc, 2) <>  ;
             LEFT(bc, 2)
               sw = .T.
          ENDIF
          IF LEN(ALLTRIM(bc)) = 3
               sw1 = .T.
          ENDIF
          sc_rec(cnt) = RECNO()
          sc_bc(cnt) = bc
          sc_sb(cnt) = sbsk
          sc_xb(cnt) = xbsk
          SKIP
     ENDDO
     IF  .NOT. sw .OR.  .NOT. sw1
          LOOP
     ENDIF
     sc_dt1 = 999999
     FOR i = 1 TO cnt
          SELECT time
          SEEK LEFT(sc_bc(i), 2) 
          k = 0
          DO WHILE  .NOT. EOF()  ;
             .AND. LEFT(sc_bc(i),  ;
             2)=LEFT(bc, 2) .AND.  ;
             k<=bctabbou
               k = k + 1
               clbc(k) = bc
               dsb(k) = sbsj
               dxb(k) = xbsj
               SKIP
          ENDDO
          sc_dt2 = 0
          FOR j = 1 TO cnt
               IF LEFT(sc_bc(j),  ;
                  2) =  ;
                  LEFT(sc_bc(i),  ;
                  2) .OR. k < 1
                    sc_bc2(j) =  ;
                          ""
               ELSE
                    p = 1
                    dk_sb = IIF(sc_sb(j) >  ;
                            dsb(p),  ;
                            (sc_sb(j) -  ;
                            dsb(p)) *  ;
                            wtsb2,  ;
                            (sc_sb(j) -  ;
                            dsb(p)) *  ;
                            wtsb1)
                    dk_xb = IIF(sc_xb(j) >  ;
                            dxb(p),  ;
                            (sc_xb(j) -  ;
                            dxb(p)) *  ;
                            wtxb1,  ;
                            (sc_xb(j) -  ;
                            dxb(p)) *  ;
                            wtxb2)
                    dt = dk_sb +  ;
                         dk_xb
                    sc_bc2(j) =  ;
                          clbc(p)
                    FOR p = 2 TO  ;
                        k
                         dk_sb = IIF(sc_sb(j) >  ;
                                 dsb(p),  ;
                                 (sc_sb(j) -  ;
                                 dsb(p)) *  ;
                                 wtsb2,  ;
                                 (dsb(p) -  ;
                                 sc_sb(j)) *  ;
                                 wtsb1)
                         dk_xb = IIF(sc_xb(j) >  ;
                                 dxb(p),  ;
                                 (sc_xb(j) -  ;
                                 dxb(p)) *  ;
                                 wtxb1,  ;
                                 (dxb(p) -  ;
                                 sc_xb(j)) *  ;
                                 wtxb2)
                         IF dt >  ;
                            dk_sb +  ;
                            dk_xb
                              dt =  ;
                               dk_sb +  ;
                               dk_xb
                              sc_bc2(j) =  ;
                               clbc(p)
                         ENDIF
                    ENDFOR
                    sc_dt2 = sc_dt2 +  ;
                             dt
               ENDIF
          ENDFOR
          IF sc_dt1 > sc_dt2  ;
             .AND. sc_dt2 > 0
               sc_dt1 = sc_dt2
               FOR j = 1 TO cnt
                    sc_bc1(j) =  ;
                          sc_bc2(j)
               ENDFOR
          ENDIF
     ENDFOR
     IF sc_dt1 < 999999
          FOR i = 1 TO cnt
               IF  .NOT.  ;
                   EMPTY(sc_bc1(i))  ;
                   .AND.  ;
                   sc_bc1(i) <>  ;
                   sc_bc(i)
                    SELECT clfx
                    GOTO sc_rec(i)
                    SELECT time
                    SEEK sc_bc1(i) 
                    IF  .NOT.  ;
                        EOF()
                         m = IIF(xbsj <  ;
                             sbsj,  ;
                             1440 +  ;
                             xbsj,  ;
                             xbsj)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc,  ;
                                 clfx.lb  ;
                                 WITH  ;
                                 lb,  ;
                                 clfx.sbsj  ;
                                 WITH  ;
                                 sbsj,  ;
                                 clfx.xbsj  ;
                                 WITH  ;
                                 m,  ;
                                 clfx.zdcl  ;
                                 WITH  ;
                                 98
                         mcd = clfx.sbsk -  ;
                               sbsj
                         IF mcd >  ;
                            sjcd1
                              REPLACE  ;
                               clfx.cdss  ;
                               WITH  ;
                               IIF(sjcd2 >  ;
                               1,  ;
                               sjcd2 *  ;
                               (INT(mcd /  ;
                               sjcd2) +  ;
                               1),  ;
                               mcd),  ;
                               clfx.zdcl  ;
                               WITH  ;
                               80
                         ENDIF
                         mzt = m -  ;
                               clfx.xbsk
                         IF mzt >  ;
                            sjzt1
                              REPLACE  ;
                               clfx.ztss  ;
                               WITH  ;
                               IIF(sjzt2 >  ;
                               1,  ;
                               sjzt2 *  ;
                               (INT(mzt /  ;
                               sjzt2) +  ;
                               1),  ;
                               mzt),  ;
                               clfx.zdcl  ;
                               WITH  ;
                               IIF(clfx.zdcl =  ;
                               80,  ;
                               82,  ;
                               81)
                         ENDIF
                         IF clfx.cdss >=  ;
                            sjcd3  ;
                            .OR.  ;
                            clfx.ztss >=  ;
                            sjzt3
                              REPLACE  ;
                               clfx.kgss  ;
                               WITH  ;
                               ss,  ;
                               clfx.zdcl  ;
                               WITH  ;
                               85
                              REPLACE  ;
                               clfx.cdss  ;
                               WITH  ;
                               0,  ;
                               clfx.ztss  ;
                               WITH  ;
                               0
                         ELSE
                              REPLACE  ;
                               clfx.cqss  ;
                               WITH  ;
                               ss
                         ENDIF
                    ENDIF
               ENDIF
          ENDFOR
          SELECT clfx
          SKIP
     ENDIF
     SELECT clfx
ENDDO
RETURN
ENDPROC
**
PROCEDURE PreProcess
IF pub_language
     obj_form4.txt_msg.value = "Be preprocessing the datas..."
ELSE
     obj_form4.txt_msg.value = "正在预处理刷卡数据..."
ENDIF
SELECT ardata_
INDEX ON zgbh + riqi +  ;
      STR(shijian, 4) TAG zrs_d  ;
      DESCENDING ADDITIVE
SET ORDER TO zrs_d
GOTO TOP
mz = zgbh
md = CTOD(riqi)
mt = shijian
SKIP
DO WHILE  .NOT. EOF()
     IF mz <> zgbh .OR. md <>  ;
        CTOD(riqi) .OR. ABS(mt -  ;
        shijian) > sjcfsj
          IF mz = zgbh .AND. md =  ;
             CTOD(riqi) + 1 .AND.  ;
             ABS(shijian - 1440 -  ;
             mt) <= sjcfsj
               sqlexe_run(00000002319,  ;
                         SYS(16),  ;
                         "DELETE FROM KQ_ARDATA WHERE ID=?ID",  ;
                         "")
               DELETE
          ELSE
               mz = zgbh
               md = CTOD(riqi)
               mt = shijian
          ENDIF
     ELSE
          sqlexe_run(00000002327,  ;
                    SYS(16),  ;
                    "DELETE FROM KQ_ARDATA WHERE ID=?ID",  ;
                    "")
          DELETE
     ENDIF
     SKIP
ENDDO
SET ORDER TO zrs_a
SELECT xjjl_d
SET FILTER TO kqlb = 75;
.OR. kqlb = 76;
.OR. kqlb = 41;
.OR. (kqlb = 98;
.AND. kssj > 0;
.AND. jssj > 0);
.OR. (kqlb >= 93;
.AND. kqlb <= 94;
.AND. kssj > 0)
GOTO TOP
SCAN
     SELECT ardata_
     DO CASE
          CASE xjjl_d.kqlb = 98
               mflag = 0
               SET EXACT OFF
               SEEK xjjl_d.zgbh +  ;
                    xjjl_d.riqi 
               SET EXACT ON
               IF  .NOT. EOF()
                    mflag = chk_dupaddrecord()
               ENDIF
               IF mflag = 10 .OR.  ;
                  mflag = 11
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            xjjl_d.riqi,  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.kssj,  ;
                            addedflag  ;
                            WITH  ;
                            1
               ENDIF
               IF mflag = 1 .OR.  ;
                  mflag = 11
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            IIF(xjjl_d.jssj <  ;
                            xjjl_d.kssj,  ;
                            DTOC(CTOD(xjjl_d.riqi) +  ;
                            1),  ;
                            xjjl_d.riqi)
                    REPLACE shijian  ;
                            WITH  ;
                            xjjl_d.jssj,  ;
                            addedflag  ;
                            WITH  ;
                            1
               ENDIF
               IF mflag > 0 .AND.  ;
                  mflag < 99
                    REPLACE xjjl_d.mark  ;
                            WITH  ;
                            1
               ENDIF
          CASE xjjl_d.kqlb >= 93  ;
               .AND. xjjl_d.kqlb <=  ;
               94
               mflag = 0
               SET EXACT OFF
               SEEK xjjl_d.zgbh +  ;
                    xjjl_d.riqi 
               SET EXACT ON
               IF  .NOT. EOF()
                    mflag = chk_dupaddrecord()
               ENDIF
               IF mflag = 10 .OR.  ;
                  mflag = 11
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            xjjl_d.riqi,  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.kssj,  ;
                            addedflag  ;
                            WITH  ;
                            1
               ENDIF
               IF mflag = 1 .OR.  ;
                  mflag = 11
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            IIF(xjjl_d.jssj <  ;
                            xjjl_d.kssj,  ;
                            DTOC(CTOD(xjjl_d.riqi) +  ;
                            1),  ;
                            xjjl_d.riqi)
                    REPLACE shijian  ;
                            WITH  ;
                            xjjl_d.jssj,  ;
                            addedflag  ;
                            WITH  ;
                            1
               ENDIF
          CASE xjjl_d.kqlb = 75
               REPLACE xjjl_d.mark  ;
                       WITH 1
               APPEND BLANK
               IF xjjl_d.kssj >  ;
                  1440
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(CTOD(xjjl_d.riqi) +  ;
                            1),  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.kssj -  ;
                            1440
               ELSE
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            xjjl_d.riqi,  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.kssj
               ENDIF
               APPEND BLANK
               IF xjjl_d.jssj <  ;
                  xjjl_d.kssj
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(CTOD(xjjl_d.riqi) +  ;
                            1),  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.jssj
               ELSE
                    IF xjjl_d.jssj >  ;
                       1440
                         REPLACE zgbh  ;
                                 WITH  ;
                                 xjjl_d.zgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 DTOC(CTOD(xjjl_d.riqi) +  ;
                                 1),  ;
                                 shijian  ;
                                 WITH  ;
                                 xjjl_d.jssj -  ;
                                 1440
                    ELSE
                         REPLACE zgbh  ;
                                 WITH  ;
                                 xjjl_d.zgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 xjjl_d.riqi,  ;
                                 shijian  ;
                                 WITH  ;
                                 xjjl_d.jssj
                    ENDIF
               ENDIF
          CASE xjjl_d.kqlb = 76
               REPLACE xjjl_d.mark  ;
                       WITH 1
               APPEND BLANK
               IF xjjl_d.kssj >  ;
                  1440
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(CTOD(xjjl_d.riqi) +  ;
                            1),  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.kssj -  ;
                            1440
               ELSE
                    REPLACE zgbh  ;
                            WITH  ;
                            xjjl_d.zgbh,  ;
                            riqi  ;
                            WITH  ;
                            xjjl_d.riqi,  ;
                            shijian  ;
                            WITH  ;
                            xjjl_d.kssj
               ENDIF
          CASE xjjl_d.kqlb = 41
               REPLACE xjjl_d.mark  ;
                       WITH 1
               SET EXACT OFF
               SEEK xjjl_d.zgbh +  ;
                    xjjl_d.riqi 
               SET EXACT ON
               mkssj = xjjl_d.kssj
               mjssj = IIF(xjjl_d.kssj >  ;
                       xjjl_d.jssj,  ;
                       1440 +  ;
                       xjjl_d.jssj,  ;
                       xjjl_d.jssj)
               DO WHILE  .NOT.  ;
                  EOF() .AND.  ;
                  xjjl_d.zgbh= ;
                  zgbh .AND.  ;
                  xjjl_d.riqi= ;
                  riqi
                    IF xjjl_d.kssj =  ;
                       0 .AND.  ;
                       xjjl_d.jssj =  ;
                       0
                         DELETE
                    ELSE
                         IF shijian >=  ;
                            mkssj  ;
                            .AND.  ;
                            shijian <=  ;
                            mjssj
                              DELETE
                         ENDIF
                    ENDIF
                    SKIP
               ENDDO
               IF mjssj >= 1440
                    DO WHILE   ;
                       .NOT.  ;
                       EOF()  ;
                       .AND.  ;
                       xjjl_d.zgbh= ;
                       zgbh .AND.  ;
                       CTOD(xjjl_d.riqi)+ ;
                       1= ;
                       CTOD(riqi)
                         IF shijian >=  ;
                            0  ;
                            .AND.  ;
                            shijian <=  ;
                            mjssj -  ;
                            1440
                              DELETE
                         ENDIF
                         SKIP
                    ENDDO
               ENDIF
     ENDCASE
     SELECT xjjl_d
ENDSCAN
SELECT xjjl_d
SET RELATION TO bc INTO time
SET FILTER TO kqlb = 98
GOTO TOP
SCAN
     IF  .NOT. EMPTY(bc)
          SELECT ardata_
          SEEK xjjl_d.zgbh +  ;
               xjjl_d.riqi 
          IF FOUND()
               mrec = 0
               mzgbh = zgbh
               mdate = CTOD(riqi)
               msbsj = time.sbsj
               mxbsj = IIF(time.xbsj >  ;
                       time.sbsj,  ;
                       time.xbsj,  ;
                       1440 +  ;
                       time.xbsj)
               mcnt = 0
               DO CASE
                    CASE time.lb =  ;
                         "1"
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            mzgbh= ;
                            zgbh  ;
                            .AND.  ;
                            mdate= ;
                            CTOD(riqi)
                              IF (ABS(shijian -  ;
                                 msbsj) <  ;
                                 delta4  ;
                                 .OR.  ;
                                 ABS(shijian -  ;
                                 mxbsj) <  ;
                                 delta4)  ;
                                 .AND.  ;
                                 mark <  ;
                                 1
                                   IF mrec = 0
                                        mrec = RECNO()
                                   ENDIF
                                   REPLACE mark WITH 8
                                   mcnt = mcnt + 1
                              ENDIF
                              SKIP
                         ENDDO
                    CASE time.lb =  ;
                         "2"
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            mzgbh= ;
                            zgbh  ;
                            .AND.  ;
                            mdate= ;
                            CTOD(riqi)
                              IF (ABS(shijian -  ;
                                 msbsj) <  ;
                                 delta4  ;
                                 .OR.  ;
                                 ABS(shijian -  ;
                                 mxbsj) <  ;
                                 delta4)  ;
                                 .AND.  ;
                                 mark <  ;
                                 1
                                   IF mrec = 0
                                        mrec = RECNO()
                                   ENDIF
                                   REPLACE mark WITH 8
                                   mcnt = mcnt + 1
                              ENDIF
                              SKIP
                         ENDDO
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            mzgbh= ;
                            zgbh  ;
                            .AND.  ;
                            mdate= ;
                            CTOD(riqi)- ;
                            1  ;
                            .AND.  ;
                            shijian< ;
                            delta4* ;
                            2/3
                              IF (ABS(1440 +  ;
                                 shijian -  ;
                                 msbsj) <  ;
                                 delta4  ;
                                 .OR.  ;
                                 ABS(1440 +  ;
                                 shijian -  ;
                                 mxbsj) <  ;
                                 delta4)  ;
                                 .AND.  ;
                                 mark <  ;
                                 1
                                   IF mrec = 0
                                        mrec = RECNO()
                                   ENDIF
                                   REPLACE riqi WITH DTOC(mdate), shijian WITH 1440 + shijian, mark WITH 8
                                   mcnt = mcnt + 1
                              ENDIF
                              SKIP
                         ENDDO
                    CASE time.lb =  ;
                         "3"
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            mzgbh= ;
                            zgbh  ;
                            .AND.  ;
                            mdate= ;
                            CTOD(riqi)
                              IF (ABS(shijian -  ;
                                 msbsj) <  ;
                                 delta4  ;
                                 .OR.  ;
                                 ABS(shijian -  ;
                                 mxbsj) <  ;
                                 delta4)  ;
                                 .AND.  ;
                                 mark <  ;
                                 1
                                   IF mrec = 0
                                        mrec = RECNO()
                                   ENDIF
                                   REPLACE mark WITH 8
                                   mcnt = mcnt + 1
                              ENDIF
                              SKIP
                         ENDDO
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            mzgbh= ;
                            zgbh  ;
                            .AND.  ;
                            mdate= ;
                            CTOD(riqi)- ;
                            1
                              IF (ABS(1440 +  ;
                                 shijian -  ;
                                 msbsj) <  ;
                                 delta4  ;
                                 .OR.  ;
                                 ABS(1440 +  ;
                                 shijian -  ;
                                 mxbsj) <  ;
                                 delta4)  ;
                                 .AND.  ;
                                 mark <  ;
                                 1
                                   IF mrec = 0
                                        mrec = RECNO()
                                   ENDIF
                                   REPLACE riqi WITH DTOC(mdate), shijian WITH 1440 + shijian, mark WITH 8
                                   mcnt = mcnt + 1
                              ENDIF
                              SKIP
                         ENDDO
               ENDCASE
               IF mrec > 0
                    GOTO mrec
                    DO CASE
                         CASE mcnt =  ;
                              1
                              SELECT  ;
                               zg
                              SEEK  ;
                               mzgbh 
                              SELECT  ;
                               clfx
                              APPEND  ;
                               BLANK
                              REPLACE  ;
                               zgbh  ;
                               WITH  ;
                               mzgbh,  ;
                               riqi  ;
                               WITH  ;
                               DTOC(mdate),  ;
                               bc  ;
                               WITH  ;
                               time.bc,  ;
                               lb  ;
                               WITH  ;
                               time.lb
                              REPLACE  ;
                               sbsj  ;
                               WITH  ;
                               msbsj,  ;
                               xbsj  ;
                               WITH  ;
                               mxbsj,  ;
                               zdcl  ;
                               WITH  ;
                               73,  ;
                               rgcl  ;
                               WITH  ;
                               98
                              IF ABS(ardata_.shijian -  ;
                                 msbsj) >  ;
                                 ABS(ardata_.shijian -  ;
                                 mxbsj)
                                   REPLACE xbsk WITH ardata_.shijian
                              ELSE
                                   REPLACE sbsk WITH ardata_.shijian
                              ENDIF
                              REPLACE  ;
                               cqss  ;
                               WITH  ;
                               time.ss
                              SELECT  ;
                               ardata_
                         CASE mcnt >=  ;
                              2
                              SELECT  ;
                               zg
                              SEEK  ;
                               mzgbh 
                              SELECT  ;
                               clfx
                              APPEND  ;
                               BLANK
                              REPLACE  ;
                               zgbh  ;
                               WITH  ;
                               mzgbh,  ;
                               riqi  ;
                               WITH  ;
                               DTOC(mdate),  ;
                               bc  ;
                               WITH  ;
                               time.bc,  ;
                               lb  ;
                               WITH  ;
                               time.lb
                              REPLACE  ;
                               sbsk  ;
                               WITH  ;
                               ardata_.shijian,  ;
                               sbsj  ;
                               WITH  ;
                               msbsj,  ;
                               xbsj  ;
                               WITH  ;
                               mxbsj,  ;
                               rgcl  ;
                               WITH  ;
                               98
                              SELECT  ;
                               ardata_
                              i =  ;
                               1
                              DO WHILE  ;
                                 i< ;
                                 mcnt- ;
                                 1
                                   SKIP
                                   REPLACE mark WITH 9
                                   i = i + 1
                              ENDDO
                              SKIP
                              SELECT  ;
                               clfx
                              REPLACE  ;
                               xbsk  ;
                               WITH  ;
                               ardata_.shijian
                              mcd =  ;
                               sbsk -  ;
                               sbsj
                              IF mcd >  ;
                                 sjcd1  ;
                                 .AND.  ;
                                 rgcl =  ;
                                 0
                                   REPLACE cdss WITH IIF(sjcd2 > 1, sjcd2 * (INT(mcd / sjcd2) + 1), mcd)
                                   REPLACE zdcl WITH 80
                              ENDIF
                              mzt =  ;
                               xbsj -  ;
                               xbsk
                              IF mzt >  ;
                                 sjzt1  ;
                                 .AND.  ;
                                 rgcl =  ;
                                 0
                                   REPLACE ztss WITH IIF(sjzt2 > 1, sjzt2 * (INT(mzt / sjzt2) + 1), mzt)
                                   REPLACE zdcl WITH IIF(zdcl = 80, 82, 81)
                              ENDIF
                              IF (cdss >=  ;
                                 sjcd3  ;
                                 .OR.  ;
                                 ztss >=  ;
                                 sjzt3)  ;
                                 .AND.  ;
                                 rgcl =  ;
                                 0
                                   REPLACE kgss WITH time.ss
                                   REPLACE zdcl WITH 85
                                   REPLACE cdss WITH 0, ztss WITH 0
                              ELSE
                                   REPLACE cqss WITH time.ss
                              ENDIF
                              SELECT  ;
                               ardata_
                    ENDCASE
               ENDIF
               IF mcnt > 0
                    REPLACE xjjl_d.mark  ;
                            WITH  ;
                            1
               ENDIF
          ENDIF
          SELECT xjjl_d
     ENDIF
ENDSCAN
SELECT clfx
SET RELATION TO bc INTO time
GOTO TOP
SET EXACT ON
SELECT xjjl_d
SET FILTER TO (kqlb = 92;
.OR. kqlb = 93;
.OR. kqlb = 94;
.OR. kqlb = 97;
.OR. (kqlb > 0;
.AND. kqlb < 31);
.OR. kqlb = 98);
.AND. mark <> 1
mzgbh = ""
mdate = CTOD("")
mkqlb = 0
mbc = ""
mjbattr = 0
mkssj = 0
mjssj = 0
mss = 0
mts = 0
mrec = RECNO()
SCAN
     IF mzgbh <> zgbh .OR. mkqlb <>  ;
        kqlb .OR. mbc <> bc .OR.  ;
        mjbattr <> jbattr .OR.  ;
        mdate <> CTOD(riqi)
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mkqlb = kqlb
          mbc = bc
          mjbattr = jbattr
          mkssj = kssj
          mjssj = IIF(kssj >=  ;
                  jssj, 1440 +  ;
                  jssj, jssj)
          mss = ss
          mts = ts
          mrec = RECNO()
          LOOP
     ENDIF
     nkssj = kssj
     njssj = IIF(kssj >= jssj,  ;
             1440 + jssj, jssj)
     DO CASE
          CASE ABS(mjssj - nkssj) <  ;
               10
               REPLACE mark WITH  ;
                       1
               mjssj = jssj
               mss = mss + ss
               mts = mts + ts
               DELETE
               GOTO mrec
               REPLACE jssj WITH  ;
                       mjssj, ss  ;
                       WITH mss,  ;
                       ts WITH  ;
                       mts
          CASE ABS(njssj - mkssj) <  ;
               10
               REPLACE mark WITH  ;
                       1
               mkssj = kssj
               mss = mss + ss
               mts = mts + ts
               DELETE
               GOTO mrec
               REPLACE kssj WITH  ;
                       mkssj, ss  ;
                       WITH mss,  ;
                       ts WITH  ;
                       mts
     ENDCASE
ENDSCAN
SET RELATION TO bc INTO bctmp
GOTO TOP
SELECT ardata_
SET FILTER TO mark < 8
SET RELATION TO zgbh INTO zg
GOTO TOP
mz = ''
SCAN
     IF CTOD(zg.jzsj) <> CTOD("")
          IF CTOD(riqi) <  ;
             CTOD(zg.jzsj) - 1
               DELETE
          ENDIF
     ENDIF
     IF CTOD(zg.lzsj) <> CTOD("")
          IF CTOD(riqi) >  ;
             CTOD(zg.lzsj) + 1
               DELETE
          ENDIF
     ENDIF
     IF mz = zgbh .AND. md =  ;
        CTOD(riqi) .AND. mt =  ;
        shijian .AND. mi = io
          DELETE
     ELSE
          mz = zgbh
          md = CTOD(riqi)
          mt = shijian
          mi = io
     ENDIF
ENDSCAN
GOTO TOP
IF  .NOT. EOF()
     recptr = RECNO()
     mzgbh = zgbh
     mdate = CTOD(riqi) - 1
ENDIF
RETURN
ENDPROC
**
FUNCTION chk_DupAddRecord
mret = 0
mkssj = IIF(xjjl_d.kssj >= 1440,  ;
        xjjl_d.kssj - 1440,  ;
        xjjl_d.kssj)
mjssj = IIF(xjjl_d.jssj >= 1440,  ;
        xjjl_d.jssj - 1440,  ;
        xjjl_d.jssj)
mrec = RECNO()
DO WHILE mret=0
     IF mkssj >= shijian - 60  ;
        .AND. mkssj <= shijian -  ;
        60
          mret = mret + 10
     ENDIF
     IF mjssj >= shijian - 60  ;
        .AND. mjssj <= shijian -  ;
        60
          mret = mret + 1
     ENDIF
     IF xjjl_d.zgbh <> zgbh .OR.  ;
        xjjl_d.riqi < riqi
          mret = 99
     ELSE
          SKIP
          IF EOF()
               mret = 99
          ENDIF
     ENDIF
ENDDO
GOTO mrec
RETURN mret
ENDFUNC
**
FUNCTION ModiSk_jb
PARAMETER l_sks, l_sjs, l_jbss,  ;
          l_jbks, l_jbjs
l_ret = 0
l_tks = l_sks
l_tjs = l_sjs
IF l_jbks = 0 .AND. l_jbjs = 0
     mdt = l_jbss / (l_sjs -  ;
           l_sks)
     IF mdt > 0.8  .AND. mdt <  ;
        1.2 
          l_ret = 1
     ELSE
          IF l_sjs - l_jbss >  ;
             l_sks .AND. l_jbss <  ;
             7.5 
               l_tjs = l_sjs -  ;
                       l_jbss
          ENDIF
     ENDIF
ELSE
     i_jbks = 9999
     i_jbjs = 9999
     i_jbtype = 0
     DO CASE
          CASE l_jbks >= l_sks  ;
               .AND. l_jbks <=  ;
               l_sjs .AND. l_jbjs >=  ;
               l_sks .AND. l_jbjs <=  ;
               l_sjs
               i_jbks = l_jbks -  ;
                        l_sks
               i_jbjs = l_sjs -  ;
                        l_jbjs
               i_jbtype = 1
          CASE l_jbks <= l_sks  ;
               .AND. l_jbks <=  ;
               l_sjs .AND. l_jbjs >=  ;
               l_sks .AND. l_jbjs >=  ;
               l_sjs
               i_jbks = l_sks -  ;
                        l_jbks
               i_jbjs = l_jbjs -  ;
                        l_sjs
               i_jbtype = 2
          CASE l_jbks <= l_sks  ;
               .AND. l_jbks <=  ;
               l_sjs .AND. l_jbjs >=  ;
               l_sks .AND. l_jbjs <=  ;
               l_sjs
               i_jbks = l_sks -  ;
                        l_jbks
               i_jbjs = l_sjs -  ;
                        l_jbjs
               i_jbtype = 3
          CASE l_jbks >= l_sks  ;
               .AND. l_jbks <=  ;
               l_sjs .AND. l_jbjs >=  ;
               l_sks .AND. l_jbjs >=  ;
               l_sjs
               i_jbks = l_jbks -  ;
                        l_sks
               i_jbjs = l_jbjs -  ;
                        l_sjs
               i_jbtype = 4
     ENDCASE
     DO CASE
          CASE i_jbks <  ;
               i_jbdelta1 .AND.  ;
               i_jbjs <  ;
               i_jbdelta1
               l_ret = 1
          CASE i_jbks = 9999  ;
               .AND. i_jbjs =  ;
               9999
          OTHERWISE
               DO CASE
                    CASE i_jbtype =  ;
                         1
                         IF i_jbks <=  ;
                            i_jbjs
                              l_tks =  ;
                               l_jbjs
                         ELSE
                              l_tjs =  ;
                               l_jbks
                         ENDIF
                    CASE i_jbtype =  ;
                         3
                         l_tks = l_jbjs
                    CASE i_jbtype =  ;
                         4
                         l_tjs = l_jbks
               ENDCASE
     ENDCASE
ENDIF
RETURN l_ret
ENDFUNC
**
FUNCTION chkjb
PARAMETER m_sb1, m_xb1, m_mode
m_xb1 = m_xb1 + IIF(m_xb1 < m_sb1,  ;
        1440, 0)
IF m_mode = 0
     m_sb2 = pub_jbks(1,  ;
             pub_jbqj_no)
     m_xb2 = IIF(pub_jbjs(1,  ;
             pub_jbqj_no) <  ;
             pub_jbks(1,  ;
             pub_jbqj_no), 1440 +  ;
             pub_jbjs(1,  ;
             pub_jbqj_no),  ;
             pub_jbjs(1,  ;
             pub_jbqj_no))
ELSE
     m_sb2 = pub_jbks(2,  ;
             pub_jbqj_no)
     m_xb2 = IIF(pub_jbjs(2,  ;
             pub_jbqj_no) <  ;
             pub_jbks(2,  ;
             pub_jbqj_no), 1440 +  ;
             pub_jbjs(2,  ;
             pub_jbqj_no),  ;
             pub_jbjs(2,  ;
             pub_jbqj_no))
ENDIF
IF m_sb2 = 0 .OR. m_xb2 = 0
     ret = -1
ELSE
     ret = 0
     kdelta9 = IIF(delta9 *  ;
               pub_jbss(1,  ;
               pub_jbqj_no) <  ;
               delta9max, delta9 *  ;
               pub_jbss(1,  ;
               pub_jbqj_no),  ;
               delta9max)
     DO CASE
          CASE m_sb2 >= m_sb1  ;
               .AND. m_sb2 <=  ;
               m_xb1 .AND. m_xb2 >=  ;
               m_sb1 .AND. m_xb2 <=  ;
               m_xb1
               IF m_sb2 - m_sb1 <  ;
                  kdelta9 .AND.  ;
                  m_xb1 - m_xb2 <  ;
                  kdelta9
                    ret = -9999
               ENDIF
          CASE m_sb2 <= m_sb1  ;
               .AND. m_sb2 <=  ;
               m_xb1 .AND. m_xb2 >=  ;
               m_sb1 .AND. m_xb2 <=  ;
               m_xb1
               IF m_sb1 - m_sb2 <  ;
                  kdelta9 .AND.  ;
                  m_xb1 - m_xb2 <  ;
                  kdelta9
                    ret = -9999
               ENDIF
          CASE m_sb2 >= m_sb1  ;
               .AND. m_sb2 <=  ;
               m_xb1 .AND. m_xb2 >=  ;
               m_sb1 .AND. m_xb2 >=  ;
               m_xb1
               IF m_sb2 - m_sb1 <  ;
                  kdelta9 .AND.  ;
                  m_xb2 - m_xb1 <  ;
                  kdelta9
                    ret = -9999
               ENDIF
     ENDCASE
ENDIF
RETURN ret
ENDFUNC
**
PROCEDURE WriteZtwc
msele = LTRIM(STR(SELECT()))
SELECT ztwc
IF sktabsel > tabptr + 1
     APPEND BLANK
     REPLACE zgbh WITH mzgbh,  ;
             riqi WITH  ;
             DTOC(mdate)
     IF bctabsel > 0
          REPLACE bc WITH  ;
                  bctabbh(bctabsel)
     ENDIF
     m = IIF(sktab(tabptr + 1) >=  ;
         0, IIF(sktab(tabptr + 1) <=  ;
         1440, sktab(tabptr + 1),  ;
         sktab(tabptr + 1) -  ;
         1440), 1440 +  ;
         sktab(tabptr + 1))
     REPLACE sk1 WITH m
ENDIF
FOR i = tabptr + 2 TO sktabsel -  ;
    1
     m = IIF(sktab(i) >= 0,  ;
         IIF(sktab(i) <= 1440,  ;
         sktab(i), sktab(i) -  ;
         1440), 1440 + sktab(i))
     IF sk2 > 0
          APPEND BLANK
          REPLACE zgbh WITH mzgbh,  ;
                  riqi WITH  ;
                  DTOC(mdate)
          IF bctabsel > 0
               REPLACE bc WITH  ;
                       bctabbh(bctabsel)
          ENDIF
          REPLACE sk1 WITH m
     ELSE
          REPLACE sk2 WITH m
          REPLACE ss WITH  ;
                  (IIF(sk2 >= sk1,  ;
                  0, 1440) + sk2 -  ;
                  sk1) / 60
          REPLACE ts WITH  ;
                  (IIF(sk2 >= sk1,  ;
                  0, 1440) + sk2 -  ;
                  sk1) / sjcq
     ENDIF
ENDFOR
SELECT &msele
RETURN
ENDPROC
**
PROCEDURE ModiSk_1440
PARAMETER para_sb, para_xb
modisk_1440_sb = para_sb
modisk_1440_xb = para_xb
mx = 0
DO WHILE modisk_1440_sb>=1440+ ;
   delta0
     modisk_1440_sb = modisk_1440_sb -  ;
                      1440
     mx = mx + 1
ENDDO
my = 0
DO WHILE modisk_1440_xb>=1440  ;
   .AND. modisk_1440_xb-1440>= ;
   modisk_1440_sb .AND. my<mx
     modisk_1440_xb = modisk_1440_xb -  ;
                      1440
     my = my + 1
ENDDO
RETURN
ENDPROC
**
PROCEDURE GetJbQj
FOR i = 1 TO 3
     FOR j = 1 TO 3
          STORE 0 TO pub_jbss(i,  ;
                j), pub_jblb(i,  ;
                j), pub_jbks(i,  ;
                j), pub_jbjs(i,  ;
                j), pub_jbbcks(i,  ;
                j), pub_jbbcjs(i,  ;
                j), pub_jbbcss(i,  ;
                j)
          STORE 0 TO pub_qjss(i,  ;
                j), pub_qjlb(i,  ;
                j), pub_qjks(i,  ;
                j), pub_qjjs(i,  ;
                j), pub_qjbcks(i,  ;
                j), pub_qjbcjs(i,  ;
                j), pub_qjbcss(i,  ;
                j)
          STORE 0 TO pub_cqss(i,  ;
                j), pub_cqks(i,  ;
                j), pub_cqjs(i,  ;
                j), pub_cqbcks(i,  ;
                j), pub_cqbcjs(i,  ;
                j), pub_cqbcss(i,  ;
                j)
          STORE "" TO pub_jbbc(i,  ;
                j), pub_qjbc(i,  ;
                j), pub_cqbc(i,  ;
                j)
     ENDFOR
ENDFOR
SELECT xjjl_d
SET EXACT OFF
SEEK mzgbh 
IF  .NOT. EOF()
     DO WHILE  .NOT. EOF() .AND.  ;
        zgbh=mzgbh .AND.  ;
        CTOD(riqi)<mdate
          SKIP
     ENDDO
ENDIF
gj_recno = RECNO()
IF  .NOT. EOF()
     FOR i = 1 TO 3
          j = 0
          DO WHILE  .NOT. EOF()  ;
             .AND. zgbh=mzgbh  ;
             .AND. CTOD(riqi)= ;
             mdate+i-1
               DO CASE
                    CASE kqlb =  ;
                         98 .AND.  ;
                         kssj > 0  ;
                         .AND.  ;
                         jssj >  ;
                         0
                         IF j < 3
                              j =  ;
                               j +  ;
                               1
                              pub_cqss(i,  ;
                               j) =  ;
                               ss
                              pub_cqks(i,  ;
                               j) =  ;
                               kssj
                              pub_cqjs(i,  ;
                               j) =  ;
                               IIF(jssj >=  ;
                               kssj,  ;
                               jssj,  ;
                               1440 +  ;
                               jssj)
                              IF   ;
                               .NOT.  ;
                               EMPTY(bc)
                                   pub_cqbc(i, j) = bc
                                   pub_cqbcks(i, j) = bctmp.sbsj
                                   pub_cqbcjs(i, j) = IIF(bctmp.xbsj >= bctmp.sbsj, bctmp.xbsj, 1440 + bctmp.xbsj)
                                   pub_cqbcss(i, j) = IIF(bctmp.xbsj < bctmp.sbsj, 1440, 0) + bctmp.xbsj - bctmp.sbsj - bctmp.zjxx
                              ENDIF
                         ENDIF
                    CASE (kqlb >=  ;
                         92 .AND.  ;
                         kqlb <=  ;
                         94) .OR.  ;
                         kqlb =  ;
                         97
                         IF j < 3
                              j =  ;
                               j +  ;
                               1
                              pub_jblb(i,  ;
                               j) =  ;
                               kqlb
                              pub_jbss(i,  ;
                               j) =  ;
                               ss
                              pub_jbks(i,  ;
                               j) =  ;
                               kssj
                              pub_jbjs(i,  ;
                               j) =  ;
                               IIF(jssj >=  ;
                               kssj,  ;
                               jssj,  ;
                               1440 +  ;
                               jssj)
                              IF   ;
                               .NOT.  ;
                               EMPTY(bc)
                                   pub_jbbc(i, j) = bc
                                   pub_jbbcks(i, j) = bctmp.sbsj
                                   pub_jbbcjs(i, j) = IIF(bctmp.xbsj >= bctmp.sbsj, bctmp.xbsj, 1440 + bctmp.xbsj)
                                   pub_jbbcss(i, j) = IIF(bctmp.xbsj < bctmp.sbsj, 1440, 0) + bctmp.xbsj - bctmp.sbsj - bctmp.zjxx
                              ENDIF
                         ENDIF
               ENDCASE
               SKIP
          ENDDO
     ENDFOR
     GOTO gj_recno
     FOR i = 1 TO 3
          j = 0
          DO WHILE  .NOT. EOF()  ;
             .AND. zgbh=mzgbh  ;
             .AND. CTOD(riqi)= ;
             mdate+i-1
               DO CASE
                    CASE kqlb >=  ;
                         1 .AND.  ;
                         kqlb <=  ;
                         30
                         IF j < 3
                              j =  ;
                               j +  ;
                               1
                              pub_qjlb(i,  ;
                               j) =  ;
                               kqlb
                              pub_qjss(i,  ;
                               j) =  ;
                               ss
                              pub_qjks(i,  ;
                               j) =  ;
                               kssj
                              pub_qjjs(i,  ;
                               j) =  ;
                               IIF(jssj >=  ;
                               kssj,  ;
                               jssj,  ;
                               1440 +  ;
                               jssj)
                              IF   ;
                               .NOT.  ;
                               EMPTY(bc)
                                   pub_qjbc(i, j) = bc
                                   pub_qjbcks(i, j) = bctmp.sbsj
                                   pub_qjbcjs(i, j) = IIF(bctmp.xbsj >= bctmp.sbsj, bctmp.xbsj, 1440 + bctmp.xbsj)
                                   pub_qjbcss(i, j) = IIF(bctmp.xbsj < bctmp.sbsj, 1440, 0) + bctmp.xbsj - bctmp.sbsj - bctmp.zjxx
                              ENDIF
                         ENDIF
               ENDCASE
               SKIP
          ENDDO
     ENDFOR
ENDIF
SET EXACT ON
RETURN
ENDPROC
**
FUNCTION ChkDup
LPARAMETERS cd_sbsk1, cd_xbsk1,  ;
            cd_sbsk2, cd_xbsk2
IF cd_sbsk1 = 0 .OR. cd_xbsk1 = 0  ;
   .OR. cd_sbsk2 = 0 .OR.  ;
   cd_xbsk2 = 0
     RETURN 0
ENDIF
DO modisk_1440 WITH cd_sbsk1,  ;
   IIF(cd_xbsk1<cd_sbsk1, 1440+ ;
   cd_xbsk1, cd_xbsk1)
mcd_sbsk1 = modisk_1440_sb
mcd_xbsk1 = modisk_1440_xb
mcd_sbsk2 = cd_sbsk2
mcd_xbsk2 = IIF(cd_xbsk2 <  ;
            cd_sbsk2, 1440 +  ;
            cd_xbsk2, cd_xbsk2)
DO CASE
     CASE ABS(mcd_sbsk2 -  ;
          mcd_sbsk1) <= 120 .AND.  ;
          ABS(mcd_xbsk2 -  ;
          mcd_xbsk1) <= 120
          cd_ret = 4
     CASE mcd_sbsk1 >= mcd_sbsk2  ;
          .AND. mcd_sbsk1 <=  ;
          mcd_xbsk2 .AND.  ;
          mcd_xbsk1 >= mcd_sbsk2  ;
          .AND. mcd_xbsk1 <=  ;
          mcd_xbsk2
          cd_ret = 3
     CASE mcd_sbsk2 >= mcd_sbsk1  ;
          .AND. mcd_sbsk2 <=  ;
          mcd_xbsk1 .AND.  ;
          mcd_xbsk2 >= mcd_sbsk1  ;
          .AND. mcd_xbsk2 <=  ;
          mcd_xbsk1
          cd_ret = 3
     CASE mcd_sbsk1 >= mcd_sbsk2  ;
          .AND. mcd_sbsk1 <=  ;
          mcd_xbsk2 .AND.  ;
          (mcd_xbsk1 < mcd_sbsk2  ;
          .OR. mcd_xbsk1 >  ;
          mcd_xbsk2)
          IF mcd_sbsk1 -  ;
             mcd_sbsk2 >  ;
             mcd_xbsk2 -  ;
             mcd_sbsk1
               cd_ret = 2
          ELSE
               cd_ret = 2.5 
          ENDIF
     CASE mcd_sbsk2 >= mcd_sbsk1  ;
          .AND. mcd_sbsk2 <=  ;
          mcd_xbsk1 .AND.  ;
          (mcd_xbsk2 < mcd_sbsk1  ;
          .OR. mcd_xbsk2 >  ;
          mcd_xbsk1)
          IF mcd_xbsk2 -  ;
             mcd_xbsk1 >  ;
             mcd_xbsk1 -  ;
             mcd_sbsk2
               cd_ret = 2
          ELSE
               cd_ret = 2.5 
          ENDIF
     CASE (mcd_sbsk1 < mcd_sbsk2  ;
          .OR. mcd_sbsk1 >  ;
          mcd_xbsk2) .AND.  ;
          mcd_xbsk1 >= mcd_sbsk2  ;
          .AND. mcd_xbsk1 <=  ;
          mcd_xbsk2
          IF mcd_xbsk2 -  ;
             mcd_xbsk1 >  ;
             mcd_xbsk1 -  ;
             mcd_sbsk2
               cd_ret = 2
          ELSE
               cd_ret = 2.5 
          ENDIF
     CASE (mcd_sbsk2 < mcd_sbsk1  ;
          .OR. mcd_sbsk2 >  ;
          mcd_xbsk1) .AND.  ;
          mcd_xbsk2 >= mcd_sbsk1  ;
          .AND. mcd_xbsk2 <=  ;
          mcd_xbsk1
          IF mcd_sbsk1 -  ;
             mcd_sbsk2 >  ;
             mcd_xbsk2 -  ;
             mcd_sbsk1
               cd_ret = 2
          ELSE
               cd_ret = 2.5 
          ENDIF
     OTHERWISE
          cd_ret = 1
ENDCASE
RETURN cd_ret
ENDFUNC
**
FUNCTION ChkDupForAll
LPARAMETERS cda_start, cda_end,  ;
            cda_day
cda_ret = 0
cda_jbks = pub_jbks(cda_day,  ;
           pub_jbqj_no)
cda_jbjs = pub_jbjs(cda_day,  ;
           pub_jbqj_no)
IF (cda_jbks = 0 .OR. cda_jbjs =  ;
   0) .AND. pub_jbss(cda_day,  ;
   pub_jbqj_no) > 0
     FOR cda_i = cda_start TO  ;
         cda_end - 1
          cda_rate = (sktab(cda_i +  ;
                     1) -  ;
                     sktab(cda_i)) /  ;
                     pub_jbss(cda_day,  ;
                     pub_jbqj_no)
          IF cda_rate >= 0.9   ;
             .AND. cda_rate <=  ;
             1.1 
               cda_ret = cda_i
               EXIT
          ENDIF
     ENDFOR
ELSE
     IF cda_jbks > 0 .AND.  ;
        cda_jbjs > 0
          FOR cda_i = cda_start  ;
              TO cda_end - 1
               IF chkdup(sktab(cda_i),  ;
                  sktab(cda_i +  ;
                  1), cda_jbks,  ;
                  cda_jbjs) = 4
                    cda_ret = cda_i
                    EXIT
               ENDIF
          ENDFOR
     ENDIF
ENDIF
RETURN cda_ret
ENDFUNC
**
FUNCTION Chk98
LPARAMETERS chk98_zgbh,  ;
            chk98_riqi
chk98_sele = LTRIM(STR(SELECT()))
chk98_ret = .F.
SELECT xjjl_d
chk98_filter = FILTER()
SET FILTER TO
SEEK chk98_zgbh + chk98_riqi 
DO WHILE  .NOT. EOF() .AND.  ;
   chk98_zgbh=zgbh .AND.  ;
   chk98_riqi=riqi
     IF kqlb = 98 .AND. mark = 1
          chk98_ret = .T.
          EXIT
     ENDIF
     SKIP
ENDDO
set filter to &chk98_filter 
select &chk98_sele	
RETURN chk98_ret
ENDFUNC
**
PROCEDURE skproc_end_modify
REPLACE bc WITH bctabbh(bctabsel),  ;
        lb WITH time.lb
REPLACE sbsj WITH  ;
        bctabsb(bctabsel), xbsj  ;
        WITH bctabxb(bctabsel)
REPLACE zdcl WITH 98
ksbsj = sbsj
kxbsj = IIF(xbsj < sbsj, 1440 +  ;
        xbsj, xbsj)
ksbsk = sbsk
kxbsk = IIF(xbsk < sbsk, 1440 +  ;
        xbsk, xbsk)
mcd = ksbsk - ksbsj
mzt = kxbsj - kxbsk
IF mcd > sjcd1 .OR. mzt > sjzt1
     IF  .NOT. chk98(mzgbh,  ;
         DTOC(mdate))
          IF mcd > sjcd1
               REPLACE cdss WITH  ;
                       IIF(sjcd2 >  ;
                       1, sjcd2 *  ;
                       (INT(mcd /  ;
                       sjcd2) +  ;
                       1), mcd)
               REPLACE zdcl WITH  ;
                       80
          ENDIF
          IF mzt > sjzt1
               REPLACE ztss WITH  ;
                       IIF(sjzt2 >  ;
                       1, sjzt2 *  ;
                       (INT(mzt /  ;
                       sjzt2) +  ;
                       1), mzt)
               REPLACE zdcl WITH  ;
                       IIF(zdcl =  ;
                       80, 82,  ;
                       81)
          ENDIF
     ENDIF
ENDIF
IF cdss >= sjcd3 .OR. ztss >=  ;
   sjzt3
     REPLACE kgss WITH  ;
             bctabss(bctabsel)
     REPLACE zdcl WITH 85
     REPLACE cdss WITH 0, ztss  ;
             WITH 0
ELSE
     REPLACE kgss WITH 0
     REPLACE cqss WITH  ;
             bctabss(bctabsel)
ENDIF
RETURN
ENDPROC
**
