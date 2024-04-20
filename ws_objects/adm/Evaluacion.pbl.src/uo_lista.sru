$PBExportHeader$uo_lista.sru
forward
global type uo_lista from userobject
end type
type dw_1 from datawindow within uo_lista
end type
type st_1 from statictext within uo_lista
end type
end forward

global type uo_lista from userobject
integer width = 1221
integer height = 236
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
st_1 st_1
end type
global uo_lista uo_lista

type variables
st_uobject st_p
Boolean changed = FALSE
long pos
end variables

forward prototypes
public function integer getvalue ()
public function string gettext ()
public subroutine setitem (string texto)
public subroutine setlabel (string texto)
end prototypes

public function integer getvalue ();Return dw_1.GetItemNumber(1,'item')

end function

public function string gettext ();Return dw_1.GetText()

end function

public subroutine setitem (string texto);String modifica, ret

modifica = "item.values='" + Texto + "'"
dw_1.Modify(modifica)

end subroutine

public subroutine setlabel (string texto);st_1.Text = Texto

end subroutine

on uo_lista.create
this.dw_1=create dw_1
this.st_1=create st_1
this.Control[]={this.dw_1,&
this.st_1}
end on

on uo_lista.destroy
destroy(this.dw_1)
destroy(this.st_1)
end on

event constructor;st_p = Message.PowerObjectParm

dw_1.InsertRow(0)
if not isValid(st_p) then Return
dw_1.SetItem(1,'item',st_p.dValor)

end event

type dw_1 from datawindow within uo_lista
integer x = 73
integer y = 104
integer width = 983
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_formlista"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;changed = TRUE

end event

event getfocus;w_formulario wt
wt = f_vent_padre(this)
if parent.y + 400 > wt.Height then
	wt.vsb_1.Event moved(pos - 300)
end if
Return 0

end event

type st_1 from statictext within uo_lista
integer x = 14
integer y = 20
integer width = 1175
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

