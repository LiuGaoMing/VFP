RETURN
mfd = "ID integer not null,"
mfd = mfd +  ;
      "CreateTime varchar (25),"
mfd = mfd + "LogLevel integer,"
mfd = mfd +  ;
      "Operator varchar (60),"
mfd = mfd +  ;
      "Location varchar (60),"
mfd = mfd +  ;
      "Description varchar (128),constraint pf_sys_log primary key (ID)"
IF SQLEXEC(odbc_ant2000,  ;
   "select * from sys_log",  ;
   "sys_log") < 0
     sqlexec(ODBC_ANT2000,"CREATE TABLE sys_log (&mfd)")
ELSE
     SELECT sys_log
     IF FCOUNT() < 6
          SQLEXEC(odbc_ant2000,  ;
                 "drop TABLE sys_log" ;
                 )
          sqlexec(ODBC_ANT2000,"CREATE TABLE sys_log (&mfd)")
     ENDIF
ENDIF
IF SQLEXEC(odbc_ant2000,  ;
   "select * from sys_counter where xuhao=7",  ;
   "sys_counter") > 0
     SELECT sys_counter
     IF EOF()
          SQLEXEC(odbc_ant2000,  ;
                 "insert into sys_counter (xuhao,jishuqi,flag,bz) values (7,0,' ','for sys_log')" ;
                 )
     ENDIF
ENDIF
syslog(0,  ;
      '-------- 系统启动 --------',  ;
      '')
mver = getantenv("SYSPARA",  ;
       "VERSION")
IF ISNULL(mver)
     mver = ''
ENDIF
mver = STRTRAN(mver, "2006",  ;
       "2005")
