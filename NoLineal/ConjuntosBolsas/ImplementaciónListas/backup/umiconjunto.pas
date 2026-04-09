unit uMiConjunto;

interface

uses uListaEnlazadaSimple;

type
    tConjunto = record
        lista: tListaSimple;
    end;

    {Operaciones básicas}
    procedure init(var c: tConjunto);
    procedure add(var c: tConjunto; x: integer);
    procedure remove(var c: tConjunto; x: integer);
    function contains(c: tConjunto; x: integer): boolean;
    function is_empty_con(c: tConjunto): boolean;
    function size(c: tConjunto): integer;
    function to_string_con(c: tConjunto): string;
    procedure empty(var c: tConjunto);

    {Otras operaciones}
    procedure union(c1, c2: tConjunto; var c3: tConjunto);
    procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
    procedure difference(c1, c2: tConjunto; var c3: tConjunto);


implementation
    {Operaciones básicas}
    procedure init(var c: tConjunto);
    begin
      initialize(c.lista);
    end;

    procedure add(var c: tConjunto; x: integer);
    begin
      if(not in_list(c.lista,x))  then
      begin
        insert_at_end(c.lista,x);
      end;
    end;

    procedure remove(var c: tConjunto; x: integer);
    begin
      if(in_list(c.lista,x)) then
      begin
        delete(c.lista,x);
      end;
    end;

    function contains(c: tConjunto; x: integer): boolean;
    begin
      contains := in_list(c.lista,x)
    end;

    function is_empty_con(c: tConjunto): boolean;
    begin
      is_empty_con := is_empty(c.lista);
    end;

    function size(c: tConjunto): integer;
    begin
       size := num_elems(c.lista);
    end;

    function to_string_con(c: tConjunto): string;
    begin
      to_string_con := to_string(c.lista);
    end;

    procedure empty(var c: tConjunto);
    begin
      clear(c.lista);
    end;

    {Otras operaciones}
    procedure union(c1, c2: tConjunto; var c3: tConjunto);
    begin
        while (not is_empty(c1.lista)) do
        begin
          insert_at_end(c3.lista,first(c1.lista));
          delete_at_begin(c1.lista);
        end;

        while (not is_empty(c2.lista)) do
        begin
          if(not in_list(c3.lista,first(c2.lista))) then
          begin
               insert_at_end(c3.lista,first(c2.lista));
          end;
          delete_at_begin(c2.lista);
        end;
    end;

    procedure intersection(c1, c2: tConjunto; var c3: tConjunto);
    begin
        while (not is_empty(c1.lista)) do
        begin
          if(not in_list(c3.lista,first(c1.lista)) and (in_list(c2.lista,first(c1.lista)))) then
          begin
               insert_at_end(c3.lista,first(c1.lista));
          end;
          delete_at_begin(c1.lista);
        end;
    end;

    procedure difference(c1, c2: tConjunto; var c3: tConjunto);
    begin
      while (not is_empty(c1.lista)) do
        begin
          if(not in_list(c3.lista,first(c1.lista)) and ( not in_list(c2.lista,first(c1.lista)))) then
          begin
               insert_at_end(c3.lista,first(c1.lista));
          end;
          delete_at_begin(c1.lista);
        end;
    end;

end.
