program bricks;
uses graph,wincrt,math;
const N=10;
type li=record
     x1,x2,y1,y2,difx,dify:integer;
     t:real;
     end;
     p=record
     x,y:integer;
     end;
     poin=record
     x,y:real;
     end;
     tm=record
     crossx,crossy:integer;
     end;
var  lines:array[1..N] of li;
     gd,gm,i,randomtime,i0:integer;     //min-min t
     min,dx,dy,distance,a,interval:real;
     sym:p;
     point1,point2:poin;
     parallel:li;
     tmin:tm;           //linija s naimenshim t
begin
 initgraph(gd,gm,'');
 randomtime:=0;
 randomize;
 setcolor(2);
 lines[1].x1:=1;lines[1].x2:=getmaxx-1;lines[1].y1:=1; lines[1].y2:=1;
 lines[2].x1:=getmaxx-1;lines[2].x2:=getmaxx-1;lines[2].y1:=1; lines[2].y2:=getmaxy-1;
 lines[3].x1:=1; lines[3].x2:=getmaxx-1;lines[3].y1:=getmaxy-1; lines[3].y2:=getmaxy-1;
 lines[4].x1:=1;lines[4].x2:=1;lines[4].y1:=1; lines[4].y2:=getmaxy-1;
  for i:=1 to N do
    begin
     if (i>4) then
       begin
         lines[i].x1:=random(getmaxx-1)+1; lines[i].x2:=random(getmaxx-1)+1;
         lines[i].y1:=random(getmaxy-1)+1; lines[i].y2:=random(getmaxy-1)+1;
       end;
         lines[i].difx:=lines[i].x2-lines[i].x1;
         lines[i].dify:=lines[i].y2-lines[i].y1;
     if (i<>N) then line(lines[i].x1,lines[i].y1,lines[i].x2,lines[i].y2);
    end;
     dx:=lines[N].difx/20;
     dy:=(dx/lines[N].difx)*lines[N].dify ;
     putpixel(lines[N].x1,lines[N].y1,3);
   while (1=1) do
     begin
       min:=1E+10;
       if(randomtime>0) then
	   begin
	   lines[N].x2:=lines[N].x1;lines[N].y2:=lines[N].y1;
       end;
	   point1.x:=lines[N].x1; point1.y:=lines[N].y1; point2.x:=lines[N].x2; point2.y:=lines[N].y2;
        while( (lines[N].x2>0) and (lines[N].x2<getmaxx) and (lines[N].y2>0) and (lines[N].y2<getmaxy) ) do
          begin
            point2.x:=point2.x+dx;  lines[N].x2:=round(point2.x);
            point2.y:=point2.y+dy;  lines[N].y2:=round(point2.y);
          end;
	 setcolor(4);
         line(lines[N].x1,lines[N].y1,lines[N].x2,lines[N].y2);
         lines[N].difx:=lines[N].x2-lines[N].x1;
         lines[N].dify:=lines[N].y2-lines[N].y1;
        if (randomtime=0) then
         begin
         dx:=lines[N].difx/40;
         dy:=(dx/lines[N].difx)*lines[N].dify ;
         end;
		 for i:=1 to N-1 do
          begin
            lines[N].t:=((lines[i].x1-lines[N].x1)*lines[i].dify-(( lines[i].y1-lines[N].y1)*lines[i].difx)) / ((lines[N].difx*lines[i].dify)-(lines[N].dify*lines[i].difx));
            lines[i].t:=((lines[i].x1-lines[N].x1)*lines[N].dify-((lines[i].y1-lines[N].y1)*lines[N].difx)) / ((lines[N].difx*lines[i].dify)-(lines[N].dify*lines[i].difx));
            if ((lines[N].t<min) and (lines[N].t>0.09) and (lines[i].t>0) and (lines[i].t<1)) then
              begin
                min:=lines[N].t;
                i0:=i;
              end;
        end;//for
     tmin.crossx:= round(lines[N].x1+(min*lines[N].difx));
     tmin.crossy:= round(lines[N].y1+(min*lines[N].dify));
     circle(tmin.crossx,tmin.crossy,5);
     interval:=sqrt(sqr(getmaxx)+sqr(getmaxy));
	 a:=sqrt(sqr(dx+1)+sqr(dy+1));
       while (interval>a) do
          begin
            putpixel(lines[N].x1,lines[N].y1,13);
            point1.x:=point1.x+dx;lines[N].x1:=round(point1.x);
            point1.y:=point1.y+dy;lines[N].y1:=round(point1.y);
            interval:=sqrt( sqr(tmin.crossx-lines[N].x1)+sqr(tmin.crossy-lines[N].y1));
            delay(50);
           end;
        setcolor(random(15)+1);
        circle(20,20,10);
	lines[N].x1:=tmin.crossx;
	lines[N].y1:=tmin.crossy;
        parallel.x1:=round(tmin.crossx+dx);
        parallel.y1:=round(tmin.crossy+dy);
        putpixel(parallel.x1,parallel.y1,3);
        parallel.t:=(lines[i0].difx*(parallel.x1-lines[i0].x1)+lines[i0].dify*(parallel.y1-lines[i0].y1))/(sqr(lines[i0].difx)+sqr(lines[i0].dify));
        sym.x:=round(lines[i0].x1+(parallel.t*lines[i0].difx)); //tochka simmetrii na linii
        sym.y:=round(lines[i0].y1+(parallel.t*lines[i0].dify));
        putpixel(sym.x,sym.y,3);
        parallel.x2:=2*sym.x-parallel.x1;        //simmetrichnaja tochka
        parallel.y2:=2*sym.y-parallel.y1;
        putpixel(parallel.x2,parallel.y2,3);
        dx:=parallel.x2-lines[N].x1;
        dy:=parallel.y2-lines[N].y1;
        inc(randomtime);
        readkey;
        end;//while
 closegraph;
end.
