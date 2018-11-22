SET SAFETY OFF
SET CENTURY ON
SET EXACT ON
SET DATE YMD
SET DELETED ON
SET EXCLUSIVE OFF
CREATE CURSOR organ (rid N (2),  ;
       rank01 C (20) NULL, name01  ;
       C (20) NULL, rank02 C (20)  ;
       NULL, name02 C (20) NULL,  ;
       rank03 C (20) NULL, name03  ;
       C (20) NULL, rank04 C (20)  ;
       NULL, name04 C (20) NULL,  ;
       rank05 C (20) NULL, name05  ;
       C (20) NULL, rank06 C (20)  ;
       NULL, name06 C (20) NULL,  ;
       rank07 C (20) NULL, name07  ;
       C (20) NULL, rank08 C (20)  ;
       NULL, name08 C (20) NULL,  ;
       rank09 C (20) NULL, name09  ;
       C (20) NULL, rank10 C (20)  ;
       NULL, name10 C (20) NULL,  ;
       note C (100) NULL, bmbh C  ;
       (6) NULL, rel_row N (2)  ;
       NULL, rel_col N (2) NULL)
PUBLIC run_mode
IF  .NOT. run_mode
     inaccess = SQLCONNECT("ant2000",  ;
                "ant",  ;
                "tct1810")
ENDIF
sqlcmd = "select a.gyxz,a.zgxm,a.bmbh,b.bmmc,a.zw as zwbh,c.name as zwmc" +  ;
         " from rs_zg a left join rs_bm b on a.bmbh=b.bmbh" +  ;
         " left join rs_cd_zw c on a.zw=c.code where b.bmmc is not null"
SQLEXEC(inaccess, sqlcmd, "bmzw")
DELETE FROM bmzw WHERE  ;
       EMPTY(bmbh) .OR.  ;
       ISNULL(bmbh)
IF  .NOT. USED("bmzw")
     MESSAGEBOX("没有有效数据，执行被取消。")
     RETURN
ENDIF
CREATE CURSOR tmp_rowcol (bmbh C  ;
       (6) NULL, zwbh N (3) NULL,  ;
       rowindex N (2) NULL,  ;
       colindex N (2) NULL)
SELECT bmbh, zwbh, COUNT(*) AS  ;
       recnum FROM bmzw WHERE   ;
       NOT EMPTY(bmbh) GROUP BY  ;
       bmbh, zwbh ORDER BY bmbh,  ;
       zwbh INTO CURSOR g_bmzw
SCAN
     INSERT INTO tmp_rowcol (bmbh,  ;
            zwbh) VALUES  ;
            (ALLTRIM(g_bmzw.bmbh),  ;
            g_bmzw.zwbh)
