**
FUNCTION BanZuStrChk
LPARAMETERS sbzin
nreturn = 0
sbzin = ALLTRIM(sbzin)
IF LEN(ALLTRIM(sbzin)) <= 1
     = MESSAGEBOX("���Ȳ�����",  ;
       16, "�������")
     nreturn = -1
     RETURN nreturn
ENDIF
lsleft1 = UPPER(LEFT(sbzin, 1))
lsremainstr = sbzin
IF lsleft1 $  ;
   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
     nreturn = 1
     RETURN nreturn
ELSE
     = MESSAGEBOX("����ĸ��ͷ��",  ;
       16, "�������")
     nreturn = -2
     RETURN nreturn
ENDIF
RETURN nreturn
ENDFUNC
**
