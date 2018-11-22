**
FUNCTION GetBcFromShift
LPARAMETERS zg_alias
SELECT shifttype
set filter to (','+Trim(code)+',')$(','+Trim(&zg_Alias..KSBC)+',')
gbfs_ksbc = ""
SCAN
     gbfs_ksbc = gbfs_ksbc + "," +  ;
                 ALLTRIM(bcs)
ENDSCAN
IF EMPTY(gbfs_ksbc)
     gbfs_KSBC = Trim(&zg_Alias..KSBC)
ELSE
     gbfs_ksbc = STUFF(gbfs_ksbc,  ;
                 1, 1, "")
ENDIF
RETURN gbfs_ksbc
ENDFUNC
**
