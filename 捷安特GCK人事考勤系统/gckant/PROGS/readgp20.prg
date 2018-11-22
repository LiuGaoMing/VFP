ardata_filename = getantenv("MACHINE",  ;
                  "KQ_SRCFILE")
ardatafile = FCREATE(ardata_filename)
IF ardatafile < 0
     MESSAGEBOX('无法创建考勤数据文件！')
     = FCLOSE(ardatafile)
     RETURN
ENDIF
strsql = "SELECT * from sb_ardata WHERE ReadFlag=0"
sqlexe_run(00000000012, SYS(16),  ;
          strsql, "SB_ARDATA")
SELECT sb_ardata
SCAN
     IF EMPTY(CTOT(riqi))
          LOOP
     ENDIF
     tmp_datatime = CTOT(riqi)
     tmp_month = PADL(ALLTRIM(STR(MONTH(tmp_datatime))),  ;
                 2, "0")
     tmp_day = PADL(ALLTRIM(STR(DAY(tmp_datatime))),  ;
               2, "0")
     tmp_hour = PADL(ALLTRIM(STR(HOUR(tmp_datatime))),  ;
                2, "0")
     tmp_minute = PADL(ALLTRIM(STR(MINUTE(tmp_datatime))),  ;
                  2, "0")
     strinfo = SPACE(1) +  ;
               PADL(ALLTRIM(arrid),  ;
               2, "0") + SPACE(5) +  ;
               ALLTRIM(cardno) +  ;
               SPACE(1) +  ;
               ALLTRIM(io) +  ;
               SPACE(6) +  ;
               tmp_month +  ;
               SPACE(1) + tmp_day +  ;
               SPACE(1) +  ;
               tmp_hour +  ;
               SPACE(1) +  ;
               tmp_minute
     = FPUTS(ardatafile, strinfo)
     strsql = "update sb_ardata set readflag=1 WHERE ReadFlag=0 and cardno=?cardno and riqi=?riqi"
     sqlexe_run(00000000027,  ;
               SYS(16), strsql,  ;
               "")
ENDSCAN
= FCLOSE(ardatafile)
USE
RETURN
ENDPROC
**
