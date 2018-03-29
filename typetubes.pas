unit typetubes;

interface

const
	arrMin = 1;
	arrMaz = 20;

type
	daftarBahan = record
		NamaBahan		: string;
		HargaSatuan		: longint;
		DurasiKadaluarsa	: integer;
	end;
	
	tabDaftarBahan = record
		tab	: array [arrMin..arrMax] of daftarBahan;
		neff	: integer;
	end;
	
	daftarResep = record
		NamaResep			: string;
		HargaJual			: longint;
		JumlahBahan			: integer;
		Bahan				: array [1..20] of string; //GTW BENER GA INI
	end;
	
	tabDaftarResep = record
		tab	: array [arrMin..arrMax] of daftarResep;
		neff	: integer;
	end;
	
	daftarInventori = record
		BahanAtauOlahan		: string;
		DurasiKadaluarsa	: integer;
	end;
	
	tabDaftarInventori = record
		tab	: array [arrMin..arrMax] of daftarInventori;
		neff	: integer;
	
	statusPengguna = record
		JumlahEnergi		: integer;
		JumlahHariHidup		: integer;
		KapasitasMaxInventori	: integer;
		JumlahBahanBeli		: integer;
		JumlahResepMasak	: integer;
		JumlahMakananKadaluarsa	: integer;
		TotalPemasukan		: longint;
		TotalPengeluaran	: longint;
	end;
	
	tabStatusPengguna = record
		tab	: array [arrMin..arrMax] of statusPengguna;
		neff	: integer;
	end;
	
implementation

end.
