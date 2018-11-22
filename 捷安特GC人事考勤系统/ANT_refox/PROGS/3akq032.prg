DO prginit
IF  .NOT. pub_escape
     DO fenxi1
     DO fenxi6
     DO fenxi3
     DO fenxi2
     DO fenxi4
     DO jjrjb
     DO xrjb
     DO fenxi5
     DO fenxi7
     DO fenxi7_1
     DO fenxi8
     DO jjrkq
     mserver = getantenv("SERVER",  ;
               "ANT2000")
     mp = mserver +  ;
          "function\kqfx_add.fxp"
     IF FILE(mp)
          do &mp
     ENDIF
ENDIF
DO prgterm
RETURN
ENDPROC
**
PROCEDURE prginit
IF pub_language
     obj_form4.txt_msg.value = "Be analysing for attendance,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在进行综合分析，请等待..."
ENDIF
PUBLIC njbflag
njbflag = getantenv("FXPARA",  ;
          "NJBFLAG")
PUBLIC bctabbou, bctabsel,  ;
       bctabcnt
bctabbou = 30
PUBLIC bctabbh(bctabbou),  ;
       bctabsb(bctabbou),  ;
       bctabxb(bctabbou),  ;
       bctabss(bctabbou),  ;
       bctabts(bctabbou),  ;
       bctablb(bctabbou)
PUBLIC delta4
delta4 = getantenv("FXPARA",  ;
         "DELTA4")
pub_escape = .F.
sqlexe_run(00000000066, SYS(16),  ;
          "select * from kq_xjjl_s",  ;
          "xjjl_s")
sqlexe_run(00000000068, SYS(16),  ;
          "select * from kq_xjjl_j",  ;
          "xjjl_j")
SELECT xjjl_j
INDEX ON STR(mm, 2) + STR(dd, 2)  ;
      TO xjjl_j
SELECT xjjl_d
SET FILTER TO
INDEX ON zgbh + riqi TO xjjl_d
strsql = "select distinct "
strsql = strsql +  ;
         "kq_xjjl_w.* from kq_xjjl_w,kq_zg where kq_xjjl_w.RIQI>=?ndate and kq_xjjl_w.RIQI<=?kdate"
strsql = strsql +  ;
         " and kq_xjjl_w.zgbh=kq_zg.zgbh and " +  ;
         STRTRAN(str_bmbh, "@",  ;
         "kq_zg.BMBH")
strsql = strsql +  ;
         STRTRAN(pub_zgbh_filter,  ;
         "@", "kq_xjjl_w")
sqlexe_run(00000000080, SYS(16),  ;
          "select * from kq_xjjl_w",  ;
          "xjjl_w")
SELECT xjjl_w
INDEX ON zgbh TO xjjl_w
SELECT clfx
INDEX ON zgbh + riqi + IIF(sbsk >  ;
      0, STR(sbsk, 4), STR(xbsk,  ;
      4)) TO clfx
SET RELATION TO bc INTO time
GOTO TOP
SET ESCAPE ON
SET EXACT ON
ON ESCAPE DO P_ESC
RETURN
ENDPROC
**
PROCEDURE prgterm
RELEASE delta0, njbflag, bctabbou,  ;
        bctabsel, bctabcnt,  ;
        bctabbh, bctabsb, bctabxb,  ;
        bctabss, bctabts,  ;
        bctablb
RELEASE delta4
SET ESCAPE OFF
SET EXACT OFF
RETURN
ENDPROC
**
PROCEDURE fenxi1
delta4err = getantenv("FXPARA",  ;
            "DELTA4ERR")
SET EXACT OFF
SELECT zg
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "The first scanning..." +  ;
           zgbh
     ELSE
          obj_form4.txt_msg1.value =  ;
           "第一趟扫描..." +  ;
           zgbh
     ENDIF
     IF EMPTY(ksbc)
          LOOP
     ENDIF
     i = pub_kaishiriqi
     j = .T.
     SELECT clfx
     SEEK zg.zgbh 
     mgetbctab_flag = .F.
     DO WHILE i<=pub_jieshuriqi  ;
        .AND.  .NOT. pub_escape
          IF pub_language
               obj_form4.txt_msg1.value =  ;
                "The first scanning..." +  ;
                zgbh
          ELSE
               obj_form4.txt_msg1.value =  ;
                "第一趟扫描..." +  ;
                zgbh
          ENDIF
          mappendrec = -1
          IF (EOF() .OR. zgbh <>  ;
             zg.zgbh .OR.  ;
             CTOD(riqi) <> i)  ;
             .AND. i >=  ;
             CTOD(zg.jzsj) .AND.  ;
             (i < CTOD(zg.lzsj)  ;
             .OR. CTOD(zg.lzsj) =  ;
             CTOD(""))
               APPEND BLANK
               REPLACE zgbh WITH  ;
                       zg.zgbh,  ;
                       riqi WITH  ;
                       DTOC(i)
               mappendrec = RECNO()
          ENDIF
          mcqss = 0
          IF CTOD(riqi) <= i
               mdate = CTOD(riqi)
               DO WHILE  .NOT.  ;
                  EOF() .AND.  ;
                  zgbh=zg.zgbh  ;
                  .AND. mdate= ;
                  CTOD(riqi)  ;
                  .AND.  .NOT.  ;
                  pub_escape
                    mcqss = mcqss +  ;
                            1
                    SKIP
               ENDDO
               IF  .NOT. BOF()  ;
                   .AND. zgbh <>  ;
                   zg.zgbh
                    SKIP -1
               ENDIF
          ENDIF
          IF (sbsk > 0 .AND. xbsk =  ;
             0) .OR. (sbsk = 0  ;
             .AND. xbsk > 0)
               mtime = IIF(sbsk >  ;
                       0, sbsk,  ;
                       xbsk)
          ELSE
               mtime = 0
          ENDIF
          IF mtime > 0 .AND. rgcl =  ;
             0 .AND. zdcl >= 71  ;
             .AND. zdcl <= 73  ;
             .AND. cqss = 0
               nriqi = riqi
               nrec = RECNO()
               SKIP
               IF (sbsk > 0 .AND.  ;
                  xbsk = 0) .OR.  ;
                  (sbsk = 0 .AND.  ;
                  xbsk > 0)
                    ntime = IIF(sbsk >  ;
                            0,  ;
                            sbsk,  ;
                            xbsk)
               ELSE
                    ntime = 0
               ENDIF
               IF  .NOT. EOF()  ;
                   .AND. zgbh =  ;
                   zg.zgbh .AND.  ;
                   riqi = nriqi  ;
                   .AND. ntime >  ;
                   0 .AND. rgcl =  ;
                   0 .AND. zdcl >=  ;
                   71 .AND. zdcl <=  ;
                   73 .AND. cqss =  ;
                   0
                    DELETE
                    GOTO nrec
                    IF sbsk = 0
                         REPLACE sbsk  ;
                                 WITH  ;
                                 ntime,  ;
                                 zdcl  ;
                                 WITH  ;
                                 73
                    ELSE
                         REPLACE xbsk  ;
                                 WITH  ;
                                 ntime,  ;
                                 zdcl  ;
                                 WITH  ;
                                 73
                    ENDIF
               ELSE
                    GOTO nrec
               ENDIF
          ENDIF
          IF mappendrec > 0 .AND.  ;
             zgbh = zg.zgbh .AND.  ;
             CTOD(riqi) = i + 1  ;
             .AND. mtime > 0  ;
             .AND. mtime < 720  ;
             .AND. rgcl = 0 .AND.  ;
             zdcl >= 71 .AND.  ;
             zdcl <= 73 .AND.  ;
             mcqss > 1
               DELETE
               GOTO mappendrec
               REPLACE xbsk WITH  ;
                       mtime,  ;
                       zdcl WITH  ;
                       72
               SKIP
          ELSE
               IF delta4err = 0  ;
                  .AND. zdcl >=  ;
                  71 .AND. zdcl <=  ;
                  73 .AND. rgcl =  ;
                  0 .AND. sbsk >  ;
                  0 .AND. xbsk >  ;
                  0 .AND.  ;
                  EMPTY(bc)
                    nzgbh = zgbh
                    nriqi = riqi
                    ncqss = 0
                    IF  .NOT.  ;
                        BOF()
                         SKIP -1
                         IF nzgbh =  ;
                            zgbh  ;
                            .AND.  ;
                            nriqi =  ;
                            riqi
                              ncqss =  ;
                               ncqss +  ;
                               cqss
                         ENDIF
                         SKIP
                    ENDIF
                    IF  .NOT.  ;
                        EOF()
                         SKIP
                         IF nzgbh =  ;
                            zgbh  ;
                            .AND.  ;
                            nriqi =  ;
                            riqi
                              ncqss =  ;
                               ncqss +  ;
                               cqss
                         ENDIF
                         SKIP -1
                    ENDIF
                    IF ncqss = 0
                         IF  .NOT.  ;
                             mgetbctab_flag
                              mgbt =  ;
                               getbctab()
                              mgetbctab_flag =  ;
                               .T.
                         ENDIF
                         IF mgbt >  ;
                            0
                              DO tryxrjbbc  ;
                                 WITH  ;
                                 clfx.sbsk,  ;
                                 clfx.xbsk,  ;
                                 0
                         ENDIF
                    ENDIF
               ENDIF
          ENDIF
          i = i + 1
     ENDDO
     SELECT zg
