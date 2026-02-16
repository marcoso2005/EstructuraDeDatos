{ Unidad para asignatura con evaluación continua }
unit uAsignaturaEvalContinua;

interface
uses uPersona;

const
  MAX_ALUMNOS = 30;

type
  TAsignatura = RECORD
    Profesor : PPersona;
    Alumnos: array[1..MAX_ALUMNOS] of PPersona;
    NotasPrimerParcial: array[1..MAX_ALUMNOS] of REAL;
    NotasSegundoParcial: array[1..MAX_ALUMNOS] of REAL;
    NumAlumnos: integer;
  end;



procedure InicializarAsignatura(var A: TAsignatura; Prof: PPersona);
procedure AnadirAlumno(var A: TAsignatura; Alumno: PPersona);
procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real; Parcial: Integer);
function CalcularNotaFinal(A: TAsignatura; AlumnoDNI: string): Real;

implementation

function BuscarAlumno(A: TAsignatura; AlumnoDNI: string): Integer;
var
  i: Integer;
begin
    BuscarAlumno := 0;
    i := 1;
    while (i <= A.NumAlumnos) and (A.Alumnos[i]^.DNI <> AlumnoDNI) do
        Inc(i);
    if i > A.NumAlumnos then
        i := -1;
    BuscarAlumno := i;
end;

// Implementación de las funciones y procedimientos para la asignatura con evaluación continua


procedure InicializarAsignatura(var A: TAsignatura; Prof: PPersona);
begin
    A.Profesor := prof;
    a.numAlumnos := MAX_ALUMNOS;
end;

procedure AnadirAlumno(var A: TAsignatura; Alumno: PPersona);
var
  i: integer;
  guardado : boolean;
begin
  guardado:= false;
  i := 1;
  while (i < MAX_ALUMNOS) AND NOT guardado do
  begin
    if A.alumnos[i] = NIL THEN
    begin
      a.alumnos[i] := alumno;
      guardado := true;
    end;
  end;
end;

procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real; Parcial: Integer);
var
  pos: integer;
begin
  pos:= BuscarAlumno(a,alumnoDNI);
  if pos <> -1 then
  begin
    if parcial = 1 then
    begin
       a.NotasPrimerParcial[pos] := nota;
    end
    else
    begin
      a.NotasSegundoParcial[pos] := nota;
    end;
  end;
end;

function CalcularNotaFinal(A: TAsignatura; AlumnoDNI: string): Real;
var
  pos: integer;
  res: Real;
begin
  pos:= BuscarAlumno(a,alumnoDNI);
  if pos <> -1 then
  begin
    res := (a.NotasPrimerParcial[pos]+a.NotasSegundoParcial[pos])/2;
  end;
  CalcularNotaFinal := res;
end;



end.
