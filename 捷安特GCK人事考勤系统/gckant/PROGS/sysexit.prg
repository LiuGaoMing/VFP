IF odbc_ant2000 = -1
     QUIT
     RETURN
ENDIF
syslog(1, "LOGOUT", "")
SAVE TO client ALL LIKE Sys*
_SCREEN.show
IF odbc_ant2000 <> -1
     = SQLDISCONNECT(odbc_ant2000)
ENDIF
odbc_ant2000 = -1
IF pub_language
     = closelanguage()
ENDIF
obj_ant2000 = .NULL.
obj_3ars = .NULL.
obj_3agz = .NULL.
obj_3aft = .NULL.
obj_3akq = .NULL.
obj_login = .NULL.
obj_tools = .NULL.
obj_active3 = .NULL.
obj_form = .NULL.
obj_toolbar = .NULL.
ERASE *.idx
ERASE *.cdx
mdbf = SYS(2000, "*.dbf")
DO WHILE  .NOT. EMPTY(mdbf)
     IF mdbf <> "FOXUSER.DBF"  ;
        .AND. LEFT(mdbf, 4) <>  ;
        "LOC_"
          erase &mdbf
     ENDIF
     mdbf = SYS(2000, "*.dbf", 1)
ENDDO
IF pub_banben <> "ÑÝÊ¾°æ"
     RELEASE ALL
     QUIT
ELSE
     RELEASE ALL
     CANCEL
ENDIF
ENDPROC
**