ENDSCAN
SET EXACT ON
RETURN
ENDPROC
**
PROCEDURE fenxi2
SELECT clfx
mzgbh = ""
mdate = CTOD("")
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "The third scanning..." +  ;
           zgbh
     ELSE
          obj_form4.txt_msg1.value =  ;
           "第三趟扫描..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF mark > 0
          LOOP
     ENDIF
     IF zdcl = 85
          REPLACE kgts WITH  ;
                  time.ts
     ENDIF
     IF zdcl >= 80 .AND. zdcl <=  ;
        82 .AND. cqts = 0
          REPLACE cqts WITH  ;
                  time.ts
     ENDIF
     IF sbsk > 0 .OR. xbsk > 0
          DO checkjjr
     ENDIF
     IF (zdcl = 1 .OR. zdcl = 15)  ;
        .AND. rgcl = 0
          IF checksb()
               LOOP
          ENDIF
     ENDIF
     IF rgcl > 0
          IF "" = mzgbh
               mzgbh = zgbh
               mdate = CTOD(riqi)
               SKIP
               IF mzgbh = zgbh  ;
                  .AND. mdate =  ;
                  CTOD(riqi)
                    SKIP -1
                    LOOP
               ELSE
                    SKIP -1
               ENDIF
          ELSE
               IF mzgbh = zgbh  ;
                  .AND. mdate =  ;
                  CTOD(riqi)
                    LOOP
               ENDIF
          ENDIF
     ENDIF
     IF zdcl = 73 .AND. (sbsk = 0  ;
        .OR. xbsk = 0) .AND. rgcl =  ;
        0
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mrecord = RECNO()
          DO WHILE  .NOT. EOF()  ;
             .AND. zdcl=73 .AND.  ;
             (sbsk=0 .OR. xbsk=0)  ;
             .AND. rgcl=0 .AND.  ;
             mzgbh=zgbh .AND.  ;
             mdate=CTOD(riqi)
               SKIP
          ENDDO
          IF EOF() .OR. mzgbh <>  ;
             zgbh .OR. mdate <>  ;
             CTOD(riqi)
               GOTO mrecord
          ENDIF
     ENDIF
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mkqlb = IIF(rgcl > 0, rgcl,  ;
             zdcl)
     SELECT xjjl_d
     SET EXACT OFF
     SEEK clfx.zgbh + clfx.riqi 
     SET EXACT ON
     nrec = 0
     DO WHILE  .NOT. EOF() .AND.  ;
        zgbh=clfx.zgbh .AND. riqi= ;
        clfx.riqi .AND.  .NOT.  ;
        pub_escape
          IF mark > 0
               IF  .NOT.  ;
                   EMPTY(clfx.bc)  ;
                   .AND.  ;
                   clfx.cqss > 0  ;
                   .AND. kqlb =  ;
                   98 .AND.   ;
                   .NOT.  ;
                   EMPTY(bc)  ;
                   .AND. clfx.bc =  ;
                   bc
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            ss,  ;
                            clfx.cqts  ;
                            WITH  ;
                            ts
               ENDIF
               SKIP
               LOOP
          ENDIF
          REPLACE mark WITH 1
          fx2_rec = 0
          DO CASE
               CASE kqlb > 0  ;
                    .AND. kqlb <  ;
                    31
                    = zaiti()
                    IF clfx.cqss >  ;
                       0 .AND.  ;
                       LEN(TRIM(clfx.bc)) >  ;
                       2 .AND.  ;
                       clfx.bc <>  ;
                       bc .AND.   ;
                       .NOT.  ;
                       EMPTY(bc)
                         REPLACE mark  ;
                                 WITH  ;
                                 0
                         EXIT
                    ENDIF
                    IF clfx.sbsj >  ;
                       0 .AND.  ;
                       clfx.xbsj >  ;
                       0 .AND.  ;
                       LEN(TRIM(clfx.bc)) >  ;
                       2
                         msbsj = clfx.sbsj
                         mxbsj = IIF(clfx.xbsj <  ;
                                 clfx.sbsj,  ;
                                 1440 +  ;
                                 clfx.xbsj,  ;
                                 clfx.xbsj)
                         mkssj = kssj
                         mjssj = IIF(jssj <  ;
                                 kssj,  ;
                                 1440 +  ;
                                 jssj,  ;
                                 jssj)
                         IF (mkssj <=  ;
                            msbsj  ;
                            .AND.  ;
                            mjssj <=  ;
                            msbsj)  ;
                            .OR.  ;
                            (mkssj >=  ;
                            mxbsj  ;
                            .AND.  ;
                            mjssj >=  ;
                            mxbsj)
                              REPLACE  ;
                               mark  ;
                               WITH  ;
                               0
                              EXIT
                         ENDIF
                    ENDIF
                    mflag = .F.
                    IF clfx.qjss >  ;
                       0 .AND.  ;
                       clfx.zdcl <>  ;
                       kqlb .AND.  ;
                       clfx.rgcl <>  ;
                       kqlb .AND.  ;
                       clfx.zdcl <>  ;
                       1 .AND.  ;
                       clfx.zdcl <>  ;
                       15
                         SELECT clfx
                         fx2_rec =  ;
                          RECNO()
                         fx2_zgbh =  ;
                          zgbh
                         fx2_date =  ;
                          CTOD(riqi)
                         mflag = .T.
                         APPEND BLANK
                         REPLACE zgbh  ;
                                 WITH  ;
                                 fx2_zgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 DTOC(fx2_date),  ;
                                 mark  ;
                                 WITH  ;
                                 1
                         SELECT xjjl_d
                    ENDIF
                    IF clfx.zdcl <>  ;
                       1 .AND.  ;
                       clfx.zdcl <>  ;
                       15
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 clfx.qjss +  ;
                                 ss,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 clfx.qjts +  ;
                                 ts
                    ELSE
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 ss,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 ts
                    ENDIF
                    REPLACE clfx.cdss  ;
                            WITH  ;
                            0,  ;
                            clfx.ztss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         IF  .NOT.  ;
                             mflag
                              REPLACE  ;
                               clfx.cqss  ;
                               WITH  ;
                               time.ss
                              REPLACE  ;
                               clfx.cqts  ;
                               WITH  ;
                               time.ts
                         ENDIF
                    ENDIF
                    IF  .NOT.  ;
                        mflag
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 IIF(clfx.cqss >  ;
                                 clfx.qjss,  ;
                                 clfx.cqss -  ;
                                 clfx.qjss,  ;
                                 0)
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 IIF(clfx.cqts >  ;
                                 clfx.qjts,  ;
                                 clfx.cqts -  ;
                                 clfx.qjts,  ;
                                 0)
                    ELSE
                         IF totalcqss() >  ;
                            0
                              REPLACE  ;
                               clfx.cqss  ;
                               WITH  ;
                               clfx.cqss -  ;
                               clfx.qjss
                              REPLACE  ;
                               clfx.cqts  ;
                               WITH  ;
                               clfx.cqts -  ;
                               clfx.qjts
                         ENDIF
                    ENDIF
                    IF ss >= sjcq  ;
                       .AND.  ;
                       EMPTY(bc)
                         IF (clfx.zdcl >  ;
                            70  ;
                            .AND.  ;
                            clfx.zdcl <  ;
                            80)  ;
                            .OR.  ;
                            clfx.zdcl =  ;
                            85
                              REPLACE  ;
                               clfx.zdcl  ;
                               WITH  ;
                               0
                         ENDIF
                         IF clfx.sbsk >  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsk >  ;
                            0
                              IF sjqjdelta1 >  ;
                                 0
                                   IF sjycqj1 = 1
                                        REPLACE clfx.qjyc WITH 1
                                   ELSE
                                        REPLACE clfx.qjyc WITH 2
                                   ENDIF
                              ENDIF
                         ENDIF
                    ELSE
                         IF clfx.sbsk >  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsk >  ;
                            0
                              IF   ;
                               .NOT.  ;
                               EOF("time")
                                   msbsj = time.sbsj
                                   mxbsj = IIF(time.xbsj >= time.sbsj, time.xbsj, 1440 + time.xbsj)
                                   mks = time.zjks
                                   mjs = IIF(time.zjjs >= time.zjks, time.zjjs, 1440 + time.zjjs)
                                   mt1 = IIF(clfx.sbsk >= mks .AND. clfx.sbsk <= mjs, mks, clfx.sbsk)
                                   mt2 = IIF(clfx.xbsk < clfx.sbsk, 1440 + clfx.xbsk, clfx.xbsk)
                                   DO CASE
                                        CASE mt1 <= mks .AND. mt2 >= mjs
                                             mzj = mjs - mks
                                             IF mt1 <= msbsj
                                                  mt1 = msbsj
                                             ENDIF
                                             IF mt2 >= mxbsj
                                                  mt2 = mxbsj
                                             ENDIF
                                        CASE mt1 > mks .AND. mt2 < mjs
                                             mt1 = 0
                                             mt2 = 0
                                             mzj = 0
                                        OTHERWISE
                                             mzj = 0
                                             IF mt1 > mks .AND. mt1 < mjs .AND. mt2 >= mjs
                                                  mt1 = mjs
                                             ENDIF
                                             IF mt1 <= mks .AND. mt2 > mks .AND. mt2 < mjs
                                                  mt2 = mks
                                             ENDIF
                                   ENDCASE
                              ELSE
                                   mt1 = clfx.sbsk
                                   mt2 = IIF(clfx.xbsk < clfx.sbsk, 1440 + clfx.xbsk, clfx.xbsk)
                                   mzj = 0
                              ENDIF
                              mcqss =  ;
                               mt2 -  ;
                               mt1 -  ;
                               mzj
                              IF sjqjdelta1 >  ;
                                 0  ;
                                 .AND.  ;
                                 mcqss +  ;
                                 ss >  ;
                                 sjcq +  ;
                                 sjqjdelta1
                                   IF sjycqj1 = 1
                                        REPLACE clfx.qjyc WITH 1
                                   ELSE
                                        REPLACE clfx.qjyc WITH 2
                                   ENDIF
                              ENDIF
                              IF sjqjdelta2 >  ;
                                 0  ;
                                 .AND.  ;
                                 mcqss +  ;
                                 ss <  ;
                                 sjcq -  ;
                                 sjqjdelta2
                                   IF sjycqj2 = 1
                                        REPLACE clfx.qjyc WITH 3
                                   ELSE
                                        REPLACE clfx.qjyc WITH 4
                                   ENDIF
                              ENDIF
                              IF kssj >  ;
                                 0  ;
                                 .AND.  ;
                                 jssj >  ;
                                 0
                                   IF (kssj >= mt1 .AND. kssj <= mt2) .OR. (jssj >= mt1 .AND. jssj <= mt2)
                                        REPLACE clfx.zdcl WITH 98
                                        SELECT clfx
                                        IF  .NOT. EMPTY(bc)
                                             SELECT time
                                             SEEK clfx.bc 
                                             SELECT clfx
                                             REPLACE cqss WITH time.ss - qjss
                                             REPLACE cqts WITH time.ts - qjts
                                        ELSE
                                             REPLACE cqss WITH IIF(xbsk < sbsk, 1440, 0) + xbsk - sbsk
                                             REPLACE cqts WITH (IIF(xbsk < sbsk, 1440, 0) + xbsk - sbsk) / sjcq
                                        ENDIF
                                        REPLACE cqss WITH IIF(cqss > 0, cqss, 0)
                                        REPLACE cqts WITH IIF(cqts > 0, cqts, 0)
                                        SELECT xjjl_d
                                   ELSE
                                        IF clfx.cqss = 0
                                             REPLACE clfx.zdcl WITH 98
                                             SELECT clfx
                                             IF  .NOT. EMPTY(bc)
                                                  SELECT time
                                                  SEEK clfx.bc 
                                                  SELECT clfx
                                                  ksbsk = sbsk
                                                  kxbsk = IIF(xbsk < sbsk, 1440 + xbsk, xbsk)
                                                  kzjks = IIF(time.zjks > 0 .AND. time.zjks < sbsk, 1440 + time.zjks, time.zjks)
                                                  kzjjs = IIF(time.zjjs > 0 .AND. time.zjjs < time.zjks, 1440 + time.zjjs, time.zjjs)
                                                  jzjks = kzjks
                                                  jzjjs = kzjjs
                                                  IF kzjks < ksbsk .AND. kzjjs > ksbsk
                                                       jzjks = ksbsk
                                                  ENDIF
                                                  IF kzjks < ksbsk .AND. kzjjs > kxbsk
                                                       jzjjs = kxbsk
                                                  ENDIF
                                                  kzjks1 = IIF(time.zjks1 > 0 .AND. time.zjks1 < sbsk, 1440 + time.zjks1, time.zjks1)
                                                  kzjjs1 = IIF(time.zjjs1 > 0 .AND. time.zjjs1 < time.zjks1, 1440 + time.zjjs1, time.zjjs1)
                                                  jzjks1 = kzjks1
                                                  jzjjs1 = kzjjs1
                                                  IF kzjks1 < ksbsk .AND. kzjjs1 > ksbsk
                                                       jzjks1 = ksbsk
                                                  ENDIF
                                                  IF kzjks1 < ksbsk .AND. kzjjs1 > kxbsk
                                                       jzjjs1 = kxbsk
                                                  ENDIF
                                                  REPLACE cqss WITH kxbsk - ksbsk - (jzjjs - jzjks) - (jzjjs1 - jzjks1)
                                             ELSE
                                                  REPLACE cqss WITH IIF(xbsk < sbsk, 1440, 0) + xbsk - sbsk
                                             ENDIF
                                             REPLACE cqts WITH cqss / sjcq
                                             SELECT xjjl_d
                                        ENDIF
                                        REPLACE clfx.qjyc WITH 1
                                   ENDIF
                              ELSE
                                   IF ss + mt2 - mt1 >= sjcq
                                        REPLACE clfx.zdcl WITH 98
                                        SELECT clfx
                                        IF  .NOT. EMPTY(bc)
                                             SELECT time
                                             SEEK clfx.bc 
                                             SELECT clfx
                                             REPLACE cqss WITH time.ss - qjss
                                             REPLACE cqts WITH time.ts - qjts
                                        ELSE
                                             REPLACE cqss WITH IIF(xbsk < sbsk, 1440, 0) + xbsk - sbsk
                                             REPLACE cqts WITH (IIF(xbsk < sbsk, 1440, 0) + xbsk - sbsk) / sjcq
                                        ENDIF
                                        REPLACE cqss WITH IIF(cqss > 0, cqss, 0)
                                        REPLACE cqts WITH IIF(cqts > 0, cqts, 0)
                                        SELECT xjjl_d
                                   ELSE
                                        IF clfx.cqss = 0
                                             REPLACE clfx.zdcl WITH 98
                                             SELECT clfx
                                             IF  .NOT. EMPTY(bc)
                                                  SELECT time
                                                  SEEK clfx.bc 
                                                  SELECT clfx
                                                  ksbsk = sbsk
                                                  kxbsk = IIF(xbsk < sbsk, 1440 + xbsk, xbsk)
                                                  kzjks = IIF(time.zjks > 0 .AND. time.zjks < sbsk, 1440 + time.zjks, time.zjks)
                                                  kzjjs = IIF(time.zjjs > 0 .AND. time.zjjs < time.zjks, 1440 + time.zjjs, time.zjjs)
                                                  jzjks = kzjks
                                                  jzjjs = kzjjs
                                                  IF kzjks < ksbsk .AND. kzjjs > ksbsk
                                                       jzjks = ksbsk
                                                  ENDIF
                                                  IF kzjks < ksbsk .AND. kzjjs > kxbsk
                                                       jzjjs = kxbsk
                                                  ENDIF
                                                  kzjks1 = IIF(time.zjks1 > 0 .AND. time.zjks1 < sbsk, 1440 + time.zjks1, time.zjks1)
                                                  kzjjs1 = IIF(time.zjjs1 > 0 .AND. time.zjjs1 < time.zjks1, 1440 + time.zjjs1, time.zjjs1)
                                                  jzjks1 = kzjks1
                                                  jzjjs1 = kzjjs1
                                                  IF kzjks1 < ksbsk .AND. kzjjs1 > ksbsk
                                                       jzjks1 = ksbsk
                                                  ENDIF
                                                  IF kzjks1 < ksbsk .AND. kzjjs1 > kxbsk
                                                       jzjjs1 = kxbsk
                                                  ENDIF
                                                  REPLACE cqss WITH kxbsk - ksbsk - (jzjjs - jzjks) - (jzjjs1 - jzjks1)
                                             ELSE
                                                  REPLACE cqss WITH IIF(xbsk < sbsk, 1440, 0) + xbsk - sbsk
                                             ENDIF
                                             REPLACE cqts WITH cqss / sjcq
                                             SELECT xjjl_d
                                        ENDIF
                                        REPLACE clfx.qjyc WITH 1
                                   ENDIF
                              ENDIF
                         ELSE
                              IF sjqjdelta1 >  ;
                                 0  ;
                                 .AND.  ;
                                 clfx.cqss +  ;
                                 ss >  ;
                                 sjcq +  ;
                                 sjqjdelta1
                                   IF sjycqj1 = 1
                                        REPLACE clfx.qjyc WITH 1
                                   ELSE
                                        REPLACE clfx.qjyc WITH 2
                                   ENDIF
                              ENDIF
                              IF sjqjdelta2 >  ;
                                 0  ;
                                 .AND.  ;
                                 clfx.cqss +  ;
                                 ss <  ;
                                 sjcq -  ;
                                 sjqjdelta1
                                   IF sjycqj2 = 1
                                        REPLACE clfx.qjyc WITH 3
                                   ELSE
                                        REPLACE clfx.qjyc WITH 4
                                   ENDIF
                              ENDIF
                         ENDIF
                    ENDIF
                    IF clfx.zdcl =  ;
                       85 .AND.  ;
                       clfx.cqss >  ;
                       0
                         REPLACE clfx.zdcl  ;
                                 WITH  ;
                                 98
                    ENDIF
                    IF clfx.qjyc =  ;
                       0
                         DO tryinvalidreg  ;
                            WITH  ;
                            0
                    ENDIF
               CASE kqlb = 92
                    mzaiti = zaiti()
                    nkqlb = IIF(clfx.rgcl >  ;
                            90  ;
                            .AND.  ;
                            clfx.rgcl <  ;
                            95,  ;
                            clfx.rgcl,  ;
                            clfx.zdcl)
                    IF ( .NOT.  ;
                       EMPTY(clfx.bc)  ;
                       .AND.   ;
                       .NOT.  ;
                       EMPTY(bc)  ;
                       .AND.  ;
                       clfx.bc <>  ;
                       bc) .OR.  ;
                       (nkqlb >  ;
                       90 .AND.  ;
                       nkqlb < 95  ;
                       .AND.  ;
                       nkqlb <>  ;
                       kqlb) .OR.  ;
                       (nkqlb =  ;
                       kqlb .AND.  ;
                       clfx.jbattr <>  ;
                       jbattr)
                         IF getskdupval(xjjl_d.kssj,  ;
                            xjjl_d.jssj,  ;
                            clfx.sbsk,  ;
                            clfx.xbsk,  ;
                            0) >  ;
                            0
                              SELECT  ;
                               clfx
                              fx2_rec =  ;
                               RECNO()
                              fx2_zgbh =  ;
                               zgbh
                              fx2_date =  ;
                               CTOD(riqi)
                              APPEND  ;
                               BLANK
                              REPLACE  ;
                               zgbh  ;
                               WITH  ;
                               fx2_zgbh,  ;
                               riqi  ;
                               WITH  ;
                               DTOC(fx2_date),  ;
                               mark  ;
                               WITH  ;
                               1
                              SELECT  ;
                               xjjl_d
                         ELSE
                              SELECT  ;
                               clfx
                              REPLACE  ;
                               bc  ;
                               WITH  ;
                               xjjl_d.bc
                              SELECT  ;
                               xjjl_d
                         ENDIF
                    ENDIF
                    m_bc = IIF(  ;
                           .NOT.  ;
                           EMPTY(clfx.bc),  ;
                           clfx.bc,  ;
                           bc)
                    SELECT time
                    SEEK m_bc 
                    m_zxks = IIF(zjks >  ;
                             0  ;
                             .AND.  ;
                             zjks <  ;
                             delta0,  ;
                             1440 +  ;
                             zjks,  ;
                             zjks)
                    m_zxjs = IIF(zjjs >=  ;
                             zjks,  ;
                             zjjs,  ;
                             1440 +  ;
                             zjjs)
                    SELECT xjjl_d
                    m_ss = xjjl_d.ss
                    m_ts = xjjl_d.ts
                    m_delta = 0
                    DO CASE
                         CASE clfx.sbsk >  ;
                              0  ;
                              .AND.  ;
                              clfx.xbsk >  ;
                              0  ;
                              .AND.  ;
                              clfx.xbsj >  ;
                              0  ;
                              .AND.  ;
                              clfx.xbsj >  ;
                              0
                              m_sbsj =  ;
                               IIF(clfx.sbsj >  ;
                               0  ;
                               .AND.  ;
                               clfx.sbsj <  ;
                               delta0,  ;
                               1440 +  ;
                               clfx.sbsj,  ;
                               clfx.sbsj)
                              m_xbsj =  ;
                               IIF(clfx.xbsj >=  ;
                               clfx.sbsj,  ;
                               clfx.xbsj,  ;
                               clfx.xbsj +  ;
                               1440)
                              m_sbsk =  ;
                               IIF(clfx.sbsk >  ;
                               0  ;
                               .AND.  ;
                               clfx.sbsk <  ;
                               delta0,  ;
                               1440 +  ;
                               clfx.sbsk,  ;
                               clfx.sbsk)
                              m_xbsk =  ;
                               IIF(clfx.xbsk >=  ;
                               clfx.sbsk,  ;
                               clfx.xbsk,  ;
                               clfx.xbsk +  ;
                               1440)
                              m_kssj =  ;
                               IIF(kssj >  ;
                               0  ;
                               .AND.  ;
                               kssj <  ;
                               delta0,  ;
                               1440 +  ;
                               kssj,  ;
                               kssj)
                              m_jssj =  ;
                               IIF(jssj >=  ;
                               kssj,  ;
                               jssj,  ;
                               jssj +  ;
                               1440)
                              IF m_jssj >  ;
                                 0  ;
                                 .AND.  ;
                                 m_kssj >  ;
                                 0
                                   DO CASE
                                        CASE m_jssj > m_xbsj
                                             IF m_xbsk > m_xbsj
                                                  m_delta = sjjb2 * INT((m_xbsk - m_xbsj) / sjjb2)
                                             ENDIF
                                        CASE m_kssj < m_sbsj
                                             IF m_sbsj > m_sbsk
                                                  m_delta = sjjb2 * INT((m_sbsj - m_sbsk) / sjjb2)
                                             ENDIF
                                        CASE m_zxks > 0 .AND. m_zxjs > 0 .AND. ABS(m_zxks - m_kssj) < (m_zxjs - m_zxks) / 2 .AND. ABS(m_zxjs - m_jssj) < (m_zxjs - m_zxks) / 2
                                             m_delta = sjjb2 * INT((m_zxjs - m_zxks) / sjjb2)
                                        OTHERWISE
                                             m_delta = -1
                                   ENDCASE
                              ELSE
                                   IF m_xbsk > m_xbsj
                                        m_delta = sjjb2 * INT((m_xbsk - m_xbsj) / sjjb2)
                                   ELSE
                                        m_delta = -1
                                   ENDIF
                              ENDIF
                         CASE clfx.zdcl =  ;
                              98  ;
                              .OR.  ;
                              clfx.rgcl =  ;
                              98
                         OTHERWISE
                              IF clfx.mark =  ;
                                 0  ;
                                 .AND.  ;
                                 mzaiti =  ;
                                 0
                                   m_delta = -1
                              ELSE
                                   IF mzaiti = 1
                                        m_delta = sjjb2 * INT((IIF(clfx.xbsk >= clfx.sbsk, clfx.xbsk, clfx.xbsk + 1440) - clfx.sbsk) / sjjb2)
                                   ENDIF
                              ENDIF
                    ENDCASE
                    DO CASE
                         CASE m_delta <  ;
                              0
                              REPLACE  ;
                               clfx.jbyc  ;
                               WITH  ;
                               1
                         CASE m_delta >  ;
                              0
                              IF sjjbdelta1 >  ;
                                 0
                                   IF xjjl_d.ss > m_delta + sjjbdelta1
                                        REPLACE clfx.jbyc WITH 1
                                        IF sjycjb1 = 2
                                             m_ss = m_delta
                                             m_ts = m_delta / sjcq
                                             REPLACE clfx.jbyc WITH clfx.jbyc + 1
                                        ENDIF
                                   ENDIF
                              ENDIF
                              IF sjjbdelta2 >  ;
                                 0
                                   IF xjjl_d.ss < m_delta - sjjbdelta2
                                        REPLACE clfx.jbyc WITH 3
                                        IF sjycjb2 = 2
                                             m_ss = m_delta
                                             m_ts = m_delta / sjcq
                                             REPLACE clfx.jbyc WITH clfx.jbyc + 1
                                        ENDIF
                                   ENDIF
                              ENDIF
                    ENDCASE
                    REPLACE clfx.jbss  ;
                            WITH  ;
                            clfx.jbss +  ;
                            m_ss,  ;
                            clfx.jbts  ;
                            WITH  ;
                            clfx.jbts +  ;
                            m_ts,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    REPLACE clfx.jbattr  ;
                            WITH  ;
                            jbattr
                    IF  .NOT.  ;
                        EMPTY(bc)  ;
                        .AND.  ;
                        EMPTY(clfx.bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         IF (clfx.sbsk >  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsk =  ;
                            0)  ;
                            .OR.  ;
                            (clfx.sbsk =  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsk >  ;
                            0)
                              REPLACE  ;
                               clfx.cqss  ;
                               WITH  ;
                               time.ss
                              REPLACE  ;
                               clfx.cqts  ;
                               WITH  ;
                               time.ts
                         ENDIF
                    ENDIF
                    IF (clfx.cdss >  ;
                       0 .OR.  ;
                       clfx.ztss >  ;
                       0) .AND.  ;
                       clfx.jbss >  ;
                       0 .AND.   ;
                       .NOT.  ;
                       EMPTY(clfx.bc)  ;
                       .AND.  ;
                       clfx.sbsk >  ;
                       0 .AND.  ;
                       clfx.xbsk >  ;
                       0
                         mcd = clfx.sbsk -  ;
                               clfx.sbsj
                         mzt = clfx.xbsj -  ;
                               clfx.xbsk
                         IF mcd <=  ;
                            sjcd1
                              REPLACE  ;
                               clfx.cdss  ;
                               WITH  ;
                               0
                              IF clfx.zdcl >=  ;
                                 80  ;
                                 .AND.  ;
                                 clfx.zdcl <=  ;
                                 82
                                   REPLACE clfx.zdcl WITH 98
                              ENDIF
                         ENDIF
                         IF mzt <=  ;
                            sjzt1
                              REPLACE  ;
                               clfx.ztss  ;
                               WITH  ;
                               0
                              IF clfx.zdcl >=  ;
                                 80  ;
                                 .AND.  ;
                                 clfx.zdcl <=  ;
                                 82
                                   REPLACE clfx.zdcl WITH 98
                              ENDIF
                         ENDIF
                    ENDIF
                    IF clfx.jbyc =  ;
                       0
                         DO tryinvalidreg  ;
                            WITH  ;
                            1
                    ENDIF
               CASE kqlb >= 93  ;
                    .AND. kqlb <=  ;
                    94
                    IF clfx.rgcl =  ;
                       0 .AND.  ;
                       clfx.zdcl >=  ;
                       71 .AND.  ;
                       clfx.zdcl <=  ;
                       73
                         SELECT clfx
                         szgbh = zgbh
                         ddate = CTOD(riqi)
                         isbsk = IIF(sbsk >  ;
                                 0,  ;
                                 sbsk,  ;
                                 xbsk)
                         SKIP
                         IF  .NOT.  ;
                             EOF()  ;
                             .AND.  ;
                             szgbh =  ;
                             zgbh  ;
                             .AND.  ;
                             ddate +  ;
                             1 =  ;
                             CTOD(riqi)  ;
                             .AND.  ;
                             zdcl >=  ;
                             71  ;
                             .AND.  ;
                             zdcl <=  ;
                             73  ;
                             .AND.  ;
                             rgcl =  ;
                             0
                              ixbsk =  ;
                               IIF(sbsk >  ;
                               0,  ;
                               sbsk,  ;
                               xbsk)
                              IF ABS(xjjl_d.ss -  ;
                                 (ixbsk +  ;
                                 1440 -  ;
                                 isbsk)) <  ;
                                 120
                                   DELETE
                                   SKIP -1
                                   REPLACE sbsk WITH isbsk, xbsk WITH ixbsk
                                   IF getbctab() > 0
                                        DO tryxrjbbc WITH sbsk, xbsk, 0
                                   ENDIF
                              ELSE
                                   SKIP -1
                              ENDIF
                         ELSE
                              SKIP - ;
                               1
                         ENDIF
                         SELECT xjjl_d
                    ENDIF
                    IF kssj > 0  ;
                       .AND. jssj >  ;
                       0
                         = zaiti()
                    ENDIF
                    IF clfx.sbsk >  ;
                       0 .AND.  ;
                       clfx.xbsk >  ;
                       0
                         mflag2 =  ;
                          .F.
                         sk_kssj =  ;
                          1440 +  ;
                          clfx.sbsk
                         sk_jssj =  ;
                          1440 +  ;
                          clfx.xbsk
                         sk_jssj =  ;
                          IIF(sk_jssj <  ;
                          sk_kssj,  ;
                          1440 +  ;
                          sk_jssj,  ;
                          sk_jssj)
                         IF kssj >  ;
                            0  ;
                            .AND.  ;
                            jssj >  ;
                            0
                              dj_kssj =  ;
                               1440 +  ;
                               kssj
                              dj_jssj =  ;
                               1440 +  ;
                               jssj
                              dj_jssj =  ;
                               IIF(dj_jssj <  ;
                               dj_kssj,  ;
                               1440 +  ;
                               dj_jssj,  ;
                               dj_jssj)
                              IF (dj_kssj <  ;
                                 sk_kssj  ;
                                 .AND.  ;
                                 dj_jssj <  ;
                                 sk_kssj)  ;
                                 .OR.  ;
                                 (dj_jssj >  ;
                                 sk_jssj  ;
                                 .AND.  ;
                                 dj_jssj >  ;
                                 sk_jssj)
                                   mflag2 = .T.
                              ENDIF
                         ELSE
                              sk_ss =  ;
                               sk_jssj -  ;
                               sk_kssj
                              IF ss <  ;
                                 0.4  *  ;
                                 sk_ss  ;
                                 .OR.  ;
                                 ss >  ;
                                 1.6  *  ;
                                 sk_ss
                                   mflag2 = .T.
                              ENDIF
                         ENDIF
                         IF mflag2
                              mrec2 =  ;
                               RECNO()
                              REPLACE  ;
                               mark  ;
                               WITH  ;
                               0
                              mflag3 =  ;
                               .F.
                              DO WHILE   ;
                                 .NOT.  ;
                                 EOF()  ;
                                 .AND.  ;
                                 zgbh= ;
                                 mzgbh  ;
                                 .AND.  ;
                                 CTOD(riqi)= ;
                                 mdate  ;
                                 .AND.   ;
                                 .NOT.  ;
                                 pub_escape
                                   IF mark = 1 .OR. mrec2 = RECNO()
                                        SKIP
                                        LOOP
                                   ENDIF
                                   IF kqlb >= 93 .AND. kqlb <= 94
                                        mflag3 = .T.
                                   ENDIF
                                   EXIT
                              ENDDO
                              IF   ;
                               .NOT.  ;
                               mflag3
                                   SELECT clfx
                                   SKIP
                                   IF  .NOT. EOF() .AND. zgbh = mzgbh .AND. CTOD(riqi) = mdate .AND. nrec <> RECNO()
                                        nrec = RECNO()
                                        mzgbh = zgbh
                                        mdate = CTOD(riqi)
                                        mkqlb = IIF(rgcl > 0, rgcl, zdcl)
                                        SELECT xjjl_d
                                        SET EXACT OFF
                                        SEEK clfx.zgbh + clfx.riqi 
                                        SET EXACT ON
                                        LOOP
                                   ENDIF
                                   nrec = 0
                                   SKIP -1
                                   SELECT xjjl_d
                                   GOTO mrec2
                              ENDIF
                              REPLACE  ;
                               mark  ;
                               WITH  ;
                               1
                         ENDIF
                    ENDIF
                    nkqlb = IIF(clfx.rgcl >  ;
                            90  ;
                            .AND.  ;
                            clfx.rgcl <  ;
                            95,  ;
                            clfx.rgcl,  ;
                            clfx.zdcl)
                    IF (nkqlb >  ;
                       90 .AND.  ;
                       nkqlb < 95  ;
                       .AND.  ;
                       nkqlb <>  ;
                       kqlb) .OR.  ;
                       (nkqlb =  ;
                       kqlb .AND.  ;
                       clfx.jbattr <>  ;
                       jbattr)
                         SELECT clfx
                         fx2_rec =  ;
                          RECNO()
                         fx2_zgbh =  ;
                          zgbh
                         fx2_date =  ;
                          CTOD(riqi)
                         APPEND BLANK
                         REPLACE zgbh  ;
                                 WITH  ;
                                 fx2_zgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 DTOC(fx2_date),  ;
                                 mark  ;
                                 WITH  ;
                                 1
                         SELECT xjjl_d
                    ENDIF
                    m_zjks = 0
                    m_zjjs = 0
                    IF clfx.sbsj >  ;
                       0 .AND.  ;
                       clfx.xbsj >  ;
                       0 .AND.  ;
                       clfx.sbsk >  ;
                       0 .AND.  ;
                       clfx.xbsk >  ;
                       0
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         m_zjks =  ;
                          time.zjks
                         m_zjjs =  ;
                          IIF(time.zjks >  ;
                          time.zjjs,  ;
                          1440,  ;
                          0) +  ;
                          time.zjjs
                         msbsj = clfx.sbsj
                         mxbsj = IIF(clfx.xbsj >=  ;
                                 clfx.sbsj,  ;
                                 clfx.xbsj,  ;
                                 clfx.xbsj +  ;
                                 1440)
                         mkssj = kssj
                         mjssj = IIF(jssj >=  ;
                                 kssj,  ;
                                 jssj,  ;
                                 jssj +  ;
                                 1440)
                         IF ((mkssj <  ;
                            msbsj  ;
                            .AND.  ;
                            ABS(msbsj -  ;
                            mjssj) <  ;
                            ss /  ;
                            3)  ;
                            .OR.  ;
                            (mjssj >  ;
                            mxbsj  ;
                            .AND.  ;
                            ABS(mkssj -  ;
                            mxbsj) <  ;
                            ss /  ;
                            3))  ;
                            .AND.  ;
                            clfx.cqss >  ;
                            0
                              REPLACE  ;
                               clfx.cqts  ;
                               WITH  ;
                               time.ts
                         ELSE
                              REPLACE  ;
                               clfx.cqss  ;
                               WITH  ;
                               0,  ;
                               clfx.cqts  ;
                               WITH  ;
                               0
                         ENDIF
                    ENDIF
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         m_zjks =  ;
                          time.zjks
                         m_zjjs =  ;
                          IIF(time.zjks >  ;
                          time.zjjs,  ;
                          1440,  ;
                          0) +  ;
                          time.zjjs
                    ENDIF
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            0,  ;
                            clfx.cqts  ;
                            WITH  ;
                            0,  ;
                            clfx.xrcolor  ;
                            WITH  ;
                            rgb_holiday
                    m_ss = xjjl_d.ss
                    m_ts = xjjl_d.ts
                    m_delta = 0
                    DO CASE
                         CASE clfx.sbsk >  ;
                              0  ;
                              .AND.  ;
                              clfx.xbsk >  ;
                              0
                              m_sbsk =  ;
                               IIF(clfx.sbsk >  ;
                               0  ;
                               .AND.  ;
                               clfx.sbsk <  ;
                               120,  ;
                               1440 +  ;
                               clfx.sbsk,  ;
                               clfx.sbsk)
                              m_xbsk =  ;
                               IIF(clfx.xbsk >=  ;
                               clfx.sbsk,  ;
                               clfx.xbsk,  ;
                               clfx.xbsk +  ;
                               1440)
                              m_delta =  ;
                               sjjb2 *  ;
                               INT((m_xbsk -  ;
                               m_sbsk) /  ;
                               sjjb2)
                         CASE clfx.zdcl =  ;
                              98  ;
                              .OR.  ;
                              clfx.rgcl =  ;
                              98
                         OTHERWISE
                              IF clfx.mark =  ;
                                 0
                                   m_delta = -1
                              ENDIF
                    ENDCASE
                    DO CASE
                         CASE m_delta <  ;
                              0
                              REPLACE  ;
                               clfx.jbyc  ;
                               WITH  ;
                               1
                         CASE m_delta >  ;
                              0  ;
                              .AND.  ;
                              clfx.jbyc =  ;
                              0
                              IF sjjbdelta1 >  ;
                                 0
                                   IF xjjl_d.ss > m_delta + sjjbdelta1
                                        REPLACE clfx.jbyc WITH 1
                                        IF sjycjb1 = 2
                                             m_ss = m_delta
                                             m_ts = m_delta / sjcq
                                             REPLACE clfx.jbyc WITH clfx.jbyc + 1
                                        ENDIF
                                   ENDIF
                              ENDIF
                              IF sjjbdelta2 >  ;
                                 0
                                   IF xjjl_d.ss < m_delta - sjjbdelta2
                                        REPLACE clfx.jbyc WITH 3
                                        IF sjycjb2 = 2
                                             m_ss = m_delta
                                             m_ts = m_delta / sjcq
                                             REPLACE clfx.jbyc WITH clfx.jbyc + 1
                                        ENDIF
                                   ENDIF
                              ENDIF
                         CASE m_delta >  ;
                              0  ;
                              .AND.  ;
                              clfx.jbyc >  ;
                              0
                              IF sjjbdelta1 >  ;
                                 0
                                   IF xjjl_d.ss > m_delta + sjjbdelta1
                                        IF clfx.jbyc = 2
                                             m_ss = 0
                                             m_ts = 0
                                        ENDIF
                                   ENDIF
                              ENDIF
                              IF sjjbdelta2 >  ;
                                 0
                                   IF xjjl_d.ss < m_delta - sjjbdelta2
                                        IF clfx.jbyc = 4
                                             m_ss = 0
                                             m_ts = 0
                                        ENDIF
                                   ENDIF
                              ENDIF
                    ENDCASE
                    REPLACE clfx.jbss  ;
                            WITH  ;
                            clfx.jbss +  ;
                            m_ss,  ;
                            clfx.jbts  ;
                            WITH  ;
                            clfx.jbts +  ;
                            m_ts,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    REPLACE clfx.cdss  ;
                            WITH  ;
                            0,  ;
                            clfx.ztss  ;
                            WITH  ;
                            0
                    REPLACE clfx.jbattr  ;
                            WITH  ;
                            jbattr
                    IF clfx.jbyc =  ;
                       0
                         REPLACE clfx.zdcl  ;
                                 WITH  ;
                                 IIF(kqlb =  ;
                                 93,  ;
                                 1,  ;
                                 15)
                         DO tryinvalidreg  ;
                            WITH  ;
                            1
                    ENDIF
               CASE kqlb = 80
                    IF clfx.zdcl =  ;
                       98 .AND.  ;
                       LEN(TRIM(bc)) >  ;
                       2
                         EXIT
                    ENDIF
                    REPLACE clfx.cdss  ;
                            WITH  ;
                            ss,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 time.ss
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 time.ts
                    ENDIF
               CASE kqlb = 81
                    IF clfx.zdcl =  ;
                       98 .AND.  ;
                       LEN(TRIM(bc)) >  ;
                       2
                         EXIT
                    ENDIF
                    REPLACE clfx.ztss  ;
                            WITH  ;
                            ss,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 time.ss
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 time.ts
                    ENDIF
               CASE kqlb = 82
                    IF clfx.zdcl =  ;
                       98 .AND.  ;
                       LEN(TRIM(bc)) >  ;
                       2
                         EXIT
                    ENDIF
                    REPLACE clfx.ztss  ;
                            WITH  ;
                            ss,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 time.ss
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 time.ts
                    ENDIF
               CASE kqlb = 85
                    IF clfx.zdcl =  ;
                       98 .AND.  ;
                       LEN(TRIM(bc)) >  ;
                       2
                         EXIT
                    ENDIF
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                    ENDIF
                    REPLACE clfx.kgss  ;
                            WITH  ;
                            ss,  ;
                            clfx.kgts  ;
                            WITH  ;
                            ts
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            0,  ;
                            clfx.cqts  ;
                            WITH  ;
                            0,  ;
                            clfx.cdss  ;
                            WITH  ;
                            0,  ;
                            clfx.ztss  ;
                            WITH  ;
                            0,  ;
                            clfx.jbss  ;
                            WITH  ;
                            0,  ;
                            clfx.jbts  ;
                            WITH  ;
                            0,  ;
                            clfx.qjss  ;
                            WITH  ;
                            0,  ;
                            clfx.qjts  ;
                            WITH  ;
                            0
               CASE kqlb = 97
                    SELECT clfx
                    m_st = sbsk
                    m_et = IIF(xbsk <  ;
                           sbsk,  ;
                           1440,  ;
                           0) +  ;
                           xbsk
                    e_st = xjjl_d.kssj
                    e_et = IIF(xjjl_d.jssj <  ;
                           xjjl_d.kssj,  ;
                           1440,  ;
                           0) +  ;
                           xjjl_d.jssj
                    IF m_et -  ;
                       xjjl_d.ss -  ;
                       m_st > 0.8  *  ;
                       sjcq
                         IF e_st =  ;
                            0  ;
                            .AND.  ;
                            e_et =  ;
                            0
                              REPLACE  ;
                               xbsk  ;
                               WITH  ;
                               IIF(m_et -  ;
                               xjjl_d.ss >  ;
                               1440,  ;
                               m_et -  ;
                               xjjl_d.ss -  ;
                               1440,  ;
                               m_et -  ;
                               xjjl_d.ss)
                         ELSE
                              DO CASE
                                   CASE ABS(e_st - m_st) < ABS(e_et - m_et)
                                        REPLACE sbsk WITH IIF(e_et > 1440, e_et - 440, e_et)
                                   CASE ABS(e_st - m_st) > ABS(e_et - m_et)
                                        REPLACE xbsk WITH e_st
                              ENDCASE
                         ENDIF
                    ENDIF
                    IF  .NOT.  ;
                        (EMPTY(bc)  ;
                        .AND.  ;
                        sbsk = 0  ;
                        .AND.  ;
                        xbsk = 0  ;
                        .AND.  ;
                        zdcl = 0  ;
                        .AND.  ;
                        rgcl =  ;
                        0)
                         APPEND BLANK
                    ENDIF
                    REPLACE zgbh  ;
                            WITH  ;
                            mzgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(mdate)
                    SELECT xjjl_d
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            ss,  ;
                            clfx.cqts  ;
                            WITH  ;
                            ts
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                    ENDIF
                    REPLACE clfx.sbsk  ;
                            WITH  ;
                            kssj
                    REPLACE clfx.xbsk  ;
                            WITH  ;
                            jssj
               CASE kqlb = 98
                    IF kssj > 0  ;
                       .AND. jssj >  ;
                       0
                         = zaiti()
                    ENDIF
                    IF clfx.zdcl =  ;
                       1 .OR.  ;
                       clfx.zdcl =  ;
                       15
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 0,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 0
                    ENDIF
                    REPLACE clfx.zdcl  ;
                            WITH  ;
                            clfx.rgcl
                    REPLACE clfx.rgcl  ;
                            WITH  ;
                            98
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            ss,  ;
                            clfx.cqts  ;
                            WITH  ;
                            ts
                    IF  .NOT.  ;
                        EMPTY(bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         SELECT xjjl_d
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                    ENDIF
                    SELECT clfx
                    IF xbsk = 0
                         SKIP
                         mxbsk = 0
                         IF  .NOT.  ;
                             EOF()  ;
                             .AND.  ;
                             rgcl =  ;
                             0  ;
                             .AND.  ;
                             zdcl =  ;
                             73
                              IF sbsk <  ;
                                 delta0  ;
                                 .AND.  ;
                                 sbsk >  ;
                                 0
                                   mxbsk = sbsk
                              ENDIF
                              IF xbsk <  ;
                                 delta0  ;
                                 .AND.  ;
                                 xbsk >  ;
                                 0
                                   mxbsk = xbsk
                              ENDIF
                              IF mxbsk >  ;
                                 0
                                   DELETE
                              ENDIF
                         ENDIF
                         SKIP -1
                         IF mxbsk >  ;
                            0
                              REPLACE  ;
                               xbsk  ;
                               WITH  ;
                               mxbsk
                         ENDIF
                    ENDIF
                    SELECT xjjl_d
                    IF kssj > 0  ;
                       .AND. jssj >  ;
                       0 .AND.  ;
                       (clfx.sbsk =  ;
                       0 .OR.  ;
                       clfx.xbsk =  ;
                       0)
                         IF clfx.sbsk =  ;
                            0  ;
                            .AND.  ;
                            clfx.sbsk =  ;
                            0
                              REPLACE  ;
                               clfx.sbsk  ;
                               WITH  ;
                               kssj,  ;
                               clfx.xbsk  ;
                               WITH  ;
                               jssj
                         ELSE
                              mkssj =  ;
                               kssj
                              mjssj =  ;
                               IIF(jssj <  ;
                               kssj,  ;
                               1440 +  ;
                               jssj,  ;
                               jssj)
                              IF clfx.sbsk =  ;
                                 0
                                   IF ABS(mkssj - clfx.xbsk) < ABS(mjssj - clfx.xbsk)
                                        REPLACE clfx.sbsk WITH clfx.xbsk
                                        REPLACE clfx.xbsk WITH jssj
                                   ELSE
                                        REPLACE clfx.sbsk WITH kssj
                                   ENDIF
                              ENDIF
                              IF clfx.xbsk =  ;
                                 0
                                   IF ABS(mkssj - clfx.sbsk) < ABS(mjssj - clfx.sbsk)
                                        REPLACE clfx.xbsk WITH jssj
                                   ELSE
                                        REPLACE clfx.xbsk WITH clfx.sbsk
                                        REPLACE clfx.sbsk WITH kssj
                                   ENDIF
                              ENDIF
                         ENDIF
                    ENDIF
                    REPLACE clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0,  ;
                            clfx.cdss  ;
                            WITH  ;
                            0,  ;
                            clfx.ztss  ;
                            WITH  ;
                            0
                    IF clfx.zdcl >=  ;
                       80 .AND.  ;
                       clfx.zdcl <=  ;
                       85
                         REPLACE clfx.zdcl  ;
                                 WITH  ;
                                 0
                    ENDIF
               CASE kqlb = 43
                    REPLACE clfx.cqts  ;
                            WITH  ;
                            time.ts
               OTHERWISE
                    REPLACE mark  ;
                            WITH  ;
                            0
          ENDCASE
          IF kqlb < 75 .OR. kqlb >  ;
             76
               IF (clfx.zdcl = 1  ;
                  .OR. clfx.zdcl =  ;
                  15) .AND.  ;
                  clfx.jbyc > 0
                    REPLACE clfx.zdcl  ;
                            WITH  ;
                            0,  ;
                            clfx.qjss  ;
                            WITH  ;
                            0,  ;
                            clfx.qjts  ;
                            WITH  ;
                            0
               ENDIF
               IF kqlb <>  ;
                  clfx.rgcl .AND.  ;
                  kqlb <>  ;
                  clfx.zdcl
                    IF clfx.rgcl =  ;
                       98
                         REPLACE clfx.zdcl  ;
                                 WITH  ;
                                 kqlb
                    ELSE
                         IF clfx.rgcl >  ;
                            0
                              REPLACE  ;
                               clfx.zdcl  ;
                               WITH  ;
                               clfx.rgcl
                         ENDIF
                         REPLACE clfx.rgcl  ;
                                 WITH  ;
                                 kqlb
                    ENDIF
               ENDIF
          ENDIF
          IF clfx.mark = 1 .AND.  ;
             fx2_rec > 0
               SELECT clfx
               GOTO fx2_rec
               SELECT xjjl_d
          ENDIF
          SKIP
     ENDDO
     SELECT clfx
ENDSCAN
SELECT xjjl_d
SCAN
     IF mark = 1 .OR.  .NOT.  ;
        ((kqlb > 0 .AND. kqlb <  ;
        31) .OR. (kqlb >= 92  ;
        .AND. kqlb <= 94))
          LOOP
     ENDIF
     SELECT clfx
     APPEND BLANK
     REPLACE zgbh WITH  ;
             xjjl_d.zgbh, riqi  ;
             WITH xjjl_d.riqi,  ;
             rgcl WITH  ;
             xjjl_d.kqlb, bc WITH  ;
             xjjl_d.bc
     REPLACE jbattr WITH  ;
             xjjl_d.jbattr
     DO CASE
          CASE xjjl_d.kqlb > 0  ;
               .AND. xjjl_d.kqlb <  ;
               31
               REPLACE qjss WITH  ;
                       xjjl_d.ss,  ;
                       qjts WITH  ;
                       xjjl_d.ts,  ;
                       qjyc WITH  ;
                       1
          CASE xjjl_d.kqlb >= 92  ;
               .AND. xjjl_d.kqlb <=  ;
               94
               REPLACE jbss WITH  ;
                       xjjl_d.ss,  ;
                       jbts WITH  ;
                       xjjl_d.ts,  ;
                       jbyc WITH  ;
                       1
     ENDCASE
ENDSCAN
RETURN
ENDPROC
**
FUNCTION TotalCQSS
tc_area = ALLTRIM(STR(SELECT()))
SELECT clfx
tc_recno = RECNO()
tc_zgbh = zgbh
tc_riqi = riqi
tc_ret = cqss
SKIP -1
DO WHILE  .NOT. BOF() .AND.  ;
   tc_zgbh=zgbh .AND. tc_riqi= ;
   riqi
     tc_ret = tc_ret + cqss
     SKIP -1
ENDDO
GOTO tc_recno
SKIP
DO WHILE  .NOT. EOF() .AND.  ;
   tc_zgbh=zgbh .AND. tc_riqi= ;
   riqi
     tc_ret = tc_ret + cqss
     SKIP
ENDDO
GOTO tc_recno
select &tc_Area
RETURN tc_ret
ENDFUNC
**
PROCEDURE fenxi3
SELECT clfx
SET RELATION TO bc INTO time
SET RELATION ADDITIVE TO zgbh INTO zg
GOTO TOP
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "The second scanning..." +  ;
           zgbh
     ELSE
          obj_form4.txt_msg1.value =  ;
           "第二趟扫描..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF zdcl = 98 .OR. rgcl = 98
          LOOP
     ENDIF
     SELECT xjjl_d
     SEEK clfx.zgbh + clfx.riqi +  ;
          "40" 
     IF FOUND()
          SELECT clfx
          DELETE
          LOOP
     ENDIF
     SELECT xjjl_j
     SEEK STR(MONTH(CTOD(clfx.riqi)),  ;
          2) +  ;
          STR(DAY(CTOD(clfx.riqi)),  ;
          2) 
     IF FOUND()
          IF clfx.zdcl = 0 .AND.  ;
             clfx.rgcl = 0 .AND.  ;
             clfx.sbsk = 0 .AND.  ;
             clfx.xbsk = 0
               REPLACE clfx.zdcl  ;
                       WITH 15,  ;
                       clfx.qjss  ;
                       WITH sjcq,  ;
                       clfx.qjts  ;
                       WITH 1
          ELSE
               mzdcl = clfx.zdcl
               IF mzdcl >= 80  ;
                  .AND. mzdcl <=  ;
                  85 .AND. (zg.mk =  ;
                  "3" .OR. zg.mk =  ;
                  "5" .OR. zg.mk =  ;
                  "6" .OR. zg.mk =  ;
                  "7")
                    REPLACE clfx.zdcl  ;
                            WITH  ;
                            98
                    REPLACE clfx.cdss  ;
                            WITH  ;
                            0,  ;
                            clfx.ztss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
               ENDIF
               IF mzdcl = 85  ;
                  .AND. (zg.mk =  ;
                  "3" .OR. zg.mk =  ;
                  "5" .OR. zg.mk =  ;
                  "6" .OR. zg.mk =  ;
                  "7")
                    IF clfx.xbsk >  ;
                       0 .AND.  ;
                       clfx.sbsk >  ;
                       0
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 IIF(clfx.xbsk >  ;
                                 clfx.sbsk,  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk,  ;
                                 1440 +  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk)
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 clfx.cqss /  ;
                                 sjcq
                    ENDIF
               ENDIF
          ENDIF
          SELECT clfx
          LOOP
     ENDIF
     SELECT xjjl_w
     SEEK clfx.zgbh 
     IF FOUND()
          szqno = getzqxr()
          IF szqno <> "-1"
               nzqno = VAL(szqno)
               szq = "ZQ" + szqno
               sksrq = "KSRQ" +  ;
                       szqno
               IF clfx.RIQI>=&sKsRq AND;
&sZq>0
                    N = ctod(clfx.RIQI);
- ctod(&sKsRq)
                    m = 'W'+LTRIM(STR(N-&sZq*INT(N/&sZq)+nZqNo*31))
                    IF '1'=&m
                         IF clfx.zdcl =  ;
                            0  ;
                            .AND.  ;
                            clfx.rgcl =  ;
                            0  ;
                            .AND.  ;
                            clfx.sbsk =  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsk =  ;
                            0
                              REPLACE  ;
                               clfx.zdcl  ;
                               WITH  ;
                               1,  ;
                               clfx.qjss  ;
                               WITH  ;
                               sjcq,  ;
                               clfx.qjts  ;
                               WITH  ;
                               1
                         ELSE
                              mzdcl =  ;
                               clfx.zdcl
                              IF mzdcl >=  ;
                                 80  ;
                                 .AND.  ;
                                 mzdcl <=  ;
                                 85  ;
                                 .AND.  ;
                                 (zg.mk =  ;
                                 "2"  ;
                                 .OR.  ;
                                 zg.mk =  ;
                                 "4"  ;
                                 .OR.  ;
                                 zg.mk =  ;
                                 "6"  ;
                                 .OR.  ;
                                 zg.mk =  ;
                                 "7")
                                   REPLACE clfx.zdcl WITH 98
                                   REPLACE clfx.cdss WITH 0, clfx.ztss WITH 0, clfx.kgss WITH 0, clfx.kgts WITH 0
                              ENDIF
                              IF mzdcl =  ;
                                 85  ;
                                 .AND.  ;
                                 (zg.mk =  ;
                                 "2"  ;
                                 .OR.  ;
                                 zg.mk =  ;
                                 "4"  ;
                                 .OR.  ;
                                 zg.mk =  ;
                                 "6"  ;
                                 .OR.  ;
                                 zg.mk =  ;
                                 "7")
                                   IF clfx.xbsk > 0 .AND. clfx.sbsk > 0
                                        REPLACE clfx.cqss WITH IIF(clfx.xbsk > clfx.sbsk, clfx.xbsk - clfx.sbsk, 1440 + clfx.xbsk - clfx.sbsk)
                                        REPLACE clfx.cqts WITH clfx.cqss / sjcq
                                   ENDIF
                              ENDIF
                         ENDIF
                    ENDIF
               ENDIF
               SELECT clfx
               LOOP
          ENDIF
     ENDIF
     SELECT xjjl_s
     m = STR(DOW(CTOD(clfx.riqi)),  ;
         1)
     n = "W" + m
     IF &n = 1
          IF clfx.zdcl = 0 .AND.  ;
             clfx.rgcl = 0 .AND.  ;
             clfx.sbsk = 0 .AND.  ;
             clfx.xbsk = 0
               REPLACE clfx.zdcl  ;
                       WITH 1,  ;
                       clfx.qjss  ;
                       WITH sjcq,  ;
                       clfx.qjts  ;
                       WITH 1
          ELSE
               mzdcl = clfx.zdcl
               IF mzdcl >= 80  ;
                  .AND. mzdcl <=  ;
                  85 .AND. (zg.mk =  ;
                  "2" .OR. zg.mk =  ;
                  "4" .OR. zg.mk =  ;
                  "6" .OR. zg.mk =  ;
                  "7")
                    REPLACE clfx.zdcl  ;
                            WITH  ;
                            98
                    REPLACE clfx.cdss  ;
                            WITH  ;
                            0,  ;
                            clfx.ztss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
               ENDIF
               IF mzdcl = 85  ;
                  .AND. (zg.mk =  ;
                  "2" .OR. zg.mk =  ;
                  "4" .OR. zg.mk =  ;
                  "6" .OR. zg.mk =  ;
                  "7")
                    IF clfx.xbsk >  ;
                       0 .AND.  ;
                       clfx.sbsk >  ;
                       0
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 IIF(clfx.xbsk >  ;
                                 clfx.sbsk,  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk,  ;
                                 1440 +  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk)
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 clfx.cqss /  ;
                                 sjcq
                    ENDIF
               ENDIF
          ENDIF
     ENDIF
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
**
PROCEDURE fenxi4
SELECT clfx
SET RELATION TO bc INTO time
GOTO TOP
mzgbh = ""
mdate = CTOD("")
mlb = ''
DO WHILE  .NOT. EOF() .AND.   ;
   .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "The forth scanning..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "第四趟扫描..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF (clfx.zdcl = 1 .OR.  ;
        clfx.zdcl = 15) .AND.  ;
        rgcl > 91 .AND. rgcl <  ;
        95
          REPLACE clfx.zdcl WITH  ;
                  0, clfx.qjss  ;
                  WITH 0,  ;
                  clfx.qjts WITH  ;
                  0
     ENDIF
     IF zdcl > 0 .OR. rgcl > 0
          IF cqts = 0 .AND.  ;
             ((zdcl = 98 .AND.  ;
             (rgcl = 0 .OR. rgcl =  ;
             75 .OR. rgcl = 76  ;
             .OR. rgcl = 92))  ;
             .OR. rgcl = 98 .OR.  ;
             ((rgcl = 0 .OR. rgcl =  ;
             92) .AND. zdcl =  ;
             74))
               IF  .NOT.  ;
                   EMPTY(bc)
                    REPLACE cqts  ;
                            WITH  ;
                            time.ts
               ELSE
                    mcqss = IIF(xbsk >=  ;
                            sbsk,  ;
                            xbsk -  ;
                            sbsk,  ;
                            1440 -  ;
                            xbsk -  ;
                            sbsk) -  ;
                            jbss
                    IF mcqss >  ;
                       sjcq
                         REPLACE cqss  ;
                                 WITH  ;
                                 sjcq,  ;
                                 cqts  ;
                                 WITH  ;
                                 1
                    ELSE
                         REPLACE cqss  ;
                                 WITH  ;
                                 mcqss,  ;
                                 cqts  ;
                                 WITH  ;
                                 mcqss /  ;
                                 sjcq
                    ENDIF
               ENDIF
          ENDIF
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mlb = time.lb
          SKIP
          LOOP
     ENDIF
     SKIP
ENDDO
RETURN
ENDPROC
**
FUNCTION JbChk
PARAMETER jbmod
ret = .T.
DO CASE
     CASE jbmod = 1
          DO CASE
               CASE clfx.zdcl > 0  ;
                    .OR.  ;
                    clfx.sbsk = 0  ;
                    .OR.  ;
                    clfx.xbsk =  ;
                    0
                    ret = .T.
               CASE clfx.zdcl = 0  ;
                    .OR.  ;
                    (clfx.zdcl =  ;
                    73 .AND.   ;
                    .NOT.  ;
                    (clfx.sbsk <>  ;
                    0 .AND.  ;
                    clfx.xbsk <>  ;
                    0))
                    ret = .F.
               CASE kssj > 0  ;
                    .AND. jssj =  ;
                    0
                    IF clfx.xbsk >=  ;
                       clfx.sbsk
                         IF kssj <  ;
                            clfx.sbsk -  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                    ELSE
                         IF kssj <  ;
                            720
                              mkssj =  ;
                               kssj +  ;
                               1440
                         ELSE
                              mkssj =  ;
                               kssj
                         ENDIF
                         IF mkssj <  ;
                            clfx.sbsk -  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                    ENDIF
               CASE kssj = 0  ;
                    .AND. jssj >  ;
                    0
                    IF clfx.xbsk >=  ;
                       clfx.sbsk
                         IF jssj >  ;
                            clfx.xbsk +  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                    ELSE
                         IF jssj >  ;
                            720
                              mkssj =  ;
                               jssj -  ;
                               1440
                         ELSE
                              mkssj =  ;
                               jssj
                         ENDIF
                         IF mkssj >  ;
                            clfx.xbsk +  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                    ENDIF
               CASE kssj > 0  ;
                    .AND. jssj >  ;
                    0
                    IF clfx.xbsk >=  ;
                       clfx.sbsk
                         IF kssj <  ;
                            clfx.sbsk -  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                         IF jssj >  ;
                            clfx.xbsk +  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                    ELSE
                         IF kssj <  ;
                            720
                              mkssj =  ;
                               kssj +  ;
                               1440
                         ELSE
                              mkssj =  ;
                               kssj
                         ENDIF
                         IF mkssj <  ;
                            clfx.sbsk -  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                         IF jssj >  ;
                            720
                              mkssj =  ;
                               jssj -  ;
                               1440
                         ELSE
                              mkssj =  ;
                               jssj
                         ENDIF
                         IF mkssj >  ;
                            clfx.xbsk +  ;
                            sjjb2
                              ret =  ;
                               .F.
                         ENDIF
                    ENDIF
               CASE  .NOT.  ;
                     EMPTY(clfx.bc)  ;
                     .AND.  ;
                     clfx.sbsk >  ;
                     0
                    IF clfx.jbss >  ;
                       IIF(clfx.xbsk <  ;
                       time.xbsj,  ;
                       1440, 0) +  ;
                       clfx.xbsk -  ;
                       time.xbsj
                         ret = .F.
                    ENDIF
               OTHERWISE
                    IF clfx.jbss +  ;
                       clfx.cqss >  ;
                       IIF(clfx.xbsk >  ;
                       clfx.sbsk,  ;
                       clfx.xbsk -  ;
                       clfx.sbsk,  ;
                       1440 +  ;
                       clfx.xbsk -  ;
                       clfx.sbsk) -  ;
                       30
                         ret = .F.
                    ENDIF
          ENDCASE
     CASE jbmod = 2
          DO CASE
               CASE clfx.xbsk > 0  ;
                    .AND.  ;
                    clfx.sbsk >  ;
                    0
                    mt = IIF(clfx.xbsk >  ;
                         clfx.sbsk,  ;
                         clfx.xbsk -  ;
                         clfx.sbsk,  ;
                         1440 +  ;
                         clfx.xbsk -  ;
                         clfx.sbsk)
                    IF ss > mt
                         ret = .F.
                    ENDIF
          ENDCASE
ENDCASE
RETURN ret
ENDFUNC
**
PROCEDURE CheckJJR
SELECT xjjl_d
SEEK clfx.zgbh + clfx.riqi + "43" 
IF FOUND()
     SELECT clfx
     RETURN
ENDIF
SEEK clfx.zgbh + clfx.riqi + "15" 
IF FOUND()
     REPLACE clfx.xrcolor WITH  ;
             rgb_holiday
     SELECT clfx
     RETURN
ENDIF
SELECT xjjl_j
SEEK STR(MONTH(CTOD(clfx.riqi)),  ;
     2) +  ;
     STR(DAY(CTOD(clfx.riqi)), 2) 
IF FOUND()
     REPLACE clfx.xrcolor WITH  ;
             rgb_holiday
     SELECT clfx
     RETURN
ENDIF
SELECT xjjl_w
SEEK clfx.zgbh 
IF FOUND()
     szqno = getzqxr()
     IF szqno <> "-1"
          nzqno = VAL(szqno)
          szq = "ZQ" + szqno
          sksrq = "KSRQ" + szqno
          IF clfx.RIQI>=&sKsRq AND &sZq>0;
 
               N = ctod(clfx.RIQI) - ctod(&sKsRq);
   
               m = 'W'+LTRIM(STR(N-&sZq*INT(N/&sZq)+nZqNo*31));
 
               IF '1'=&m
                    REPLACE clfx.xrcolor  ;
                            WITH  ;
                            rgb_holiday
               ENDIF
          ENDIF
          SELECT clfx
          RETURN
     ENDIF
ENDIF
SELECT xjjl_s
m = STR(DOW(CTOD(clfx.riqi)), 1)
n = "W" + m
IF &n = 1
     REPLACE clfx.xrcolor WITH  ;
             rgb_holiday
ENDIF
SELECT clfx
RETURN
ENDPROC
**
FUNCTION CheckSb
mret = .F.
SELECT xjjl_d
SEEK clfx.zgbh + clfx.riqi + "43" 
IF FOUND()
     REPLACE clfx.qjss WITH 0,  ;
             clfx.qjts WITH 0,  ;
             clfx.zdcl WITH 0
     mret = .T.
ENDIF
SELECT clfx
RETURN mret
ENDFUNC
**
PROCEDURE jjrjb
SELECT clfx
SET RELATION TO zgbh INTO zg
GOTO TOP
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Overtime in holiday..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "节假日加班..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF (zg.zdjb <> "3" .AND.  ;
        zg.zdjb <> "5" .AND.  ;
        zg.zdjb <> "6" .AND.  ;
        zg.zdjb <> "7") .OR. sbsk =  ;
        0 .OR. xbsk = 0 .OR. rgcl >  ;
        0
          LOOP
     ENDIF
     SELECT xjjl_j
     SEEK STR(MONTH(CTOD(clfx.riqi)),  ;
          2) +  ;
          STR(DAY(CTOD(clfx.riqi)),  ;
          2) 
     IF FOUND()
          SELECT clfx
          REPLACE jbss WITH sjjb2 *  ;
                  INT((xbsk -  ;
                  sbsk + IIF(xbsk >  ;
                  sbsk, 0, 1440)) /  ;
                  sjjb2), jbts  ;
                  WITH jbss /  ;
                  sjcq
          REPLACE cqss WITH 0,  ;
                  cqts WITH 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  kgts WITH 0
          REPLACE rgcl WITH 0
          REPLACE zdcl WITH 94
     ENDIF
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
**
PROCEDURE xrjb
SELECT clfx
SET RELATION TO zgbh INTO zg
GOTO TOP
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Overtime in off day..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "休日加班..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF (zg.zdjb <> "2" .AND.  ;
        zg.zdjb <> "4" .AND.  ;
        zg.zdjb <> "6" .AND.  ;
        zg.zdjb <> "7") .OR. sbsk =  ;
        0 .OR. xbsk = 0 .OR. zdcl =  ;
        94 .OR. rgcl > 0
          LOOP
     ENDIF
     IF rgcl = 98
          LOOP
     ENDIF
     SELECT xjjl_d
     SEEK clfx.zgbh + clfx.riqi +  ;
          "1" 
     IF  .NOT. EOF()
          SELECT clfx
          REPLACE jbss WITH sjjb2 *  ;
                  INT((xbsk -  ;
                  sbsk + IIF(xbsk >  ;
                  sbsk, 0, 1440)) /  ;
                  sjjb2), jbts  ;
                  WITH jbss /  ;
                  sjcq
          REPLACE cqss WITH 0,  ;
                  cqts WITH 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  kgts WITH 0
          REPLACE rgcl WITH 0
          REPLACE zdcl WITH 93
          LOOP
     ENDIF
     SELECT xjjl_w
     SEEK clfx.zgbh 
     IF  .NOT. EOF()
          szqno = getzqxr()
          IF szqno <> "-1"
               nzqno = VAL(szqno)
               szq = "ZQ" + szqno
               sksrq = "KSRQ" +  ;
                       szqno
               IF clfx.RIQI>=&sKsRq AND;
