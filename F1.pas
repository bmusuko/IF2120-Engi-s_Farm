unit F1;

interface

	uses typetubes, sysutils;
	procedure load(var tBahanMentah : tabBahanMentah; var tBahanOlahan : tabBahanOlahan;
					var tInventoriBahanMentah : tabInventoriBahanMentah;
					var tInventoriBahanOlahan : tabInventoriBahanOlahan;
					var tResep : tabResep; var tSimulasi : tabSimulasi);
	//I.S. : Semua data internal(array) masih kosong.
	//F.S. : Semua data dari file telah di load ke data internal(array).

implementation
	procedure load(var tBahanMentah : tabBahanMentah; var tBahanOlahan : tabBahanOlahan;
					var tInventoriBahanMentah : tabInventoriBahanMentah;
					var tInventoriBahanOlahan : tabInventoriBahanOlahan;
					var tResep : tabResep; var tSimulasi : tabSimulasi);
	//Mengimport data dari file eksternal ke data internal

	var
		//Variabel nama lojik file eksternal
		f_mentah : text;
		f_olahan : text;
		f_inventoriMentah : text;
		f_inventoriOlahan : text;
		f_resep : text;
		f_simulasi : text;
		
		data : string; //Untuk membaca string dari file eksternal

		//variabel untuk menampung data yang ingin dimasukan ke array internal
		mentah : bahanMentah;
		olahan : bahanOlahan;
		inventoriMentah : inventoriBahanMentah;
		inventoriOlahan : inventoriBahanOlahan;
		vresep : resep;
		vsimulasi : simulasi;
		
		v2,e: integer; //Variabel khusus untuk menampung pemrosesan tanggal
		v1 : longint; //Variable khusus untuk menampung pemrosesan tanggal
		i,j : integer; // Untuk looping
		date1 : TDateTime; //Untuk nampung tanggal
		yy,mm,dd : word; //Untuk tanggal
		
	begin
		//Membaca file BahanMentah,dat
		assign(f_mentah, 'BahanMentah.dat');
		reset(f_mentah);
		tBahanMentah.neff := 0;
		
		while not(eof(f_mentah)) do
		begin
			//Baca nama bahan mentah
			readln(f_mentah, data);
			mentah.NamaBahanMentah := copy(data,1,pos('|',data)-2);
			delete(data,1,pos('|',data)+1);
			
			//Membaca harga satuan, diubah dari string ke longint
			val(copy(data,1,pos('|',data)-2), v1, e);
			mentah.HargaSatuan := v1;
			delete(data,1,pos('|',data)+1);
			
			//Membaca durasi kadaluarsa, diubah dari string ke integer
			val(data, v2, e);
			mentah.DurasiKadaluarsa := v2;
			
			//Masukan ke data internal 
			tBahanMentah.neff := tBahanMentah.neff + 1;
			tBahanMentah.tab[tBahanMentah.neff] := mentah;
		end;
		close(f_mentah);
		
		//Membaca file BahanOlahan.dat
		assign(f_olahan, 'BahanOlahan.dat');
		reset(f_olahan);
		tBahanOlahan.neff := 0;
		
		while not(eof(f_olahan)) do
		begin
			//Baca nama bahan olahan
			readln(f_olahan, data);
			olahan.NamaBahanOlahan := copy(data,1,pos('|',data)-2);
			delete(data,1,pos('|',data)+1);
			
			//baca harga jual, dari string jadi longint
			val(copy(data,1,pos('|',data)-2), v1, e);
			olahan.HargaJual := v1;
			delete(data,1,pos('|',data)+1);
			
			//baca jumlah bahan, dari string jadi integer
			val(copy(data,1,pos('|',data)-2), v2, e);
			olahan.JumlahBahan := v2;
			delete(data,1,pos('|',data)+1);
			
			//Memasukan bahan - bahan, dipisah jika jumlah bahan 1 atau lebih dari 1
			if (v2 > 1) then 
			begin
				for i := 1 to (v2 - 1) do
				begin
					olahan.Bahan[i] := copy(data,1,pos('|',data)-2);
					delete(data,1,pos('|',data)+1);
				end;
				
				olahan.Bahan[v2] := data;
			end else begin
				olahan.Bahan[1] := data;
			end;
			
			//Masukan ke data internal
			tBahanOlahan.neff := tBahanOlahan.neff + 1;
			tBahanOlahan.tab[tBahanOlahan.neff] := olahan;
		end; 
		close(f_olahan);
		
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
		
		//Membaca file resep
		assign(f_resep, 'DaftarResep.dat');
		reset(f_resep);
		tResep.neff := 0;
		
		while not(eof(f_resep)) do
		begin
			//Baca nama resep
			readln(f_resep, data);
			vresep.NamaResep := copy(data,1,pos('|',data)-2);
			delete(data,1,pos('|',data)+1);
			
			//baca harga jual, dari string jadi longint
			val(copy(data,1,pos('|',data)-2), v1, e);
			vresep.HargaJual := v1;
			delete(data,1,pos('|',data)+1);
			
			//baca jumlah bahan, dari string jadi integer
			val(copy(data,1,pos('|',data)-2), v2, e);
			vresep.JumlahBahan := v2;
			delete(data,1,pos('|',data)+1);
			
			//Memasukan bahan - bahan, dipisah jika jumlah bahan 1 atau lebih dari 1
			if (v2 > 1) then 
			begin
				for i := 1 to (v2 - 1) do
				begin
					vresep.Bahan[i] := copy(data,1,pos('|',data)-2);
					delete(data,1,pos('|',data)+1);
				end;
				
				vresep.Bahan[v2] := data;
			end else begin
				vresep.Bahan[1] := data;
			end;
			
			//Masukan ke data internal
			tResep.neff := tResep.neff + 1;
			tResep.tab[tResep.neff] := vresep;
		end; 
		close(f_resep);
		
		//Membaca file simulasi
		assign(f_simulasi, 'fileSimulasi.dat');
		reset(f_simulasi);
		tSimulasi.neff := 0;
		
		while not(eof(f_simulasi)) do
		begin
			//Membaca nomor simulasi
			readln(f_simulasi,data);
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.NomorSimulasi := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca tanggal
			date1 := StrToDate(copy(data,1,pos('|',data)-2));
			DeCodeDate(date1, yy, mm, dd);
			vsimulasi.Tanggal := date1;
			delete(data,1,pos('|',data) + 1);
			
			//Membaca jumlah hari hidup
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.JumlahHariHidup := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca jumlah energi
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.JumlahEnergi := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca kapasitas maksimum inventori
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.KapasitasMaksimumInventori := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total bahan mentah dibeli
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.TotalBahanMentahDibeli := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total bahan olahan dibuat
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.TotalBahanOlahanDibuat := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total bahan olahan dijual
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.TotalBahanOlahanDijual := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total resep dijual
			val(copy(data,1,pos('|',data)-2), v2, e);
			vsimulasi.TotalResepDijual := v2;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total pemasukan
			val(copy(data,1,pos('|',data)-2), v1, e);
			vsimulasi.TotalPemasukan := v1;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total pengeluaran
			val(copy(data,1,pos('|',data)-2), v1, e);
			vsimulasi.TotalPengeluaran := v1;
			delete(data,1,pos('|',data)+1);
			
			//Membaca total uang
			val(data, v1, e);
			vsimulasi.TotalUang := v1;
		
			//Masukan ke data internal(array)
			tSimulasi.neff := tSimulasi.neff + 1;
			tSimulasi.tab[tSimulasi.neff] := vsimulasi;
		end;
		close(f_simulasi);
		
	end;
end.