.DEFAULT_GOAL := all

all:
	@echo "Compilando ..."
	@flex -l lexicoFlex.l
	@bison -dv sintacticoBison.y
	@gcc -o main sintacticoBison.tab.c lex.yy.c -ll
	@./main < entrada.txt

clean:
	@rm main *.c *.h *.output
