program listas_ej7;

uses uListaEnlazadaCircular;

var
  lista,copia: tListaCircular;

begin
    // 7.1 Inicialización de la lista
    initialize(lista);

    // 7.2 Inserción de elementos al final
    insert_at_end(lista,1);
    insert_at_end(lista,2);
    writeln(to_string(lista));

    // 7.3 Cálculo de diferencia entre primer y último elemento
    writeln(first(lista) - last(lista));

    // 7.4 Eliminación y limpieza
    delete(lista,1);
    writeln(to_string(lista));
    clear(lista);

    // 7.5 Copia de lista y verificación de vacío
    if(is_empty(lista)) then
    begin
         writeln('Lista vacia');
    end;

    insert_at_end(lista,1);
    insert_at_end(lista,2);

    copy(lista,copia);

    // 7.6 Inserción al inicio
    insert_at_begin(copia, -1);
    writeln(to_string(copia));

    // 7.7 Eliminación al final

    // 7.8 Eliminación de elemento específico

    // 7.9 Búsqueda de elemento (iterativa)
    if(in_list(lista,2)) then
    begin
         writeln('El 2 esta ne la lista');
    end;




    readln;
end.
