program colas_ej5;

uses uColaInteger;

function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;

{
    Ejercicio 5.1: Comprobar si un número está en la cola

    Desarrollar un subprograma que reciba una cola y un número entero y devuelva
    verdadero si el número está en la cola y falso en caso contrario.

    Entradas: cola de enteros, número entero

    Salida: booleano, verdadero si el número está en la cola, falso en caso contrario

    Condiciónes:
        - La cola debe mantener su contenido y orden original
        - Complejidad de tiempo esperada: O(n)
        - Complejidad de espacio auxiliar esperada:
            - O(1): ¡Increíble! No se necesita espacio adicional para resolver este problema.
            - O(n):  Muy bien, aunque se puede mejorar.
            - Superior a O(n): ¡Vaya! ¿No crees que se puede hacer mejor?

    Ejemplos:
        - (cola: [1, 2, 3, 4, 5], n: 3) => true
        - (cola: [1, 2, 3, 4, 5], n: 6) => false
}

{ Complejidad en tiempo: O(n) }
{ Complejidad en espacio: O(1) }
function esta_en_la_cola(var c: tCola; n: integer): boolean;
var
   i: integer;
   esta : boolean;
begin
    esta := false;
    for i:= 1 to num_elems(c) do
    begin
      if(first(c) = n) then
      begin
        esta := true;
      end;
      enqueue(c,first(c));
      dequeue(c);
    end;
    esta_en_la_cola := esta;
end;

{
    Ejercicio 5.2: Comprobar si un número está en la cola y devolver su posición

    A partir del subprograma anterior, desarrollar un nuevo subprograma que reciba una cola
    y un número entero y devuelva

    Entradas: cola de enteros, número entero

    Salida: integer, posición del número en la cola. Devolver -1 si el número no está en la cola.
            La posición de un elemento en la cola se cuenta desde 1.

        Condiciónes:
        - La cola debe mantener su contenido y orden original
        - Complejidad de tiempo esperada: O(n)
        - Complejidad de espacio auxiliar esperada:
            - O(1): ¡Increíble! No se necesita espacio adicional para resolver este problema.
            - O(n):  Muy bien, aunque se puede mejorar.
            - Superior a O(n): ¡Vaya! ¿No crees que se puede hacer mejor?

    Ejemplos:
        - (cola: [1, 2, 3, 4, 5], n: 3) => 3
        - (cola: [1, 2, 3, 4, 5], n: 1) => 1
        - (cola: [1, 2, 3, 4, 5], n: 6) => -1
}

function posicion_en_cola(var c: tCola; n: integer): integer;
var
   i: integer;
   res : integer;
begin
    res := -1;
    i := 1;
    for i:= 1 to num_elems(c) do
    begin
      if(first(c) = n) then
      begin
        res := i;
      end;
      enqueue(c,first(c));
      dequeue(c);
    end;
    posicion_en_cola := res;
end;

{
    Ejercicio 5.3: Determinar si la cola está ordenada

    Desarrollar un subprograma que reciba una cola de enteros y devuelva 1 si la cola está
    ordenada de forma creciente, -1 si está ordenada de forma decreciente y 0 si no está ordenada.

    Entradas: cola de enteros

    Salida: integer, 1 si la cola está ordenada de forma creciente, -1 si está ordenada de forma decreciente
     y 0 si no está ordenada. En caso de una cola vacía o con un solo elemento, devolver 0.

        Condiciónes:
        - La cola debe mantener su contenido y orden original
        - Complejidad de tiempo esperada: O(n)
        - Complejidad de espacio auxiliar esperada:
            - O(1): ¡Increíble! No se necesita espacio adicional para resolver este problema.
            - O(n):  Muy bien, aunque se puede mejorar.
            - Superior a O(n): ¡Vaya! ¿No crees que se puede hacer mejor?

    Ejemplos:
        - (cola: [1, 2, 3, 4, 5]) => 1
        - (cola: [5, 4, 3, 2, 1]) => -1
        - (cola: [1, 3, 2, 4, 5]) => 0
        - (cola: [1]) => 0
}

