" Nutanix Log files syntax
"
" Maintainer:       Osamu Fujimura (osamu.fujimur@nutanix.com)

if exists("b:current_syntax")
  finish
endif

"Nutanix logs timestamp is as follows.
"1. .out file 2018-05-28 00:03:16 (acropolis.out etc)
"2. .out file 2018-05-28 02:28:38,828 (prism.out etc)
"3. .INFO file I0528 00:00:47.292845 

syn match    log_date '\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) [ 0-9]\d *'
syn match    log_date '\d\{4}-\d\d-\d\d'
syn match    log_date '\d\{4}\/\d\d\/\d\d'
syn match    log_date '^[IWEF]\d\{4}'

syn match    log_time '\d\d:\d\d:\d\d\s*'
syn match    log_time '\d\d:\d\d:\d\d[.,]\d*'
syn match    log_time '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'

syn match    log_warning '^W\d\{4}.*'
syn match    log_warning '\c.*\<\(WARNING\|WARN\).*'
syn match    log_error '^E\d\{4}.*'
syn match    log_error '\c.*\<\(ERROR\|ERR\).*'
syn match    log_fail '\c.*\<FAIL\>.*'
syn match    log_fatal '^F\d\{4}.*'
syn match    log_fatal '\c.\<\(FATAL\).*'
syn match    ip '\d\+\.\d\+\.\d\+.\d\+'
syn match    uuid '\x\+\-\x\+\-\x\+-\x\+-\x\+'
syn match    percentage '\d\+.\d\+%'

syn region log_string 	start=/ '/ end=/'/ 
syn region log_string 	start=/"/ end=/"/



hi ip 		ctermfg=darkgreen
hi uuid		ctermfg=brown
hi percentage   ctermfg=cyan
hi def link log_string 		Comment
hi log_date	ctermfg=lightblue
hi log_time	ctermfg=lightcyan
hi log_warning  ctermfg=Yellow
hi def link log_error		WarningMsg
hi def link log_fail		ErrorMsg
hi def link log_fatal		ErrorMsg


let b:current_syntax = "log"
