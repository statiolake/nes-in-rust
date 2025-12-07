.PHONY: all

all:
	cd ../../cc65/cc65-2.19 && make
	../../cc65/cc65-2.19/bin/cl65 ./src.c -t nes -o c.nes > build-log.txt 2>&1
	../../cc65/cc65-2.19/bin/cl65 ./src.c -Wl --gc-sections -t nes -o c_gc.nes > gc-build-log.txt 2>&1
	../../cc65/cc65-2.19/bin/cl65 -S ./src.c
	../../da65nes c.nes > c.s
	../../da65nes c_gc.nes > c_gc.s
	../../da65nes c_gc.nes > c_gc_orig.s

	sed -i 's/L..../Lxxxx/g' c.s
	sed -i 's/L..../Lxxxx/g' c_gc.s
	sed -i 's/^Lxxxx:/      /' c.s
	sed -i 's/^Lxxxx:/      /' c_gc.s
	grep -v 'brk' c.s > c.s.tmp && mv c.s.tmp c.s
	grep -v 'brk' c_gc.s > c_gc.s.tmp && mv c_gc.s.tmp c_gc.s

	diff -u c.s c_gc.s > diff.txt
