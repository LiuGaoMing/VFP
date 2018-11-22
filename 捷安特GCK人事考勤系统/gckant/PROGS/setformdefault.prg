**
PROCEDURE SetFormDefault
LPARAMETERS oform
SET EXACT ON
currentalias = ALIAS()
formid = getformid(oform)
msql = "Delete from Sys_FormDefault where FormID=?FormID and UserName=?pub_User"
sqlexe_run(00000000005, SYS(16),  ;
          msql, "")
CREATE CURSOR FormControls  ;
       (controlname C (50),  ;
       controlvalue C (50) NULL,  ;
       visible C (3) NULL,  ;
       enabled C (3))
getcontrols(oform, oform, "oForm",  ;
           "FormControls")
SELECT formcontrols
SCAN
     vcontrolname = ALLTRIM(formcontrols.controlname)
     vcontrolvalue = IIF(ISNULL(formcontrols.controlvalue),  ;
                     .NULL.,  ;
                     ALLTRIM(formcontrols.controlvalue))
     vvisible = IIF(ISNULL(formcontrols.visible),  ;
                .NULL.,  ;
                ALLTRIM(formcontrols.visible))
     venabled = ALLTRIM(formcontrols.enabled)
     strsql = "insert into sys_FormDefault(FormID,UserName,ControlName,ControlValue,Visible,Enabled) " +  ;
              "values(?FormID,?pub_User,?vControlName,?vControlValue,?vVisible,?vEnabled)"
     sqlexe_run(00000000018,  ;
               SYS(16), strsql,  ;
               "")
ENDSCAN
USE
IF  .NOT. EMPTY(currentalias)
     select &CurrentAlias
ENDIF
ENDPROC
**
FUNCTION VTOC
LPARAMETERS v
stype = TYPE("v")
DO CASE
     CASE stype == "C"
          RETURN "'" + ALLTRIM(v) +  ;
                 "'"
     CASE stype == "D" .OR. stype ==  ;
          "T"
          RETURN "{" +  ;
                 TRANSFORM(v, "") +  ;
                 "}"
     CASE stype == "N"
          RETURN IIF(CEILING(v) =  ;
                 v,  ;
                 ALLTRIM(STR(v)),  ;
                 ALLTRIM(TRANSFORM(v,  ;
                 "")))
     CASE stype == "Y"
          RETURN ALLTRIM(TRANSFORM(v,  ;
                 ""))
     CASE stype == "L"
          RETURN "." +  ;
                 TRANSFORM(v, "") +  ;
                 "."
     OTHERWISE
          RETURN ""
ENDCASE
ENDFUNC
**
PROCEDURE GetControls
LPARAMETERS oform, ocontainer,  ;
            spath, salias
LOCAL i, j, ncount, sclass,  ;
      ocontrol, sname,  ;
      scontrolname, npagecount,  ;
      spage, sbuttonname,  ;
      spagename
ncount = ocontainer.controlcount
FOR i = 1 TO ncount
     ocontrol = ocontainer.controls(i)
     sclass = ocontrol.baseclass
     sname = ocontrol.name
     scontrolname = spath + "." +  ;
                    sname
     DO CASE
          CASE sclass ==  ;
               "Optiongroup"
               insert into &sAlias(ControlName,;
ControlValue, Visible, Enabled) values(stuff(sControlName,;
1, 6, ""), GetPropertyValue(oControl,;
"Value"), GetPropertyValue(oControl, "Visible"), GetPropertyValue(oControl, "Enabled"))
               for n = 1 to &sControlName..ButtonCount
                    oControl = &sControlName..Buttons(n);
 
                    sbuttonname =  ;
                     scontrolname +  ;
                     "." +  ;
                     ocontrol.name
                    insert into &sAlias(ControlName,;
ControlValue, Visible, Enabled) values(stuff(sButtonName,;
1, 6, ""), GetPropertyValue(oControl,;
"Value"), GetPropertyValue(oControl, "Visible"), GetPropertyValue(oControl, "Enabled"))
               ENDFOR
          CASE sclass ==  ;
               "Container"
               insert into &sAlias(ControlName,;
ControlValue, Visible, Enabled) values(stuff(sControlName,;
1, 6, ""), GetPropertyValue(oControl,;
"Value"), GetPropertyValue(oControl, "Visible"), GetPropertyValue(oControl, "Enabled"))
               getcontrols(oform,  ;
                          ocontrol,  ;
                          scontrolname,  ;
                          salias)
          CASE sclass ==  ;
               "Pageframe"
               insert into &sAlias(ControlName,;
ControlValue, Visible, Enabled) values(stuff(sControlName,;
1, 6, ""), GetPropertyValue(oControl,;
"ActivePage"), GetPropertyValue(oControl, "Visible"), GetPropertyValue(oControl, "Enabled"))  
               nPageCount = &sControlName..PageCount
               FOR j = 1 TO  ;
                   npagecount
                    spage = scontrolname +  ;
                            ".Pages(" +  ;
                            ALLTRIM(STR(j)) +  ;
                            ")"
                    oControl = &sPage;
       
                    spagename = scontrolname +  ;
                                "." +  ;
                                ocontrol.name
                    insert into &sAlias(ControlName,;
ControlValue, Visible, Enabled) values(stuff(sPageName,;
1, 6, ""), GetPropertyValue(oControl,;
"Value"), GetPropertyValue(oControl, "Visible"), GetPropertyValue(oControl, "Enabled"))
                    getcontrols(oform,  ;
                               ocontrol,  ;
                               spagename,  ;
                               salias)
               ENDFOR
          CASE INLIST(sclass,  ;
               "Checkbox",  ;
               "Combobox",  ;
               "Editbox",  ;
               "Listbox",  ;
               "Spinner",  ;
               "Textbox")
               insert into &sAlias(ControlName,;
ControlValue, Visible, Enabled) values(stuff(sPath;
+ "." + sName, 1, 6, ""), GetPropertyValue(oControl,;
"Value"), GetPropertyValue(oControl, "Visible"), GetPropertyValue(oControl, "Enabled"))
     ENDCASE
ENDFOR
ENDPROC
**
FUNCTION GetPropertyValue
LPARAMETERS obj, sproperty
nrowcount = AMEMBERS(aclassmembers,  ;
            obj, 1)
IF nrowcount = 0
     RETURN .NULL.
ENDIF
nelement = ASCAN(aclassmembers,  ;
           UPPER(sproperty))
IF nelement = 0
     RETURN .NULL.
ENDIF
IF aclassmembers(nelement + 1) <>  ;
   " Ù–‘" .AND.  ;
   aclassmembers(nelement + 1) <>  ;
   "Property"
     RETURN .NULL.
ENDIF
return VTOC(obj.&sProperty)
ENDFUNC
**
