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
     IF MESSAGEBOX("���Ҫ�жϵ�ǰ������",  ;
        036,  ;
        "ANT2000���¿���ϵͳ") =  ;
        6
          pub_escape = .T.
     ENDIF
ENDIF
RETURN
ENDPROC
**
