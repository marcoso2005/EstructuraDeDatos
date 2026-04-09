program conjuntos_ej2;

{
    Ejercicio 2.1: Diferencia simétrica de conjuntos.
    Dados dos conjuntos A y B, la diferencia simétrica de A y B es el conjunto de elementos que están en A o en B, pero no en ambos.
    Por ejemplo, si A = [1, 2, 3] y B = [3, 4, 5], entonces la diferencia simétrica de A y B es [1, 2, 4, 5].
    Implementa un procedimiento que reciba dos conjuntos A y B y devuelva un conjunto C la diferencia simétrica de ambos conjuntos.
}

type
    set_of_0_255 = set of 0..255;


procedure diferencia_simetrica_conjuntos(A, B: set_of_0_255; var C: set_of_0_255);
var
    i : integer;
begin
    c := [];
    for i := 0 to 255 do
    begin
      if((i in a) XOR (i in b)) then
      begin
        c := c + [i];
      end;
    end;
end;


{ Ejercicio 2.2: Es subconjunto.
    Implementa una función que reciba dos conjuntos A y B y devuelva true si A es subconjunto de B, y false en caso contrario.
    Por ejemplo, si A = [1, 2] y B = [1, 2, 3], entonces A es subconjunto de B.
}
function es_subconjunto(A, B: set_of_0_255): boolean;
var
    res : boolean;
    i: integer;
begin
    res := true;
    for i := 0 to 255 do
    begin
      if((i in a) and not (i in b)) then
      begin
        res := false;
      end;
    end;
    es_subconjunto := res;
end;


{ Ejercicio 2.3: Intersección de conjuntos.
    Implementa un procedimiento que reciba dos conjuntos A y B y devuelva un conjunto C con la intersección de ambos conjuntos.
    Por ejemplo, si A = [1, 2, 3] y B = [3, 4, 5], entonces la intersección de A y B es [3].
}
procedure interseccion_conjuntos(A, B: set_of_0_255; var C: set_of_0_255);
var
    i: integer;
begin
    c:= [];
    for i := 0 to 255 do
    begin
      if((i in a) and (i in b)) then
      begin
        c := c + [i];
      end;
    end;
end;


{ Ejercicio 2.4: Unión de conjuntos.
 Implementa un procedimiento que reciba dos conjuntos A y B y devuelva un conjunto C con la unión de ambos conjuntos.
    Por ejemplo, si A = [1, 2, 3] y B = [3, 4, 5], entonces la unión de A y B es [1, 2, 3, 4, 5].}
procedure union_conjuntos(A, B: set_of_0_255; var C: set_of_0_255);
var
    i: integer;
begin
    c:= [];
    for i := 0 to 255 do
    begin
      if((i in a) or (i in b)) then
      begin
        c := c + [i];
      end;
    end;
end;


{ Ejercicio 2.5: Diferencia de conjuntos.
    Implementa un procedimiento que reciba dos conjuntos A y B y devuelva un conjunto C con la diferencia de ambos conjuntos.
}
procedure diferencia_conjuntos(A, B: set_of_0_255; var C: set_of_0_255);
var
    i: integer;
begin
    c:= [];
    for i := 0 to 255 do
    begin
      if((i in a) and (i in b)) then
      begin
        c := c - [i];
      end;
    end;
end;


procedure test_diferencia_simetrica_conjuntos();
var
    A, B, C: set of 0..255;

begin
    A := [1, 2, 3];
    B := [3, 4, 5];
    diferencia_simetrica_conjuntos(A, B, C);
    WriteLn('Diferencia simétrica de A y B: ', C = [1, 2, 4, 5]);

    A := [1, 2, 3, 4];
    B := [3, 4, 5];
    diferencia_simetrica_conjuntos(A, B, C);
    WriteLn('Diferencia simétrica de A y B: ', C = [1, 2, 5]);

    A := [1, 2, 3];
    B := [1, 2, 3];
    diferencia_simetrica_conjuntos(A, B, C);

    WriteLn('Diferencia simétrica de A y B: ', C = []);
end;


procedure test_es_subconjunto();
var
    A, B: set_of_0_255;

begin
    A := [1, 2];
    B := [1, 2, 3];
    WriteLn('A es subconjunto de B: ', es_subconjunto(A, B));

    A := [1, 2, 3];
    B := [1, 2, 3];
    WriteLn('A es subconjunto de B: ', es_subconjunto(A, B));

    A := [1, 2, 3];
    B := [1, 2];
    WriteLn('A es subconjunto de B: ', not es_subconjunto(A, B));
end;


procedure test_interseccion_conjuntos();
var
    A, B, C: set_of_0_255;

begin
    A := [1, 2, 3];
    B := [3, 4, 5];
    interseccion_conjuntos(A, B, C);
    WriteLn('Intersección de A y B: ', C = [3]);

    A := [1, 2, 3, 4];
    B := [3, 4, 5];
    interseccion_conjuntos(A, B, C);
    WriteLn('Intersección de A y B: ', C = [3, 4]);

    A := [1, 2, 3];
    B := [1, 2, 3];
    interseccion_conjuntos(A, B, C);
    WriteLn('Intersección de A y B: ',  (C = [1, 2, 3]));
end;


procedure test_union_conjuntos();
var
    A, B, C: set_of_0_255;

begin
    A := [1, 2, 3];
    B := [3, 4, 5];
    union_conjuntos(A, B, C);
    WriteLn('Unión de A y B: ', C = [1, 2, 3, 4, 5]);

    A := [1, 2, 3, 4];
    B := [3, 4, 5];
    union_conjuntos(A, B, C);
    WriteLn('Unión de A y B: ', C = [1, 2, 3, 4, 5]);

    A := [1, 2, 3];
    B := [1, 2, 3];
    union_conjuntos(A, B, C);
    WriteLn('Unión de A y B: ', C = [1, 2, 3]);
end;


procedure test_diferencia_conjuntos();
var
    A, B, C: set_of_0_255;

begin
    A := [1, 2, 3];
    B := [3, 4, 5];
    diferencia_conjuntos(A, B, C);
    WriteLn('Diferencia de A y B: ', C = [1, 2]);

    A := [1, 2, 3, 4];
    B := [3, 4, 5];
    diferencia_conjuntos(A, B, C);
    WriteLn('Diferencia de A y B: ', C = [1, 2]);

    A := [1, 2, 3];
    B := [1, 2, 3];
    diferencia_conjuntos(A, B, C);
    WriteLn('Diferencia de A y B: ', C = []);
end;


begin
    WriteLn('Ejercicio 2.1: Diferencia simétrica de conjuntos');
    test_diferencia_simetrica_conjuntos();
    WriteLn('-----------------------------------------------');

    WriteLn('Ejercicio 2.2: Es subconjunto');
    test_es_subconjunto();
    WriteLn('-----------------------------------------------');

    WriteLn('Ejercicio 2.3: Intersección de conjuntos');
    test_interseccion_conjuntos();
    WriteLn('-----------------------------------------------');

    WriteLn('Ejercicio 2.4: Unión de conjuntos');
    test_union_conjuntos();
    WriteLn('-----------------------------------------------');

    WriteLn('Ejercicio 2.5: Diferencia de conjuntos');
    test_diferencia_conjuntos();
    WriteLn('-----------------------------------------------');


    ReadLn; // Para evitar que la consola se cierre inmediatamente
end.
