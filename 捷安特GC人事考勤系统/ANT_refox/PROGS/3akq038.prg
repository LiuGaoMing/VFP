DO prginit
DO preprocess
IF pub_language
     obj_form4.txt_msg.value = "Be processing the time records,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在处理考勤刷卡数据，请等待..."
ENDIF
SELECT clfx
INDEX ON zgbh + riqi + STR(sbsj,  ;
      4) TAG zgbh_d_t
SCAN
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF clfx.mark = 1
          LOOP
     ENDIF
     DO getbctab
     DO getsktab
     IF sktabcnt > 0
          DO skproc
          DO setmark
     ELSE
          SELECT clfx
          IF rgcl = 0 .AND. zdcl =  ;
             98
               REPLACE zdcl WITH  ;
                       0, cqss  ;
                       WITH 0,  ;
                       cqts WITH  ;
                       0, cdss  ;
                       WITH 0,  ;
                       ztss WITH  ;
                       0
          ENDIF
     ENDIF
     IF pub_escape
          EXIT
     ENDIF
     SELECT clfx
ENDSCAN
DO savecl2
DO jjrjb
DO fenxi7
mserver = getantenv("SERVER",  ;
          "ANT2000")
mp = mserver +  ;
     "function\kqfx_add.fxp"
IF FILE(mp)
     do &mp
ENDIF
DO prgterm
RETURN
ENDPROC
**
PROCEDURE PrgInit
PUBLIC njbflag
njbflag = getantenv("FXPARA",  ;
          "NJBFLAG")
IF pub_language
     obj_form4.txt_msg.value = "Be loading the datas,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在加载考勤关联资料，请等待..."
ENDIF
PUBLIC sktabbou, sktabcnt,  ;
       sktabptrs, sktabptrx, itwo,  ;
       bctabbou, bctabcnt,  ;
       bctabsel, currentbc
sktabbou = 10
bctabbou = 30
currentbc = '@@@'
PUBLIC bctabbh(bctabbou),  ;
       bctablb(bctabbou),  ;
       bctabsb(bctabbou),  ;
       bctabxb(bctabbou),  ;
       bctabss(bctabbou),  ;
       bctabts(bctabbou)
PUBLIC sktab(sktabbou),  ;
       bztab(sktabbou)
PUBLIC delta0, delta2, delta3,  ;
       delta4, delta8, delta9,  ;
       delta9max, wtsb1, wtxb1,  ;
       wtsb2, wtxb2
