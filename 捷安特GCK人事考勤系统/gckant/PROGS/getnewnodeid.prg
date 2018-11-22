**
FUNCTION GetNewNodeID
PARAMETER parentnodekey
SELECT org
GOTO TOP
IF parentnodekey = "Root"
     SELECT MAX(nodeid) AS maxnum  ;
            FROM org WHERE  ;
            LEN(ALLTRIM(nodeid)) =  ;
            2 INTO CURSOR tmp
     IF RECCOUNT() = 0
          newid = "01"
     ELSE
          num = ALLTRIM(STR(VAL(maxnum) +  ;
                1))
          newid = SUBSTR("00", 1,  ;
                  2 - LEN(num)) +  ;
                  num
     ENDIF
ELSE
     sjbh = RIGHT(parentnodekey,  ;
            LEN(parentnodekey) -  ;
            1)
     SELECT MAX(RIGHT(ALLTRIM(nodeid),  ;
            2)) AS maxnum FROM  ;
            org WHERE  ;
            LEFT(ALLTRIM(nodeid),  ;
            LEN(sjbh)) == sjbh  ;
            AND  ;
            LEN(ALLTRIM(nodeid)) =  ;
            LEN(sjbh) + 2 INTO  ;
            CURSOR tmp
     IF RECCOUNT() = 0
          newid = sjbh + "01"
     ELSE
          num = ALLTRIM(STR(VAL(maxnum) +  ;
                1))
          newid = sjbh +  ;
                  SUBSTR("00", 1,  ;
                  2 - LEN(num)) +  ;
                  num
     ENDIF
ENDIF
RETURN newid
ENDFUNC
**
