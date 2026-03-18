unit uCliente;

interface

type

    tCliente = record
        cod_cliente: string;
        activo: boolean;
    end;


procedure assign(var c: tCliente; c2 : tCliente);
function toString(c: tCliente): string;
function esActivo(c: tCliente): boolean;

implementation

uses SysUtils;

procedure assign(var c: tCliente; c2 : tCliente);
begin
    c.cod_cliente := c2.cod_cliente;
    c.activo := c2.activo;
end;

function activoToString(c: tCliente): string;
begin
    if c.activo then
        activoToString := 'Activo'
    else
        activoToString := 'Inactivo';
end;

function toString(c: tCliente): string;
begin
    toString := '[' + c.cod_cliente + ':' + activoToString(c) + ']';
end;

function esActivo(c: tCliente): boolean;
begin
    esActivo := c.activo;
end;



end.
