**
PROCEDURE P_ESC
IF pub_language
     IF MESSAGEBOX( ;
        "It is really to abort the processing?",  ;
        036, pub_subsys_language) =  ;
        6
          pub_escape = .T.
     ENDIF
ELSE
     IF MESSAGEBOX("真的要中断当前处理吗？",  ;
        036,  ;
        "ANT2000人事考勤系统") =  ;
        6
          pub_escape = .T.
     ENDIF
ENDIF
RETURN
ENDPROC
**
