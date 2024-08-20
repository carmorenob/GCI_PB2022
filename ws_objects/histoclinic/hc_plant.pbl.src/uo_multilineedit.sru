$PBExportHeader$uo_multilineedit.sru
forward
global type uo_multilineedit from multilineedit
end type
end forward

global type uo_multilineedit from multilineedit
integer width = 1147
integer height = 500
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
event control_paste pbm_keydown
event click_contrario pbm_rbuttondown
end type
global uo_multilineedit uo_multilineedit

type variables
boolean ibn_permite_pegar=false
end variables

event control_paste;if ibn_permite_pegar=true then return
if keyflags=2 then
	if key=keyv! then
		clipboard('')
		this.paste()
	end if
end if
if keyflags=1 then
	if key=keyinsert! then
		clipboard('')
		this.paste()
	end if
end if
end event

event click_contrario;if ibn_permite_pegar=true then return
clipboard('')
end event

on uo_multilineedit.create
end on

on uo_multilineedit.destroy
end on

