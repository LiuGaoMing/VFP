fhz = checkhdsn()
IF fhz = -1 .OR. fhz = -2
     IF pub_language
          = MESSAGEBOX( ;
            "This program is parited!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX("������ʹ�÷Ƿ������ĳ����빺�����������лл��",  ;
            64,  ;
            "ANT2000���¿���ϵͳ")
     ENDIF
     RELEASE ALL
     QUIT
     RETURN
ENDIF
IF fhz = -4
     IF pub_language
          = MESSAGEBOX( ;
            "This program is parited!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX("������ʹ�õ��ǷǷ������ĳ����빺�����������װʹ�ã�лл��",  ;
            64,  ;
            "ANT2000���¿���ϵͳ")
     ENDIF
     RELEASE ALL
     QUIT
     RETURN
ENDIF
IF fhz = -3
     i = 0
     FOR i = 0 TO 2
          fhz = checkhdsn()
          IF fhz <> -3
               EXIT
          ENDIF
     ENDFOR
ENDIF
IF fhz = -3
     IF pub_language
          = MESSAGEBOX( ;
            "This program running error!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX("�������д�����͹�Ӧ����ϵ��",  ;
            64,  ;
            "ANT2000���¿���ϵͳ")
     ENDIF
     RELEASE ALL
     QUIT
     RETURN
ELSE
     IF fhz = -1 .OR. fhz = -2
          IF pub_language
               = MESSAGEBOX( ;
                 "This program is parited!",  ;
                 64,  ;
                 "Ant2000 System" ;
                 )
          ELSE
               = MESSAGEBOX("������ʹ�÷Ƿ������ĳ����빺�����������лл��",  ;
                 64,  ;
                 "ANT2000���¿���ϵͳ")
          ENDIF
          RELEASE ALL
          QUIT
          RETURN
     ENDIF
     IF fhz = -4
          IF pub_language
               = MESSAGEBOX( ;
                 "This program is parited!",  ;
                 64,  ;
                 "Ant2000 System" ;
                 )
          ELSE
               = MESSAGEBOX("������ʹ�õ��ǷǷ������ĳ����빺�����������װʹ�ã�лл��",  ;
                 64,  ;
                 "ANT2000���¿���ϵͳ")
          ENDIF
          RELEASE ALL
          QUIT
          RETURN
     ENDIF
ENDIF
ENDPROC
**
