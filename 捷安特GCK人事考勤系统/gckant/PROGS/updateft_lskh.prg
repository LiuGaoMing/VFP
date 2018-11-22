IF  .NOT. USED("zglink") .OR.   ;
    .NOT. USED("zg")
     RETURN
ENDIF
strsql = "select * from ft_lskh"
sqlexe_run(00000000010, SYS(16),  ;
          strsql, "ft_lskh")
SELECT * FROM zg WHERE  NOT  ;
         DELETED() INTO CURSOR  ;
         tmpzg
SELECT * FROM ft_lskh WHERE  ;
         CTOD(yxjs) <> CTOD('')  ;
         AND CTOD(yxjs) <  ;
         pub_kqkaishi INTO CURSOR  ;
         tmpcard
SCAN
     IF sqlexe_run(00000000016,  ;
        SYS(16),  ;
        "delete from ft_lskh where zgbh=?zgbh",  ;
        "") <> 1
          pub_saveerr = .T.
     ENDIF
ENDSCAN
SELECT * FROM ft_lskh WHERE  NOT  ;
         zgbh IN(SELECT zgbh FROM  ;
         tmpzg) INTO CURSOR  ;
         tmpcard
SCAN
     IF sqlexe_run(00000000023,  ;
        SYS(16),  ;
        "delete from ft_lskh where zgbh=?zgbh",  ;
        "") <> 1
          pub_saveerr = .T.
     ENDIF
ENDSCAN
SELECT zgbh, COUNT(lskh) FROM  ;
       zglink WHERE  NOT  ;
       DELETED() GROUP BY zgbh  ;
       HAVING COUNT(lskh) = 1  ;
       INTO CURSOR singlecard
SELECT * FROM zglink WHERE  NOT  ;
         DELETED() AND zgbh  ;
         IN(SELECT zgbh FROM  ;
         singlecard) INTO CURSOR  ;
         tmpcard
SCAN
     IF sqlexe_run(00000000032,  ;
        SYS(16),  ;
        "update ft_lskh set lskh=?lskh,djsj=?djsj,yxks=?yxks,yxjs=?yxjs where zgbh=?zgbh",  ;
        "") <> 1
          pub_saveerr = .T.
     ENDIF
ENDSCAN
SELECT zgbh, COUNT(lskh) FROM  ;
       zglink WHERE  NOT  ;
       DELETED() GROUP BY zgbh  ;
       HAVING COUNT(lskh) > 1  ;
       INTO CURSOR multicard
SELECT * FROM zglink WHERE  NOT  ;
         DELETED() AND zgbh  ;
         IN(SELECT zgbh FROM  ;
         multicard) INTO CURSOR  ;
         tmpcard
SCAN
     IF sqlexe_run(00000000041,  ;
        SYS(16),  ;
        "update ft_lskh set yxks=?yxks,yxjs=?yxjs where zgbh=?zgbh",  ;
        "") <> 1
          pub_saveerr = .T.
     ENDIF
ENDSCAN
SELECT * FROM zglink WHERE  NOT  ;
         DELETED() AND zgbh  ;
         IN(SELECT zgbh FROM  ;
         tmpzg) AND  NOT zgbh  ;
         IN(SELECT zgbh FROM  ;
         ft_lskh) INTO CURSOR  ;
         tmpcard
SCAN
     IF sqlexe_run(00000000048,  ;
        SYS(16),  ;
        "insert into ft_lskh(zgbh,lskh,djsj,yxks,yxjs) values(?zgbh,?lskh,?djsj,?yxks,?yxjs)",  ;
        "") <> 1
          MESSAGEBOX("无法向卡号表插入已存在的卡号！" +  ;
                    CHR(13) +  ;
                    "员工编号：" +  ;
                    zgbh +  ;
                    CHR(13) +  ;
                    "卡号：" +  ;
                    lskh, 48,  ;
                    "员工刷新")
          pub_saveerr = .T.
     ENDIF
ENDSCAN
IF sqlexe_run(00000000054,  ;
   SYS(16),  ;
   "delete from ft_lskh where zgbh not in (select zgbh from ft_zg)",  ;
   "") <> 1
     pub_saveerr = .T.
ENDIF
SELECT ft_lskh
USE
SELECT singlecard
USE
SELECT multicard
USE
SELECT tmpcard
USE
ENDPROC
**
