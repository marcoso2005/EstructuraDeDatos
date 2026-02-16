{ Programa principal de ejemplo }
program tad_ej3_gestion_academica.pas;

uses
  uPersona, uAsignaturaEvalContinua, uAsignaturaEvalFinal;




var
  Profesor: PPersona;
  Alumno1, Alumno2: PPersona;
  AsigContinua: uAsignaturaEvalContinua.TAsignatura;
  AsigFinal: uAsignaturaEvalFinal.TAsignatura;

begin
  { Crear profesor }
  New(Profesor);
  CrearPersona(Profesor^, 'Juan', 'García', '12345678A', '1980-01-01', rProfesor);
  MostrarPersona(Profesor^);

  { Crear alumnos }
  New(Alumno1);
  CrearPersona(Alumno1^, 'Ana', 'López', '87654321B', '2000-05-15', rAlumno);
  MostrarPersona(Alumno1^);


  New(Alumno2);
  CrearPersona(Alumno2^, 'Pedro', 'Martínez', '98765432C', '2001-03-20', rAlumno);
  MostrarPersona(Alumno2^);

  { Inicializar asignaturas }
  uAsignaturaEvalContinua.InicializarAsignatura(AsigContinua, Profesor);
  uAsignaturaEvalFinal.InicializarAsignatura(AsigFinal, Profesor);

  { Añadir alumnos a ambas asignaturas }
  uAsignaturaEvalContinua.AnadirAlumno(AsigContinua, Alumno1);
  uAsignaturaEvalFinal.AnadirAlumno(AsigFinal, Alumno2);

  WriteLn('---------------------------------');

  { Evaluar alumnos }
  WriteLn('Evaluando alumnos...');

  { Evaluación continua - varias notas }
  uAsignaturaEvalContinua.Evaluar(AsigContinua, '87654321B', 4.5, 1);
  uAsignaturaEvalContinua.Evaluar(AsigContinua, '87654321B', 8.5, 2);

  { Evaluación final - una nota }
  uAsignaturaEvalFinal.Evaluar(AsigFinal, '98765432C', 7.0);

  { Mostrar resultados }
  WriteLn('Notas finales Evaluación Continua:');
  WriteLn('Ana López: ', uAsignaturaEvalContinua.CalcularNotaFinal(AsigContinua, '87654321B'):0:2);

  WriteLn;
  WriteLn('Notas finales Evaluación Final:');
  WriteLn('Pedro Martínez: ', uAsignaturaEvalFinal.CalcularNotaFinal(AsigFinal, '98765432C'):0:2);
  readln;
end.
