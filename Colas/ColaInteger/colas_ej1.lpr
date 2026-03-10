program colas_ej1;

uses uColaInteger;

var
    cola: tCola;

begin
    // Ejercicio 1.2: Crear una cola, añadir elementos y mostrar la cola
    // 1.2.1 Crear una cola
    initialize_queue(cola);

    // 1.2.2 Añadir los elementos 1, 2, 3, 4 y 5 a la cola
    enqueue(cola,1);
    enqueue(cola,2);
    enqueue(cola,3);
    enqueue(cola,4);
    enqueue(cola,5);

    // 1.2.3 Mostrar los elementos de la cola
    writeln('Iniciar cola');
    writeln(#9+toString(cola));

    // Ejercicio 1.3: Trabajar con el primer y último elemento de la cola
    // 1.3.1 Mostrar el primer elemento de la cola
    write('Primer elemento: ');
    writeln(first(cola));

    // 1.3.2 Mostrar el último elemento de la cola
    write('Ultimo elemento: ');
    writeln(last(cola));

    // 1.3.3 Mostrar la diferencia entre el primer y el último elemento de la cola (primero - último)
    write('Diferencia primero y ultimo: ');
    writeln((first(cola)- last(cola)));

    // Ejercicio 1.4: Eliminar elementos de la cola
    // 1.4.1. Muestra el número de elementos de la cola.
    write('Num elementos: ');
    writeln(num_elems(cola));

    // 1.4.2 Eliminar el primer elemento de la cola
    dequeue(cola);

    // 1.4.3 Mostrar los elementos de la cola
    writeln('Cola despues de mosificación: ');
    writeln(#9+toString(cola));

    // 1.4.4. Muestra el número de elementos de la cola.
    write('Num elementos: ');
    writeln(num_elems(cola));

    // 1.4.5 Eliminar todos los elementos de la cola
    clear(cola);

    // 1.4.6 Mostrar los elementos de la cola
    writeln('Cola despues de vaciar: ');
    writeln(#9+toString(cola));

    // 1.4.7. Muestra el número de elementos de la cola.
    write('Num elementos: ');
    writeln(num_elems(cola));

    // Ejercicio 1.5: Consultar si la cola está vacía
    // 1.5.1 Consultar si la cola está vacía
    write('Cola vacia: ');
    writeln(empty_queue(cola));

    // 1.5.2 Añadir el elemento 1 a la cola
    enqueue(cola,1);

    // 1.5.3 Consultar si la cola está vacía
    write('Cola vacia: ');
    writeln(empty_queue(cola));

    readln();

end.
