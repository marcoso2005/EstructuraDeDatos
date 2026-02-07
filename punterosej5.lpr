program punterosej5;

uses
    SysUtils,CRT;

{ Declaración de constantes }
const
    MAX = 4; { 2. Declaración de constantes }

{ Declaración de tipos }
type
    { 1. Declara un tipo coordenada_3D para puntos con coordenadas x,y,z }
    coordenada_3D = Record
      x : double;
      y: double;
      z: double;
    end;

{ Declaración de variables }
var
    { 2. Declara un array de MAX punteros a coordenadas_3D }
    coordenadas_3d: array[0..MAX] of ^coordenada_3d;
    opcion : integer;

{ 3. Crea una coordenada_3D en cada una de las posiciones inicializado
    todas las coordenadas con números aleatorios }
procedure creacionCoordenadas;
var
    i: integer;
begin
    Randomize;
    for i := 0 to MAX do
    begin
        New(coordenadas_3d[i]);
        coordenadas_3d[i]^.x := Random(10) + 1;
        coordenadas_3d[i]^.y := Random(10) + 1;
        coordenadas_3d[i]^.z := Random(10) + 1;
    end;
end;

{ Procedimiento para imprimir una coordenada_3D }
{ * Implementa un procedimiento que muestre por pantalla el contenido de cada posición }
procedure mostrar;
var
    i : integer;
begin
    for i:= 0 to MAX do
    begin
        if coordenadas_3d[i] <> NIL then
        begin
          writeln('Coordenada ' , i ,': ', #13#10,
                  '     X: ', FormatFloat('0.00', coordenadas_3d[i]^.x), #13#10,
                  '     Y: ', FormatFloat('0.00', coordenadas_3d[i]^.y), #13#10,
                  '     Z: ', FormatFloat('0.00', coordenadas_3d[i]^.z));
        end
        else
        begin
             writeln('Coordenada ' , i , ' : NIL');
        end;
    end
end;

{ 4. Implementa un procedimiento que libere la memoria asignada a una posición }
procedure liberarPos;
var
    pos : integer;
begin
    write('Que posicion desea liberar: ');
    read(pos);
    if coordenadas_3d[pos] <> NIL then
    begin
      dispose(coordenadas_3d[pos]);
      coordenadas_3d[pos] := NIL;
    end
end;

{ 4.' Implementa un procedimiento que libere la memoria asignada a todas las posiciones }
procedure liberar;
var
    i: integer;
begin
     for i := 0 to MAX do
     begin
         if coordenadas_3d[i] <> NIL then
         begin
           dispose(coordenadas_3d[i]);
           coordenadas_3d[i] := NIL;
         end;
     end;
end;

{ 5. Implementa una función que sume todas las x de las coordenadas }
function sumarX: double;
var
    i: integer;
    suma : double;
begin
    suma := 0;
     for i := 0 to MAX do
     begin
         if coordenadas_3d[i] <> NIL then
           suma := suma+coordenadas_3d[i]^.x;
     end;
     sumarX := suma;
end;

{ 5.' Implementa una función que sume las coordenadas de todas las posiciones }
function sumar: double;
var
    i: integer;
    suma : double;
begin
    suma := 0;
     for i := 0 to MAX do
     begin
         if coordenadas_3d[i] <> NIL then
           suma := suma+coordenadas_3d[i]^.x + coordenadas_3d[i]^.y + coordenadas_3d[i]^.z;
     end;
     sumar := suma;
end;

{ 6. (Opcional) Implementa un procedimiento que permita añadir una coordenada en la primera
    posición libre del array}
procedure anadir;
var
    i : integer;
    nuevo : boolean;
begin
    nuevo := false;
    for i:= 0 to MAX do
    begin
        if (coordenadas_3d[i] = NIL) and not nuevo then
        begin
          New(coordenadas_3d[i]);
          coordenadas_3d[i]^.x := Random(10) + 1;
          coordenadas_3d[i]^.y := Random(10) + 1;
          coordenadas_3d[i]^.z := Random(10) + 1;
          nuevo := true;
        end;
    end
end;

{ 7. Implementa una función que calcule la máxima coordenada y (debes comprobar  antes,
     pues puede que alguna posición no tenga coordenada y esté a NIL)}
function maximo: integer;
var
    i: integer;
    maxi : double;
    pos :integer;
begin
    maxi := Low(integer);
     for i := 0 to MAX do
     begin
         if coordenadas_3d[i] <> NIL then
         begin
              if maxi < coordenadas_3d[i]^.x + coordenadas_3d[i]^.y +coordenadas_3d[i]^.z  then
              begin
                maxi := coordenadas_3d[i]^.x + coordenadas_3d[i]^.y +coordenadas_3d[i]^.z;
                pos := i;
              end;
         end;
     end;
     maximo := pos;
end;

procedure lista;
begin
  writeln('1. Mostrar listado');
  writeln('2. Liberar una posicion');
  writeln('3. Liberar todo');
  writeln('4. Sumar X');
  writeln('5. Sumar todo');
  writeln('6. Añadir');
  writeln('7. Maximo');
  writeln('0. Salir');
end;

begin
  creacionCoordenadas;
  repeat
    lista;
    write('Escoge una opcion: ');
    readln(opcion);
    clrscr;
    case opcion of
      1: mostrar;
      2: liberarPos;
      3: liberar;
      4: writeln('La suma de las x es: ', FormatFloat('0.00',sumarX));
      5: writeln('La suma es: ' + FormatFloat('0.00',sumar));
      6: begin
         anadir;
         writeln('Se libero toda la memoria');
      end;
      7: writeln('La coordenada mas grande es la ' , maximo);
      0: writeln('Gracias por utilizar la app');
    end;
    writeln('Pulse intro para continuar');
    readln;
    clrscr;

  until (opcion = 0);

  liberar;
end.

