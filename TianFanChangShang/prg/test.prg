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
lcText='Visual FoxPro Is Coll!'&&要绘制的文字
uFont='Comic Sans MS'&&绘制文件的字体，必须是已注册的字体
tnSize=26&&文字大小
AColor=RGB(0,255,0)&&光圈颜色
FColor=0&&字体颜色
tnWidth=300&&图形宽度
tnHeight=40&&图形高度
uName='cool.png'&&图形保存后的文件名,这段代码中我把图形设置为了PNG格式
w=tnWidth
h=tnHeight
aphpi=255&&透明度
ApertureColor=CTOBIN(CHR(255)+LEFT(BINTOC(AColor,'4rs'),3),'4s')&&光圈颜色转为EAGB格式
FontColor=CTOBIN(CHR(aphpi)+LEFT(BINTOC(FColor,'4rs'),3),'4s')&&字体颜色
****创建graphics对象
STORE 0 TO tnX,tnY,hBrush,loBmp,loGfx,Fillmode,lpath,lnFont,lnFontFamily,lnFormatHandle,x,y
STORE 0 TO matrix,lpen1,UnitWorld,lhBrush,loBmp1,oGfx,lhBrush2
lnFormat = 0x0026200A&&32位PNG格式
stats=GdipCreateBitmapFromScan0(INT(tnWidth/5),INT(tnHeight/5),0,lnFormat,0,@loBmp)&&创建一个是原来1/5比例的位图
GdipGetImageGraphicsContext(loBmp,@loGfx)
GdipCreatePath(Fillmode,@lpath)&&创建一个路径
****创建字体对象
lcFontName=STRCONV(uFont+CHR(0),5)
GdipCreateFontFamilyFromName(lcFontName,0,@lnFontFamily)
lnFontStyle=1&&字体类型，0默认，1加粗，2倾斜3=1+2加粗倾斜 4U 8 S
thAlignment=3&&对其格式 居左
GdipCreateStringFormat(0,0,@lnFormatHandle )
nAlign = lnFormatHandle
lcRectangleF=BINTOC(x,'F')+BINTOC(y,'F')+BINTOC(INT(tnWidth),'F')+BINTOC(INT(tnHeight),'F')&&创建区域
GdipAddPathString(lpath,STRCONV(lcText+0h00,5),LENC(lcText),lnFontFamily,lnFontStyle,tnSize,@lcRectangleF,lnFormatHandle)&&填充路径
GdipCreateMatrix2(1/5, 0, 0, 1/5, -1/5, -1/5,@matrix)&&建立一个矩阵
SmoothingModeAntiAlias=4&&消除锯齿
SmoothingModeNone= 3
GdipSetSmoothingMode(loGfx,SmoothingModeAntiAlias)&&设置图形平滑度
GdipSetWorldTransform(loGfx,matrix)
tnWidth=3&&画笔宽度
GdipCreatePen1(ApertureColor,tnWidth,UnitWorld,@lPen1)&&按光圈颜色建立画笔
GdipDrawPath(loGfx,lPen1,lpath)&&绘制路径
GdipCreateSolidFill(ApertureColor, @lhBrush)
GdipFillPath(loGfx,lhBrush,lpath)
GdipCreateBitmapFromScan0(w,h,0,lnFormat,0,@loBmp1)&&创建一个 zhengchang比例的位图
GdipGetImageGraphicsContext(loBmp1,@oGfx)
GdipSetSmoothingMode(oGfx,SmoothingModeAntiAlias)&&
HighQualityBicubic =7
GdipSetInterpolationMode(oGfx,HighQualityBicubic)&&
GdipDrawImageRect(oGfx,loBmp,0,0,w,h)
GdipCreateSolidFill(FontColor, @lhBrush2)
GdipFillPath(oGfx,lhBrush2,lpath)
******————保存图形文件到本地——————******
lqEncoderClsID_PNG=0h06F47C55041AD3119A730000F81EF32E &&PNG
GdipSaveImageToFile(lobmp1,STRCONV(uName+CHR(0),5),lqEncoderClsID_PNG,0)&&保存到本地
******————销毁对象——————******
GdipDeleteBrush(lhBrush)
GdipDisposeImage(lobmp)
GdipDeleteGraphics(loGfx)
GdipDeleteBrush(lhBrush2)
GdipDisposeImage(lobmp1)
GdipDeleteGraphics(oGfx)