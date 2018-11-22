**
FUNCTION GETQX
PARAMETER subsys, mode
marea = ALLTRIM(STR(SELECT()))
mret = "error"
DO CASE
     CASE subsys = "RS"
          DO CASE
               CASE mode = "BM"
                    = sqlexe_run(00000000023,  ;
                      SYS(16),  ;
                      "select * from  rs_qx_bm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO name;
= pub_user
                    mret = ""
                    mall = .T.
                    SCAN
                         IF qx >  ;
                            0
                              IF EMPTY(mret)
                                   mret = "(@='" + ALLTRIM(bmbh) + "'"
                              ELSE
                                   mret = mret + " or @='" + ALLTRIM(bmbh) + "'"
                              ENDIF
                         ELSE
                              mall =  ;
                               .F.
                         ENDIF
                    ENDSCAN
                    IF mall
                         mret = "1=1"
                    ELSE
                         IF EMPTY(mret)
                              mret =  ;
                               "1=2"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ")"
                         ENDIF
                    ENDIF
               CASE mode = "GYXZ"
                    = sqlexe_run(00000000053,  ;
                      SYS(16),  ;
                      "select * from  rs_qx_gyxz",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO name;
= pub_user
                    mret = ""
                    mall = .T.
                    SCAN
                         IF qx >  ;
                            0
                              IF EMPTY(mret)
                                   mret = "(@=" + ALLTRIM(STR(code))
                              ELSE
                                   mret = mret + " or @=" + ALLTRIM(STR(code))
                              ENDIF
                         ELSE
                              mall =  ;
                               .F.
                         ENDIF
                    ENDSCAN
                    IF mall
                         mret = "1=1"
                    ELSE
                         IF EMPTY(mret)
                              mret =  ;
                               "1=2"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ")"
                         ENDIF
                    ENDIF
               OTHERWISE
                    = sqlexe_run(00000000083,  ;
                      SYS(16),  ;
                      "select * from rs_qx_hm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO hmbh;
= mode
                    mret = "true"
                    IF  .NOT.  ;
                        EOF()
                         LOCATE FOR  ;
                                name =  ;
                                pub_user  ;
                                .AND.  ;
                                qx >  ;
                                0
                         IF EOF()
                              mret =  ;
                               "false"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ALLTRIM(STR(qx))
                         ENDIF
                    ELSE
                         mret = "false"
                    ENDIF
          ENDCASE
     CASE subsys = "KQ"
          DO CASE
               CASE mode = "BM"
                    = sqlexe_run(00000000104,  ;
                      SYS(16),  ;
                      "select * from  kq_qx_bm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO name;
= pub_user
                    mret = ""
                    mall = .T.
                    SCAN
                         IF qx >  ;
                            0
                              IF EMPTY(mret)
                                   mret = "(@='" + ALLTRIM(bmbh) + "'"
                              ELSE
                                   mret = mret + " or @='" + ALLTRIM(bmbh) + "'"
                              ENDIF
                         ELSE
                              mall =  ;
                               .F.
                         ENDIF
                    ENDSCAN
                    IF mall
                         mret = "1=1"
                    ELSE
                         IF EMPTY(mret)
                              mret =  ;
                               "1=2"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ")"
                         ENDIF
                    ENDIF
               OTHERWISE
                    = sqlexe_run((00000000133),  ;
                      SYS(16),  ;
                      "select * from kq_qx_hm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO hmbh;
= mode
                    mret = "true"
                    IF  .NOT.  ;
                        EOF()
                         LOCATE FOR  ;
                                name =  ;
                                pub_user  ;
                                .AND.  ;
                                qx >  ;
                                0
                         IF EOF()
                              mret =  ;
                               "false"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ALLTRIM(STR(qx))
                         ENDIF
                    ELSE
                         mret = "false"
                    ENDIF
          ENDCASE
     CASE subsys = "GZ"
          DO CASE
               CASE mode = "XZDM"
                    = sqlexe_run((00000000154),  ;
                      SYS(16),  ;
                      "select * from  gz_qx_xzxm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO name;
= pub_user
                    mret = ""
                    mall = .T.
                    SCAN
                         IF qx >  ;
                            0
                              IF EMPTY(mret)
                                   mret = "(@=" + ALLTRIM(STR(xuhao))
                              ELSE
                                   mret = mret + " or @=" + ALLTRIM(STR(xuhao))
                              ENDIF
                         ELSE
                              mall =  ;
                               .F.
                         ENDIF
                    ENDSCAN
                    IF mall
                         mret = "1=1"
                    ELSE
                         IF EMPTY(mret)
                              mret =  ;
                               "1=2"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ")"
                         ENDIF
                    ENDIF
               CASE mode = "BM"
                    = sqlexe_run((00000000184),  ;
                      SYS(16),  ;
                      "select * from  gz_qx_bm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO name;
= pub_user
                    mret = ""
                    mall = .T.
                    SCAN
                         IF qx >  ;
                            0
                              IF EMPTY(mret)
                                   mret = "(@='" + ALLTRIM(bmbh) + "'"
                              ELSE
                                   mret = mret + " or @='" + ALLTRIM(bmbh) + "'"
                              ENDIF
                         ELSE
                              mall =  ;
                               .F.
                         ENDIF
                    ENDSCAN
                    IF mall
                         mret = "1=1"
                    ELSE
                         IF EMPTY(mret)
                              mret =  ;
                               "1=2"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ")"
                         ENDIF
                    ENDIF
               CASE mode = "YGLB"
                    = sqlexe_run((00000000214),  ;
                      SYS(16),  ;
                      "select * from  gz_qx_yglb",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO name;
= pub_user
                    mret = ""
                    mall = .T.
                    SCAN
                         IF qx >  ;
                            0
                              IF EMPTY(mret)
                                   mret = "(@='" + ALLTRIM(lbbh) + "'"
                              ELSE
                                   mret = mret + " or @='" + ALLTRIM(lbbh) + "'"
                              ENDIF
                         ELSE
                              mall =  ;
                               .F.
                         ENDIF
                    ENDSCAN
                    IF mall
                         mret = "1=1"
                    ELSE
                         IF EMPTY(mret)
                              mret =  ;
                               "1=2"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ")"
                         ENDIF
                    ENDIF
               OTHERWISE
                    = sqlexe_run((00000000244),  ;
                      SYS(16),  ;
                      "select * from gz_qx_hm",  ;
                      "temp")
                    SELECT temp
                    SET FILTER TO hmbh;
= mode
                    mret = "true"
                    IF  .NOT.  ;
                        EOF()
                         LOCATE FOR  ;
                                name =  ;
                                pub_user  ;
                                .AND.  ;
                                qx >  ;
                                0
                         IF EOF()
                              mret =  ;
                               "false"
                         ELSE
                              mret =  ;
                               mret +  ;
                               ALLTRIM(STR(qx))
                         ENDIF
                    ELSE
                         mret = "false"
                    ENDIF
          ENDCASE
     CASE subsys = "FT"
          = sqlexe_run(00000000263,  ;
            SYS(16),  ;
            "select * from FT_qx_hm",  ;
            "temp")
          SELECT temp
          SET FILTER TO hmbh = mode
          mret = "true"
          IF  .NOT. EOF()
               LOCATE FOR name =  ;
                      pub_user  ;
                      .AND. qx >  ;
                      0
               IF EOF()
                    mret = "false"
               ELSE
                    mret = mret +  ;
                           ALLTRIM(STR(qx))
               ENDIF
          ELSE
               mret = "false"
          ENDIF
     CASE subsys = "TL"
          = sqlexe_run(00000000281,  ;
            SYS(16),  ;
            "select * from tl_qx_hm",  ;
            "temp")
          SELECT temp
          SET FILTER TO hmbh = mode
          mret = "true"
          IF  .NOT. EOF()
               LOCATE FOR name =  ;
                      pub_user  ;
                      .AND. qx >  ;
                      0
               IF EOF()
                    mret = "false"
               ELSE
                    mret = mret +  ;
                           ALLTRIM(STR(qx))
               ENDIF
          ELSE
               mret = "false"
          ENDIF
ENDCASE
IF mret = "error"
     = MESSAGEBOX("权限调用参数错误",  ;
       64,  ;
       "ANT2000人事考勤系统")
     mret = "false"
ENDIF
USE
select &marea
RETURN mret
ENDFUNC
**