ENDSCAN
GOTO TOP
tmp_recno = 1
tmp_bmbh = ALLTRIM(g_bmzw.bmbh)
SELECT g_bmzw
SCAN
     IF  .NOT. tmp_bmbh $  ;
         ALLTRIM(g_bmzw.bmbh)
          tmp_recno = tmp_recno +  ;
                      1
     ENDIF
     IF ISNULL(g_bmzw.zwbh)
          SELECT * FROM bmzw  ;
                   WHERE  ;
                   ALLTRIM(bmbh) ==  ;
                   ALLTRIM(g_bmzw.bmbh)  ;
                   AND  ;
                   ISNULL(zwbh)  ;
                   INTO CURSOR  ;
                   tmp
     ELSE
          SELECT * FROM bmzw  ;
                   WHERE  ;
                   ALLTRIM(bmbh) ==  ;
                   ALLTRIM(g_bmzw.bmbh)  ;
                   AND zwbh =  ;
                   g_bmzw.zwbh  ;
                   INTO CURSOR  ;
                   tmp
     ENDIF
     len_bmbh = LEN(ALLTRIM(g_bmzw.bmbh))
     DO CASE
          CASE len_bmbh = 0
               LOOP
          CASE len_bmbh = 1
               tmp_rankfield = "rank01"
               tmp_namefield = "name01"
          CASE len_bmbh = 2
               tmp_rankfield = "rank02"
               tmp_namefield = "name02"
          CASE len_bmbh = 3
               IF ALLTRIM(zwmc) ==  ;
                  "部长"
                    tmp_rankfield =  ;
                     "rank03"
                    tmp_namefield =  ;
                     "name03"
               ELSE
                    tmp_rankfield =  ;
                     "rank04"
                    tmp_namefield =  ;
                     "name04"
               ENDIF
          CASE len_bmbh = 4
               IF ALLTRIM(zwmc) ==  ;
                  "课长"
                    tmp_rankfield =  ;
                     "rank04"
                    tmp_namefield =  ;
                     "name04"
               ELSE
                    tmp_rankfield =  ;
                     "rank05"
                    tmp_namefield =  ;
                     "name05"
               ENDIF
          CASE len_bmbh = 5
               IF ALLTRIM(zwmc) ==  ;
                  "系长"
                    tmp_rankfield =  ;
                     "rank06"
                    tmp_namefield =  ;
                     "name06"
               ELSE
                    tmp_rankfield =  ;
                     "rank07"
                    tmp_namefield =  ;
                     "name07"
               ENDIF
          CASE len_bmbh = 6
               IF ALLTRIM(zwmc) ==  ;
                  "班长"
                    tmp_rankfield =  ;
                     "rank08"
                    tmp_namefield =  ;
                     "name08"
               ELSE
                    tmp_rankfield =  ;
                     "rank09"
                    tmp_namefield =  ;
                     "name09"
               ENDIF
     ENDCASE
     IF ISNULL(zwbh)
          tmp_rankfield = "rank09"
          tmp_namefield = "name09"
     ENDIF
     tmp_namevalue = ""
     DO CASE
          CASE RECCOUNT("tmp") =  ;
               1
               tmp_namevalue = ALLTRIM(tmp.zgxm)
          CASE RECCOUNT("tmp") =  ;
               2
               SCAN
                    IF EMPTY(tmp_namevalue)
                         tmp_namevalue =  ;
                          ALLTRIM(tmp.zgxm)
                    ELSE
                         tmp_namevalue =  ;
                          tmp_namevalue +  ;
                          " " +  ;
                          ALLTRIM(tmp.zgxm)
                    ENDIF
               ENDSCAN
               GOTO TOP
          CASE RECCOUNT("tmp") >  ;
               2
               tmp_namevalue = ALLTRIM(STR(RECCOUNT("tmp"))) +  ;
                               "人"
               IF ISNULL(tmp.zwmc)  ;
                  .OR.  ;
                  EMPTY(tmp.zwmc)
                    tmp_namevalue =  ;
                     "员工 " +  ;
                     tmp_namevalue
               ENDIF
     ENDCASE
     tmp_rankvalue = ""
     DO CASE
          CASE ALLTRIM(tmp.zwmc) ==  ;
               "翻译"
               tmp_rankvalue = "翻译"
          CASE len_bmbh <= 2
               tmp_rankvalue = ALLTRIM(tmp.bmmc)
          CASE ISNULL(tmp.zwmc)  ;
               .OR.  ;
               EMPTY(tmp.zwmc)
               tmp_rankvalue = ALLTRIM(tmp.bmmc)
          OTHERWISE
               m = ALLTRIM(tmp.bmmc)
               tmp_rankvalue = SUBSTR(m,  ;
                               1,  ;
                               LEN(m) -  ;
                               2) +  ;
                               IIF(ISNULL(tmp.zwmc),  ;
                               "",  ;
                               ALLTRIM(tmp.zwmc))
               IF LEN(tmp_rankvalue) >  ;
                  13 .AND.  ;
                  LEN(IIF(ISNULL(tmp.zwmc),  ;
                  "",  ;
                  ALLTRIM(tmp.zwmc)) +  ;
                  " " +  ;
                  tmp_namevalue) <=  ;
                  13
                    tmp_rankvalue =  ;
                     SUBSTR(m, 1,  ;
                     LEN(m) - 2)
                    tmp_namevalue =  ;
                     IIF(ISNULL(tmp.zwmc),  ;
                     "",  ;
                     ALLTRIM(tmp.zwmc)) +  ;
                     " " +  ;
                     tmp_namevalue
               ENDIF
     ENDCASE
     IF LEFT(tmp.bmmc, 6) ==  ;
        "临时工"
          SELECT COUNT(*) AS  ;
                 lsgrs FROM bmzw  ;
                 WHERE  ;
                 ALLTRIM(bmbh) ==  ;
                 ALLTRIM(g_bmzw.bmbh)  ;
                 AND gyxz = 4  ;
                 INTO CURSOR  ;
                 tmpxx
          tmp_rankvalue = "临时工"
          tmp_namevalue = ALLTRIM(STR(lsgrs)) +  ;
                          "人"
     ENDIF
     IF RECCOUNT("organ") =  ;
        tmp_recno
          update organ set &tmp_rankfield.=tmp_rankvalue,;
&tmp_namefield.=tmp_namevalue where recno()=tmp_recno
          SELECT bmbh FROM organ  ;
                 WHERE RECNO() =  ;
                 tmp_recno INTO  ;
                 CURSOR tmp_bmbh
          IF LEN(ALLTRIM(tmp.bmbh)) <  ;
             LEN(ALLTRIM(bmbh))
               UPDATE organ SET  ;
                      bmbh =  ;
                      ALLTRIM(tmp.bmbh)  ;
                      WHERE  ;
                      RECNO() =  ;
                      tmp_recno
          ENDIF
     ELSE
          insertcmd="insert into organ(rid,&tmp_rankfield.,&tmp_namefield.,bmbh)";
