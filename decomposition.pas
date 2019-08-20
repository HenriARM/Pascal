//N-chislo razlozhenija,ispolzuja vse chisla do chisla M v razlozheniji
program   decomposition;
Uses      SysUtils;
const     N=10;
procedure decompose(N,M:integer;tail:string);
var       i:integer;
begin
          if (N>1) and (M>1) then
           begin
                  if (M>=N) then begin
                    decompose(N,M-1,tail);
                    if (M=N) then
                        writeln(tail+'+'+intToStr(N));
                  end
                   else
                     begin
                           decompose(N,M-1,tail);
                           decompose(N-M,M,tail+'+'+intToStr(M));
                     end;
           end
          else  if N=1 then writeln(N,tail)
           else if M=1 then
              begin
                   for i:=1 to N do write('1+');
                   writeln(tail);
               end;
end;
begin
      decompose(N,N,'');
      readln;
end.