pub_escape = .F.
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
delta8 = 120
delta9 = 0.3 
delta9max = 120
SET EXACT OFF
SET ESCAPE ON
ON ESCAPE DO P_ESC		
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
      STR(shijian, 4) TAG  ;
      zgbh_d_t
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
             CTOD(riqi) - 1 .AND.  ;
             ABS(1440 + shijian -  ;
             mt) <= sjcfsj
               sqlexe_run((00000000132),  ;
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
          sqlexe_run((00000000140),  ;
                    SYS(16),  ;
                    "DELETE FROM KQ_ARDATA WHERE ID=?ID",  ;
                    "")
          DELETE
     ENDIF
     SKIP
ENDDO
SELECT xjjl_d
SET FILTER TO kqlb = 75;
.OR. kqlb = 76;
.OR. kqlb = 41
SCAN
     SELECT ardata_
     DO CASE
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
               SEEK xjjl_d.zgbh +  ;
                    xjjl_d.riqi 
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
SET FILTER TO
SELECT ardata_
SET FILTER TO mark < 8
SET RELATION TO zgbh INTO zg
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
ENDSCAN
RETURN
ENDPROC
**
PROCEDURE GetSkTab
itwo = 0
sktabcnt = 0
SELECT ardata_
SEEK clfx.zgbh + clfx.riqi 
DO WHILE sktabcnt<sktabbou .AND.   ;
   .NOT. EOF() .AND. clfx.zgbh= ;
   zgbh .AND. clfx.riqi=riqi
     IF mark > 0
          SKIP
          LOOP
     ENDIF
     sktabcnt = sktabcnt + 1
     sktab(sktabcnt) = shijian
     bztab(sktabcnt) = 9
     SKIP
ENDDO
DO WHILE sktabcnt<sktabbou .AND.   ;
   .NOT. EOF() .AND. clfx.zgbh= ;
   zgbh .AND. CTOD(clfx.riqi)= ;
   CTOD(riqi)-1
     sktabcnt = sktabcnt + 1
     IF itwo = 0 .AND. shijian >  ;
        delta0
          itwo = sktabcnt
     ENDIF
     sktab(sktabcnt) = shijian +  ;
          1440
     bztab(sktabcnt) = 9
     SKIP
ENDDO
IF itwo = 1
     sktabcnt = 0
ENDIF
RETURN
ENDPROC
**
PROCEDURE SkProc
SELECT clfx
IF  .NOT. EMPTY(clfx.bc) .OR.  ;
    (clfx.sbsj > 0 .AND.  ;
    clfx.xbsj > 0)
     IF clfx.zdcl > 90 .OR.  ;
        (clfx.zdcl = 0 .AND.  ;
        clfx.rgcl > 90)
          msbsj = clfx.sbsj
          mxbsj = IIF(clfx.xbsj <=  ;
                  clfx.sbsj, 1440 +  ;
                  clfx.xbsj,  ;
                  clfx.xbsj)
          sktabptrs = 1
          FOR i = 2 TO sktabcnt
               DO CASE
                    CASE sktab(sktabptrs) <=  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(i) <=  ;
                         msbsj  ;
                         .AND. i <  ;
                         itwo
                         sktabptrs =  ;
                          i
                    CASE sktab(sktabptrs) <=  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(i) >=  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(i) <  ;
                         mxbsj  ;
                         .AND. i <  ;
                         itwo
                         IF msbsj -  ;
                            sktab(sktabptrs) >  ;
                            sktab(i) -  ;
                            msbsj
                              sktabptrs =  ;
                               i
                         ENDIF
                    OTHERWISE
               ENDCASE
          ENDFOR
          sktabptrx = sktabcnt
          FOR i = sktabcnt - 1 TO  ;
              sktabptrs + 1 STEP - ;
              1
               DO CASE
                    CASE sktab(i) >=  ;
                         mxbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) >=  ;
                         mxbsj
                         sktabptrx =  ;
                          i
                    CASE sktab(i) <=  ;
                         mxbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) >=  ;
                         mxbsj
                         IF sktab(sktabptrx) -  ;
                            mxbsj >  ;
                            mxbsj -  ;
                            sktab(i)
                              sktabptrx =  ;
                               i
                         ENDIF
                    OTHERWISE
               ENDCASE
          ENDFOR
          IF sbsj > 0 .AND. xbsj >  ;
             0
               mzgbh = zgbh
               mriqi = riqi
               mrec = RECNO()
               msbsj = sbsj
               mxbsj = IIF(xbsj <  ;
                       sbsj, 1440 +  ;
                       xbsj,  ;
                       xbsj)
               IF msbsj -  ;
                  sktab(sktabptrs) >  ;
                  240
                    DO WHILE   ;
                       .NOT.  ;
                       BOF()  ;
                       .AND.  ;
                       mzgbh=zgbh  ;
                       .AND.  ;
                       mriqi= ;
                       riqi
                         SKIP -1
                         IF  .NOT.  ;
                             BOF()  ;
                             .AND.  ;
                             mzgbh =  ;
                             zgbh  ;
                             .AND.  ;
                             mriqi =  ;
                             riqi  ;
                             .AND.  ;
                             rgcl =  ;
                             97
                              sktab(sktabptrs) =  ;
                               msbsj
                              EXIT
                         ENDIF
                    ENDDO
                    GOTO mrec
               ELSE
                    IF sktab(sktabptrx) -  ;
                       mxbsj >  ;
                       240
                         DO WHILE   ;
                            .NOT.  ;
                            EOF()  ;
                            .AND.  ;
                            mzgbh= ;
                            zgbh  ;
                            .AND.  ;
                            mriqi= ;
                            riqi
                              SKIP
                              IF   ;
                               .NOT.  ;
                               EOF()  ;
                               .AND.  ;
                               mzgbh =  ;
                               zgbh  ;
                               .AND.  ;
                               mriqi =  ;
                               riqi  ;
                               .AND.  ;
                               rgcl =  ;
                               97
                                   sktab(sktabptrx) = mxbsj
                                   EXIT
                              ENDIF
                         ENDDO
                         GOTO mrec
                    ENDIF
               ENDIF
          ENDIF
          IF itwo > 0 .AND.  ;
             sktabptrs < itwo  ;
             .AND. sktabptrx >=  ;
             itwo
               msbsj = clfx.sbsj
               mxbsj = IIF(msbsj >  ;
                       clfx.xbsj,  ;
                       1440 +  ;
                       clfx.xbsj,  ;
                       clfx.xbsj)
               DO CASE
                    CASE (sktab(sktabptrs) <=  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) <=  ;
                         msbsj)  ;
                         .OR.  ;
                         (sktab(sktabptrs) >=  ;
                         mxbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) >=  ;
                         mxbsj)
                         mdup = 0
                    CASE sktab(sktabptrs) >  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(sktabptrs) <  ;
                         mxbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) >=  ;
                         mxbsj
                         IF clfx.qjss >  ;
                            0
                              mdup =  ;
                               (mxbsj -  ;
                               sktab(sktabptrs) +  ;
                               clfx.qjss) /  ;
                               (mxbsj -  ;
                               msbsj)
                         ELSE
                              mdup =  ;
                               (mxbsj -  ;
                               sktab(sktabptrs)) /  ;
                               (mxbsj -  ;
                               msbsj)
                         ENDIF
                    CASE sktab(sktabptrs) <=  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) >  ;
                         msbsj  ;
                         .AND.  ;
                         sktab(sktabptrx) <  ;
                         mxbsj
                         IF clfx.qjss >  ;
                            0
                              mdup =  ;
                               (sktab(sktabptrx) +  ;
                               clfx.qjss -  ;
                               msbsj) /  ;
                               (mxbsj -  ;
                               msbsj)
                         ELSE
                              mdup =  ;
                               (sktab(sktabptrx) -  ;
                               msbsj) /  ;
                               (mxbsj -  ;
                               msbsj)
                         ENDIF
                    OTHERWISE
                         IF (clfx.zdcl =  ;
                            92  ;
                            .OR.  ;
                            clfx.rgcl =  ;
                            92)  ;
                            .AND.  ;
                            (sktab(sktabptrx) -  ;
                            sktab(sktabptrs) -  ;
                            clfx.jbss) >  ;
                            clfx.cqss *  ;
                            2
                              mdup =  ;
                               0
                         ELSE
                              DO CASE
                                   CASE sktab(sktabptrs) > msbsj .AND. sktab(sktabptrs) < mxbsj .AND. sktab(sktabptrx) > msbsj .AND. sktab(sktabptrx) < mxbsj
                                        mdup = (sktab(sktabptrx) - sktab(sktabptrs)) / (mxbsj - msbsj)
                                   CASE sktab(sktabptrs) < msbsj .AND. sktab(sktabptrx) > mxbsj
                                        ksktabs = sktab(sktabptrs)
                                        ksktabx = sktab(sktabptrx)
                                        ksbsj = clfx.sbsj
                                        kxbsj = IIF(clfx.xbsj < clfx.sbsj, 1440 + clfx.xbsj, clfx.xbsj)
                                        SELECT xjjl_d
                                        SEEK clfx.zgbh + clfx.riqi 
                                        DO WHILE  .NOT. EOF() .AND. zgbh=clfx.zgbh .AND. riqi=clfx.riqi
                                             IF kqlb = 92
                                                  IF clfx.sbsj - ksktabs > ksktabx - clfx.xbsj
                                                       ksktabs = ksktabs + ss
                                                  ELSE
                                                       ksktabx = ksktabx - ss
                                                  ENDIF
                                             ENDIF
                                             SKIP
                                        ENDDO
                                        SELECT clfx
                                        IF ksktabx - ksktabs - sjcq > sjcq
                                             mdup = 0
                                        ELSE
                                             mdup = 1
                                        ENDIF
                                   OTHERWISE
                                        mdup = 1
                              ENDCASE
                         ENDIF
               ENDCASE
          ELSE
               mdup = 1
          ENDIF
          DO CASE
               CASE sktabptrx >  ;
                    sktabptrs  ;
                    .AND. (itwo =  ;
                    0 .OR.  ;
                    (sktabptrs <  ;
                    itwo .AND.  ;
                    sktabptrx <  ;
                    itwo) .OR.  ;
                    mdup > 0.6 )
                    bztab(sktabptrs) =  ;
                         1
                    bztab(sktabptrx) =  ;
                         1
                    DO appetwosk
                    FOR i =  ;
                        sktabptrs +  ;
                        1 TO  ;
                        sktabptrx -  ;
                        1
                         bztab(i) =  ;
                              2
                    ENDFOR
                    DO writeztwc
                    FOR i = 1 TO  ;
                        sktabptrs -  ;
                        1
                         bztab(i) =  ;
                              3
                    ENDFOR
                    IF itwo > 0
                         FOR i =  ;
                             sktabptrx +  ;
                             1 TO  ;
                             itwo -  ;
                             1
                              bztab(i) =  ;
                               3
                         ENDFOR
                    ELSE
                         FOR i =  ;
                             sktabptrx +  ;
                             1 TO  ;
                             sktabcnt
                              bztab(i) =  ;
                               3
                         ENDFOR
                    ENDIF
               OTHERWISE
                    IF itwo > 0
                         FOR i =  ;
                             1 TO  ;
                             itwo -  ;
                             1
                              bztab(i) =  ;
                               3
                         ENDFOR
                    ELSE
                         FOR i =  ;
                             1 TO  ;
                             sktabcnt
                              bztab(i) =  ;
                               3
                         ENDFOR
                    ENDIF
          ENDCASE
     ELSE
          IF itwo > 0
               FOR i = 1 TO itwo -  ;
                   1
                    bztab(i) = 3
               ENDFOR
          ELSE
               FOR i = 1 TO  ;
                   sktabcnt
                    bztab(i) = 3
               ENDFOR
          ENDIF
     ENDIF
