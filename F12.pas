// Nama 	: Bram Musuko P
// Tanggal	: 13 - April - 2018

unit F12;

interface

	uses typetubes, sysutils;
	procedure lihatStatistik(var tStatistik : tabSimulasi; s : integer);
	//I.S : Simulasi Telah Terdefinisi
	//F.S : Menampilkan Isi dari Simulasi ke layar
	
implementation
	
	procedure lihatStatistik(var tStatistik : tabSimulasi; s : integer);
	var
		t1,t2 : string;
	begin
		writeln();
		writeln ('Nomor simulasi 				: ',tStatistik.tab[s].NomorSimulasi);
		t1 := DateToStr(tStatistik.tab[s].Tanggal);
		writeln ('Tanggal 				: ', t1);
		t2 := DateToStr(tStatistik.tab[s].TanggalHariIni);
		writeln('Tanggal Hari ini 			: ', t2);
		writeln ('Jumlah Hari Hidup 			: ',tStatistik.tab[s].JumlahHariHidup);
		writeln ('Jumlah Energi 				: ', tStatistik.tab[s].JumlahEnergi);
		writeln ('Kapasitas Maksimum Inventori 		: ',tStatistik.tab[s].KapasitasMaksimumInventori);
		writeln ('Total Bahan Mentah Dibeli 		: ', tStatistik.tab[s].TotalBahanMentahDibeli);
		writeln ('Total Bahan Olahan Dibuat 		: ', tStatistik.tab[s].TotalBahanOlahanDibuat);
		writeln ('Total Bahan Olahan Dijual 		: ', tStatistik.tab[s].TotalBahanOlahanDijual);
		writeln ('Total Resep Dijual 			: ',tStatistik.tab[s].TotalResepDijual);
		writeln ('Total Pemasukan 			: ',tStatistik.tab[s].TotalPemasukan);
		writeln ('Total Pengeluaran 			: ', tStatistik.tab[s].TotalPengeluaran);
		writeln ('Total Uang 				: ',tStatistik.tab[s].TotalUang);
		writeln ('Jumlah Istirahat 			: ',tStatistik.tab[s].JumlahIstirahat);
		writeln ('Jumlah Makan 				: ', tStatistik.tab[s].JumlahMakan);
		writeln ('Jumlah Aksi 				: ',tStatistik.tab[s].JumlahAksi);
		writeln();
	end ;

end.