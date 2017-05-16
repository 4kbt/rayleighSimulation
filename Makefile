fn = rayleighSimulation

$(fn).eps: $(fn).gpl $(fn).dat Makefile
	gnuplot $<

$(fn).dat: $(fn).m Makefile
	octave $<
