$PBExportHeader$uo_fec.sru
forward
global type uo_fec from userobject
end type
type em_1 from editmask within uo_fec
end type
type st_1 from statictext within uo_fec
end type
end forward

global type uo_fec from userobject
integer width = 1742
integer height = 108
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
em_1 em_1
st_1 st_1
end type
global uo_fec uo_fec

type variables
st_uobject st_p
Boolean changed = FALSE
long pos

end variables

forward prototypes
public subroutine setlabel (string texto)
public function datetime getvalue ()
end prototypes

public subroutine setlabel (string texto);st_1.Text = texto

end subroutine

public function datetime getvalue ();datetime valor
em_1.GetData(valor)
Return valor

end function

on uo_fec.create
this.em_1=create em_1
this.st_1=create st_1
this.Control[]={this.em_1,&
this.st_1}
end on

on uo_fec.destroy
destroy(this.em_1)
destroy(this.st_1)
end on

event constructor;st_p = Message.PowerObjectParm

if not isValid(st_p) then Return
em_1.Text = string(st_p.fecha,'dd/mm/yyyy hh:mm')

end event

type em_1 from editmask within uo_fec
integer x = 905
integer y = 4
integer width = 567
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
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
boolean spin = true
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

type st_1 from statictext within uo_fec
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

