: IMMEDIATE
  save_lw @ cfa 1 - dup c@ 1 or swap c!
;

: if
  ' branchifz , here 0 ,
; IMMEDIATE

: else
  ' branch , here 0 , swap here swap !
; IMMEDIATE

: then
  here swap !
; IMMEDIATE

: greatest
  dup rot swap dup rot
  > if
    drop .
  else
    . drop
  then
;

: repeat
  here
; IMMEDIATE

: until
  ' branchifz , ,
; IMMEDIATE

: dub_over >r dup r> swap >r dup r> swap ;

: for
  ' swap , ' >r , ' >r ,
  here ' r> , ' r> ,
  ' dub_over , ' >r , ' >r , ' < ,
  ' branchifz ,
  here 0 , swap
; IMMEDIATE

: endfor
  ' r> , ' lit , 1 , ' + , ' >r ,
  ' branch , , here swap ! ' r> ,
  ' drop , ' r> , ' drop ,
;  IMMEDIATE