ELSE
     IF itwo > 0
          mcnt = itwo
          SKIP
          IF  .NOT. EOF() .AND.  ;
              sbsj > 0 .AND. xbsj >  ;
              0
               msbsj = 1440 +  ;
                       sbsj
               IF ABS(msbsj -  ;
                  sktab(itwo)) <  ;
                  120
                    mcnt = itwo
               ENDIF
          ENDIF
          SKIP -1
          FOR i = 1 TO mcnt
               bztab(i) = 3
          ENDFOR
     ELSE
          FOR i = 1 TO sktabcnt
               bztab(i) = 3
          ENDFOR
     ENDIF
ENDIF
RETURN
ENDPROC
**
PROCEDURE AppeTwoSk
SELECT clfx
REPLACE sbsk WITH  ;
        IIF(sktab(sktabptrs) <=  ;
        1440, sktab(sktabptrs),  ;
        sktab(sktabptrs) - 1440),  ;
        xbsk WITH  ;
        IIF(sktab(sktabptrx) <=  ;
        1440, sktab(sktabptrx),  ;
        sktab(sktabptrx) - 1440)
DO writecdzt
IF cdss >= sjcd3 .OR. ztss >=  ;
   sjzt3
     mtime1 = sbsk
     mtime2 = IIF(sbsk > xbsk,  ;
              1440 + xbsk, xbsk)
     IF trybc(mtime1, mtime2) <  ;
        9999
          SELECT clfx
          IF bc <>  ;
             bctabbh(bctabsel)
               REPLACE bc WITH  ;
                       bctabbh(bctabsel),  ;
                       lb WITH  ;
                       bctablb(bctabsel)
               REPLACE cqss WITH  ;
                       bctabss(bctabsel),  ;
                       cqts WITH  ;
                       bctabts(bctabsel),  ;
                       sbsj WITH  ;
                       bctabsb(bctabsel),  ;
                       xbsj WITH  ;
                       bctabxb(bctabsel)
               REPLACE cdss WITH  ;
                       0, ztss  ;
                       WITH 0
               IF zdcl > 80 .AND.  ;
                  zdcl < 85
                    REPLACE zdcl  ;
                            WITH  ;
                            0
               ENDIF
               IF rgcl > 80 .AND.  ;
                  rgcl < 85
                    REPLACE rgcl  ;
                            WITH  ;
                            0
               ENDIF
               IF zdcl > 0 .AND.  ;
                  rgcl = 0
                    REPLACE rgcl  ;
                            WITH  ;
                            95
               ELSE
                    REPLACE zdcl  ;
                            WITH  ;
                            95
               ENDIF
               DO writecdzt
               IF cdss >= sjcd3  ;
                  .OR. ztss >=  ;
                  sjzt3
                    REPLACE kgss  ;
                            WITH  ;
                            cqss,  ;
                            kgts  ;
                            WITH  ;
                            cqts
                    REPLACE cqss  ;
                            WITH  ;
                            0,  ;
                            cqts  ;
                            WITH  ;
                            0,  ;
                            cdss  ;
                            WITH  ;
                            0,  ;
                            ztss  ;
                            WITH  ;
                            0
                    IF zdcl > 80  ;
                       .AND. zdcl <  ;
                       85
                         REPLACE zdcl  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF rgcl > 80  ;
                       .AND. rgcl <  ;
                       85
                         REPLACE rgcl  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF zdcl > 0  ;
                       .AND. rgcl =  ;
                       0
                         REPLACE rgcl  ;
                                 WITH  ;
                                 85
                    ELSE
                         REPLACE zdcl  ;
                                 WITH  ;
                                 85
                    ENDIF
               ENDIF
          ELSE
               REPLACE kgss WITH  ;
                       cqss, kgts  ;
                       WITH cqts
               REPLACE cqss WITH  ;
                       0, cqts  ;
                       WITH 0,  ;
                       cdss WITH  ;
                       0, ztss  ;
                       WITH 0
               IF zdcl > 80 .AND.  ;
                  zdcl < 85
                    REPLACE zdcl  ;
                            WITH  ;
                            0
               ENDIF
               IF rgcl > 80 .AND.  ;
                  rgcl < 85
                    REPLACE rgcl  ;
                            WITH  ;
                            0
               ENDIF
               IF zdcl > 0 .AND.  ;
                  rgcl = 0
                    REPLACE rgcl  ;
                            WITH  ;
                            85
               ELSE
                    REPLACE zdcl  ;
                            WITH  ;
                            85
               ENDIF
          ENDIF
     ENDIF
ENDIF
RETURN
ENDPROC
**
PROCEDURE WriteCdZt
IF (zdcl > 92 .AND. zdcl < 95)  ;
   .OR. (rgcl > 92 .AND. rgcl <  ;
   95) .OR. rgcl = 98 .OR. planbc =  ;
   '*'
     RETURN
ENDIF
msbsj = sbsj
mxbsj = IIF(sbsj > xbsj, 1440 +  ;
        xbsj, xbsj)
IF mxbsj >= 1440 .AND. sbsk <  ;
   delta0
     msbsk = sbsk + 1440
ELSE
     msbsk = sbsk
ENDIF
mxbsk = IIF(msbsk > xbsk, 1440 +  ;
        xbsk, xbsk)
mcd = msbsk - msbsj
mzt = mxbsj - mxbsk
IF mcd > sjcd1 .OR. mzt > sjzt1
     mk = 0
     IF qjss > 0
          IF mcd > sjcd1
               mk = mk +  ;
                    IIF(sjcd2 > 1,  ;
                    sjcd2 *  ;
                    (INT(mcd /  ;
                    sjcd2) + 1),  ;
                    mcd)
          ENDIF
          IF mzt > sjzt1
               mk = mk +  ;
                    IIF(sjzt2 > 1,  ;
                    sjzt2 *  ;
                    (INT(mzt /  ;
                    sjzt2) + 1),  ;
                    mzt)
          ENDIF
          mk = mk / qjss
     ENDIF
     IF mk < 0.5  .OR. mk > 1.5 
          IF mcd > sjcd1
               IF  .NOT.  ;
                   chkqingjia(0)
                    REPLACE cdss  ;
                            WITH  ;
                            IIF(sjcd2 >  ;
                            1,  ;
                            sjcd2 *  ;
                            (INT(mcd /  ;
                            sjcd2) +  ;
                            1),  ;
                            mcd)
                    IF zdcl > 95
                         REPLACE zdcl  ;
                                 WITH  ;
                                 80
                    ELSE
                         IF rgcl =  ;
                            0
                              REPLACE  ;
                               rgcl  ;
                               WITH  ;
                               80
                         ENDIF
                    ENDIF
               ENDIF
          ENDIF
          IF mzt > sjzt1
               IF  .NOT.  ;
                   chkqingjia(1)
                    REPLACE ztss  ;
                            WITH  ;
                            IIF(sjzt2 >  ;
                            1,  ;
                            sjzt2 *  ;
                            (INT(mzt /  ;
                            sjzt2) +  ;
                            1),  ;
                            mzt)
                    IF zdcl > 95
                         REPLACE zdcl  ;
                                 WITH  ;
                                 IIF(zdcl =  ;
                                 80,  ;
                                 82,  ;
                                 81)
                    ELSE
                         IF rgcl =  ;
                            0
                              REPLACE  ;
                               rgcl  ;
                               WITH  ;
                               IIF(zdcl =  ;
                               80,  ;
                               82,  ;
                               81)
                         ENDIF
                    ENDIF
               ENDIF
          ENDIF
     ENDIF
