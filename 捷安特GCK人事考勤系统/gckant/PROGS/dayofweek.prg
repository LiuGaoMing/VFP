**
FUNCTION DayOfWeek
LPARAMETERS dayofweek_year,  ;
            dayofweek_week,  ;
            dayofweek_mod
IF dayofweek_year <> sys_wyear
     sys_wday = CTOD(STR(dayofweek_year,  ;
                4) + "/07/01")
     sys_wweek = WEEK(sys_wday)
     sys_wyear = YEAR(sys_wday)
ENDIF
sys_wday = sys_wday + 7 *  ;
           (dayofweek_week -  ;
           sys_wweek)
IF WEEK(sys_wday) <  ;
   dayofweek_week
     DO WHILE WEEK(sys_wday)< ;
        dayofweek_week
          sys_wday = sys_wday + 1
     ENDDO
ELSE
     IF WEEK(sys_wday) >  ;
        dayofweek_week
          DO WHILE WEEK(sys_wday)> ;
             dayofweek_week
               sys_wday = sys_wday -  ;
                          1
          ENDDO
     ENDIF
ENDIF
IF dayofweek_mod = 0
     DO WHILE WEEK(sys_wday)= ;
        dayofweek_week
          sys_wday = sys_wday - 1
     ENDDO
     sys_wday = sys_wday + 1
     DO WHILE DOW(sys_wday)=1  ;
        .OR. DOW(sys_wday)=7
          sys_wday = sys_wday + 1
     ENDDO
ELSE
     DO WHILE WEEK(sys_wday)= ;
        dayofweek_week
          sys_wday = sys_wday + 1
     ENDDO
     sys_wday = sys_wday - 1
     DO WHILE DOW(sys_wday)=1  ;
        .OR. DOW(sys_wday)=7
          sys_wday = sys_wday - 1
     ENDDO
ENDIF
sys_wweek = WEEK(sys_wday)
sys_wyear = YEAR(sys_wday)
RETURN sys_wday
ENDFUNC
**
