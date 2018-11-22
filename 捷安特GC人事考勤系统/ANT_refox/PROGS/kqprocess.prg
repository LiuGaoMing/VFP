**
FUNCTION GetSelBc
PARAMETER gsb_bc
IF EMPTY(gsb_bc)
     RETURN -1
ENDIF
gsb_ret = -1
FOR x = 1 TO bctabcnt
     IF gsb_bc == bctabbh(x)
          gsb_ret = x
          EXIT
     ENDIF
ENDFOR
RETURN gsb_ret
ENDFUNC
**
FUNCTION ChkShiftDup
LPARAMETERS cd_sbsk1, cd_xbsk1,  ;
            cd_sbsk2, cd_xbsk2
IF cd_sbsk1 = 0 .OR. cd_xbsk1 = 0  ;
   .OR. cd_sbsk2 = 0 .OR.  ;
   cd_xbsk2 = 0
     RETURN .F.
ENDIF
mcd_sbsk1 = cd_sbsk1
mcd_xbsk1 = IIF(cd_xbsk1 <  ;
            cd_sbsk1, 1440 +  ;
            cd_xbsk1, cd_xbsk1)
mcd_sbsk2 = cd_sbsk2
mcd_xbsk2 = IIF(cd_xbsk2 <  ;
            cd_sbsk2, 1440 +  ;
            cd_xbsk2, cd_xbsk2)
IF ABS(mcd_sbsk2 - mcd_sbsk1) <=  ;
   120 .AND. ABS(mcd_xbsk2 -  ;
   mcd_xbsk1) <= 120
     cd_ret = .T.
ELSE
     cd_ret = .F.
ENDIF
RETURN cd_ret
ENDFUNC
**
FUNCTION GetRest
LPARAMETERS gr_sk1, gr_sk2
IF gr_sk1 = 0 .OR. gr_sk2 = 0
     RETURN 0
ENDIF
gr_area = LTRIM(STR(SELECT()))
gr_ret = 0
SELECT time
SCAN
     gr_zj1 = IIF(zjks < sbsj,  ;
              1440 + zjks, zjks)
     gr_zj2 = IIF(zjjs < gr_zj1,  ;
              1440 + zjjs, zjjs)
     IF (gr_zj1 >= gr_sk1 .AND.  ;
        gr_zj1 <= gr_sk2) .OR.  ;
        (gr_zj2 >= gr_sk1 .AND.  ;
        gr_zj2 <= gr_sk2)
          gr_ret = zjxx
          EXIT
     ENDIF
     gr_zj1 = IIF(zjks1 < sbsj,  ;
              1440 + zjks1,  ;
              zjks1)
     gr_zj2 = IIF(zjjs1 < gr_zj1,  ;
              1440 + zjjs1,  ;
              zjjs1)
     IF (gr_zj1 >= gr_sk1 .AND.  ;
        gr_zj1 <= gr_sk2) .OR.  ;
        (gr_zj2 >= gr_sk1 .AND.  ;
        gr_zj2 <= gr_sk2)
          gr_ret = zjxx1
          EXIT
     ENDIF
ENDSCAN
select &gr_area
RETURN gr_ret
ENDFUNC
**
