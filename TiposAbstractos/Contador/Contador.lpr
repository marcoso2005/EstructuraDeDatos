
Program TestContador;

uses crt,uContador;

var
   x: TContador;
   i: integer;


begin
  reset(x);
  writeln(get_valor(x));
  for i:= 1 to 900 do
    incrementar(x);

  writeln(get_valor(x));

  until ;
  readln;
end.

