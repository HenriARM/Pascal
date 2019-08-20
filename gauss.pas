program gaus;
uses    crt,math;
const   N=5;   //line
        M=6;   //column
type    t=array[1..M-1] of extended;
var     a:array[1..N,1..M]  of extended;
        answer,b:t;
        i,j,i0,j0,currentline,currentcolumn,xx:integer;
        maxvalue,memory,ratio,sum:extended;
begin
        writeln('vvedite koefficenti');

       for i:=1 to N do
         begin
            for j:=1 to M do
             begin
               readln(a[i,j]);
             end;
          end;

        for j:=1 to M-1 do
          begin
             b[j]:=j;
          end;

        currentline:=0;
        currentcolumn:=0;
        while (currentline+1<>N) do
          begin
            inc(currentline);inc(currentcolumn);
             maxvalue:=a[currentline,currentcolumn];
             for i:=currentline to N do
                begin
                  for j:=currentcolumn to M-1  do
                    begin
                         if (abs(a[i,j])>abs(maxvalue)) then
		           begin
		       	    maxvalue:=abs(a[i,j]);
		            i0:=i;j0:=j;
                           end;
		    end;
                end;

             for j:=currentcolumn to M do
                 begin
		   memory:=a[currentline,j];
                   a[currentline,j]:=a[i0,j];
		   a[i0,j]:=memory;
                 end;


             for  i:=currentline   to N do
                begin
                   memory:=a[i,currentcolumn];
                   a[i,currentcolumn]:=a[i,j0];
                   a[i,j0]:=memory;
                end;

             memory:=b[currentcolumn];
             b[currentcolumn]:=b[j0];
             b[j0]:=memory;


             for i:=currentline+1 to N do
               begin
                  xx:=currentcolumn;
                  ratio:=-a[currentline,currentcolumn]/a[i,currentcolumn];
                    for j:=currentcolumn to M  do
                       begin
                          a[i,j]:=a[currentline,xx]+(a[i,j]*ratio);
                          inc(xx);
                       end;
                end;
         end;//while

         readkey;

         i0:=N;
         for j:=M-1 downto 1 do
           begin
             j0:=j;
             sum:=0;
              while (j0<>M-1) do
                begin
                   inc(j0);
                   sum:=sum+answer[j0]*a[i0,j0];
                 end;
             answer[j]:=(a[i0,M]-sum)/a[i0,j];
	     dec(i0);
            end;

           for i:=1 to M-1 do
	     begin
                i0:=round(b[i]);
	        memory:=answer[i0];
                answer[i0]:=answer[i];
                answer[i]:=memory;
                memory:=b[i0];
                b[i0]:=i0;
                b[i]:=memory;
             end;

            writeln;
            writeln('porjadok');
            for i:=1 to M-1 do
               begin
                 write(round(b[i]));
               end;

            writeln;
	    writeln('answer');
            for i:=1 to M-1 do
	      begin
                write('|',round(answer[i]));
              end;

 readkey;
end.