merr = 0
mhd = LEFT(mver, 2)
mtl = SUBSTR(mver, 4, 50)
mrun = ''
mmsg = -1
mserial = '2.00-20031102'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3,  ;
           'PW-2.00-20030601数据表升级',  ;
           '升级开始')
     IF SQLEXEC(odbc_ant2000,  ;
        "select * from ft_time",  ;
        "ft_time") > 0
          mfd = "CD VARCHAR(3) not null,"
          mfd = mfd +  ;
                "CC VARCHAR(3) not null,"
          mfd = mfd +  ;
                "CM VARCHAR(8) default '',"
          mfd = mfd +  ;
                "KSSJ integer default 0,"
          mfd = mfd +  ;
                "ZZSJ integer default 0,"
          mfd = mfd +  ;
                "DJ DOUBLE PRECISION DEFAULT 0,"
          mfd = mfd +  ;
                "JB VARCHAR(200) default '',"
          mfd = mfd +  ;
                "BC VARCHAR(200) default '',constraint pf_ft_time primary key (CD,CC)"
          SQLEXEC(odbc_ant2000,  ;
                 "drop TABLE ft_time" ;
                 )
          SQLEXEC(odbc_ant2000,  ;
                 "CREATE TABLE ft_time (" +  ;
                 mfd + ")")
          SELECT ft_time
          hasjb = .F.
          FOR i = 1 TO  ;
              FCOUNT("ft_time")
               IF ALLTRIM(UPPER(FIELD(i))) ==  ;
                  "JB"
                    hasjb = .T.
                    EXIT
               ENDIF
          ENDFOR
          SCAN
               IF hasjb
                    tmp_jb = ALLTRIM(ft_time.jb)
               ELSE
                    tmp_jb = ""
               ENDIF
               IF FIELD(1) = 'CD'  ;
                  .AND.  .NOT.  ;
                  EMPTY(cd)
                    tmp_cd = ALLTRIM(ft_time.cd)
               ELSE
                    tmp_cd = ""
               ENDIF
               SQLEXEC(odbc_ant2000,  ;
                      "insert into ft_time (cd,cc,cm,kssj,zzsj,dj,bc,jb) values (?tmp_cd,?cc,?cm,?kssj,?zzsj,?dj,?bc,?tmp_jb)" ;
                      )
          ENDSCAN
     ENDIF
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE rs_cd_ydyy" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE rs_cd_ydyy (yy varchar(50),idx integer)" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table RS_SEARCH_TAIL add seq integer" ;
            )
     IF SQLEXEC(odbc_ant2000,  ;
        "select * from RS_SEARCH_TAIL",  ;
        "RS_SEARCH_TAIL") > -1
          SELECT rs_search_tail
          REPLACE seq WITH  ;
                  RECNO() ALL
          SCAN
               SQLEXEC(odbc_ant2000,  ;
                      "update RS_SEARCH_TAIL set seq=?seq where xuhao=?xuhao and name=?name" ;
                      )
          ENDSCAN
          USE
     ENDIF
     mfd = ""
     mfd = mfd +  ;
           "ZGBH       VARCHAR(10)  not null,"
     mfd = mfd +  ;
           "XW         INTEGER  not null,"
     mfd = mfd +  ;
           "MC         VARCHAR(30)  default '',"
     mfd = mfd +  ;
           "XZ         INTEGER  default 0,"
     mfd = mfd +  ;
           "XKB        VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "ZY         VARCHAR(10)  not null,"
     mfd = mfd +  ;
           "BIYIE      INTEGER  default 0,"
     mfd = mfd +  ;
           "KSRQ       VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "ZZRQ       VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "YX         INTEGER  default 0"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE tmp_rs_xl" ;
            )
     IF SQLEXEC(odbc_ant2000,  ;
        "CREATE TABLE tmp_rs_xl (" +  ;
        mfd + ")") > -1
          IF SQLEXEC(odbc_ant2000,  ;
             "insert into tmp_rs_xl select * from rs_xl" ;
             ) > -1
               mfd = ""
               mfd = mfd +  ;
                     "ZGBH       VARCHAR(10)  not null,"
               mfd = mfd +  ;
                     "XW         INTEGER  not null,"
               mfd = mfd +  ;
                     "MC         VARCHAR(30)  default '',"
               mfd = mfd +  ;
                     "XZ         INTEGER  default 0,"
               mfd = mfd +  ;
                     "XKB        VARCHAR(10)  default '',"
               mfd = mfd +  ;
                     "ZY         VARCHAR(20)  not null,"
               mfd = mfd +  ;
                     "BIYIE      INTEGER  default 0,"
               mfd = mfd +  ;
                     "KSRQ       VARCHAR(10)  default '',"
               mfd = mfd +  ;
                     "ZZRQ       VARCHAR(10)  default '',"
               mfd = mfd +  ;
                     "YX         INTEGER  default 0,constraint PF_xl primary key (zgbh,xw,zy)"
               SQLEXEC(odbc_ant2000,  ;
                      "DROP TABLE RS_XL" ;
                      )
               IF SQLEXEC(odbc_ant2000,  ;
                  "CREATE TABLE rs_xl (" +  ;
                  mfd + ")") > - ;
                  1
                    IF SQLEXEC(odbc_ant2000,  ;
                       "insert into rs_xl select * from tmp_rs_xl" ;
                       ) > -1
                         SQLEXEC(odbc_ant2000,  ;
                                "DROP TABLE tmp_rs_xl" ;
                                )
                    ENDIF
               ENDIF
          ENDIF
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table rs_bm add GW VARCHAR(254) default ''" ;
        ) < 0
          SQLEXEC(odbc_ant2000,  ;
                 "alter table rs_bm drop GW" ;
                 )
          SQLEXEC(odbc_ant2000,  ;
                 "alter table rs_bm add GW VARCHAR(254) default ''" ;
                 )
     ENDIF
     SQLEXEC(odbc_ant2000,  ;
            "update rs_bm set GW='' where gw is null" ;
            )
     mfd = "ZGBH     VARCHAR(10) not null PRIMARY KEY,"
     mfd = mfd +  ;
           "BIRTHDAY VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "AGE      INTEGER  default 0,"
     mfd = mfd +  ;
           "HEIGHT   INTEGER  default 0,"
     mfd = mfd +  ;
           "WEIGHT   INTEGER  default 0,"
     mfd = mfd +  ;
           "EYELEFT  VARCHAR(3)  default '',"
     mfd = mfd +  ;
           "EYERIGHT VARCHAR(3)  default '',"
     mfd = mfd +  ;
           "HY       INTEGER  default 0,"
     mfd = mfd +  ;
           "XX       VARCHAR(2)  default '',"
     mfd = mfd +  ;
           "SFZH     VARCHAR(18)  default '',"
     mfd = mfd +  ;
           "HJ       VARCHAR(40)  default '',"
     mfd = mfd +  ;
           "DAD      VARCHAR(30)  default '',"
     mfd = mfd +  ;
           "YY       VARCHAR(30)  default '',"
     mfd = mfd +  ;
           "BD       INTEGER  default 0,"
     mfd = mfd +  ;
           "HK       INTEGER  default 0,"
     mfd = mfd +  ;
           "JG       VARCHAR(30)  default '',"
     mfd = mfd +  ;
           "ZZMM     INTEGER  default 0,"
     mfd = mfd +  ;
           "ZC       VARCHAR(20)  default '',"
     mfd = mfd +  ;
           "JRSJ     VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "ZHICHENG VARCHAR(20)  default '',"
     mfd = mfd +  ;
           "ZZZBH    VARCHAR(20)  default '',"
     mfd = mfd +  ;
           "ZZZRQ    VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "YWSYZ    INTEGER  default 0,"
     mfd = mfd +  ;
           "SYZBH    VARCHAR(20)  default '',"
     mfd = mfd +  ;
           "SYZKSRQ  VARCHAR(10)  default '',"
     mfd = mfd +  ;
           "SYZZZRQ  VARCHAR(10)  default ''"
     SQLEXEC(odbc_ant2000,  ;
            "DROP TABLE tmp")
     SQLEXEC(odbc_ant2000,  ;
            "create TABLE tmp(" +  ;
            mfd + ")")
     IF SQLEXEC(odbc_ant2000,  ;
        "insert into tmp(ZGBH,BIRTHDAY,AGE,HEIGHT,WEIGHT,EYELEFT,EYERIGHT,HY,XX,SFZH,HJ,DAD,YY,BD,HK,JG,ZZMM,ZC,JRSJ,ZHICHENG,ZZZBH,ZZZRQ,YWSYZ,SYZBH)" +  ;
        " select ZGBH,BIRTHDAY,AGE,HEIGHT,WEIGHT,EYELEFT,EYERIGHT,HY,XX,SFZH,HJ,DAD,YY,BD,HK,JG,ZZMM,ZC,JRSJ,ZHICHENG,ZZZBH,ZZZRQ,YWSYZ,SYZBH from rs_gr" ;
        ) = 1
          SQLEXEC(odbc_ant2000,  ;
                 "DROP TABLE RS_GR" ;
                 )
          SQLEXEC(odbc_ant2000,  ;
                 "CREATE TABLE rs_gr (" +  ;
                 mfd + ")")
          SQLEXEC(odbc_ant2000,  ;
                 "insert into rs_gr(ZGBH,BIRTHDAY,AGE,HEIGHT,WEIGHT,EYELEFT,EYERIGHT,HY,XX,SFZH,HJ,DAD,YY,BD,HK,JG,ZZMM,ZC,JRSJ,ZHICHENG,ZZZBH,ZZZRQ,YWSYZ,SYZBH)" +  ;
                 " select ZGBH,BIRTHDAY,AGE,HEIGHT,WEIGHT,EYELEFT,EYERIGHT,HY,XX,SFZH,HJ,DAD,YY,BD,HK,JG,ZZMM,ZC,JRSJ,ZHICHENG,ZZZBH,ZZZRQ,YWSYZ,SYZBH from tmp" ;
                 )
     ENDIF
     mfd = "CODE INTEGER not null PRIMARY KEY,"
     mfd = mfd +  ;
           "NAME VARCHAR(40)  default ''"
     SQLEXEC(odbc_ant2000,  ;
            "DROP TABLE tmp")
     SQLEXEC(odbc_ant2000,  ;
            "create TABLE tmp(" +  ;
            mfd + ")")
     IF SQLEXEC(odbc_ant2000,  ;
        "insert into tmp(code,name) select code,name from rs_cd_hj" ;
        ) = 1
          SQLEXEC(odbc_ant2000,  ;
                 "DROP TABLE RS_cd_hj" ;
                 )
          SQLEXEC(odbc_ant2000,  ;
                 "CREATE TABLE rs_cd_hj (" +  ;
                 mfd + ")")
          SQLEXEC(odbc_ant2000,  ;
                 "insert into rs_cd_hj(code,name) select code,name from tmp" ;
                 )
     ENDIF
     mfd = "code VARCHAR(3)  not null,"
     mfd = mfd +  ;
           "riqi VARCHAR(10) not null,"
     mfd = mfd +  ;
           "bc   VARCHAR(3)  default '',"
     mfd = mfd +  ;
           "jjr  VARCHAR(10) default '',"
     mfd = mfd +  ;
           "constraint pk_kq_shiftplan primary key (code,riqi)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_ShiftPlan" ;
            )
     sqlexec(ODBC_ANT2000,"CREATE TABLE kq_ShiftPlan (&mfd)")
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/01','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/02','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/03','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/04','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/05','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/06','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/07','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/08','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/09','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/10','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/11','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/12','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/13','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/14','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/15','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/16','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/17','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/18','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/19','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/20','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/21','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/22','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/23','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/24','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/25','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/26','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/27','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/28','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/29','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/30','01','')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into kq_ShiftPlan (code,riqi,bc,jjr) values ('1','2003/01/31','01','')" ;
            )
     mfd = "classid	varchar(1) not null primary key,"
     mfd = mfd +  ;
           "name		varchar(50),"
     mfd = mfd +  ;
           "cycleyears	integer,"
     mfd = mfd +  ;
           "clearmode	integer,"
     mfd = mfd +  ;
           "takemode	integer,"
     mfd = mfd +  ;
           "fixyear	integer,"
     mfd = mfd +  ;
           "fixmonth	integer,"
     mfd = mfd +  ;
           "CheckDay	integer,"
     mfd = mfd +  ;
           "maxdays	float default 0"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_nj_sh" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE kq_nj_sh (" +  ;
            mfd + ")")
     mfd = "classid	varchar(1) not null,"
     mfd = mfd +  ;
           "years		integer not null,"
     mfd = mfd +  ;
           "months		integer not null,"
     mfd = mfd +  ;
           "days		float default 0,"
     mfd = mfd +  ;
           "delta		float default 0,"
     mfd = mfd +  ;
           "notes		varchar(50),"
     mfd = mfd +  ;
           "Primary Key (classid,years,months)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_nj_st" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE kq_nj_st (" +  ;
            mfd + ")")
     mfd = "ZGBH VARCHAR(10) not null,"
     mfd = mfd +  ;
           "ND INTEGER not null,"
     mfd = mfd +  ;
           "YF INTEGER not null,"
     mfd = mfd + "NY varchar(6),"
     mfd = mfd +  ;
           "LJTS float default 0,"
     mfd = mfd +  ;
           "XSTS float default 0,"
     mfd = mfd +  ;
           "SYTS float default 0,"
     mfd = mfd +  ;
           "MARKDATE varchar(4),"
     mfd = mfd +  ;
           "MARKAGE varchar(4),"
     mfd = mfd +  ;
           "MARKINIT varchar(6) default '',"
     mfd = mfd +  ;
           "primary key (zgbh,nd,yf)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_nj_0" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE kq_nj_0 (" +  ;
            mfd + ")")
     mfd = ""
     mfd = mfd +  ;
           "ZGBH    VARCHAR(10) not null,"
     mfd = mfd +  ;
           "ND      INTEGER not null,"
     mfd = mfd +  ;
           "YF      INTEGER not null,"
     mfd = mfd + "NY varchar(6),"
     mfd = mfd +  ;
           "LJTS    FLOAT default 0,"
     mfd = mfd +  ;
           "WXHTS   FLOAT default 0,"
     mfd = mfd +  ;
           "constraint pf_nj_1 primary key (zgbh,nd,yf)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_nj_1" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE kq_nj_1 (" +  ;
            mfd + ")")
     mfd = "alter table kq_zg add NJLB VARCHAR(1) default ' ' "
     SQLEXEC(odbc_ant2000, mfd)
     SQLEXEC(odbc_ant2000,  ;
            "update kq_zg set njlb=' '" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_zg add qf varchar(1) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "update kq_zg set qf=''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ36','年假规定')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "INSERT INTO SYS_CD_SCREEN (HMBH,HMMC) VALUES ('3AKQ361','年假类别定义')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('KQNJ','NJ_AUTO','N','0')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('KQNJ','NJ_MARKINIT','C','')" ;
            )
     mfd = ""
     mfd = mfd +  ;
           "CODE        varchar(3) not null PRIMARY KEY,"
     mfd = mfd +  ;
           "DESCRIPTION VARCHAR(50)  default '',"
     mfd = mfd +  ;
           "MACHINES    VARCHAR(100) default ''"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE ft_place" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE ft_place (" +  ;
            mfd + ")")
     mfd = "HMBH VARCHAR(20) NOT NULL,"
     mfd = mfd +  ;
           "XMID VARCHAR(20) NOT NULL,"
     mfd = mfd +  ;
           "XMMC VARCHAR(20),"
     mfd = mfd +  ;
           "FLAG INTEGER NOT NULL,"
     mfd = mfd +  ;
           "STRVAL VARCHAR(255),"
     mfd = mfd +  ;
           "constraint pf_sys_cd_item primary key (hmbh,xmid,flag)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE sys_cd_item " ;
            )
     sqlexec(ODBC_ANT2000,"CREATE TABLE  sys_cd_item (&mfd)")
     SQLEXEC(odbc_ant2000,  ;
            "insert into sys_cd_item (hmbh,xmid,xmmc,flag,strval) values ('3ars11','dh','搭伙',1,'3')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into sys_cd_item (hmbh,xmid,xmmc,flag,strval) values ('3ars11','gw','岗位',1,'120')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into sys_cd_item (hmbh,xmid,xmmc,flag,strval) values ('3ars11','zw','职务',1,'37')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_lskh add yxks varchar(10) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_lskh add yxjs varchar(10) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "update kq_lskh set yxks='',yxjs=''" ;
            )
     mfd = "code VARCHAR(3) not null,"
     mfd = mfd +  ;
           "sdate VARCHAR(10) not null,"
     mfd = mfd +  ;
           "edate VARCHAR(10) default ' ',"
     mfd = mfd +  ;
           "bc VARCHAR(3) default ' ',"
     mfd = mfd +  ;
           "constraint pk_kq_shiftModify primary key (code,sdate)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_ShiftModify" ;
            )
     sqlexec(ODBC_ANT2000,"CREATE TABLE kq_ShiftModify (&mfd)")
     mfd = "code  VARCHAR(3) not null constraint pk_kq_shifttype PRIMARY KEY,"
     mfd = mfd +  ;
           "class VARCHAR(50) default '',"
     mfd = mfd +  ;
           "cycle integer default 0"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE kq_ShiftType" ;
            )
     sqlexec(ODBC_ANT2000,"CREATE TABLE kq_ShiftType (&mfd)")
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_time add zjks1 integer" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_time add zjjs1 integer" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_time add zjxx1 integer" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "update kq_time set zjks1=0,zjjs1=0,zjxx1=0" ;
            )
     mrun = 'PW-' + mserial
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030615'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030615"
     syslog(3,  ;
           'PW-2.00-20030615数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_clfx add planbc varchar(3) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FXPARA','XRSKERR','N','0')" ;
            )
     mrun = 'PW-2.00-20030615'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030623'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030623"
     syslog(3,  ;
           'PW-2.00-20030623数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('KQGD','SJDAYS','N','10')" ;
            )
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_zg add qf varchar(1) default ''" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_zg set qf=''" ;
                 )
     ENDIF
     mrun = 'PW-2.00-20030623'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030716'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030716"
     syslog(3,  ;
           'PW-2.00-20030716数据表升级',  ;
           '升级开始')
     mfd = "ZGBH   VARCHAR(10)  NOT NULL,"
     mfd = mfd +  ;
           "RIQI   VARCHAR(10)  NOT NULL,"
     mfd = mfd +  ;
           "BC     VARCHAR(3)  default '',"
     mfd = mfd +  ;
           "KSSK   integer NOT NULL,"
     mfd = mfd +  ;
           "JSSK   integer default 0,"
     mfd = mfd +  ;
           "JCSJ   integer default 0,"
     mfd = mfd +  ;
           "CC     VARCHAR(3)  default '',"
     mfd = mfd +  ;
           "PlACE  VARCHAR(3)  default '',"
     mfd = mfd +  ;
           "ST     integer default 0"
     mflag = .T.
     IF SQLEXEC(odbc_ant2000,  ;
        "select * from ft_jcfx",  ;
        "ft_jcfx") > 0
          hasplace = .F.
          FOR i = 1 TO  ;
              FCOUNT("ft_jcfx")
               IF UPPER(ALLTRIM(FIELD(i,  ;
                  "ft_jcfx"))) ==  ;
                  "PLACE"
                    hasplace = .T.
                    EXIT
               ENDIF
          ENDFOR
          IF hasplace
               tmp_place = "place"
          ELSE
               tmp_place = "''"
          ENDIF
          SQLEXEC(odbc_ant2000,  ;
                 "drop TABLE tmp" ;
                 )
          IF SQLEXEC(odbc_ant2000,  ;
             "CREATE TABLE tmp (" +  ;
             mfd + ")") > 0
               IF SQLEXEC(odbc_ant2000,  ;
                  "insert into tmp(zgbh,riqi,bc,kssk,jssk,jcsj,cc,place,st) select zgbh,riqi,bc,kssk,jssk,jcsj,cc," +  ;
                  tmp_place +  ;
                  ",st from ft_jcfx " ;
                  ) > 0
                    SQLEXEC(odbc_ant2000,  ;
                           "drop table ft_jcfx" ;
                           )
                    IF SQLEXEC(odbc_ant2000,  ;
                       "CREATE TABLE ft_jcfx (" +  ;
                       mfd + ")") >  ;
                       0
                         IF SQLEXEC(odbc_ant2000,  ;
                            "insert into ft_jcfx (zgbh,riqi,bc,kssk,jssk,jcsj,cc,place,st) select zgbh,riqi,bc,kssk,jssk,jcsj,cc,place,st from tmp" ;
                            ) <  ;
                            0
                              syslog(3,  ;
                               'ft_jcfx数据表升级',  ;
                               '插入备份记录错误')
                              mflag =  ;
                               .F.
                         ENDIF
                         SQLEXEC(odbc_ant2000,  ;
                                "drop table tmp" ;
                                )
                    ELSE
                         syslog(3,  ;
                               'ft_jcfx数据表升级',  ;
                               '新表创建错误')
                         mflag = .F.
                    ENDIF
               ELSE
                    syslog(3,  ;
                          'ft_jcfx数据表升级',  ;
                          '备份记录保存错误')
                    mflag = .F.
               ENDIF
          ELSE
               syslog(3,  ;
                     'ft_jcfx数据表升级',  ;
                     '备份表创建错误')
               mflag = .F.
          ENDIF
     ELSE
          SQLEXEC(odbc_ant2000,  ;
                 "CREATE TABLE ft_jcfx (" +  ;
                 mfd + ")")
     ENDIF
     IF  .NOT. mflag
          WAIT WINDOW  ;
               "升级数据库失败，请与供应商联系。"
          QUIT
     ENDIF
     mrun = 'PW-2.00-20030716'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030814'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030814"
     syslog(3,  ;
           'PW-2.00-20030814数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "alter table rs_bm add NODEID VARCHAR(20) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_bm add NODEID VARCHAR(20) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table gz_bm add NODEID VARCHAR(20) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "alter table ft_bm add NODEID VARCHAR(20) default ''" ;
            )
     mfd = "name varchar(50) default ' ',"
     mfd = mfd +  ;
           "name_e varchar(50) default ' ',"
     mfd = mfd +  ;
           "name_j varchar(6) default ' '	,"
     mfd = mfd +  ;
           "dep_level varchar(6) default ' ',"
     mfd = mfd +  ;
           "unused smallint default 0,"
     mfd = mfd +  ;
           "showman smallint default 0,"
     mfd = mfd +  ;
           "showrs smallint default 0,"
     mfd = mfd +  ;
           "PaperType varchar(10) default 'A4',"
     mfd = mfd +  ;
           "Orientation smallint default 0,"
     mfd = mfd +  ;
           "TopMargin DOUBLE PRECISION default 10.0,"
     mfd = mfd +  ;
           "BottomMargin DOUBLE PRECISION default 10.0,"
     mfd = mfd +  ;
           "LeftMargin DOUBLE PRECISION default 10.0,"
     mfd = mfd +  ;
           "RightMargin DOUBLE PRECISION default 10.0,"
     mfd = mfd +  ;
           "TitleFont varchar(16) default '黑体,16,N',"
     mfd = mfd +  ;
           "TextFont varchar(16) default '宋体,8,N',"
     mfd = mfd +  ;
           "PrintIOData smallint default 0,"
     mfd = mfd +  ;
           "PrintRankData smallint default 0"
     mfd1 = "code varchar(2)," +  ;
            mfd
     mfd = "code varchar(2) not null constraint pk_sys_company primary key," +  ;
           mfd
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE tmp")
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE tmp (" +  ;
            mfd1 + ")")
     SQLEXEC(odbc_ant2000,  ;
            "insert into tmp(code,name,name_e,name_j,dep_level,unused) select code,name,name_e,name_j,dep_level,unused from sys_company" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE sys_company" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE sys_company (" +  ;
            mfd + ")")
     SQLEXEC(odbc_ant2000,  ;
            "insert into sys_company(code,name,name_e,name_j,dep_level,unused) select code,name,name_e,name_j,dep_level,unused from tmp" ;
            )
     mfd = "code varchar(2) not null,"
     mfd = mfd +  ;
           "nodeid varchar(20) not null,"
     mfd = mfd +  ;
           "bmmc varchar(40),"
     mfd = mfd +  ;
           "xm1 varchar(10),"
     mfd = mfd +  ;
           "rank1 varchar(20),"
     mfd = mfd +  ;
           "jz1 smallint default 0,"
     mfd = mfd +  ;
           "xm2 varchar(10),"
     mfd = mfd +  ;
           "rank2 varchar(20),"
     mfd = mfd +  ;
           "jz2 smallint default 0,"
     mfd = mfd +  ;
           "constraint PK_sys_organization primary key(code,nodeid)"
     SQLEXEC(odbc_ant2000,  ;
            "drop TABLE sys_organization" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "CREATE TABLE sys_organization (" +  ;
            mfd + ")")
     mrun = 'PW-2.00-20030814'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030825'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030814"
     syslog(3,  ;
           'PW-2.00-20030825数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "alter table ft_ardata add Invalid varchar(1) default ''" ;
            )
     mrun = 'PW-2.00-20030825'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030901'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030901"
     syslog(3,  ;
           'PW-2.00-20030901数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FXPARA','DELTA4ERR','N','0')" ;
            )
     mrun = 'PW-2.00-20030901'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030904'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030904"
     syslog(3,  ;
           'PW-2.00-20030904数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FXPARA','SHIFTPLAN','N','0')" ;
            )
     mrun = 'PW-2.00-20030904'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20030909'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20030909"
     syslog(3,  ;
           'PW-2.00-20030909数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FXPARA','NOXRSK','N','0')" ;
            )
     mrun = 'PW-2.00-20030909'
