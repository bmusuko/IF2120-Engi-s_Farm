unit F17;

interface
	uses typetubes;
	procedure upgradeInventori(var tSimulasi : tabSimulasi; var s : integer);
	//I.S.: bMentah dan bOlahan terdefinisi
	//F.S.: bMentah dan bOlahan ditambahn kapasitasnya sebanyak 25

implementation
	procedure upgradeInventori(var tSimulasi : tabSimulasi; var s : integer);
		begin
			if (tSimulasi.tab[s].TotalUang >= 5000) then
			begin
				tSimulasi.tab[s].TotalPengeluaran := tSimulasi.tab[s].TotalPengeluaran + 5000;
				tSimulasi.tab[s].TotalUang := tSimulasi.tab[s].TotalUang - 5000;
				tSimulasi.tab[s].KapasitasMaksimumInventori := tSimulasi.tab[s].KapasitasMaksimumInventori + 25;
				writeln();
				writeln('Penambahan inventori berhasil');
			end else begin
				writeln('Uang Anda tidak cukup');
			end;
		end;
end.