unit uListaLibros;

interface

uses uTLibro;
type
    tnodo = record
        info: TLibro;  { Aún almacena enteros, no libros }
        sig: ^tnodo;
    end;

    tLista = ^tnodo;

    procedure initialize(var lst: tLista);
    procedure insertLast(var lst: tLista; x: TLibro);
    procedure deleteFirst(var lst: tLista);
    procedure getFirst(lst: tLista;var lib: TLibro);
    function isEmpty(lst: tLista): boolean;
    function size(lst: tLista): TLibro;
    procedure clear(var lst: tLista);
    function toString(lst: tLista): string;

implementation

uses sysutils;

procedure initialize(var lst: tLista);
begin
    lst := nil;
end;

function isEmpty(lst: tLista): boolean;
begin
    isEmpty := lst = nil;
end;

procedure insertLast(var lst: tLista; x: TLibro);
var
    nuevo, aux: ^tnodo;
begin
    new(nuevo);
    nuevo^.info := x;
    nuevo^.sig := nil;

    if isEmpty(lst) then
        lst := nuevo
    else
    begin
        aux := lst;
        while aux^.sig <> nil do
            aux := aux^.sig;
        aux^.sig := nuevo;
    end;
end;

procedure deleteFirst(var lst: tLista);
var
    aux: ^tnodo;
begin
    if not isEmpty(lst) then
    begin
        aux := lst;
        lst := lst^.sig;
        dispose(aux);
    end;
end;

procedure getFirst(lst: tLista;var lib: TLibro);
begin
    if not isEmpty(lst) then
        lib := lst^.info
end;

function size(lst: tLista): integer;
var
    count: integer;
    aux: ^tnodo;
begin
    count := 0;
    aux := lst;
    while aux <> nil do
    begin
        inc(count);
        aux := aux^.sig;
    end;
    size := count;
end;

procedure clear(var lst: tLista);
begin
    while not isEmpty(lst) do
        deleteFirst(lst);
end;

function toString(lst: tLista): string;
var
    s: string;
    aux: ^tnodo;
begin
    s := '[';
    if not isEmpty(lst) then
    begin
        aux := lst;
        while aux <> nil do
        begin
            s := s + uTLibro.toString(aux^.info);
            if aux^.sig <> nil then
                s := s + ', ';
            aux := aux^.sig;
        end;
    end
    else
        s := s + '(vacía)';
    s := s + ']';
    toString := s;
end;

end.
