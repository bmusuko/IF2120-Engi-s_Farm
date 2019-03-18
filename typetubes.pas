//Versi : 11 April 2018

unit typetubes;

interface

const
	arrMin = 1;
	arrMax = 20;

type
	bahanMentah = record
		NamaBahanMentah			: string;
		HargaSatuan				: longint;
		DurasiKadaluarsa		: integer;
	end;
	
	tabBahanMentah = record
		tab	: array [arrMin..arrMax] of bahanMentah;
		neff	: integer;
	end;
	
	bahanOlahan = record
		NamaBahanOlahan	: string;
		HargaJual		: longint;
		JumlahBahan		: integer;
		Bahan			: array [arrMin..arrMax] of string; 
		//Durasi kadaluarsa 3 hari
	end;
	
	tabBahanOlahan = record
		tab		: array [arrMin..arrMax] of bahanOlahan;
		neff	: integer;
	end;
	
	inventoriBahanMentah = record
		NamaBahanMentah		: string;
		TanggalBeli			: TDateTime;	
		Jumlah				: integer;
	end;
	
	tabInventoriBahanMentah = record
		tab	: array [arrMin..arrMax] of inventoriBahanMentah; 
		//Pembuatan array ini harus dinamis krn inventori dapat diperbesar.
		//Karena itu besar array tidak dapat didefinisikan sekarang, apalagi dengan konstanta arrMax yang tidak dapat diubah.
		//Pembuatan array ini harus dilakukan dengan fungsi bawaan Pascal: SetLength(tabInventoriBahanMentah,kapasitas)
		neff	: integer;
	end;
	
	inventoriBahanOlahan = record
		NamaBahanOlahan		: string;
		TanggalBuat			: TDateTime;
		Jumlah				: integer;
	end;
	
	tabInventoriBahanOlahan = record
		tab	: array [arrMin..arrMax] of inventoriBahanOlahan;
		//Pembuatan array ini harus dinamis krn inventori dapat diperbesar.
		//Karena itu besar array tidak dapat didefinisikan sekarang, apalagi dengan konstanta arrMax yang tidak dapat diubah.
		//Pembuatan array ini harus dilakukan dengan fungsi bawaan Pascal: SetLength(tabInventoriBahanOlahan,kapasitas)
		neff	: integer;
	end;
	
	resep = record
		NamaResep		: string;
		HargaJual		: longint;
		JumlahBahan		: integer;
		Bahan			: array[arrMin..arrMax] of string;
	end;
	
	tabResep = record
		tab 	: array [arrMin..arrMax] of resep;
		neff	: integer;
	end;
	
	simulasi = record
		NomorSimulasi					: integer;
		Tanggal							: TDateTime;
		JumlahHariHidup					: integer;
		JumlahEnergi					: integer;
		KapasitasMaksimumInventori		: integer;
		TotalBahanMentahDibeli			: integer;
		TotalBahanOlahanDibuat			: integer;
		TotalBahanOlahanDijual			: integer;
		TotalResepDijual				: integer;
		TotalPemasukan					: longint;
		TotalPengeluaran				: longint;
		TotalUang						: longint;

		//Diluar file eksternal
		JumlahIstirahat					: integer;
		JumlahMakan						: integer;
		JumlahAksi						: integer;
		TanggalHariIni					: TDateTime;
	end;
	
	tabSimulasi	= record
		tab	: array [arrMin..arrMax] of simulasi;
		neff	: integer;
	end;

	var //Daftar variabel global

	nomor_simulasi : integer; 
	
implementation

end.
