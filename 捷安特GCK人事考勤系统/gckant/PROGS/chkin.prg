**
FUNCTION ChkIn
LPARAMETERS chkin_p1, chkin_p2,  ;
            chkin_p3
chkin_ret = .F.
IF chkin_p1 <> 0 .AND. chkin_p2 <>  ;
   0 .AND. chkin_p3 <> 0
     IF chkin_p3 >= chkin_p2
          IF chkin_p1 >= chkin_p2  ;
             .AND. chkin_p1 <=  ;
             chkin_p3
               chkin_ret = .T.
          ENDIF
     ELSE
          IF (chkin_p1 >=  ;
             chkin_p2 .AND.  ;
             chkin_p1 <= 1440)  ;
             .OR. (chkin_p1 > 0  ;
             .AND. chkin_p1 <=  ;
             chkin_p3)
               chkin_ret = .T.
          ENDIF
     ENDIF
ENDIF
RETURN chkin_ret
ENDFUNC
**