ENDIF
RETURN
ENDPROC
**
PROCEDURE WriteZtwc
IF sktabptrs >= sktabptrx
     RETURN
ENDIF
SELECT ztwc
APPEND BLANK
REPLACE zgbh WITH clfx.zgbh, riqi  ;
        WITH clfx.riqi, bc WITH  ;
        clfx.bc, sk1 WITH  ;
        IIF(sktab(sktabptrs + 1) <=  ;
        1440, sktab(sktabptrs +  ;
        1), sktab(sktabptrs + 1) -  ;
        1440)
FOR i = sktabptrs + 2 TO  ;
    sktabptrx - 1
     IF sk2 > 0
          APPEND BLANK
          REPLACE zgbh WITH  ;
                  clfx.zgbh, riqi  ;
                  WITH clfx.riqi,  ;
                  bc WITH clfx.bc,  ;
                  sk1 WITH  ;
                  IIF(sktab(i) <=  ;
                  1440, sktab(i),  ;
                  sktab(i) -  ;
                  1440)
     ELSE
          REPLACE sk2 WITH  ;
                  IIF(sktab(i) >=  ;
                  0, IIF(sktab(i) <=  ;
                  1440, sktab(i),  ;
                  sktab(i) -  ;
                  1440), 1440 +  ;
                  sktab(i))
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
RETURN
ENDPROC
**
PROCEDURE SetMark
j = sktabcnt
DO WHILE  .NOT. EOF() .AND. j>1
     IF bztab(j) = 1
          EXIT
     ENDIF
     j = j - 1
ENDDO
IF (itwo > 0 .AND. j + 1 < itwo)  ;
   .OR. (itwo = 0 .AND. j + 1 <=  ;
   sktabcnt)
     SELECT clfx
     mzgbh = zgbh
     mriqi = riqi
     SKIP
     IF zgbh = mzgbh .AND. mriqi =  ;
        riqi .AND.  .NOT.  ;
        EMPTY(bc) .AND. mark = 1
          sktabcnt = j
          REPLACE mark WITH 0
     ENDIF
     SKIP -1
ENDIF
SELECT ardata_
SEEK clfx.zgbh + clfx.riqi 
i = 1
DO WHILE  .NOT. EOF() .AND. i<= ;
   sktabcnt
     IF mark > 0
          SKIP
          LOOP
     ENDIF
     IF bztab(i) = 9 .OR. (itwo >  ;
        0 .AND. i >= itwo .AND.  ;
        bztab(i) = 3)
          EXIT
     ENDIF
     REPLACE mark WITH bztab(i)
     i = i + 1
     SKIP
ENDDO
RETURN
ENDPROC
**
PROCEDURE PrgTerm
IF  .NOT. pub_escape
     obj_form4.txt_msg1.value = ""
     obj_form4.txt_msg.value = "正在进行数据处理的结束工作，请等待..."
     SELECT ardata_
     COPY TO ardata
     USE ardata ALIAS ardata IN 0
     SELECT ardata
     INDEX ON zgbh + riqi +  ;
           STR(shijian, 4) TO  ;
           ARDATA
     SELECT ardata_
     SET RELATION TO zgbh + riqi + STR(shijian,;
4) INTO ardata
     GOTO TOP
     mpar = 0
     mmin = 0
     mzgbh = ""
     mdate = CTOD(riqi)
     mtime = shijian
     SCAN
          SELECT ardata
          IF mzgbh <>  ;
             ardata_.zgbh .OR.  ;
             CTOD(ardata_.riqi) -  ;
             mdate > 1
               mpar = 0
               mmin = 0
          ENDIF
          IF EOF()
               DO CASE
                    CASE ardata_.mark =  ;
                         2
                    CASE ardata_.mark =  ;
                         1 .AND.  ;
                         mpar =  ;
                         0
                         IF ardata_.shijian <  ;
                            delta0
                              mmin =  ;
                               1
                         ENDIF
                         mpar = mpar +  ;
                                1
                    OTHERWISE
                         mpar = 0
                         mmin = 0
               ENDCASE
          ELSE
               DO CASE
                    CASE ardata_.mark =  ;
                         2
                         REPLACE donedate  ;
                                 WITH  ;
                                 DTOC(CTOD(riqi) -  ;
                                 mmin)
                    CASE ardata_.mark =  ;
                         1 .AND.  ;
                         mpar =  ;
                         0
                         IF ardata_.shijian <  ;
                            delta0
                              mmin =  ;
                               1
                         ENDIF
                         REPLACE donedate  ;
                                 WITH  ;
                                 DTOC(CTOD(riqi) -  ;
                                 mmin)
                         mpar = mpar +  ;
                                1
                    CASE ardata_.mark =  ;
                         1 .AND.  ;
                         mpar =  ;
                         1
                         IF ardata_.shijian <  ;
                            mtime
                              mmin =  ;
                               1
                         ENDIF
                         REPLACE donedate  ;
                                 WITH  ;
                                 DTOC(CTOD(riqi) -  ;
                                 mmin)
                         mpar = 0
                         mmin = 0
                    OTHERWISE
                         IF  .NOT.  ;
                             EMPTY(ardata_.donedate)
                              REPLACE  ;
                               donedate  ;
                               WITH  ;
                               ardata_.donedate
                         ELSE
                              REPLACE  ;
                               donedate  ;
                               WITH  ;
                               riqi
                         ENDIF
                         mpar = 0
                         mmin = 0
               ENDCASE
          ENDIF
          SELECT ardata_
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mtime = shijian
     ENDSCAN
ENDIF
RELEASE bctabbou, bctabcnt,  ;
        bctabbh, bctablb, bctabsb,  ;
        bctabxb, bctabss, bctabts,  ;
        bctabsel, currentbc
RELEASE sktabbou, sktabcnt,  ;
        sktabptrs, sktabptrx,  ;
        itwo, sktab, bztab,  ;
        njbflag
RELEASE delta0, delta2, delta3,  ;
        delta4, delta8, delta9,  ;
        delta9max, wtsb1, wtxb1,  ;
        wtsb2, wtxb2
SELECT ardata_
USE
SET ESCAPE OFF
SET EXACT OFF
RETURN
ENDPROC
**
PROCEDURE SaveCl2
SELECT clfx
INDEX ON zgbh + riqi + STR(xbsj,  ;
      4) TO CLFX
