**
FUNCTION GetFormID
LPARAMETERS oform
IF TYPE("oForm") <> "O"
     RETURN ""
ENDIF
formid = SYS(1271, oform)
ntimes = OCCURS("\", formid)
IF ntimes > 0
     npos = AT("\", formid,  ;
            ntimes)
     formid = RIGHT(formid,  ;
              LEN(formid) -  ;
              npos)
ENDIF
ntimes = OCCURS(".", formid)
IF ntimes > 0
     npos = AT(".", formid,  ;
            ntimes)
     formid = LEFT(formid, npos -  ;
              1)
ENDIF
RETURN formid
ENDFUNC
**
