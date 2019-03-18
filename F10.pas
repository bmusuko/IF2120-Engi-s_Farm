// Nama 	: Bram Musuko P
// Tanggal	: 9 - April - 2018

unit F10;

interface
	uses typetubes;
	procedure istirahat(var tIstirahat : tabSimulasi; var nomor_simulasi : integer);
	//I.S : tIstirahat telah terdefinisi
	//F.S : Menambahkan energi sebanyak 1 dengan maksimal 6 kali istirahat dalam sehari
	
implementation
	
	procedure istirahat(var tIstirahat : tabSimulasi; var nomor_simulasi : integer);
		begin
			if (tIstirahat.tab[nomor_simulasi].JumlahIstirahat = 6 ) then // melebihi batas istirahat dalam sehari
			begin
				writeln('Tidak dapat beristirahat');
			end else // memenuhi syarat istirahat
			begin
				tIstirahat.tab[nomor_simulasi].JumlahIstirahat := tIstirahat.tab[nomor_simulasi].JumlahIstirahat + 1 ;
				tIstirahat.tab[nomor_simulasi].JumlahEnergi := tIstirahat.tab[nomor_simulasi].JumlahEnergi + 1;
				tIstirahat.tab[nomor_simulasi].JumlahAksi := tIstirahat.tab[nomor_simulasi].JumlahAksi + 1;
				if ( tIstirahat.tab[nomor_simulasi].JumlahEnergi > 10 ) then
				begin
					tIstirahat.tab[nomor_simulasi].JumlahEnergi := 10;
				end;

				writeln('--- ISTIRAHAT ---');
			end;
		end;

end.