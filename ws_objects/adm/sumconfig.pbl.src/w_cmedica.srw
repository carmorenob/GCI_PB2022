$PBExportHeader$w_cmedica.srw
forward
global type w_cmedica from window
end type
type dw_cmedica from datawindow within w_cmedica
end type
end forward

global type w_cmedica from window
integer width = 2469
integer height = 816
boolean titlebar = true
string title = "Código Medicamento"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "entrega_med.ico"
dw_cmedica dw_cmedica
end type
global w_cmedica w_cmedica

type variables
DataWindow dw_tmp

end variables

on w_cmedica.create
this.dw_cmedica=create dw_cmedica
this.Control[]={this.dw_cmedica}
end on

on w_cmedica.destroy
destroy(this.dw_cmedica)
end on

event open;dw_tmp = Message.PowerObjectParm
dw_cmedica.SetTransObject(SQLCA)
dw_cmedica.Retrieve()

end event

type dw_cmedica from datawindow within w_cmedica
integer x = 41
integer y = 64
integer width = 2345
integer height = 588
integer taborder = 10
string title = "none"
string dataobject = "dw_cmedica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.getrow() < 1 then return

if isvalid(dw_tmp) then
	dw_tmp.setItem(dw_tmp.GetRow(),'c_medica',this.getItemString(this.getrow(),'c_medica'))
	close(parent)
end if

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

