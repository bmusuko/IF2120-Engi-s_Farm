unit F1;

interface
	uses typetubes;
	procedure load (var tDaftarBahan : tabDaftarBahan; var tDaftarResep : tabDaftarResep;
					var tDaftarInventori : tabDaftarInventori; var tStatusPengguna : tabStatusPengguna);
		

implementation
	procedure load (var tDaftarBahan : tabDaftarBahan; var tDaftarResep : tabDaftarResep;
					var tDaftarInventori : tabDaftarInventori; var tStatusPengguna : tabStatusPengguna);
	
	var 
		sisa, i : integer;
		inf			: text;
		namafile	: string;
		space		: string;
	
	begin
		sisa := 4;
		while (sisa > 0) do
		begin
			writeln('> nama file: '); readln(namafile);
			case namafile of 
				'DaftarBahan.txt' : begin
										assign(inf, namafile);
										reset(inf);
										tDaftarBahan.neff := 0;

										if eof(inf) then
										begin
											writeln('> File kosong');
										end else begin
											while not(eof(inf)) do
											begin
												tDaftarBahan.neff := tDaftarBahan.neff + 1;
												
												readln(inf, tDaftarBahan.tab[tDaftarBahan.neff].NamaBahan);
												readln(inf, tDaftarBahan.tab[tDaftarBahan.neff].HargaSatuan);
												readln(inf, tDaftarBahan.tab[tDaftarBahan.neff].DurasiKadaluarsa);
											end;
											writeln('> Berhasil');
										end;
										close(inf);
									end;
				
				'DaftarResep.txt' : begin
										assign(inf, namafile);
										reset(inf);
										tDaftarResep.neff := 0;
										
										if eof(inf) then
										begin
											writeln('> File kosong');
										end else begin
											while not(eof(inf)) do
											begin
												tDaftarResep.neff := tDaftarResep.neff + 1;
												
												readln(inf, tDaftarResep.tab[tDaftarResep.neff].NamaResep);
												readln(inf, tDaftarResep.tab[tDaftarResep.neff].HargaJual);
												readln(inf, tDaftarResep.tab[tDaftarResep.neff].JumlahBahan);
												
												for i := 1 to tDaftarResep.tab[tDaftarResep.neff].JumlahBahan do
												begin
													readln(inf, tDaftarResep.tab[tDaftarResep.neff].Bahan[i]);
												end;									
											end;
											
											writeln('> Berhasil');
										end;
										
										close(inf);
									end;
				
				'DaftarInventori.txt' : begin
											assign(inf, namafile);
											reset(inf);
											tDaftarInventori.neff := 0;
											
											if eof(inf) then
											begin
												writeln('> File kosong');
											end else begin
												while not(eof(inf)) do
												begin
													tDaftarInventori.neff := tDaftarInventori.neff + 1;
													
													readln(inf, tDaftarInventori.tab[tDaftarInventori.neff].NamaBahanAtauOlahan);
													readln(inf, tDaftarInventori.tab[tDaftarInventori.neff].DurasiKadaluarsa);
												
												end;
												
												writeln('> Berhasil');
											end;
											close(inf);
										end;
										
				'StatusPengguna.txt' :	begin
											assign(inf, namafile);
											reset(inf);
											tStatusPengguna.neff := 0;
											
											if eof(inf) then
											begin
												writeln('> File kosong');
											end else begin
												while not (eof(inf)) do
												begin
													tStatusPengguna.neff := tStatusPengguna.neff + 1;
													
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].JumlahEnergi);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].JumlahHariHidup);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].KapasitasMaxInventori);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].JumlahBahanBeli);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].JumlahResepMasak);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].JumlahMakananKadaluarsa);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].TotalPemasukan);
													readln(inf, tStatusPengguna.tab[tStatusPengguna.neff].TotalPengeluaran);
													
												end;
												
												writeln('> Berhasil');
											end;
											close(inf);
										end;
				else					begin
											writeln('> Nama file salah');
										end;
				end;
			end;
		end;
end.
