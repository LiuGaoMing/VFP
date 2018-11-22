PARAMETER par_list, par_def,  ;
          par_mode,  ;
          par_issavemode,  ;
          par_reportid,  ;
          par_condition
evaluatehaserror = .F.
mserver = getantenv("SERVER",  ;
          "ANT2000")
IF ISNULL(mserver)
     mserver = ""
ENDIF
lib_name = ""
IF par_mode == "gzrep"
     lib_name = "gz"
ELSE
     lib_name = par_mode
ENDIF
IF FILE(mserver+"function\&lib_name.FuncsTest.fxp")
     SET PROCEDURE TO mserver+"function\&lib_name.FuncsTest.fxp"
ELSE
     msg = "找不到相关模拟函数库,无法进行公式检查。"
     IF par_issavemode
          msg = msg + CHR(13) +  ;
                "是否继续保存？"
     ELSE
          msg = msg + CHR(13) +  ;
                "是否继续执行？"
     ENDIF
     IF MESSAGEBOX(msg, 0308,  ;
        IIF(lib_name == "gz",  ;
        "薪资", "考勤") +  ;
        "管理系统") = 7
          pub_cancel = .T.
     ELSE
          pub_cancel = .F.
     ENDIF
     RETURN 101
ENDIF
sim_condition = ""
DO CASE
     CASE par_mode == "kq" .OR.  ;
          par_mode == "gzrep"
          reportid_fieldname = "xuhao"
          fieldid_fieldname = "seq"
          formula_fieldname = "condition"
          reportid_value = -1
          IF  .NOT.  ;
              EMPTY(par_reportid)
               reportid_value = par_reportid
               sim_condition = "for " +  ;
                               reportid_fieldname +  ;
                               "=" +  ;
                               ALLTRIM(STR(reportid_value))
          ENDIF
          fieldid_value = -1
     CASE par_mode == "gz"
          reportid_fieldname = "yglb"
          fieldid_fieldname = "xuhao"
          formula_fieldname = "cpu"
          reportid_value = ""
          IF  .NOT.  ;
              EMPTY(par_reportid)
               reportid_value = par_reportid
               sim_condition = "for AllTrim(lbbh)==Alltrim('" +  ;
                               reportid_value +  ;
                               "')"
          ENDIF
          fieldid_value = -1
ENDCASE
IF  .NOT. EMPTY(par_condition)
     IF EMPTY(sim_condition)
          sim_condition = "for " +  ;
                          par_condition
     ELSE
          sim_condition = sim_condition +  ;
                          " and " +  ;
                          par_condition
     ENDIF
