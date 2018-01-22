unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, AdvGlowButton, BiosGlowButton;

const
   C_WINNER   = 0; //Ganador.
   C_DEFEAT   = 1; //Perdedor.
   C_FULLWORD = 2; //Palabra completa.
   C_NEWLEVEL = 3; //Nuevo nivel.
   C_WORDUSED = 4; //Letra ya utilizada.
   C_END      = 5; //Termino el juego.
   C_NOGUESS  = 6; //No hay mas pistas para desplegar.
   C_NOTEXT   = 7; //Debe ingresar texto.
   C_NUMEROS  = 8; //Los numeros no son permitidos.
   C_TRYFULL  = 9;

type

  TForm1 = class(TForm)
    LblDescripcion: TLabel;
    LblPista1: TLabel;
    LblTitulo: TLabel;
    edtTexto: TEdit;
    lblNguions: TLabel;
    lblAciertos: TLabel;
    lblErrores: TLabel;
    btnPista: TButton;
    lblDescripcion2: TLabel;
    lblPista2: TLabel;
    lblDescripcion3: TLabel;
    lblPista3: TLabel;
    imgAhorcado: TImage;
    lblNivel: TLabel;
    lblNumero: TLabel;
    btnEnviar: TButton;
    procedure FormShow(Sender: TObject);
    procedure edtTextoKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure btnPistaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    function  BuscaAciertos(Letra : string) : Boolean;
    function  VerificarGanador : Boolean;
    function  verificarTexto(str : String) : Boolean;
    function  FraseUtilizada(Nmr : Integer) : Boolean;
    function  NFrasesPerLevel : Integer;
    function  Messages(Msg : Integer) : String;
    procedure Print(frs : Integer);
    procedure PrintGuion(Frase : String);
    procedure LlenarGuion(Letras : String; Pos : Integer);
    procedure SiguientePalabra;
    procedure CambiarImagen(nm : Integer);
    procedure ResetearJuego;
    { Private declarations }
  public
    { Public declarations }
    PFrase : Integer;
    nErrores,
    nAciertos,
    finalizo,
    nPistas,
    CurrentLevel,
    nLevel,
    l     : Integer;
    PosArray,
    FrasesEscogidas  : TStringList;
  end;

var
  Form1: TForm1;

implementation

uses
   Palabras;

{$R *.dfm}

procedure TForm1.edtTextoKeyPress(Sender: TObject; var Key: Char);
var
   i     : Integer;
   Texto : string;
