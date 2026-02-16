unit uPagoTarjeta;

interface

procedure IniciarPago;
procedure RealizarPago(numeroTarjeta: string; monto: real);
function ValidarPago(numeroTarjeta: string): boolean;

implementation

procedure IniciarPago;
begin
  write('Introduce el numero de la tarjeta: ');
end;

procedure RealizarPago(numeroTarjeta: string; monto: real);
begin
  writeln('El tipo de pago es tarjeta de: ' , monto);
end;

function ValidarPago(numeroTarjeta: string): boolean;
begin
  ValidarPago:=  length(numeroTarjeta) == 16
end;

end.
