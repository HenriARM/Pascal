program   floyd;
const     N=10;
type      arr=array[1..N,1..N] of integer;
var       i,j,k:integer;
          matrix:arr;
function  min(a,b:integer):integer;
begin
          if (a>=b) then min:=a else min:=b;
end;
begin
          randomize;
          fillchar(matrix,sizeof(matrix),0);
          for i:=1 to N do
           begin
            for j:=1 to N do
              begin
               matrix[i,j]:=random(100);
              end;
            end;

          for i:=1 to N do
           begin
            for j:=1 to N do
             begin
              for k:=1 to N do
               begin
                matrix[i,j]:=min(matrix[i,j],matrix[i,k]+matrix[k,j]);
               end;
             end;
           end;
          writeln('otvet=',matrix[N,N]);
          readln;
end.