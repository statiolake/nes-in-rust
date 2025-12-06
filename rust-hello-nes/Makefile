.PHONY: output/main.nes
output/main.nes:
	CC=../mrustc-master/cl65-wrapper ../mrustc-master/bin/minicargo --target ./target.toml --output-dir output ./main
	cp output/main output/main.nes

