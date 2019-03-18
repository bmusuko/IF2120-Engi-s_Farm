unit F2;

interface 
	uses typetubes, sysutils;
	procedure exit(var tInventoriBahanMentah : tabInventoriBahanMentah;
					var tInventoriBahanOlahan : tabInventoriBahanOlahan;
					var tResep : tabResep; var tSimulasi : tabSimulasi);
					
	//I.S. : Semua data telah tercatat di data internal(array).
	//F.S. : Keluar dari program dan semua data dari data internal ditulis di 
	//		 file eksternal

implementation
	procedure exit(var tInventoriBahanMentah : tabInventoriBahanMentah;
					var tInventoriBahanOlahan : tabInventoriBahanOlahan;
					var tResep : tabResep; var tSimulasi : tabSimulasi);
	//Menuliskan semua data yang telah tercatat dalam data internal ke file eksternal
					
	var
		inf : text;
		s : string; //Untuk nampung string dari Str : Int -> string
		i,j : integer; //variable untuk iterasi

	begin
		//Menulis ke file eksternal inventori Bahan Mentah
		assign(inf, 'InventoriBahanMentah.dat');
		rewrite(inf);
		for i := 1 to tInventoriBahanMentah.neff do
		begin
			write(inf, tInventoriBahanMentah.tab[i].NamaBahanMentah);
			write(inf, ' | ');
			
			s := DateToStr(tInventoriBahanMentah.tab[i].TanggalBeli);
			write(inf, s);
			write(inf, ' | ');

			Str(tInventoriBahanMentah.tab[i].Jumlah, s);
			writeln(inf, s);
		end;
		close(inf);

		//Mengisi ke file eksternal inventori Bahan Olahan
		assign(inf,'InventoriBahanOlahan.dat');
		rewrite(inf);
		for i := 1 to tInventoriBahanOlahan.neff do
		begin
			write(inf, tInventoriBahanOlahan.tab[i].NamaBahanOlahan);
			write(inf, ' | ');

			s := DateToStr(tInventoriBahanOlahan.tab[i].TanggalBuat);
			write(inf, s);
			write(inf, ' | ');

			Str(tInventoriBahanOlahan.tab[i].Jumlah, s);
			writeln(inf, s);
		end;
		close(inf);

		//Mengisi file eksternal file daftar resep
		assign(inf, 'DaftarResep.dat');
		rewrite(inf);
		for i := 1 to tResep.neff do
		begin
			write(inf, tResep.tab[i].NamaResep);
			write(inf, ' | ');

			Str(tResep.tab[i].HargaJual, s);
			write(inf, s);
			write(inf, ' | ');

			Str(tResep.tab[i].JumlahBahan, s);
			write(inf, s);

			//Menulis daftar bahan yang dibutuhkan untuk tiap resep
			for j := 1 to (tResep.tab[i].JumlahBahan - 1) do
			begin
				write(inf, ' | ');
				write(inf, tResep.tab[i].Bahan[j]);
			end;

			write(inf, ' | ');
			writeln(inf, tResep.tab[i].Bahan[tResep.tab[i].JumlahBahan]);
		end;
		close(inf);
		writeln();
		writeln('-----------------------------------------------------');
		writeln('> Keluar dari program...');
		writeln('-----------------------------------------------------');
	end;
end.






