ENDIF
IF par_mode == "gz"
     IF  .NOT.  ;
         tableisexist("gz_gz")
          msg = "薪资数据表GZ_GZ尚未创建,无法进行公式检查。"
          IF par_issavemode
               msg = msg +  ;
                     CHR(13) +  ;
                     "是否继续保存？"
               IF MESSAGEBOX(msg,  ;
                  0308,  ;
                  "公式检查") =  ;
                  7
                    pub_cancel = .T.
               ELSE
                    pub_cancel = .F.
               ENDIF
          ELSE
               MESSAGEBOX(msg,  ;
                         0048,  ;
                         "公式检查")
          ENDIF
          SET PROCEDURE TO
          RETURN 102
     ENDIF
     SQLCOLUMNS(odbc_ant2000,  ;
               'GZ_GZ', 'FOXPRO',  ;
               'ColDef')
     CREATE CURSOR CheckCursor  ;
            (fieldnum I,  ;
            fieldtitle C (30),  ;
            fieldtype C (1),  ;
            fieldwidth I,  ;
            fieldprec I,  ;
            modifyflag I,  ;
            isdeleted L)
     SELECT gzbase
     SCAN FOR  .NOT. DELETED()
          INSERT INTO CheckCursor  ;
                 VALUES  ;
                 (gzbase.xuhao,  ;
                 gzbase.term,  ;
                 gzbase.typ,  ;
                 gzbase.kuandu,  ;
                 gzbase.xiaoshu,  ;
                 IIF(par_issavemode,  ;
                 gzbase.modifyflag,  ;
                 16777215),  ;
                 IIF(par_issavemode,  ;
                 DELETED("gzbase"),  ;
                 .F.))
     ENDSCAN
     CREATE CURSOR ResultCursor  ;
            (rownum I, fieldnum I,  ;
            fieldtitle C (30),  ;
            fieldtype C (1),  ;
            fieldwidth I,  ;
            fieldprec I, detail C  ;
            (60), modifyflag I,  ;
            flag I)
     hasdiff = checktableex("CheckCursor",  ;
               "ColDef",  ;
               "ResultCursor")
     SELECT checkcursor
     USE
     SELECT coldef
     USE
     IF hasdiff = 1
          SELECT TOP 1 fieldtitle,  ;
                 detail FROM  ;
                 ResultCursor  ;
                 WHERE flag <> 0  ;
                 ORDER BY  ;
                 fieldnum INTO  ;
                 CURSOR tmpDiff
          SELECT resultcursor
          USE
          msg = "薪资数据表GZ_GZ与项目定义表GZ_GZBASE不一致，" +  ;
                CHR(13) +  ;
                "项目 [" +  ;
                ALLTRIM(tmpdiff.fieldtitle) +  ;
                "] " +  ;
                ALLTRIM(tmpdiff.detail)
          IF par_issavemode
               msg = msg +  ;
                     CHR(13) +  ;
                     CHR(13) +  ;
                     "是否继续保存？"
               IF MESSAGEBOX(msg,  ;
                  0308,  ;
                  "公式检查") =  ;
                  7
                    pub_cancel = .T.
               ELSE
                    pub_cancel = .F.
               ENDIF
          ELSE
               MESSAGEBOX(msg,  ;
                         0048,  ;
                         "公式检查")
          ENDIF
          SELECT tmpdiff
          USE
          SET PROCEDURE TO
          RETURN 103
     ENDIF
     SELECT resultcursor
     USE
     sqlexe_run((00000000140),  ;
               SYS(16),  ;
               "SELECT a.*,b.* FROM gz_zg a,GZ_GZ b where 0=1",  ;
               "tmp_select")
ENDIF
ON ERROR DO SHOWERRORMSG WITH MESSAGE(),;
PAR_LIST, PAR_DEF, PAR_MODE, PAR_ISSAVEMODE
SELECT &par_list
SCAN &sim_Condition
     IF par_mode == "kq" .OR.  ;
        par_mode == "gzrep"
          ReportTableName = left(par_mode,;
2) + "_rep" + alltrim(str(&par_list..xuhao))
          IF  .NOT.  ;
              tableisexist(reporttablename)
               msg = "报表 [" + Alltrim(&par_list..Name_C);
+ "] 对应的数据表尚未创建，无法进行公式检查。"
               IF par_issavemode
                    msg = msg +  ;
                          CHR(13) +  ;
                          "是否继续保存？"
                    IF MESSAGEBOX(msg,  ;
                       0308,  ;
                       "公式检查") =  ;
                       7
                         pub_cancel =  ;
                          .T.
                    ELSE
                         pub_cancel =  ;
                          .F.
                    ENDIF
               ELSE
                    MESSAGEBOX(msg,  ;
                              0048,  ;
                              "公式检查")
               ENDIF
               ON ERROR DO HANDLE_ERR;
WITH LINENO(),SYS(16)
               SET PROCEDURE TO
               RETURN 102
          ENDIF
          = SQLCOLUMNS(odbc_ant2000,  ;
            reporttablename,  ;
            "FOXPRO", "ColDef")
          CREATE CURSOR  ;
                 CheckCursor  ;
                 (fieldnum I,  ;
                 fieldtitle C  ;
                 (30), fieldtype  ;
                 C (1),  ;
                 fieldwidth I,  ;
                 fieldprec I,  ;
                 modifyflag I,  ;
                 isdeleted L)
          select &par_def
          scan for not deleted() and &ReportID_FieldName=&par_list..&ReportID_FieldName
               insert into CheckCursor;
