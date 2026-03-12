program listas_ej2;

uses uListaEnlazadaSimple,SysUtils;

var
  lista, lista2: tListaSimple;

begin
    // 2.1 Inicializar lista
    initialize(lista);

    // 2.2 Insertar elementos al final y mostrar lista
    insert_at_end(lista,1);
    insert_at_end(lista,2);
    insert_at_end(lista,3);
    insert_at_end(lista,4);
    insert_at_end(lista,5);

    writeln('Lista iniciada: ');
    writeln(to_string(lista));

    // 2.3 Obtener primer y último elemento, calcular diferencia
    writeln();
    writeln('Primer elemento: ' + IntToStr(first(lista)));
    writeln('Ultimo elemento: ' + IntToStr(last(lista)));
    writeln('Diferencia: ' + IntToStr(first(lista)-last(lista)));

    // 2.4 Número de elementos, eliminar al inicio, limpiar lista
    writeln();
    writeln('Numero de elementos: ' + IntToStr(num_elems(lista)));
    delete_at_begin(lista);
    writeln(to_string(lista));
    clear(lista);
    writeln(to_string(lista));

    // 2.5 Verificar si la lista está vacía, copiar lista, eliminar al inicio
    writeln();
    writeln('Esta vacia: ' + BoolToStr(is_empty(lista),true));
    insert_at_end(lista,1);
    writeln(to_string(lista));
    copy(lista,lista2);
    delete_at_end(lista2);
    writeln(to_string(lista));
    if(not is_empty(lista2)) then begin
           writeln(to_string(lista2));
    end
    else begin
        writeln('Vacia');
    end;


    // 2.6 Insertar al inicio
    writeln();
    insert_at_begin(lista,0);
    writeln(to_string(lista));

    // 2.7 Eliminar al final;
    writeln();
    delete_at_end(lista);
    writeln(to_string(lista));

    // 2.8 Eliminar un elemento específico
    writeln();
    insert_at_end(lista,3);
    delete(lista,3);
    writeln(to_string(lista));

    // 2.9 Verificar si un elemento está en la lista
    writeln();
    writeln('El elemento 2 esta: ' + BoolToStr(in_list(lista,2),true));

    // 2.10 Verificar recursivamente si un elemento está en la lista
    writeln();
    writeln('El elemento 0 esta: ' + BoolToStr(rec_in_list(lista,0),true));


    readln;
end.
