unit F13;

interface
	uses typetubes, sysutils;
	procedure lihatInventori(var tInventoriBahanMentah : tabInventoriBahanMentah;
							 var tInventoriBahanOlahan : tabInventoriBahanOlahan);
	//I.S. : Inventori bahan mentah dan olahan belum terurut 
	//F.S. : Inventori bahan mentah dan olahan sudah terurut dan di tampilkan

implementation
	
	procedure lihatInventori(var tInventoriBahanMentah : tabInventoriBahanMentah;
							 var tInventoriBahanOlahan : tabInventoriBahanOlahan);
	var
		i : integer;
		pass : integer;
		Temp_mentah : inventoriBahanMentah;
		Temp_olahan : inventoriBahanOlahan;

		s : string;
	begin
		//Sorting array tInventoriBahanMentah dengan insertion sort
		if (tInventoriBahanMentah.neff > 1) then 
		begin
			for pass := 2 to tInventoriBahanMentah.neff do
			begin
				Temp_mentah := tInventoriBahanMentah.tab[pass];

				i := pass - 1;
				while (Temp_mentah.NamaBahanMentah < tInventoriBahanMentah.tab[i].NamaBahanMentah) and (i > 1) do
				begin
					tInventoriBahanMentah.tab[i + 1] := tInventoriBahanMentah.tab[i];
					i := i - 1;
				end;

				if (Temp_mentah.NamaBahanMentah >= tInventoriBahanMentah.tab[i].NamaBahanMentah) then
				begin
					tInventoriBahanMentah.tab[i + 1] := Temp_mentah;
				end else begin
					tInventoriBahanMentah.tab[i + 1] := tInventoriBahanMentah.tab[i];
					tInventoriBahanMentah.tab[i] := Temp_mentah;
				end;
			end;
		end;

		//Sorting array tInventoriBahanOlahan dengan insertion sort
		if(tInventoriBahanOlahan.neff > 1) then
		begin
			for pass := 2 to tInventoriBahanOlahan.neff do
			begin
				Temp_olahan := tInventoriBahanOlahan.tab[pass];

				i := pass - 1;
				while (Temp_olahan.NamaBahanOlahan < tInventoriBahanOlahan.tab[i].NamaBahanOlahan) and (i > 1) do
				begin
					tInventoriBahanOlahan.tab[i + 1] := tInventoriBahanOlahan.tab[i];
					i := i - 1;
				end;

				if (Temp_olahan.NamaBahanOlahan >= tInventoriBahanOlahan.tab[i].NamaBahanOlahan) then
				begin
					tInventoriBahanOlahan.tab[i + 1] := Temp_olahan;
				end else begin
					tInventoriBahanOlahan.tab[i + 1] := tInventoriBahanOlahan.tab[i];
					tInventoriBahanOlahan.tab[i] := Temp_olahan;
				end;
			end;
		end;

		//Menampilkan inventori bahan mentah dan olahan
		writeln();
		writeln('Daftar Bahan Mentah');
		writeln();
		for i := 1 to tInventoriBahanMentah.neff do
		begin
			write(tInventoriBahanMentah.tab[i].NamaBahanMentah, ' | ');
			s := DateToStr(tInventoriBahanMentah.tab[i].TanggalBeli);
			write(s, ' | ');
			writeln(tInventoriBahanMentah.tab[i].Jumlah);
		end;

		writeln();
		writeln('Daftar Bahan Olahan');
		writeln();
		for i := 1 to tInventoriBahanOlahan.neff do
		begin
			write(tInventoriBahanOlahan.tab[i].NamaBahanOlahan, ' | ');
			s := DateToStr(tInventoriBahanOlahan.tab[i].TanggalBuat);
			write(s, ' | ');
			writeln(tInventoriBahanOlahan.tab[i].Jumlah);
		end;
	end;
end.