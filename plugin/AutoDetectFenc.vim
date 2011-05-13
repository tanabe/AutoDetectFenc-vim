" Name: AutoDetectFenc
" Version: 0.1
" Author: tanabe
function! AutoDetectFenc()
  let l:max_lines = 20
  let l:total_lines = line("$")
  let l:index = 0
  "default is utf-8
  if (l:total_lines < l:max_lines)
    let l:max_lines = l:total_lines
  endif

  while l:index <= l:max_lines
    let l:line = getline(l:index)
    "euc-jp
    if match(line, "euc-jp") > -1
      se fenc=euc-jp
    "shift_jis
    elseif match(line, "shift_jis") > -1
      se fenc=cp932
    endif
    let l:index = l:index + 1
  endwhile
endfunction
