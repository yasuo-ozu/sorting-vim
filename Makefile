.PHONY: input quick insert merge bubble
VIM_EXEC ?= nvim -u NORC

input:
	seq 1 40 | xargs -I{} perl -e 'print int(rand(1000)) . "\t" . "*"x{}; print "\n"'|sort|sed -e 's/^.*	\(\**\)$$/\1/'>input.txt
quick: input
	$(VIM_EXEC) -S quick.vim input.txt
insert: input
	$(VIM_EXEC) -S insert.vim input.txt
merge: input
	$(VIM_EXEC) -S merge.vim input.txt
bubble: input
	$(VIM_EXEC) -S bubble.vim input.txt