ENDIF
mserial = '2.00-20031008'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, 'PW-' + mserial +  ;
           '数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "Alter table rs_yd add sxrq varchar(10) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "Alter table rs_yd add flag varchar(1) default ''" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "update rs_yd set sxrq=riqi where sxrq is null" ;
            )
     mrun = 'PW-' + mserial
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20031019'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20031019"
     syslog(3,  ;
           'PW-2.00-20031019数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "alter table kq_xjjl_d add attr integer default 0" ;
            )
     mrun = 'PW-2.00-20031019'
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20031028'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20031028"
     syslog(3,  ;
           'PW-2.00-20031028数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('GZGD','SJDAYS','N','10')" ;
            )
     mrun = 'PW-2.00-20031028'
ENDIF
mserial = '2.00-20031101'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     IF merr = 0 .AND.  ;
        SQLEXEC(odbc_ant2000,  ;
        "alter table kq_zg alter column QF VARCHAR(2)" ;
        ) < 0
          IF merr = 0 .AND.  ;
             SQLEXEC(odbc_ant2000,  ;
             "alter table kq_zg add QF_BAK VARCHAR(2)" ;
             ) < 0
               merr = 1
          ENDIF
          IF merr = 0 .AND.  ;
             SQLEXEC(odbc_ant2000,  ;
             "update kq_zg set QF_BAK=QF" ;
             ) < 0
               merr = 2
          ENDIF
          IF merr = 0 .AND.  ;
             SQLEXEC(odbc_ant2000,  ;
             "alter table kq_zg drop QF" ;
             ) < 0
               merr = 3
          ENDIF
          IF merr = 0 .AND.  ;
             SQLEXEC(odbc_ant2000,  ;
             "alter table kq_zg add QF VARCHAR(2) default ''" ;
             ) < 0
               merr = 4
          ENDIF
          IF merr = 0 .AND.  ;
             SQLEXEC(odbc_ant2000,  ;
             "update kq_zg set QF=QF_BAK" ;
             ) < 0
               merr = 5
          ENDIF
          IF merr = 0 .AND.  ;
             SQLEXEC(odbc_ant2000,  ;
             "alter table kq_zg drop QF_BAK" ;
             ) < 0
               merr = 6
          ENDIF
     ENDIF
     IF merr > 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail! ErrNo=' +  ;
                LTRIM(STR(merr)),  ;
                '升级开始')
          WAIT WINDOW 'PW-' +  ;
               mserial +  ;
               " 数据表升级失败! ErrNo=" +  ;
               LTRIM(STR(merr))
          QUIT
     ELSE
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_zg set QF='' where QF is null" ;
                 )
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Ok!',  ;
                '升级开始')
     ENDIF
     mrun = 'PW-' + mserial