&sZq>0  
                    N = ctod(clfx.RIQI);
- ctod(&sKsRq)    
                    m = 'W'+LTRIM(STR(N-&sZq*INT(N/&sZq)+nZqNo*31));
 
                    IF '1'=&m
                         SELECT clfx
                         REPLACE jbss  ;
                                 WITH  ;
                                 sjjb2 *  ;
                                 INT((xbsk -  ;
                                 sbsk +  ;
                                 IIF(xbsk >  ;
                                 sbsk,  ;
                                 0,  ;
                                 1440)) /  ;
                                 sjjb2),  ;
                                 jbts  ;
                                 WITH  ;
                                 jbss /  ;
                                 sjcq
                         REPLACE cqss  ;
                                 WITH  ;
                                 0,  ;
                                 cqts  ;
                                 WITH  ;
                                 0
                         REPLACE rgcl  ;
                                 WITH  ;
                                 0
                         REPLACE zdcl  ;
                                 WITH  ;
                                 93
                    ENDIF
               ENDIF
               SELECT clfx
               LOOP
          ENDIF
     ENDIF
     SELECT xjjl_s
     m = STR(DOW(CTOD(clfx.riqi)),  ;
         1)
     n = "W" + m
     IF &n = 1
          SELECT clfx
          REPLACE jbss WITH sjjb2 *  ;
                  INT((xbsk -  ;
                  sbsk + IIF(xbsk >  ;
                  sbsk, 0, 1440)) /  ;
                  sjjb2), jbts  ;
                  WITH jbss /  ;
                  sjcq
          REPLACE cqss WITH 0,  ;
                  cqts WITH 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  kgts WITH 0
          REPLACE rgcl WITH 0
          REPLACE zdcl WITH 93
     ENDIF
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
**
PROCEDURE jjrkq
mnoxrsk = getantenv("FXPARA",  ;
          "NOXRSK")
