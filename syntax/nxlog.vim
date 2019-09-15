" Nutanix Log files syntax
"
" Maintainer:       Osamu Fujimura (osamu.fujimur@nutanix.com)

if exists("b:current_syntax")
  finish
endif

"Date Pattern
"1. Jan 14
"2. 2019-09-13 or 2019/09/13
"3. 09/13/2019
"4. I0913

syn match log_date '\%(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\{1,2}'
syn match log_date '\d\{4\}[-/]\d\{1,2\}[-/]\d\{1,2\}'
syn match log_date '\d\{1,2\}\/\d\{1,2\}\/\d\{4\}'
syn match log_date '^[IWEF]\d\{4\}'

"Time Pattern
"1. 11:58:47, 11:58:47,558

syn match log_time '\d\{2\}:\d\{2\}:\d\{2\}[.,]\?\d*'

"Highlighten ip address(:port), uuid and mac address

syn match ip '\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}\.\d\{1,3\}:\?\d*'
syn match uuid '\x\+\-\x\+\-\x\+-\x\+-\x\+'
syn match mac '\x\{1,2\}:\x\{1,2\}:\x\{1,2\}:\x\{1,2\}:\x\{1,2\}:\x\{1,2\}'

"Highlighten strings

syn region log_string start=/'!s!\s/ end=/'/ 
syn region log_string start=/"/ end=/"/

"Nutanix services logs
"acropolis

syn match acropolis_leader 'Acquired master leadership'

"cassandra

syn match cassandra_start 'Logging initialized'

"genesis

syn match genesis_start 'GENESIS START'


"Highlighten Warning, Error, Fatal and Critical

syn match log_warning '^.*\(^WARN\| WARN\|_WARN\).*$'
syn match log_error '^.*\(^ERR\| ERR\|_ERR\).*$'
syn match log_fail '.*FAIL.*'
syn match log_fatal '^.*\(^FATAL\| FATAL\|_FATAL\).*'
syn match log_fatal '.*CRITICAL.*'

syn match log_warning '^W\d\{4\}.*'
syn match log_error '^E\d\{4\}.*'
syn match log_fatal '^F\d\{4\}.*'

"See https://github.com/morhetz/gruvbox for gruvbox color code or :highlight
"for current settings

hi def link acropolis_leader	GruvboxOrangeBold
hi def link cassandra_start	GruvboxOrangeBold
hi def link genesis_start	GruvboxOrangeBold
hi def link ip			GruvboxAqua	
hi def link uuid		GruvboxPurple
hi def link mac			GruvboxOrange
hi def link log_string		GruvboxGreen
hi def link log_date		GruvboxBlueBold
hi def link log_time		GruvboxBlue
hi def link log_warning		GruvboxYellow
hi def link log_error		GruvboxRed
hi def link log_fail		ErrorMsg
hi def link log_fatal		ErrorMsg

let b:current_syntax = "nxlog"
