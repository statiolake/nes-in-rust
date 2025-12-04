hello_world.nes: hello_world.c
	cl65 -t nes -o hello_world.nes hello_world.c

hello_world.c: hello_world.rs
	mrustc -L /opt/mrustc/mrustc-master/output -o hello_world hello_world.rs || true
