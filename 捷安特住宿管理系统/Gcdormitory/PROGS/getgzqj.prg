SJDATE1 = GETANTENV("3AGZ", "SYSGZSDATE")
SJDATE2 = GETANTENV("3AGZ", "SYSGZEDATE")
YY = PUB_YEAR
MM = PUB_MONTH
DD = SJDATE2
K = CTOD(STR(YY, 4)+'.'+STR(MM, 2)+'.'+STR(DD, 2))+3
MDATE = CTOD(STR(YY, 4)+'.'+STR(MM, 2)+'.'+STR(DD, 2))
I = 1
DO WHILE CTOD("")=MDATE .AND. I<5
DD = DD-1
MDATE = CTOD(STR(YY, 4)+'.'+STR(MM, 2)+'.'+STR(DD, 2))
I = I+1
ENDDO
IF I>=5
MDATE = CTOD("")
ENDIF
PUB_GZJIESHU = MDATE
DD = SJDATE1
IF ABS(SJDATE2-SJDATE1)>=30
MDATE = CTOD(STR(YY, 4)+'.'+STR(MM, 2)+'.'+STR(DD, 2))
ELSE
IF MM=1
MDATE = CTOD(STR(YY-1, 4)+'.'+STR(12, 2)+'.'+STR(DD, 2))
ELSE
MDATE = CTOD(STR(YY, 4)+'.'+STR(MM-1, 2)+'.'+STR(DD, 2))
ENDIF
ENDIF
I = 1
DO WHILE CTOD("")=MDATE .AND. I<5
DD = DD-1
MDATE = CTOD(STR(YY, 4)+'.'+STR(MM, 2)+'.'+STR(DD, 2))
I = I+1
ENDDO
IF I>=5
MDATE = CTOD("")
ENDIF
PUB_GZKAISHI = MDATE
ENDPROC
**
