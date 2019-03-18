unit F3;

interface
	uses typetubes, sysutils;
	procedure startSimulasi(var tInventoriBahanMentah : tabInventoriBahanMentah;
							var tInventoriBahanOlahan : tabInventoriBahanOlahan;
							var tSimulasi : tabSimulasi; var nomor_simulasi : integer;
							var tBahanMentah : tabBahanMentah);
	//I.S. Belum memulai simulasi
	//F.S. Memulai simulasi dengan load inventori bahan mentah dan bahan olahan

implementation
	procedure startSimulasi(var tInventoriBahanMentah : tabInventoriBahanMentah;
								var tInventoriBahanOlahan : tabInventoriBahanOlahan;
								var tSimulasi : tabSimulasi; var nomor_simulasi : integer;
								var tBahanMentah : tabBahanMentah);
	var 
	
	f_inventoriMentah : text;
	f_inventoriOlahan : text;

	inventoriMentah : inventoriBahanMentah;
	inventoriOlahan : inventoriBahanOlahan;

	v2, e : integer;
	v1 : longint;
	data : string;
	i,j : integer;
	found : boolean;

	date1 : TDateTime;
	yy, mm, dd : word;
	begin
		//Load lagi inventoriBahanMentah karena data internal udah diacak- acak
		//di simulasi sebelumnya
		//Membaca file InventoriBahanMentah.dat	
		assign(f_inventoriMentah, 'InventoriBahanMentah.dat');
		reset(f_inventoriMentah);
		tInventoriBahanMentah.neff := 0;
		
		while not(eof(f_inventoriMentah)) do
		begin
			//Membaca nama bahan mentah
			readln(f_inventoriMentah, data);
			inventoriMentah.NamaBahanMentah := copy(data,1,pos('|',data)-2);
			delete(data,1,pos('|',data)+1);
			
			//Membaca tanggal beli
			date1 := StrToDate(copy(data,1,pos('|',data)-2));
			DeCodeDate(date1, yy, mm, dd);
			inventoriMentah.TanggalBeli := date1;
			delete(data,1,pos('|', data) + 1);
			
			//Membaca jumlah
			val(data, v1, e);
			inventoriMentah.Jumlah := v1;

			//Masukan ke data internal (array)
			tInventoriBahanMentah.neff := tInventoriBahanMentah.neff + 1;
			tInventoriBahanMentah.tab[tInventoriBahanMentah.neff] := inventoriMentah;
		end;
		close(f_inventoriMentah);

		//Membaca file inventori bahan olahan
		assign(f_inventoriOlahan, 'InventoriBahanOlahan.dat');
		reset(f_inventoriOlahan);
		tInventoriBahanOlahan.neff := 0;
		
		while not(eof(f_inventoriOlahan)) do
		begin
			////Membaca nama bahan olahan
			readln(f_inventoriOlahan, data);
			inventoriOlahan.NamaBahanOlahan := copy(data,1,pos('|',data)-2);
			delete(data,1,pos('|',data)+1);
			
			//Membaca tanggal buat
			date1 := StrToDate(copy(data,1,pos('|',data)-2));
			DeCodeDate(date1, yy, mm, dd);
			inventoriOlahan.TanggalBuat := date1;
			delete(data,1,pos('|', data) + 1);
			
			//Membaca jumlah
			val(data, v1, e);
			inventoriOlahan.Jumlah := v1;
			
			//Masukan ke data internal (array)
			tInventoriBahanOlahan.neff := tInventoriBahanOlahan.neff + 1;
			tInventoriBahanOlahan.tab[tInventoriBahanOlahan.neff] := inventoriOlahan;
		end;
		close(f_inventoriOlahan);

		tSimulasi.tab[nomor_simulasi].JumlahIstirahat := 0;
		tSimulasi.tab[nomor_simulasi].JumlahMakan := 0;
		tSimulasi.tab[nomor_simulasi].JumlahAksi := 0;
		tSimulasi.tab[nomor_simulasi].TanggalHariIni := tSimulasi.tab[nomor_simulasi].Tanggal + tSimulasi.tab[nomor_simulasi].JumlahHariHidup;
	end;
end.
	

