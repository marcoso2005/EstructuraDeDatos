program test_lista_libros_modificada;


uses sysutils, uListaLibros, uTLibro;

var
    lista: tLista;
    lib1, lib2, lib3: TLibro;

begin
    writeln(#13#10'====== PRUEBA: LISTA DE LIBROS (MODIFICADA) ======');
    writeln('');

    initialize(lista);

    { Crear libros }
    lib1.titulo := 'El Quijote';
    lib1.autor := 'Cervantes';
    lib1.ISBN := '978-84-01-00001-8';

    lib2.titulo := 'Cien Años de Soledad';
    lib2.autor := 'García Márquez';
    lib2.ISBN := '978-84-01-00002-5';

    lib3.titulo := 'La Metamorfosis';
    lib3.autor := 'Kafka';
    lib3.ISBN := '978-84-01-00003-2';

    writeln('Insertando libros...');
    insertLast(lista, lib1);
    writeln('  -> ' + uTLibro.toString(lib1));
    insertLast(lista, lib2);
    writeln('  -> ' + uTLibro.toString(lib2));
    insertLast(lista, lib3);
    writeln('  -> ' + uTLibro.toString(lib3));

    writeln('');
    writeln('Estado de la lista:');
    writeln(uListaLibros.toString(lista));

    writeln('Tamaño: ' + IntToStr(size(lista)));
    getFirst(lista,libro);
    writeln('Primer elemento: ' + uTLibro.toString(libro));

    clear(lista);
    writeln('');
    writeln('✓ Ahora la lista almacena VERDADEROS libros, no enteros.');
    writeln('✓ Pero la estructura y la lógica siguen siendo las mismas.');
    readln;
end.
