**
PROCEDURE CheckLocRepOut
PARAMETER tbl_mode
SELECT "  " AS sub, repdef.* FROM  ;
       repdef WHERE xuhao =  ;
       replist.xuhao INTO TABLE  ;
       tbl_repdef
SELECT tbl_repdef
REPLACE sub WITH tbl_mode,  ;
        title_e WITH "FD" +  ;
        LTRIM(STR(seq)), seq WITH  ;
        seq + 10, condition WITH  ;
        "  " ALL
SELECT loc_repout
GOTO TOP
IF EOF()
     SELECT loc_repout
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH "工号",  ;
             title_e WITH "ZGBH",  ;
             typ WITH "C", kuandu  ;
             WITH 10, xiaoshu  ;
             WITH 0, seq WITH 1,  ;
             xuhao WITH  ;
             replist.xuhao, kqid  ;
             WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH "姓名",  ;
             title_e WITH "ZGXM",  ;
             typ WITH "C", kuandu  ;
             WITH 8, xiaoshu WITH  ;
             0, seq WITH 2, xuhao  ;
             WITH replist.xuhao,  ;
             kqid WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH  ;
             "部门编号", title_e  ;
             WITH "BMBH", typ  ;
             WITH "C", kuandu  ;
             WITH 6, xiaoshu WITH  ;
             0, seq WITH 3, xuhao  ;
             WITH replist.xuhao,  ;
             kqid WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH  ;
             "部门名称", title_e  ;
             WITH "BMMC", typ  ;
             WITH "C", kuandu  ;
             WITH 20, xiaoshu  ;
             WITH 0, seq WITH 4,  ;
             xuhao WITH  ;
             replist.xuhao, kqid  ;
             WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH  ;
             "员工类别", title_e  ;
             WITH "ZGLB", typ  ;
             WITH "C", kuandu  ;
             WITH 1, xiaoshu WITH  ;
             0, seq WITH 5, xuhao  ;
             WITH replist.xuhao,  ;
             kqid WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH  ;
             "类别名称", title_e  ;
             WITH "LBMC", typ  ;
             WITH "C", kuandu  ;
             WITH 10, xiaoshu  ;
             WITH 0, seq WITH 6,  ;
             xuhao WITH  ;
             replist.xuhao, kqid  ;
             WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH "日期",  ;
             title_e WITH "RIQI",  ;
             typ WITH "C", kuandu  ;
             WITH 10, xiaoshu  ;
             WITH 0, seq WITH 7,  ;
             xuhao WITH  ;
             replist.xuhao, kqid  ;
             WITH "@"
     APPEND BLANK
     REPLACE sub WITH tbl_mode,  ;
             title_c WITH  ;
             "报表年月", title_e  ;
             WITH "RQ", typ WITH  ;
             "C", kuandu WITH 14,  ;
             xiaoshu WITH 0, seq  ;
             WITH 8, xuhao WITH  ;
             replist.xuhao, kqid  ;
             WITH "@"
     SELECT tbl_repdef
     GOTO TOP
     IF  .NOT. EOF()
          SELECT loc_repout
          APPEND FROM tbl_repdef
     ELSE
          _mrep = tbl_mode +  ;
                  "_rep" +  ;
                  ALLTRIM(STR(replist.xuhao))
          sqlexe_run(00000000039,  ;
                    SYS(16),  ;
                    "SELECT * FROM " +  ;
                    _mrep +  ;
                    " WHERE 1=2",  ;
                    "_mRep")
          SELECT _mrep
          _midx = 0
          FOR _mcnt = 1 TO  ;
              FCOUNT()
               _mname = FIELD(_mcnt)
               _msize = FSIZE(_mname)
               IF _mname <>  ;
                  "ZGBH" .AND.  ;
                  _mname <>  ;
                  "ZGXM" .AND.  ;
                  _mname <>  ;
                  "BMBH" .AND.  ;
                  _mname <>  ;
                  "BMMC" .AND.  ;
                  _mname <>  ;
                  "ZGLB" .AND.  ;
                  _mname <>  ;
                  "LBMC" .AND.  ;
                  _mname <> "QF"  ;
                  .AND. _mname <>  ;
                  "DATE" .AND.  ;
                  _mname <> "RQ"  ;
                  .AND. _mname <>  ;
                  "BMMC_E" .AND.  ;
                  _mname <>  ;
                  "RIQI"
                    SELECT loc_repout
                    APPEND BLANK
                    _midx = _midx +  ;
                            1
                    REPLACE sub  ;
                            WITH  ;
                            tbl_mode,  ;
                            title_c  ;
                            WITH  ;
                            _mname,  ;
                            title_e  ;
                            WITH  ;
                            _mname
                    REPLACE kuandu  ;
                            WITH  ;
                            _msize,  ;
                            xiaoshu  ;
                            WITH  ;
                            0,  ;
                            seq  ;
                            WITH  ;
                            8 +  ;
                            _midx
                    REPLACE xuhao  ;
                            WITH  ;
                            replist.xuhao,  ;
                            kqid  ;
                            WITH  ;
                            "@",  ;
                            typ  ;
                            WITH  ;
                            TYPE("_mName")
                    SELECT _mrep
               ENDIF
          ENDFOR
          SELECT _mrep
          USE
     ENDIF
