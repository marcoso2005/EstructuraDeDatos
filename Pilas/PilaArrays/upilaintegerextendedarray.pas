unit uPilaIntegerExtendedArray;

{
    Importante: Todos los ejercicios planteados son de índole académico.
    Algunos de las funciones/procedimientos pueden no tener sentido práctico
    para una pila ya que se deberían implementar con otro tipo de estructura.
}

interface

    uses
        sysutils;

const
    MAX_ELEMENTOS = 100;

    type
        tPilaEnterosExt = record
            cima: integer;
            stack: array[1..MAX_ELEMENTOS] of integer;
            elementos: integer;
        end;

    { Inicializa la pila }
    procedure initialize(var p: tPilaEnterosExt);
    { Agrega un elemento a la pila }
    procedure push(var p: tPilaEnterosExt; x: integer);
    { Elimina el elemento de la cima de la pila }
    procedure pop(var p: tPilaEnterosExt);
    { Devuelve el elemento de la cima de la pila }
    procedure peek(p: tPilaEnterosExt; var x: integer);
    { Devuelve true si la pila está vacía }
    function isEmpty(p: tPilaEnterosExt): boolean;

    { ----------------------------------------------------- }
    { ------------------ Funcionalidad extra -------------- }
    { ----------------------------------------------------- }
    { Devuelve true si la pila está llena }
    function isFull(p: tPilaEnterosExt): boolean;
    { Libera los recursos de la pila }
    procedure clear(var p: tPilaEnterosExt);
    { Imprime los elementos de la pila }
    function toString(p: tPilaEnterosExt): string;


    { ------------------------ Ejercicios ------------------------ }

    { 5.1 Contar el número de elementos en una pila }
    function contarElementos(p: tPilaEnterosExt): integer;
    { 5.2 Obtener el elemento en la ultima posición de la pila }
    function ultimo(p: tPilaEnterosExt): integer;
    { 5.3 Combina dos pilas en una sola }
    procedure combinar(var p1, p2: tPilaEnterosExt);
    { 5.4 Hacer "pop" n veces }
    procedure popN(var p: tPilaEnterosExt; n: integer);
    { 5.5 Sumar los n primeros elementos de una pila y reemplazarlos por la suma }
    procedure sumarN(var p: tPilaEnterosExt; n: integer);
    { 5.6 Invertir pila }
    procedure invertir(var p: tPilaEnterosExt);
    { 5.7 Repetir n veces }
    procedure repetirN(var p: tPilaEnterosExt; n: integer);
    { 5.8 Contar apariciones de elemento n }
    function contarApariciones(var p: tPilaEnterosExt; n: integer): integer;






