unit Palabras;

interface

type
   TFrase = Record
      Frase       : string;
      Descripcion : array[0..3] of string;
      Nivel       : Integer;
   end;

   TFrases = Class
     private

     public
       Frases : array[0..23] of TFrase;

       function FraseEscogida : Integer;
   End;

var FFrase : TFrases;

implementation

function TFrases.FraseEscogida : Integer;
begin
   {********************************* NIVEL 1 ********************************}
   //Palabra #1 con sus tres pistas.
   Frases[0].Frase := 'cocodrilo';
   Frases[0].Descripcion[0] := 'Es un reptil';
   Frases[0].Descripcion[1] := 'Son excelentes nadadores y también pueden pasar poco tiempo en tierra firme.';
   Frases[0].Descripcion[2] := 'Su piel es dura, rígida y cubierta por resistentes escamas que sirven como armadura. Su cola está provista de fuertes músculos que le permiten un mejor desplazamiento.';
   Frases[0].Nivel          := 1;
   //Palabra #2 con sus tres pistas.
   Frases[1].Frase := 'gato';
   Frases[1].Descripcion[0] := 'Es un felino.';
   Frases[1].Descripcion[1] := 'Son peludos.';
   Frases[1].Descripcion[2] := 'Son domesticoos.';
   Frases[1].Nivel          := 1;
   //Palabra #3 con sus tres pistas.
   Frases[2].Frase := 'tigre';
   Frases[2].Descripcion[0] := 'Es un felino.';
   Frases[2].Descripcion[1] := 'Tienen un pelaje naranja o leonado.';
   Frases[2].Descripcion[2] := 'Suelen ser ferozmente territoriales y cazan mucho.';
   Frases[2].Nivel          := 1;
   {********************************* NIVEL 2 ********************************}
   //Palabra #1 con sus tres pistas
   Frases[3].Frase := 'a';
   Frases[3].Descripcion[0] := '';
   Frases[3].Descripcion[1] := '';
   Frases[3].Descripcion[2] := '';
   Frases[3].Nivel          := 2;
   //Palabra #2 con sus tres pistas
   Frases[4].Frase := 'b';
   Frases[4].Descripcion[0] := '';
   Frases[4].Descripcion[1] := '';
   Frases[4].Descripcion[2] := '';
   Frases[4].Nivel          := 2;
   //Palabra #3 con sus tres pistas
   Frases[5].Frase := 'c';
   Frases[5].Descripcion[0] := '';
   Frases[5].Descripcion[1] := '';
   Frases[5].Descripcion[2] := '';
   Frases[5].Nivel          := 2;
   {********************************* NIVEL 3 ********************************}
   Frases[6].Frase := 'd';
   Frases[6].Descripcion[0] := '';
   Frases[6].Descripcion[1] := '';
   Frases[6].Descripcion[2] := '';
   Frases[6].Nivel          := 3;
   //Palabra #2 con sus tres pistas
   Frases[7].Frase := 'e';
   Frases[7].Descripcion[0] := '';
   Frases[7].Descripcion[1] := '';
   Frases[7].Descripcion[2] := '';
   Frases[7].Nivel          := 3;
   //Palabra #3 con sus tres pistas
   Frases[8].Frase := 'f';
   Frases[8].Descripcion[0] := '';
   Frases[8].Descripcion[1] := '';
   Frases[8].Descripcion[2] := '';
   Frases[8].Nivel          := 3;
   {********************************* NIVEL 4 ********************************}
   Frases[9].Frase := 'g';
   Frases[9].Descripcion[0] := '';
   Frases[9].Descripcion[1] := '';
   Frases[9].Descripcion[2] := '';
   Frases[9].Nivel          := 4;
   //Palabra #2 con sus tres pistas
   Frases[10].Frase := 'h';
   Frases[10].Descripcion[0] := '';
   Frases[10].Descripcion[1] := '';
   Frases[10].Descripcion[2] := '';
   Frases[10].Nivel          := 4;
   //Palabra #3 con sus tres pistas
   Frases[11].Frase := 'i';
   Frases[11].Descripcion[0] := '';
   Frases[11].Descripcion[1] := '';
   Frases[11].Descripcion[2] := '';
   Frases[11].Nivel          := 4;
   {********************************* NIVEL 5 ********************************}
   Frases[12].Frase := 'g';
   Frases[12].Descripcion[0] := '';
   Frases[12].Descripcion[1] := '';
   Frases[12].Descripcion[2] := '';
   Frases[12].Nivel          := 5;
   //Palabra #2 con sus tres pistas
   Frases[13].Frase := 'h';
   Frases[13].Descripcion[0] := '';
   Frases[13].Descripcion[1] := '';
   Frases[13].Descripcion[2] := '';
   Frases[13].Nivel          := 5;
   //Palabra #3 con sus tres pistas
   Frases[14].Frase := 'i';
   Frases[14].Descripcion[0] := '';
   Frases[14].Descripcion[1] := '';
   Frases[14].Descripcion[2] := '';
   Frases[14].Nivel          := 5;
   {********************************* NIVEL 6 ********************************}
   Frases[15].Frase := 'g';
   Frases[15].Descripcion[0] := '';
   Frases[15].Descripcion[1] := '';
   Frases[15].Descripcion[2] := '';
   Frases[15].Nivel          := 6;
   //Palabra #2 con sus tres pistas
   Frases[16].Frase := 'h';
   Frases[16].Descripcion[0] := '';
   Frases[16].Descripcion[1] := '';
   Frases[16].Descripcion[2] := '';
   Frases[16].Nivel          := 6;
   //Palabra #3 con sus tres pistas
   Frases[17].Frase := 'i';
   Frases[17].Descripcion[0] := '';
   Frases[17].Descripcion[1] := '';
   Frases[17].Descripcion[2] := '';
   Frases[17].Nivel          := 6;
   {********************************* NIVEL 7 ********************************}
   Frases[18].Frase := 'g';
   Frases[18].Descripcion[0] := '';
   Frases[18].Descripcion[1] := '';
   Frases[18].Descripcion[2] := '';
   Frases[18].Nivel          := 7;
   //Palabra #2 con sus tres pistas
   Frases[19].Frase := 'h';
   Frases[19].Descripcion[0] := '';
   Frases[19].Descripcion[1] := '';
   Frases[19].Descripcion[2] := '';
   Frases[19].Nivel          := 7;
   //Palabra #3 con sus tres pistas
   Frases[20].Frase := 'i';
   Frases[20].Descripcion[0] := '';
   Frases[20].Descripcion[1] := '';
   Frases[20].Descripcion[2] := '';
   Frases[20].Nivel          := 7;
   {********************************* NIVEL 7 ********************************}
   Frases[21].Frase := 'g';
   Frases[21].Descripcion[0] := '';
   Frases[21].Descripcion[1] := '';
   Frases[21].Descripcion[2] := '';
   Frases[21].Nivel          := 7;
   //Palabra #2 con sus tres pistas
   Frases[22].Frase := 'h';
   Frases[22].Descripcion[0] := '';
   Frases[22].Descripcion[1] := '';
   Frases[22].Descripcion[2] := '';
   Frases[22].Nivel          := 7;
   //Palabra #3 con sus tres pistas
   Frases[23].Frase := 'i';
   Frases[23].Descripcion[0] := '';
   Frases[23].Descripcion[1] := '';
   Frases[23].Descripcion[2] := '';
   Frases[23].Nivel          := 7;

   Result := Random(12);
end;

end.

