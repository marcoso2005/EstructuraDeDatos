unit uPagoTransferencia;

interface

procedure IniciarPago;
procedure RealizarPago(numeroCuenta: string; monto: real);
function ValidarPago(numeroCuenta: string): boolean;

implementation

procedure IniciarPago;
begin
  write('Introduce el IBAN de la cuenta: ');
end;

procedure RealizarPago(numeroCuenta: string; monto: real);
begin
  writeln('El tipo de pago es transferencia de: ' , monto);
end;

function ValidarPago(numeroCuenta: string): boolean;
begin
  ValidarPago :=  length(numeroCuenta) == 24
end;

end.