SELECT ardata_
SET RELATION TO zgbh INTO zg
GOTO TOP
DO WHILE  .NOT. EOF()
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF mark = 3
          mflag = .F.
          mzgbh = zgbh
          mdate = CTOD(riqi)
          mtime1 = shijian
          bctabsel = 0
          mrec = RECNO()
          mdelta = 9999
          SELECT clfx
          SEEK mzgbh +  ;
               DTOC(mdate) 
          IF  .NOT. EOF() .AND.   ;
              .NOT. EMPTY(bc)  ;
              .AND.  ;
              ardata_.shijian >  ;
              delta0
               mbcflag = .T.
          ELSE
               mbcflag = .F.
          ENDIF
          SELECT ardata_
          SKIP
          k = 0
          DO WHILE  .NOT. EOF()  ;
             .AND. mzgbh=zgbh  ;
             .AND. (mdate= ;
             CTOD(riqi) .OR.  ;
             mdate+1=CTOD(riqi))  ;
             .AND. mark=3 .AND.   ;
             .NOT. mbcflag
               IF k > 0 .AND.  ;
                  EMPTY(clfx.bc)
                    EXIT
               ENDIF
               IF mdate =  ;
                  CTOD(riqi)
                    mtime2 = shijian
               ELSE
                    mtime2 = 1440 +  ;
                             shijian
               ENDIF
               k = k + 1
               mdelta2 = trybc(mtime1,  ;
                         mtime2)
               IF mdelta2 <  ;
                  mdelta
                    mbctabsel = bctabsel
                    mtime3 = mtime2
                    mdelta = mdelta2
                    mflag = .T.
                    mrec2 = RECNO()
               ENDIF
               SKIP
          ENDDO
          IF mflag
               bctabsel = mbctabsel
               IF mtime1 < delta0  ;
                  .AND. mflag
                    mdate = mdate -  ;
                            1
               ENDIF
               GOTO mrec2
               DO WHILE RECNO()<> ;
                  mrec
                    REPLACE donedate  ;
                            WITH  ;
                            DTOC(mdate)
                    IF RECNO() >  ;
                       mrec .AND.  ;
                       RECNO() <  ;
                       mrec2
                         REPLACE mark  ;
                                 WITH  ;
                                 2
                    ELSE
                         REPLACE mark  ;
                                 WITH  ;
                                 1
                    ENDIF
                    SKIP -1
               ENDDO
          ENDIF
          GOTO mrec
          SELECT clfx
          SEEK mzgbh +  ;
               DTOC(mdate) 
          IF  .NOT. FOUND() .OR.  ;
              (sbsk <> 0 .AND.  ;
              xbsk <> 0) .OR.  ;
              (mflag .AND. (sbsk <>  ;
              0 .OR. xbsk <> 0))
               APPEND BLANK
               REPLACE zgbh WITH  ;
                       ardata_.zgbh,  ;
                       riqi WITH  ;
                       DTOC(mdate)
          ENDIF
          DO CASE
               CASE  .NOT. mflag  ;
                     .AND. sbsk =  ;
                     0
                    REPLACE sbsk  ;
                            WITH  ;
                            mtime1
                    IF zdcl = 98
                         REPLACE zdcl  ;
                                 WITH  ;
                                 73
                         REPLACE cqss  ;
                                 WITH  ;
                                 0,  ;
                                 cqts  ;
                                 WITH  ;
                                 0
                    ENDIF
               CASE  .NOT. mflag  ;
                     .AND. xbsk =  ;
                     0
                    REPLACE xbsk  ;
                            WITH  ;
                            mtime1
                    IF zdcl = 98
                         REPLACE zdcl  ;
                                 WITH  ;
                                 73
                         REPLACE cqss  ;
                                 WITH  ;
                                 0,  ;
                                 cqts  ;
                                 WITH  ;
                                 0
                    ENDIF
               CASE bctabsel > 0
                    IF bc <>  ;
                       bctabbh(bctabsel)
                         IF EMPTY(bc)
                              REPLACE  ;
                               planbc  ;
                               WITH  ;
                               '*'
                         ELSE
                              REPLACE  ;
                               planbc  ;
                               WITH  ;
                               bc
                         ENDIF
                         IF rgcl =  ;
                            0  ;
                            .AND.  ;
                            planbc <>  ;
                            '*'
                              REPLACE  ;
                               zdcl  ;
                               WITH  ;
                               98
                              REPLACE  ;
                               cqss  ;
                               WITH  ;
                               bctabss(bctabsel),  ;
                               cqts  ;
                               WITH  ;
                               bctabts(bctabsel),  ;
                               qjss  ;
                               WITH  ;
                               0,  ;
                               qjts  ;
                               WITH  ;
                               0
                         ENDIF
                         REPLACE bc  ;
                                 WITH  ;
                                 bctabbh(bctabsel),  ;
                                 lb  ;
                                 WITH  ;
                                 bctablb(bctabsel)
                         REPLACE sbsk  ;
                                 WITH  ;
                                 mtime1,  ;
                                 xbsk  ;
                                 WITH  ;
                                 IIF(mtime3 >  ;
                                 1440,  ;
                                 mtime3 -  ;
                                 1440,  ;
                                 mtime3),  ;
                                 sbsj  ;
                                 WITH  ;
                                 bctabsb(bctabsel),  ;
                                 xbsj  ;
                                 WITH  ;
                                 bctabxb(bctabsel)
                    ELSE
                         IF rgcl =  ;
                            0
                              REPLACE  ;
                               cqss  ;
                               WITH  ;
                               bctabss(bctabsel),  ;
                               cqts  ;
                               WITH  ;
                               bctabts(bctabsel),  ;
                               qjss  ;
                               WITH  ;
                               0,  ;
                               qjts  ;
                               WITH  ;
                               0,  ;
                               zdcl  ;
                               WITH  ;
                               98
                         ENDIF
                         REPLACE bc  ;
                                 WITH  ;
                                 bctabbh(bctabsel),  ;
                                 lb  ;
                                 WITH  ;
                                 bctablb(bctabsel)
                         REPLACE sbsk  ;
                                 WITH  ;
                                 mtime1,  ;
                                 xbsk  ;
                                 WITH  ;
                                 IIF(mtime3 >  ;
                                 1440,  ;
                                 mtime3 -  ;
                                 1440,  ;
                                 mtime3),  ;
                                 sbsj  ;
                                 WITH  ;
                                 bctabsb(bctabsel),  ;
                                 xbsj  ;
                                 WITH  ;
                                 bctabxb(bctabsel)
                    ENDIF
                    DO writecdzt
          ENDCASE
     ENDIF
     SELECT ardata_
     SKIP
