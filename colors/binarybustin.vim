" Vim color file
" Maintainer:   Lance Becker <lancerbecker@gmail.com>
" Last Change: Sep 28 2010
" URL:		

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

" your pick:
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="binarybustin"

"hi Normal

" OR

" highlight clear Normal
" set background&
" highlight clear
" if &background == "light"
"   highlight Error ...
"   ...
" else
"   highlight Error ...
"   ...
" endif

" A good way to see what your colorscheme does is to follow this procedure:
" :w 
" :so % 
"
" Then to see what the current setting is use the highlight command.  
" For example,
" 	:hi Cursor
" gives
"	Cursor         xxx guifg=bg guibg=fg 
 	
" Uncomment and complete the commands you want to change from the default.

"hi Cursor		
"hi CursorIM	
"hi Directory	
"hi DiffAdd		
"hi DiffChange	
"hi DiffDelete	
"hi DiffText	
"hi ErrorMsg	
"hi VertSplit	
"hi Folded		
"hi FoldColumn	
"hi IncSearch	
"hi LineNr		
"hi ModeMsg		
"hi MoreMsg		
"hi NonText		
"hi Question	
"hi Search		
"hi SpecialKey	
"hi StatusLine	
"hi StatusLineNC	
"hi Title		
"hi Visual		
"hi VisualNOS	
"hi WarningMsg	
"hi WildMenu	
"hi Menu		
"hi Scrollbar	
"hi Tooltip		

" syntax highlighting groups
"hi Comment
"hi Constant	
"hi Identifier	
"hi Statement	
"hi PreProc	
"hi Type		
"hi Special	
"hi Underlined	
"hi Ignore		
"hi Error		
"hi Todo		

