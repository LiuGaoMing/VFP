FUNCTION resizeimage(pSourceFileNAme as String,pNewFileNAme as String,nWidth as Long,nHeight as long)
PRIVATE pSourceFileNAme,pNewFileNAme,nWidth,nHeight
DECLARE INTEGER GdiplusStartup IN gdiplus;
   INTEGER @token, STRING @INPUT, INTEGER OUTPUT
DECLARE INTEGER GdipSaveImageToFile IN gdiplus.DLL ;
   INTEGER nImage, STRING wFilename, STRING qEncoder, INTEGER nEncoderParamsPtr
DECLARE INTEGER GdipLoadImageFromFile IN gdiplus.DLL ;
   STRING wFilename, INTEGER @nImage
DECLARE INTEGER GdipGetImageGraphicsContext IN gdiplus.DLL ;
   INTEGER nImage, INTEGER @ nGraphics
DECLARE INTEGER GdipCreateBitmapFromScan0 IN gdiplus.DLL ;
   INTEGER nWidth, INTEGER nHeight, INTEGER nStride;
   , INTEGER nPixelFormat ;
   , STRING @ cScan0, INTEGER @ nImage
DECLARE INTEGER GdipDrawImageRect IN gdiplus.DLL ;
   INTEGER nGraphics, INTEGER nImage, SINGLE,SINGLE,SINGLE,SINGLE
DECLARE INTEGER CLSIDFromString IN ole32 STRING lpsz, STRING @pclsid
DECLARE INTEGER GdiplusShutdown IN gdiplus INTEGER token
DECLARE integer GdipDisposeImage IN gdiplus  long

 

LOCAL hToken, cInput
hToken = 0
cInput = PADR(CHR(1), 16, CHR(0))
GdiplusStartup(@hToken, @cInput, 0)

LOCAL nImage
nImage = 0
GdipLoadImageFromFile(STRCONV(pSourceFileNAme + CHR(0), 5), @nImage)
#DEFINE   GDIPLUS_PIXELFORMAT_32bppARGB          0x0026200A

LOCAL nBitmap, nWidth, nHeight, nX, nY
nBitmap = 0
nX = 0
nY = 0
GdipCreateBitmapFromScan0(nWidth, nHeight, 0, GDIPLUS_PIXELFORMAT_32bppARGB, 0, @nBitmap)

LOCAL nGraphics
nGraphics = 0
GdipGetImageGraphicsContext (nBitmap, @nGraphics)

GdipDrawImageRect(nGraphics, nImage, nX, nY, nWidth, nHeight)
LOCAL lcEncoder
lcEncoder = REPLICATE(CHR(0),16)

*CLSIDFromString(STRCONV("{557CF401-1A04-11D3-9A73-0000F81EF32E}" + CHR(0), 5), @lcEncoder)

ERASE (pNewFileNAme)
*GdipSaveImageToFile (nBitmap, STRCONV(pNewFileNAme,5) + CHR(0), lcEncoder, 0)
GdipSaveImageToFile (nBitmap, STRCONV(pNewFileNAme,5) + CHR(0), 0h00F47C55041AD3119A730000F81EF32E, 0)
GdipDisposeImage(@nImage)


GdiplusShutdown(hToken)

 

CLEAR DLLS
ENDFUNC