+"values(tmp_recno,tmp_rankvalue,tmp_namevalue,alltrim(tmp.bmbh))"
          &insertcmd
     ENDIF
     tmp_col = VAL(RIGHT(tmp_rankfield,  ;
               2))
     UPDATE tmp_rowcol SET  ;
            rowindex = tmp_recno,  ;
            colindex = tmp_col  ;
            WHERE ALLTRIM(bmbh) ==  ;
            ALLTRIM(g_bmzw.bmbh)  ;
            .AND. zwbh =  ;
            g_bmzw.zwbh
     IF ALLTRIM(tmp.zwmc) ==  ;
        "翻译"
          tmp_recno = tmp_recno +  ;
                      1
     ENDIF
     tmp_bmbh = ALLTRIM(g_bmzw.bmbh)
ENDSCAN
tmp_zwbh = 0
SELECT zwbh FROM bmzw WHERE  ;
       ALLTRIM(zwmc) == "翻译"  ;
       INTO CURSOR tmp
IF RECCOUNT("tmp") > 0
     tmp_zwbh = tmp.zwbh
ENDIF
SELECT organ
SCAN
     IF rid = 1
          LOOP
     ENDIF
     m = ALLTRIM(bmbh)
     SELECT bmbh, rowindex,  ;
            colindex FROM  ;
            tmp_rowcol a WHERE  ;
            ALLTRIM(bmbh) =  ;
            (SELECT  ;
            MAX(ALLTRIM(bmbh))  ;
            FROM tmp_rowcol WHERE  ;
            ALLTRIM(bmbh) ==  ;
            LEFT(m,  ;
            LEN(ALLTRIM(bmbh)))  ;
            AND  NOT  ;
            (ALLTRIM(bmbh) ==  ;
            ALLTRIM(organ.bmbh))  ;
            AND zwbh <> tmp_zwbh)  ;
            AND zwbh <> tmp_zwbh  ;
            ORDER BY zwbh INTO  ;
            CURSOR tmp
     IF EOF("tmp")
          LOOP
     ENDIF
     GOTO BOTTOM
     SELECT organ
     REPLACE rel_row WITH  ;
             tmp.rowindex,  ;
             rel_col WITH  ;
             tmp.colindex
ENDSCAN
sqlcmd = "select a.zgbh,a.zgxm,b.name as xbmc,a.lzsj,a.jzsj,a.zw,c.name as zwmc" +  ;
         " from rs_zg a left join sys_cd_xb b on a.xb=b.code" +  ;
         " left join rs_cd_zw c on a.zw=c.code"
SQLEXEC(inaccess, sqlcmd, "rszg")
DELETE FROM rszg WHERE  ;
       YEAR(CTOD(lzsj)) * 100 +  ;
       MONTH(CTOD(lzsj)) <  ;
       YEAR(DATE()) * 100 +  ;
       MONTH(DATE()) .AND.  .NOT.  ;
       EMPTY(CTOD(lzsj))
SELECT rszg
COUNT FOR YEAR(CTOD(jzsj)) * 100 +  ;
      MONTH(CTOD(jzsj)) =  ;
      YEAR(DATE()) * 100 +  ;
      MONTH(DATE()) TO tmp_xjrs
COUNT FOR  .NOT.  ;
      EMPTY(CTOD(lzsj)) TO  ;
      tmp_lzrs
COUNT FOR EMPTY(CTOD(lzsj)) TO  ;
      tmp_zrs
SELECT organ
GOTO TOP
REPLACE note WITH "期初人数：" +  ;
        ALLTRIM(STR(tmp_zrs +  ;
        tmp_lzrs - tmp_xjrs)) +  ;
        " " + "期末人数：" +  ;
        ALLTRIM(STR(tmp_zrs))
SKIP
REPLACE note WITH "本月新进员工 " +  ;
        ALLTRIM(STR(tmp_xjrs)) +  ;
        "人"
SKIP
REPLACE note WITH "本月离职员工 " +  ;
        ALLTRIM(STR(tmp_lzrs)) +  ;
        "人"
DELETE FROM rszg WHERE  .NOT.  ;
       EMPTY(CTOD(lzsj))
SELECT COUNT(*) AS rs, xbmc FROM  ;
       rszg GROUP BY xbmc INTO  ;
       CURSOR tmp
tmp_zs = "总员工：" +  ;
         ALLTRIM(STR(tmp_zrs)) +  ;
         "名 ("
SCAN
     IF  .NOT. EMPTY(xbmc) .AND.   ;
         .NOT. ISNULL(xbmc)
          tmp_zs = tmp_zs +  ;
                   ALLTRIM(xbmc) +  ;
                   ALLTRIM(STR(rs)) +  ;
                   ","
     ELSE
          tmp_zs = tmp_zs +  ;
                   "未知" +  ;
                   ALLTRIM(STR(rs)) +  ;
                   ","
     ENDIF
