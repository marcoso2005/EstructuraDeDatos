program test_lista_generica;

{
  TEST PASO 3: LISTA GENÉRICA CON TELEMENT

  Esta es la VERSIÓN GENÉRICA DE VERDAD.

  COMPARACIÓN CON VERSIÓN ANTERIOR:
  - uListaLibrosModificada.pas: tnodo.info es TLibro
  - uListaGenérica.pas: tnodo.info es TElement

  CONSECUENCIA:
  - uListaLibrosModificada es específica para libros
  - uListaGenérica funciona con CUALQUIER tipo

  ¿CÓMO ES ESTO POSIBLE?
  Porque TElement es lo que pongamos en uTElement.pas
  Actualmente contiene un TLibro, pero podría contener cualquier cosa.

  EJERCICIO FUTURO:
  Modifica uTElement.pas para contener un entero.
  Luego recompila esta prueba.
  ¡La lista genérica seguirá funcionando!
}

uses sysutils, uListaGenerica, uTElement, uTLibro;

var
    lista: tLista;
    elem1, elem2, elem3: TElement;

begin
    writeln(#13#10'====== PRUEBA: LISTA GENÉRICA ======');
    writeln('');
    writeln('Esta lista es GENÉRICA. Usa TElement en lugar de TLibro.');
    writeln('TElement puede ser modificado para contener lo que quieras.');
    writeln('');

    initialize(lista);

    { Crear elementos que contienen libros }
    elem1.libro.titulo := 'El Quijote';
    elem1.libro.autor := 'Cervantes';
    elem1.libro.ISBN := '978-84-01-00001-8';

    elem2.libro.titulo := 'Cien Años de Soledad';
    elem2.libro.autor := 'García Márquez';
    elem2.libro.ISBN := '978-84-01-00002-5';

    elem3.libro.titulo := 'La Metamorfosis';
    elem3.libro.autor := 'Kafka';
    elem3.libro.ISBN := '978-84-01-00003-2';

    writeln('Insertando elementos...');
    insertLast(lista, elem1);
    writeln('  -> ' + uTElement.toString(elem1));
    insertLast(lista, elem2);
    writeln('  -> ' + uTElement.toString(elem2));
    insertLast(lista, elem3);
    writeln('  -> ' + uTElement.toString(elem3));

    writeln('');
    writeln('Estado de la lista genérica:');
    writeln(uListaGenerica.toString(lista));

    writeln('Tamaño: ' + IntToStr(size(lista)));
    writeln('');
    writeln('✓ La lista genérica almacena TElement.');
    writeln('✓ TElement contiene TLibro.');
    writeln('✓ Si cambias TElement en uTElement.pas, la lista se adapta.');
    writeln('✓ ¡Eso es genericidad!');

    clear(lista);
    readln;
end.
