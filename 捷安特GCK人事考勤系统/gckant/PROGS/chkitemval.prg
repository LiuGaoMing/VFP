**
FUNCTION ChkItemVal
LPARAMETERS gid_screenid
gid_area = STR(SELECT())
IF  .NOT. USED('sys_cd_item')
     sqlexe_run(00000000011,  ;
               SYS(16),  ;
               "select * from sys_cd_item",  ;
               "sys_cd_item")
     SELECT sys_cd_item
     INDEX ON TRIM(hmbh) +  ;
           STR(flag, 2) +  ;
           TRIM(xmid) TAG hm_xm
ENDIF
gid_ret = .T.
SELECT sys_cd_item
LOCATE FOR hmbh = gid_screenid  ;
       .AND. STR(flag, 2) = ' 2'
DO WHILE gid_ret .AND.  .NOT.  ;
   EOF() .AND. hmbh=gid_screenid  ;
   .AND. STR(flag, 2)=' 2'
     gid_chkstr = ALLTRIM(strval)
     gid_chkstr = STRTRAN(gid_chkstr,  ;
                  "p",  ;
                  TRIM(xmbh))
     select &gid_Area
     IF  .NOT. EMPTY(gid_chkstr)
          gid_ret = &gid_chkstr;
  
     ENDIF
     SELECT sys_cd_item
     SKIP
ENDDO
SELECT sys_cd_item
IF  .NOT. gid_ret
     = MESSAGEBOX("项目 [" +  ;
       sys_cd_item.xmmc +  ;
       "] 的输入有错误，请检查。",  ;
       64, "ANT2000")
ENDIF
select &gid_Area
RETURN gid_ret
ENDFUNC
**