begin
   //Si preciona enter
   if Key = #13 then
      begin
         Texto := edtTexto.Text;
         Texto := LowerCase(Texto);
         if Length(Texto) > 0 then
            begin
               if Length(Texto) = 1 then
                  begin
                     if not verificarTexto(Texto) then
                        begin
                           if BuscaAciertos(Texto) then
                              begin
                                 for i := 0 to PosArray.Count - 1 do
                                    begin
                                       LlenarGuion(Texto,StrToInt(PosArray[i]));
                                    end;
                                 nAciertos := nAciertos + 1;
                                 lblAciertos.Caption := 'Aciertos: ' + IntToStr(nAciertos);
                                 finalizo := finalizo + PosArray.Count;
                                 PosArray.Clear;
                                 edtTexto.SetFocus;

                                 if ( nAciertos = 6 ) and ( not ( VerificarGanador ) ) then
                                    begin
                                       Texto := InputBox('', Messages(C_TRYFULL), '');

                                       if Texto = FFrase.Frases[PFrase].Frase then
                                          begin
                                             lblNguions.Caption := Texto;
                                             ShowMessage(Messages(C_WINNER));
                                             SiguientePalabra;
                                             edtTexto.SetFocus;
                                          end
                                       else
                                          begin
                                             ShowMessage(Messages(C_DEFEAT));
                                             ResetearJuego;
                                             SiguientePalabra;
                                             edtTexto.SetFocus;
                                          end;

                                    end;

                                    //Devuelve true si se ha desifrado la palabra.
                                 if finalizo = Length(FFrase.Frases[PFrase].Frase) then
                                    begin
                                       if VerificarGanador then
                                          begin
                                             ShowMessage(Messages(C_WINNER));
                                             SiguientePalabra;
                                             edtTexto.SetFocus;
                                          end
                                       else
                                          begin
                                             ShowMessage(Messages(C_DEFEAT));
                                             ResetearJuego;
                                             SiguientePalabra;
                                             edtTexto.SetFocus;
                                          end;
                                    end;

                              end
                           else
                              begin
                                 nErrores := nErrores + 1;
                                 lblErrores.Caption := 'Errores: ' + IntToStr(nErrores);

                                 if nErrores = 6 then
                                    begin
                                       if VerificarGanador then
                                          begin
                                             ShowMessage(Messages(C_WINNER));
                                             SiguientePalabra;
                                             edtTexto.SetFocus;
                                          end
                                       else
                                          begin
                                             ShowMessage(Messages(C_DEFEAT));
                                             ResetearJuego;
                                             SiguientePalabra;
                                             edtTexto.SetFocus;
                                          end;
                                    end;

                                 CambiarImagen(nErrores);
                              end;
                        end
                     else
                        begin
                           ShowMessage(Messages(C_NUMEROS));
                           edtTexto.SetFocus;
                        end;
                  end
               else
                  begin
                     if (nErrores >= 0) and (nErrores < 5)then
                        begin
                           if (messagedlg(Messages(C_FULLWORD),mtError, mbYesNo, 0) = 6) then
                              begin
                                 if Texto = FFrase.Frases[PFrase].Frase then
                                    begin
                                       lblNguions.Caption := Texto;
                                       ShowMessage(Messages(C_WINNER));
                                       SiguientePalabra;
                                       edtTexto.SetFocus;
                                    end
                                 else
                                     begin
                                        nErrores := nErrores + 2;
                                        lblErrores.Caption := 'Errores: ' + IntToStr(nErrores);
                                        lblErrores.Color := clRed;

                                        if nErrores = 6 then
                                           begin
                                              if VerificarGanador then
                                                 begin
                                                    ShowMessage(Messages(C_WINNER));
                                                    SiguientePalabra;
                                                    edtTexto.SetFocus;
                                                 end
                                              else
                                                 begin
                                                    ShowMessage(Messages(C_DEFEAT));
                                                    ResetearJuego;
                                                    SiguientePalabra;
                                                    edtTexto.SetFocus;
                                                 end;
                                           end;
                                        CambiarImagen(nErrores);
                                     end;
                            end;
                        end;
                  end;
               edtTexto.Text := '';
            end
         else
            begin
               ShowMessage(Messages(C_NOTEXT));
               edtTexto.SetFocus;
            end;
      end;
end;

procedure TForm1.CambiarImagen(nm: Integer);
begin
   case nm of
      1 : imgAhorcado.Picture.LoadFromFile('C:/img/img2.png');
      2 : imgAhorcado.Picture.LoadFromFile('C:/img/img3.png');
      3 : imgAhorcado.Picture.LoadFromFile('C:/img/img4.png');
      4 : imgAhorcado.Picture.LoadFromFile('C:/img/img5.png');
      5 : imgAhorcado.Picture.LoadFromFile('C:/img/img6.png');
      6 : imgAhorcado.Picture.LoadFromFile('C:/img/img7.png');
   end;
end;

function TForm1.Messages(Msg: Integer) : String;
begin
   case Msg of
      C_WINNER   : Result := 'Felicitaciones =D haz ganado!!';
      C_DEFEAT   : Result := 'Has perdido, intentalo de nuevo =(';
      C_FULLWORD : Result := '¿Desea intentar con la palabra completa? Esto le descontara 2 intentos si no acierta';
      C_NEWLEVEL : Result := 'Pasaste al nivel numero ' + IntToStr(CurrentLevel) + ' ¡Felicidades!';
      C_WORDUSED : Result := 'Ya utilizo la letra ';
      C_END      : Result := 'No hay mas letras para jugar =(';
      C_NOGUESS  : Result := 'No hay mas pistas por desplegar.';
      C_NOTEXT   : Result := 'Error: Debe ingresar texto.';
      C_NUMEROS  : Result := 'Error: Numeros no son permitidos.';
      C_TRYFULL  : Result := 'Advertencia: Has llegado a 6 aciertos, debes intentar la palabra completa.';
   end;
