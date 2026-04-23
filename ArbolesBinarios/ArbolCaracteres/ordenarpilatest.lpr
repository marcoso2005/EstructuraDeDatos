program ordenarpilatest;

uses
  uPilaChar, uBinaryCharSearchTree;

var
  pila: tPilaChars;
  elemento: char;

{ Ejercicio 3 }

procedure mostrar_pila_en_orden(var p: tPilaChars);
var
  a: tBinarySearchTree;
  p2: tPilaChars;
begin
   initialize(a);
   uPilaChar.initialize(p2);
   while(not isEmpty(p)) do
   begin
        add(a,peek(p));
        push(p2,peek(p));
        pop(p);
   end;
   inorder(a);
   while(not isEmpty(p2)) do
   begin
        push(p,peek(p2));
        pop(p2);
   end;

   //anadirPila(p,a);

   //push(p,get_hi(a));
   //remove(a,peek(p));
end;

begin
  // Inicializar la pila
  uPilaChar.initialize(pila);

  // Agregar elementos desordenados a la pila
  push(pila, 'd');
  push(pila, 'a');
  push(pila, 'c');
  push(pila, 'b');

  // Mostrar pila antes de ordenar
  writeln('Pila antes de ordenar: ', toString(pila));

  mostrar_pila_en_orden(pila);

  // Mostrar pila después de ordenar
  writeln('Pila después de ordenar: ', toString(pila));
  readln;
end.
