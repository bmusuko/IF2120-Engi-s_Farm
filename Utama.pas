//Versi : 11 April 2018

Program Utama;
uses typetubes, F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,F13,F14,F15,F16,F17,sysutils;

var
	tBahanMentah 			: tabBahanMentah;
	tBahanOlahan 			: tabBahanOlahan;
	tInventoriBahanMentah 	: tabInventoriBahanMentah;
	tInventoriBahanOlahan 	: tabInventoriBahanOlahan;
	tResep					: tabResep;
	tSimulasi				: tabSimulasi;

	pilihan : string;
	menu : string;

begin
	pilihan := 'a'; //asal aja
	writeln('-----------------------------------------------------');
	writeln('SELAMAT DATANG DI SIMULASI ENGI KITCHEN');
	writeln('-----------------------------------------------------');
	writeln();
	while (pilihan <> 'exit') do
	begin
		writeln('> load');
		writeln('> start');
		writeln('> exit');

		writeln();
		writeln('> Pilihan Anda : ');
		write('>> '); readln(pilihan);

		if (pilihan = 'load') then
		begin
			load(tBahanMentah,tBahanOlahan,tInventoriBahanMentah,tInventoriBahanOlahan,tResep,tSimulasi);
			writeln();
			writeln('--- LOADING FILE SUKSES ---');
			writeln();
		end else if (pilihan = 'start') then
		begin
			writeln();
			writeln('> Nomor simulasi : ');
			write ('>> '); readln(nomor_simulasi);
			startSimulasi(tInventoriBahanMentah, tInventoriBahanOlahan, tSimulasi, nomor_simulasi, tBahanMentah);
			writeln();
			writeln('> Selamat datang di simulasi ', nomor_simulasi);
			writeln();
			menu := 'a'; //asal aja
			while ((menu <> 'stop') and (tSimulasi.tab[nomor_simulasi].JumlahHariHidup < 10)) do
				begin
				writeln('> Menu Utama');
				writeln();
				writeln('> Stop Simulasi');
				writeln('> Beli Bahan ');
				writeln('> Olah Bahan');
				writeln('> Jual Olahan');
				writeln('> Jual Resep');
				writeln('> Makan');
				writeln('> Istirahat');
				writeln('> Tidur');
				writeln('> Lihat Statistik');
				writeln('> Lihat Inventori');
				writeln('> Lihat Resep');
				writeln('> Cari Resep');
				writeln('> Tambah Resep');
				writeln('> Upgrade Inventori');
				writeln();

				write('>> '); readln(menu);
					case menu of 
						'stop simulasi'		:begin
												stopSimulasi(tSimulasi, nomor_simulasi);
											end;
						'beli bahan'		:begin
												beliBahan(tSimulasi, tInventoriBahanMentah, tBahanMentah, tInventoriBahanOlahan, nomor_simulasi);
											end;
						'olah bahan'		:begin
												olahBahan(tSimulasi, tInventoriBahanMentah, tBahanOlahan, tInventoriBahanOlahan, nomor_simulasi);
											end;
						'jual olahan'		:begin
												jualOlahan(tSimulasi, tInventoriBahanOlahan, tBahanOlahan, nomor_simulasi);
											end;
						'jual resep'		:begin
												jualResep(tSimulasi, tResep, tInventoriBahanOlahan, tInventoriBahanMentah, nomor_simulasi);
											end;
						'makan'				:begin
												makan(tSimulasi, nomor_simulasi);
											end;
						'istirahat'			:begin
												istirahat(tSimulasi, nomor_simulasi);
											end;
						'tidur'				:begin
												tidur(tSimulasi, tBahanMentah, tBahanOlahan, tInventoriBahanMentah, tInventoriBahanOlahan, nomor_simulasi);
											end;
						'lihat statistik'	:begin
												lihatStatistik(tSimulasi, nomor_simulasi);
											end;
						'lihat inventori'	:begin
												lihatInventori(tInventoriBahanMentah, tInventoriBahanOlahan);
											end;
						'lihat resep'		:begin
												lihatResep(tResep);
											end;
						'cari resep'		:begin
												cariResep(tResep);
											end;
						'tambah resep'		:begin
												tambahResep(tResep, tBahanMentah, tBahanOlahan);
											end;
						'upgrade inventori'	:begin
												upgradeInventori(tSimulasi, nomor_simulasi);
											end;
											
					end;
				end;
		end else if (pilihan = 'exit') then 
		begin
			exit(tInventoriBahanMentah,tInventoriBahanOlahan,tResep,tSimulasi);
		end;
	end;	
end.


