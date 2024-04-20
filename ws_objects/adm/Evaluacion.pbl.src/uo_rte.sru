$PBExportHeader$uo_rte.sru
forward
global type uo_rte from userobject
end type
type cbx_1 from checkbox within uo_rte
end type
type st_1 from statictext within uo_rte
end type
type rte_1 from richtextedit within uo_rte
end type
end forward

global type uo_rte from userobject
integer width = 2816
integer height = 708
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cbx_1 cbx_1
st_1 st_1
rte_1 rte_1
end type
global uo_rte uo_rte

type variables
st_uobject st_p
Boolean changed = FALSE, importa = FALSE
long pos
Private boolean i_cambia_rte=false

end variables

forward prototypes
public subroutine setlabel (string texto)
public function integer settext (string texto)
end prototypes

public subroutine setlabel (string texto);st_1.Text = Texto
end subroutine

public function integer settext (string texto);rte_1.SelectTextAll()
rte_1.PasteRTF(texto)

Return 0

end function

on uo_rte.create
this.cbx_1=create cbx_1
this.st_1=create st_1
this.rte_1=create rte_1
this.Control[]={this.cbx_1,&
this.st_1,&
this.rte_1}
end on

on uo_rte.destroy
destroy(this.cbx_1)
destroy(this.st_1)
destroy(this.rte_1)
end on

event constructor;string texto
blob memo
st_p = Message.PowerObjectParm

end event

type cbx_1 from checkbox within uo_rte
boolean visible = false
integer x = 2386
integer y = 636
integer width = 402
integer height = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "Importante"
end type

event clicked;if checked then
	importa = TRUE
else
	importa = FALSE
end if

end event

event constructor;if st_p.DisplayOnly then
	Visible = FALSE
	Enabled = FALSE
end if

end event

type st_1 from statictext within uo_rte
integer x = 37
integer y = 8
integer width = 1637
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

type rte_1 from richtextedit within uo_rte
integer x = 32
integer y = 72
integer width = 2734
integer height = 556
integer taborder = 10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event modified;changed = TRUE

end event

event getfocus;w_formulario wt
wt = f_vent_padre(this)
if parent.y + 300 > wt.Height then
	wt.vsb_1.Event moved(pos - 300)
end if
Return 0

end event

event key;if key = KeyTab! and keyflags = 0 then
	w_formulario wt
	wt = f_vent_padre(this)
	wt.changeFocus(parent.TabOrder)
	Return -1
end if

end event

