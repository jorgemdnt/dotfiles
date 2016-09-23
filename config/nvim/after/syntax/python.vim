syntax match pythonBoolean "\(\W\|^\)\zsself\ze" 
syn region ClassCall matchgroup=CName start='[A-Z][[:alpha:]_]\i*\s*(' end=')' contains=ClassCall
syn region FCall matchgroup=FName start='\(\s\|^\|\.\)[[:lower:]_]\i*\s*(' end=')' contains=FCall,FCallKeyword
syn match FCallKeyword /\i*\ze\s*=[^=]/ contained
hi FCallKeyword ctermfg=yellow
hi link CName Special
hi FName ctermfg=blue
hi link pythonBoolean Boolean
