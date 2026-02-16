program tad_ej1_num_complejo;

uses
    uComplejos;

var
    c1, c2, resultado: TComplejo;
    parteReal, parteImaginaria: Double;

begin
    // Crear dos números complejos
    CrearComplejo(c1, 3, 4);
    CrearComplejo(c2, 1, 2);

    // Obtener y mostrar las partes reales e imaginarias
    parteReal := GetParteReal(c1);
    parteImaginaria := GetParteImaginaria(c1);
    writeln('Parte real de c1: ', parteReal:0:2);
    writeln('Parte imaginaria de c1: ', parteImaginaria:0:2);

    parteReal := GetParteReal(c2);
    parteImaginaria := GetParteImaginaria(c2);
    writeln('Parte real de c2: ', parteReal:0:2);
    writeln('Parte imaginaria de c2: ', parteImaginaria:0:2);

    // Sumar dos números complejos
    Sumar(resultado, c1, c2);
    parteReal := GetParteReal(resultado);
    parteImaginaria := GetParteImaginaria(resultado);
    writeln('Suma: ', parteReal:0:2, ' + ', parteImaginaria:0:2, 'i');

    // Restar dos números complejos
    Restar(resultado, c1, c2);
    parteReal := GetParteReal(resultado);
    parteImaginaria := GetParteImaginaria(resultado);
    writeln('Resta: ', parteReal:0:2, ' + ', parteImaginaria:0:2, 'i');

    // Multiplicar dos números complejos
    Multiplicar(resultado, c1, c2);
    parteReal := GetParteReal(resultado);
    parteImaginaria := GetParteImaginaria(resultado);
    writeln('Multiplicación: ', parteReal:0:2, ' + ', parteImaginaria:0:2, 'i');

    // Dividir dos números complejos
    Dividir(resultado, c1, c2);
    parteReal := GetParteReal(resultado);
    parteImaginaria := GetParteImaginaria(resultado);
    writeln('División: ', parteReal:0:2, ' + ', parteImaginaria:0:2, 'i');

    // Elevar un número complejo a una potencia
    Potencia(resultado, c1, 2);
    parteReal := GetParteReal(resultado);
    parteImaginaria := GetParteImaginaria(resultado);
    writeln('Potencia: ', parteReal:0:2, ' + ', parteImaginaria:0:2, 'i');

    // Modificar las partes reales e imaginarias
    SetParteReal(c1, 5);
    SetParteImaginaria(c1, 6);
    parteReal := GetParteReal(c1);
    parteImaginaria := GetParteImaginaria(c1);
    writeln('Nueva parte real de c1: ', parteReal:0:2);


    readln();
end.