implementation

    { ------------------------ Funciones básicas de las pilas ------------------------ }

    { Inicializa la pila }
    procedure initialize(var p: tPilaEnterosExt);
    begin
        p.cima := 0;
        p.elementos := 0;
    end;

    { Agrega un elemento a la pila }
    procedure push(var p: tPilaEnterosExt; x: integer);
    begin
        if not isFull(p) then
        begin
            p.cima := p.cima + 1;
            p.stack[p.cima] := x;
            p.elementos := p.elementos+1;
        end;
    end;

    { Elimina el elemento de la cima de la pila }
    procedure pop(var p: tPilaEnterosExt);
    begin
        if p.cima > 0 then
        begin
            p.cima := p.cima - 1;
            p.elementos := p.elementos -1;
        end
    end;

    { Devuelve el elemento de la cima de la pila }
    procedure peek(p: tPilaEnterosExt; var x: integer);
    begin
        if not isEmpty(p) then
            x := p.stack[p.cima];
    end;

    { Devuelve true si la pila está vacía }
    function isEmpty(p: tPilaEnterosExt): boolean;
    begin
        isEmpty := p.cima = 0;
    end;


    { Devuelve true si la pila está llena }
    function isFull(p: tPilaEnterosExt): boolean;
    begin
        isFull := p.cima = MAX_ELEMENTOS;
    end;

    { Libera los recursos de la pila }
    procedure clear(var p: tPilaEnterosExt);
    begin
        p.cima := 0; // Los elementos se sobreescribirán en futuras inserciones
    end;

    { Imprime los elementos de la pila }
    function toString(p: tPilaEnterosExt): string;
    var
        i: integer;
        s: string;
    begin
        s := '';
        for i := 0 to p.cima - 1 do
        begin
            s := s + IntToStr(p.stack[p.cima-i]) + ' ';
        end;
        toString := s;
    end;



    { ------------------------ Ejercicios ------------------------ }

    { Para los ejemplos en los ejercicios utilizaremos una representación de pila de la siguiente forma:
                   CIMA
                    |
                    \/
        [1, 2, 3, 4, 5, 0, 0, 0, 0, 0]
    }


    {
        5.1 Contar el número de elementos en una pila.
        Función que recibe una pila de enteros y devuelve la cantidad de elementos que contiene.
        La operación debe realizarse en O(1). Puede que sea necesario modificar la estructura de la pila...
        Entrada: pila de enteros
        Salida: cantidad de elementos de la pila, entero
        Ejemplos:
            - contarElementos([1, 2, 3, 4, 5]) -> 5
            - contarElementos([]) -> 0
            - contarElementos([1, 2, 3]) -> 3
    }
    function contarElementos(p: tPilaEnterosExt): integer;
    begin
        contarElementos := p.elementos;
    end;

    {
        5.2 Obtener el elemento en la ultima posición de la pila
        Función que recibe una pila de enteros y devuelve el elemento que se encuentra en la última posición.
        Es decir, el primer elemento que se agregó a la pila.
        Entrada: pila de enteros
        Salida: elemento de la última posición, entero
        Ejemplos:
            - ultimo([1, 2, 3, 4, 5]) -> 5
            - ultimo([]) -> 0
            - ultimo([1, 2, 3]) -> 3
    }
    function ultimo(p: tPilaEnterosExt): integer;
    begin
        if(NOT isEmpty(p)) THEN
          ultimo := p.stack[0];
    end;

    {
        5.3 Combina dos pilas en una sola
        Procedimiento que recibe dos pilas de enteros y las combina en una sola.
        Entrada: dos pilas de enteros
        Salida: se modifica la primera pila con los elementos de ambas pilas.
                El orden de los elementos de la segunda pila debe ser el mismo que el original.
        La segunda pila queda vacía.
        Ejemplos:
            - combinar([1, 2, 3], [4, 5, 6]) -> [4, 5, 6, 1, 2, 3]
            - combinar([], [4, 5, 6]) -> [4, 5, 6]
            - combinar([1, 2, 3], []) -> [1, 2, 3]
    }
    procedure combinar(var p1, p2: tPilaEnterosExt);
    var
        temp: tPilaEnterosExt;
        i: integer;

    begin
        initialize(temp);
        while NOT isEmpty(p2) do
        begin
            peek(p2,i);
            push(temp,i);
            pop(p2);
        end;

        while NOT isEmpty(temp) do
        begin
            peek(temp,i);
            push(p1,i);
            pop(temp);
        end;
    end;

    {
        5.4 Hacer "pop" n veces
        Procedimiento que recibe una pila de enteros y un entero n.
        Realiza n operaciones de "pop" en la pila.
        Entrada: pila de enteros, entero n
        Salida: se modifica la pila eliminando los n elementos de la cima.
        Ejemplos:
            - popN([1, 2, 3, 4, 5], 2) -> [3, 4, 5]
            - popN([1, 2, 3, 4, 5], 5) -> []
            - popN([1, 2, 3, 4, 5], 0) -> [1, 2, 3, 4, 5]
    }
    procedure popN(var p: tPilaEnterosExt; n: integer);
    var
      i: integer;
    begin
        i:= 0;
        while NOT isEmpty(p) AND (i < n) do
        begin
            pop(p);
            i := i+1;
        end;
    end;

    {
        5.5 Sumar los n primeros elementos de una pila y reemplazarlos por la suma
        Procedimiento que recibe una pila de enteros y un entero n.
        Suma los n primeros elementos de la pila y reemplaza esos n elementos por la suma.
        Entrada: pila de enteros, entero n
        Salida: se modifica la pila reemplazando los n elementos por la suma de los mismos.
        Ejemplos:
            - sumarN([1, 2, 3, 4, 5], 2) -> [3, 3, 4, 5]
            - sumarN([1, 2, 3, 4, 5], 5) -> [15]
            - sumarN([1, 2, 3, 4, 5], 0) -> [1, 2, 3, 4, 5]
    }
    procedure sumarN(var p: tPilaEnterosExt; n: integer);
    var
      i: integer;
      sum : integer;
      num:integer;
    begin
        if(n <> 0) THEN
        begin
            i:= 0;
        sum := 0;
        while NOT isEmpty(p) AND (i < n) do
        begin
            peek(p,num);
            sum := sum + num;
            pop(p);
            i := i+1;
        end;
        push(p,sum);
        end;
    end;

    {
        5.6 Invertir pila
        Procedimiento que recibe una pila de enteros y la invierte.
        Entrada: pila de enteros
        Salida: se modifica la pila invirtiendo el orden de los elementos.
        Ejemplos:
            - invertir([1, 2, 3, 4, 5]) -> [5, 4, 3, 2, 1]
            - invertir([]) -> []
            - invertir([1, 2, 3]) -> [3, 2, 1]
    }
    procedure invertir(var p: tPilaEnterosExt);
    var
        temp: tPilaEnterosExt;
        i: integer;
    begin
        initialize(temp);
        while NOT isEmpty(p) do
        begin
            peek(p,i);
            push(temp,i);
            pop(p);
        end;

        p := temp;
    end;

    {
        5.7 Repetir n veces
        Procedimiento que recibe una pila de enteros y un entero n.
        Repite n veces los elementos de la pila.
        Entrada: pila de enteros, entero n
        Salida: se modifica la pila repitiendo n veces los elementos.
        Ejemplos:
            - repetirN([1, 2, 3], 2) -> [1, 1, 2, 2, 3, 3]
            - repetirN([1, 2, 3], 1) -> [1, 2, 3]
    }
    procedure repetirN(var p: tPilaEnterosExt; n: integer);
    var
        temp: tPilaEnterosExt;
        num: integer;
        i: integer;
    begin
        initialize(temp);
        while NOT isEmpty(p) do
        begin
            peek(p,num);
            for i:= 1 to n do
                push(temp,num);
            pop(p);
        end;

        p := temp;
    end;

    {
        5.8 Contar apariciones de elemento n
        Función que recibe una pila de enteros y un entero n.
        Devuelve la cantidad de veces que aparece el elemento n en la pila.
        Entrada: pila de enteros, entero n
        Salida: cantidad de apariciones del elemento n en la pila, entero
        Ejemplos:
            - contarApariciones([1, 2, 3, 4, 5], 2) -> 1
            - contarApariciones([1, 2, 3, 4, 5], 10) -> 0
            - contarApariciones([1, 2, 3, 4, 5, 2], 2) -> 2
    }
    function contarApariciones(var p: tPilaEnterosExt; n: integer): integer;
    var
        temp: tPilaEnterosExt;
        num: integer;
        i: integer;
        cuen : integer;
    begin
        initialize(temp);
        cuen := 0;
        while NOT isEmpty(p) do
        begin
            peek(p,num);
            if num = n then
               cuen := cuen+1;
            push(temp,num);
            pop(p);
        end;

        while NOT isEmpty(temp) do
        begin
            peek(temp,num);
            push(p,num);
            pop(temp);
        end;

        contarApariciones:= cuen;
    end;
end.
