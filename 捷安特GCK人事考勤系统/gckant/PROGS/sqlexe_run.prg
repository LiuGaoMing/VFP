PARAMETER runsql_line, runsql_cxm,  ;
          runsql_str, runsql_tbl
IF  .NOT. EMPTY(runsql_str)
     DO WHILE  ;
        SQLEXEC(odbc_ant2000,  ;
        runsql_str, runsql_tbl)=- ;
        1
          runsql_ret = handle_sql(runsql_line,  ;
                       runsql_cxm)
          DO CASE
               CASE runsql_ret = - ;
                    99
                    IF pub_ifrel =  ;
                       1
                         &PUB_OBJECT(PUB_LEVEL)..RELEASE
                    ELSE
                         IF pub_ifrel = - ;
                            1
                              pub_ifformerr =  ;
                               1
                         ENDIF
                    ENDIF
                    IF pub_ifbackup =  ;
                       1
                         DO relebkup
                    ENDIF
                    DO sysexit
               CASE runsql_ret = - ;
                    98
                    IF pub_ifrel =  ;
                       0
                         IF pub_ifmove =  ;
                            0
                              RETURN  ;
                               TO  ;
                               MASTER 
                         ELSE
                              IF pub_level =  ;
                                 4
                                   &PUB_OBJECT(3)..ENABLED=.T.
                                   &PUB_OBJECT(3)..LEFT=PUB_LEFT2
                                   &PUB_OBJECT(3)..TOP=PUB_TOP2
                                   &PUB_OBJECT(2)..SHOW
                                   &PUB_OBJECT(3)..SHOW
                              ELSE
                                   IF pub_level = 3
                                        &PUB_OBJECT(2)..ENABLED=.T.
                                        &PUB_OBJECT(2)..LEFT=PUB_LEFT1
                                        &PUB_OBJECT(2)..TOP=PUB_TOP1
                                   ENDIF
                              ENDIF
                              RETURN  ;
                               TO  ;
                               MASTER 
                         ENDIF
                    ELSE
                         IF pub_ifrel =  ;
                            1
                              IF pub_level <  ;
                                 3
                                   &PUB_OBJECT(PUB_LEVEL)..ENABLED=.T.
                                   &PUB_OBJECT(PUB_LEVEL)..RELEASE
                                   DO sysexit
                              ELSE
                                   IF pub_ifbackup = 1
                                        pub_ifbackup = 0
                                        DO relebkup
                                   ENDIF
                                   &PUB_OBJECT(PUB_LEVEL)..RELEASE
                                   RETURN TO MASTER 
                              ENDIF
                         ELSE
                              pub_ifformerr =  ;
                               1
                              RETURN  ;
                               TO  ;
                               MASTER 
                         ENDIF
                    ENDIF
               CASE runsql_ret =  ;
                    0
                    LOOP
               CASE runsql_ret = - ;
                    1
                    RETURN -1
               CASE runsql_ret = - ;
                    2
                    RETURN -2
          ENDCASE
          EXIT
     ENDDO
     RETURN 1
ENDIF
ENDFUNC
**
FUNCTION Handle_sql
PARAMETER errline, programname
DIMENSION aerrorarray(7)
cntrol = AERROR(aerrorarray)
IF cntrol <= 0
     RETURN 1
ENDIF
errno = aerrorarray(1)
errtext = aerrorarray(2)
errtext = errtext + CHR(13) +  ;
          CHR(13) + "程序名:  " +  ;
          programname + CHR(13) +  ;
          "错误行:  " +  ;
          ALLTRIM(STR(errline))
