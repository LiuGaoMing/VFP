**
PROCEDURE CloseLanguage
IF TYPE("LanguageFilePointer") =  ;
   "L"
     RETURN
ENDIF
IF languagefilepointer > 0
     FCLOSE(languagefilepointer)
ENDIF
RELEASE languagefilepointer
RETURN
ENDPROC
**
