unit uPilaChar;

{ 1.1
    Genera una unidad pila cuyos nodos almacenen un único carácter.
    Implementa las funciones básicas para la pila:
        - Inicializar la pila.
        - Verificar si la pila está vacía.
        - Apilar un carácter.
        - Desapilar un carácter.
        - Obtener el carácter en la cima de la pila sin desapilarlo.
}

interface
    uses sysutils;

    type
      tNodo = record
        info: char;
        ant: ^tNodo;
      end;

      tPilaChar = record
        pila: ^tNodo;
      end;

      procedure initializa(var p: tPilaChar);
      function isEmpty(var p: tPilaChar): boolean;
      procedure push(var p: tPilaChar; x:char);
      procedure pop(var p: tPilaChar);
      procedure peek(p:tPilaChar; var x: char);

implementation
    procedure initializa(var p: tPilaChar);
    begin
      p.pila := nil;
    end;

    function isEmpty(var p: tPilaChar): boolean;
    begin
      isEmpty := p.pila = nil;
    end;

    procedure push(var p: tPilaChar; x:char);
    var nuevo : ^Tnodo;
    begin
      new(nuevo);
      nuevo^.info := x;
      nuevo^.ant := p.pila;
      p.pila := nuevo;
    end;

    procedure pop(var p: tPilaChar);
    var
      aux: ^tNodo;
    begin
      if(NOT isEmpty(p)) then
      begin
        aux := p.pila;
        p.pila := p.pila^.ant;
        dispose(aux);
      end;
    end;

    procedure peek(p:tPilaChar; var x: char);
    begin
      if(NOT isEmpty(p)) then
      begin
        x := p.pila^.info;
      end;
    end;

end.

