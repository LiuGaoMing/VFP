**
PROCEDURE GetFormDefault
LPARAMETERS oform
currentalias = ALIAS()
formid = getformid(oform)
msql = "Select * from Sys_FormDefault where FormID=?FormID and UserName=?pub_User"
sqlexe_run(00000000004, SYS(16),  ;
          msql, "FormDefault")
IF RECCOUNT("FormDefault") = 0
     SELECT formdefault
     USE
     RETURN
ENDIF
SELECT formdefault
SCAN
     scontrolname = "oform." +  ;
                    ALLTRIM(controlname)
     IF  .NOT. ISNULL(visible)
          e = scontrolname +  ;
              ".Visible=" +  ;
              ALLTRIM(visible)
          &e
     ENDIF
     e = scontrolname +  ;
         ".Enabled=" +  ;
         ALLTRIM(enabled)
     &e
     IF  .NOT.  ;
         ISNULL(controlvalue)
          if &sControlName..BaseClass;
== "Pageframe"
               e = scontrolname +  ;
                   ".ActivePage=" +  ;
                   ALLTRIM(controlvalue)
               &e
          ELSE
               e = scontrolname +  ;
                   ".Value=" +  ;
                   ALLTRIM(controlvalue)
               &e
          ENDIF
     ENDIF
ENDSCAN
USE
IF  .NOT. EMPTY(currentalias)
     select &CurrentAlias
ENDIF
ENDPROC
**
