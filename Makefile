.PHONY:	input quick insert merge bubble

VIM_EXEC ?= $(shell if which nvim > /dev/null; then echo "nvim -u NORC"; else echo "vim -N -u NORC --noplugin"; fi)

input:	input.txt
input.txt:
	seq 1 40 | xargs -I{} perl -e 'print int(rand(1000)) . "\t" . "*"x{}; print "\n"'|sort|sed -e 's/^.*\t\(\**\)$$/\1/'>input.txt
quick:
	${MAKE} input
	${VIM_EXEC} -S quick.vim input.txt
insert:
	${MAKE} input
	${VIM_EXEC} -S insert.vim input.txt
merge:
	${MAKE} input
	${VIM_EXEC} -S merge.vim input.txt
bubble:
	${MAKE} input
	${VIM_EXEC} -S bubble.vim input.txt