function cola_ordenada(var c: tCola): integer;
var
   i: integer;
   ant: integer;
   res : integer;
begin
    i := 1;
    ant:= first(c);
    enqueue(c,first(c));
    dequeue(c);
    if(num_elems(c) >= 2) then
    begin
      if(ant < first(c)) then
      begin
           res := 1;
      end
      else
      begin
           res := -1;
      end;

      for i:= 1 to num_elems(c) -1 do
      begin
           if ((ant < first(c)) and (res <> 1)) or ((ant > first(c)) and (res <> -1)) then
           begin
                res := 0;
           end;

           ant:= first(c);
           enqueue(c,first(c));
           dequeue(c);
      end;
    end
    else
    begin
         res := 0;
    end;
    cola_ordenada := res;
end;

procedure probar_ejercicio_5_1;
var
    c: tCola;
begin
    WriteLn('Ejercicio 5.1: Comprobar si un número está en la cola');
    initialize_queue(c);
    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
    enqueue(c, 4);
    enqueue(c, 5);
    WriteLn('Prueba 5.1.1. Cola: ', toString(c), ', n: 3 => ', esta_en_la_cola(c, 3), ' El ejercicio está ', bool_to_str(esta_en_la_cola(c, 3)));
    WriteLn('Prueba 5.1.2. Cola: ', toString(c), ', n: 6 => ', esta_en_la_cola(c, 6), ' El ejercicio está ', bool_to_str(not esta_en_la_cola(c, 6)));
end;

procedure probar_ejercicio_5_2;
var
    c: tCola;
begin
    WriteLn('Ejercicio 5.2: Comprobar si un número está en la cola y devolver su posición');
    initialize_queue(c);
    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
    enqueue(c, 4);
    enqueue(c, 5);
    WriteLn('Prueba 5.2.1. Cola: ', toString(c), ', n: 3 => ', posicion_en_cola(c, 3), ' El ejercicio está ', bool_to_str(posicion_en_cola(c, 3) = 3));
    WriteLn('Prueba 5.2.2. Cola: ', toString(c), ', n: 1 => ', posicion_en_cola(c, 1), ' El ejercicio está ', bool_to_str(posicion_en_cola(c, 1) = 1));
    WriteLn('Prueba 5.2.3. Cola: ', toString(c), ', n: 6 => ', posicion_en_cola(c, 6), ' El ejercicio está ', bool_to_str(posicion_en_cola(c, 6) = -1));
end;

procedure probar_ejercicio_5_3;
var
    c: tCola;
begin
    WriteLn('Ejercicio 5.3: Determinar si la cola está ordenada');
    initialize_queue(c);
    enqueue(c, 1);
    enqueue(c, 2);
    enqueue(c, 3);
    enqueue(c, 4);
    enqueue(c, 5);
    WriteLn('Prueba 5.3.1. Cola: ', toString(c), ' => ', cola_ordenada(c), ' El ejercicio está ', bool_to_str(cola_ordenada(c) = 1));
    clear(c);
    enqueue(c, 5);
    enqueue(c, 4);
    enqueue(c, 3);
    enqueue(c, 2);
    enqueue(c, 1);
    WriteLn('Prueba 5.3.2. Cola: ', toString(c), ' => ', cola_ordenada(c), ' El ejercicio está ', bool_to_str(cola_ordenada(c) = -1));
    enqueue(c, 1);
    enqueue(c, 3);
    enqueue(c, 2);
    enqueue(c, 4);
    enqueue(c, 5);
    WriteLn('Prueba 5.3.3. Cola: ', toString(c), ' => ', cola_ordenada(c), ' El ejercicio está ', bool_to_str(cola_ordenada(c) = 0));
    clear(c);
    enqueue(c, 1);
    WriteLn('Prueba 5.3.4. Cola: ', toString(c), ' => ', cola_ordenada(c), ' El ejercicio está ', bool_to_str(cola_ordenada(c) = 0));
end;

begin
    probar_ejercicio_5_1;
    probar_ejercicio_5_2;
    probar_ejercicio_5_3;
    readln;
end.
