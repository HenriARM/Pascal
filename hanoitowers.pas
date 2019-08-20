program     hanoitowers;
const       N=2;
procedure   Hanoi(tfrom,tto,tvia,counter:integer);
begin
            if (counter>0) then
             begin
              Hanoi(tfrom,tvia,tto,counter-1);  //to shto vishe nuzhno perekinutj na 2 bashnju
              writeln('iz',tfrom,' v',tto);     //perekinutj dannoje kolco na 3
              Hanoi(tvia,tto,tfrom,counter-1);  //perekinutj vse to shto vishe na 3 (poverh dannogo kolechka)
             end;
end;
begin
            Hanoi(1,3,2,N);
            readln;
end.
