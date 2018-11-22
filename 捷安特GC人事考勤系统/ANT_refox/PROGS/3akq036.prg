DO prginit
SELECT pbb
SCAN
     obj_form4.txt_msg1.value = zgbh +  ;
                                ' ' +  ;
                                riqi
     SELECT clfx
     APPEND BLANK
     REPLACE zgbh WITH pbb.zgbh,  ;
             riqi WITH pbb.riqi,  ;
             bc WITH pbb.bc, lb  ;
             WITH time.lb, zdcl  ;
             WITH pbb.kqlb
     REPLACE sbsj WITH time.sbsj,  ;
             xbsj WITH time.xbsj
     DO CASE
          CASE pbb.kqlb >= 1  ;
               .AND. pbb.kqlb <=  ;
               30
               REPLACE qjss WITH  ;
                       sjcq, qjts  ;
                       WITH 1
          CASE pbb.kqlb >= 92  ;
               .AND. pbb.kqlb <=  ;
               94
               REPLACE jbss WITH  ;
                       time.ss,  ;
                       jbts WITH  ;
                       time.ts
          CASE pbb.kqlb = 98
               REPLACE cqss WITH  ;
                       time.ss,  ;
                       cqts WITH  ;
                       time.ts
     ENDCASE
     SELECT pbb
ENDSCAN
DO prgterm
RETURN
ENDPROC
**
PROCEDURE PrgInit
PUBLIC delta0
delta0 = getantenv("FXPARA",  ;
         "DELTA0")
IF pub_language
     obj_form4.txt_msg.value = "Be loading the datas,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在加载考勤关联资料，请等待..."
ENDIF
strsql = "SELECT * from kq_ZG WHERE " +  ;
         STRTRAN(str_bmbh, "@",  ;
         "BMBH") +  ;
         STRTRAN(pub_zgbh_filter,  ;
         "@", "kq_zg")
sqlexe_run(00000000054, SYS(16),  ;
          strsql, "zg")
SELECT zg
INDEX ON zgbh TO zg
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
sqlexe_run(00000000066, SYS(16),  ;
          strsql, "xjjl_d")
SELECT xjjl_d
INDEX ON zgbh + riqi TAG xjjl_d
sqlexe_run(00000000070, SYS(16),  ;
          "select * from kq_time",  ;
          "time")
SELECT time
INDEX ON bc TO time
SELECT pbb
SET RELATION TO bc INTO time
GOTO TOP
SET ESCAPE ON
ON ESCAPE DO P_ESC		
IF pub_language
     obj_form4.txt_msg.value = "Be processing the time records,please wait a minute..."
ELSE
     obj_form4.txt_msg.value = "正在处理考勤排班数据，请等待..."
ENDIF
RETURN
ENDPROC
**
PROCEDURE PrgTerm
SET ESCAPE OFF
SET EXACT OFF
RETURN
ENDPROC
**
