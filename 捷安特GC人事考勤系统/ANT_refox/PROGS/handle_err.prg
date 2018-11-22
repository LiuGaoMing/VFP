**
FUNCTION Handle_err
PARAMETER errline, programname
DIMENSION aerrorarray(7)
cntrol = AERROR(aerrorarray)
IF cntrol <= 0
     RETURN 0
ELSE
     errno = aerrorarray(1)
     errtext = aerrorarray(2)
     errtext = errtext + CHR(13) +  ;
               CHR(13) +  ;
               "程序名:  " +  ;
               programname +  ;
               CHR(13) +  ;
               "错误行:  " +  ;
               ALLTRIM(STR(errline))
ENDIF
DO CASE
     CASE errno = 1
          MESSAGEBOX(errtext, 048,  ;
                    "严重错误")
          RETURN 2
     CASE errno = 9
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          RETURN 2
     CASE errno = 11
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 12
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 13
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 107
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 109
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1113
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1466
          MESSAGEBOX(errtext +  ;
                    CHR(13) +  ;
                    CHR(13) +  ;
                    "请检查ODBC数据源的名称和设置!",  ;
                    048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1523
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1712
          MESSAGEBOX(errtext, 048,  ;
                    "语法错误")
          DO resetsys
          RETURN TO MASTER 
     CASE errno = 1734
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1742
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1925
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 2005
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
     CASE errno = 1427
          MESSAGEBOX(errtext, 016,  ;
                    "OLE错误")
          DO sysexit
     CASE errno = 1428
          MESSAGEBOX(errtext, 016,  ;
                    "OLE错误")
          DO sysexit
     CASE errno = 1429
          MESSAGEBOX(errtext, 016,  ;
                    "OLE错误")
          DO sysexit
     CASE errno = 1526
          errno = aerrorarray(5)
          errtext = aerrorarray(3)
          errtext = errtext +  ;
                    CHR(13) +  ;
                    CHR(13) +  ;
                    "程序名:  " +  ;
                    programname +  ;
                    CHR(13) +  ;
                    "错误行:  " +  ;
                    ALLTRIM(STR(errline))
          DO CASE
               CASE errno = 0
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
               CASE errno = -1302
                    errtext = errtext +  ;
                              CHR(13) +  ;
                              CHR(13) +  ;
                              "是否重试?"
                    result = MESSAGEBOX(errtext,  ;
                             050,  ;
                             "警告")
                    IF result = 4
                         RETURN 1
                    ELSE
                         IF result =  ;
                            3
                              RETURN  ;
                               2
                         ELSE
                              RETURN  ;
                               3
                         ENDIF
                    ENDIF
               CASE errno = -1303
                    errtext = errtext +  ;
                              CHR(13) +  ;
                              "其他用户正在使用!"
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "警告")
                    RETURN 3
               CASE errno = -1605
                    RETURN 3
               CASE errno = -1305
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
               CASE errno = -3030
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
               CASE errno = -3100
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
               CASE errno = -3502
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
               CASE errno = -3503
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
               CASE errno = -3817
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "严重错误")
                    RETURN 2
               OTHERWISE
                    errtext = STR(errno) +  ;
                              CHR(13) +  ;
                              errtext
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "系统错误")
                    DO sysexit
          ENDCASE
     OTHERWISE
          errtext = STR(errno) +  ;
                    CHR(13) +  ;
                    errtext
          MESSAGEBOX(errtext, 048,  ;
                    "系统错误")
          DO sysexit
ENDCASE
ENDFUNC
**
