**
FUNCTION GetValidDate
LPARAMETERS gvd_yy, gvd_mm,  ;
            gvd_dd
gvd_i = 1
gvd_date = CTOD(STR(gvd_yy, 4) +  ;
           '.' + STR(gvd_mm, 2) +  ;
           '.' + STR(gvd_dd, 2))
DO WHILE CTOD("")=gvd_date .AND.  ;
   gvd_i<5
     gvd_dd = gvd_dd - 1
     gvd_date = CTOD(STR(gvd_yy,  ;
                4) + '.' +  ;
                STR(gvd_mm, 2) +  ;
                '.' + STR(gvd_dd,  ;
                2))
     gvd_i = gvd_i + 1
ENDDO
IF gvd_i >= 5
     gvd_date = CTOD("")
ENDIF
RETURN gvd_date
ENDFUNC
**
