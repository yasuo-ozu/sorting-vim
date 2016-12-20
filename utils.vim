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
