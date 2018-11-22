IF pub_banben <> "ÑÝÊ¾°æ"
     RETURN
ENDIF
mdt = TTOC(DATETIME())
mdt_ = syspass(mdt, .T.)
lmd = syspass(getantenv('SYSPARA',  ;
      'LMD'), .F.)
IF lmd <> "9" + "4" + "1" + "0"
     IF lmd = "6" + "3" + "7" +  ;
        "1"
          setantenv('SYSPARA',  ;
                   'LMD', mdt_)
     ELSE
          lmd_ = syspass(getantenv('SYSPARA',  ;
                 'LMD_'), .F.)
          IF CTOT(mdt) <  ;
             CTOT(lmd_)
               = MESSAGEBOX( ;
                 "Please check the system date.",  ;
                 64,  ;
                 "Ant2000 System" ;
                 )
               DO sysexit
               RETURN .F.
          ELSE
               IF CTOT(mdt) >  ;
                  CTOT(lmd) +  ;
                  (CTOT( ;
                  "2001/04/01") -  ;
                  CTOT( ;
                  "2001/01/01"))
                    = MESSAGEBOX( ;
                      "Please check the system date.",  ;
                      64,  ;
                      "Ant2000 System" ;
                      )
                    DO sysexit
                    RETURN .F.
               ENDIF
          ENDIF
     ENDIF
     setantenv('SYSPARA', 'LMD_',  ;
              mdt_)
ENDIF
ENDFUNC
**
