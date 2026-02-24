unit uPilaChar;
interface

    uses
        sysutils;

    type
        tNodo = record
            info: char;
            ant: ^tNodo;
        end;

        tPilaChar= ^tNodo;

    { Inicializa la pila }
    procedure initialize(var p: tPilaChar);
    { Agrega un elemento a la pila }
    procedure push(var p: tPilaChar; x: char);
    { Elimina el elemento de la cima de la pila }
    procedure pop(var p: tPilaChar);
    { Devuelve el elemento de la cima de la pila }
    function peek(p: tPilaChar): char;
    { Devuelve true si la pila esta vacia }
    function isEmpty(p: tPilaChar): boolean;


    { Otros métodos }
    { Libera los recursos de la pila }
    procedure clear(var p: tPilaChar);
    { Imprime los elementos de la pila }
    function toString(p: tPilaChar): string;


implementation


    { Inicializa la pila }
    procedure initialize(var p: tPilaChar);
    begin
        p := nil; { Inicializa el cima de la pila a nil }
    end;

    { Devuelve true si la pila esta vacia }
    function isEmpty(p: tPilaChar): boolean;
    begin
        isEmpty := p = nil; { Devuelve true si la cima es nil }
    end;

    { Agrega un elemento a la pila }
    procedure push(var p: tPilaChar; x: char);
    var
        nuevo: ^tnodo;
    begin
        new(nuevo);        { Crea un nuevo nodo }
        nuevo^.info := x;  { Asigna el valor al nuevo nodo }
        nuevo^.ant := p; { Enlaza el nuevo nodo con la anterior cima }
        p := nuevo;   { Actualiza la cima de la pila }
    end;

    { Elimina el elemento del cima de la pila }
    procedure pop(var p: tPilaChar);
    var
        aux: ^tnodo;
    begin
        if not isEmpty(p) then
        begin
            aux := p;      { Guarda la cima de la pila en un nodo auxiliar }
            p := p^.ant; { Actualiza la cima de la pila }
            dispose(aux);        { Libera la memoria del nodo eliminado }
        end;
    end;

    { Devuelve el elemento la cima de la pila }
    function peek(p: tPilaChar): char;
    begin
        if not isEmpty(p) then
            peek := p^.info; { Devuelve el valor de la cima de la pila }
    end;


    { ----------------------------------------------------- }
    { ------------------ Funcionalidad extra -------------- }
    { ----------------------------------------------------- }

    { Libera los recursos de la pila }
    procedure clear(var p: tPilaChar);
    begin
        while not isEmpty(p) do
        begin
            pop(p); { Elimina los nodos de la pila }
        end;
    end;

    { Imprime los elementos de la pila }
    function toString(p: tPilaChar): string;
    var
        aux: ^tnodo;
        s: string;
    begin
        s := '';       { Inicializa la cadena de texto }
        if not isEmpty(p) then
        begin
            aux := p; { Inicializa el nodo auxiliar con la cima de la pila }
            while aux <> nil do
            begin
                s := s + aux^.info + ' '; { Concatena el valor del nodo con un espacio }
                aux := aux^.ant; { Avanza al nodo anterior }
            end;
        end;
        toString := s; { Devuelve la cadena de texto }
    end;


end.