ENDDO
SELECT clfx
INDEX ON zgbh + riqi +  ;
      STR(IIF(sbsk > 0, sbsk,  ;
      xbsk), 4) TO CLFX
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
                       WITH t2
               IF zdcl = 98
                    REPLACE zdcl  ;
                            WITH  ;
                            73
                    REPLACE cqss  ;
                            WITH  ;
                            0,  ;
                            cqts  ;
                            WITH  ;
                            0
               ENDIF
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
        zg.mk = '7') .AND. zdcl <>  ;
        73 .AND. zdcl <> 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  jbss WITH 0
          REPLACE cqss WITH xbsk -  ;
                  sbsk
          IF zdcl >= 80 .AND.  ;
             zdcl <= 85
               REPLACE zdcl WITH  ;
                       98
          ENDIF
     ENDIF
     SKIP
ENDDO
IF t2 >= 0 .AND. EOF() .AND.  ;
   mtogether > 0
     GOTO rec
     REPLACE sbsk WITH t1, xbsk  ;
             WITH t2
     IF zdcl = 98
          REPLACE zdcl WITH 73
          REPLACE cqss WITH 0,  ;
                  cqts WITH 0
     ENDIF
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
        zg.mk = '7') .AND. zdcl <>  ;
        73 .AND. zdcl <> 0
          REPLACE cdss WITH 0,  ;
                  ztss WITH 0,  ;
                  kgss WITH 0,  ;
                  jbss WITH 0
          REPLACE cqss WITH xbsk -  ;
                  sbsk
          IF zdcl >= 80 .AND.  ;
             zdcl <= 85
               REPLACE zdcl WITH  ;
                       98
          ENDIF
     ENDIF
ENDIF
DIMENSION azgbh(3), mdate(3),  ;
          msk(3), mtime(3)
FOR i = 1 TO 3
     azgbh(i) = ""
     mdate(i) = CTOD("")
     msk(i) = 0
     mtime(i) = 0
ENDFOR
SELECT clfx
SCAN
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     IF (sbsk > 0 .AND. xbsk > 0)
          LOOP
     ENDIF
     IF sbsk = 0 .AND. xbsk = 0
          msbsj = sbsj
          mxbsj = IIF(sbsj > xbsj,  ;
                  1440 + xbsj,  ;
                  xbsj)
          mdate = CTOD(riqi)
          SKIP
          IF (mdate = CTOD(riqi) -  ;
             1) .AND. ((sbsk > 0  ;
             .AND. xbsk = 0) .OR.  ;
             (sbsk = 0 .AND. xbsk >  ;
             0))
               mshijian = 1440 +  ;
                          IIF(sbsk >  ;
                          0, sbsk,  ;
                          xbsk)
               IF mshijian -  ;
                  mxbsj < delta4 /  ;
                  2
                    REPLACE sbsk  ;
                            WITH  ;
                            0,  ;
                            xbsk  ;
                            WITH  ;
                            0
                    IF zdcl > 70  ;
                       .AND. zdcl <  ;
                       75
                         REPLACE zdcl  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF rgcl > 70  ;
                       .AND. rgcl <  ;
                       75
                         REPLACE rgcl  ;
                                 WITH  ;
                                 0
                    ENDIF
                    IF zdcl = 0  ;
                       .AND. rgcl =  ;
                       0 .AND.  ;
                       sbsj = 0  ;
                       .AND. xbsj =  ;
                       0
                         DELETE
                    ENDIF
                    SELECT ardata_
                    SEEK clfx.zgbh +  ;
                         clfx.riqi +  ;
                         STR(mshijian -  ;
                         1440, 4) 
                    IF  .NOT.  ;
                        EOF()
                         REPLACE donedate  ;
                                 WITH  ;
                                 DTOC(mdate)
                    ENDIF
                    SELECT clfx
                    SKIP -1
                    REPLACE xbsk  ;
                            WITH  ;
                            mshijian,  ;
                            cqss  ;
                            WITH  ;
                            0,  ;
                            cqts  ;
                            WITH  ;
                            0,  ;
                            zdcl  ;
                            WITH  ;
                            73
                    LOOP
               ELSE
                    SKIP -1
                    IF rgcl = 0  ;
                       .AND. zdcl =  ;
                       98
                         REPLACE cqss  ;
                                 WITH  ;
                                 0,  ;
                                 cqts  ;
                                 WITH  ;
                                 0,  ;
                                 zdcl  ;
                                 WITH  ;
                                 0
                    ENDIF
                    LOOP
               ENDIF
          ELSE
               SKIP -1
               IF rgcl = 0 .AND.  ;
                  zdcl = 98
                    REPLACE cqss  ;
                            WITH  ;
                            0,  ;
                            cqts  ;
                            WITH  ;
                            0,  ;
                            zdcl  ;
                            WITH  ;
                            0
               ENDIF
               LOOP
          ENDIF
     ENDIF
     mzgbh = zgbh
     mdate = CTOD(riqi)
     mkqlb1 = zdcl + rgcl
     msksj1 = IIF(sbsk > 0, sbsk,  ;
              xbsk)
     SKIP
     IF  .NOT. EOF() .AND. ((sbsk >  ;
         0 .AND. xbsk > 0) .OR.  ;
         (sbsk = 0 .AND. xbsk =  ;
         0))
          SKIP
          LOOP
     ENDIF
     mkqlb2 = zdcl + rgcl
     IF  .NOT. EOF() .AND. (mdate <>  ;
         CTOD(riqi) - 1 .OR.  ;
         (sbsk > 0 .AND. xbsk >  ;
         0))
          SKIP
          LOOP
     ENDIF
     IF mkqlb1 > 0
          msk2 = IIF(sbsk > 0,  ;
                 sbsk, xbsk)
          IF trybc(msksj1, 1440 +  ;
             msk2) = 9999
               LOOP
          ENDIF
          REPLACE sbsk WITH 0,  ;
                  xbsk WITH 0,  ;
                  cqss WITH 0,  ;
                  cqts WITH 0,  ;
                  zdcl WITH  ;
                  IIF(zdcl = 98,  ;
                  0, zdcl)
          SKIP -1
          IF xbsk > 0
               REPLACE sbsk WITH  ;
                       xbsk
          ENDIF
          REPLACE xbsk WITH msk2,  ;
                  zdcl WITH 0
          SKIP
          mzgbh = zgbh
          mriqi = riqi
          SKIP
          IF  .NOT. EOF()
               IF mzgbh = zgbh  ;
                  .AND. mriqi =  ;
                  riqi
                    SKIP -1
                    DELETE
               ELSE
                    SKIP -1
               ENDIF
          ELSE
               SKIP -1
          ENDIF
     ELSE
          msk2 = IIF(sbsk > 0,  ;
                 sbsk, xbsk)
          IF trybc(msksj1, 1440 +  ;
             msk2) = 9999
               LOOP
          ENDIF
          REPLACE xbsk WITH sbsk
          REPLACE sbsk WITH  ;
                  msksj1
          mrec = RECNO()
          SKIP -1
          mzgbh = zgbh
          mriqi = riqi
          IF  .NOT. BOF()
               SKIP -1
               IF  .NOT. BOF()
                    IF mzgbh =  ;
                       zgbh .AND.  ;
                       mriqi =  ;
                       riqi
                         SKIP
                         DELETE
                    ENDIF
               ENDIF
          ENDIF
          GOTO mrec
     ENDIF
     IF  .NOT. EOF()
          SKIP
     ENDIF
