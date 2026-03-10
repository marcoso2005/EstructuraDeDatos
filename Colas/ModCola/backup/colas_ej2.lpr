program colas_ej2;

uses
    SysUtils, DateUtils, uColaIntegerMod, uColaInteger,Windows;



procedure probar_ejercicio;
var
    colaMod: uColaIntegerMod.tCola;
    cola: uColaInteger.tCola;
    i: integer;
begin
    {Probamos a meter 10 elementos en la cola}
    writeln('Probamos a meter 10 elementos en la cola');
    uColaInteger.initialize_queue(cola);
    uColaIntegerMod.initialize_queue(colaMod);
    for i := 1 to 10 do
    begin
        uColaInteger.enqueue(cola, i);
        uColaIntegerMod.enqueue(colaMod, i);
    end;


    { Mostremos el contenido de las colas }
    writeln('Contenido de la cola original: ', uColaInteger.toString(cola));
    writeln('Contenido de la cola modificada: ', uColaIntegerMod.toString(colaMod));

    { ¿Coinciden los tamaños de las colas? }
    writeln('Número de elementos en la cola original: ', uColaInteger.num_elems(cola));
    writeln('Número de elementos en la cola modificada: ', uColaIntegerMod.num_elems(colaMod));
    writeln('¿Coinciden los tamaños de las colas? ', uColaInteger.num_elems(cola) = uColaIntegerMod.num_elems(colaMod));

    { Probamos a desencolar 5 elementos }
    writeln('Probamos a desencolar 5 elementos');
    for i := 1 to 5 do
    begin
        uColaInteger.dequeue(cola);
        uColaIntegerMod.dequeue(colaMod);
    end;

    { Mostremos el contenido de las colas }
    writeln('Contenido de la cola original: ', uColaInteger.toString(cola));
    writeln('Contenido de la cola modificada: ', uColaIntegerMod.toString(colaMod));

    { ¿Coinciden los tamaños de las colas? }
    writeln('Número de elementos en la cola original: ', uColaInteger.num_elems(cola));
    writeln('Número de elementos en la cola modificada: ', uColaIntegerMod.num_elems(colaMod));
    writeln('¿Coinciden los tamaños de las colas? ', uColaInteger.num_elems(cola) = uColaIntegerMod.num_elems(colaMod));

    { Limpiamos las colas }
    uColaInteger.clear(cola);
    uColaIntegerMod.clear(colaMod);

    { Mostremos el contenido de las colas }
    writeln('Contenido de la cola original: ', uColaInteger.toString(cola));
    writeln('Contenido de la cola modificada: ', uColaIntegerMod.toString(colaMod));

    { ¿Coinciden los tamaños de las colas? }
    writeln('Número de elementos en la cola original: ', uColaInteger.num_elems(cola));
    writeln('Número de elementos en la cola modificada: ', uColaIntegerMod.num_elems(colaMod));
    writeln('¿Coinciden los tamaños de las colas? ', uColaInteger.num_elems(cola) = uColaIntegerMod.num_elems(colaMod));
end;


procedure analizar_tiempo;
var
    colaMod: uColaIntegerMod.tCola;
    cola: uColaInteger.tCola;
    i: longint;
    startTime, endTime: TDateTime;
    elapsedTime: Double;
begin
    { Probamos a meter 100000 elementos en la cola }
    writeln('Probamos a meter 100000 elementos en la cola');
    uColaInteger.initialize_queue(cola);
    uColaIntegerMod.initialize_queue(colaMod);

    for i := 1 to 99999999 do
    begin
        uColaInteger.enqueue(cola, i);
        uColaIntegerMod.enqueue(colaMod, i);
    end;

    { Medimos el tiempo que tarda la llamada a la función `num_elems` }
    startTime := Now;
    uColaInteger.num_elems(cola);
    endTime := Now;
    elapsedTime := MilliSecondsBetween(endTime, startTime);
    writeln('Tiempo que tarda la función `num_elems` de la cola original: ', elapsedTime:0:2, ' ms');

    startTime := Now;
    uColaIntegerMod.num_elems(colaMod);
    endTime := Now;
    elapsedTime := MilliSecondsBetween(endTime, startTime);
    writeln('Tiempo que tarda la función `num_elems` de la cola modificada: ', elapsedTime:0:2, ' ms');
end;

begin
    probar_ejercicio;
    readln;
    analizar_tiempo;
    readln;
end.
