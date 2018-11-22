**
FUNCTION GetItemDef
LPARAMETERS gid_screenid,  ;
            gid_itemid
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
SELECT sys_cd_item
SEEK gid_screenid + ' 1' +  ;
     gid_itemid 
IF  .NOT. EOF()
     DO CASE
          CASE flag = 1
               gid_ret = ALLTRIM(strval)
          CASE flag = 2
               mval = ALLTRIM(strval)
               gid_ret = &mval
     ENDCASE
ELSE
     gid_ret = .NULL.
ENDIF
select &gid_Area
RETURN gid_ret
ENDFUNC
**
