program conjuntos_ej1;

uses uListaEnlazadaSimple;


function bool_to_str(b: boolean): string;
begin
    if b then
        bool_to_str := 'bien.'
    else
        bool_to_str := 'mal.';
end;



{
    Ejercicio 1: Dada una lista de enteros, genera una nueva lista con todos los elementos que aparecen en la lista original, pero sin duplicados y en orden creciente.
    No se permite el uso de las funciones copy ni in_list de la lista enlazada. Además, se deben usar los conjuntos de pascal.
}
procedure generar_lista_sin_duplicados(var list, aux: tListaSimple);
var
    listado: set of 0..255;
    i,n: integer;
begin
   initialize(aux);
   listado := [];
   n := num_elems(list);
   for i := 0 to n-1 do
   begin
       listado := listado + [first(list)];
       insert_at_end(list,first(list));
       delete_at_end(list);
   end;

   for i := 0 to 255 do
   begin
       if i in listado then
       begin
            insert_at_end(aux,i);
       end;
   end;

end;


procedure crear_lista_1(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
    insert_at_end(l, 5);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
end;

procedure crear_lista_2(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 2);
    insert_at_end(l, 3);
    insert_at_end(l, 4);
    insert_at_end(l, 5);
end;


procedure crear_lista_3(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
    insert_at_end(l, 1);
end;

procedure crear_lista_4(var l: tListaSimple);
begin
    initialize(l);
    insert_at_end(l, 1);
end;


procedure test_generar_lista_sin_duplicados();
var
    lista_original, lista_resultado, lista_sin_duplicados: tListaSimple;
    resultado_str, original_str: string;
begin
    WriteLn('Ejercicio: Generar una lista con elementos sin duplicados y ordenada.');
    WriteLn('===========================================');
    WriteLn;

    crear_lista_1(lista_original);
    crear_lista_2(lista_resultado);
    original_str := to_string(lista_original);
    generar_lista_sin_duplicados(lista_original, lista_sin_duplicados);
    resultado_str := to_string(lista_sin_duplicados);

    WriteLn('Caso 1: ',  original_str, ' -> ', resultado_str, ' ', bool_to_str(resultado_str = to_string(lista_resultado)));

    clear(lista_original);
    clear(lista_resultado);
    clear(lista_sin_duplicados);

    crear_lista_3(lista_original);
    crear_lista_4(lista_resultado);
    original_str := to_string(lista_original);
    generar_lista_sin_duplicados(lista_original, lista_sin_duplicados);
    resultado_str := to_string(lista_sin_duplicados);

    WriteLn('Caso 2: ',  original_str, ' -> ', resultado_str, ' ', bool_to_str(resultado_str = to_string(lista_resultado)));

end;


begin
    test_generar_lista_sin_duplicados();
    readln;
end.
