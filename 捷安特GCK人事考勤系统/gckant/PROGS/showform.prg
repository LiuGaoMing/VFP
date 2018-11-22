**
PROCEDURE ShowForm
LPARAMETERS spadname, nbarindex
sbuttonid = getbuttonid(spadname,  ;
            nbarindex)
obj_Form1.&sButtonID..Click
ENDPROC
**
FUNCTION GetButtonID
LPARAMETERS spadname, nbarindex
smodule = LOWER(LEFT(spadname,  ;
          2))
buttonid = "btn"
DO CASE
     CASE smodule == "rs"
          DO CASE
               CASE LOWER(spadname) ==  ;
                    "rsinput"
                    buttonid = buttonid +  ;
                               "1" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "rseducation"
                    buttonid = buttonid +  ;
                               "2" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "rsquery"
                    buttonid = buttonid +  ;
                               "3" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "rsreport"
                    buttonid = buttonid +  ;
                               "4" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "rscode"
                    buttonid = buttonid +  ;
                               "5" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "rscompensation"
                    buttonid = buttonid +  ;
                               "7" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "rssystem"
                    buttonid = buttonid +  ;
                               "6" +  ;
                               ALLTRIM(STR(nbarindex))
          ENDCASE
     CASE smodule == "kq"
          DO CASE
               CASE LOWER(spadname) ==  ;
                    "kqinput"
                    buttonid = buttonid +  ;
                               "1" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "kqdata"
                    buttonid = buttonid +  ;
                               "2" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "kqregister"
                    buttonid = buttonid +  ;
                               "3" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "kqanalyze"
                    buttonid = buttonid +  ;
                               "4" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "kqreport"
                    buttonid = buttonid +  ;
                               "5" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "kqsystem"
                    buttonid = buttonid +  ;
                               "6" +  ;
                               ALLTRIM(STR(nbarindex))
          ENDCASE
     CASE smodule == "gz"
          DO CASE
               CASE LOWER(spadname) ==  ;
                    "gzinput"
                    buttonid = buttonid +  ;
                               "1" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "gzprocess"
                    buttonid = buttonid +  ;
                               "2" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "gzreport"
                    buttonid = buttonid +  ;
                               "3" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "gzsystem"
                    buttonid = buttonid +  ;
                               "4" +  ;
                               ALLTRIM(STR(nbarindex))
          ENDCASE
     CASE smodule == "ft"
          DO CASE
               CASE LOWER(spadname) ==  ;
                    "ftinput"
                    buttonid = buttonid +  ;
                               "1" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "ftprediction"
                    buttonid = buttonid +  ;
                               "7" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "ftmanager"
                    buttonid = buttonid +  ;
                               "2" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "ftreport"
                    buttonid = buttonid +  ;
                               "3" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "ftsystem"
                    buttonid = buttonid +  ;
                               "4" +  ;
                               ALLTRIM(STR(nbarindex))
          ENDCASE
     CASE smodule == "tl"
          DO CASE
               CASE LOWER(spadname) ==  ;
                    "tlorganize"
                    buttonid = buttonid +  ;
                               "1" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "tluser"
                    buttonid = buttonid +  ;
                               "2" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "tllogin"
                    buttonid = buttonid +  ;
                               "3" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "tlrelation"
                    buttonid = buttonid +  ;
                               "4" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "tlcompress"
                    buttonid = buttonid +  ;
                               "5" +  ;
                               ALLTRIM(STR(nbarindex))
               CASE LOWER(spadname) ==  ;
                    "tlsyslog"
                    buttonid = buttonid +  ;
                               "6" +  ;
                               ALLTRIM(STR(nbarindex))
          ENDCASE
ENDCASE
RETURN buttonid
ENDFUNC
**