values(&par_def..seq,&par_def..Title_C,&par_def..Typ,&par_def..KuanDu,&par_def..XiaoShu,;
iif(par_IsSaveMode, &par_def..ModifyFlag,;
16777215), iif(par_IsSaveMode, Deleted(par_def),;
.F.))
          ENDSCAN
          CREATE CURSOR  ;
                 ResultCursor  ;
                 (rownum I,  ;
                 fieldnum I,  ;
                 fieldtitle C  ;
                 (30), fieldtype  ;
                 C (1),  ;
                 fieldwidth I,  ;
                 fieldprec I,  ;
                 detail C (60),  ;
                 modifyflag I,  ;
                 flag I)
          hasdiff = checktableex("CheckCursor",  ;
                    "ColDef",  ;
                    "ResultCursor")
          SELECT checkcursor
          USE
          SELECT coldef
          USE
          IF hasdiff = 1
               SELECT TOP 1  ;
                      fieldtitle,  ;
                      detail FROM  ;
                      ResultCursor  ;
                      WHERE flag <>  ;
                      0 ORDER BY  ;
                      fieldnum  ;
                      INTO CURSOR  ;
                      tmpDiff
               SELECT resultcursor
               USE
               msg = "报表 [" + Alltrim(&par_list..Name_C);
+ "] 的项目定义与对应的数据表不一致，";
+ chr(13) + "项目 [" + alltrim(tmpDiff.FieldTitle);
+ "] " + AllTrim(tmpDiff.Detail)
               IF par_issavemode
                    msg = msg +  ;
                          CHR(13) +  ;
                          CHR(13) +  ;
                          "是否继续保存？"
                    IF MESSAGEBOX(msg,  ;
                       0308,  ;
                       "公式检查") =  ;
                       7
                         pub_cancel =  ;
                          .T.
                    ELSE
                         pub_cancel =  ;
                          .F.
                    ENDIF
               ELSE
                    MESSAGEBOX(msg,  ;
                              0048,  ;
                              "公式检查")
               ENDIF
               SELECT tmpdiff
               USE
               ON ERROR DO HANDLE_ERR;
WITH LINENO(),SYS(16)
               SET PROCEDURE TO
               RETURN 103
          ENDIF
          SELECT resultcursor
          USE
          IF par_mode == "kq"
               strsql = "select a.*,b.*,c.* from kq_zg a,kq_clfx b," +  ;
                        reporttablename +  ;
                        " c where 0=1"
          ELSE
               strsql = "select a.*,b.* from gz_zg a," +  ;
                        reporttablename +  ;
                        " b where 0=1"
          ENDIF
          SQLEXEC(odbc_ant2000,  ;
                 strsql,  ;
                 "tmp_select")
          SELECT tmp_select
     ENDIF
     SELECT &par_def
     SCAN FOR  .NOT. DELETED()
          IF EMPTY(&Formula_FieldName)
               if (par_mode == "kq" OR;
par_mode == "gzrep") and empty(&par_def..kqid)
                    DO showerrormsg  ;
                       WITH  ;
                       "自定义项目的公式不能为空",  ;
                       par_list,  ;
                       par_def,  ;
                       par_mode,  ;
                       par_issavemode
                    ReportID_Value = &par_def..&ReportID_FieldName
                    FieldID_Value = &par_def..&FieldID_FieldName
                    EXIT
               ELSE
                    LOOP
               ENDIF
          ENDIF
          evaluatehaserror = .F.
          exp_string = ALLTRIM(&Formula_FieldName);
   
          exp_tmp = UPPER(CHRTRAN(exp_string,  ;
                    '"', "'"))
          DO WHILE AT("FD",  ;
             exp_tmp)>0
               nposition = AT("FD",  ;
                           exp_tmp)
               IF SUBSTR(exp_tmp,  ;
                  nposition - 1,  ;
                  1) == "'"
                    nposition = AT("'",  ;
                                exp_tmp,  ;
                                2)
                    exp_tmp = RIGHT(exp_tmp,  ;
                              LEN(exp_tmp) -  ;
                              (nposition -  ;
                              1 +  ;
                              LEN("'")))
                    LOOP
               ENDIF
               exp_tmp = RIGHT(exp_tmp,  ;
                         LEN(exp_tmp) -  ;
                         (nposition -  ;
                         1 +  ;
                         LEN("FD")))
               digit_string = ""
               DO WHILE  ;
                  ISDIGIT(LEFT(exp_tmp,  ;
                  1)) .AND.  ;
                  LEN(exp_tmp)>0
                    digit_string =  ;
                     digit_string +  ;
                     LEFT(exp_tmp,  ;
                     1)
                    exp_tmp = RIGHT(exp_tmp,  ;
                              LEN(exp_tmp) -  ;
                              1)
               ENDDO
               IF EMPTY(digit_string)
                    LOOP
               ENDIF
               IF par_mode ==  ;
                  "gz"
                    CurrentYglb = alltrim(&par_def..yglb)
                    select yglb,SeriesNo;
