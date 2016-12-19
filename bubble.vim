set maxfuncdepth=100
function! Getval(line)
	call cursor(a:line, 1)
	normal! V
	let val = getline(".")
	redraw
	sleep 10ms
	return val
endfunction
function! Setval(line, val)
	call cursor(a:line, 1)
	normal! V
	call setline(".", a:val)
	redraw
	sleep 10ms
endfunction

function! Bubblesort(start, stop) abort
	let j = a:stop
	while j > a:start
		let i = a:start
		while i < j
			let a = Getval(i)
			let b = Getval(i + 1)
			if strlen(a) > strlen(b)
				call Setval(i, b)
				call Setval(i + 1, a)
			endif
			let i = i + 1
		endwhile
		let j = j - 1
	endwhile
endfunction

normal! G
let stime = reltime()
call Bubblesort(1, line("."))
normal! 
echomsg reltimestr(reltime(stime))

