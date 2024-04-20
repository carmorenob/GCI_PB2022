$PBExportHeader$uo_sle.sru
forward
global type uo_sle from userobject
end type
type st_1 from statictext within uo_sle
end type
type sle_1 from singlelineedit within uo_sle
end type
end forward

global type uo_sle from userobject
integer width = 2249
integer height = 184
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_1 st_1
sle_1 sle_1
end type
global uo_sle uo_sle

type variables
st_uobject st_p
Boolean changed = FALSE
long pos

end variables

forward prototypes
public subroutine settext (string texto)
public subroutine setlabel (string texto)
public function string getvalue ()
end prototypes

public subroutine settext (string texto);sle_1.Text = Texto

end subroutine

public subroutine setlabel (string texto);st_1.Text = Texto

end subroutine

public function string getvalue ();Return sle_1.Text

end function

on uo_sle.create
this.st_1=create st_1
this.sle_1=create sle_1
this.Control[]={this.st_1,&
this.sle_1}
end on

on uo_sle.destroy
destroy(this.st_1)
destroy(this.sle_1)
end on

event constructor;st_p = Message.PowerObjectParm
if not isValid(st_p) then Return
sle_1.Text = st_p.sValor

end event

type st_1 from statictext within uo_sle
integer x = 23
integer y = 20
integer width = 1842
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within uo_sle
integer x = 5
integer y = 96
integer width = 2222
integer height = 72
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;changed = TRUE
end event

event getfocus;w_formulario wt
wt = f_vent_padre(this)
if parent.y + 400 > wt.Height then
	wt.vsb_1.Event moved(pos - 300)
end if
Return 0

end event

