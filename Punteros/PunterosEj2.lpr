program PunterosEj2;

uses
    SysUtils;

var
    v : ARRAY[0..2] of integer;
    i : integer;
    p : ^integer;

begin
    Randomize;
    { Crea un array de 3 enteros V e inicialízalo con números aleatorios. }
    writeln('Inicializacion de numeros');
    for i:= 0 to 2 do
        v[i] := SUCC(Random(10));

    { Muestra sus valores por pantalla }
    for i:= 0 to 2 do
        writeln('Numero ' , i , ': ' ,v[i]);
    writeln;
    writeln;

    { Declara un puntero a entero p y ponlo a apuntar a la primera posición del array }
    p := @v[0];

    { Pon el valor 100 en el entero apuntado por p }
    p^ := 100;

    { Muestra los valores del array “V” por pantalla }
    writeln('Cambiando el primer numero');
    for i:= 0 to 2 do
        writeln('Numero ' , i , ': ' ,v[i]);
    writeln();
    writeln();

    { Recorre con p todas las posiciones del array para ponerlas todas a cero }
    for i:= 0 to 2 do
    begin
        p := @v[i];
        p^:= 0;
    end;

    { Muestra los valores del array “V” por pantalla }
    writeln('Muestro los valores a 0');
    for i:= 0 to 2 do
        writeln('Numero ' , i , ': ' ,v[i]);
    readln;

    dispose(p);

end.
