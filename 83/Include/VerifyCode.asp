<%
Class NwebCn_VerifyCode
        Public GlobalColorTable(), LocalColorTable()
        Public TransparentColorIndex, UseTransparency
        Public GIF89a
        Public Comment

        Private FGroundColorIndex, BGroundColorIndex
        Private Image
        Private GlobalColorTableSize, GlobalColorTableFlag, LocalColorTableSize, LocalColorTableFlag
        Private Width_, Height_
        Private LeftPosition, TopPosition
        Private Bits, ColorResolution, CodeSize
        Private PixelASPectRatio
        Private SortFlag, InterlaceFlag
        Private Seperator, GraphicControl, EndOfImage
        Private Reserved

        Private Font
        Private Letter(19)

        Private Sub Class_Initialize()
                  Image = ""
    
                  GIF89a = False
  
                  ReDim GlobalColorTable(256)
                  GlobalColorTableSize = 7
                  GlobalColorTableFlag = True
  
                  GlobalColorTable(2) = RGB(255, 0, 0)
                  GlobalColorTable(3) = RGB(0, 255, 0)
                  GlobalColorTable(4) = RGB(0, 0, 255)
                  GlobalColorTable(5) = RGB(255, 255, 0)
                  GlobalColorTable(6) = RGB(0, 255, 255)
                  GlobalColorTable(7) = RGB(255, 0, 255)
  
                  ReDim LocalColorTable(0)
                  LocalColorTableSize = 0
                  LocalColorTableFlag = False
  
                  ColorResolution = 7
                  Bits   = 7
                  CodeSize  = 7
  
                  BGroundColorIndex = 0
                  FGroundColorIndex = 1
                  TransparentColorIndex = 0
                  UseTransparency  = False
  
                  LeftPosition = 0
                  TopPosition  = 0
                  Width_   = 20
                  Height_   = 20
  
                  Clear
  
                  PixelASPectRatio = 0
                  SortFlag   = False
                  InterlaceFlag  = False
                  Seperator   = Asc(",")
                  GraphicControl  = Asc("!")
                  EndOfImage   = Asc(";")
  
                  Comment = ""
  
                  Reserved = 0
  
                  Set Font = Server.CreateObject("Scripting.Dictionary")

                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00001111100000"
                  Letter(2)  = "00011111110000"
                  Letter(3)  = "00111000111000"
                  Letter(4)  = "00110000011100"
                  Letter(5)  = "01110000001100"
                  Letter(6)  = "01100000001110"
                  Letter(7)  = "01100000001110"
                  Letter(8)  = "11100000001110"
                  Letter(9)  = "11000000001110"
                  Letter(10) = "11000000001110"
                  Letter(11) = "11100000001110"
                  Letter(12) = "11100000001100"
                  Letter(13) = "11100000001100"
                  Letter(14) = "01100000001100"
                  Letter(15) = "01110000011100"
                  Letter(15) = "00111000011000"
                  Letter(16) = "00011111110000"
                  Letter(17) = "00001111100000"
                  Letter(18) = "00000000000000"
                  Font.Add "0", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00000001110000"
                  Letter(2)  = "00000001110000"
                  Letter(3)  = "00000011100000"
                  Letter(4)  = "00000011000000"
                  Letter(5)  = "00000011000000"
                  Letter(6)  = "00000011000000"
                  Letter(7)  = "00000111000000"
                  Letter(8)  = "00000111000000"
                  Letter(9)  = "00000111000000"
                  Letter(10) = "00000110000000"
                  Letter(11) = "00000110000000"
                  Letter(12) = "00000110000000"
                  Letter(13) = "00000110000000"
                  Letter(14) = "00000110000000"
                  Letter(15) = "00000110000000"
                  Letter(15) = "00000110000000"
                  Letter(16) = "00000110000000"
                  Letter(17) = "00000010000000"
                  Letter(18) = "00000000000000"
                  Font.Add "1", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00001111110000"
                  Letter(2)  = "00011111111000"
                  Letter(3)  = "00111000011100"
                  Letter(4)  = "01110000011100"
                  Letter(5)  = "01110000011000"
                  Letter(6)  = "01100000011000"
                  Letter(7)  = "00000000111000"
                  Letter(8)  = "00000001110000"
                  Letter(9)  = "00000001110000"
                  Letter(10) = "00000011000000"
                  Letter(11) = "00000111000000"
                  Letter(12) = "00001110000000"
                  Letter(13) = "00011000000000"
                  Letter(14) = "00011000000000"
                  Letter(15) = "00110000011100"
                  Letter(16) = "01101111111100"
                  Letter(17) = "01111111111110"
                  Letter(18) = "01111100000000"
                  Letter(19) = "00000000000000"
                  Font.Add "2", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00001111111000"
                  Letter(2)  = "00111111111000"
                  Letter(3)  = "01110000111100"
                  Letter(4)  = "01100000011000"
                  Letter(5)  = "01000000111000"
                  Letter(6)  = "00000000111000"
                  Letter(7)  = "00000001110000"
                  Letter(8)  = "00000011000000"
                  Letter(9)  = "00000111110000"
                  Letter(10) = "00000100111000"
                  Letter(11) = "00000000011100"
                  Letter(12) = "00000000011100"
                  Letter(13) = "00000000011100"
                  Letter(14) = "00000000011100"
                  Letter(15) = "00000000011000"
                  Letter(16) = "11100000111000"
                  Letter(17) = "11111111110000"
                  Letter(18) = "01111111100000"
                  Letter(19) = "00000000000000"
                  Font.Add "3", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00000000111000"
                  Letter(2)  = "00000001111000"
                  Letter(3)  = "00000011100000"
                  Letter(4)  = "00000111011100"
                  Letter(5)  = "00001110011100"
                  Letter(6)  = "00001100011000"
                  Letter(7)  = "00011000111000"
                  Letter(8)  = "00111000110000"
                  Letter(9)  = "01110000110000"
                  Letter(10) = "01100000110000"
                  Letter(11) = "01100000110000"
                  Letter(12) = "11000111111110"
                  Letter(13) = "11111111111100"
                  Letter(14) = "11111111100000"
                  Letter(15) = "11100001100000"
                  Letter(16) = "00000001110000"
                  Letter(17) = "00000000110000"
                  Letter(18) = "00000000110000"
                  Letter(19) = "00000000100000"
                  Font.Add "4", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00001100000100"
                  Letter(2)  = "00011111111110"
                  Letter(3)  = "00011111111100"
                  Letter(4)  = "00011110000000"
                  Letter(5)  = "00011000000000"
                  Letter(6)  = "00111000000000"
                  Letter(7)  = "00111000000000"
                  Letter(8)  = "00111111110000"
                  Letter(9)  = "00111111111000"
                  Letter(10) = "00000000011000"
                  Letter(11) = "00000000011000"
                  Letter(12) = "00000000011000"
                  Letter(13) = "00000000011000"
                  Letter(14) = "00000000011000"
                  Letter(15) = "00000000011000"
                  Letter(16) = "00000001111000"
                  Letter(17) = "01111111110000"
                  Letter(18) = "00111111000000"
                  Letter(19) = "00000000100000"
                  Font.Add "5", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00000011110000"
                  Letter(2)  = "00000111100000"
                  Letter(3)  = "00001110000000"
                  Letter(4)  = "00011100000000"
                  Letter(5)  = "00111000000000"
                  Letter(6)  = "00110000000000"
                  Letter(7)  = "00110000000000"
                  Letter(8)  = "01111111110000"
                  Letter(9)  = "01111111111000"
                  Letter(10) = "01110000011100"
                  Letter(11) = "01100000001100"
                  Letter(12) = "01100000001100"
                  Letter(13) = "01100000001100"
                  Letter(14) = "01100000001100"
                  Letter(15) = "01110000011100"
                  Letter(16) = "00110000011100"
                  Letter(17) = "00111111111000"
                  Letter(18) = "00011111110000"
                  Letter(19) = "00000000000000"
                  Font.Add "6", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00100111111110"
                  Letter(2)  = "01111111111100"
                  Letter(3)  = "01111110011100"
                  Letter(4)  = "00000000011000"
                  Letter(5)  = "00000000111000"
                  Letter(6)  = "00000000110000"
                  Letter(7)  = "00000000110000"
                  Letter(8)  = "00000000110000"
                  Letter(9)  = "00000001110000"
                  Letter(10) = "00000001100000"
                  Letter(11) = "00000001100000"
                  Letter(12) = "00000001100000"
                  Letter(13) = "00000001100000"
                  Letter(14) = "00000011100000"
                  Letter(15) = "00000011100000"
                  Letter(16) = "00000011100000"
                  Letter(17) = "00000001000000"
                  Letter(18) = "00000001000000"
                  Letter(19) = "00000000000000"
                  Font.Add "7", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00001111110000"
                  Letter(2)  = "00011111111000"
                  Letter(3)  = "00111000011000"
                  Letter(4)  = "00110000011000"
                  Letter(5)  = "01110000011100"
                  Letter(6)  = "01110000011000"
                  Letter(7)  = "00110000011000"
                  Letter(8)  = "00111101111000"
                  Letter(9)  = "00011111111000"
                  Letter(10) = "00111000111100"
                  Letter(11) = "01110000001100"
                  Letter(12) = "01110000001100"
                  Letter(13) = "01100000001110"
                  Letter(14) = "01100000001100"
                  Letter(15) = "01100000001100"
                  Letter(16) = "01110000011100"
                  Letter(17) = "00111111111100"
                  Letter(18) = "00011111110000"
                  Letter(19) = "00000000000000"
                  Font.Add "8", Letter
  
                  Letter(0)  = "00000000000000"
                  Letter(1)  = "00011111110000"
                  Letter(2)  = "00111111111000"
                  Letter(3)  = "01110000111000"
                  Letter(4)  = "01110000011100"
                  Letter(5)  = "01100000001100"
                  Letter(6)  = "01100000001100"
                  Letter(7)  = "01100000001100"
                  Letter(8)  = "01100000001100"
                  Letter(9)  = "01110000011100"
                  Letter(10) = "00111111111100"
                  Letter(11) = "00011111111100"
                  Letter(12) = "00000000011000"
                  Letter(13) = "00000000011000"
                  Letter(14) = "00000000111000"
                  Letter(15) = "00000001110000"
                  Letter(16) = "00000011100000"
                  Letter(17) = "00000111000000"
                  Letter(18) = "00011110000000"
                  Letter(19) = "00000000000000"
                  Font.Add "9", Letter
        End Sub 
