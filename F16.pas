unit F16;

interface
	uses typetubes;
	procedure tambahResep(var Rtemp:tabResep; bMentah:tabBahanMentah; bOlahan:tabBahanOlahan);
	//I.S: Rtemp terdefinisi, tidak penuh
	//F.S: elemen Rtemp bertambah satu dan telah divalidasi berdasarkan syarat yang ada

implementation
	procedure tambahResep(var Rtemp:tabResep; bMentah:tabBahanMentah; bOlahan:tabBahanOlahan);
		var
			i,j:integer; //variabel untuk looping
			strtemp:string; //variabel untuk menerima masukan string
			jmlbhn:integer;
			hargabahan:integer; //total harga dari bahan-bahan yang telah diinput
			found:boolean;
			inharga:double;
			harga : longint;
		begin
			hargabahan:=0;
			writeln();
			write('>> Masukkan nama resep: ');
			readln(strtemp);
			write('>> Masukkan jumlah bahan: ');
			readln(jmlbhn);
			while (jmlbhn<2) do
				begin //validasi input jumlah bahan
					writeln();
					writeln('Jumlah bahan minimal adalah 2!');
					write('>> Masukkan jumlah bahan: ');
					readln(jmlbhn);
				end;
			Rtemp.neff:=Rtemp.neff+1;
			Rtemp.tab[Rtemp.neff].NamaResep:=strtemp;
			Rtemp.tab[Rtemp.neff].JumlahBahan:=jmlbhn;
			for i:=1 to jmlbhn do
				begin
					write('>> Masukkan bahan ke-',i,': ');
					readln(strtemp);
					//Pendcarian nama dan harga bahan
					found:=false;
					j:=1;
					while ((j<=bMentah.neff) and (not(found))) do
					begin
						if (bMentah.tab[j].NamaBahanMentah=strtemp) then 
							begin
								found:=true;
								hargabahan:=hargabahan+bMentah.tab[j].HargaSatuan;
							end
						else 
							j:=j+1;
					end;
					j:=1;
					while ((j<=bOlahan.neff) and (not(found))) do
					begin
						if (bOlahan.tab[j].NamaBahanOlahan=strtemp) then 
							begin
								found:=true;
								hargabahan:=hargabahan+bOlahan.tab[j].HargaJual;
							end
						else 
							j:=j+1;
					end;
					//Loop pesan kesalahan, pemasukan input kembali, pencarian nama dan harga bahan
					while (not(found)) do
						begin
							writeln('Bahan yang anda masukkan tidak ditemukan!');
							write('>> Masukkan bahan ke-',i,': ');
							readln(strtemp);
							found:=false;
							j:=1;
							while ((j<=bMentah.neff) and (not(found))) do
							begin
								if (bMentah.tab[j].NamaBahanMentah=strtemp) then 
									begin
										found:=true;
										hargabahan:=hargabahan+bMentah.tab[j].HargaSatuan;
									end
								else 
									j:=j+1;
							end;
							j:=1;
							while ((j<=bOlahan.neff) and (not(found))) do
							begin
								if (bOlahan.tab[j].NamaBahanOlahan=strtemp) then 
									begin
										found:=true;
										hargabahan:=hargabahan+bOlahan.tab[j].HargaJual;
									end
								else 
									j:=j+1;
							end;
						end;

					//Masukkan nama dan jumlah harga ke parameter
					Rtemp.tab[Rtemp.neff].Bahan[i]:=strtemp;
					
				end;

			//Validasi harga jual 
			write('>> Masukkan harga jual: ');
			readln(inharga);
			harga := trunc(inharga) + 1;
			while (harga < (9/8*Real(hargabahan))) do
				begin
					writeln('> Keuntungan minimal 12,5%!');
					write('>> Masukkan harga jual: ');
					readln(inharga);
					harga := trunc(inharga) + 1;
				end;
			Rtemp.tab[Rtemp.neff].HargaJual := harga;
			writeln('Penambahan resep berhasil')
		end;
end.