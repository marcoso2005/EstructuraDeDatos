{ Unidad para asignatura con evaluación final }
unit uAsignaturaEvalFinal;

interface
uses uPersona;

const
  MAX_ALUMNOS = 30;

// Definición de registros y tipos enumerados

procedure InicializarAsignatura(var A: TAsignatura; Prof: PPersona);
procedure AnadirAlumno(var A: TAsignatura; Alumno: PPersona);
procedure Evaluar(var A: TAsignatura; AlumnoDNI: string; Nota: Real);
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


// Implementación de las funciones y procedimientos para la asignatura con evaluación final

end.
