DECLARE LONG GdipCreateBitmapFromScan0 IN GdiPlus.dll LONG,LONG,LONG,LONG,LONG,LONG @
DECLARE LONG GdipSaveImageToFile IN Gdiplus.dll LONG,STRING,STRING,STRING
DECLARE LONG GdipDrawImageRect IN gdiplus.DLL LONG,LONG,SINGLE,SINGLE,SINGLE,SINGLE
DECLARE LONG GdipCreateStringFormat IN GdiPlus.dll LONG,LONG,LONG @
DECLARE LONG GdipCreateSolidFill IN GdiPlus.dll LONG,LONG @
DECLARE LONG GdipCreateFontFamilyFromName IN GdiPlus.dll STRING,LONG,LONG @
DECLARE LONG GdipGetImageGraphicsContext IN gdiplus.DLL LONG,LONG @
DECLARE LONG GdipCreatePath IN GDIPLUS.DLL  LONG,LONG @
DECLARE LONG GdipAddPathString IN GDIPLUS.DLL LONG,STRING,LONG,LONG,LONG,Single,STRING @,LONG
DECLARE LONG GdipSetSmoothingMode IN GDIPLUS.DLL LONG,LONG
DECLARE LONG GdipCreateMatrix2 IN GDIPLUS.DLL  Single,Single,Single,Single,Single,Single,LONG @
DECLARE LONG GdipDrawPath IN GDIPLUS.DLL  LONG,LONG,LONG
DECLARE LONG GdipSetWorldTransform IN GDIPLUS.DLL  LONG,LONG
DECLARE LONG GdipCreatePen1 IN GDIPLUS.DLL  LONG,Single,LONG,LONG @
DECLARE LONG GdipCreateSolidFill IN GDIPLUS.DLL  LONG Argb, LONG @Solibrush
DECLARE LONG GdipFillPath IN GDIPLUS.DLL  LONG graphics, LONG brush, LONG lpath
DECLARE LONG GdipSetInterpolationMode IN GDIPLUS.DLL  LONG,LONG
DECLARE LONG GdipDeleteFontFamily IN GdiPlus.dll LONG
DECLARE LONG GdipDisposeImage IN Gdiplus.dll LONG
DECLARE LONG GdipDeleteGraphics IN gdiplus LONG
DECLARE LONG GdipDeleteBrush IN GDIPLUS.DLL LONG

*lparameters lcText,uFont,tnSize,AColor,FColor,tnWidth,tnHeight,uName
lcText='Visual FoxPro Is Coll!'&&Ҫ���Ƶ�����
uFont='Comic Sans MS'&&�����ļ������壬��������ע�������
tnSize=26&&���ִ�С
AColor=RGB(0,255,0)&&��Ȧ��ɫ
FColor=0&&������ɫ
tnWidth=300&&ͼ�ο��
tnHeight=40&&ͼ�θ߶�
uName='cool.png'&&ͼ�α������ļ���,��δ������Ұ�ͼ������Ϊ��PNG��ʽ
w=tnWidth
h=tnHeight
aphpi=255&&͸����
ApertureColor=CTOBIN(CHR(255)+LEFT(BINTOC(AColor,'4rs'),3),'4s')&&��Ȧ��ɫתΪEAGB��ʽ
FontColor=CTOBIN(CHR(aphpi)+LEFT(BINTOC(FColor,'4rs'),3),'4s')&&������ɫ
****����graphics����
STORE 0 TO tnX,tnY,hBrush,loBmp,loGfx,Fillmode,lpath,lnFont,lnFontFamily,lnFormatHandle,x,y
STORE 0 TO matrix,lpen1,UnitWorld,lhBrush,loBmp1,oGfx,lhBrush2
lnFormat = 0x0026200A&&32λPNG��ʽ
stats=GdipCreateBitmapFromScan0(INT(tnWidth/5),INT(tnHeight/5),0,lnFormat,0,@loBmp)&&����һ����ԭ��1/5������λͼ
GdipGetImageGraphicsContext(loBmp,@loGfx)
GdipCreatePath(Fillmode,@lpath)&&����һ��·��
****�����������
lcFontName=STRCONV(uFont+CHR(0),5)
GdipCreateFontFamilyFromName(lcFontName,0,@lnFontFamily)
lnFontStyle=1&&�������ͣ�0Ĭ�ϣ�1�Ӵ֣�2��б3=1+2�Ӵ���б 4U 8 S
thAlignment=3&&�����ʽ ����
GdipCreateStringFormat(0,0,@lnFormatHandle )
nAlign = lnFormatHandle
lcRectangleF=BINTOC(x,'F')+BINTOC(y,'F')+BINTOC(INT(tnWidth),'F')+BINTOC(INT(tnHeight),'F')&&��������
GdipAddPathString(lpath,STRCONV(lcText+0h00,5),LENC(lcText),lnFontFamily,lnFontStyle,tnSize,@lcRectangleF,lnFormatHandle)&&���·��
GdipCreateMatrix2(1/5, 0, 0, 1/5, -1/5, -1/5,@matrix)&&����һ������
SmoothingModeAntiAlias=4&&�������
SmoothingModeNone= 3
GdipSetSmoothingMode(loGfx,SmoothingModeAntiAlias)&&����ͼ��ƽ����
GdipSetWorldTransform(loGfx,matrix)
tnWidth=3&&���ʿ��
GdipCreatePen1(ApertureColor,tnWidth,UnitWorld,@lPen1)&&����Ȧ��ɫ��������
GdipDrawPath(loGfx,lPen1,lpath)&&����·��
GdipCreateSolidFill(ApertureColor, @lhBrush)
GdipFillPath(loGfx,lhBrush,lpath)
GdipCreateBitmapFromScan0(w,h,0,lnFormat,0,@loBmp1)&&����һ�� zhengchang������λͼ
GdipGetImageGraphicsContext(loBmp1,@oGfx)
GdipSetSmoothingMode(oGfx,SmoothingModeAntiAlias)&&
HighQualityBicubic =7
GdipSetInterpolationMode(oGfx,HighQualityBicubic)&&
GdipDrawImageRect(oGfx,loBmp,0,0,w,h)
GdipCreateSolidFill(FontColor, @lhBrush2)
GdipFillPath(oGfx,lhBrush2,lpath)
******������������ͼ���ļ������ء�����������******
lqEncoderClsID_PNG=0h06F47C55041AD3119A730000F81EF32E &&PNG
GdipSaveImageToFile(lobmp1,STRCONV(uName+CHR(0),5),lqEncoderClsID_PNG,0)&&���浽����
******�����������ٶ��󡪡���������******
GdipDeleteBrush(lhBrush)
GdipDisposeImage(lobmp)
GdipDeleteGraphics(loGfx)
GdipDeleteBrush(lhBrush2)
GdipDisposeImage(lobmp1)
GdipDeleteGraphics(oGfx)