**
FUNCTION GetAge
LPARAMETERS mbrith
my1 = YEAR(mbrith)
mm1 = MONTH(mbrith)
md1 = DAY(mbrith)
my2 = YEAR(DATE())
mm2 = MONTH(DATE())
md2 = DAY(DATE())
IF DATE() - mbrith <= 0
     mage = 0
ELSE
     IF mm2 > mm1 .OR. (mm2 = mm1  ;
        .AND. md2 >= md1)
          mage = my2 - my1
     ELSE
          mage = my2 - my1 - 1
     ENDIF
ENDIF
IF mage > 100
     mage = 0
ENDIF
RETURN mage
ENDFUNC
**
