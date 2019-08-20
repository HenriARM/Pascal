program zmejkaljudojedka;
uses crt;
var ch:string;
{type x=array[0..windmaxx] of integer;
type y=array[0..windmaxy] of integer;
windmaxx - переменная. нельзя использовать для указания границ массива}
	x:array[0..80] of integer;
	y:array[0..25] of integer;
{var} a,b,l,i:integer;

 //l-length
 //x,y-koordinati zmejki
 begin // должно быть тут
TextBackground(1);
TextColor(2);
CursorOff;

//begin

writeln('Genrih krasavchik,mamoj kljanusj');
writeln('Luchshe s bratanami na velike,chem s chertjami na gelike');
writeln('Brat za brata za osnovu vzjato');
writeln('Pravij koronnij ,levij pohoronnij');
clrscr;
l:=4;

                              //risujem ramochku
for i:=2 to windmaxx-1 do
 begin
 gotoxy(i,1);
 write(#205);
 gotoxy(i,windmaxy);
 write(#205);
 end;

for i:=2 to windmaxy-1 do
 begin
 gotoxy(1,i);
 write(#186);
 gotoxy(windmaxx,i);
 write(#186);
 end;

 gotoxy(1,1);
 write(#201);
 gotoxy(windmaxx,1);
 write(#184);
 gotoxy(1,windmaxy);
 write(#200);
 //а это лучше не делать, чтобы не съехать вниз
 {gotoxy(windmaxx,windmaxy);
 write(#188);}
                    //sjedobnoje jablochkoo(zapomnim koordinati jabloka s (a=x) i (b=y)
  randomize;
  a:=2+random(windmaxx-2); //ne mozhem jabloko
  b:=2+random(windmaxy-21); //pomestitj v ramkah
  gotoxy(a,b);
  writeln('0');
  
                    //narisovali nachalnuju zmejku
  gotoxy(windmaxx div 2,windmaxy div 2);
  writeln('-');
  writeln('-');
  writeln('-');
  writeln('*');
                   //nachalnije koordinati
for i:=1 to l do
  begin
  x[i]:=(windmaxy div 2)+i-1;
  y[i]:=windmaxy div 2;
  end;

                  
while 1=1 do
 begin
 

 ch:=readkey;//raspisivajem rabotu klavish(smotretj na nizhnij kommentarij)
 //Стираем старую змейку!
  for  i:=1 to l do
   begin 
     gotoxy(x[i],y[i]);
     write(' ');
   end;
   
   if (ch='w') and (((x[l]=x[l-1]) and (y[l]<y[l-1])) or (x[l-1]<>x[l])) then
   begin
	  // Ходить вверх можно, описываем перемещение
	  //есть ли яблочко?
	  if (x[l]=a) and (y[l]-1=b) then 
	  begin
		// добавляем новый элемент ничего недвигая
		inc(l);
		x[l]:=a;
		y[l]:=b;
	  end
	  else
	  begin
		// яблочка нет - двигаем змейку
		for i:=1 to l-1 do
		begin 
			x[i]:=x[i+1];
			y[i]:=y[i+1];
		end;
		//змейка проехала. двигаем голову
		x[l]:=x[l-1];
		y[l]:=y[l-1]-1;
	  end;
   end;

	
   if (ch='s')  and (((x[l]=x[l-1]) and (y[l]>y[l-1])) or (x[l-1]<>x[l])) then
     begin
	  if (x[l]=a) and (y[l]=b) then
	   begin
	     inc(l);
	     y[l]:=b+1;
	     x[l]:=a;
	   end
	  else
	   begin
	     y[l]:=y[l]+1;
	     for i:=1 to l-1 do
	      begin 
            x[i]:=x[i+1];
            y[i]:=y[i+1];
         end;
	 end;
	end; 
	
   if (ch='a')  and (((y[l]=y[l-1]) and (x[l]<x[l-1])) or (y[l-1]<>y[l]))      then
     begin
	  if (x[l]=a) and (y[l]=b) then
       begin
         inc(l);
         x[l]:=a-1;
         y[l]:=b;
	   end
	  else
	   begin
	     x[l]:=x[l]-1;
         for i:=1 to l-1 do
	      begin 
           x[i]:=x[i+1];
           y[i]:=y[i+1];
          end;
	   end;
	end;
	
   if (ch='d') and (((y[l]=y[l-1]) and (x[l]>x[l-1])) or (y[l-1]<>y[l])) then
	 begin
	  if (x[l]=a) and (y[l]=b) then
	   begin
	     inc(l);
	     x[l]:=a+1;
	     y[l]:=b;
	   end
      else
	   begin
	     x[l]:=x[l]+1;
	     for i:=1 to l-1 do
	      begin 
           x[i]:=x[i+1];
           y[i]:=y[i+1];
          end;
       end;
	end;

 //raspisivajem gde sejchas dolzhna zmejka nahoditsa		i jabloko	 
  for  i:=1 to l-1 do
   begin 
     gotoxy(x[i],y[i]);
     write('-');
   end;
 gotoxy(x[l],y[l]);
 write('*');
  

    

//v kakij sluchajah zmej ljudojed umret???

for i:=1 to l-1 do 
 begin 
   if ((x[l]=x[i]) and (y[l]=y[i])) or (x[l]=1) or (x[l]=windmaxx) or (y[l]=1) or (y[l]=windmaxy){не забываем про y. лучше одним if-ом все} then
     begin
       clrscr;
	   writeln('gameover,bitch');
     end;
 end;
 
end;
   
   end.

	

















