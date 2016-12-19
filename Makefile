input:
	seq 1 40 | xargs -I{} perl -e 'print int(rand(1000)) . "\t" . "*"x{}; print "\n"'|sort|sed -e 's/^.*\t\(\**\)$$/\1/'>input.txt
quick:
	${MAKE} input
	vi -S quick.vim input.txt
insert:
	${MAKE} input
	vi -S insert.vim input.txt
merge:
	${MAKE} input
	vi -S merge.vim input.txt
bubble:
	${MAKE} input
	vi -S bubble.vim input.txt