ENDSCAN
tmp_zs = SUBSTR(tmp_zs, 1,  ;
         LEN(tmp_zs) - 1) + ")"
SELECT COUNT(*) AS rs FROM rszg  ;
       WHERE ISNULL(zwmc) OR  ;
       EMPTY(zwmc) INTO CURSOR  ;
       tmp
tmp_ptzy = "职员：" +  ;
           ALLTRIM(STR(rs)) +  ;
           "名 ("
SELECT COUNT(*) AS rs, xbmc FROM  ;
       rszg WHERE ISNULL(zwmc) OR  ;
       EMPTY(zwmc) GROUP BY xbmc  ;
       INTO CURSOR tmp
SCAN
     IF  .NOT. EMPTY(xbmc) .AND.   ;
         .NOT. ISNULL(xbmc)
          tmp_ptzy = tmp_ptzy +  ;
                     ALLTRIM(xbmc) +  ;
                     ALLTRIM(STR(rs)) +  ;
                     ","
     ELSE
          tmp_ptzy = tmp_ptzy +  ;
                     "未知" +  ;
                     ALLTRIM(STR(rs)) +  ;
                     ","
     ENDIF
ENDSCAN
tmp_ptzy = SUBSTR(tmp_ptzy, 1,  ;
           LEN(tmp_ptzy) - 1) +  ;
           ")"
DELETE FROM rszg WHERE  ;
       ISNULL(zwmc)
DELETE FROM rszg WHERE  ;
       EMPTY(zwmc)
SELECT rszg
COUNT TO tmp
tmp_gjzy = "[以上小计：" +  ;
           ALLTRIM(STR(tmp)) +  ;
           "名 ("
SELECT COUNT(*) AS rs, xbmc FROM  ;
       rszg GROUP BY xbmc INTO  ;
       CURSOR tmp
SCAN
     IF  .NOT. EMPTY(xbmc) .AND.   ;
         .NOT. ISNULL(xbmc)
          tmp_gjzy = tmp_gjzy +  ;
                     ALLTRIM(xbmc) +  ;
                     ALLTRIM(STR(rs)) +  ;
                     ","
     ELSE
          tmp_gjzy = tmp_gjzy +  ;
                     "未知" +  ;
                     ALLTRIM(STR(rs)) +  ;
                     ","
     ENDIF
ENDSCAN
tmp_gjzy = SUBSTR(tmp_gjzy, 1,  ;
           LEN(tmp_gjzy) - 1) +  ;
           ")]"
SELECT organ
GOTO BOTTOM
REPLACE note WITH tmp_zs
SKIP -1
REPLACE note WITH tmp_ptzy
SKIP -1
REPLACE note WITH tmp_gjzy
SELECT zwmc, COUNT(*) AS rs FROM  ;
       rszg ORDER BY zw INTO  ;
       CURSOR tmp GROUP BY zw,  ;
       zwmc
IF RECCOUNT("tmp") + 6 <  ;
   RECCOUNT("organ")
     SELECT organ
     GOTO TOP
     GOTO 3 + (RECCOUNT("organ") -  ;
          6 - RECCOUNT("tmp")) +  ;
          1
     SELECT tmp
     SCAN
          SELECT organ
          REPLACE note WITH  ;
                  ALLTRIM(tmp.zwmc) +  ;
                  "：" +  ;
                  ALLTRIM(STR(tmp.rs)) +  ;
                  "名"
          SKIP IN organ
     ENDSCAN
ENDIF
SQLEXEC(inaccess,  ;
       "delete from rs_organization" ;
       )
SELECT organ
SCAN
     sqlcmd = "insert into rs_organization(rid,rank01,name01,rank02,name02,rank03,name03,rank04,name04," +  ;
              "rank05,name05,rank06,name06,rank07,name07,rank08,name08,rank09,name09,rank10,name10,note," +  ;
              "bmbh,rel_row,rel_col) values(?rid,?rank01,?name01,?rank02,?name02,?rank03,?name03," +  ;
              "?rank04,?name04,?rank05,?name05,?rank06,?name06,?rank07,?name07,?rank08,?name08,?rank09,?name09," +  ;
              "?rank10,?name10,?note,?bmbh,?rel_row,?rel_col)"
     IF SQLEXEC(inaccess, sqlcmd) <  ;
        0
          MESSAGEBOX("把人事组织结构图数据写入数据库时发生错误！")
          EXIT
     ENDIF
ENDSCAN
USE
IF  .NOT. run_mode
     SQLDISCONNECT(inaccess)
ENDIF
RETURN
ENDPROC
**
