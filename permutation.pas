//generator perestanovok v leksokograficheskom porjadke
program    permutation;
const      N=4;
type       arr=array[1..N] of integer;
var        matrix:arr;
           i:integer;
procedure  swap(a,b:integer);
var        memory:integer;
begin
           memory:=matrix[a];
           matrix[a]:=matrix[b];
           matrix[b]:=memory;
end;
procedure  inversion(position:integer);
var        i:integer;
begin
           for i:=position to ((N-position) div 2)+position do swap(i,N-i+position);
end;
procedure  Generate();
var        i,firstmax,number,pos:integer;
begin
           i:=N;
           while (i<>1) do
            begin
              if (matrix[i]>matrix[i-1]) then
               begin
                 pos:=i-1;
                 break;
                end
                   else if (i=2) then
                    begin
                      pos:=0
                    end
                        else
                         begin
                           dec(i);
                         end;
            end;

           if (pos<>0) then
            begin
               for i:=N downto pos do
                begin
                  if (matrix[i]>matrix[pos]) then
                   begin
                    firstmax:=i;
                    break;
                   end;
                end;
               swap(pos,firstmax);
               inversion(pos+1);
               for i:=1 to N do write(matrix[i]);
               writeln;
               Generate();
            end;
end;
begin
           fillchar(matrix,sizeof(matrix),0);
           for i:=1 to N do
            begin
              matrix[i]:=i;
              write(matrix[i]);
            end;
            writeln;
            Generate();
            readln;
end.
