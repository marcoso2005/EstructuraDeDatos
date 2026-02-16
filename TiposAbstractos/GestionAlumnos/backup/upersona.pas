{ Unidad base para personas }
unit uPersona;

interface

type
  TRol = (rAlumno,rProfesor);
  TPersona = RECORD
    nombre: String;
    apellido: String;
    dni: String;
    fechaNacimiento :string;
    rol :TRol;
  end;

  PPersona= ^TPersona;


procedure CrearPersona(var persona: TPersona; Nombre, Apellido, DNI, FechaNacimiento: String; Rol: TRol);
procedure MostrarPersona(P: TPersona);

implementation

procedure CrearPersona(var persona: TPersona; Nombre, Apellido, DNI, FechaNacimiento: String; Rol: TRol);
begin
 persona.nombre := nombre;
 persona.apellido := apellido;
 persona.dni := dni;
 persona.fechanacimiento := FechaNacimiento;
 persona.rol := rol;
end;

procedure MostrarPersona(P: TPersona);
begin
 writeln('Persona [', 'nombre: ', p.nombre, ', apellido: ', p.apellido, ', dni: ', p.dni ,', FechaNacimiento: ', p.FechaNacimiento,', rol: ' p.rol,']');
end;

end.






