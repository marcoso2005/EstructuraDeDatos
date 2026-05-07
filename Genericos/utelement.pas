unit uTElement;


interface

uses sysutils, uTLibro;

type
    TElement = record
        libro: TLibro;
    end;

procedure assign(var e: TElement; e2: TElement);
function toString(e: TElement): string;

implementation

procedure assign(var e: TElement; e2: TElement);
begin
    e.libro := e2.libro;
end;

function toString(e: TElement): string;
begin
    toString := uTLibro.toString(e.libro);
end;

end.
