command! -nargs=1 GetLink :let @"=GetLink(<f-args>)

function! GetLink(url)                                                         
    let title = system("wget --quiet -O - " . a:url . " | sed -n -e 's!.*<title>\\(.*\\)</title>.*!\\1!p'")
    let title = substitute(title,"\n",'','g')
    return "[" . title . "](" . a:url . ")"
endfunction
