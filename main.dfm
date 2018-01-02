object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'AHORCADO'
  ClientHeight = 574
  ClientWidth = 811
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LblDescripcion: TLabel
    Left = 56
    Top = 445
    Width = 69
    Height = 18
    Caption = 'Pista #1:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LblPista1: TLabel
    Left = 139
    Top = 447
    Width = 50
    Height = 16
    Caption = 'LblPista1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object LblTitulo: TLabel
    Left = 341
    Top = 32
    Width = 121
    Height = 25
    Alignment = taCenter
    Caption = 'AHORCADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNguions: TLabel
    Left = 352
    Top = 393
    Width = 87
    Height = 23
    Alignment = taCenter
    Caption = 'lblNguions'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblAciertos: TLabel
    Left = 570
    Top = 32
    Width = 67
    Height = 18
    Caption = 'Aciertos:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblErrores: TLabel
    Left = 674
    Top = 32
    Width = 61
    Height = 18
    Caption = 'Errores:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblDescripcion2: TLabel
    Left = 56
    Top = 479
    Width = 69
    Height = 18
    Caption = 'Pista #2:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPista2: TLabel
    Left = 139
    Top = 481
    Width = 50
    Height = 16
    Caption = 'LblPista2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDescripcion3: TLabel
    Left = 56
    Top = 511
    Width = 69
    Height = 18
    Caption = 'Pista #3:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblPista3: TLabel
    Left = 139
    Top = 513
    Width = 50
    Height = 16
    Caption = 'LblPista3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object imgAhorcado: TImage
    Left = 272
    Top = 72
    Width = 249
    Height = 250
    Picture.Data = {
      0954506E67496D61676589504E470D0A1A0A0000000D49484452000001210000
      01420806000000BE7D6BEF000000017352474200AECE1CE90000000467414D41
      0000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B000005
      D14944415478DAEDDB0B8EE4260040C1CCFD0F9D6C222593DD9DE9F607FBD9A6
      EA0008817848487CFCF9C31F00910F11024A2204A44408488910901221202542
      037D7C7CD45380CB589A16111A4884E093080544083E89D049840796F92E3522
      B49308C13222741011826544E8202204CB88D0415E45C8D29E6FE9A5606F8EB1
      E53C88D04E22743D42D411A180085D93103544282042D72544E713A180085D9B
      109D4B840222747D42741E110A88D03D08D13944282042F72144C713A18008DD
      8B101D4B840222743F42741C110A88D03D09D13144282042F72544E389504084
      EE4D88C612A18008DD9F108D234201117A06211A43840222F41C42B49F080544
      E85984681F110A88D0F308D176221410A16712A26D44282042CF2544EB895040
      849E4D88D611A180083D9F102D274201119A83102D234201119A8710BD274201
      119A8B10BD264201119A8F107D4F840222342721FA9A080544685E42F43B110A
      88D0DC84E8672214102184E89308054488BF09D1FB7510A1838810FF1222114A
      8810FF377B8844282042FC6AE61089504084F8CAAC2112A18008F19D19432442
      0111E295D94224420111E29D994224420111628959422442011162A919422442
      0111628DA78748840222C45A4F0E91080544882D9E1A22110A88105B3D314422
      141021F6785A8844282042ECF5A4108950408418E1292112A1800831CA134224
      42011162A4BB8748840222C468770E910805448823DC3544221410218E72C710
      89103CCCDD422442F040770A9108C143DD254422040F76871089103CDCD54324
      4230812B8748846012570D9108C144AE18221182C95C2D44220413BA52884408
      2675951089104CEC0A211221985C1D221102D2108910F08F2A442204FCA70891
      08013F393B442204FCE6CC108910F0A5B3422442C0B7CE089108012F1D1D2211
      02DE3A324422042C725488440858EC88108910B0CAE8108910B0DAC8108910B0
      C9A8108910B0D988108910B0CBDE108910B0DB9E10891030C4D610891030CC96
      10891030D4DA10891030DC9A1089107088A5217A4584805DF686488480DDF684
      48848021B68648848061B684488480A1D686488480E1D68448848043ECFEF42A
      42C05E4B422442C0A1DE85488480C3F9B601A44408488910901221202542404A
      8480940801291102522204A44408488910901221202542404A84809408012911
      02522204A44408488910901221202542404A8480940801291102522204A44408
      488910901221202542404A8480940801291102522204A4440848891090122120
      2542404A8480940801291102522204A44408488910901221202542404A848094
      0801291102522204A44408488910901221202542404A84809408012911025222
      04A44408488910901221202542404A8480940801291102522204A44408488910
      901221202542404A8480940801291102522204A4440848891090122120254240
      4A8480940801291102522204A44408488910901221202542404A848094080129
      1102522204A44408488910901221202542404A8480940801291102522204A444
      08488910901221202542404A8480940801291102522204A44408488910901221
      202542404A8480940801291102522204A44408488910901221202542404A8480
      940801291102522204A44408488910901221202542404A848094080129110252
      2204A44408488910901221202542404A8480940801291102522204A444084889
      10901221202542404A8480940801291102522204A44408488910901221202542
      404A8480940801291102522204A44408488910901221202542404A8480940801
      291102522204A44408488910901221202542404A8480940801291102522204A4
      4408488910901221202542404A8480940801291102522204A444084889109012
      21202542404A8480940801291102522204A44408488910901221202542404A84
      80940801291102522204A44408488910901221202542404A8480940801291102
      52C323F46A4080354408488910901221E0544B9F9B4508388408012911025243
      220470341102522204A4440848891090FA0BF7C947D1ED0B5621000000004945
      4E44AE426082}
    Stretch = True
  end
  object lblNivel: TLabel
    Left = 24
    Top = 34
    Width = 56
    Height = 23
    Caption = 'Nivel:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblNumero: TLabel
    Left = 86
    Top = 34
    Width = 100
    Height = 23
    Caption = 'lblNumero'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtTexto: TEdit
    Left = 264
    Top = 343
    Width = 273
    Height = 21
    TabOrder = 0
    OnKeyPress = edtTextoKeyPress
  end
  object btnPista: TButton
    Left = 678
    Top = 519
    Width = 115
    Height = 33
    Caption = 'Pista'
    TabOrder = 1
    OnClick = btnPistaClick
  end
  object btnEnviar: TButton
    Left = 543
    Top = 343
    Width = 50
    Height = 21
    Caption = 'Enviar'
    TabOrder = 2
    OnClick = btnEnviarClick
  end
end
