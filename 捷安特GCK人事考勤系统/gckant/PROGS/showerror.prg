PARAMETER par_mode
DO CASE
     CASE par_mode == "gz"
          MESSAGEBOX("条件表达式错误。" +  ;
                    CHR(13) +  ;
                    MESSAGE(), 64,  ;
                    "人事管理系统")
     CASE par_mode == "gzrep"  ;
          .OR. par_mode ==  ;
          "kqrep"
          MESSAGEBOX("报表 [" +  ;
                    ALLTRIM(replist.name_c) +  ;
                    "] 计算公式错误。" +  ;
                    CHR(013) +  ;
                    MESSAGE(), 64,  ;
                    IIF(par_mode =  ;
                    "gzrep",  ;
                    "人事",  ;
                    "考勤") +  ;
                    "管理系统")
ENDCASE
RETURN TO MASTER 
ENDPROC
**
