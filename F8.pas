unit F8;

interface
	uses typetubes;
	procedure jualResep(var tSimulasi : tabSimulasi;var tResep : tabResep;var tInventoriBahanOlahan : tabInventoriBahanOlahan;
						var tInventoriBahanMentah : tabInventoriBahanMentah; var s : integer);
	
implementation
	procedure jualResep(var tSimulasi : tabSimulasi;var tResep : tabResep;var tInventoriBahanOlahan : tabInventoriBahanOlahan;
						var tInventoriBahanMentah : tabInventoriBahanMentah; var s : integer);
	var
	c : integer;
	tempResep : string;
	i , j , k : integer;
	found : boolean;
	begin
		writeln();
		write ('>> Resep yang ingin dijual : ');
		readln (tempResep);
		i := 1;
		found := False;

		while (i <= tResep.neff) and (not found) do // i adalah loop untuk menemukan urutan resep
		begin
			if ( tResep.tab[i].NamaResep = tempResep) then
			begin
				found := True;
			end else
			begin
				i := i + 1;
			end;
		end;
		
		if ( found = False ) then
		begin
			writeln ('Resep Tidak Ditemukan');
		end else 
		begin
			j := 1;
			c := 0;
			while ( j <= tResep.tab[i].JumlahBahan ) do // j adalah loop untuk menentukan bahan dalam resep
			begin
				found := False;
				k := 1;
				while ( k <= tInventoriBahanMentah.neff ) and (found = false) do // k adalah loop untuk mencari bahan dalam inventori
				begin
					if ( tResep.tab[i].bahan[j] = tInventoriBahanMentah.tab[k].NamaBahanMentah) then
					begin
						found := True;
						c := c + 1;
					end else
					begin
						k := k + 1;
					end;
				end;
				k := 1;
				while ( k <= tInventoriBahanOlahan.neff ) and ( found = false ) do
				begin
					if ( tResep.tab[i].bahan[j] = tInventoriBahanOlahan.tab[k].NamaBahanOlahan) then
					begin
						found := True;
						c := c + 1;
					end else
					begin
						k := k + 1;
					end;
				end;
				j := j + 1;
			end;
			if ( c <> tResep.tab[i].JumlahBahan) then 
			begin
				writeln ('Tidak dapat menjual resep, karena bahan yang dibutuhkan kurang');
			end else
			begin
				for j := 1 to tResep.tab[i].JumlahBahan do
				begin
				found := False;
				k := 1;
				while ( k <= tInventoriBahanMentah.neff ) and (found = false) do // k adalah loop untuk mencari bahan dalam inventori
				begin
					if ( tResep.tab[i].bahan[j] = tInventoriBahanMentah.tab[k].NamaBahanMentah) then
					begin
						found := True;
						tInventoriBahanMentah.tab[k].Jumlah := tInventoriBahanMentah.tab[k].Jumlah - 1;
					end else
					begin
						k := k + 1;
					end;
				end;
				k := 1;
				while ( k <= tInventoriBahanOlahan.neff ) and ( found = false ) do
				begin
					if ( tResep.tab[i].bahan[j] = tInventoriBahanOlahan.tab[k].NamaBahanOlahan) then
					begin
						found := True;
						tInventoriBahanOlahan.tab[k].Jumlah	:= tInventoriBahanOlahan.tab[k].Jumlah - 1; 
					end else
					begin
						k := k + 1;
					end;
				end;	
				end;
				writeln(tempResep,' telah berhasil dijual');
			end;
		end;
		tSimulasi.tab[s].JumlahEnergi		:= tSimulasi.tab[s].JumlahEnergi - 1;
		tSimulasi.tab[s].TotalPemasukan 	:= tSimulasi.tab[s].TotalPemasukan +  tResep.tab[i].HargaJual;
		tSimulasi.tab[s].TotalUang			:= tSimulasi.tab[s].TotalUang + tResep.tab[i].HargaJual;
		tSimulasi.tab[s].JumlahAksi			:= tSimulasi.tab[s].JumlahAksi	+ 1;
		tSimulasi.tab[s].TotalResepDijual	:= tSimulasi.tab[s].TotalResepDijual + 1;
	end;
	
end.