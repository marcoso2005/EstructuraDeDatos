program colas_ej3;

uses
    sysutils,
    uColaInteger,windows;


{
    Ejercicio 3: Mostrar el contenido de una cola en orden inverso

    Desarrollar un subprograma que reciba una cola y muestre su contenido en orden inverso.

    Entradas: cola de enteros

    Salida: ninguna

    Condiciónes:
        - La cola debe mantener su contenido y orden original
        - Complejidad de tiempo esperada: O(n)
        - Complejidad de espacio auxiliar esperada:
            - O(1): ¡Increíble! No se necesita espacio adicional para resolver este problema.
            - O(n):  Muy bien, aunque se puede mejorar.
            - Superior a O(n): ¡Vaya! ¿No crees que se puede hacer mejor?

    Ejemplos:
        - (cola: [1, 2, 3, 4, 5]) => 5 4 3 2 1
}

procedure invertida(var c:tCola; veces: integer);
var
    i: integer;
begin
     if(veces <> 0) THEN
     begin
       veces := veces-1;
       i:= first(c);
       dequeue(c);
       enqueue(c,i);
       invertida(c,veces);
       write(i , ' ');
     end;
end;

procedure mostrar_inverso(c: tCola);
begin
     invertida(c,num_elems(c));
end;



var
    c: tCola;


begin
    initialize_queue(c);

    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
    enqueue(c, 4);
    enqueue(c, 5);

    WriteLn('Cola original:');
    WriteLn(toString(c));

    WriteLn;
    WriteLn('Mostrar inverso:');
    mostrar_inverso(c);
    WriteLn;
    WriteLn('Cola original:');
    WriteLn(toString(c));

    readln;
end.
