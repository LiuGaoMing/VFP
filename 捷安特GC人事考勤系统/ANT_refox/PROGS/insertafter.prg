PARAMETER ia_pointer
COUNT TO cntrec
IF cntrec = 0
     APPEND BLANK
     RETURN
ELSE
     GOTO ia_pointer
ENDIF
IF EOF()
     APPEND BLANK
     REPLACE yglb WITH yglb.lbbh
ELSE
     SKIP
     IF EOF()
          APPEND BLANK
          REPLACE yglb WITH  ;
                  yglb.lbbh
     ELSE
          APPEND BLANK
          REPLACE yglb WITH  ;
                  yglb.lbbh
          SCATTER TO ia_blank 
          DO WHILE  .NOT. BOF()
               SKIP -1
               SCATTER TO  ;
                       ia_record 
               SKIP
               GATHER FROM  ;
                      ia_record
               SKIP -1
               IF RECNO() =  ;
                  ia_pointer
                    GATHER FROM  ;
                           ia_blank
                    EXIT
               ENDIF
          ENDDO
     ENDIF
ENDIF
BROWSE
ENDPROC
**
