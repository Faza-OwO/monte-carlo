program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  crt;

var
    x,i,a,b,frehasil:Integer;
    y:Real;
    laptop:array of Integer;
    fre:array of Integer;
    prob:array of Real;
    kumprob:array of Real;
    bawah:array of Real;
    atas:array of Real;
begin
  { TODO -oUser -cConsole Main : Insert code here }
  Writeln('Faza M Raihan 152017067');
  Writeln;
  frehasil:= 0;
  y:= 0;
  Writeln('masukan jumlah data Maksimal 5') ;
  Readln(x);
  SetLength(laptop, x);
  SetLength(fre, x);
  SetLength(prob, x);
  SetLength(kumprob, x);
  SetLength(bawah, x);
  SetLength(atas, x);

  //memasukan data
  for i:=1 to x do begin
    Writeln('Masukan data laptop minggu ke '+ inttostr(i));
    readln(a);
    Writeln('Masukan data frekuensi minggu ke '+ inttostr(i));
    readln(b);
    laptop[i]:= a;
    fre[i]:= b;
    frehasil:= frehasil + fre[i];
  end;
  // menampilkan data
  Writeln('Data yang sudah terkumpul');
  for i:=1 to x do begin
    write('permintaan laptop minggu ke '+inttostr(i)+' = ');
    write(laptop[i]);
    write(' ');
    write('Frekuensi minggu ke '+inttostr(i)+' = ');
    write(fre[i]);
    Writeln;
  end;
  Writeln;
  Writeln('Jumlah Frekuensi = '+inttostr(frehasil));
   //data probabilitas
  Writeln('Data Probabilitas');
  for i:=1 to x do begin
     prob[i]:= fre[i]/frehasil;
     Writeln(prob[i]:4:2);
  end;
  //data kumlatif probabilitas
  Writeln('Data Kumulatif Probabilitas');
  kumprob[1]:= prob[1];
  for i:=2 to x do begin
     kumprob[i]:= kumprob[i-1]+prob[i];

  end;
  for i:=1 to x do begin
     Writeln(kumprob[i]:4:2);
  end;
    bawah[1]:= 0;
    atas[1]:= kumprob[1];
    bawah[2]:= kumprob[1]+0.01;
    while kumprob[2] >= y do begin
      y:= y+0.01;
      atas[2]:= y;
    end;
    bawah[3]:= atas[2]+0.01;
    while kumprob[3] >= y  do begin
      y:= y+0.01;
      atas[3]:= y;
    end;
    bawah[4]:= atas[3]+0.01;
    while kumprob[4] >= y do begin
      y:= y+0.01;
      atas[4]:= y;
    end;
    bawah[5]:= atas[4]+0.01;
    atas[5]:= 1;
    for i:=1 to x do begin
    write('Interval Bawah '+inttostr(i)+' = ');
    write(bawah[i]:4:2);
    write(' ');
    write('Interval Atas '+inttostr(i)+' = ');
    write(atas[i]:4:2);
    Writeln;
  end;

  readkey;
end.
 