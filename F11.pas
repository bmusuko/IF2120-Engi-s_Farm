unit F11;

interface
	uses typetubes,F3,F4,sysutils;
	procedure tidur(var tSimulasi : tabSimulasi; var tBahanMentah : tabBahanMentah; var tBahanOlahan :  tabBahanOlahan;
					var tInventoriBahanMentah : tabInventoriBahanMentah; var tInventoriBahanOlahan : tabInventoriBahanOlahan;
					var s : integer);

implementation
	procedure tidur(var tSimulasi : tabSimulasi; var tBahanMentah : tabBahanMentah; var tBahanOlahan :  tabBahanOlahan;
					var tInventoriBahanMentah : tabInventoriBahanMentah; var tInventoriBahanOlahan : tabInventoriBahanOlahan;
					var s : integer);
	var
		tInventoriOlahanSementara : tabInventoriBahanOlahan;
		tInventoriMentahSementara : tabInventoriBahanMentah;
		i,j : integer;
		found : boolean;
	begin
		if (tSimulasi.tab[s].JumlahAksi = 0) then 
		begin
			writeln('Tidak dapat tidur karena belum melaksanakan aksi apapun');
		end else if (tSimulasi.tab[s].JumlahHariHidup = 9) then
		begin 
			tSimulasi.tab[s].JumlahHariHidup := tSimulasi.tab[s].JumlahHariHidup + 1;
			stopSimulasi(tSimulasi, s);
		end else begin //Aksi > 0
			//Reset semua keadaan di hari baru
			tSimulasi.tab[s].JumlahHariHidup := tSimulasi.tab[s].JumlahHariHidup + 1;
			tSimulasi.tab[s].JumlahEnergi := 10;
			tSimulasi.tab[s].JumlahIstirahat := 0;
			tSimulasi.tab[s].JumlahMakan := 0;
			tSimulasi.tab[s].JumlahAksi := 0;
			tSimulasi.tab[s].TanggalHariIni := tSimulasi.tab[s].Tanggal + tSimulasi.tab[s].JumlahHariHidup;

			//Buang bahan olahan yang kadaluarsa
			tInventoriOlahanSementara.neff:= 0;
			for i := 1 to tInventoriBahanOlahan.neff do
			begin
				if ((tInventoriBahanOlahan.tab[i].TanggalBuat + 3) >= tSimulasi.tab[s].TanggalHariIni) then
				begin
					tInventoriOlahanSementara.neff := tInventoriOlahanSementara.neff + 1;
					tInventoriOlahanSementara.tab[tInventoriOlahanSementara.neff] := tInventoriBahanOlahan.tab[i];
				end;
			end;

			tInventoriBahanOlahan.neff := tInventoriOlahanSementara.neff;
			for i := 1 to tInventoriBahanOlahan.neff do
			begin
				tInventoriBahanOlahan.tab[i] := tInventoriOlahanSementara.tab[i];
			end;

			//Buang bahan mentah yang kadaluarsa
			tInventoriMentahSementara.neff := 0;
			for i := 1 to tInventoriBahanMentah.neff do
			begin
				j := 1;
				found := False;
				while (j <= tBahanMentah.neff) and (not found) do
				begin
					if (tInventoriBahanMentah.tab[i].NamaBahanMentah = tBahanMentah.tab[j].NamaBahanMentah) then
					begin
						found := True;
					end else begin
						j := j + 1;
					end;
				end;

				if ((tInventoriBahanMentah.tab[i].TanggalBeli + tBahanMentah.tab[j].DurasiKadaluarsa) >= tSimulasi.tab[s].TanggalHariIni) then
				begin
					tInventoriMentahSementara.neff := tInventoriMentahSementara.neff + 1;
					tInventoriMentahSementara.tab[tInventoriMentahSementara.neff] := tInventoriBahanMentah.tab[i];
				end;
			end;

			tInventoriBahanMentah.neff := tInventoriMentahSementara.neff;
			for i := 1 to tInventoriBahanMentah.neff do
			begin
				tInventoriBahanMentah.tab[i] := tInventoriMentahSementara.tab[i];
			end;
		end;
	end;
end.




			




		

