$PBExportHeader$w_act_econ.srw
forward
global type w_act_econ from window
end type
type st_2 from statictext within w_act_econ
end type
type pb_cancel from picturebutton within w_act_econ
end type
type pb_aceptar from picturebutton within w_act_econ
end type
type sle_1 from singlelineedit within w_act_econ
end type
type d_filtrar from dropdownlistbox within w_act_econ
end type
type st_1 from statictext within w_act_econ
end type
type dw_act_econ from datawindow within w_act_econ
end type
end forward

global type w_act_econ from window
integer width = 2994
integer height = 1232
boolean titlebar = true
string title = "Actividades Economicas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "abono.ico"
boolean center = true
st_2 st_2
pb_cancel pb_cancel
pb_aceptar pb_aceptar
sle_1 sle_1
d_filtrar d_filtrar
st_1 st_1
dw_act_econ dw_act_econ
end type
global w_act_econ w_act_econ

type variables
datawindow dw_tmp

end variables

forward prototypes
public subroutine filtrar ()
end prototypes

public subroutine filtrar ();choose case d_filtrar.text
	case "CODIGO"
		dw_act_econ.setfilter("codactecono like '"+trim(sle_1.text)+"%'")
	case "DESCRIPCION"
		dw_act_econ.setfilter("lower(descripcion) like '"+lower(trim(sle_1.text))+"%'")
end choose
dw_act_econ.filter()
dw_act_econ.sort()
st_2.text=string(dw_act_econ.rowcount())+' Registro(s)'
end subroutine

event open;dw_tmp = Message.PowerObjectParm
dw_act_econ.SetTransObject(SQLCA)
dw_act_econ.Retrieve()
sle_1.setfocus()
end event

on w_act_econ.create
this.st_2=create st_2
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.sle_1=create sle_1
this.d_filtrar=create d_filtrar
this.st_1=create st_1
this.dw_act_econ=create dw_act_econ
this.Control[]={this.st_2,&
this.pb_cancel,&
this.pb_aceptar,&
this.sle_1,&
this.d_filtrar,&
this.st_1,&
this.dw_act_econ}
end on

on w_act_econ.destroy
destroy(this.st_2)
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.sle_1)
destroy(this.d_filtrar)
destroy(this.st_1)
destroy(this.dw_act_econ)
end on

type st_2 from statictext within w_act_econ
integer x = 1970
integer y = 980
integer width = 960
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_act_econ
integer x = 1445
integer y = 980
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_act_econ
integer x = 1294
integer y = 980
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_act_econ.triggerevent(doubleclicked!)
//close(parent)
end event

type sle_1 from singlelineedit within w_act_econ
event teclear pbm_keyup
integer x = 887
integer y = 28
integer width = 2021
integer height = 88
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event teclear;filtrar()
end event

type d_filtrar from dropdownlistbox within w_act_econ
integer x = 338
integer y = 36
integer width = 480
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
string item[] = {"CODIGO","DESCRIPCION"}
borderstyle borderstyle = stylelowered!
end type

event constructor;this.text="DESCRIPCION"
end event

type st_1 from statictext within w_act_econ
integer x = 55
integer y = 48
integer width = 274
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtrar por:"
boolean focusrectangle = false
end type

type dw_act_econ from datawindow within w_act_econ
integer x = 73
integer y = 148
integer width = 2857
integer height = 816
integer taborder = 20
string title = "none"
string dataobject = "dw_act_econ"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event doubleclicked;if this.getrow() < 1 then return
if isvalid(dw_tmp) then
	if not isnull(sle_1.text) then
		dw_tmp.setItem(dw_tmp.GetRow(),'activiecono',this.getItemString(this.getrow(),'codactecono'))
		dw_tmp.setItem(dw_tmp.GetRow(),'descripcion',this.getItemString(this.getrow(),'descripcion'))
	end if
end if
close(parent)
end event