SELECT clfx
GOTO TOP
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Un-strict attendance..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "非严格考勤..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF sjxrjb > 0 .AND. jbss > 0  ;
        .AND.  .NOT. EMPTY(bc)  ;
        .AND. zdcl > 92 .AND.  ;
        zdcl < 95
          SELECT time
          SEEK clfx.bc 
          IF  .NOT. EOF()
               SELECT clfx
               IF jbss > time.ss
                    REPLACE jbss  ;
                            WITH  ;
                            time.ss,  ;
                            jbts  ;
                            WITH  ;
                            time.ts
               ELSE
                    IF time.zjxx >  ;
                       0
                         REPLACE jbss  ;
                                 WITH  ;
                                 jbss -  ;
                                 getskdupval(time.sbsj,  ;
                                 time.xbsj,  ;
                                 IIF(time.zjks <  ;
                                 time.sbsj,  ;
                                 1440 +  ;
                                 time.zjks,  ;
                                 time.zjks),  ;
                                 time.zjjs,  ;
                                 1)
                    ENDIF
                    IF time.zjxx1 >  ;
                       0
                         REPLACE jbss  ;
                                 WITH  ;
                                 jbss -  ;
                                 getskdupval(time.sbsj,  ;
                                 time.xbsj,  ;
                                 IIF(time.zjks1 <  ;
                                 time.sbsj,  ;
                                 1440 +  ;
                                 time.zjks1,  ;
                                 time.zjks1),  ;
                                 time.zjjs1,  ;
                                 1)
                    ENDIF
                    REPLACE jbts  ;
                            WITH  ;
                            jbss /  ;
                            8
               ENDIF
          ENDIF
          SELECT clfx
     ENDIF
     IF mnoxrsk = 1 .AND. xrcolor =  ;
        rgb_holiday
          IF rgcl = 0 .AND. (cqss >  ;
             0 .OR. cqts > 0)
               REPLACE cqss WITH  ;
                       0, cqts  ;
                       WITH 0,  ;
                       zdcl WITH  ;
                       0, cdss  ;
                       WITH 0,  ;
                       ztss WITH  ;
                       0
          ENDIF
     ENDIF
     IF rgcl > 0 .OR. zdcl <> 73  ;
        .OR. sbsk = 0 .OR. xbsk =  ;
        0
          LOOP
     ENDIF
     IF rgcl = 98
          LOOP
     ENDIF
     SELECT xjjl_d
     SEEK clfx.zgbh + clfx.riqi +  ;
          "1" 
     IF FOUND() .AND. (zg.mk =  ;
        "2" .OR. zg.mk = "4" .OR.  ;
        zg.mk = "6" .OR. zg.mk =  ;
        "7")
          REPLACE clfx.cqss WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk)
          REPLACE clfx.cqts WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk) /  ;
                  sjcq
          REPLACE clfx.rgcl WITH  ;
                  98
          SELECT clfx
          LOOP
     ENDIF
     SEEK clfx.zgbh + clfx.riqi +  ;
          "15" 
     IF FOUND() .AND. (zg.mk =  ;
        "3" .OR. zg.mk = "5" .OR.  ;
        zg.mk = "6" .OR. zg.mk =  ;
        "7")
          REPLACE clfx.cqss WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk)
          REPLACE clfx.cqts WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk) /  ;
                  sjcq
          REPLACE clfx.rgcl WITH  ;
                  98
          SELECT clfx
          LOOP
     ENDIF
     SELECT xjjl_j
     SEEK STR(MONTH(CTOD(clfx.riqi)),  ;
          2) +  ;
          STR(DAY(CTOD(clfx.riqi)),  ;
          2) 
     IF FOUND() .AND. (zg.mk =  ;
        "3" .OR. zg.mk = "5" .OR.  ;
        zg.mk = "6" .OR. zg.mk =  ;
        "7")
          REPLACE clfx.cqss WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk)
          REPLACE clfx.cqts WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk) /  ;
                  sjcq
          REPLACE clfx.rgcl WITH  ;
                  98
          SELECT clfx
          LOOP
     ENDIF
     SELECT xjjl_w
     SEEK clfx.zgbh 
     IF FOUND()
          szqno = getzqxr()
          IF szqno <> "-1"
               nzqno = VAL(szqno)
               szq = "ZQ" + szqno
               sksrq = "KSRQ" +  ;
                       szqno
               IF clfx.RIQI>=&sKsRq AND;