from &par_def where ALLTRIM(yglb)==CurrentYglb;
and &FieldID_FieldName=VAL(digit_string);
into cursor tmp_SeriesNo
                    IF RECCOUNT("tmp_SeriesNo") >  ;
                       0
                         IF tmp_SeriesNo.SeriesNo;
> &par_def..SeriesNo
                              DO showerrormsg  ;
                                 WITH  ;
                                 "公式引用的字段 [FD"+ ;
                                 digit_string+ ;
                                 "] 的位置必须在当前项目之前",  ;
                                 par_list,  ;
                                 par_def,  ;
                                 par_mode,  ;
                                 par_issavemode
                              ReportID_Value;
= &par_def..&ReportID_FieldName
                              FieldID_Value;
= &par_def..&FieldID_FieldName
                              EXIT
                         ENDIF
                    ENDIF
                    SELECT tmp_select
               ELSE
                    IF VAL(digit_string);
> &par_def..&FieldID_FieldName
                         DO showerrormsg  ;
                            WITH  ;
                            "公式引用的字段 [FD"+ ;
                            digit_string+ ;
                            "] 的位置必须在当前项目之前",  ;
                            par_list,  ;
                            par_def,  ;
                            par_mode,  ;
                            par_issavemode
                         ReportID_Value;
= &par_def..&ReportID_FieldName
                         FieldID_Value;
= &par_def..&FieldID_FieldName
                         EXIT
                    ENDIF
               ENDIF
          ENDDO
          IF evaluatehaserror
               EXIT
          ENDIF
          exp_string = LOWER(exp_string)
          IF AT("getdbf(",  ;
             exp_string) > 0
               LOOP
          ENDIF
          IF LEFT(exp_string, 1) $  ;
             "=?"
               exp_string = STUFF(exp_string,  ;
                            1, 1,  ;
                            "")
          ENDIF
          IF "zg." $ exp_string
               exp_string = STRTRAN(exp_string,  ;
                            "zg.",  ;
                            "")
          ENDIF
          IF par_mode == "kq"
               IF "clfx." $  ;
                  exp_string
                    exp_string = STRTRAN(exp_string,  ;
                                 "clfx.",  ;
                                 "")
               ENDIF
          ELSE
               IF "gz." $  ;
                  exp_string
                    exp_string = STRTRAN(exp_string,  ;
                                 "gz.",  ;
                                 "")
               ENDIF
          ENDIF
          ResultType = &par_def..typ
          if (par_mode == "kq" OR par_mode;
== "gzrep") and not empty(&par_def..kqid)
               resulttype = "L"
          ENDIF
          SELECT tmp_select
          eval_value = &exp_string
          IF evaluatehaserror
               ReportID_Value = &par_def..&ReportID_FieldName
               FieldID_Value = &par_def..&FieldID_FieldName
               EXIT
          ENDIF
          IF  .NOT.  ;
              (TYPE("eval_value") ==  ;
              resulttype)
               if (par_mode == "kq" OR;
par_mode == "gzrep") and not empty(&par_def..kqid)
                    DO showerrormsg  ;
                       WITH  ;
                       "引用项目的公式只能是逻辑条件",  ;
                       par_list,  ;
                       par_def,  ;
                       par_mode,  ;
                       par_issavemode
               ELSE
                    DO showerrormsg  ;
                       WITH  ;
                       "公式的值与项目定义的类型不匹配",  ;
                       par_list,  ;
                       par_def,  ;
                       par_mode,  ;
                       par_issavemode
               ENDIF
               ReportID_Value = &par_def..&ReportID_FieldName
               FieldID_Value = &par_def..&FieldID_FieldName
               EXIT
          ENDIF
     ENDSCAN
     IF evaluatehaserror
          EXIT
     ENDIF
