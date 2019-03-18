//Louis Cahyadi
//15 - 4 

unit F14;

interface
	
	uses typetubes;
	procedure lihatResep(tResep : tabResep);
	//I.S. array tResep masih tidak terurut dengan baik
	//F.S. array tResep menjadi terurut membesar mengecil menurut nama bahan lalu ditampilkan

implementation
	procedure lihatResep(tResep : tabResep);
	var
		i,j : integer; //untuk iterasi
		pass : integer; //tahapan pengurutan
		Temp : resep; //Penampung nilai sementara, untuk pergeseran
	begin
		//Sorting array tResep dengan insertion sort
		if (tResep.neff > 1) then
		begin
			for pass := 2 to tResep.neff do
			begin
				Temp := tResep.tab[pass];

				i := pass - 1;
				while (Temp.NamaResep < tResep.tab[i].NamaResep) and (i > 1) do
				begin
					tResep.tab[i + 1] := tResep.tab[i];
					i := i - 1;
				end;

				if (Temp.NamaResep >= tResep.tab[i].NamaResep) then
				begin
					tResep.tab[i + 1] := Temp;
				end else  begin
					tResep.tab[i + 1] := tResep.tab[i];
					tResep.tab[i] := Temp;
				end;
			end;
		end;

		//Menampilkan daftar resep
		writeln();
		for i := 1 to tResep.neff do
		begin
			write(tResep.tab[i].NamaResep, ' | ');
			write(tResep.tab[i].HargaJual, ' | ');
			write(tResep.tab[i].JumlahBahan, ' | ');
			for j := 1 to (tResep.tab[i].JumlahBahan - 1) do
			begin
				write(tResep.tab[i].Bahan[j], ' | ');
			end;

			writeln(tResep.tab[i].Bahan[tResep.tab[i].JumlahBahan]);
		end;
	end;
end.
