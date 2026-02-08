program punterosej6;

uses SysUtils;

const
  NUM_PAREJAS = 2;
  NUM_PARTICIPANTES = (2 * NUM_PAREJAS) + ((NUM_PAREJAS + 1) div 2);

type
  Roles = (tentador, pareja);

  PParticipante = ^Participante;
  Participante = record
    nombre: string;
    edad: integer;
    rol: Roles;
    otro_participante: PParticipante;
  end;

var
  participantes: array[0..NUM_PARTICIPANTES-1] of PParticipante;
  continuar: boolean = true;
  opcion: string;

procedure creacionParticipante(nombre: string; edad: integer; rol: Roles);
var
  i: integer;
begin
  for i := 0 to High(participantes) do
    if participantes[i] = NIL then
    begin
      New(participantes[i]);
      participantes[i]^.nombre := nombre;
      participantes[i]^.edad := edad;
      participantes[i]^.rol := rol;
      participantes[i]^.otro_participante := NIL;
      writeln('Participante creado');
      exit;
    end;

  writeln('Cupo lleno');
end;

procedure establecerPareja(p1, p2: PParticipante);
begin
  if (p1 <> NIL) and (p2 <> NIL) then
  begin
    p1^.otro_participante := p2;
    p2^.otro_participante := p1;
    writeln('Se ha realizado la relacion');
  end;
end;

procedure inicializar;
var
  nombre: string;
  edad: integer;
  i, idx: integer;
begin
  for i := 0 to High(participantes) do
    participantes[i] := NIL;

  idx := 0;

  for i := 1 to NUM_PAREJAS do
  begin
    write('Nombre miembro 1 pareja ', i, ': ');
    readln(nombre);
    write('Edad: ');
    readln(edad);
    creacionParticipante(nombre, edad, pareja);
    idx := idx + 1;

    write('Nombre miembro 2 pareja ', i, ': ');
    readln(nombre);
    write('Edad: ');
    readln(edad);
    creacionParticipante(nombre, edad, pareja);

    establecerPareja(participantes[idx-1], participantes[idx]);
    idx := idx + 1;

    if (i mod 2 = 0) then
    begin
      write('Nombre tentador: ');
      readln(nombre);
      write('Edad: ');
      readln(edad);
      creacionParticipante(nombre, edad, tentador);
      idx := idx + 1;
    end;
  end;
end;

procedure mostrar;
var
  i: integer;
begin
  for i := 0 to High(participantes) do
    if participantes[i] <> NIL then
    begin
      writeln('Nombre: ', participantes[i]^.nombre);
      writeln('Edad: ', participantes[i]^.edad);

      if participantes[i]^.otro_participante <> NIL then
        writeln('Pareja: ', participantes[i]^.otro_participante^.nombre)
      else
        writeln('Pareja: sin');

      if (participantes[i]^.rol = pareja) and
         (participantes[i]^.otro_participante = NIL) then
        writeln('Infiel: Si')
      else
        writeln('Infiel: No');

      if (participantes[i]^.rol = tentador) and (participantes[i]^.otro_participante <> NIL) then
        writeln('Tento a: ', participantes[i]^.otro_participante^.nombre);

    end;
end;


procedure ronda;
var
  i, idxPareja, idxTentador: integer;
  miembro: PParticipante;
begin
  Randomize;

  idxPareja := Random(NUM_PAREJAS) * 2;
  idxTentador := Random(NUM_PARTICIPANTES);

  if Random(2) = 0 then
    miembro := participantes[idxPareja]
  else
    miembro := participantes[idxPareja + 1];

  if (miembro <> NIL) and (Random(4) = 0) then
  begin
    if miembro^.otro_participante <> NIL then
      miembro^.otro_participante^.otro_participante := NIL;

    establecerPareja(miembro, participantes[idxTentador]);
    writeln('Hubo infidelidad');
  end
  else
    writeln('No se pudo tentar');
end;

procedure limpiar;
var
  i: integer;
begin
  for i := 0 to High(participantes) do
  begin
    if participantes[i] <> NIL then
      Dispose(participantes[i]);
    participantes[i] := NIL;
  end;
end;


begin
  inicializar;
  mostrar;

  repeat
    write('Desea otra ronda (Si/No): ');
    readln(opcion);

    if opcion = 'Si' then
      ronda
    else
      continuar := false;

  until not continuar;

  mostrar;
  readln();
  limpiar;
end.

