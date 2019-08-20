program    rasstojanijelevinshteina;
uses       crt;
const      N=4;
           M=4;
type       arr=array[0..N,0..M] of integer;
function   Min(a,b,c:integer):integer;
begin
           if (a<=b) and (a<=c) then Min:=a
            else if (b<=a) and (b<=c) then Min:=b
              else Min:=c;
end;
procedure  FindAnswer(var matrix:arr;i,j:integer;wordN,wordM:string);
begin
           if (wordN[i]=wordM[j]) then matrix[i,j]:=Min(Matrix[i-1,j]+1,Matrix[i,j-1]+1,Matrix[i-1,j-1])
            else matrix[i,j]:=Min(Matrix[i-1,j]+1,Matrix[i,j-1]+1,Matrix[i-1,j-1]+1);
           if (j=M) then
            begin
             j:=0;
             inc(i);
            end;
           if (i<N+1) then FindAnswer(matrix,i,j+1,wordN,wordM);
end;
var        wordN,wordM:string;
           matrix:arr;
           i,j:integer;
begin
           writeln('vvedite 2 slova');
           readln(wordN);readln(wordM);
           Fillchar(matrix,sizeof(matrix),0);
           if (wordN[1]=wordM[1]) then matrix[0,0]:=0
            else matrix[0,0]:=1;
           For i:=1 to M do
              begin
               matrix[0,i]:=matrix[0,i-1]+1;
              end;
            For i:=1 to N do
              begin
               matrix[i,0]:=matrix[i-1,0]+1;
              end;
            writeln;
            FindAnswer(matrix,1,1,wordN,wordM);
            For i:=0 to N do
              begin
               For j:=0 to M do
                 begin
                   write(matrix[i,j],'/');
                 end;writeln;
              end;

            writeln('kollichestvo dejstvij=',matrix[N,M]);
            readkey;
end.
