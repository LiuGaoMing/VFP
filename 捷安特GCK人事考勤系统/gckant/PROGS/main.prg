*** 
*** ReFox X  #UK933629  MANRIQUE ORELLANA  MANSOFT SYSTEMS [VFP50]
***
ON ERROR DO HANDLE_ERR WITH LINENO(),SYS(16)
PUBLIC pub_extension
pub_extension = 0
PUBLIC pub_language
pub_language = openlanguage()
_SCREEN.hide
_SCREEN.icon = "icon\tct.ico"
IF pub_language
     _SCREEN.caption = "Ant2000 System"
ELSE
     _SCREEN.caption = "Ant2000 人事考勤系统"
ENDIF
_SCREEN.picture = "picture\sky.bmp"
DO createscreen
SET DOHISTORY OFF
SET ESCAPE OFF
SET OPTIMIZE ON
SET REFRESH TO 0, 0
SET STATUS BAR OFF
SET STATUS OFF
SET TALK OFF
SET VIEW OFF
SET SAFETY OFF
SET CENTURY ON
SET HOURS TO 24
SET CENTURY TO 20
SET MARK TO
SET DATE YMD
SET DELETED ON
SET EXCLUSIVE OFF
DO defconst
PUBLIC pub_rslink, pub_kqlink,  ;
       pub_gzlink, pub_ftlink,  ;
       pub_zglink, pub_bmlink,  ;
       pub_zgrefresh
PUBLIC pub_value, pub_cancel,  ;
       pub_lslink, pub_modifyflag,  ;
       pub_saveerr, pub_ver
PUBLIC pub_prnmode, pub_prntype,  ;
       pub_prnfname
PUBLIC gsxp, gsscreencaption,  ;
       odbc_ant2k2p
PUBLIC gscurrexedir,  ;
       gsoutfilekqardata
gsxp = 0
gsscreencaption = _SCREEN.caption
gscurrexedir = SYS(5) + SYS(2003)
gsoutfilekqardata = getantini("KQOUTPUTFILE",  ;
                    "ARDATA1")
PUBLIC pub_user, pub_pass,  ;
       pub_year, pub_month,  ;
       pub_role, pub_companycode,  ;
       pub_companyname, sys_wyear,  ;
       sys_wweek, sys_wday
pub_user = ""
pub_pass = ""
pub_year = YEAR(DATE())
pub_month = MONTH(DATE())
IF pub_month > 1
     pub_month = pub_month - 1
ELSE
     pub_month = 12
     pub_year = pub_year - 1
ENDIF
sys_wday = CTOD("2002/07/01")
sys_wweek = WEEK(sys_wday)
sys_wyear = YEAR(sys_wday)
PUBLIC obj_ant2000, obj_3ars,  ;
       obj_3agz, obj_3aft,  ;
       obj_3akq, obj_login,  ;
       obj_tools, obj_active3,  ;
       obj_form, obj_toolbar
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
PUBLIC pub_object(6), pub_banben
FOR i = 1 TO 6
     pub_object(i) = "OBJ_FORM" +  ;
               STR(i, 1)
ENDFOR
pub_banben = "网络版"
DECLARE INTEGER URLinkWWW IN  ;
        URL.dll
DECLARE INTEGER URLinkMail IN  ;
        URL.dll
DECLARE INTEGER PrintOrgChart IN  ;
        AntFunction.dll STRING @
DECLARE INTEGER XLS2DBF IN  ;
        AntFunction.dll STRING @,  ;
        STRING @, STRING @,  ;
        STRING @
DECLARE STRING GetModules IN  ;
        Databases.dll
DECLARE INTEGER OpenExcel IN  ;
        ImportFromExcel.dll  ;
        STRING
DECLARE CloseExcel IN  ;
        ImportFromExcel.dll
DECLARE GotoCell IN  ;
        ImportFromExcel.dll  ;
        STRING, INTEGER
DECLARE STRING GetCellValue IN  ;
        ImportFromExcel.dll
DECLARE STRING GetCellValue2 IN  ;
        ImportFromExcel.dll  ;
        STRING
DECLARE STRING GetCellComment IN  ;
        ImportFromExcel.dll
DECLARE STRING GetCellComment2 IN  ;
        ImportFromExcel.dll  ;
        STRING
DECLARE INTEGER Find IN  ;
        ImportFromExcel.dll  ;
        STRING, STRING
DECLARE INTEGER FindNext IN  ;
        ImportFromExcel.dll
DECLARE NextRow IN  ;
        ImportFromExcel.dll
DECLARE INTEGER GetDataRowCount  ;
        IN ImportFromExcel.dll
_SCREEN.show
IF  .NOT. FILE("ANT2000.DLL")
     IF pub_language
          = MESSAGEBOX( ;
            "ANT2000.DLL not exists!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX( ;
            "文件：ANT2000.DLL 不存在！",  ;
            64,  ;
            "ANT2000人事考勤系统")
     ENDIF
     RELEASE ALL
     QUIT
     RETURN
ELSE
     DECLARE INTEGER CheckHDSN IN  ;
             ANT2000.DLL
ENDIF
IF pub_banben <> "演示版"
ENDIF
PUBLIC odbc_ant2000, pub_database,  ;
       pub_subsys_language,  ;
       pub_company,  ;
       pub_serverpath
PUBLIC pub_ifrel, puc_ifmove,  ;
       pub_left1, pub_left2,  ;
       pub_top1, pub_top2,  ;
       pub_level, pub_ifformerr,  ;
       pub_ifbackup,  ;
       pub_totalpages