&sZq>0  
                    N = ctod(clfx.RIQI);
- ctod(&sKsRq)    
                    m = 'W'+LTRIM(STR(N-&sZq*INT(N/&sZq)+nZqNo*31));
 
                    IF '1'=&m AND (ZG.MK="2";
OR ZG.MK="4" OR ZG.MK="6" OR ZG.MK="7");

                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 IIF(clfx.xbsk >=  ;
                                 clfx.sbsk,  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk,  ;
                                 1400 +  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk)
                         REPLACE clfx.cqts  ;
                                 WITH  ;
                                 IIF(clfx.xbsk >=  ;
                                 clfx.sbsk,  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk,  ;
                                 1400 +  ;
                                 clfx.xbsk -  ;
                                 clfx.sbsk) /  ;
                                 sjcq
                         REPLACE clfx.rgcl  ;
                                 WITH  ;
                                 98
                    ENDIF
               ENDIF
               SELECT clfx
               LOOP
          ENDIF
     ENDIF
     SELECT xjjl_s
     m = STR(DOW(CTOD(clfx.riqi)),  ;
         1)
     n = "W" + m
     IF &n = 1 AND (ZG.MK="2" OR ZG.MK="4";
OR ZG.MK="6" OR ZG.MK="7") 
          REPLACE clfx.cqss WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk)
          REPLACE clfx.cqts WITH  ;
                  IIF(clfx.xbsk >=  ;
                  clfx.sbsk,  ;
                  clfx.xbsk -  ;
                  clfx.sbsk, 1400 +  ;
                  clfx.xbsk -  ;
                  clfx.sbsk) /  ;
                  sjcq
          REPLACE clfx.rgcl WITH  ;
                  98
     ENDIF
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
**
FUNCTION GetZqXr
DO CASE
     CASE CTOD(ksrq) <> CTOD("")  ;
          .AND. zq > 0
          DO CASE
               CASE CTOD(ksrq1) =  ;
                    CTOD("")  ;
                    .AND.  ;
                    CTOD(ksrq2) =  ;
                    CTOD("")
                    IF clfx.riqi >=  ;
                       ksrq
                         sret = ""
                    ELSE
                         sret = "-1"
                    ENDIF
               CASE CTOD(ksrq1) <>  ;
                    CTOD("")  ;
                    .AND.  ;
                    CTOD(ksrq2) =  ;
                    CTOD("")
                    DO CASE
                         CASE ksrq <=  ;
                              ksrq1  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq1
                              sret =  ;
                               "1"
                         CASE ksrq <=  ;
                              ksrq1  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq
                              sret =  ;
                               ""
                         CASE ksrq1 <=  ;
                              ksrq  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq
                              sret =  ;
                               ""
                         CASE ksrq1 <=  ;
                              ksrq  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq1
                              sret =  ;
                               "1"
                         OTHERWISE
                              sret =  ;
                               "-1"
                    ENDCASE
               CASE CTOD(ksrq1) =  ;
                    CTOD("")  ;
                    .AND.  ;
                    CTOD(ksrq2) <>  ;
                    CTOD("")
                    DO CASE
                         CASE ksrq <=  ;
                              ksrq2  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq2
                              sret =  ;
                               "2"
                         CASE ksrq <=  ;
                              ksrq2  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq
                              sret =  ;
                               ""
                         CASE ksrq2 <=  ;
                              ksrq  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq
                              sret =  ;
                               ""
                         CASE ksrq2 <=  ;
                              ksrq  ;
                              .AND.  ;
                              clfx.riqi >=  ;
                              ksrq2
                              sret =  ;
                               "2"
                         OTHERWISE
                              sret =  ;
                               "-1"
                    ENDCASE
               OTHERWISE
                    DO CASE
                         CASE clfx.riqi >=  ;
                              ksrq
                              DO CASE
                                   CASE ksrq1 > ksrq .AND. ksrq1 > ksrq2 .AND. clfx.riqi >= ksrq1
                                        sret = "1"
                                   CASE ksrq2 > ksrq .AND. ksrq2 > ksrq1 .AND. clfx.riqi >= ksrq2
                                        sret = "2"
                                   CASE ksrq1 > ksrq .AND. clfx.riqi >= ksrq1
                                        sret = "1"
                                   CASE ksrq2 > ksrq .AND. clfx.riqi >= ksrq2
                                        sret = "2"
                                   OTHERWISE
                                        sret = ""
                              ENDCASE
                         CASE clfx.riqi >=  ;
                              ksrq1
                              DO CASE
                                   CASE ksrq2 > ksrq1 .AND. clfx.riqi >= ksrq2
                                        sret = "2"
                                   OTHERWISE
                                        sret = "1"
                              ENDCASE
                         CASE clfx.riqi >=  ;
                              ksrq2
                              sret =  ;
                               "2"
                         OTHERWISE
                              sret =  ;
                               "-1"
                    ENDCASE
          ENDCASE
     CASE CTOD(ksrq1) <> CTOD("")  ;
          .AND. zq1 > 0
          DO CASE
               CASE CTOD(ksrq2) =  ;
                    CTOD("")
                    IF clfx.riqi >=  ;
                       ksrq1
                         sret = "1"
                    ELSE
                         sret = "-1"
                    ENDIF
               CASE ksrq1 <=  ;
                    ksrq2 .AND.  ;
                    clfx.riqi >=  ;
                    ksrq2
                    sret = "2"
               CASE ksrq1 <=  ;
                    ksrq2 .AND.  ;
                    clfx.riqi >=  ;
                    ksrq1
                    sret = "1"
               CASE ksrq2 <=  ;
                    ksrq1 .AND.  ;
                    clfx.riqi >=  ;
                    ksrq1
                    sret = "1"
               CASE ksrq2 <=  ;
                    ksrq1 .AND.  ;
                    clfx.riqi >=  ;
                    ksrq2
                    sret = "2"
               OTHERWISE
                    sret = "-1"
          ENDCASE
     CASE CTOD(ksrq2) <> CTOD("")  ;
          .AND. zq2 > 0
          IF clfx.riqi >= ksrq2
               sret = "2"
          ELSE
               sret = "-1"
          ENDIF
     OTHERWISE
          sret = "-1"
