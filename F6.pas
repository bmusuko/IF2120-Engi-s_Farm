unit F6;

interface
	uses typetubes, sysutils;
	procedure olahBahan(var tSimulasi : tabSimulasi; var tInventoriBahanMentah : tabInventoriBahanMentah; var tBahanOlahan : tabBahanOlahan;
						var tInventoriBahanOlahan : tabInventoriBahanOlahan; var s : integer);

implementation
	procedure olahBahan(var tSimulasi : tabSimulasi; var tInventoriBahanMentah : tabInventoriBahanMentah; var tBahanOlahan : tabBahanOlahan;
							var tInventoriBahanOlahan : tabInventoriBahanOlahan; var s : integer);
		{kamus lokal}
			var
					found : boolean; //digunakan untuk mengetahui apakah barang sudah ada di inventori atau belum
					i,j,k : integer; //variable looping
					n : integer; //variable untuk penanda
					nama : string; //input pengguna
					valid,exit : boolean; //variable penanda boolean
					tabUrutanBahanMentah : array [1..20] of integer; //array menyimpan urutan benda
					banyakTerolah : integer; //variable penghitung bahan yang akan diolah
			begin
					valid := false;
					write('>> Bahan yang ingin diolah : ');
					readln(nama);
					for i:=1 to tBahanOlahan.neff do
						begin
								if (nama = (tBahanOlahan.tab[i].NamaBahanOlahan)) then
									begin
											valid:= true; // penanda apakah input valid atau tidak
											n:= i; //menandai pada array ke berapa resep olahan yang ingin dibuat
									end;
						end;
					
					//validasi apakah bahan mentah ada atau tidak untuk membuat bahan olahan
					exit := false; //variabel jika bahan tidak mencukupi
					banyakTerolah := 0; //variabel untuk mengecek apakah semua bahan mentah sudah ada di inventori untuk membuat bahan olahan. digunakan dengan cara menambahkan barang yang  sudah ketemu dan dibandingkan dengan jumlah bahan yang diperlukan
					tabUrutanBahanMentah[1] := -999; //pengunaan sentinel
					k:= 1;
					if valid then //input oleh pengguna benar,
						begin
								i := 1; 
								repeat //looping untuk inventori bahan mentah
										j:=1;
										repeat // looping bahan yg diperlukan untuk diolah
												if (tInventoriBahanMentah.tab[i].NamaBahanMentah = tBahanOlahan.tab[n].bahan[j]) then
													begin
															if 	tInventoriBahanMentah.tab[i].Jumlah < 1 then //ASUMSI: karena tiap bahan olahan hanya memerlukan satu barang mentah spesifik 
																begin
																		exit:= true;
																end
															else //jika barang ada
																begin 
																		banyakTerolah := banyakTerolah + 1; 
																		tabUrutanBahanMentah[k] := i; //memasukan urutan bahan mentah yg diperlukan untuk mengolah
																		tabUrutanBahanMentah[k+1] := 999; //menggeser sentinel 
																		k := k + 1;
																end;
													end;
												j := j + 1;
										until
											(j = tBahanOlahan.tab[n].JumlahBahan + 1) or exit; 
											
										i:= i + 1;
								until
									(i = tInventoriBahanMentah.neff + 1) or exit;
									
								if exit or (banyakTerolah < tBahanOlahan.tab[n].JumlahBahan) then //jika barang tidak cukup
									begin
											writeln('Pembelian gagal, silahkan lihat kembali resep dan inventori anda.');
									end
								else //pembelian berhasil
									begin
											i:= 1;
											while (tabUrutanBahanMentah[i] <> 999) do
												begin
														tInventoriBahanMentah.tab[tabUrutanBahanMentah[i]].Jumlah := tInventoriBahanMentah.tab[tabUrutanBahanMentah[i]].Jumlah - 1; //Mengurangi jumlah bahan tersedia
														i:= i + 1;
												end;
											writeln('pembelian sukses.');
											tSimulasi.tab[s].JumlahEnergi := tSimulasi.tab[s].JumlahEnergi - 1; //mengurangi jumlah energi
											tSimulasi.tab[s].TotalBahanOlahanDibuat := tSimulasi.tab[s].TotalBahanOlahanDibuat + 1;
											tSimulasi.tab[s].JumlahAksi := tSimulasi.tab[s].JumlahAksi + 1;
									end;
									
								//pencarian barang apakah sudah ada dalam inventoriBahanMentah (MASIH BELOM LENGKAP, LIAT KOMEN);
								
								found := False;
								for i:= 1 to (tInventoriBahanOlahan.neff) do
									begin
											if (tInventoriBahanOlahan.tab[i].NamaBahanOlahan = nama) and (tInventoriBahanOlahan.tab[i].TanggalBuat = tSimulasi.tab[s].TanggalHariIni) then //mencari barang apakah sudah ada atau tidak
												begin	//TOLONG DIBAGIAN KONDISI DIATAS, DITAMBAHIN AND WAKTU PEMBUATAN = WAKTU BARANG YG UDAH DI INVENTORI
														tInventoriBahanOlahan.tab[i].Jumlah := tInventoriBahanOlahan.tab[i].Jumlah + 1 ;
														found := true;
												end;
									end;
								//jika barang belum ada
								if not found then //menambahkan barang ke dalam tab
									begin //(TOLONG DITAMBAHIN UNTUK WAKTU PEMBUATAN KE TABINVENTORIBAHANOLAHAN.TAB[I+1].TANGGALBUAT) 
											tInventoriBahanOlahan.neff := tInventoriBahanOlahan.neff + 1; //menambah neff inventori
											tInventoriBahanOlahan.tab[tInventoriBahanOlahan.neff].NamaBahanOlahan := nama;
											tInventoriBahanOlahan.tab[tInventoriBahanOlahan.neff].TanggalBuat := tSimulasi.tab[s].TanggalHariIni;
											tInventoriBahanOlahan.tab[tInventoriBahanOlahan.neff].Jumlah := 1;
									end;
						end
					else // jika input nama tidak valid
						begin
								writeln('Pembelian gagal, nama bahan olahan tidak valid.');
						end;
			end;			
end.
