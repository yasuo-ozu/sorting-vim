source utils.vim

function! Insertsort(start, stop) abort
	for i in range(a:start, a:stop)
		let min = 99999
		let line = -1
		for j in range(i, a:stop)
			let val = strlen(Getval(j))
			if val < min
				let min = val
				let line = j
			endif
		endfor
		let s1 = Getval(i)
		let s2 = Getval(line)
		call Setval(i, s2)
		call Setval(line, s1)
	endfor
endfunction

normal! G
let stime = reltime()
call Insertsort(1, line("."))
echomsg reltimestr(reltime(stime))
normal! 

