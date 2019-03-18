unit F15;

interface
	uses typetubes;
	procedure cariResep(Rtemp: tabResep);
	//I.S.: nResep atau nama resep yang ingin dicari serta Rtemp atau tabresep terdefinisi
	//F.S.: seluruh informasi dari resep dengan nama nResep ditampilkan ke layar apabila terdapat dalam Rtemp

implementation
	procedure cariResep(Rtemp: tabResep);
		var
			i,j:integer; //variabel untuk looping
			found:boolean; //variabel untuk looping
			namaResep : string;
		begin
			writeln();
			writeln('> Nama resep yang ingin dicari : ');
			write('>> '); readln(namaResep);

			found:=false;
			i:=1;
			while ((i<=Rtemp.neff) and (not(found))) do
				begin
					if (Rtemp.tab[i].NamaResep = namaResep) then 
						found:=true
					else 
						i:=i+1;
				end;
			if (found=true) then
				begin	
					writeln(); 
					writeln('Nama resep: ',Rtemp.tab[i].NamaResep);
					writeln('Harga jual: ',Rtemp.tab[i].HargaJual);
					writeln('Jumlah bahan: ',Rtemp.tab[i].JumlahBahan);
					writeln('Bahan yang diperlukan: ');
					for j:=1 to Rtemp.tab[i].JumlahBahan do
						begin
							writeln('-',Rtemp.tab[i].Bahan[j]);
						end;
				end
			else
				writeln('Resep tidak ditemukan!');
		end;	
end.