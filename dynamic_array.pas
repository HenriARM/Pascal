program    Dynamicarray;
type       tunit=record
           value:cardinal;
           bool:boolean;
           end;

           parray=^tarray;
           tarray=array[1..1] of tunit;

           Dynarr=record
           matrix:parray;
           delta:cardinal;
           last:cardinal;
           limit:cardinal;
           end;
const      unitsize=sizeof(tunit);
function   create(limit,delta:cardinal):dynarr;
var        res:dynarr;
begin
           res.delta:=delta;
           res.limit:=limit;
           getmem(res.limit*unitsize);
           fillchar(res.matrix^,sizeof(res.matrix),false);
           create:=res;
end;
procedure  setlimit(var a:dynarr;limit:cardinal);
var        tmp:parray;
begin
           tmp:=a.matrix;
           getmem(a.matrix,limit*unitsize);
           fillchar(a.matrix^,sizeof(a.matrix^),false);
           move(tmp^,a.matrix^,a.last*unitsize);
           freemem(tmp,a.limit*unitsize);
           a.limit:=limit;
end;

procedure  destroy(var a:dynarr);
begin
           Freemem(a.matrix,unitsize*a.limit);
end;
procedure  put(var a:dynarr;position,item:cardinal);
begin
           if (position<1) or (position>a.limit) then runerror(201);
           a.matrix^[position].value:=item;
           a.matrix^[position].bool:=true;
           if (position>a.last) then a.last:=position;
end;
procedure  add(var a:dynarr;item:cardinal);
begin
           if a.last=a.limit then
            begin
              if (a.delta<>0) then setlimit(a,a.limit+a.delta);
            end;
           inc(a.last);
           put(a,a.last,item);
end;
function   get(a:dynarr;position:cardinal;var success:boolean):cardinal;
begin
           if (position<1) or (position>a.limit) then success:=false
             else  success:=a.matrix^[position].bool;
           if success then get:=a.matrix^[position].value;
end;
procedure  delete(var a:dynarr;position:cardinal);
begin
           if (position<1) or (position>a.limit) then runerror(201);
           a.matrix^[position].bool:=false;
end;
procedure  purge(var a:dynarr);
var        i,j:cardinal;
begin
           j:=0;
           for i:=1 to a.last  do
            begin
             if (a.matrix^[i].bool) then
              begin
                inc(j);
                a.matrix^[j]:=a.matrix^[i];
              end;
             end;
            a.last:=j;
            if (a.delta>0) then
              begin
                   if (a.limit>=j+a.delta) then setlimit(a,j+a.delta);       //setlimit(a,j+(a.limit-j) mod a.delta);
                end;
end;
begin
           readln;
end.