ENDCASE
RETURN sret
ENDFUNC
**
PROCEDURE fenxi5
SELECT clfx
GOTO TOP
IF EOF()
     RETURN
ENDIF
DO WHILE  .NOT. EOF()
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Be adjusting..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "考勤调整处理..." +  ;
           zgbh + " " + riqi
     ENDIF
     mkqlb = IIF(rgcl > 0, rgcl,  ;
             zdcl)
     IF rgcl = 92 .AND. (sbsk = 0  ;
        .OR. xbsk = 0)
          mrec = RECNO()
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mbc = bc
          DO WHILE  .NOT. BOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi)
               SKIP -1
          ENDDO
          IF mzgbh <> zgbh .OR.  ;
             mdate <> CTOD(riqi)
               SKIP
          ENDIF
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi)
               IF mrec <> RECNO()  ;
                  .AND. cqss > 0  ;
                  .AND.  ;
                  (EMPTY(mbc)  ;
                  .OR. mbc ==  ;
                  bc)
                    GOTO mrec
                    REPLACE cqss  ;
                            WITH  ;
                            0,  ;
                            cqts  ;
                            WITH  ;
                            0
                    SKIP
                    EXIT
               ENDIF
               SKIP
          ENDDO
          SKIP -1
     ENDIF
     SKIP
ENDDO
RETURN
ENDPROC
**
PROCEDURE fenxi6
SELECT clfx
GOTO TOP
IF EOF()
     RETURN
ENDIF
mzgbh = ""
mdate = CTOD("")
DO WHILE  .NOT. EOF()
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Be adjusting..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "分段班调整处理..." +  ;
           zgbh + " " + riqi
     ENDIF
     IF LEN(TRIM(bc)) > 0 .AND.  ;
        LEN(TRIM(bc)) < 3
          SKIP
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mxrcolor = xrcolor
          mbc = ""
          mcnt = 0
          LOOP
     ENDIF
     IF mzgbh <> zgbh .OR. mdate <>  ;
        CTOD(riqi)
          IF  .NOT. EMPTY(mzgbh)  ;
              .AND.  .NOT.  ;
              EMPTY(mbc) .AND.  ;
              mcnt = 1
               mrec = RECNO()
               APPEND BLANK
               REPLACE zgbh WITH  ;
                       mzgbh,  ;
                       riqi WITH  ;
                       DTOC(mdate),  ;
                       xrcolor  ;
                       WITH  ;
                       mxrcolor
               IF RIGHT(mbc, 1) =  ;
                  "1"
                    REPLACE bc  ;
                            WITH  ;
                            LEFT(mbc,  ;
                            2) +  ;
                            "2"
               ELSE
                    REPLACE bc  ;
                            WITH  ;
                            LEFT(mbc,  ;
                            2) +  ;
                            "1"
               ENDIF
               GOTO mrec
          ENDIF
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mxrcolor = xrcolor
          mbc = ""
          mcnt = 0
          LOOP
     ENDIF
     IF  .NOT. EMPTY(bc)
          mbc = bc
     ENDIF
     mcnt = mcnt + 1
     SKIP
ENDDO
SKIP -1
IF  .NOT. EMPTY(mzgbh) .AND.   ;
    .NOT. EMPTY(mbc) .AND. mcnt =  ;
    1
     mrec = RECNO()
     APPEND BLANK
     REPLACE zgbh WITH mzgbh,  ;
             riqi WITH  ;
             DTOC(mdate), xrcolor  ;
             WITH mxrcolor
     IF RIGHT(mbc, 1) = "1"
          REPLACE bc WITH  ;
                  LEFT(mbc, 2) +  ;
                  "2"
     ELSE
          REPLACE bc WITH  ;
                  LEFT(mbc, 2) +  ;
                  "1"
     ENDIF
ENDIF
RETURN
ENDPROC
**
PROCEDURE fenxi7
IF sjjb0 = 0 .AND. sjjb1 = 0
     RETURN
