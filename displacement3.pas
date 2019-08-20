{циклический сдвиг при помощи нод,
используя одну переменную для запоминания последущей перестановки}
program    displacement3;
uses       crt;
const      N=6;
type       arr=array[1..N] of integer;
function   max(a,b:integer):integer;
begin
           if (a>=b) then max:=a
             else max:=b
end;
function   min(a,b:integer):integer;
begin
           if (a<b) then min:=a
             else min:=b
end;
function   nod(max,min:integer):integer;
var        modulj:integer;
begin
           modulj:=max mod min;
           if (max=0) or (min=0) then nod:=max
            else  if (modulj=0) then  nod:=min
             else  nod:=nod(min,modulj);
end;
procedure  invert(var a:arr;k,position,memory,head,nodcounter,nodnumbers:integer;bool:boolean);
var        tmp:integer;
begin
           tmp:=a[position];
           a[position]:=memory;
           memory:=tmp;
           position:=position+k;
           if (position>N) then
            begin
             position:=position-N;
             inc(nodcounter);
            end;
           if (bool=true) and (head=position-k) then
             begin
              inc(head);
              position:=head+k;
              memory:=a[head];
             end;
           if (nodnumbers<>nodcounter) or ((nodnumbers=nodcounter) and (head<>position-k))
             then invert(a,k,position,memory,head,nodcounter,nodnumbers,bool);
end;
var        matrix:arr;
           i,k,nodnumbers:integer;
           bool:boolean;
begin
           writeln('vvedite massiv');
           for i:=1 to N do
             begin
               readln(matrix[i]);
             end;
           writeln('vvedite dlinu smeshenija');
           readln(k);
           nodnumbers:=Nod(N,k);
           if nodnumbers=1 then
             begin
               bool:=false;
               nodnumbers:=k;
             end
              else bool:=true;
           if (k>=1) and (k<N)
             then invert(matrix,k,1+k,matrix[1],matrix[1],0,nodnumbers,bool);
           for i:=1 to N do
             begin
              write(matrix[i]);
             end;
           readkey;
end.