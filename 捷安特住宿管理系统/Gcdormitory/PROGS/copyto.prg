**
PROCEDURE CopyTo
PARAMETER FILETYPE, FILENAME
IF GNDEBUGMODE=1
LSDEBUGFILENAME = GSDEBUGOUTDIR1+"\"+FILENAME
DO CASE
CASE UPPER(FILETYPE)="XLS"
COPY TO &LSDEBUGFILENAME TYPE XL5 
CASE UPPER(FILETYPE)="TXT"
COPY TO &LSDEBUGFILENAME TYPE  CSV	
CASE UPPER(FILETYPE)="CSV"
COPY TO &LSDEBUGFILENAME TYPE CSV
OTHERWISE
COPY TO &LSDEBUGFILENAME 
ENDCASE
ENDIF
ENDPROC
**
