$PBExportHeader$uo_num.sru
forward
global type uo_num from userobject
end type
type st_2 from statictext within uo_num
end type
type em_1 from editmask within uo_num
end type
type st_1 from statictext within uo_num
end type
end forward

global type uo_num from userobject
integer width = 1742
integer height = 108
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
st_2 st_2
em_1 em_1
st_1 st_1
end type
global uo_num uo_num

type variables
st_uobject st_p
Boolean changed = FALSE
long pos

end variables

forward prototypes
public subroutine setlabel (string texto)
public subroutine setunits (string texto)
public function decimal getvalue ()
end prototypes

public subroutine setlabel (string texto);st_1.Text = texto

end subroutine

public subroutine setunits (string texto);st_2.Text = Texto

end subroutine

public function decimal getvalue ();decimal valor
em_1.GetData(valor)
Return valor

end function

on uo_num.create
this.st_2=create st_2
this.em_1=create em_1
this.st_1=create st_1
this.Control[]={this.st_2,&
this.em_1,&
this.st_1}
end on

on uo_num.destroy
destroy(this.st_2)
destroy(this.em_1)
destroy(this.st_1)
end on

event constructor;st_p = Message.PowerObjectParm

if not isValid(st_p) then Return
em_1.Text = string(st_p.dValor)

end event

type st_2 from statictext within uo_num
integer x = 1266
integer y = 16
integer width = 343
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

type em_1 from editmask within uo_num
integer x = 905
integer y = 4
integer width = 338
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
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

type st_1 from statictext within uo_num
integer y = 12
integer width = 850
integer height = 64
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

