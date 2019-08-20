program mnogougolnik;
uses graph,wincrt;
const N=400;
type l=record
     x1,y1,x2,y2,dx,dy:integer;
     t:real;
     end;
     p=record
     x,y:integer;
     end;
var gd,gm,i,j,a,b:integer;
    lines:array[1..N] of l;
    point:array[1..N] of p;
    swap:l;
begin
randomize;
initgraph(gd,gm,'');
  for i:=1 to N do
   begin
    point[i].x:=random(getmaxx-1)+1;point[i].y:=random(getmaxy-1)+1;
   end;
  for i:=1 to N do
   begin
   setcolor(random(15)+1);
   lines[i].x1:=point[i].x;  lines[i].y1:=point[i].y;
     if (i=N) then
       begin
         lines[i].x2:=point[1].x; lines[i].y2:=point[1].y;
        end
      else
       begin
        lines[i].x2:=point[i+1].x; lines[i].y2:=point[i+1].y;
       end;
    lines[i].dx:=lines[i].x2-lines[i].x1;
    lines[i].dy:=lines[i].y2-lines[i].y1;
    line(lines[i].x1,lines[i].y1,lines[i].x2,lines[i].y2);
   end;
  while (true) do begin
   for i:=1 to N do
    begin
      for j:=i+1 to N do
        begin
        if ((j-i>1) or ((i<>1) and (j<>N)) or ((i<>N) and (j<>1)) ) then  begin
           lines[j].t:=((lines[i].x1-lines[j].x1)*lines[i].dy-((lines[i].y1-lines[j].y1)*lines[i].dx)) / ((lines[j].dx*lines[i].dy)-(lines[j].dy*lines[i].dx));
           lines[i].t:=((lines[i].x1-lines[j].x1)*lines[j].dy-((lines[i].y1-lines[j].y1)*lines[j].dx)) / ((lines[j].dx*lines[i].dy)-(lines[j].dy*lines[i].dx));
             if ((lines[i].t>0) and (lines[i].t<1) and (lines[j].t>0) and (lines[j].t<1) ) then
              begin
                setcolor(0);
                line(lines[i].x1,lines[i].y1,lines[i].x2,lines[i].y2);
                line(lines[j].x1,lines[j].y1,lines[j].x2,lines[j].y2);
             //   readkey;
                swap.x1:=lines[i].x2;
                swap.y1:=lines[i].y2;
                lines[i].x2:=lines[j].x1;
                lines[i].y2:=lines[j].y1;
                lines[j].x1:=swap.x1;
                lines[j].y1:=swap.y1;
                lines[i].dx:=lines[i].x2-lines[i].x1;
                lines[i].dy:=lines[i].y2-lines[i].y1;
                lines[j].dx:=lines[j].x2-lines[j].x1;
                lines[j].dy:=lines[j].y2-lines[j].y1;
                setcolor(random(14)+1);
                line(lines[i].x1,lines[i].y1,lines[i].x2,lines[i].y2);
                line(lines[j].x1,lines[j].y1,lines[j].x2,lines[j].y2);
                a:=i;
                b:=j;
                  while (a<b-1) do
                   begin
                     inc(a);dec(b);
                     swap.x1:=lines[a].x2;    swap.y1:=lines[a].y2;
                     swap.x2:=lines[a].x1;    swap.y2:=lines[a].y1;
                     swap.dx:=-lines[a].dx;   swap.dy:=-lines[a].dy;

                     lines[a].x1:=lines[b].x2;   lines[a].y1:=lines[b].y2;
                     lines[a].x2:=lines[b].x1;   lines[a].y2:=lines[b].y1;
                     lines[a].dx:=-lines[b].dx;  lines[a].dy:=-lines[b].dy;

                     lines[b].x1:=swap.x1;       lines[b].y1:=swap.y1;
                     lines[b].x2:=swap.x2;       lines[b].y2:=swap.y2;
                     lines[b].dx:=swap.dx;       lines[b].dy:=swap.dy;
                   end;
                readkey;
              end;//if
              end;
           end;
        end;
       end;//while
closegraph;
end.
