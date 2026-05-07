unit uTLibro;

interface

uses sysutils;

type
    TLibro = record
        titulo: string[80];
        autor: string[50];
        ISBN: string[20];
    end;

procedure assign(var e: TLibro; e2: TLibro);
function toString(e: TLibro): string;

implementation

procedure assign(var e: TLibro; e2: TLibro);
begin
    e.titulo := e2.titulo;
    e.autor := e2.autor;
    e.ISBN := e2.ISBN;
end;

function toString(e: TLibro): string;
begin
    toString := e.titulo + ' (' + e.autor + ')';
end;

end.