ENDIF
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < '2.00-20031126'
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-2.00-20031126"
     syslog(3,  ;
           'PW-2.00-20031126数据表升级',  ;
           '升级开始')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('3AKQ','DEFAULT-DISPBCTIME','N','1')" ;
            )
     mrun = 'PW-2.00-20031126'
ENDIF
mserial = '2.00-20040724'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, 'PW-' + mserial +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_nj_sh add maxrate float" ;
        ) < 0
          syslog(3, mver +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_nj_sh add maxrate float' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_nj_sh add kqrepno integer" ;
        ) < 0
          syslog(3, mver +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_nj_sh add kqrepno integer' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_nj_sh add kqrepfd integer" ;
        ) < 0
          syslog(3, mver +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_nj_sh add kqrepfd integer' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_nj_sh add cpuyear integer" ;
        ) < 0
          syslog(3, mver +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_nj_sh add cpuyear integer' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
     mrun = 'PW-' + mserial
ENDIF
mserial = '2.00-20040109'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, 'PW-' + mserial +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_cd_gyxz add bx varchar(1)" ;
        ) < 0
          syslog(3, mver +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_cd_gyxz add bx varchar(1)' ;
                )
          merr = 1
     ELSE
          = SQLEXEC(odbc_ant2000,  ;
            "update sys_cd_gyxz set bx=' '" ;
            )
     ENDIF
     IF merr = 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
     mrun = 'PW-' + mserial
