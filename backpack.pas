program    algoritmgenri;
uses       crt;
const      Packweight=13;
           Stuffquantity=5;
type       arr1=array[0..Stuffquantity,0..Packweight] of integer;
           s=record
           weight,worth:integer;
           end;
           arr2=array[1..Stuffquantity] of s;
function   Max(a,b:integer):integer;
begin
           if (a>=b) then Max:=a
             else Max:=b;
end;
procedure  Fill(var matrix:arr1;stuff:arr2;i,j:integer);
var        a,b,difference:integer;
begin
           difference:=j-Stuff[i].weight;
             if (difference>=0) and (difference<=(i+Stuff[i].weight)) then
                begin
                  b:=Stuff[i].worth + matrix[i-1,difference];
                end
                else b:=0;
           a:=Max(matrix[i-1,j],matrix[i,j-1]);
           matrix[i,j]:=Max(a,b);
           write(matrix[i,j],'/');
             if (j=Packweight) then
               begin
                inc(i);
                j:=0;
                writeln;
               end;
             if (i<>Stuffquantity+1) then Fill(matrix,Stuff,i,j+1);
end;
var        matrix:arr1;
           stuff:arr2;
           i:integer;
begin
           fillchar(matrix,sizeof(matrix),0);
             for i:=1 to Stuffquantity do
               begin
                 writeln('vvedite ves i cennostj veshi');
                 readln(Stuff[i].weight,Stuff[i].worth);
               end;
           Fill(matrix,stuff,1,1);
           writeln('max produktivnostj=',matrix[Stuffquantity,Packweight]);
           readkey;
end.
