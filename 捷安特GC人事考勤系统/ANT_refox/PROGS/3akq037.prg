DO prginit
IF  .NOT. pub_escape
     DO fenxi1
     DO fenxi2
     DO fenxi3
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
pub_escape = .F.
sqlexe_run(00000000041, SYS(16),  ;
          "select * from kq_xjjl_s",  ;
          "xjjl_s")
sqlexe_run(00000000043, SYS(16),  ;
          "select * from kq_xjjl_j",  ;
          "xjjl_j")
SELECT xjjl_j
INDEX ON STR(mm, 2) + STR(dd, 2)  ;
      TO xjjl_j
SELECT xjjl_d
SET FILTER TO
INDEX ON zgbh + riqi TO xjjl_d
SELECT clfx
INDEX ON zgbh + riqi TO clfx
SET RELATION TO bc INTO time
GOTO TOP
SET ESCAPE ON
SET EXACT ON
ON ESCAPE DO P_ESC
RETURN
ENDPROC
**
PROCEDURE prgterm
RELEASE delta0
SET ESCAPE OFF
SET EXACT OFF
RETURN
ENDPROC
**
PROCEDURE fenxi1
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
     i = pub_kaishiriqi
     j = .T.
     SELECT clfx
     SEEK zg.zgbh 
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
                       DTOC(i),  ;
                       zdcl WITH  ;
                       51
          ENDIF
          IF CTOD(riqi) <= i
               mdate = CTOD(riqi)
               DO WHILE  .NOT.  ;
                  EOF() .AND.  ;
                  zgbh=zg.zgbh  ;
                  .AND. mdate= ;
                  CTOD(riqi)  ;
                  .AND.  .NOT.  ;
                  pub_escape
                    SKIP
               ENDDO
               IF  .NOT. EOF()  ;
                   .AND. zgbh <>  ;
                   zg.zgbh
                    SKIP -1
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
           "第二趟扫描..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF mark > 0
          LOOP
     ENDIF
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mkqlb = IIF(rgcl > 0, rgcl,  ;
             zdcl)
     SELECT xjjl_d
     SET EXACT OFF
     SEEK clfx.zgbh + clfx.riqi 
     SET EXACT ON
     DO WHILE  .NOT. EOF() .AND.  ;
        zgbh=clfx.zgbh .AND. riqi= ;
        clfx.riqi .AND.  .NOT.  ;
        pub_escape
          IF mark > 0
               SKIP
               LOOP
          ENDIF
          REPLACE mark WITH 1
          msw = .T.
          DO CASE
               CASE kqlb > 0  ;
                    .AND. kqlb <  ;
                    31
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
                         mflag = .T.
                         APPEND BLANK
                         REPLACE zgbh  ;
                                 WITH  ;
                                 mzgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 DTOC(mdate),  ;
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
                    IF mflag .OR.  ;
                       clfx.cqss >  ;
                       0
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 clfx.cqss -  ;
                                 ss,  ;
                                 clfx.cqts  ;
                                 WITH  ;
                                 clfx.cqts -  ;
                                 ts
                    ENDIF
                    IF clfx.cqss =  ;
                       0 .OR.  ;
                       clfx.cqts =  ;
                       0
                         REPLACE clfx.cqss  ;
                                 WITH  ;
                                 0,  ;
                                 clfx.cqts  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF EMPTY(bc)  ;
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
                    ENDIF
               CASE kqlb = 92
                    IF  .NOT.  ;
                        EMPTY(clfx.bc)  ;
                        .AND.   ;
                        .NOT.  ;
                        EMPTY(bc)  ;
                        .AND.  ;
                        clfx.bc <>  ;
                        bc
                         SELECT clfx
                         APPEND BLANK
                         REPLACE zgbh  ;
                                 WITH  ;
                                 mzgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 DTOC(mdate),  ;
                                 mark  ;
                                 WITH  ;
                                 1
                         SELECT xjjl_d
                    ENDIF
                    IF clfx.sbsj =  ;
                       0 .AND.  ;
                       clfx.xbsj =  ;
                       0
                         REPLACE clfx.sbsj  ;
                                 WITH  ;
                                 kssj,  ;
                                 clfx.xbsj  ;
                                 WITH  ;
                                 jssj
                    ENDIF
                    REPLACE clfx.jbss  ;
                            WITH  ;
                            clfx.jbss +  ;
                            ss,  ;
                            clfx.jbts  ;
                            WITH  ;
                            clfx.jbts +  ;
                            ts
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
                         IF clfx.sbsj =  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsj =  ;
                            0
                              REPLACE  ;
                               clfx.sbsj  ;
                               WITH  ;
                               time.sbsj,  ;
                               clfx.xbsj  ;
                               WITH  ;
                               time.xbsj
                         ENDIF
                    ENDIF
                    IF clfx.zdcl =  ;
                       1 .OR.  ;
                       clfx.zdcl =  ;
                       15
                         REPLACE clfx.zdcl  ;
                                 WITH  ;
                                 0
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 0,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF clfx.rgcl =  ;
                       1 .OR.  ;
                       clfx.rgcl =  ;
                       15
                         REPLACE clfx.rgcl  ;
                                 WITH  ;
                                 0
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 0,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 0
                    ENDIF
               CASE kqlb >= 93  ;
                    .AND. kqlb <=  ;
                    94
                    IF clfx.jbss >  ;
                       0 .AND.  ;
                       (kqlb <>  ;
                       IIF(clfx.rgcl >  ;
                       0,  ;
                       clfx.rgcl,  ;
                       clfx.zdcl)  ;
                       .OR.  ;
                       (clfx.bc <>  ;
                       bc .AND.   ;
                       .NOT.  ;
                       EMPTY(clfx.bc)  ;
                       .AND.   ;
                       .NOT.  ;
                       EMPTY(bc)))
                         SELECT clfx
                         APPEND BLANK
                         REPLACE zgbh  ;
                                 WITH  ;
                                 mzgbh,  ;
                                 riqi  ;
                                 WITH  ;
                                 DTOC(mdate),  ;
                                 mark  ;
                                 WITH  ;
                                 1
                         SELECT xjjl_d
                    ENDIF
                    IF clfx.sbsj =  ;
                       0 .AND.  ;
                       clfx.xbsj =  ;
                       0
                         REPLACE clfx.sbsj  ;
                                 WITH  ;
                                 kssj,  ;
                                 clfx.xbsj  ;
                                 WITH  ;
                                 jssj
                    ENDIF
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
                         IF clfx.sbsj =  ;
                            0  ;
                            .AND.  ;
                            clfx.xbsj =  ;
                            0
                              REPLACE  ;
                               clfx.sbsj  ;
                               WITH  ;
                               time.sbsj,  ;
                               clfx.xbsj  ;
                               WITH  ;
                               time.xbsj
                         ENDIF
                    ENDIF
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            0,  ;
                            clfx.cqts  ;
                            WITH  ;
                            0
                    REPLACE clfx.jbss  ;
                            WITH  ;
                            clfx.jbss +  ;
                            ss,  ;
                            clfx.jbts  ;
                            WITH  ;
                            clfx.jbts +  ;
                            ts,  ;
                            clfx.kgss  ;
                            WITH  ;
                            0,  ;
                            clfx.kgts  ;
                            WITH  ;
                            0
                    REPLACE clfx.jbattr  ;
                            WITH  ;
                            jbattr
                    IF clfx.zdcl =  ;
                       1 .OR.  ;
                       clfx.zdcl =  ;
                       15
                         REPLACE clfx.zdcl  ;
                                 WITH  ;
                                 0
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 0,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF clfx.rgcl =  ;
                       1 .OR.  ;
                       clfx.rgcl =  ;
                       15
                         REPLACE clfx.rgcl  ;
                                 WITH  ;
                                 0
                         REPLACE clfx.qjss  ;
                                 WITH  ;
                                 0,  ;
                                 clfx.qjts  ;
                                 WITH  ;
                                 0
                    ENDIF
               CASE kqlb = 80
                    REPLACE clfx.cdss  ;
                            WITH  ;
                            clfx.cdss +  ;
                            ss
               CASE kqlb = 81  ;
                    .OR. kqlb =  ;
                    82
                    REPLACE clfx.ztss  ;
                            WITH  ;
                            clfx.ztss +  ;
                            ss
               CASE kqlb = 85
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
                    APPEND BLANK
                    REPLACE zgbh  ;
                            WITH  ;
                            mzgbh,  ;
                            riqi  ;
                            WITH  ;
                            DTOC(mdate),  ;
                            mark  ;
                            WITH  ;
                            1
                    REPLACE sbsk  ;
                            WITH  ;
                            xjjl_d.kssj,  ;
                            xbsk  ;
                            WITH  ;
                            xjjl_d.jssj
                    REPLACE cqss  ;
                            WITH  ;
                            xjjl_d.ss,  ;
                            cqts  ;
                            WITH  ;
                            xjjl_d.ts,  ;
                            rgcl  ;
                            WITH  ;
                            97
                    IF  .NOT.  ;
                        EMPTY(xjjl_d.bc)
                         REPLACE bc  ;
                                 WITH  ;
                                 xjjl_d.bc
                         SELECT time
                         SEEK xjjl_d.bc 
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb,  ;
                                 clfx.sbsj  ;
                                 WITH  ;
                                 sbsj,  ;
                                 clfx.xbsj  ;
                                 WITH  ;
                                 xbsj
                    ENDIF
                    SELECT xjjl_d
               CASE kqlb = 98
                    REPLACE clfx.cqss  ;
                            WITH  ;
                            ss,  ;
                            clfx.cqts  ;
                            WITH  ;
                            ts
                    IF  .NOT.  ;
                        EMPTY(bc)  ;
                        .AND.  ;
                        EMPTY(clfx.bc)
                         REPLACE clfx.bc  ;
                                 WITH  ;
                                 bc
                         SELECT time
                         SEEK clfx.bc 
                         REPLACE clfx.lb  ;
                                 WITH  ;
                                 time.lb
                         SELECT xjjl_d
                    ENDIF
               OTHERWISE
                    REPLACE mark  ;
                            WITH  ;
                            0
                    msw = .F.
          ENDCASE
          IF clfx.rgcl <> kqlb  ;
             .AND. msw
               IF clfx.rgcl > 0
                    REPLACE clfx.zdcl  ;
                            WITH  ;
                            clfx.rgcl
               ENDIF
               REPLACE clfx.rgcl  ;
                       WITH kqlb
          ENDIF
          SKIP
     ENDDO
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
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
           "第三趟扫描..." + zgbh +  ;
           " " + riqi
     ENDIF
     IF zdcl > 0 .OR. rgcl > 0
          LOOP
     ENDIF
     SELECT xjjl_j
     SEEK STR(MONTH(CTOD(clfx.riqi)),  ;
          2) +  ;
          STR(DAY(CTOD(clfx.riqi)),  ;
          2) 
     IF FOUND()
          REPLACE clfx.zdcl WITH  ;
                  15, clfx.qjss  ;
                  WITH sjcq,  ;
                  clfx.qjts WITH  ;
                  1
          SELECT clfx
          LOOP
     ENDIF
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
**