Private Sub Class_Terminate()
                  Font.RemoveAll
                  Set Font = Nothing
        End Sub

        Public Property Get Width()
                  Width = Width_
        End Property

        Public Property Get Height()
                  Height = Height_
        End Property

        Public Property Get Version()
                  Version = "NwebCn VerifyCode Class Build 20080608"
        End Property

        Public Property Let BGroundColor(ByVal Color)
                  GlobalColorTable(0) = MakeColor(Color)
                  BGroundColorIndex = 0
        End Property

        Public Property Let FGroundColor(ByVal Color)
                  GlobalColorTable(1) = MakeColor(Color)
                  FGroundColorIndex = 1
        End Property

        Public Property Get Pixel(ByVal PX, ByVal PY)
                  If (PX > 0 And PX <= Width_) And (PY > 0 And PY <= Height_) Then
                           Pixel = AscB(MidB(Image, (Width_ * (PY - 1)) + PX, 1))
                  Else
                           Pixel = 0
                  End If
        End Property

        Public Property Let Pixel(ByVal PX, ByVal PY, PValue)
                  Dim Offset
  
                  PX  = Int(PX)
                  PY  = Int(PY)
                  PValue = Int(PValue)
  
                  Offset = Width_ * (PY - 1)
  
                  If (PX > 0 And PX <= Width_) And (PY > 0 And PY <= Height_) Then
                           Image = LeftB(Image, Offset + (PX - 1)) & ChrB(PValue) & RightB(Image, LenB(Image) - (Offset + PX))
                  End If
        End Property

        Public Sub Clear()
                  Image = String(Width_ * (Height_ + 1) / 2, ChrB(BGroundColorIndex) & ChrB(BGroundColorIndex))
        End Sub

        Public Sub Resize(ByVal NewWidth, ByVal NewHeight, RPreserve)
                  Dim OldImage, OldWidth, OldHeight
                  Dim CopyWidth, CopyHeight
                  Dim X, Y
  
                  If RPreserve Then
                           OldImage = Image
                           OldWidth = Width_
                           OldHeight = Height_
                  End If
  
                  Width_ = NewWidth
                  Height_ = NewHeight
  
                  Clear
  
                  If RPreserve Then
                           If NewWidth > OldWidth Then CopyWidth = OldWidth Else CopyWidth = NewWidth
                           If NewHeight > OldHeight Then CopyHeight = OldHeight Else CopyHeight = NewHeight
   
                           Width_ = NewWidth
                           Height_ = NewHeight
   
                           For Y = 1 To CopyHeight
                                    For X = 1 To CopyWidth
                                             Pixel(X, Y) = AscB(MidB(OldImage, (OldWidth * (Y - 1)) + X, 1))
                                    Next
                           Next
                  End If
        End Sub

        Private Function ShiftLeft(SLValue, SLBits)
                  ShiftLeft = SLValue * (2 ^ SLBits)
        End Function

        Private Function ShiftRight(SRValue, SRBits)
                  ShiftRight = Int(SRValue / (2 ^ SRBits))
        End Function

        Private Function Low(LValue)
                  Low = LValue And &HFF
        End Function

        Private Function High(HValue)
                  High = ShiftRight(HValue, 8)
        End Function

        Private Function Blue(BValue)
                  Blue = Low(ShiftRight(BValue, 16))
        End Function

        Private Function Green(GValue)
                  Green = Low(ShiftRight(GValue, 8))
        End Function

        Private Function Red(RValue)
                  Red = Low(RValue)
        End Function

        Private Function MakeColor(MCValue)
                  MakeColor = CLng("&H" & Right(MCValue, 2) & Mid(MCValue, 4, 2) & Mid(MCValue, 2, 2))
        End Function

        Private Function Getword(GWValue)
                  Getword = ShiftLeft(AscB(RightB(GWValue, 1)), 8) Or AscB(LeftB(GWValue, 1))
        End Function

        Private Function Makeword(MWValue)
                  Makeword = ChrB(Low(MWValue)) & ChrB(High(MWValue))
        End Function

        Private Function MakeByte(MBValue)
                  MakeByte = ChrB(Low(MBValue))
        End Function

        Private Function UncompressedData()
                  Dim ClearCode, ChunkMax, EndOfStream
                  Dim UDData, UD, U
  
                  UncompressedData = ""
  
                  ClearCode   = 2 ^ Bits
                  ChunkMax   = 2 ^ Bits - 2
                  EndOfStream   = ClearCode + 1
  
                  UDData    = ""
  
                  For U = 1 To LenB(Image) Step ChunkMax
                           UDData = UDData & MidB(Image, U, ChunkMax) & ChrB(ClearCode)
                  Next
  
                  For U = 1 To LenB(UDData) Step &HFF
                           UD     = MidB(UDData, U, &HFF)
                           UncompressedData = UncompressedData & MakeByte(LenB(UD)) & UD
                  Next
  
                  UncompressedData = UncompressedData & MakeByte(&H00)
                  UncompressedData = UncompressedData & MakeByte(EndOfStream)
        End Function

        Private Function GetGColorTable()
                  Dim GGCT
  
                  GetGColorTable = ""
  
                  For GGCT = 0 To UBound(GlobalColorTable) - 1
                           GetGColorTable = GetGColorTable & MakeByte(Red(GlobalColorTable(GGCT)))
                           GetGColorTable = GetGColorTable & MakeByte(Green(GlobalColorTable(GGCT)))
                           GetGColorTable = GetGColorTable & MakeByte(Blue(GlobalColorTable(GGCT)))
                  Next
        End Function

        Private Function GetLColorTable()
                  Dim GLCT

                  GetLColorTable = ""
  
                  For GLCT = 0 To UBound(LocalColorTable) - 1
                           GetLColorTable = GetLColorTable & MakeByte(Red(LocalColorTable(GLCT)))
                           GetLColorTable = GetLColorTable & MakeByte(Green(LocalColorTable(GLCT)))
                           GetLColorTable = GetLColorTable & MakeByte(Blue(LocalColorTable(GLCT)))
                  Next
        End Function

        Private Function GlobalDescriptor()
                  GlobalDescriptor = 0
  
                  If GlobalColorTableFlag Then GlobalDescriptor = GlobalDescriptor Or ShiftLeft(1, 7)
                  GlobalDescriptor = GlobalDescriptor Or ShiftLeft(ColorResolution, 7)
                  If SortFlag Then GlobalDescriptor = GlobalDescriptor Or ShiftLeft(1, 3)
                  GlobalDescriptor = GlobalDescriptor Or GlobalColorTableSize
        End Function

        Private Function LocalDescriptor()
                  LocalDescriptor = 0
  
                  If LocalColorTableFlag Then LocalDescriptor = LocalDescriptor Or ShiftLeft(1, 7)
                  If InterlaceFlag Then LocalDescriptor = LocalDescriptor Or ShiftLeft(1, 6)
                  If SortFlag Then LocalDescriptor = LocallDescriptor Or ShiftLeft(1, 5)
                  LocalDescriptor = LocalDescriptor Or ShiftLeft(Reserved, 3)
                  LocalDescriptor = LocalDescriptor Or LocalColorTableSize
        End Function

        Private Property Get ImageData()
                  Dim Text, I
  
                  ImageData = GIFHeader
                  ImageData = ImageData & Makeword(Width_)
                  ImageData = ImageData & Makeword(Height_)
                  ImageData = ImageData & MakeByte(GlobalDescriptor)
                  ImageData = ImageData & MakeByte(BGroundColorIndex)
                  ImageData = ImageData & MakeByte(PixelASPectRatio)
                  ImageData = ImageData & GetGColorTable
  
                  If GIF89a Then
                           If UseTransparency Then
                                    ImageData = ImageData & MakeByte(GraphicControl)
                                    ImageData = ImageData & MakeByte(&HF9)
                                    ImageData = ImageData & MakeByte(&H04)
                                    ImageData = ImageData & MakeByte(&H01)
                                    ImageData = ImageData & MakeByte(&H00)
                                    ImageData = ImageData & MakeByte(TransparentColorIndex)
                                    ImageData = ImageData & MakeByte(&H00)
                           End If
   
                           If Comment <> "" Then
                                    ImageData = ImageData & MakeByte(GraphicControl)
                                    ImageData = ImageData & MakeByte(&HFE)
                                    Text = Left(Comment, &HFF)
                                    ImageData = ImageData & MakeByte(Len(Text))
                                    For I = 1 To Len(Text)
                                             ImageData = ImageData & MakeByte(Asc(Mid(Text, I, 1)))
                                    Next
                                    ImageData = ImageData & MakeByte(&H00)
                           End If
                  End If
  
                  ImageData = ImageData & MakeByte(Seperator)
                  ImageData = ImageData & Makeword(LeftPosition)
                  ImageData = ImageData & Makeword(TopPosition)
                  ImageData = ImageData & Makeword(Width_)
                  ImageData = ImageData & Makeword(Height_)
                  ImageData = ImageData & MakeByte(LocalDescriptor)
                  ImageData = ImageData & MakeByte(CodeSize)
                  ImageData = ImageData & UncompressedData
                  ImageData = ImageData & MakeByte(&H00)
                  ImageData = ImageData & MakeByte(EndOfImage)
        End Property

        Public Sub ImgWrite()
				  Response.Buffer = True 
				  Response.Expires = 0 
				  Response.CacheControl = "no-cache" 
				  Response.AddHeader "Pragma", "No-Cache" 
                  Response.ContentType = "image/gif"
                  Response.BinaryWrite ImageData
        End Sub

        Private Function GIFHeader()
                  GIFHeader = ""
                  GIFHeader = GIFHeader & ChrB(Asc("G"))
                  GIFHeader = GIFHeader & ChrB(Asc("I"))
                  GIFHeader = GIFHeader & ChrB(Asc("F"))
                  GIFHeader = GIFHeader & ChrB(Asc("8"))
                  If GIF89a Then 
                        GIFHeader = GIFHeader & ChrB(Asc("9")) 
                Else 
                        GIFHeader = GIFHeader & ChrB(Asc("7")) 
                End If
                  GIFHeader = GIFHeader & ChrB(Asc("a"))
        End Function

        Public Sub VerifyCode(Text, VCColor)
                  Dim I1, I2, I3
                  Dim VCX, VCY, VCIndex
  
                  Resize 14 * Len(Text) + 10, UBound(Letter) + 10, False
  
                  Randomize
                  VCX = Int(Rnd * 10)
                  VCY = Int(Rnd * (Height_ - UBound(Letter)))
  
                  For I1 = 0 To UBound(Letter) - 1
                           For I2 = 1 To Len(Text)
                                    For I3 = 1 To Len(Font(Mid(Text, I2, 1))(I1))
                                             VCIndex = CLng(Mid(Font(Mid(Text, I2, 1))(I1), I3, 1))
     
                                             If VCIndex <> 0 Then
                                                      If VCColor Then
                                                               Randomize
                                                               VCIndex = Int(Rnd * 7)
                                                      End If
      
                                                      Pixel(VCX + ((I2 - 1) * Len(Letter(0))) + I3, VCY + I1) = VCIndex
                                             End If
                                    Next
                           Next
                  Next
        End Sub

        Public Sub Noises(Amount, NColor)
                  Dim NI, NIndex
    
                  For NI = 1 To Amount
                           NIndex = 1
   
                           If NColor Then
                                    Randomize
                                    NIndex = Int(Rnd * 7)
                           End If
   
                           Pixel(Int(Rnd * Width_), Int(Rnd * Height_)) = NIndex
                  Next
        End Sub

End Class

'验证码
Call ShowCode("VerifyCode")   '指定一个相对验证码的Session
Sub ShowCode(SessionName)
        Set img = New NwebCn_VerifyCode
        Randomize
        Dim code
        code = Int(Rnd * 9000 + 1000)
        Session(SessionName) = cstr(code)
        img.BGroundColor = "#FFFFFF" ' 图片背景颜色
        img.FGroundColor = "#FF0000" ' 前景（文本）颜色
        Call img.VerifyCode(code, True)  ' 处理验证码，第二个参数为是否显示彩色文本
        Call img.Noises(100, True)   ' 添加杂点，第一个参数为杂点数量，第二个参数为是否显示彩色杂点
        img.ImgWrite ' 输出图片
End Sub
%> 