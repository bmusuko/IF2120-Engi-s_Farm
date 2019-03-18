unit F5;

interface
	uses typetubes,sysutils;
	procedure beliBahan(var tSimulasi : tabSimulasi; var tInventoriBahanMentah : tabInventoriBahanMentah; var tBahanMentah : tabBahanMentah;
							var tInventoriBahanOlahan : tabInventoriBahanOlahan; var s : integer);

implementation
	procedure beliBahan(var tSimulasi : tabSimulasi; var tInventoriBahanMentah : tabInventoriBahanMentah; var tBahanMentah : tabBahanMentah;
							var tInventoriBahanOlahan : tabInventoriBahanOlahan; var s : integer);		
		{kamus lokal}
		var
			found : boolean; //digunakan untuk mengetahui apakah barang sudah ada di inventori atau belum
			totalHarga : integer; //total harga dari belanja. jika barang tidak ada di supermarket, maka harga menjadi 0
			barang : string; //nama barang yang akan dibeli
			kuantitas : integer; //kuantitas barang yang akan dibeli
			i,j : integer; //variabel untuk looping
			kapasitasInventori : integer; // mengecek kapasitas dari inventori
			begin
				totalHarga:= 0;
				found:= false;
				kapasitasInventori := 0;

				//input
				write('Nama bahan: ');
				readln(barang);
				write('Kuantitas: ');
				readln(kuantitas);
		
				//menghitung total harga
				for i:=1 to (tBahanMentah.neff) do
					begin
						if (tBahanMentah.tab[i].NamaBahanMentah = barang) then
						begin
							totalHarga:= kuantitas*(tBahanMentah.tab[i].HargaSatuan);
						end;
					end;

				writeln('> Total harga: ',totalHarga);
				
				for j := 1 to tInventoriBahanMentah.neff do // menghitung kapasitas di inventori bahan mentah
					begin
						kapasitasInventori := kapasitasInventori + tInventoriBahanMentah.tab[j].Jumlah;
					end;
				for j := 1 to tInventoriBahanOlahan.neff do // menghitung kapasitas di inventori bahan olahan
					begin
						kapasitasInventori := kapasitasInventori + tInventoriBahanOlahan.tab[j].Jumlah;
					end;
				// kondisi jika pembelian gagal 
				if (totalHarga = 0) then  
					begin
						writeln('Barang yang ingin dibeli tidak ada');
					end
				else if ((kapasitasInventori + kuantitas) > (tSimulasi.tab[s].KapasitasMaksimumInventori)) then
					begin
						writeln('Inventori tidak mencukupi');
					end
				else if (totalHarga > tSimulasi.tab[s].TotalUang) then
					begin
						writeln('Uang Anda tidak cukup');
					end
					// kondisi jika pembelian sukses
				else
					begin
						writeln('Pembelian sukses.');

						tSimulasi.tab[s].JumlahEnergi := tSimulasi.tab[s].JumlahEnergi - 1; //mengurangi jumlah energi
						tSimulasi.tab[s].TotalUang := tSimulasi.tab[s].TotalUang - totalHarga; //mengurangi uang
						tSimulasi.tab[s].TotalBahanMentahDibeli := tSimulasi.tab[s].TotalBahanMentahDibeli + kuantitas;
						tSimulasi.tab[s].TotalPengeluaran := tSimulasi.tab[s].TotalPengeluaran + totalHarga; 
						tSimulasi.tab[s].JumlahAksi := tSimulasi.tab[s].JumlahAksi + 1;
								
						//pencarian barang apakah sudah ada dalam inventoriBahanMentah dengan tanggal beli yang sama
						//Jika ada tambah Jumlah saja
						i := 1;
						found := False;
						while (i <= tInventoriBahanMentah.neff) and (not found) do
							begin
								if (tInventoriBahanMentah.tab[i].NamaBahanMentah = barang) and (tInventoriBahanMentah.tab[i].TanggalBeli = tSimulasi.tab[s].TanggalHariIni) then
								begin	
									tInventoriBahanMentah.tab[i].Jumlah := tInventoriBahanMentah.tab[i].Jumlah + kuantitas ;
									found := true;
								end else begin
									i := i + 1;
								end;

							end;
								//jika barang belum ada
						if (not found) then //menambahkan barang ke dalam tab
							begin 
								tInventoriBahanMentah.neff := tInventoriBahanMentah.neff + 1;
								tInventoriBahanMentah.tab[tInventoriBahanMentah.neff].NamaBahanMentah := barang;
								tInventoriBahanMentah.tab[tInventoriBahanMentah.neff].TanggalBeli := tSimulasi.tab[s].TanggalHariIni;
								tInventoriBahanMentah.tab[tInventoriBahanMentah.neff].Jumlah := kuantitas;
							end;
					end;
			end;
		end.