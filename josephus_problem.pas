program    iosifkobzon;
type       PItem=^TItem;
           TItem=record
           data:integer;
           next:PItem;
           end;
procedure  Push(var p:PItem;data:integer);
var        i:PItem;
begin
           new(i);
           i^.data:=data;
           i^.next:=p;
           p:=i;
end;
const      N=100 ;
var        s,p,oldp:PItem;
           i,distance:integer;
begin
           readln(distance);
           s:=nil;
           p:=nil;
           oldp:=nil;
           Push(s,N);
           p:=s;
           i:=N;
           while(i<>1) do
            begin
              dec(i);
              Push(s,i);
            end;
           p^.next:=s; //konec ukazivajet na nachalo
           oldp:=p; //konec
           p:=S;  //idem snachala
           while (p<>p^.next) do
            begin
             i:=1;
             while(i<>distance) do
               begin
                inc(i);
                oldp:=p;
                p:=p^.next;
               end;
             oldp^.next:=p^.next;
             dispose(p);
             p:=oldp^.next;
           end;
           writeln('ostalsja v zhivih',p^.data);
           readln;
end.
