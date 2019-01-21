setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! s:IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! s:LeadingLine(lnum)
	if indent(a:lnum) < indent(a:lnum + 1) 
		return 1
	else
		return 0
	endif
endfunction

function! GetPotionFold(lnum)
	if getline(a:lnum) =~? '\v^\s*$'
		return '-1'
	elseif LeadingLine(a:lnum)
		return '>'.string(IndentLevel(a:lnum) + 1)
	else
		return string(IndentLevel(a:lnum))
	endif
endfunction
