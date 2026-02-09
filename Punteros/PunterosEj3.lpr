program PunterosEj3;
type
    { Declara un tipo de registro llamado “nodo” con dos campos: un entero y un puntero a “nodo” }
  nodos = RECORD
    entero : integer;
    siguiente: ^nodos;
    end;


var
    { Declara una variable de tipo puntero a nodo }
  nodo: ^nodos;

begin
    { Crea un nodo en memoria dinámica (heap) }
  new(nodo);

    { Dale valor 100 al campo entero de este nodo }
    nodo^.entero := 100;

    { Pon a nil el campo puntero del nodo }
    nodo^.siguiente := NIL;

    { Pon ahora el puntero del nodo a apuntar al propio nodo }
    nodo^.siguiente := @nodo;

    { En este punto hay dos instrucciones alternativas para liberar la memoria dinámica creada: }
    { Alternativa 1: Liberar el nodo directamente }
    dispose(nodo);

    { Alternativa 2: Liberar el nodo a través del campo puntero }
    { Dispose(punteroNodo^.siguiente); }
    dispose(nodo^.siguiente);

    { Termina }
    readln;
end.
