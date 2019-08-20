program    longarithmetics;
type       PItem=^TItem;
           TItem=record
           data:byte;//integer;
           next,prev:PItem;
           end;

procedure  Push(var p:PItem;data:integer);
var        i:PItem;
begin
           new(i);
           i^.data:=data;
           p^.next:=i;
           i^.prev:=p;
end;

procedure  Pop(var p:PItem);
var        i:PItem;
begin
           if (P<>nil) then  //jestj li shto to v ukazatele
            begin
             i:=p;
             p:=p^.next;
             dispose(i);    //udaljajet to shto nahoditsja na adrese i
            end;
end;

procedure  EraseStack(var p:PItem);
begin
           while (p<>nil) do
             begin
              pop(p);
             end;
end;

procedure  Displaystack(p:PItem);
begin
           while (p<>nil) do
            begin
             writeln(p^.data);
             p:=p^.next;
            end;
end;
procedure  Dividebyleast(var p:Pitem;var start:pitem;var ending:pitem;number:cardinal);
begin
           new(p);
           p^.data:=number mod 10;
           number:=number div 10;
           p^.prev:=nil;
           start:=p;

           while (number<>0) do
            begin
             Push(p,(number mod 10));
             p:=p^.next;
             number:=number div 10;
            end;

           ending:=p;
           p^.next:=nil;
           p:=start;
end;
function   sum(p1,p2:pitem):pitem;
var        start,p3:pitem;savery:byte;
begin
           savery:=0;
           new(p3);start:=p3;
           while (p1<>nil) or (p2<> nil) do
            begin
             if (p1=nil) then
              begin
               p3^.data:=(p2^.data+savery) mod 10;
               savery:=(p2^.data+savery) div 10;
               p2:=p2^.next;
              end
              else if (p2=nil) then
                    begin
                     p3^.data:=(p1^.data+savery) mod 10;
                     savery:=(p1^.data+savery) div 10;
                     p1:=p1^.next;
                    end
                 else
                   begin
                     p3^.data:=(p1^.data+p2^.data+savery) mod 10;
                     savery:=(p1^.data+p2^.data+savery) div 10;
                     p1:=p1^.next;
                     p2:=p2^.next;
                   end;
             new(p3^.next);p3:=p3^.next;
            end;
            p3^.data:=savery;p3^.next:=nil;
            sum:=start;
end;
var        P1,Start1,ending1:PItem;
           P2,Start2,ending2:PItem;
           p3:pitem;
           i:integer;
           number1,number2:cardinal;
begin
           randomize;
           number1:=random(high(cardinal));
           number2:=random(high(cardinal));
           writeln('chislo 1 =',number1);
           writeln('chislo 2 =',number2);

           Dividebyleast(p1,start1,ending1,number1);
           Dividebyleast(p2,start2,ending2,number2);
           Displaystack(p1);writeln('______'); Displaystack(p2);
           p3:=nil;
           p3:=sum(p1,p2);
           writeln('_________');
           Displaystack(p3);
           readln;
end.