end;

function TForm1.NFrasesPerLevel : Integer;
var
   i,
   f  : Integer;
begin
   f := 0;
   for i := 0 to High(FFrase.Frases) do
      begin
         if FFrase.Frases[i].Nivel = CurrentLevel then
            begin
               f := f + 1;
            end;
      end;
   Result := f;
end;

function TForm1.VerificarGanador : Boolean;
var
   PalabraFinal : string;
begin
   PalabraFinal := StringReplace(lblNguions.Caption, ' ', '', [rfReplaceAll, rfIgnoreCase]);
   //Devuelve true si se ha desifrado la palabra.
   if FFrase.Frases[PFrase].Frase = LowerCase(PalabraFinal) then
      Result := True
   else
      Result := False;
end;

function TForm1.verificarTexto(str : String) : Boolean;
begin
   try
      StrToInt(str);
      Result := True;
   except
      Result := False;
   end;

end;

procedure TForm1.ResetearJuego;
begin
   FrasesEscogidas.Clear;
   CurrentLevel := 1;
   lblNumero.Caption := IntToStr(CurrentLevel);
end;

procedure TForm1.SiguientePalabra;
begin
   //Reiniciamos las variables
   nErrores  := 0;
   nAciertos := 0;
   finalizo  := 0;
   nPistas   := 0;
   imgAhorcado.Picture.LoadFromFile('C:/img/img1.png');
   PFrase := FFrase.FraseEscogida;

   if FrasesEscogidas.Count <> High(FFrase.Frases) then
      begin
         if nLevel = 0 then
            begin
               l := NFrasesPerLevel;
            end;

         if nLevel < l then
            begin
               while FraseUtilizada(PFrase) do
                  begin
                     PFrase := FFrase.FraseEscogida;
                  end;
               FrasesEscogidas.Add(IntToStr(PFrase));
               Print(PFrase);
               nLevel := nLevel + 1;
            end
         else
            begin
               nLevel := 0;
               CurrentLevel := CurrentLevel + 1;
               ShowMessage(Messages(C_NEWLEVEL));
               lblNumero.Caption := IntToStr(CurrentLevel);
               SiguientePalabra;
               edtTexto.SetFocus;
            end;
      end
   else
      begin
         ShowMessage(Messages(C_END));
         edtTexto.SetFocus;
      end;

end;

function TForm1.FraseUtilizada(Nmr : Integer) : Boolean;
var
   i : Integer;
begin
   for i := 0 to FrasesEscogidas.Count - 1 do
      begin
        if (StrToInt(FrasesEscogidas[i]) = Nmr) then
           begin
              Result := True;
              Exit;
           end;
      end;

   if (FFrase.Frases[Nmr].Nivel <> CurrentLevel) then
      Result := True
   else
      Result := False;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
   ShowMessage('Bienvenido a Bio-Ahorcado, tiene 6 (aciertos y/o errores) para descubrir la palabra, buena suerte!');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
   FFrase := TFrases.Create;
   //Nivel actual
   CurrentLevel := 1;
   //Contador para recorrer el numero de palabras por nivel
   nLevel       := 0;
   //obtiene el numero de palabras por nivel
   l            := 0;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
   PosArray := TStringList.Create;
   FrasesEscogidas := TStringList.Create;
   //Numero de errores
   nErrores  := 0;
   //Numero de aciertos
   nAciertos := 0;
   //Acomula el numero de aciertos hasta llegar al tamaño de la palabra
   finalizo  := 0;
   //Numero de pistas
   nPistas   := 0;

   lblNumero.Caption := IntToStr(CurrentLevel);
   //Devuelve la palabra escogida para decifrar
   //PFrase    := 0;
   //Marca como palabra utilizada para que no se vuelva a repetir.
   //FrasesEscogidas.Add(IntToStr(PFrase));
   SiguientePalabra;
   //Print(PFrase);
