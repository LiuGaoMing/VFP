fhz = checkhdsn()
IF fhz = -1 .OR. fhz = -2
     IF pub_language
          = MESSAGEBOX( ;
            "This program is parited!",  ;
            64,  ;
            "Ant2000 System")
     ELSE
          = MESSAGEBOX("您正在使用非法拷贝的程序。请购买正版软件，谢谢！",  ;
            64,  ;
            "ANT2000人事考勤系统")
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
          = MESSAGEBOX("您正在使用的是非法拷贝的程序，请购买正版软件安装使用！谢谢！",  ;
            64,  ;
            "ANT2000人事考勤系统")
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
          = MESSAGEBOX("程序运行错误，请和供应商联系！",  ;
            64,  ;
            "ANT2000人事考勤系统")
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
               = MESSAGEBOX("您正在使用非法拷贝的程序。请购买正版软件，谢谢！",  ;
                 64,  ;
                 "ANT2000人事考勤系统")
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
               = MESSAGEBOX("您正在使用的是非法拷贝的程序，请购买正版软件安装使用！谢谢！",  ;
                 64,  ;
                 "ANT2000人事考勤系统")
          ENDIF
          RELEASE ALL
          QUIT
          RETURN
     ENDIF
ENDIF
ENDPROC
**
