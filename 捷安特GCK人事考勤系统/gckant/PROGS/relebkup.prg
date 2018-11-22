FCLOSE(hnd)
CLOSE DATABASES ALL
IF DIRECTORY(path_temp +  ;
   "\REP_KQ")
     DELETE FILE path_temp +  ;
            "\REP_KQ\*.*"
     RD path_temp + "\REP_KQ"
ENDIF
IF DIRECTORY(path_temp +  ;
   "\REP_GZ")
     DELETE FILE path_temp +  ;
            "\REP_GZ\*.*"
     RD path_temp + "\REP_GZ"
ENDIF
IF DIRECTORY(path_temp)
     DELETE FILE path_temp +  ;
            "\*.*"
     RD &PATH_TEMP
ENDIF
ENDPROC
**
