unit uPagoBizum;

interface

procedure IniciarPago;
procedure RealizarPago(numeroTelefono: string; monto: real);
function ValidarPago(numeroTelefono: string): boolean;

implementation

procedure IniciarPago;
begin
  write('Introduce el numero de telefono: ');
end;

procedure RealizarPago(numeroTelefono: string; monto: real);
begin
  writeln('El tipo de pago es bizum de: ' , monto);
end;

function ValidarPago(numeroTelefono: string): boolean;
begin
  ValidarPago :=  length(numeroTelefono) = 9
end;

end.