ENDIF
mserial = '2.00-20040220'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, 'PW-' + mserial +  ;
           ' 数据表升级', '')
     mfd = "create table rs_inout (yyyymm varchar(6) not null,"
     mfd = mfd +  ;
           "bmbh varchar(6) not null,"
     mfd = mfd + "base integer,"
     mfd = mfd + "plus integer,"
     mfd = mfd + "minus integer,"
     mfd = mfd + "last integer,"
     mfd = mfd + "curr integer,"
     mfd = mfd + "entry integer,"
     mfd = mfd +  ;
           "callin integer,"
     mfd = mfd + "leave integer,"
     mfd = mfd +  ;
           "callout integer,"
     mfd = mfd +  ;
           "constraint pk_rs_inout primary key (yyyymm,bmbh))"
     IF SQLEXEC(odbc_ant2000,  ;
        mfd) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                mfd)
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table rs_bm add base integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table rs_bm add base integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table rs_bm add plus integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table rs_bm add plus integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table rs_bm add minus integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table rs_bm add minus default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "Alter table rs_yd add oldcode varchar(10) default ''" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                "Alter table rs_yd add oldcode varchar(10) default ''" ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "Alter table rs_yd add chgtype varchar(1) default ''" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                "Alter table rs_yd add chgtype varchar(1) default ''" ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_ZGBH0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_ZGBH0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_MONTH0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_MONTH0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_DAY0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_DAY0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_HOUR0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_HOUR0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_MINUTE0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_MINUTE0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_WEEK0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_WEEK0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_INOUT0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_INOUT0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_ID0 integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_MINUTE0 integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_FLAG integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_FLAG integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_SEPERATOR varchar(1) default ' '" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_SEPERATOR varchar(1) default " "' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_kzgs add DAT_SKIPLINES integer default 0" ;
        ) < 0
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Fail!',  ;
                'alter table sys_kzgs add DAT_SKIPLINES integer default 0' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          = SQLEXEC(odbc_ant2000,  ;
            "update rs_bm set base=0,plus=0,minus=0" ;
            )
          = SQLEXEC(odbc_ant2000,  ;
            "update rs_yd set oldcode='',chgtype=''" ;
            )
          = SQLEXEC(odbc_ant2000,  ;
            "update sys_kzgs set DAT_ZGBH0=0,DAT_MONTH0=0,DAT_DAY0=0,DAT_HOUR0=0,DAT_MINUTE0=0,DAT_WEEK0=0,DAT_INOUT0=0,DAT_ID0=0,DAT_FLAG=0,DAT_SEPERATOR=' ',DAT_SKIPLINES=0" ;
            )
          syslog(3, 'PW-' +  ;
                mserial +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
     mrun = 'PW-' + mserial
ENDIF
mserial = '2.00-20040329'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        'alter table rs_zg add flag integer default 1' ;
        ) < 0
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table rs_zg add flag integer default 1' ;
                )
          merr = 1
     ELSE
          = SQLEXEC(odbc_ant2000,  ;
            'update rs_zg set flag=1' ;
            )
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20040332'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     mfd = "code varchar(2),rid integer,"
     mfd = mfd +  ;
           "rank01 varchar(50),name01 varchar(50),"
     mfd = mfd +  ;
           "rank02 varchar(50),name02 varchar(50),"
     mfd = mfd +  ;
           "rank03 varchar(50),name03 varchar(50),"
     mfd = mfd +  ;
           "rank04 varchar(50),name04 varchar(50),"
     mfd = mfd +  ;
           "rank05 varchar(50),name05 varchar(50),"
     mfd = mfd +  ;
           "rank06 varchar(50),name06 varchar(50),"
     mfd = mfd +  ;
           "rank07 varchar(50),name07 varchar(50),"
     mfd = mfd +  ;
           "rank08 varchar(50),name08 varchar(50),"
     mfd = mfd +  ;
           "rank09 varchar(50),name09 varchar(50),"
     mfd = mfd +  ;
           "rank10 varchar(50),name10 varchar(50),"
     mfd = mfd +  ;
           "note varchar(100),nodeid varchar(20),"
     mfd = mfd +  ;
           "rel_row integer,rel_col integer"
     IF SQLEXEC(odbc_ant2000,  ;
        "drop TABLE tmp_org") >  ;
        0
          IF SQLEXEC(odbc_ant2000,  ;
             "CREATE TABLE tmp_org (" +  ;
             mfd + ")") < 0
               syslog(3, mrun +  ;
                     ' 数据表升级 Fail!',  ;
                     'CREATE TABLE tmp_org (' +  ;
                     mfd + ')')
               merr = 1
          ENDIF
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'drop TABLE tmp_org' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20040405'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' sys_company数据表升级',  ;
           '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_company add totalflag integer default 0" ;
        ) > 0
          IF SQLEXEC(odbc_ant2000,  ;
             "update sys_company set totalflag=0" ;
             ) < 0
               syslog(3, mrun +  ;
                     ' sys_company数据表升级 Fail!',  ;
                     'update sys_company set totalflag=0' ;
                     )
               merr = 1
          ENDIF
     ELSE
          syslog(3, mrun +  ;
                ' sys_company数据表升级 Fail!',  ;
                'alter table sys_company add totalflag integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table sys_company add totalpos integer default 0" ;
        ) > 0
          IF SQLEXEC(odbc_ant2000,  ;
             "update sys_company set totalpos=0" ;
             ) < 0
               syslog(3, mrun +  ;
                     ' sys_company数据表升级 Fail!',  ;
                     'update sys_company set totalpos=0' ;
                     )
               merr = 1
          ENDIF
     ELSE
          syslog(3, mrun +  ;
                ' sys_company数据表升级 Fail!',  ;
                'alter table sys_company add totalpos integer default 0' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20040525'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' rs_bxbl数据表升级',  ;
           '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table rs_bxbl add minbase float default 0" ;
        ) > 0
          IF SQLEXEC(odbc_ant2000,  ;
             "update rs_bxbl set minbase=0" ;
             ) < 0
               syslog(3, mrun +  ;
                     ' rs_bxbl数据表升级 Fail!',  ;
                     'update rs_bxbl set minbase=0' ;
                     )
               merr = 1
          ENDIF
     ELSE
          syslog(3, mrun +  ;
                ' rs_bxbl数据表升级 Fail!',  ;
                'alter table rs_bxbl add minbase float default 0' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20040527'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' kq_kqlb数据表升级',  ;
           '')
     IF SQLEXEC(odbc_ant2000,  ;
        "update kq_kqlb set disp=0 where lbbh>=70 and lbbh<=72" ;
        ) < 0
          syslog(3, mrun +  ;
                ' kq_kqlb数据表升级 Fail!',  ;
                'update kq_kqlb set disp=0 where lbbh>=70 and lbbh<=72' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20040530'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_time add bcmark varchar(4) default ' '" ;
        ) < 0
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_time add bcmark varchar(4) default " "' ;
                )
          merr = 1
     ELSE
          = SQLEXEC(odbc_ant2000,  ;
            "update kq_time set bcmark=' '" ;
            )
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_kqlb add kqmark varchar(4) default ' '" ;
        ) < 0
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_kqlb add kqmark varchar(4) default " "' ;
                )
          merr = 1
     ELSE
          = SQLEXEC(odbc_ant2000,  ;
            "update kq_kqlb set kqmark=' '" ;
            )
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20040628'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     mfd = "CODE INTEGER NOT NULL PRIMARY KEY,"
     mfd = mfd +  ;
           "NAME VARCHAR(20)"
     SQLEXEC(odbc_ant2000,  ;
            "DROP TABLE SYS_CD_ZJ" ;
            )
     if sqlexec(ODBC_ANT2000,"CREATE TABLE sys_cd_zj (&mfd)")>0;

          SQLEXEC(odbc_ant2000,  ;
                 "INSERT INTO SYS_CD_zj (CODE,NAME) VALUES (0,' ')" ;
                 )
          SQLEXEC(odbc_ant2000,  ;
                 "INSERT INTO SYS_CD_zj (CODE,NAME) VALUES (1,'直接')" ;
                 )
          SQLEXEC(odbc_ant2000,  ;
                 "INSERT INTO SYS_CD_zj (CODE,NAME) VALUES (2,'间接')" ;
                 )
     ENDIF
