unit uTLibro;

interface

uses sysutils;

type
    TLibro = record
        titulo: string[100];
        autor: string[50];
        ISBN: string[20];
        idioma: string[20];
        numPaginas: integer;
    end;

procedure assign(var e: TLibro; e2 : TLibro);
function toString(e: TLibro): string;

implementation

procedure assign(var e: TLibro; e2 : TLibro);
begin
    e.titulo := e2.titulo;
    e.autor := e2.autor;
    e.ISBN := e2.ISBN;
    e.idioma := e2.idioma;
    e.numPaginas := e2.numPaginas;
end;

function toString(e: TLibro): string;
begin
    toString := '(' + e.titulo + ', ' + e.autor + ', ' + e.ISBN + ', ' + e.idioma + ', ' + IntToStr(e.numPaginas) + ')';
end;

end.
