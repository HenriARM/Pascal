program   quicksort;
uses      crt;
const     N=5;
type      arr=array[1..N] of integer;
procedure Swap (var a,b:integer);
var       temp:integer;
begin
          temp:=a;
          a:=b;
          b:=temp;
end;
procedure solve(var matrix:arr;start,stop:integer);
var       i,j,prop:integer;
begin
           i:=start;
           j:=stop;
           prop:=matrix[(start+stop) div 2];
           repeat
            while (matrix[i]<prop) do inc(i);
            while (matrix[j]>prop) do dec(j);
            if (i<=j) then begin
              Swap(matrix[i],matrix[j]);
              inc(i);dec(j);
             end;
           until (i>j);
           if (j>start) then solve(matrix,start,j);
           if (i<stop)  then solve(matrix,i, stop);
end;
var       i:integer;
          matrix:arr;
begin
          writeln('vvedite massiv');
          for i:=1 to N do readln(matrix[i]);
          solve(matrix,1,N);
          for i:=1 to N do writeln(matrix[i]);
          readkey;
end.