ENDIF
mserial = '2.00-20040902'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
ENDIF
mserial = '2.00-20040915'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table ft_time add jbmin integer default 0" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update ft_time set jbmin=0" ;
                 )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table ft_time add jbmin integer default 0' ;
                )
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table ft_time add jbmin integer default 0' ;
                )
     ENDIF
ENDIF
mserial = '2.00-20040926'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_replist add toplines integer default 0" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_replist set toplines=0" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table kq_replist add toplines integer default 0' ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_replist add toplines integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_replist add optsort integer default 1" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_replist set optsort=1" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table kq_replist add optsort integer default 1' ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_replist add optsort integer default 1' ;
                )
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20041115'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_dtime add flag varchar(4) default '一般'" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_dtime set flag='一般'" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table kq_dtime add flag varchar(4) default "一般"' ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_dtime add flag varchar(4) default "一般"' ;
                )
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050223'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table kq_nj_sh add optround integer default 1" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_nj_sh set optround=1" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table kq_nj_sh add optround integer default 1' ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table kq_nj_sh add optround integer default 1' ;
                )
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050303'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table ft_lskh add yxks varchar(10) default '',add yxjs varchar(10) default ''" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update ft_lskh set yxks=' ',yxjs=' '" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                "alter table ft_lskh add yxks varchar(10) default '',add yxjs varchar(10) default ''" ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                "alter table ft_lskh add yxks varchar(10) default '',add yxjs varchar(10) default ''" ;
                )
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050309'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table ft_zg add zglb varchar(3) default ''" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update ft_zg set zglb=' '" ;
                 )
          IF pub_extension = 1
               SQLEXEC(odbc_ant2000,  ;
                      "update ft_zg set zglb='1'" ;
                      )
               SQLEXEC(odbc_ant2000,  ;
                      "update ft_zg set zglb='2' where zgbh like '5%'" ;
                      )
               SQLEXEC(odbc_ant2000,  ;
                      "update ft_zg set zglb='3' where zgbh like 'LS-%'" ;
                      )
               SQLEXEC(odbc_ant2000,  ;
                      "update ft_zg set zglb='4' where zgbh like 'LS-9%'" ;
                      )
          ENDIF
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                "alter table ft_zg add zglb varchar(3) default ''" ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                "alter table ft_zg add zglb varchar(3) default ''" ;
                )
          merr = 1
     ENDIF
     SQLEXEC(odbc_ant2000,  ;
            "DROP TABLE ft_yglb" ;
            )
     IF SQLEXEC(odbc_ant2000,  ;
        "create table ft_yglb(lbbh varchar(3) not null,yglb varchar(10),bz varchar(30),constraint PK_ft_yglb Primary Key(lbbh))" ;
        ) > 0
          IF pub_extension = 1
               SQLEXEC(odbc_ant2000,  ;
                      "insert into ft_yglb(lbbh,yglb) values('1','正式工')" ;
                      )
               SQLEXEC(odbc_ant2000,  ;
                      "insert into ft_yglb(lbbh,yglb) values('2','临时工')" ;
                      )
               SQLEXEC(odbc_ant2000,  ;
                      "insert into ft_yglb(lbbh,yglb) values('3','外包工')" ;
                      )
               SQLEXEC(odbc_ant2000,  ;
                      "insert into ft_yglb(lbbh,yglb) values('4','来宾')" ;
                      )
          ENDIF
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                "create table ft_yglb(lbbh varchar(3) not null,yglb varchar(10),bz varchar(30)" ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                "create table ft_yglb(lbbh varchar(3) not null,yglb varchar(10),bz varchar(30)" ;
                )
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050327'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     msql = "alter table kq_nj_sh add firstyear integer default 0"
     IF SQLEXEC(odbc_ant2000,  ;
        msql) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_nj_sh set firstyear=0" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                msql)
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                msql)
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050522'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     msql = "insert into SYS_INI (SEC,VAR,TYP,VAL) values ('KQGD','SJXX0','N','0')"
     SQLEXEC(odbc_ant2000, msql)
     msql = "insert into SYS_INI (SEC,VAR,TYP,VAL) values ('KQGD','SJXX1','N','0')"
     SQLEXEC(odbc_ant2000, msql)
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FORMAT_KQ','VAL_INOUT','N','1')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FORMAT_KQ','VAL_IN','C',' ')" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FORMAT_KQ','VAL_OUT','C',' ')" ;
            )
     DO update_allfield