end;

procedure TForm1.Print(frs : Integer);
begin
   //Dibujar la informacion en pantalla.
   lblAciertos.Caption := 'Aciertos'+ ' ' + IntToStr(nAciertos);
   lblErrores.Caption := 'Errores' + ' ' + IntToStr(nErrores);
   //Muestra la pista #1
   LblPista1.Caption := UpperCase(FFrase.Frases[frs].Descripcion[0]);
   //Muestra pista #2
   lblDescripcion2.Visible := False;
   LblPista2.Visible       := False;
   //Muestra pista #3
   lblDescripcion3.Visible := False;
   LblPista3.Visible       := False;
   //Dibuja los guiones del tamaño de la palabra
   PrintGuion(FFrase.Frases[frs].Frase);
end;

procedure TForm1.PrintGuion(Frase : String);
var
   i : Integer;
begin
   //Dibuja el numero de guiones dependiendo del tamaño de la palabra.
   lblNguions.Caption := '';
   for i := 0 to High(Frase) - 1  do
      begin
         lblNguions.Caption := lblNguions.Caption + '_' + ' ';
      end;
end;

procedure TForm1.btnEnviarClick(Sender: TObject);
var
   key : char;
begin
   key := #13;
   edtTextoKeyPress(Sender, key);
end;

procedure TForm1.btnPistaClick(Sender: TObject);
begin
   if nPistas < 2 then
      begin
         nPistas := nPistas + 1;
         if nPistas = 1 then
            begin
               lblDescripcion2.Visible := True;
               lblPista2.Visible       := True;
               lblPista2.Caption := UpperCase(FFrase.Frases[PFrase].Descripcion[nPistas]);
            end;
         if nPistas = 2 then
            begin
               lblDescripcion3.Visible := True;
               lblPista3.Visible       := True;
               lblPista3.Caption := UpperCase(FFrase.Frases[PFrase].Descripcion[nPistas]);
            end;
      end
   else
      begin
        ShowMessage(Messages(C_NOGUESS));
        edtTexto.SetFocus;
      end;

   if edtTexto.CanFocus then
      edtTexto.SetFocus;

end;

function TForm1.BuscaAciertos(Letra : string) : Boolean;
var
   i    : Integer;
   pAci : Integer;
   palabra : String;
begin
   // Se verifica si la letra ya fue ingresada
   palabra := StringReplace(LowerCase(lblNguions.Caption), ' ', '', [rfReplaceAll, rfIgnoreCase]);
   for i := 0 to High(palabra) do
      begin
         if palabra[i] = Letra then
            begin
               ShowMessage(Messages(C_WORDUSED) + Letra);
               edtTexto.SetFocus;
               Exit;
            end;
      end;

   //Busca los aciertos y devuelve la posicion de la letra encontrada.
   pAci := 0;
   for i := 0 to High(FFrase.Frases[PFrase].frase) do
      begin
         if FFrase.Frases[PFrase].Frase[i] = Letra then
            begin
               PosArray.Add(IntToStr(pAci));
            end;

         if  i = 0 then
            pAci := 1
         else
            pAci := pAci + 2;
      end;

   if  PosArray.Count > 0 then
      Result := True
   else
      Result := False;
end;

procedure TForm1.LlenarGuion(Letras : String; Pos : Integer);
var
   i : Integer;
   palabra : string;
begin
   //Remplaza guion con la letra
   palabra := lblNguions.Caption;
   if Length(Letras) = 1 then
      begin
         for i := 1 to High(palabra)  do
            begin
               if i = Pos then
                  begin
                     palabra[i] := Letras[1];
                  end;
            end;
      end;
   lblNguions.Caption := UpperCase(palabra);
end;

end.
