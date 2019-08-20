//generator sochetanija
program  combination;
const    N=5;
         k=3;
type     arr=array[1..k] of integer;
var      a:arr;
         i:integer;
function generate():boolean;
var      i,j:integer;
begin
          i:=1;
          while (i<=k) and (a[k-i+1]=n-i+1) do inc(i);    //jesli  na i meste v massive razmera k stoit maksimalnoje chislo
           if (i<=k) then                                 //ot 1..N,to idem na sledusheje levoje chislo
            begin
                 inc(a[k-i+1]);
                 for j:=k-i+2 to k do a[j]:=a[j-1]+1;
                 generate:=true;
              end
                  else generate:=false;   //posledneje samoje bolshoje sochetanije
end;
begin
          for i:=1 to k do
           begin
                a[i]:=i;
                write(a[i]);
            end;
          writeln;
          while generate() do
           begin
                for i:=1 to k do
                  begin
                       write(a[i]);
                   end;
                writeln;
            end;
          readln;
end.
