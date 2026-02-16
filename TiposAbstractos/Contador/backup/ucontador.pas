unit uCOntador;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils;

type
    TContador = RECORD
      valor: integer;
    end;

    procedure incrementar(var c: TContador);
    procedure decrementar(var c: TContador);
    procedure reset(var c: TContador);
    function get_valor(var c: TContador): Integer;

implementation
    procedure incrementar(var c: TContador);
    begin
      c.valor := c.valor+1;
    end;

    procedure decrementar(var c: TContador);
    begin
      if c.valor >0 THEN
        c.valor := c.valor+1;
    end;
    procedure reset(var c: TContador);
    begin
      c.valor := 0;
    end;

    function get_valor(var c: TContador): Integer;
    begin
      get_valor := c.valor;
    end;

end.

