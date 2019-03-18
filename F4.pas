unit F4;

interface
	uses typetubes,sysutils,F12;
	procedure stopSimulasi(var tSimulasi : tabSimulasi;var s : integer);
	//I.S. Simulasi masih berjalan
	//F.S. Simulasi berhenti dan menampilkan data statistik

implementation
	procedure stopSimulasi(var tSimulasi : tabSimulasi;var s : integer);
	begin
		writeln();
		writeln('Simulasi diberhentikan');
		lihatStatistik(tSimulasi, s);
	end;

end.