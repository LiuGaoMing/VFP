FCLOSE(HND)
CLOSE DATABASES ALL
IF DIRECTORY(PATH_TEMP+"\REP_KQ")
DELETE FILE PATH_TEMP+"\REP_KQ\*.*"
RD PATH_TEMP+"\REP_KQ"
ENDIF
IF DIRECTORY(PATH_TEMP+"\REP_GZ")
DELETE FILE PATH_TEMP+"\REP_GZ\*.*"
RD PATH_TEMP+"\REP_GZ"
ENDIF
IF DIRECTORY(PATH_TEMP)
DELETE FILE PATH_TEMP+"\*.*"
RD &PATH_TEMP
ENDIF
ENDPROC
**