ENDIF
SELECT clfx
SET RELATION TO zgbh INTO zg
mzgbh = ""
mdate = CTOD("")
mcqss = 0
nzgbh = ""
ndate = CTOD("")
njb = .F.
kzgbh = ""
kdate = CTOD("")
kkqlb = 0
SCAN
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Automatic overtime..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "自动加班处理..." +  ;
           zgbh + " " + riqi
     ENDIF
     IF zdcl = 85 .OR. rgcl = 85  ;
        .OR. rgcl = 98
          LOOP
     ENDIF
     IF zg.zdjb <> "1" .AND.  ;
        zg.zdjb <> "4" .AND.  ;
        zg.zdjb <> "5" .AND.  ;
        zg.zdjb <> "7"
          mflag = .F.
          IF rgcl = 0 .AND. (zdcl =  ;
             0 .OR. zdcl = 85  ;
             .OR. zdcl = 73 .OR.  ;
             zdcl = 74 .OR. (zdcl >=  ;
             81 .AND. zdcl <= 83  ;
             .AND. cdss + ztss >  ;
             cqss / 3))
               IF mzgbh = zgbh  ;
                  .AND. mdate =  ;
                  CTOD(riqi)  ;
                  .AND. mcqss >  ;
                  0
                    mflag = .T.
               ELSE
                    mrec = RECNO()
                    mzgbh_ = zgbh
                    mdate_ = CTOD(riqi)
                    SKIP
                    IF  .NOT.  ;
                        EOF()  ;
                        .AND.  ;
                        mzgbh_ =  ;
                        zgbh  ;
                        .AND.  ;
                        mdate_ =  ;
                        CTOD(riqi)  ;
                        .AND.  ;
                        (rgcl > 0  ;
                        .OR.   ;
                        .NOT.  ;
                        (zdcl = 0  ;
                        .OR. zdcl =  ;
                        85 .OR.  ;
                        zdcl = 73  ;
                        .OR. zdcl =  ;
                        74 .OR.  ;
                        (zdcl >=  ;
                        81 .AND.  ;
                        zdcl <=  ;
                        83 .AND.  ;
                        cdss +  ;
                        ztss >  ;
                        cqss /  ;
                        3)))
                         mflag = .T.
                    ENDIF
                    GOTO mrec
               ENDIF
          ENDIF
          IF mflag
               REPLACE cqss WITH  ;
                       0, cqts  ;
                       WITH 0,  ;
                       cdss WITH  ;
                       0, ztss  ;
                       WITH 0,  ;
                       kgss WITH  ;
                       0, kgts  ;
                       WITH 0,  ;
                       zdcl WITH  ;
                       0, rgcl  ;
                       WITH 0
          ENDIF
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mcqss = cqss
          LOOP
     ENDIF
     IF jbss > 0 .OR. jbts > 0
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mcqss = cqss
          mflag = .T.
          IF sbsj > 0 .AND. xbsj >  ;
             0 .AND. (rgcl = 92  ;
             .OR. zdcl = 92)
               mxbsj = IIF(xbsj >=  ;
                       sbsj, xbsj,  ;
                       1440 +  ;
                       xbsj)
               SELECT xjjl_d
               SEEK mzgbh +  ;
                    DTOC(mdate) +  ;
                    "92" 
               DO WHILE  .NOT.  ;
                  EOF() .AND.  ;
                  mzgbh=zgbh  ;
                  .AND. mdate= ;
                  CTOD(riqi)  ;
                  .AND. mflag
                    mjssj = IIF(jssj >=  ;
                            kssj,  ;
                            jssj,  ;
                            1440 +  ;
                            jssj)
                    IF kssj >  ;
                       clfx.sbsj  ;
                       .AND. kssj <  ;
                       mxbsj  ;
                       .AND.  ;
                       mjssj >  ;
                       clfx.sbsj  ;
                       .AND.  ;
                       mjssj <  ;
                       mxbsj
                         mflag = .F.
                    ENDIF
                    SKIP
               ENDDO
               SELECT clfx
          ENDIF
          IF mflag
               LOOP
          ENDIF
     ENDIF
     IF njb .AND. (rgcl = 1 .OR.  ;
        rgcl = 15 .OR. ((zdcl = 1  ;
        .OR. zdcl = 15) .AND.  ;
        rgcl = 0)) .AND. nzgbh =  ;
        zgbh .AND. ndate =  ;
        CTOD(riqi) - 1
          SKIP -1
          njb1 = 0
          njb2 = 0
          nxbsj = xbsj
          nxbsk = xbsk
          DO CASE
               CASE xbsk < sbsk  ;
                    .AND. sbsj <  ;
                    xbsk .AND.  ;
                    sbsj < sbsk
                    IF sjjb0 > 0  ;
                       .AND. 1440 +  ;
                       sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         njb1 = sjjb2 *  ;
                                INT((1440 +  ;
                                sbsj -  ;
                                sbsk) /  ;
                                sjjb2)
                    ENDIF
                    IF sjjb1 > 0  ;
                       .AND. xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         njb2 = sjjb2 *  ;
                                INT((xbsk -  ;
                                xbsj) /  ;
                                sjjb2)
                    ENDIF
               CASE xbsk < sbsk  ;
                    .AND. xbsj >  ;
                    sbsk .AND.  ;
                    xbsj < xbsk
                    IF sjjb0 > 0  ;
                       .AND. sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         njb1 = sjjb2 *  ;
                                INT((sbsj -  ;
                                sbsk) /  ;
                                sjjb2)
                    ENDIF
                    IF sjjb1 > 0  ;
                       .AND. 1440 +  ;
                       xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         njb2 = sjjb2 *  ;
                                INT((1440 +  ;
                                xbsk -  ;
                                xbsj) /  ;
                                sjjb2)
                    ENDIF
               CASE xbsj < sbsj  ;
                    .AND. xbsk >  ;
                    sbsj .AND.  ;
                    xbsk > xbsj
                    IF sjjb0 > 0  ;
                       .AND. sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         njb1 = sjjb2 *  ;
                                INT((sbsj -  ;
                                sbsk) /  ;
                                sjjb2)
                    ENDIF
               CASE xbsj < sbsj  ;
                    .AND. sbsk <  ;
                    sbsj .AND.  ;
                    sbsk < xbsj
                    IF sjjb1 > 0  ;
                       .AND. xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         njb2 = sjjb2 *  ;
                                INT((xbsk -  ;
                                xbsj) /  ;
                                sjjb2)
                    ENDIF
               OTHERWISE
                    IF sjjb0 > 0  ;
                       .AND. sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         njb1 = sjjb2 *  ;
                                INT((sbsj -  ;
                                sbsk) /  ;
                                sjjb2)
                    ENDIF
                    IF sjjb1 > 0  ;
                       .AND. xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         njb2 = sjjb2 *  ;
                                INT((xbsk -  ;
                                xbsj) /  ;
                                sjjb2)
                    ENDIF
          ENDCASE
          IF njb2 > 0
               REPLACE jbss WITH  ;
                       jbss -  ;
                       njb2
               REPLACE jbts WITH  ;
                       jbss /  ;
                       sjcq
               IF jbss = 0
                    IF zdcl = 92
                         REPLACE zdcl  ;
                                 WITH  ;
                                 98
                    ENDIF
                    IF rgcl = 92
                         REPLACE rgcl  ;
                                 WITH  ;
                                 98
                    ENDIF
               ENDIF
               SKIP
               mkqlb = IIF(rgcl >  ;
                       0, rgcl,  ;
                       zdcl)
               REPLACE jbss WITH  ;
                       njb2, jbts  ;
                       WITH njb2 /  ;
                       sjcq, qjss  ;
                       WITH 0,  ;
                       qjts WITH  ;
                       0, rgcl  ;
                       WITH 0,  ;
                       zdcl WITH  ;
                       IIF(mkqlb =  ;
                       1, 93,  ;
                       94)
               REPLACE xrcolor  ;
                       WITH  ;
                       rgb_holiday
               DO WHILE nxbsj>= ;
                  1440
                    nxbsj = nxbsj -  ;
                            1440
               ENDDO
               DO WHILE nxbsk>= ;
                  1440
                    nxbsk = nxbsk -  ;
                            1440
               ENDDO
               REPLACE sbsk WITH  ;
                       nxbsj,  ;
                       xbsk WITH  ;
                       nxbsk
          ELSE
               SKIP
          ENDIF
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mcqss = cqss
          LOOP
     ENDIF
     IF (sbsk = 0 .OR. xbsk = 0)  ;
        .OR. ((sbsj = 0 .OR. xbsj =  ;
        0) .AND.  .NOT. (rgcl = 0  ;
        .AND. (zdcl = 0 .OR. zdcl =  ;
        85 .OR. zdcl = 73 .OR.  ;
        zdcl = 74 .OR. (zdcl >=  ;
        81 .AND. zdcl <= 83 .AND.  ;
        cdss + ztss > cqss /  ;
        3))))
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mcqss = cqss
          LOOP
     ENDIF
     mxrjb = 0
     IF sbsk > 0 .AND. xbsk > 0  ;
        .AND. (sbsk > xbsk .OR.  ;
        xbsk > 1440)
          szgbh = zgbh
          sdate = CTOD(riqi)
          SKIP
          IF szgbh = zgbh .AND.  ;
             sdate = CTOD(riqi) -  ;
             1 .AND. (rgcl = 93  ;
             .OR. rgcl = 94)
               mxrjb = jbss
          ENDIF
          SKIP -1
     ENDIF
     msecond = .F.
     IF rgcl = 0 .AND. (zdcl = 0  ;
        .OR. zdcl = 85 .OR. zdcl =  ;
        73 .OR. zdcl = 74 .OR.  ;
        (zdcl >= 81 .AND. zdcl <=  ;
        83 .AND. cdss + ztss >  ;
        cqss / 3))
          IF mzgbh = zgbh .AND.  ;
             mdate = CTOD(riqi)  ;
             .AND. mcqss > 0
               msecond = .T.
          ELSE
               mrec = RECNO()
               mzgbh_ = zgbh
               mdate_ = CTOD(riqi)
               SKIP
               IF  .NOT. EOF()
                    IF mzgbh_ =  ;
                       zgbh .AND.  ;
                       mdate_ =  ;
                       CTOD(riqi)
                         IF rgcl >  ;
                            0  ;
                            .OR.   ;
                            .NOT.  ;
                            (zdcl =  ;
                            0  ;
                            .OR.  ;
                            zdcl =  ;
                            85  ;
                            .OR.  ;
                            zdcl =  ;
                            73  ;
                            .OR.  ;
                            zdcl =  ;
                            74  ;
                            .OR.  ;
                            (zdcl >=  ;
                            81  ;
                            .AND.  ;
                            zdcl <=  ;
                            83  ;
                            .AND.  ;
                            cdss +  ;
                            ztss >  ;
                            cqss /  ;
                            3))
                              msecond =  ;
                               .T.
                         ENDIF
                    ELSE
                         msecond =  ;
                          .T.
                    ENDIF
               ENDIF
               IF  .NOT. msecond
                    GOTO mrec
                    SKIP -1
                    IF mrec <>  ;
                       RECNO()
                         IF mzgbh_ =  ;
                            zgbh  ;
                            .AND.  ;
                            mdate_ =  ;
                            CTOD(riqi)
                              IF rgcl >  ;
                                 0  ;
                                 .OR.   ;
                                 .NOT.  ;
                                 (zdcl =  ;
                                 0  ;
                                 .OR.  ;
                                 zdcl =  ;
                                 85  ;
                                 .OR.  ;
                                 zdcl =  ;
                                 73  ;
                                 .OR.  ;
                                 zdcl =  ;
                                 74  ;
                                 .OR.  ;
                                 (zdcl >=  ;
                                 81  ;
                                 .AND.  ;
                                 zdcl <=  ;
                                 83  ;
                                 .AND.  ;
                                 cdss +  ;
                                 ztss >  ;
                                 cqss /  ;
                                 3))
                                   msecond = .T.
                              ENDIF
                         ELSE
                              msecond =  ;
                               .T.
                         ENDIF
                    ENDIF
               ENDIF
               GOTO mrec
          ENDIF
     ENDIF
     IF  .NOT. msecond
          DO CASE
               CASE xbsk < sbsk  ;
                    .AND. sbsj <  ;
                    xbsk .AND.  ;
                    sbsj < sbsk
                    IF sjjb0 > 0  ;
                       .AND. 1440 +  ;
                       sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         REPLACE jbss  ;
                                 WITH  ;
                                 jbss +  ;
                                 sjjb2 *  ;
                                 INT((1440 +  ;
                                 sbsj -  ;
                                 sbsk) /  ;
                                 sjjb2)
                    ENDIF
                    IF sjjb1 > 0  ;
                       .AND. xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         mxrjb_rate =  ;
                          mxrjb /  ;
                          (sjjb2 *  ;
                          INT((xbsk -  ;
                          xbsj) /  ;
                          sjjb2))
                         IF mxrjb_rate <  ;
                            0.9   ;
                            .OR.  ;
                            mxrjb_rate >  ;
                            1.1 
                              REPLACE  ;
                               jbss  ;
                               WITH  ;
                               jbss +  ;
                               sjjb2 *  ;
                               INT((xbsk -  ;
                               xbsj) /  ;
                               sjjb2)
                         ENDIF
                    ENDIF
               CASE xbsk < sbsk  ;
                    .AND. xbsj >  ;
                    sbsk .AND.  ;
                    xbsj < xbsk
                    IF sjjb0 > 0  ;
                       .AND. sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         REPLACE jbss  ;
                                 WITH  ;
                                 jbss +  ;
                                 sjjb2 *  ;
                                 INT((sbsj -  ;
                                 sbsk) /  ;
                                 sjjb2)
                    ENDIF
                    IF sjjb1 > 0  ;
                       .AND. 1440 +  ;
                       xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         mxrjb_rate =  ;
                          mxrjb /  ;
                          (sjjb2 *  ;
                          INT((1440 +  ;
                          xbsk -  ;
                          xbsj) /  ;
                          sjjb2))
                         IF mxrjb_rate <  ;
                            0.9   ;
                            .OR.  ;
                            mxrjb_rate >  ;
                            1.1 
                              REPLACE  ;
                               jbss  ;
                               WITH  ;
                               jbss +  ;
                               sjjb2 *  ;
                               INT((1440 +  ;
                               xbsk -  ;
                               xbsj) /  ;
                               sjjb2)
                         ENDIF
                    ENDIF
               CASE xbsj < sbsj  ;
                    .AND. xbsk >  ;
                    sbsj .AND.  ;
                    xbsk > xbsj
                    IF sjjb0 > 0  ;
                       .AND. sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         REPLACE jbss  ;
                                 WITH  ;
                                 jbss +  ;
                                 sjjb2 *  ;
                                 INT((sbsj -  ;
                                 sbsk) /  ;
                                 sjjb2)
                    ENDIF
               CASE xbsj < sbsj  ;
                    .AND. sbsk <  ;
                    sbsj .AND.  ;
                    sbsk < xbsj
                    IF sjjb1 > 0  ;
                       .AND. xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         mxrjb_rate =  ;
                          mxrjb /  ;
                          (sjjb2 *  ;
                          INT((xbsk -  ;
                          xbsj) /  ;
                          sjjb2))
                         IF mxrjb_rate <  ;
                            0.9   ;
                            .OR.  ;
                            mxrjb_rate >  ;
                            1.1 
                              REPLACE  ;
                               jbss  ;
                               WITH  ;
                               jbss +  ;
                               sjjb2 *  ;
                               INT((xbsk -  ;
                               xbsj) /  ;
                               sjjb2)
                         ENDIF
                    ENDIF
               OTHERWISE
                    IF sjjb0 > 0  ;
                       .AND. sbsj -  ;
                       sbsk >  ;
                       sjjb0
                         REPLACE jbss  ;
                                 WITH  ;
                                 jbss +  ;
                                 sjjb2 *  ;
                                 INT((sbsj -  ;
                                 sbsk) /  ;
                                 sjjb2)
                    ENDIF
                    IF sjjb1 > 0  ;
                       .AND. xbsk -  ;
                       xbsj >  ;
                       sjjb1
                         mxrjb_rate =  ;
                          mxrjb /  ;
                          ((sjjb2 *  ;
                          INT((xbsk -  ;
                          xbsj) /  ;
                          sjjb2)))
                         IF mxrjb_rate <  ;
                            0.9   ;
                            .OR.  ;
                            mxrjb_rate >  ;
                            1.1 
                              REPLACE  ;
                               jbss  ;
                               WITH  ;
                               jbss +  ;
                               sjjb2 *  ;
                               INT((xbsk -  ;
                               xbsj) /  ;
                               sjjb2)
                         ENDIF
                    ENDIF
          ENDCASE
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mcqss = cqss
     ENDIF
     IF jbss > 0
          REPLACE jbts WITH jbss /  ;
                  sjcq
          DO CASE
               CASE zdcl = 0
                    REPLACE zdcl  ;
                            WITH  ;
                            92
               CASE rgcl = 0
                    REPLACE rgcl  ;
                            WITH  ;
                            92
               OTHERWISE
                    REPLACE zdcl  ;
                            WITH  ;
                            rgcl,  ;
                            rgcl  ;
                            WITH  ;
                            92
          ENDCASE
     ENDIF
     njb = .F.
     IF njbflag > 0 .AND. (xbsk <  ;
        sbsk .OR. xbsk > 1440  ;
        .OR. sbsk < delta0) .AND.  ;
        jbss > 0 .AND. lb = '3'
          nzgbh = zgbh
          ndate = CTOD(riqi)
          njb = .T.
     ENDIF
     mkqlb = IIF(rgcl = 0, zdcl,  ;
             rgcl)
     IF ((mkqlb = 0 .OR. mkqlb =  ;
        73) .AND. sbsk > 0 .AND.  ;
        xbsk > 0) .OR. (mkqlb >=  ;
        80 .AND. mkqlb <= 83  ;
        .AND. cdss + ztss > 120)  ;
        .OR. mkqlb = 85
          mflag = .F.
          IF nzgbh <> zgbh .OR.  ;
             ndate <> CTOD(riqi)  ;
             .OR. kkqlb = 0
               kzgbh = zgbh
               kdate = CTOD(riqi)
               mrec = RECNO()
               SKIP
               IF  .NOT. EOF()  ;
                   .AND. kzgbh =  ;
                   zgbh .AND.  ;
                   kdate =  ;
                   CTOD(riqi)
                    mkqlb = IIF(rgcl =  ;
                            0,  ;
                            zdcl,  ;
                            rgcl)
                    IF  .NOT.  ;
                        ((mkqlb =  ;
                        0 .OR.  ;
                        mkqlb =  ;
                        73) .AND.  ;
                        sbsk > 0  ;
                        .AND.  ;
                        xbsk > 0)  ;
                        .AND.   ;
                        .NOT.  ;
                        (mkqlb >=  ;
                        80 .AND.  ;
                        mkqlb <=  ;
                        83 .AND.  ;
                        IIF(xbsk >=  ;
                        sbsk, 0,  ;
                        1440) +  ;
                        xbsk -  ;
                        sbsk <  ;
                        sjcq / 2)  ;
                        .AND.  ;
                        mkqlb <>  ;
                        85
                         mflag = .T.
                    ENDIF
               ENDIF
               GOTO mrec
          ELSE
               mflag = .T.
          ENDIF
          IF mflag
               REPLACE jbss WITH  ;
                       sjjb2 *  ;
                       INT((IIF(xbsk >=  ;
                       sbsk, 0,  ;
                       1440) +  ;
                       xbsk -  ;
                       sbsk) /  ;
                       sjjb2),  ;
                       jbts WITH  ;
                       jbss /  ;
                       sjcq, rgcl  ;
                       WITH 92,  ;
                       zdcl WITH  ;
                       0
               REPLACE cqss WITH  ;
                       0, cqts  ;
                       WITH 0,  ;
                       cdss WITH  ;
                       0, ztss  ;
                       WITH 0,  ;
                       kgss WITH  ;
                       0, kgts  ;
                       WITH 0
          ENDIF
     ENDIF
     nzgbh = zgbh
     ndate = CTOD(riqi)
     kkqlb = IIF(cqss > 0, 1, 0)
ENDSCAN
RETURN
ENDPROC
**
PROCEDURE fenxi7_1
SELECT clfx
GOTO TOP
DO WHILE  .NOT. EOF()
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Automatic overtime..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "自动加班补充处理..." +  ;
           zgbh + " " + riqi
     ENDIF
     mrec = RECNO()
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mflag = 0
     mbc = ""
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        CTOD(riqi)
          IF jbss > 0 .AND. (zdcl =  ;
             92 .OR. rgcl = 92)  ;
             .AND. EMPTY(bc)
               mflag = 1
          ENDIF
          IF cqss > 0 .AND.   ;
             .NOT. EMPTY(bc)  ;
             .AND. EMPTY(mbc)
               mbc = bc
          ENDIF
          SKIP
     ENDDO
     IF mflag > 0 .AND.  .NOT.  ;
        EMPTY(mbc)
          GOTO mrec
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi)
               IF jbss > 0 .AND.  ;
                  (zdcl = 92 .OR.  ;
                  rgcl = 92)  ;
                  .AND.  ;
                  EMPTY(bc)
                    REPLACE bc  ;
                            WITH  ;
                            mbc
               ENDIF
               SKIP
          ENDDO
     ENDIF
