// Nama 	: Bram Musuko P
// Tanggal	: 9 - April - 2018
// Versi 	: 12 April 2018
unit F9;

interface 
	uses typetubes;
	procedure makan(var tMakan : tabSimulasi; var nomor_simulasi : integer);
	//I.S : tMakan terdefiisi
	//F.S : Menambah 3 energi untuk sekali makan, dengan maksimal 3 kali makan dalam sehari
	
implementation

	procedure makan(var tMakan : tabSimulasi; var nomor_simulasi : integer);
		begin
			if (tMakan.tab[nomor_simulasi].JumlahMakan = 3 ) then // melebihi batas makan dalam sehari
			begin
				writeln('Tidak dapat makan lagi');
			end else // memenuhi syarat makan
			begin
				tMakan.tab[nomor_simulasi].JumlahMakan := tMakan.tab[nomor_simulasi].JumlahMakan + 1;
				tMakan.tab[nomor_simulasi].JumlahEnergi := tMakan.tab[nomor_simulasi].JumlahEnergi + 3;
				tMakan.tab[nomor_simulasi].JumlahAksi := tMakan.tab[nomor_simulasi].JumlahAksi + 1;
				if (tMakan.tab[nomor_simulasi].JumlahEnergi > 10 ) then
				begin
					tMakan.tab[nomor_simulasi].JumlahEnergi := 10;
				end;

				writeln('--- MAKAN ---');
			end;
		end;

end.
	
	