L3

Añade las hojas de un arbol a una lista

L4

9

P1



function profundidad (a: tree) : integer;
begin

if(is\_empty(a)) then

begin

&#x20;   profundidad := 0;

end

else

begin

&#x20;   profundidad := 1+ max(profundidad(a^.hi), profundidad a^.hd);

end;

end;







P4

procedure recorrido(a:arbol);

begin

if(not a = nil) 

&#x20; recorrido(a^.hcentral);

&#x20; visitar(a);

&#x20; recorrer(a^.hder);

&#x20; recorrer(a^.hizq);

end;





P5

function gradoPonderado(g: graph;n:integer): integer;

var

&#x20; i,pos,cuenta : integer;

begin

if(not in\_graph(g,n)) then

&#x20; gradoPonderado:=-1;

else

begin

&#x20; cuenta := 0;

&#x20; pos := -1;

&#x20; for i := 0 to g^.num\_elems do

&#x20; begin

&#x20;   if(g^.lableNodo\[i] = n) then

&#x20;      pos := i;

&#x20; end;



&#x20; for i := 0 to g^.num\_elems do

&#x20; begin

&#x20;   if(not g^.tabla\[i,pos] = 'inf')and(not i = pos) then

&#x20;     cuenta := cuenta + StrToInteger(g^.tabla\[i,pos]);

&#x20; end;

&#x20; if pos = -1 then

&#x20;    cuenta := -1;

&#x20; gradoPonderado:= cuenta;

end;



end;