ENDDO
RETURN
ENDPROC
**
PROCEDURE fenxi8
SELECT clfx
GOTO TOP
IF EOF()
     RETURN
ENDIF
mzgbh = ""
mdate = CTOD("")
DO WHILE  .NOT. EOF()
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Be adjusting..." +  ;
           TRIM(zgbh) + " " +  ;
           riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "分段班调整处理..." +  ;
           TRIM(zgbh) + " " +  ;
           riqi
     ENDIF
     IF LEN(TRIM(bc)) < 3
          SKIP
          LOOP
     ENDIF
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mcurrentrec = RECNO()
     DO WHILE  .NOT. BOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        CTOD(riqi)
          SKIP -1
     ENDDO
     IF mzgbh <> zgbh .OR. mdate <>  ;
        CTOD(riqi)
          SKIP
     ENDIF
     mfirstrec = RECNO()
     mxiurirec = 0
     mcqss = 0
     DO WHILE  .NOT. EOF() .AND.  ;
        mzgbh=zgbh .AND. mdate= ;
        CTOD(riqi)
          IF jbss > 0 .AND.  ;
             ((zdcl >= 93 .AND.  ;
             zdcl <= 94) .OR.  ;
             (rgcl >= 93 .AND.  ;
             rgcl <= 94))
               mxiurirec = RECNO()
          ENDIF
          IF LEN(TRIM(bc)) > 2
               mcqss = mcqss +  ;
                       cqss
          ENDIF
          SKIP
     ENDDO
     IF mxiurirec > 0
          GOTO mfirstrec
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. mdate= ;
             CTOD(riqi)
               IF mxiurirec =  ;
                  RECNO()
                    IF mcqss > 0
                         IF jbss >  ;
                            mcqss *  ;
                            1.05 
                              IF sjycjb1 =  ;
                                 2
                                   REPLACE jbss WITH mcqss, jbts WITH mcqss / sjcq, jbyc WITH jbyc + 1
                              ELSE
                                   REPLACE jbyc WITH 1
                              ENDIF
                         ELSE
                              IF jbss <  ;
                                 mcqss *  ;
                                 0.95 
                                   IF sjycjb2 = 2
                                        REPLACE jbss WITH mcqss, jbts WITH mcqss / sjcq, jbyc WITH jbyc + 1
                                   ELSE
                                        REPLACE jbyc WITH 3
                                   ENDIF
                              ENDIF
                         ENDIF
                    ENDIF
               ELSE
                    IF LEN(TRIM(bc)) >  ;
                       2
                         REPLACE cqss  ;
                                 WITH  ;
                                 0,  ;
                                 cqts  ;
                                 WITH  ;
                                 0,  ;
                                 qjss  ;
                                 WITH  ;
                                 0,  ;
                                 qjts  ;
                                 WITH  ;
                                 0,  ;
                                 kgss  ;
                                 WITH  ;
                                 0,  ;
                                 kgts  ;
                                 WITH  ;
                                 0,  ;
                                 cqss  ;
                                 WITH  ;
                                 0,  ;
                                 ztss  ;
                                 WITH  ;
                                 0
                         REPLACE zdcl  ;
                                 WITH  ;
                                 0,  ;
                                 rgcl  ;
                                 WITH  ;
                                 98
                    ENDIF
               ENDIF
               SKIP
          ENDDO
     ENDIF
ENDDO
RETURN
ENDPROC
**
FUNCTION ZaiTi
mret = 0
SELECT clfx
mrec = RECNO()
mzgbh = zgbh
mdate = CTOD(riqi)
DO WHILE  .NOT. BOF() .AND. mzgbh= ;
   zgbh .AND. mdate=CTOD(riqi)
     SKIP -1
ENDDO
IF mzgbh <> zgbh .OR. mdate <>  ;
   CTOD(riqi)
     SKIP
ENDIF
DO CASE
     CASE xjjl_d.kqlb = 98 .OR.  ;
          xjjl_d.kqlb = 93 .OR.  ;
          xjjl_d.kqlb = 94
          DO CASE
               CASE xjjl_d.kssj >  ;
                    0 .AND.  ;
                    xjjl_d.jssj >  ;
                    0
                    DO WHILE  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mdate= ;
                       CTOD(riqi)
                         IF sbsk >  ;
                            0  ;
                            .AND.  ;
                            xbsk >  ;
                            0  ;
                            .AND.  ;
                            chkshiftdup(sbsk,  ;
                            xbsk,  ;
                            xjjl_d.kssj,  ;
                            xjjl_d.jssj)
                              mrec =  ;
                               RECNO()
                              EXIT
                         ENDIF
                         SKIP
                    ENDDO
          ENDCASE
     CASE xjjl_d.kqlb = 92
          DO CASE
               CASE xjjl_d.kssj >  ;
                    0 .AND.  ;
                    xjjl_d.jssj >  ;
                    0
                    mdelta0 = 9999
                    mdelta = 9999
                    DO WHILE  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mdate= ;
                       CTOD(riqi)
                         mdelta =  ;
                          getskdupval(xjjl_d.kssj,  ;
                          xjjl_d.jssj,  ;
                          sbsk,  ;
                          xbsk,  ;
                          0)
                         IF mdelta <  ;
                            mdelta0
                              mrec =  ;
                               RECNO()
                              mdelta0 =  ;
                               mdelta
                         ENDIF
                         SKIP
                    ENDDO
               CASE  .NOT.  ;
                     EMPTY(xjjl_d.bc)
                    DO WHILE  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mdate= ;
                       CTOD(riqi)
                         IF bc =  ;
                            xjjl_d.bc
                              mrec =  ;
                               RECNO()
                              EXIT
                         ENDIF
                         SKIP
                    ENDDO
               OTHERWISE
                    DO WHILE  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mdate= ;
                       CTOD(riqi)
                         IF sbsk >  ;
                            0  ;
                            .AND.  ;
                            xbsk >  ;
                            0
                              cda_rate =  ;
                               sjjb2 *  ;
                               INT(IIF(xbsk <  ;
                               sbsk,  ;
                               1440 +  ;
                               xbsk -  ;
                               sbsk,  ;
                               xbsk -  ;
                               sbsk) /  ;
                               sjjb2) /  ;
                               xjjl_d.ss
                              IF cda_rate >=  ;
                                 0.5   ;
                                 .AND.  ;
                                 cda_rate <=  ;
                                 1.5   ;
                                 .AND.  ;
                                 (zdcl =  ;
                                 73  ;
                                 .OR.  ;
                                 zdcl =  ;
                                 0)  ;
                                 .AND.  ;
                                 rgcl =  ;
                                 0
                                   mret = 1
                                   mrec = RECNO()
                                   EXIT
                              ENDIF
                         ENDIF
                         IF SUBSTR(bc,  ;
                            3, 1) >  ;
                            '1'
                              mrec =  ;
                               RECNO()
                              EXIT
                         ENDIF
                         SKIP
                    ENDDO
          ENDCASE
     CASE xjjl_d.kqlb > 0 .AND.  ;
          xjjl_d.kqlb < 31
          DO CASE
               CASE xjjl_d.kssj >  ;
                    0 .AND.  ;
                    xjjl_d.jssj >  ;
                    0
                    mdelta0 = 9999
                    mdelta = 9999
                    msbsk = sbsk
                    mxbsk = IIF(xbsk <  ;
                            sbsk,  ;
                            1440 +  ;
                            xbsk,  ;
                            xbsk)
                    mkssj = xjjl_d.kssj
                    mjssj = IIF(xjjl_d.jssj <  ;
                            xjjl_d.kssj,  ;
                            1440 +  ;
                            xjjl_d.jssj,  ;
                            xjjl_d.jssj)
                    DO WHILE  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mdate= ;
                       CTOD(riqi)
                         DO CASE
                              CASE  ;
                               (msbsk =  ;
                               0  ;
                               .OR.  ;
                               mxbsk =  ;
                               0)  ;
                               .AND.  ;
                               xjjl_d.ts =  ;
                               1
                                   mdelta = msbsk + mxbsk + 1
                              CASE  ;
                               msbsk >  ;
                               0  ;
                               .AND.  ;
                               mxbsk >  ;
                               0  ;
                               .AND.  ;
                               mkssj >=  ;
                               msbsk  ;
                               .AND.  ;
                               mkssj <=  ;
                               mxbsk  ;
                               .AND.  ;
                               mjssj >=  ;
                               msbsk  ;
                               .AND.  ;
                               mjssj <=  ;
                               mxbsk
                                   mdelta = 0
                              CASE  ;
                               mkssj <  ;
                               msbsk  ;
                               .AND.  ;
                               mjssj <  ;
                               mxbsk
                                   mdelta = ABS(msbsk - mjssj)
                              CASE  ;
                               mkssj >  ;
                               msbsk  ;
                               .AND.  ;
                               mjssj >  ;
                               mxbsk
                                   mdelta = ABS(mxbsk - mkssj)
                         ENDCASE
                         IF mdelta <  ;
                            mdelta0
                              mrec =  ;
                               RECNO()
                              mdelta0 =  ;
                               mdelta
                         ENDIF
                         SKIP
                    ENDDO
               CASE  .NOT.  ;
                     EMPTY(xjjl_d.bc)
                    DO WHILE  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mdate= ;
                       CTOD(riqi)
                         IF bc =  ;
                            xjjl_d.bc
                              mrec =  ;
                               RECNO()
                              EXIT
                         ENDIF
                         SKIP
                    ENDDO
          ENDCASE
ENDCASE
GOTO mrec
SELECT xjjl_d
RETURN mret
ENDFUNC
**
FUNCTION GetBcTab
gbt_select = LTRIM(STR(SELECT()))
SELECT zg
IF EOF()
     select &gbt_select
     RETURN -1
ENDIF
gbt_recno = RECNO()
SEEK clfx.zgbh 
IF EOF()
     SELECT zg
     GOTO gbt_recno
     select &gbt_select
     RETURN -1
ENDIF
v_ksbc = ALLTRIM(ksbc)
bctabcnt = 0
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
          bctablb(bctabcnt) = lb
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
          bctabts(bctabcnt) = ts
          SKIP
     ENDDO
     mbc = LEFT(v_ksbc, IIF(AT( ;
           ",", v_ksbc) = 0, 3,  ;
           AT(",", v_ksbc) - 1))
     v_ksbc = RIGHT(v_ksbc,  ;
              LEN(v_ksbc) -  ;
              LEN(mbc) - 1)
ENDDO
SELECT zg
GOTO gbt_recno
select &gbt_select		
RETURN bctabcnt
ENDFUNC
**
PROCEDURE TryXrjbBC
PARAMETER t_sb, t_xb, t_mod
t_xb = t_xb + IIF(t_xb < t_sb,  ;
       1440, 0)
mbctabsel = 0
mdelta = 9999
FOR j = 1 TO bctabcnt
     i_sb = bctabsb(j)
     i_xb = bctabxb(j)
     mdelta1 = ABS(i_sb - t_sb) +  ;
               ABS(t_xb - i_xb)
     IF mdelta1 < mdelta
          mdelta = mdelta1
          mbctabsel = j
     ENDIF
ENDFOR
IF mdelta < delta4
     IF t_mod = 0
          REPLACE clfx.cqss WITH  ;
                  bctabss(mbctabsel)
          REPLACE clfx.cqts WITH  ;
                  bctabts(mbctabsel)
     ENDIF
     REPLACE clfx.bc WITH  ;
             bctabbh(mbctabsel)
     REPLACE clfx.sbsj WITH  ;
             bctabsb(mbctabsel)
     REPLACE clfx.xbsj WITH  ;
             bctabxb(mbctabsel)
     REPLACE clfx.lb WITH  ;
             bctablb(mbctabsel)
     REPLACE clfx.zdcl WITH 98
     mcd = clfx.sbsk - clfx.sbsj
     mzt = clfx.xbsj - clfx.xbsk
     IF mcd > sjcd1 .OR. mzt >  ;
        sjzt1
          IF mcd > sjcd1
               REPLACE clfx.cdss  ;
                       WITH  ;
                       IIF(sjcd2 >  ;
                       1, sjcd2 *  ;
                       (INT(mcd /  ;
                       sjcd2) +  ;
                       1), mcd)
               REPLACE clfx.zdcl  ;
                       WITH 80
          ENDIF
          IF mzt > sjzt1
               REPLACE clfx.ztss  ;
                       WITH  ;
                       IIF(sjzt2 >  ;
                       1, sjzt2 *  ;
                       (INT(mzt /  ;
                       sjzt2) +  ;
                       1), mzt)
               REPLACE clfx.zdcl  ;
                       WITH  ;
                       IIF(clfx.zdcl =  ;
                       80, 82,  ;
                       81)
          ENDIF
     ENDIF
     IF clfx.cdss >= sjcd3 .OR.  ;
        clfx.ztss >= sjzt3
          IF (clfx.sbsj > 0 .AND.  ;
             clfx.sbsk <  ;
             clfx.sbsj .AND.  ;
             clfx.xbsk <  ;
             clfx.sbsj) .OR.  ;
             (clfx.xbsj > 0 .AND.  ;
             clfx.sbsk >  ;
             clfx.xbsj .AND.  ;
             clfx.xbsk >  ;
             clfx.xbsj)
               REPLACE clfx.sbsj  ;
                       WITH 0,  ;
                       clfx.xbsj  ;
                       WITH 0,  ;
                       clfx.bc  ;
                       WITH '',  ;
                       clfx.lb  ;
                       WITH '',  ;
                       clfx.cdss  ;
                       WITH 0,  ;
                       clfx.ztss  ;
                       WITH 0,  ;
                       clfx.zdcl  ;
                       WITH 0
          ELSE
               REPLACE clfx.kgss  ;
                       WITH  ;
                       clfx.cqss,  ;
                       clfx.kgts  ;
                       WITH  ;
                       clfx.cqts
               REPLACE clfx.zdcl  ;
                       WITH 85
               REPLACE clfx.cdss  ;
                       WITH 0,  ;
                       clfx.ztss  ;
                       WITH 0,  ;
                       clfx.cqss  ;
                       WITH 0,  ;
                       clfx.cqts  ;
                       WITH 0
          ENDIF
     ENDIF
ENDIF
RETURN
ENDPROC
**
PROCEDURE TryInvalidReg
PARAMETER ttr_mode
SELECT clfx
DO CASE
     CASE ttr_mode = 0
          IF qjss + cqss > 1.25  *  ;
             sjcq
               IF sjycqj1 = 1
                    REPLACE qjyc  ;
                            WITH  ;
                            1
               ELSE
                    REPLACE qjyc  ;
                            WITH  ;
                            2,  ;
                            qjss  ;
                            WITH  ;
                            IIF(sjcq >  ;
                            cqss,  ;
                            sjcq -  ;
                            cqss,  ;
                            0),  ;
                            qjts  ;
                            WITH  ;
                            qjss /  ;
                            sjcq
               ENDIF
          ENDIF
     CASE ttr_mode = 1
          IF sbsk > 0 .AND. xbsk >  ;
             0
               mkqlb = IIF(rgcl >=  ;
                       92 .AND.  ;
                       rgcl <= 94,  ;
                       rgcl,  ;
                       zdcl)
               IF mkqlb = 92 .OR.  ;
                  (mkqlb <> 1  ;
                  .AND. mkqlb <>  ;
                  15)
                    ttr_delta = checkjbba(sbsk,  ;
                                xbsk,  ;
                                sbsj,  ;
                                xbsj,  ;
                                jbss)
               ELSE
                    ttr_delta = sjjb2 *  ;
                                INT((IIF(xbsk <  ;
                                sbsk,  ;
                                1440,  ;
                                0) +  ;
                                xbsk -  ;
                                sbsk) /  ;
                                sjjb2) -  ;
                                cqss
               ENDIF
               IF jbss >  ;
                  ttr_delta
                    IF sjycjb1 =  ;
                       1
                         REPLACE jbyc  ;
                                 WITH  ;
                                 1
                    ELSE
                         REPLACE jbyc  ;
                                 WITH  ;
                                 2,  ;
                                 jbss  ;
                                 WITH  ;
                                 ttr_delta,  ;
                                 jbts  ;
                                 WITH  ;
                                 jbss /  ;
                                 sjcq
                    ENDIF
               ENDIF
          ENDIF
ENDCASE
SELECT xjjl_d
RETURN
ENDPROC
**
