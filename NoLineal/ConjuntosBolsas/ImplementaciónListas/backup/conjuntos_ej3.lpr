program conjuntos_ej3;

uses
  SysUtils,
  uMiConjunto;

type
  TTestResult = record
    Prueba: string;
    Resultado: string;
    ResultadoEsperado: string;
    OK: string;
  end;

var
  testResults: array of TTestResult;
  testCount: integer = 0;

procedure AddTestResult(const prueba, resultado, resultadoEsperado: string);
begin
  Inc(testCount);
  SetLength(testResults, testCount);
  testResults[testCount - 1].Prueba := prueba;
  testResults[testCount - 1].Resultado := resultado;
  testResults[testCount - 1].ResultadoEsperado := resultadoEsperado;
  if resultado = resultadoEsperado then
    testResults[testCount - 1].OK := 'Sí'
  else
    testResults[testCount - 1].OK := 'No';
end;

procedure TestInitialize;
var
  c: tConjunto;
begin
  init(c);
  AddTestResult('init', BoolToStr(is_empty_con(c)), BoolToStr(True));
end;

procedure TestAdd;
var
  c: tConjunto;
begin
  init(c);
  add(c, 10);
  AddTestResult('add (un elemento)', to_string_con(c), '10 ');
  add(c, 20);
  AddTestResult('add (dos elementos)', to_string_con(c), '10 20 ');
  add(c, 10); // Intentar añadir un elemento duplicado
  AddTestResult('add (elemento duplicado)', to_string_con(c), '10 20 ');
end;

procedure TestRemove;
var
  c: tConjunto;
begin
  init(c);
  add(c, 10);
  add(c, 20);
  remove(c, 10);
  AddTestResult('remove (un elemento)', to_string_con(c), '20 ');
  remove(c, 30); // Intentar eliminar un elemento que no existe
  AddTestResult('remove (elemento inexistente)', to_string_con(c), '20 ');
  remove(c, 20);
  AddTestResult('remove (último elemento)', to_string_con(c), '');
end;

procedure TestContains;
var
  c: tConjunto;
begin
  init(c);
  add(c, 10);
  AddTestResult('contains (elemento existente)', BoolToStr(contains(c, 10)), BoolToStr(True));
  AddTestResult('contains (elemento inexistente)', BoolToStr(contains(c, 20)), BoolToStr(False));
  init(c);
  AddTestResult('contains (conjunto vacío)', BoolToStr(contains(c, 10)), BoolToStr(False));
end;

procedure TestIsEmpty;
var
  c: tConjunto;
begin
  init(c);
  AddTestResult('is_empty_con (conjunto vacío)', BoolToStr(is_empty_con(c)), BoolToStr(True));
  add(c, 10);
  AddTestResult('is_empty_con (conjunto no vacío)', BoolToStr(is_empty_con(c)), BoolToStr(False));
end;

procedure TestSize;
var
  c: tConjunto;
begin
  init(c);
  AddTestResult('size (conjunto vacío)', IntToStr(size(c)), '0');
  add(c, 10);
  AddTestResult('size (un elemento)', IntToStr(size(c)), '1');
  add(c, 20);
  AddTestResult('size (dos elementos)', IntToStr(size(c)), '2');
  add(c, 10); // Intento de añadir duplicado no incrementa el tamaño
  AddTestResult('size (con duplicado)', IntToStr(size(c)), '2');
end;

procedure TestToString;
var
  c: tConjunto;
begin
  init(c);
  AddTestResult('to_string (conjunto vacío)', to_string_con(c), '');
  add(c, 30);
  add(c, 10);
  add(c, 20);
  AddTestResult('to_string (conjunto con elementos)', to_string_con(c), '30 10 20 ');
end;

procedure TestEmpty;
var
  c: tConjunto;
begin
  init(c);
  add(c, 10);
  add(c, 20);
  empty(c);
  AddTestResult('empty', to_string_con(c), '');
  AddTestResult('empty (is_empty_con)', BoolToStr(is_empty_con(c)), BoolToStr(True));
end;

procedure TestUnion;
var
  c1, c2, c3: tConjunto;
begin
  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c1, 2);
  add(c2, 2);
  add(c2, 3);
  union(c1, c2, c3);
  AddTestResult('union (con elementos comunes)', to_string_con(c3), '1 2 3 ');

  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c1, 2);
  add(c2, 3);
  add(c2, 4);
  union(c1, c2, c3);
  AddTestResult('union (sin elementos comunes)', to_string_con(c3), '1 2 3 4 ');

  init(c1);
  init(c2);
  init(c3);
  union(c1, c2, c3);
  AddTestResult('union (ambos vacíos)', to_string_con(c3), '');
end;

procedure TestIntersection;
var
  c1, c2, c3: tConjunto;
begin
  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c1, 2);
  add(c2, 2);
  add(c2, 3);
  intersection(c1, c2, c3);
  AddTestResult('intersection (con elementos comunes)', to_string_con(c3), '2 ');

  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c1, 2);
  add(c2, 3);
  add(c2, 4);
  intersection(c1, c2, c3);
  AddTestResult('intersection (sin elementos comunes)', to_string_con(c3), '');

  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c2, 1);
  intersection(c1, c2, c3);
  AddTestResult('intersection (un elemento común)', to_string_con(c3), '1 ');

  init(c1);
  init(c2);
  init(c3);
  intersection(c1, c2, c3);
  AddTestResult('intersection (ambos vacíos)', to_string_con(c3), '');
end;

procedure TestDifference;
var
  c1, c2, c3: tConjunto;
begin
  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c1, 2);
  add(c2, 2);
  add(c2, 3);
  difference(c1, c2, c3);
  AddTestResult('difference (con elementos comunes)', to_string_con(c3), '1 ');

  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c1, 2);
  add(c2, 3);
  add(c2, 4);
  difference(c1, c2, c3);
  AddTestResult('difference (sin elementos comunes)', to_string_con(c3), '1 2 ');

  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  add(c2, 1);
  difference(c1, c2, c3);
  AddTestResult('difference (un elemento común)', to_string_con(c3), '');

  init(c1);
  init(c2);
  init(c3);
  difference(c1, c2, c3);
  AddTestResult('difference (ambos vacíos)', to_string_con(c3), '');

  init(c1);
  init(c2);
  init(c3);
  add(c1, 1);
  difference(c1, c2, c3);
  AddTestResult('difference (segundo vacío)', to_string_con(c3), '1 ');

  init(c1);
  init(c2);
  init(c3);
  add(c2, 1);
  difference(c1, c2, c3);
  AddTestResult('difference (primero vacío)', to_string_con(c3), '');
end;


procedure PrintTestResults;
var
  i: integer;
begin
  Writeln('Prueba':30, 'Resultado':20, 'Resultado Esperado':20, 'OK':5);
  Writeln(StringOfChar('-', 75));
  for i := 0 to High(testResults) do
  begin
    Writeln(
      testResults[i].Prueba:30,
      testResults[i].Resultado:20,
      testResults[i].ResultadoEsperado:20,
      testResults[i].OK:5
    );
  end;
end;

begin
  TestInitialize;
  TestAdd;
  TestRemove;
  TestContains;
  TestIsEmpty;
  TestSize;
  TestToString;
  TestEmpty;
  TestUnion;
  TestIntersection;
  TestDifference;

  PrintTestResults;

  Readln; // Para pausar la consola y ver los resultados
end.
