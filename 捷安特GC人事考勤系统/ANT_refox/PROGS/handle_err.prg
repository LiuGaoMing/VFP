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
               "������:  " +  ;
               programname +  ;
               CHR(13) +  ;
               "������:  " +  ;
               ALLTRIM(STR(errline))
ENDIF
DO CASE
     CASE errno = 1
          MESSAGEBOX(errtext, 048,  ;
                    "���ش���")
          RETURN 2
     CASE errno = 9
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          RETURN 2
     CASE errno = 11
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 12
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 13
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 107
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 109
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1113
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1466
          MESSAGEBOX(errtext +  ;
                    CHR(13) +  ;
                    CHR(13) +  ;
                    "����ODBC����Դ�����ƺ�����!",  ;
                    048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1523
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1712
          MESSAGEBOX(errtext, 048,  ;
                    "�﷨����")
          DO resetsys
          RETURN TO MASTER 
     CASE errno = 1734
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1742
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1925
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 2005
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
     CASE errno = 1427
          MESSAGEBOX(errtext, 016,  ;
                    "OLE����")
          DO sysexit
     CASE errno = 1428
          MESSAGEBOX(errtext, 016,  ;
                    "OLE����")
          DO sysexit
     CASE errno = 1429
          MESSAGEBOX(errtext, 016,  ;
                    "OLE����")
          DO sysexit
     CASE errno = 1526
          errno = aerrorarray(5)
          errtext = aerrorarray(3)
          errtext = errtext +  ;
                    CHR(13) +  ;
                    CHR(13) +  ;
                    "������:  " +  ;
                    programname +  ;
                    CHR(13) +  ;
                    "������:  " +  ;
                    ALLTRIM(STR(errline))
          DO CASE
               CASE errno = 0
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
               CASE errno = -1302
                    errtext = errtext +  ;
                              CHR(13) +  ;
                              CHR(13) +  ;
                              "�Ƿ�����?"
                    result = MESSAGEBOX(errtext,  ;
                             050,  ;
                             "����")
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
                              "�����û�����ʹ��!"
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "����")
                    RETURN 3
               CASE errno = -1605
                    RETURN 3
               CASE errno = -1305
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
               CASE errno = -3030
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
               CASE errno = -3100
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
               CASE errno = -3502
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
               CASE errno = -3503
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
               CASE errno = -3817
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "���ش���")
                    RETURN 2
               OTHERWISE
                    errtext = STR(errno) +  ;
                              CHR(13) +  ;
                              errtext
                    MESSAGEBOX(errtext,  ;
                              048,  ;
                              "ϵͳ����")
                    DO sysexit
          ENDCASE
     OTHERWISE
          errtext = STR(errno) +  ;
                    CHR(13) +  ;
                    errtext
          MESSAGEBOX(errtext, 048,  ;
                    "ϵͳ����")
          DO sysexit
ENDCASE
ENDFUNC
**