ENDSCAN
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
                       RGB(128,  ;
                       255, 128)
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
               CASE sbsk <= sbsj  ;
                    .AND. sbsj <=  ;
                    xbsj .AND.  ;
                    xbsj <= xbsk
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
               CASE sbsj <= sbsk  ;
                    .AND. sbsk <=  ;
                    xbsj .AND.  ;
                    xbsj <= xbsk
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
               CASE sbsk <= sbsj  ;
                    .AND. sbsj <=  ;
                    xbsk .AND.  ;
                    xbsk <= xbsj
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
               CASE sbsk >= sbsj  ;
                    .AND. sbsj <=  ;
                    xbsj .AND.  ;
                    xbsj <= xbsk  ;
                    .AND. sbsk >=  ;
                    xbsk
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
               CASE sbsj >= sbsk  ;
                    .AND. sbsk <=  ;
                    xbsj .AND.  ;
                    xbsj <= xbsk  ;
                    .AND. sbsj >=  ;
                    xbsj
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
               CASE sbsk >= sbsj  ;
                    .AND. sbsj <=  ;
                    xbsk .AND.  ;
                    xbsk <= xbsj  ;
                    .AND. sbsk >=  ;
                    xbsk
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
               CASE sbsk <= sbsj  ;
                    .AND. sbsj >=  ;
                    xbsj .AND.  ;
                    xbsj <= xbsk  ;
                    .AND. sbsk >=  ;
                    xbsk .AND.  ;
                    sbsj >= xbsj
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
               CASE sbsj <= sbsk  ;
                    .AND. sbsk >=  ;
                    xbsj .AND.  ;
                    xbsj <= xbsk  ;
                    .AND. sbsk >=  ;
                    xbsk .AND.  ;
                    sbsj >= xbsj
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
               CASE sbsk <= sbsj  ;
                    .AND. sbsj >=  ;
                    xbsk .AND.  ;
                    xbsk <= xbsj  ;
                    .AND. sbsk >=  ;
                    xbsk .AND.  ;
                    sbsj >= xbsj
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
               CASE sbsk <= sbsj  ;
                    .AND. sbsj <=  ;
                    xbsj .AND.  ;
                    xbsj >= xbsk  ;
                    .AND. sbsk >=  ;
                    xbsk
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
               CASE sbsj <= sbsk  ;
                    .AND. sbsk <=  ;
                    xbsj .AND.  ;
                    xbsj >= xbsk  ;
                    .AND. sbsj >=  ;
                    xbsj
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
               CASE sbsk <= sbsj  ;
                    .AND. sbsj <=  ;
                    xbsk .AND.  ;
                    xbsk >= xbsj  ;
                    .AND. sbsj >=  ;
                    xbsj
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
PROCEDURE jjrjb
SELECT clfx
SET RELATION TO zgbh INTO zg
SET RELATION ADDITIVE TO bc INTO time
SCAN FOR  .NOT. pub_escape
     IF pub_language
          obj_form4.txt_msg1.value =  ;
           "Overtime in holiday..." +  ;
           zgbh + " " + riqi
     ELSE
          obj_form4.txt_msg1.value =  ;
           "节假日、休日加班..." +  ;
           zgbh + " " + riqi
     ENDIF
     IF (zdcl = 0 .AND. rgcl > 92  ;
        .AND. rgcl < 95) .OR.  ;
        zdcl = 1 .OR. zdcl = 15
          REPLACE xrcolor WITH  ;
                  rgb_holiday
     ENDIF
     IF (zdcl >= 93 .AND. zdcl <=  ;
        94) .OR. (rgcl >= 93  ;
        .AND. rgcl <= 94)
          REPLACE planbc WITH ''
     ENDIF
     IF zg.zdjb < "1" .OR. zdcl =  ;
        93 .OR. zdcl = 94 .OR.  ;
        sbsk = 0 .OR. xbsk = 0  ;
        .OR. (zdcl <> 1 .AND.  ;
        zdcl <> 15)
          LOOP
     ENDIF
     IF zg.zdjb = "3" .OR.  ;
        zg.zdjb = "5" .OR.  ;
        zg.zdjb = "6" .OR.  ;
        zg.zdjb = "7"
          SELECT xjjl_j
          SEEK STR(MONTH(CTOD(clfx.riqi)),  ;
               2) +  ;
               STR(DAY(CTOD(clfx.riqi)),  ;
               2) 
          IF FOUND()
               SELECT clfx
               msbsk = sbsk
               mxbsk = IIF(sbsk >  ;
                       xbsk, 1440 +  ;
                       xbsk,  ;
                       xbsk)
               IF  .NOT.  ;
                   EMPTY(bc)
                    mzjks = time.zjks
                    mzjjs = IIF(time.zjks >  ;
                            time.zjjs,  ;
                            1440 +  ;
                            time.zjjs,  ;
                            time.zjjs)
                    DO CASE
                         CASE mzjks >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjks <=  ;
                              mxbsk  ;
                              .AND.  ;
                              mzjjs >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs <=  ;
                              mxbsk
                              mzjxx =  ;
                               time.zjxx
                         CASE mzjks <=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs >=  ;
                              mxbsk
                              mzjxx =  ;
                               mxbsk -  ;
                               msbsk
                         CASE mzjks <=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs <=  ;
                              mxbsk
                              mzjxx =  ;
                               mzjjs -  ;
                               msbsk
                         CASE mzjks >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjks <=  ;
                              mxbsk  ;
                              .AND.  ;
                              mzjjs >=  ;
                              mxbsk
                              mzjxx =  ;
                               mxbsk -  ;
                               mzjks
                         OTHERWISE
                              mzjxx =  ;
                               0
                    ENDCASE
                    mzjks1 = time.zjks1
                    mzjjs1 = IIF(time.zjks1 >  ;
                             time.zjjs1,  ;
                             1440 +  ;
                             time.zjjs1,  ;
                             time.zjjs1)
                    DO CASE
                         CASE mzjks1 >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjks1 <=  ;
                              mxbsk  ;
                              .AND.  ;
                              mzjjs1 >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs1 <=  ;
                              mxbsk
                              mzjxx1 =  ;
                               time.zjxx1
                         CASE mzjks1 <=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs1 >=  ;
                              mxbsk
                              mzjxx1 =  ;
                               mxbsk -  ;
                               msbsk
                         CASE mzjks1 <=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs1 >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjjs1 <=  ;
                              mxbsk
                              mzjxx1 =  ;
                               mzjjs1 -  ;
                               msbsk
                         CASE mzjks1 >=  ;
                              msbsk  ;
                              .AND.  ;
                              mzjks1 <=  ;
                              mxbsk  ;
                              .AND.  ;
                              mzjjs1 >=  ;
                              mxbsk
                              mzjxx1 =  ;
                               mxbsk -  ;
                               mzjks1
                         OTHERWISE
                              mzjxx1 =  ;
                               0
                    ENDCASE
                    REPLACE jbss  ;
                            WITH  ;
                            sjjb2 *  ;
                            INT((mxbsk -  ;
                            msbsk -  ;
                            mzjxx -  ;
                            mzjxx1) /  ;
                            sjjb2)
                    REPLACE jbts  ;
                            WITH  ;
                            IIF(jbss >  ;
                            0,  ;
                            cqts,  ;
                            0)
               ELSE
                    REPLACE jbss  ;
                            WITH  ;
                            sjjb2 *  ;
                            INT((mxbsk -  ;
                            msbsk) /  ;
                            sjjb2)
                    REPLACE jbts  ;
                            WITH  ;
                            jbss /  ;
                            sjcq
               ENDIF
               REPLACE cqss WITH  ;
                       0, cqts  ;
                       WITH 0,  ;
                       qjss WITH  ;
                       0, qjts  ;
                       WITH 0,  ;
                       cdss WITH  ;
                       0, ztss  ;
                       WITH 0,  ;
                       kgss WITH  ;
                       0, kgts  ;
                       WITH 0
               REPLACE rgcl WITH  ;
                       0
               REPLACE zdcl WITH  ;
                       94
               LOOP
          ENDIF
          SELECT clfx
     ENDIF
     msbsk = sbsk
     mxbsk = IIF(sbsk > xbsk,  ;
             1440 + xbsk, xbsk)
     IF  .NOT. EMPTY(bc)
          mzjks = time.zjks
          mzjjs = IIF(time.zjks >  ;
                  time.zjjs, 1440 +  ;
                  time.zjjs,  ;
                  time.zjjs)
          DO CASE
               CASE mzjks >=  ;
                    msbsk .AND.  ;
                    mzjks <=  ;
                    mxbsk .AND.  ;
                    mzjjs >=  ;
                    msbsk .AND.  ;
                    mzjjs <=  ;
                    mxbsk
                    mzjxx = time.zjxx
               CASE mzjks <=  ;
                    msbsk .AND.  ;
                    mzjjs >=  ;
                    mxbsk
                    mzjxx = mxbsk -  ;
                            msbsk
               CASE mzjks <=  ;
                    msbsk .AND.  ;
                    mzjjs >=  ;
                    msbsk .AND.  ;
                    mzjjs <=  ;
                    mxbsk
                    mzjxx = mzjjs -  ;
                            msbsk
               CASE mzjks >=  ;
                    msbsk .AND.  ;
                    mzjks <=  ;
                    mxbsk .AND.  ;
                    mzjjs >=  ;
                    mxbsk
                    mzjxx = mxbsk -  ;
                            mzjks
               OTHERWISE
                    mzjxx = 0
          ENDCASE
          mzjks1 = time.zjks1
          mzjjs1 = IIF(time.zjks1 >  ;
                   time.zjjs1,  ;
                   1440 +  ;
                   time.zjjs1,  ;
                   time.zjjs1)
          DO CASE
               CASE mzjks1 >=  ;
                    msbsk .AND.  ;
                    mzjks1 <=  ;
                    mxbsk .AND.  ;
                    mzjjs1 >=  ;
                    msbsk .AND.  ;
                    mzjjs1 <=  ;
                    mxbsk
                    mzjxx1 = time.zjxx1
               CASE mzjks1 <=  ;
                    msbsk .AND.  ;
                    mzjjs1 >=  ;
                    mxbsk
                    mzjxx1 = mxbsk -  ;
                             msbsk
               CASE mzjks1 <=  ;
                    msbsk .AND.  ;
                    mzjjs1 >=  ;
                    msbsk .AND.  ;
                    mzjjs1 <=  ;
                    mxbsk
                    mzjxx1 = mzjjs1 -  ;
                             msbsk
               CASE mzjks1 >=  ;
                    msbsk .AND.  ;
                    mzjks1 <=  ;
                    mxbsk .AND.  ;
                    mzjjs1 >=  ;
                    mxbsk
                    mzjxx1 = mxbsk -  ;
                             mzjks1
               OTHERWISE
                    mzjxx1 = 0
          ENDCASE
          REPLACE jbss WITH sjjb2 *  ;
                  INT((mxbsk -  ;
                  msbsk - mzjxx -  ;
                  mzjxx1) /  ;
                  sjjb2)
          REPLACE jbts WITH  ;
                  IIF(jbss > 0,  ;
                  cqts, 0)
     ELSE
          REPLACE jbss WITH sjjb2 *  ;
                  INT((mxbsk -  ;
                  msbsk) /  ;
                  sjjb2)
          REPLACE jbts WITH jbss /  ;
                  sjcq
     ENDIF
     REPLACE cqss WITH 0, cqts  ;
             WITH 0, qjss WITH 0,  ;
             qjts WITH 0, cdss  ;
             WITH 0, ztss WITH 0,  ;
             kgss WITH 0, kgts  ;
             WITH 0
     REPLACE rgcl WITH 0
     REPLACE zdcl WITH 93
     SELECT clfx
