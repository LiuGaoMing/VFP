**
FUNCTION LastWeek
LPARAMETERS lastweek_year
lastweek_day = CTOD(STR(lastweek_year,  ;
               4) + "/12/31")
DO WHILE WEEK(lastweek_day)=1
     lastweek_day = lastweek_day -  ;
                    1
ENDDO
RETURN WEEK(lastweek_day)
ENDFUNC
**
