//poisk v shirinu,zahodim snachala vo vse ne zajdennije vershini s kotorimi u nas jestj rebra
program    bfs;
const      N=5;
var        matrix:array[1..N,1..N] of integer;
           bool:array[1..N] of boolean;
procedure  breadthsearch(graph:integer);
var        recorded:array[1..N] of integer;  //sjuda zapisivajem vse vershini,
           countread,countwrite,i:integer;     //kotorije imejut rebro s nashim i poka ne prosmotrennije

begin
           fillchar(recorded,sizeof(recorded),0);
           countwrite:=0;countread:=1;
           recorded[countread]:=graph;
           bool[graph]:=false;
           while (countwrite<countread) do
             begin
                   inc(countwrite);graph:=recorded[countwrite];
                   writeln(' ',graph);
                   for i:=1 to N do
                     begin
                          if (matrix[graph,i]<>0) and (bool[i]) then
                            begin
                                  inc(countread);
                                  recorded[countread]:=i;
                                  bool[i]:=False;
                              end;
                       end;
               end;
end;
begin
           fillchar(matrix,sizeof(matrix),0);
           fillchar(bool,sizeof(bool),true);
           matrix[1,2]:=1;
           matrix[1,3]:=1;
           matrix[2,4]:=1;
           matrix[3,5]:=1;
           breadthsearch(1);
           readln;
end.