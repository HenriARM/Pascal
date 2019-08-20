{циклический сдвиг,меняем и слева и справа блоки длиной в к}
program    displacement;
uses       crt;
const      N=7;
type       arr=array [1..N] of integer;
procedure  inverse(var a:arr;left1,left2,k,counter:integer);
var        memory:integer;
begin
           if (counter<>k) then
             begin
              memory:=a[left1];
              a[left1]:=a[left2];
              a[left2]:=memory;
              inverse(a,left1+1,left2+1,k,counter+1);
             end;
end;
procedure  solve(var a:arr;left,right,k:integer);
begin
           if (right-left>=1) and (k<>N) then
             begin
              if (k>(right-left-k+1)) then
                 begin
                   k:=right-left-k+1;
                   inverse(a,left,right-k+1,k,0);
                   solve(a,left,right-k,right-left-2*k+1);
                 end
              else
                 begin
                   inverse(a,left,right-k+1,k,0);
                   solve(a,left+k,right,k);
                 end;
             end;
end;
var        matrix:arr;
           k,i:integer;
begin
           writeln('vveditesortirovannij massiv');
           for i:=1 to N do
             begin
              readln(matrix[i]);
             end;
           writeln('vvedite dlinu sdviga');
           readln(k);
           solve(matrix,1,N,k);
           for i:=1 to N do
            begin
             write(matrix[i]);
            end;
           readkey;
end.
