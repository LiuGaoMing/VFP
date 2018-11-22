PARAMETER sl_loglevel,  ;
          sl_location,  ;
          sl_description
IF sl_loglevel < sysloglevel
     sl_description = STRTRAN(sl_description,  ;
                      "'", '"')
     log_sele = LTRIM(STR(SELECT()))
     sl_sql = "insert into sys_log (ID,CreateTime,LogLevel,Operator,Location,Description) values (?log_ID,'"
     sl_sql = sl_sql +  ;
              TTOC(DATETIME()) +  ;
              "',"
     sl_sql = sl_sql +  ;
              STR(sl_loglevel, 2) +  ;
              ",'"
     IF EMPTY(pub_user)
          sl_sql = sl_sql + "SYS" +  ;
                   " (" + SYS(0) +  ;
                   ")','"
     ELSE
          sl_sql = sl_sql +  ;
                   pub_user +  ;
                   " (" + SYS(0) +  ;
                   ")','"
     ENDIF
     sl_sql = sl_sql +  ;
              sl_location +  ;
              "','"
     sl_sql = sl_sql +  ;
              IIF(LEN(sl_description) >  ;
              127,  ;
              LEFT(sl_description,  ;
              127),  ;
              sl_description) +  ;
              "')"
     log_id = getcount(7, 1)
     IF log_id < 0
          RETURN
     ENDIF
     log_id = log_id + 1
     sqlexe_run(00000000032,  ;
               SYS(16), sl_sql,  ;
               "sys_log")
     select &log_sele
ENDIF
RETURN
ENDPROC
**