PUBLIC obj_form1, obj_form2,  ;
       obj_form3, obj_form4,  ;
       obj_form5, obj_form6
STORE .NULL. TO obj_form1,  ;
      obj_form2, obj_form3,  ;
      obj_form4, obj_form5,  ;
      obj_form6
PUBLIC pub_qx_kq, pub_qx_rs,  ;
       pub_qx_gz, pub_qx_ft,  ;
       pub_qx_module
PUBLIC pub_2win_left,  ;
       pub_2win_top
pub_2win_left = _SCREEN.img_3ars.left
pub_2win_top = _SCREEN.img_3ars.top
mdb = getantini("LOGIN",  ;
      "DATABASE")
lsserial = getantini("LOGIN",  ;
           "SERIAL1")
serial1 = strdecrypt2(lsserial)
IF mdb <> LEFT(serial1,  ;
   LEN(serial1) - 8)
     DO WHILE .T.
     ENDDO
     RETURN
ENDIF
*!*	lsdate1 = RIGHT(serial1, 8)
*!*	lsdate2 = LEFT(lsdate1, 4) + "/" +  ;
*!*	          SUBSTR(lsdate1, 5, 2) +  ;
*!*	          "/" + RIGHT(lsdate1,  ;
*!*	          2)
*!*	IF CTOD(lsdate2) = CTOD("")
*!*	     DO WHILE .T.
*!*	     ENDDO
*!*	     RETURN
*!*	ENDIF
lsdate2='2020/11/11'
IF CTOD(lsdate2) < DATE()
     DO WHILE .T.
     ENDDO
     RETURN
ENDIF
SQLSETPROP(0, "DispLogin", 3)
lsgcdinnerolserver = getantini("SQLSERVERSET",  ;
                     "SERVER")
lsgcdinneroldbname = getantini("SQLSERVERSET",  ;
                     "DATABASE")
lsgcdinneroluser = strdecrypt2(getantini("SQLSERVERSET",  ;
                   "USE"))
lsgcdinnerolpasswd = strdecrypt2(getantini("SQLSERVERSET",  ;
                     "PASS"))
IF  .NOT.  ;
    EMPTY(lsgcdinnerolserver)
     odbc_ant2000 = SQLSTRINGCONNECT( ;
                    "Driver=SQL Server;Server=" +  ;
                    lsgcdinnerolserver +  ;
                    ";UID=" +  ;
                    lsgcdinneroluser +  ;
                    ";PWD=" +  ;
                    lsgcdinnerolpasswd +  ;
                    ";Database=" +  ;
                    lsgcdinneroldbname)
ELSE
     IF EMPTY(mdb)
          odbc_ant2000 = SQLCONNECT("ant2000",  ;
                         "ant",  ;
                         "tct1810")
     ELSE
          odbc_ant2000 = SQLCONNECT(mdb,  ;
                         "ant",  ;
                         "tct1810")
     ENDIF
     IF odbc_ant2000 < 0
          SQLSETPROP(0,  ;
                    "DispLogin",  ;
                    1)
          IF EMPTY(mdb)
               odbc_ant2000 = SQLCONNECT("ant2000",  ;
                              "ant",  ;
                              "tct1810")
          ELSE
               odbc_ant2000 = SQLCONNECT(mdb,  ;
                              "ant",  ;
                              "tct1810")
          ENDIF
     ENDIF
ENDIF
IF odbc_ant2000 < 0
     IF pub_language
          = MESSAGEBOX( ;
            "Database Connecting Error!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX("数据库连接错误！",  ;
            64,  ;
            "ANT2000人事考勤系统")
     ENDIF
     DO sysexit
ENDIF
IF SQLEXEC(odbc_ant2000,  ;
   "SELECT * FROM SYS_INI WHERE SEC='SERVER' AND VAR='DATABASE'",  ;
   "TEMP") = -1
     IF pub_language
          = MESSAGEBOX( ;
            "Database  Error!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX("数据库连接出现意外错误！",  ;
            64,  ;
            "ANT2000人事考勤系统")
     ENDIF
     DO sysexit
ENDIF
SELECT temp
USE
pub_ifrel = 0
pub_ifmove = 0
pub_ifbackup = 0
pub_level = 0
pub_database = UPPER(getantenv("SERVER",  ;
               "DATABASE"))
pub_company = getantenv("INFORMATION",  ;
              "CUSTOMER")
pub_serverpath = getantenv("SERVER",  ;
                 "ANT2000")
IF pub_banben <> "演示版"
     DO updateversion
     mv = getantenv("SYSPARA",  ;
          "VERSION")
     IF  .NOT. EMPTY(mv)
          nv = LEFT(mv, 2)
          DO CASE
               CASE nv = "M1"
                    pub_banben = "网络版 Ver" +  ;
                                 SUBSTR(mv,  ;
                                 4,  ;
                                 6)
               CASE nv = "S1"
                    pub_banben = "单机版 Ver" +  ;
                                 SUBSTR(mv,  ;
                                 4,  ;
                                 6)
               CASE nv = "PW"
                    pub_banben = "增强版 " +  ;
                                 TRIM(mv)
               OTHERWISE
                    pub_banben = "演示版"
          ENDCASE
     ENDIF
ENDIF
IF pub_banben = "演示版"
     _SCREEN.lab_demo.visible = .T.
     DO chkdate
ENDIF
DO FORM login NAME obj_form1
READ EVENTS
ENDPROC
**
*** 
*** ReFox - retrace your steps ... 
***
