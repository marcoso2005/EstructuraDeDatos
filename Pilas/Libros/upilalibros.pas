unit uPilaLibros;

interface

uses
    sysutils, uTLibro;

type
    tnodo = record
        info: TLibro;
        ant: ^tnodo;
    end;

    tPilaLibros = ^tnodo;

    { Inicializa la pila }
    procedure initialize(var p: tPilaLibros);
    { Agrega un elemento a la pila }
    procedure push(var p: tPilaLibros; x: TLibro);
    { Elimina el elemento de la cima de la pila }
    procedure pop(var p: tPilaLibros);
    { Devuelve el elemento de la cima de la pila }
    procedure peek(p: tPilaLibros; var x: TLibro);
    { Devuelve true si la pila está vacía }
    function isEmpty(p: tPilaLibros): boolean;


    { ----------------------------------------------------- }
    { ------------------ Funcionalidad extra -------------- }
    { ----------------------------------------------------- }

    { Imprime los elementos de la pila }
    { Libera los recursos de la pila }
    procedure clear(var p: tPilaLibros);
    { Imprime los elementos de la pila }
    function toString(p: tPilaLibros): string;


implementation

{ Inicializa la pila }
procedure initialize(var p: tPilaLibros);
begin
    p := nil; { Inicializa la cima de la pila a nil }
end;

{ Devuelve true si la pila está vacía }
function isEmpty(p: tPilaLibros): boolean;
begin
    isEmpty := p = nil; { Devuelve true si la cima es nil }
end;

{ Agrega un elemento a la pila }
procedure push(var p: tPilaLibros; x: TLibro);
var
    nuevo: ^tnodo;
begin
    new(nuevo); { Crea un nuevo nodo }
    nuevo^.info := x; { Asigna el valor al nuevo nodo }
    nuevo^.ant := p; { Enlaza el nuevo nodo con la anterior cima }
    p := nuevo; { Actualiza la cima de la pila }
end;

{ Elimina el elemento de la cima de la pila }
procedure pop(var p: tPilaLibros);
var
    aux: ^tnodo;
begin
    if not isEmpty(p) then
    begin
        aux := p; { Guarda el nodo a eliminar }
        p := aux^.ant; { Actualiza la cima de la pila }
        dispose(aux); { Libera la memoria del nodo eliminado }
    end;
end;

{ Devuelve el elemento de la cima de la pila }
procedure peek(p: tPilaLibros; var x: TLibro);
begin
    if not isEmpty(p) then
        x := p^.info; { Devuelve el valor de la cima de la pila }
end;

    { ----------------------------------------------------- }
    { ------------------ Funcionalidad extra -------------- }
    { ----------------------------------------------------- }

{ Libera los recursos de la pila }
procedure clear(var p: tPilaLibros);
begin
    while not isEmpty(p) do
    begin
        pop(p); { Elimina los nodos de la pila }
    end;
end;

{ Imprime los elementos de la pila }
function toString(p: tPilaLibros): string;
var
    aux: ^tnodo;
    s: string;
begin
    s := '' + #13#10;       { Inicializa la cadena de texto }
    if not isEmpty(p) then
    begin
        aux := p; { Inicializa el nodo auxiliar con la cima de la pila }
        while aux <> nil do
        begin
            s := s + uTLibro.toString(aux^.info) + #13#10; { Concatena el elemento a la cadena de texto }
            aux := aux^.ant; { Avanza al nodo anterior }
        end;
    end;
    toString := s; { Devuelve la cadena de texto }
end;

end.