ENDSCAN
RETURN
ENDPROC
**
FUNCTION TryBc
PARAMETER t_sb, t_xb
bctabsel = 0
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
          CASE 1440 + t_sb >=  ;
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
          CASE 1440 + t_sb >=  ;
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
          bctabsel = x
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
PROCEDURE GetBcTab
IF clfx.bc = currentbc .AND.  ;
   currentbc <> '@@@'
     RETURN
ENDIF
IF  .NOT. EMPTY(clfx.bc) .AND.  ;
    (clfx.bc <> currentbc .OR.  ;
    EMPTY(currentbc))
     SELECT time
     SEEK clfx.bc 
     IF  .NOT. EOF()
          bctabcnt = 1
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
     ELSE
          bctabcnt = 0
     ENDIF
ELSE
     bctabcnt = 0
     SELECT time
     SCAN
          bctabcnt = bctabcnt + 1
          IF bctabcnt > bctabbou
               currentbc = clfx.bc
               RETURN
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
     ENDSCAN
ENDIF
currentbc = clfx.bc
RETURN
ENDPROC
**
FUNCTION ChkQingJia
LPARAMETERS direction
IF EMPTY(clfx.bc)
     RETURN .F.
ENDIF
cqj_ret = .F.
cqj_area = LTRIM(STR(SELECT()))
SELECT xjjl_d
SEEK clfx.zgbh + clfx.riqi 
DO WHILE  .NOT. EOF() .AND.  ;
   clfx.zgbh=zgbh .AND. clfx.riqi= ;
   riqi
     IF kqlb > 0 .AND. kqlb < 30
          IF direction = 0
               IF kssj > 0 .AND.  ;
                  clfx.sbsj > 0  ;
                  .AND. ABS(kssj -  ;
                  clfx.sbsj) <  ;
                  10
                    cqj_ret = .T.
                    EXIT
               ENDIF
          ELSE
               IF jssj > 0 .AND.  ;
                  clfx.xbsj > 0  ;
                  .AND. ABS(jssj -  ;
                  clfx.xbsj) <  ;
                  10
                    cqj_ret = .T.
                    EXIT
               ENDIF
          ENDIF
     ENDIF
     SKIP
ENDDO
select &cqj_area
RETURN cqj_ret
ENDFUNC
**