ENDIF
mserial = '2.00-20050609'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table gz_replist add toplines integer default 0" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update gz_replist set toplines=0" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table gz_replist add toplines integer default 0' ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table gz_replist add toplines integer default 0' ;
                )
          merr = 1
     ENDIF
     IF SQLEXEC(odbc_ant2000,  ;
        "alter table gz_replist add optsort integer default 1" ;
        ) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update gz_replist set optsort=1" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                'alter table gz_replist add optsort integer default 1' ;
                )
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'alter table gz_replist add optsort integer default 1' ;
                )
          merr = 1
     ENDIF
     msql = "alter table gz_replist add psort varchar(50) default ' '"
     IF SQLEXEC(odbc_ant2000,  ;
        msql) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update gz_replist set psort=' '" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                msql)
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                msql)
          merr = 1
     ENDIF
     msql = "alter table kq_replist add psort varchar(50) default ' '"
     IF SQLEXEC(odbc_ant2000,  ;
        msql) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_replist set psort=' '" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                msql)
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                msql)
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050617'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     msql = "alter table kq_zg alter qf type varchar(2)"
     IF SQLEXEC(odbc_ant2000,  ;
        msql) > 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                msql)
     ELSE
          msql = "alter table kq_zg alter column qf varchar(4)"
          IF SQLEXEC(odbc_ant2000,  ;
             msql) > 0
               syslog(3, mrun +  ;
                     ' 数据表升级 Ok!',  ;
                     msql)
          ELSE
               syslog(3, mrun +  ;
                     ' 数据表升级 Fail!',  ;
                     msql)
               merr = 1
          ENDIF
     ENDIF
ENDIF
mserial = '2.00-20050619'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     msql = "alter table kq_ShiftType add bcs varchar(150) default ' '"
     IF SQLEXEC(odbc_ant2000,  ;
        msql) > 0
          SQLEXEC(odbc_ant2000,  ;
                 "update kq_ShiftType set bcs=' '" ;
                 )
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                msql)
     ELSE
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                msql)
          merr = 1
     ENDIF
