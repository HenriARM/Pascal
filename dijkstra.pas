program   dijkstra;
uses      crt;
const     N=6;
type      arr=array[1..N,1..N] of integer;   //matrix of adjacencies
          wht=array[1..N] of integer;     //distance till [i] root
          iin=array[1..N] of boolean;     //have we been in this root
var       a:arr;
          weight:wht;
          isitnew:iin;
          i,j:integer;
function  minfinder(var weight:wht):integer;
var       i,min,tmp:integer;
begin
          min:=high(integer);
          for i:=1 to N do begin
           if (isitnew[i]) and (weight[i]<min) then begin
            min:=weight[i];
            tmp:=i;
            end;
          end;
          minfinder:=tmp;
end;
procedure solve(var a:arr;var weight:wht;var isitnew:iin;v:integer);
var       i,distance,nextroot:integer;
begin
          isitnew[v]:=false;
          for i:=1 to N do begin
          distance:=weight[v]+a[v,i];
           if (distance<weight[i]) and (a[v,i]<>0) then begin
            weight[i]:=distance;
           end;
          end;
          nextroot:=minfinder(weight);
          if (nextroot<=N) then solve(a,weight,isitnew,nextroot);
end;
begin
          fillchar(isitnew,sizeof(isitnew),True);
          fillchar(a,sizeof(a),0);

          a[1,3]:=1;  a[3,1]:=1;
          a[1,2]:=2;  a[2,1]:=2;
          a[1,4]:=4;  a[4,1]:=4;
          a[2,5]:=3;  a[5,2]:=3;
          a[3,5]:=10; a[5,3]:=10;
          a[2,4]:=7;  a[4,2]:=7;
          a[3,4]:=5;  a[4,3]:=5;
          a[3,6]:=4;  a[6,3]:=4;
          a[5,6]:=4;  a[6,5]:=4;
          a[4,6]:=5;  a[6,4]:=5;

          weight[1]:=0;
          for i:=2 to N do weight[i]:=high(integer);
          solve(a,weight,isitnew,1);
          writeln('distance to root N=',weight[N]);
          readkey;
end.
