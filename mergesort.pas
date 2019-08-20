program    mergesort;
const      N=10;
type       arr=array[1..N] of integer;
var        matrix,res:arr;
           i:integer;
procedure  merge(l,mid,r:integer);
var        i,j,k:integer;
begin
           i:=l;
           j:=mid+1;
           k:=l; //counter for 2-nd array
           while (i<=mid) and (j<=r) do
             begin
              if (matrix[i]<=matrix[j]) then
                begin
                 res[k]:=matrix[i];
                 inc(i);
                end
                 else
                   begin
                    res[k]:=matrix[j];
                    inc(j);
                   end;
              inc(k);
             end;
           while (i<=mid) do
            begin
             res[k]:=matrix[i];
             inc(k);inc(i);
            end;
           while (j<=r) do
            begin
             res[k]:=matrix[j];
             inc(k);inc(j);
            end;
           for i:=l to  r do matrix[i]:=res[i];
end;
procedure  solve(left,right:integer);
var        middle:integer;
begin
           if (left<right) then
            begin
              middle:=(left+right) div 2;
              solve(left,middle);
              solve(middle+1,right);
              merge(left,middle,right);
            end;
end;

begin
           fillchar(matrix,sizeof(matrix),0);
           fillchar(res,sizeof(res),0);
           for i:=1 to N do matrix[i]:=i;
           solve(1,N);
           for i:=1 to N do writeln(matrix[i]);
           readln;
end.
