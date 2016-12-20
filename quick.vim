source utils.vim

function! Quicksort(start, stop) abort
	let i = a:start
	let j = a:stop
	if i >= j
		return
	endif
	let pivot = strlen(Getval((i + j) / 2))
	while 1
		while 1
			let val = strlen(Getval(i))
			if val >= pivot
				break
			endif
			let i = i + 1
		endwhile
		while 1
			let val = strlen(Getval(j))
			if val <= pivot
				break
			endif
			let j = j - 1
		endwhile
		if i >= j
			break
		endif
		let line1 = Getval(i)
		let line2 = Getval(j)
		call Setval(i, line2)
		call Setval(j, line1)
		let i = i + 1
		let j = j - 1
	endwhile
	call Quicksort(a:start, i - 1)
	call Quicksort(j + 1, a:stop)
endfunction

normal! G
let stime = reltime()
call Quicksort(1, line("."))
echomsg reltimestr(reltime(stime))
normal! 


