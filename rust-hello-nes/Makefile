.PHONY: all
all: output/welcome.nes output/fizzbuzz.nes

.PHONY: output/welcome.nes
output/welcome.nes:
	CC=../mrustc-master/cl65-wrapper ../mrustc-master/bin/minicargo --target ./target.toml --output-dir output ./welcome
	cp output/welcome output/welcome.nes

.PHONY: output/fizzbuzz.nes
output/fizzbuzz.nes:
	CC=../mrustc-master/cl65-wrapper ../mrustc-master/bin/minicargo --target ./target.toml --output-dir output ./fizzbuzz
	cp output/fizzbuzz output/fizzbuzz.nes

