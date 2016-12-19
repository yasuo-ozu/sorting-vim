input:
	seq 1 40 | xargs -I{} perl -e 'print int(rand(1000)) . "\t" . "*"x{}; print "\n"'|sort|sed -e 's/^.*\t\(\**\)$$/\1/'>input.txt
quick:
	${MAKE} input
	vim -S quick.vim input.txt
insert:
	${MAKE} input
	vim -S insert.vim input.txt
merge:
	${MAKE} input
	vim -S merge.vim input.txt
bubble:
	${MAKE} input
	vim -S bubble.vim input.txt

