**
FUNCTION GetCount
PARAMETER gc_type, gc_delta
IF gc_delta < 1
     RETURN -2
ENDIF
gc_area = STR(SELECT())
gc_repart = 0
DO WHILE .T.
     IF sqlexe_run(00000000018,  ;
        SYS(16),  ;
        "select * from sys_counter where xuhao=?gc_Type",  ;
        "counter") < 0
          gc_ret = -1
          EXIT
     ENDIF
     SELECT counter
     IF EOF()
          gc_ret = -1
          EXIT
     ENDIF
     gc_cnt0 = jishuqi
     IF  .NOT. EMPTY(flag)
          IF gc_repart < 3
               gc_repart = gc_repart +  ;
                           1
               LOOP
          ENDIF
          gc_repart = 0
          gc_j = MESSAGEBOX("其他用户正在保存该数据表。",  ;
                 0322,  ;
                 "考勤分析系统")
          DO CASE
               CASE gc_j = 4
                    LOOP
               CASE gc_j = 5
               OTHERWISE
                    gc_ret = -1
                    EXIT
          ENDCASE
     ENDIF
     IF sqlexe_run(00000000050,  ;
        SYS(16),  ;
        "update sys_counter set flag='1' where xuhao=?gc_Type",  ;
        "") < 0
          gc_ret = -1
          EXIT
     ENDIF
     IF sqlexe_run(00000000056,  ;
        SYS(16),  ;
        "select * from sys_counter where xuhao=?gc_Type",  ;
        "counter") < 0
          gc_ret = -1
          EXIT
     ENDIF
     SELECT counter
     gc_cnt1 = jishuqi
     IF gc_cnt0 <> gc_cnt1
          LOOP
     ENDIF
     gc_cnt1 = gc_cnt1 + gc_delta
     IF sqlexe_run(00000000069,  ;
        SYS(16),  ;
        "update sys_counter set jishuqi=?gc_Cnt1,flag=' ' where xuhao=?gc_Type",  ;
        "") < 0
          gc_ret = -1
          EXIT
     ENDIF
     gc_ret = gc_cnt0
     EXIT
ENDDO
select &gc_Area
RETURN gc_ret
ENDFUNC
**