ENDSCAN
IF USED("tmp_select")
     SELECT tmp_select
     USE
ENDIF
ON ERROR DO HANDLE_ERR WITH LINENO(),SYS(16)
SET PROCEDURE TO
IF par_issavemode
     DO CASE
          CASE par_mode == "kq"  ;
               .OR. par_mode ==  ;
               "gzrep"
               SELECT &par_list
               GOTO TOP
               IF reportid_value > - ;
                  1
                    SEEK reportid_value 
               ENDIF
               SELECT &par_def
               GOTO TOP
               IF reportid_value > - ;
                  1
                    LOCATE FOR  ;
                           xuhao =  ;
                           reportid_value  ;
                           .AND.  ;
                           seq =  ;
                           fieldid_value
               ENDIF
          CASE par_mode == "gz"
               SELECT &par_list
               GOTO TOP
               IF  .NOT.  ;
                   EMPTY(reportid_value)
                    LOCATE FOR  ;
                           ALLTRIM(lbbh) ==  ;
                           ALLTRIM(reportid_value)
               ENDIF
               SELECT &par_def
               GOTO TOP
               IF  .NOT.  ;
                   EMPTY(reportid_value)
                    LOCATE FOR  ;
                           ALLTRIM(yglb) ==  ;
                           ALLTRIM(reportid_value)  ;
                           .AND.  ;
                           xuhao =  ;
                           fieldid_value
               ENDIF
     ENDCASE
ENDIF
RETURN  .NOT. evaluatehaserror
ENDFUNC
**
PROCEDURE ShowErrorMsg
PARAMETER par_msg, par_main,  ;
          par_detail, par_module,  ;
          par_iscontinue
SELECT &par_main
DO CASE
     CASE par_module == "kq" .OR.  ;
          par_module == "gzrep"
          msg = "报表 [" +  ;
                ALLTRIM(name_c) +  ;
                "] 的"
     CASE par_module == "gz"
          msg = "员工类别 [" +  ;
                ALLTRIM(yglb) +  ;
                "] 的"
ENDCASE
SELECT &par_detail
itemname = ""
DO CASE
     CASE par_module == "kq" .OR.  ;
          par_module == "gzrep"
          itemname = ALLTRIM(title_c)
     CASE par_module == "gz"
          itemname = ALLTRIM(term)
ENDCASE
msg = msg + "项目 [" + itemname +  ;
      "] 的公式定义错误!  " +  ;
      CHR(13) + par_msg
IF par_iscontinue
     msg = msg + CHR(13) +  ;
           CHR(13) +  ;
           "是否继续保存？"
     IF MESSAGEBOX(msg, 0308,  ;
        "公式错误") = 7
          pub_cancel = .T.
     ELSE
          pub_cancel = .F.
     ENDIF
ELSE
     MESSAGEBOX(msg, 0048,  ;
               "公式错误")
ENDIF
evaluatehaserror = .T.
RETURN
ENDPROC
**
