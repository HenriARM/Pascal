{циклический сдвиг массива при помощи переворачивания двух частиц массива 
 а потом уже целого массива}
program    displacement2;
uses       crt;
const      N=5;
type       arr=array[1..N] of integer;
procedure  invert(var a:arr;left,right:integer);
var        memory:integer;
begin
           if (right>left) then
            begin
              memory:=a[left];
              a[left]:=a[right];
              a[right]:=memory;
              invert(a,left+1,right-1);
            end;
end;
var        matrix:arr;
           i,k:integer;
begin
           writeln('vvedite massiv chisel');
           for i:=1 to N do
             begin
               readln(matrix[i]);
             end;
           writeln('vvedite dlinu smeshenija');
           readln(k);
           invert(matrix,1,N-k);
           invert(matrix,N-k+1,N);
           invert(matrix,1,N);
           for i:=1 to N do
             begin
               write(matrix[i]);
             end;
           readkey;
end.