ENDIF
mserial = '2.00-20050627'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     haserror = .F.
     hasupdated = .F.
     mysql = "select * from sys_Counter where xuhao=8"
     IF SQLEXEC(odbc_ant2000,  ;
        mysql, "SysCounter") <=  ;
        0
          haserror = .T.
     ENDIF
     IF  .NOT. haserror
          IF RECCOUNT("SysCounter") >  ;
             0
               hasupdated = .T.
          ENDIF
          SELECT syscounter
          USE
     ENDIF
     IF  .NOT. haserror .AND.   ;
         .NOT. hasupdated
          mysql = "select * from rs_jlwp"
          IF SQLEXEC(odbc_ant2000,  ;
             mysql, "rs_jlwp") <=  ;
             0
               haserror = .T.
          ENDIF
     ENDIF
     IF  .NOT. haserror .AND.   ;
         .NOT. hasupdated
          rowcount = RECCOUNT("rs_jlwp")
          mysql = "insert into Sys_Counter(xuhao,jishuqi,flag,bz) values(8,?RowCount,'1','for rs_jlwp')"
          IF SQLEXEC(odbc_ant2000,  ;
             mysql) <= 0
               haserror = .T.
          ENDIF
     ENDIF
     IF  .NOT. haserror .AND.   ;
         .NOT. hasupdated
          mfd = "ID   Integer Not Null Primary Key,"
          mfd = mfd +  ;
                "ZGBH VARCHAR(10) not null,"
          mfd = mfd +  ;
                "WPMC VARCHAR(60) not null,"
          mfd = mfd +  ;
                "XHGG VARCHAR(20) default '',"
          mfd = mfd +  ;
                "SL   INTEGER default 0,"
          mfd = mfd +  ;
                "DJ   DOUBLE PRECISION default 0,"
          mfd = mfd +  ;
                "XJ   DOUBLE PRECISION default 0,"
          mfd = mfd +  ;
                "LQSJ VARCHAR(10) NOT NULL,"
          mfd = mfd +  ;
                "LYXZ VARCHAR(10) default '',"
          mfd = mfd +  ;
                "SYNX DOUBLE PRECISION default 0,"
          mfd = mfd +  ;
                "IFGH INTEGER default 0,"
          mfd = mfd +  ;
                "GHRQ VARCHAR(10) default '',"
          mfd = mfd +  ;
                "BZ   VARCHAR(40) default ''"
          SQLEXEC(odbc_ant2000,  ;
                 "DROP TABLE RS_JLWP" ;
                 )
          msql = "CREATE TABLE RS_JLWP (" +  ;
                 mfd + ")"
          IF SQLEXEC(odbc_ant2000,  ;
             msql) < 0
               haserror = .T.
          ENDIF
     ENDIF
     IF  .NOT. haserror .AND.   ;
         .NOT. hasupdated
          SELECT rs_jlwp
          rowid = 1
          SCAN
               mysql = "insert into rs_jlwp(id,zgbh,wpmc,xhgg,sl,dj,xj,lqsj,lyxz,synx,ifgh,ghrq,bz) values(?RowID,?zgbh," +  ;
                       "'" +  ;
                       IIF(EMPTY(xhgg),  ;
                       ALLTRIM(wpmc),  ;
                       ALLTRIM(wpmc) +  ;
                       " " +  ;
                       ALLTRIM(xhgg)) +  ;
                       "',''," +  ;
                       "?sl,?dj,?xj,?lqsj,?lyxz,?synx,?ifgh,?ghrq,?bz)"
               IF SQLEXEC(odbc_ant2000,  ;
                  mysql) < 0
                    haserror = .T.
                    EXIT
               ENDIF
               rowid = rowid + 1
          ENDSCAN
          USE
     ENDIF
     IF  .NOT. haserror .AND.   ;
         .NOT. hasupdated
          mysql = "Update Sys_Counter set flag=' ' where xuhao=8"
          IF SQLEXEC(odbc_ant2000,  ;
             mysql) < 0
               haserror = .T.
          ENDIF
     ENDIF
     IF  .NOT. hasupdated
          IF haserror
               syslog(3, mrun +  ;
                     ' 数据表升级 Fail!',  ;
                     msql)
               merr = 1
          ELSE
               syslog(3, mrun +  ;
                     ' 数据表升级 Ok!',  ;
                     msql)
          ENDIF
     ENDIF
     hasupdated = tableisexist("RS_CD_WP")
     IF  .NOT. hasupdated
          mfd = "Code integer not null primary key,"
          mfd = mfd +  ;
                "Idx integer default 0,"
          mfd = mfd +  ;
                "Name varchar(60) default ''"
          SQLEXEC(odbc_ant2000,  ;
                 "drop TABLE rs_cd_wp" ;
                 )
          msql = "CREATE TABLE rs_cd_wp (" +  ;
                 mfd + ")"
          IF SQLEXEC(odbc_ant2000,  ;
             msql) > 0
               syslog(3, mrun +  ;
                     ' 数据表升级 Ok!',  ;
                     msql)
          ELSE
               syslog(3, mrun +  ;
                     ' 数据表升级 Fail!',  ;
                     msql)
               merr = 1
          ENDIF
     ENDIF
ENDIF
mserial = '2.00-20050801'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     mfd = "FormID varchar(20) not null,"
     mfd = mfd +  ;
           "UserName varchar(30) not null,"
     mfd = mfd +  ;
           "ControlName varchar(50) not null,"
     mfd = mfd +  ;
           "ControlValue varchar(50),"
     mfd = mfd +  ;
           "Visible varchar(3),"
     mfd = mfd +  ;
           "Enabled varchar(3),"
     mfd = mfd +  ;
           "Constraint PK_Sys_FormDefault Primary Key (FormID,UserName,ControlName)"
     SQLEXEC(odbc_ant2000,  ;
            "Drop Table sys_FormDefault" ;
            )
     IF SQLEXEC(odbc_ant2000,  ;
        "Create Table sys_FormDefault (" +  ;
        mfd + ")") < 0
          syslog(3, mrun +  ;
                ' 数据表升级 Fail!',  ;
                'CREATE TABLE sys_FormDefault (' +  ;
                mfd + ')')
          merr = 1
     ENDIF
     IF merr = 0
          syslog(3, mrun +  ;
                ' 数据表升级 Ok!',  ;
                '')
     ENDIF
ENDIF
mserial = '2.00-20050815'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     DO update_table_list
     DO update_screen
ENDIF
mserial = '2.00-20050819'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     SQLEXEC(odbc_ant2000,  ;
            "update sys_chgtype set name='工类变动' where code=3" ;
            )
ENDIF
mserial = '2.00-20050823'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库系统，请等待...PW-" +  ;
          mserial
     syslog(3, mrun +  ;
           ' 数据表升级', '')
     SQLEXEC(odbc_ant2000,  ;
            "insert into SYS_INI(SEC,VAR,TYP,VAL) values('FXPARA','NOSKKG','N','0')" ;
            )
ENDIF
mserial = '2.00-20050907'
IF EMPTY(mver) .OR. mhd <> 'PW'  ;
   .OR. mtl < mserial
     IF mmsg = -1
          mmsg = MESSAGEBOX('检测到旧的系统版本，需要升级吗？',  ;
                 035, 'ANT2000')
          DO CASE
               CASE mmsg = 7
                    RETURN
               CASE mmsg = 2
                    QUIT
          ENDCASE
     ENDIF
     mrun = 'PW-' + mserial
     WAIT WINDOW NOWAIT  ;
          "正在升级数据库的索引，请等待...PW-" +  ;
          mserial
     syslog(3, mrun + ' 索引升级',  ;
           '')
     SQLEXEC(odbc_ant2000,  ;
            "create index idx_kq_ardata on kq_ardata(riqi)" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "create index idx_kq_clfx on kq_clfx(riqi)" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "create index idx_kq_xjjl_d on kq_xjjl_d(riqi)" ;
            )
     SQLEXEC(odbc_ant2000,  ;
            "create index idx_ft_ardata on ft_ardata(riqi)" ;
            )
ENDIF
IF FILE("loc_repout.dbf")
     USE EXCLUSIVE loc_repout  ;
         ALIAS loc_repout IN 0
     SELECT loc_repout
     flag = .F.
     FOR i = 1 TO FCOUNT()
          IF FIELD(i) = "DW"
               flag = .T.
          ENDIF
     ENDFOR
     IF  .NOT. flag
          ALTER TABLE loc_repout  ;
                ADD COLUMN dw 'N'  ;
                (4)
     ENDIF
     USE
ENDIF
IF  .NOT. EMPTY(mrun)
     IF merr = 0
          WAIT WINDOW NOWAIT  ;
               "欢迎使用ANT2000人事考勤系统。"
     ELSE
          WAIT WINDOW NOWAIT  ;
               "升级中有错误发生，请查看系统日志。"
     ENDIF
     SQLEXEC(odbc_ant2000,  ;
            "select * from sys_ini where sec='SYSPARA' and var='VERSION'",  ;
            "temp")
     SELECT temp
     IF EOF()
          SQLEXEC(odbc_ant2000,  ;
                 "insert into SYS_INI(SEC,VAR,TYP,VAL) values('SYSPARA','VERSION','C',?mrun)" ;
                 )
     ELSE
          SQLEXEC(odbc_ant2000,  ;
                 "update SYS_INI set VAL=?mrun where SEC='SYSPARA' and VAR='VERSION'" ;
                 )
     ENDIF
     USE
     syslog(3, '数据表升级结束',  ;
           '')
ENDIF
ENDPROC
**