IF errno = 1526
     errno = aerrorarray(5)
     errtext = aerrorarray(3)
     errtext = errtext + CHR(13) +  ;
               CHR(13) +  ;
               "程序名:  " +  ;
               programname +  ;
               CHR(13) +  ;
               "错误行:  " +  ;
               ALLTRIM(STR(errline))
     DO CASE
          CASE pub_database =  ;
               "ACCESS"
               DO CASE
                    CASE errno = - ;
                         1053
                         = MESSAGEBOX(errtext,  ;
                           048,  ;
                           "警告")
                         RETURN -1
                    CASE errno = - ;
                         1302
                         errtext =  ;
                          errtext +  ;
                          CHR(13) +  ;
                          CHR(13) +  ;
                          "是否重试?"
                         result =  ;
                          MESSAGEBOX(errtext,  ;
                          053,  ;
                          "警告")
                         IF result =  ;
                            4
                              RETURN  ;
                               0
                         ELSE
                              RETURN - ;
                               98
                         ENDIF
                    CASE errno = - ;
                         1303
                         = MESSAGEBOX(errtext,  ;
                           048,  ;
                           "警告")
                         RETURN -1
                    CASE errno = - ;
                         1605
                         RETURN -1
                    OTHERWISE
                         errtext =  ;
                          STR(errno) +  ;
                          CHR(13) +  ;
                          errtext
                         MESSAGEBOX(errtext,  ;
                          048,  ;
                          "系统错误")
                         RETURN -99
               ENDCASE
          CASE pub_database =  ;
               "SQL SERVER"
               DO CASE
                    CASE errno =  ;
                         515
                         = MESSAGEBOX(errtext,  ;
                           048,  ;
                           "警告")
                         RETURN -1
                    CASE errno =  ;
                         2714
                         = MESSAGEBOX(errtext,  ;
                           048,  ;
                           "警告")
                         RETURN -1
                    CASE errno =  ;
                         2627
                         RETURN -1
                    OTHERWISE
                         errtext =  ;
                          STR(errno) +  ;
                          CHR(13) +  ;
                          errtext
                         MESSAGEBOX(errtext,  ;
                          048,  ;
                          "系统错误")
                         RETURN -99
               ENDCASE
          CASE pub_database =  ;
               "INTERBASE"
               DO CASE
                    CASE errno = - ;
                         206
                         IF TYPE('pub_ErrorFlag') =  ;
                            'U'
                              PUBLIC  ;
                               pub_errorflag
                         ENDIF
                         IF  .NOT.  ;
                             pub_errorflag
                              IF 6 <>  ;
                                 MESSAGEBOX("数据表字段名错误，忽略吗？" +  ;
                                 CHR(13) +  ;
                                 runsql_str,  ;
                                 036,  ;
                                 "警告")
                                   RETURN -1
                              ELSE
                                   pub_errorflag = .T.
                              ENDIF
                         ENDIF
                    CASE errno = - ;
                         625
                         = MESSAGEBOX(errtext,  ;
                           048,  ;
                           "警告")
                         RETURN -1
                    CASE errno = - ;
                         607
                         IF AT( ;
                            "too many versions",  ;
                            errtext) >  ;
                            0
                              = MESSAGEBOX("数据表结构修改次数过多，请与软件供应商联系！",  ;
                                048,  ;
                                "警告")
                              RETURN - ;
                               2
                         ELSE
                              = MESSAGEBOX(STR(errno) +  ;
                                CHR(13) +  ;
                                errtext,  ;
                                048,  ;
                                "警告")
                              RETURN - ;
                               1
                         ENDIF
                    CASE errno = - ;
                         803
                         RETURN -1
                    OTHERWISE
                         errtext =  ;
                          STR(errno) +  ;
                          CHR(13) +  ;
                          errtext
                         MESSAGEBOX(errtext,  ;
                          048,  ;
                          "系统错误")
                         RETURN -99
               ENDCASE
          OTHERWISE
               errtext = STR(errno) +  ;
                         CHR(13) +  ;
                         errtext
               = MESSAGEBOX(errtext,  ;
                 048,  ;
                 "系统错误")
               RETURN -99
     ENDCASE
ELSE
     errtext = STR(errno) +  ;
               CHR(13) + errtext
     = MESSAGEBOX(errtext, 048,  ;
       "系统错误")
     RETURN -99
ENDIF
RETURN 1
ENDFUNC
**
