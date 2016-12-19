source utils.vim

function! Merge(start, middle, stop) abort
	let i = a:start
	let j = a:middle + 1
	while i < j || j <= a:stop
		if i == j
			return
		endif
		if i == j
			let i = i + 1
			let j = j + 1
		elseif j > a:stop
			let i = i + 1
		else
			let v1 = strlen(Getval(i))
			let v2 = strlen(Getval(j))
			if v2 < v1
				call cursor(j, 1)
				normal! V
				redraw
				sleep 10ms
				normal! dd
				call cursor(i, 1)
				normal! P
				normal! V
				redraw
				sleep 10ms
				normal! 
				let i = i + 1
				let j = j + 1
			else
				let i = i + 1
			endif
		endif
	endwhile
endfunction

function! Mergesort(start, stop) abort
"	if a:stop - a:start <= 1
"		let s1 = Getval(a:start)
"		let s2 = Getval(a:stop)
"		if strlen(s1) > strlen(s2)
"			call Setval(a:start, s2)
"			call Setval(a:stop, s1)
"		endif
"	else
	if a:stop > a:start
		let middle = (a:start + a:stop) / 2
		call Mergesort(a:start, middle)
		call Mergesort(middle + 1, a:stop)
		call Merge(a:start, middle, a:stop)
	endif
endfunction

normal! G
let stime = reltime()
call Mergesort(1, line("."))
echomsg reltimestr(reltime(stime))
normal! 


