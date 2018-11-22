m = "("
FOR nforcount = 1 TO FCOUNT()
     IF FIELD(nforcount) = "DATE"
          m = m +  ;
              "RIQI VARCHAR(10),"
          LOOP
     ENDIF
     IF UPPER(TYPE(FIELD(nforcount))) =  ;
        "N"
          m = m +  ;
              FIELD(nforcount) +  ;
              " FLOAT,"
     ELSE
          m = m +  ;
              FIELD(nforcount) +  ;
              " VARCHAR" + "(" +  ;
              ALLTRIM(STR(FSIZE(FIELD(nforcount)))) +  ;
              "),"
     ENDIF
ENDFOR
m = LEFT(m, LEN(m) - 1)
m = m + ")"
ssqlexec = "CREATE TABLE " +  ;
           hname + " " + m
= SQLEXEC(odbc_ant2000, ssqlexec,  ;
  "")
RETURN
ENDPROC
**
