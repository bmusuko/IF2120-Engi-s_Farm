unit F7;

interface 
	uses typetubes;
	procedure jualOlahan(var tSimulasi : tabSimulasi; var tInventoriBahanOlahan : tabInventoriBahanOlahan; 
						var tBahanOlahan : tabBahanOlahan; var s : integer);
	//I.S : Bahan Olahan telah terdefinisi
	//F.S : Mengurangi jumalh bahan olahan dan menambahkan Total Pemasukan 
	
implementation
	
	procedure jualOlahan(var tSimulasi : tabSimulasi; var tInventoriBahanOlahan : tabInventoriBahanOlahan;
						 var tBahanOlahan : tabBahanOlahan; var s : integer);
	//Menjual bahan olahan yang belum kadaluarsa
	var
		nama	: string;
		found	: boolean; // Mencari barang di Inventori dan Bahan Olahan
		i 		: integer; //Variabel looping
		j 		: integer; //Variabel looping
	begin
		writeln();
		write('Bahan yang ingin dijual : ');
		readln(nama);
		i := 1;
		j := 1;
		found := false;

		
		while (i <= tInventoriBahanOlahan.neff ) and (not found) do
		begin
			if ( nama = tInventoriBahanOlahan.tab[i].NamaBahanOlahan) then
			begin
				if ( tInventoriBahanOlahan.tab[i].Jumlah < 1 ) then
				begin
					found := False;
					i := i + 1;
				end else
				begin
					found := True;
				end;
			end else
			begin
				i := i + 1;
			end;
		end;
		
		if (found) then
		begin
			found := false;
			while (not found) do
			begin
				if ( nama = tBahanOlahan.tab[j].NamaBahanOlahan) then
				begin
					found := True;
					tInventoriBahanOlahan.tab[i].Jumlah := tInventoriBahanOlahan.tab[i].Jumlah - 1;
					tSimulasi.tab[s].TotalPemasukan := tSimulasi.tab[s].TotalPemasukan +  tBahanOlahan.tab[j].HargaJual;
					tSimulasi.tab[s].TotalUang := tSimulasi.tab[s].TotalUang + tBahanOlahan.tab[j].HargaJual;
					tSimulasi.tab[s].JumlahEnergi := tSimulasi.tab[s].JumlahEnergi - 1;
					tSimulasi.tab[s].JumlahAksi := tSimulasi.tab[s].JumlahAksi + 1;
					tSimulasi.tab[s].TotalBahanOlahanDijual := tSimulasi.tab[s].TotalBahanOlahanDijual + 1;
					writeln('Penjualan ', nama, ' sukses ');
				end else 
				begin
					j := j + 1;
				end;
			end;
		end else 
		begin
			writeln('Tidak dapat melakukan Penjualan');
		end;
	end;

end.
					 
					