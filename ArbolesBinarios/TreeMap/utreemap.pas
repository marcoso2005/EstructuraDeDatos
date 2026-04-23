unit uTreeMap;

interface
  uses
  uListaEnlazadaSimple;

  type
    tTreeMap = ^tnode;
    tnode = record
      key: integer;
      value: tListaSimple;
      hi, hd: tTreeMap;
    end;

  // Basic methods
  procedure initialize(var a: tTreeMap);
  function is_empty(a: tTreeMap): boolean;
  procedure add(var a: tTreeMap; key: integer; value: string);
  procedure add(var a: tTreeMap; value: string);
  procedure get(a: tTreeMap; key: integer; var value: tListaSimple);
  function contains(a: tTreeMap; key: integer): boolean;
  procedure remove(var a: tTreeMap; x: integer);
  procedure remove_value(var a: tTreeMap; x: integer; value: string);
  procedure remove_value(var a: tTreeMap; value: string);

  // Traversal algorithms
  procedure preorder(a: tTreeMap);
  procedure inorder(a: tTreeMap);
  procedure postorder(a: tTreeMap);

  // Other methods
  procedure get_hi(a: tTreeMap; var b: tTreeMap);
  procedure get_hd(a: tTreeMap; var b: tTreeMap);

implementation

uses
  Math;

procedure initialize(var a: tTreeMap);
begin
  a := NIL;
end;

function is_empty(a: tTreeMap): boolean;
begin
  is_empty := a = NIL;
end;

function in_tree(a: tTreeMap; clave: integer): boolean;
begin
  if a = NIL then
    in_tree := FALSE
  else if a^.key < clave then
    in_tree := in_tree(a^.hd, clave)
  else if a^.key > clave then
    in_tree := in_tree(a^.hi, clave)
  else
    in_tree := TRUE;
end;

procedure add(var a: tTreeMap; key: integer; value: string);
begin
  if a = NIL then
  begin
    new(a);
    uListaEnlazadaSimple.initialize(a^.value);
    insert_at_end(a^.value,value);
    a^.key := key;
    a^.hi := NIL;
    a^.hd := NIL;
  end
  else if a^.key < key then
    add(a^.hd, key,value)
  else if a^.key > key then
    add(a^.hi, key,value)
  else
    //if(not in_list(a^.value,value)) then
      insert_at_end(a^.value,value);
end;

procedure add(var a: tTreeMap; value: string);
begin
  add(a,length(value),value);
end;

procedure get(a: tTreeMap; key: integer; var value: tListaSimple);
begin
  if a = NIL then
  begin
     uListaEnlazadaSimple.initialize(value);
  end
  else if a^.key < key then
    get(a^.hd, key,value)
  else if a^.key > key then
    get(a^.hi, key,value)
  else
    value := a^.value;
end;

function contains(a: tTreeMap; key: integer): boolean;
begin
  if a = NIL then
    contains := FALSE
  else if a^.key < key then
    contains := contains(a^.hd, key)
  else if a^.key > key then
    contains := contains(a^.hi, key)
  else
    contains := TRUE;
end;

procedure remove(var a: tTreeMap; x: integer);
var
  aux, ant: tTreeMap;
begin
  if a <> NIL then
    if a^.key < x then
      remove(a^.hd, x)
    else if a^.key > x then
      remove(a^.hi, x)
    else
    begin
      aux := a;
      if a^.hi = NIL then
        a := a^.hd
      else if a^.hd = NIL then
        a := a^.hi
      else
      begin
        aux := a^.hi;
        while aux^.hd <> NIL do
        begin
          ant := aux;
          aux := aux^.hd;
        end;
        if a^.hi = aux then
          a^.hi := aux^.hi
        else
          ant^.hd := aux^.hi;
        a^.key := aux^.key;
      end;
      dispose(aux);
    end;
end;

procedure remove_value(var a: tTreeMap; x: integer; value: string);
var
  l : tListaSimple;
begin
   if a <> NIL then

  if a^.key < x then
    remove_value(a^.hd, x,value)
  else if a^.key > x then
    remove_value(a^.hi, x,value)
  else
  begin
   if(not uListaEnlazadaSimple.is_empty(a^.value))then
     delete( a^.value,value);
   if(uListaEnlazadaSimple.is_empty(a^.value)) then
   begin
     remove(a,x);
   end;
  end;
end;

procedure remove_value(var a: tTreeMap; value: string);
begin
   remove_value(a,length(value),value);
end;

// Traversal algorithms

procedure visit(x: integer);
begin
  writeln(x);
end;

procedure preorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    visit(a^.key);
    preorder(a^.hi);
    preorder(a^.hd);
  end;
end;

procedure inorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    inorder(a^.hi);
    visit(a^.key);
    inorder(a^.hd);
  end;
end;

procedure postorder(a: tTreeMap);
begin
  if (a <> NIL) then
  begin
    postorder(a^.hi);
    postorder(a^.hd);
    visit(a^.key);
  end;
end;

// Other methods

function get_info(a: tTreeMap): integer;
begin
  get_info := a^.key;
end;

procedure get_hi(a: tTreeMap; var b: tTreeMap);
var
  hi: tTreeMap;
begin
  if a = nil then
    b := nil
  else
  begin
    hi := a^.hi;
    new(b);
    b^.key := hi^.key;
    b^.hi := hi^.hi;
    b^.hd := hi^.hd;
  end;
end;

procedure get_hd(a: tTreeMap; var b: tTreeMap);
var
  hd: tTreeMap;
begin
  if a = nil then
    b := nil
  else
  begin
    hd := a^.hd;
    new(b);
    b^.key := hd^.key;
    b^.hi := hd^.hi;
    b^.hd := hd^.hd;
  end;
end;


end.
