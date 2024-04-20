$PBExportHeader$uo_selec.sru
forward
global type uo_selec from userobject
end type
type cbx_1 from checkbox within uo_selec
end type
end forward

global type uo_selec from userobject
integer width = 1038
integer height = 80
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cbx_1 cbx_1
end type
global uo_selec uo_selec

type variables
Boolean changed = FALSE
st_uobject st_p
long pos
end variables

forward prototypes
public subroutine setlabel (string texto)
public function string getvalue ()
end prototypes

public subroutine setlabel (string texto);cbx_1.Text = Texto

end subroutine

public function string getvalue ();string ret
if cbx_1.Checked then
	ret = '1'
else
	ret = '0'
end if

Return ret

end function

on uo_selec.create
this.cbx_1=create cbx_1
this.Control[]={this.cbx_1}
end on

on uo_selec.destroy
destroy(this.cbx_1)
end on

event constructor;st_p = Message.PowerObjectParm
if not isValid(st_p) then Return
if st_p.sValor = '1' then
	cbx_1.Checked = TRUE
elseif st_p.sValor = '0' then
	cbx_1.Checked = FALSE
end if

end event

type cbx_1 from checkbox within uo_selec
integer x = 9
integer width = 1033
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

event clicked;changed = TRUE

end event

event getfocus;w_formulario wt
wt = f_vent_padre(this)
if parent.y + 400 > wt.Height then
	wt.vsb_1.Event moved(pos - 300)
end if
Return 0

end event