ELSE
     SELECT tbl_repdef
     GOTO TOP
     IF  .NOT. EOF()
          SELECT loc_repout
          SCAN
               IF seq < 10
                    LOOP
               ENDIF
               SELECT tbl_repdef
               LOCATE FOR seq =  ;
                      loc_repout.seq
               IF EOF()
                    SELECT loc_repout
                    DELETE
               ELSE
                    SELECT loc_repout
                    IF typ <>  ;
                       tbl_repdef.typ  ;
                       .OR.  ;
                       kuandu <>  ;
                       tbl_repdef.kuandu  ;
                       .OR.  ;
                       xiaoshu <>  ;
                       tbl_repdef.xiaoshu
                         REPLACE typ  ;
                                 WITH  ;
                                 tbl_repdef.typ,  ;
                                 kuandu  ;
                                 WITH  ;
                                 tbl_repdef.kuandu,  ;
                                 xiaoshu  ;
                                 WITH  ;
                                 tbl_repdef.xiaoshu
                    ENDIF
               ENDIF
          ENDSCAN
          SELECT tbl_repdef
          SCAN
               SELECT loc_repout
               LOCATE FOR seq =  ;
                      tbl_repdef.seq
               IF EOF()
                    APPEND BLANK
                    REPLACE sub  ;
                            WITH  ;
                            tbl_mode
                    REPLACE xuhao  ;
                            WITH  ;
                            tbl_repdef.xuhao
                    REPLACE seq  ;
                            WITH  ;
                            tbl_repdef.seq
                    REPLACE title_c  ;
                            WITH  ;
                            tbl_repdef.title_c
                    REPLACE title_e  ;
                            WITH  ;
                            tbl_repdef.title_e
                    REPLACE kqid  ;
                            WITH  ;
                            tbl_repdef.kqid
                    REPLACE condition  ;
                            WITH  ;
                            tbl_repdef.condition
                    REPLACE typ  ;
                            WITH  ;
                            tbl_repdef.typ
                    REPLACE kuandu  ;
                            WITH  ;
                            tbl_repdef.kuandu
                    REPLACE xiaoshu  ;
                            WITH  ;
                            tbl_repdef.xiaoshu
                    IF tbl_mode =  ;
                       'KQ'
                         REPLACE dw  ;
                                 WITH  ;
                                 tbl_repdef.dw
                    ENDIF
                    REPLACE ifshow  ;
                            WITH  ;
                            tbl_repdef.ifshow
                    REPLACE modifyflag  ;
                            WITH  ;
                            tbl_repdef.modifyflag
               ENDIF
               SELECT tbl_repdef
          ENDSCAN
     ENDIF
ENDIF
SELECT tbl_repdef
USE
RETURN
ENDPROC
**
