$PBExportHeader$w_tras_pend_asig.srw
forward
global type w_tras_pend_asig from window
end type
type st_1 from statictext within w_tras_pend_asig
end type
type dw_1 from datawindow within w_tras_pend_asig
end type
end forward

global type w_tras_pend_asig from window
integer width = 3141
integer height = 1304
boolean titlebar = true
string title = "Traslados Pendientes de Asignar"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_1 dw_1
end type
global w_tras_pend_asig w_tras_pend_asig

on w_tras_pend_asig.create
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.dw_1}
end on

on w_tras_pend_asig.destroy
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;dw_1.Retrieve()

end event

type st_1 from statictext within w_tras_pend_asig
integer x = 73
integer y = 1152
integer width = 827
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Doble click para seleccionar y llevar"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_tras_pend_asig
integer x = 46
integer y = 56
integer width = 3054
integer height = 1076
integer taborder = 10
string title = "none"
string dataobject = "dw_traslados_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event doubleclicked;if row < 1 then Return 0
st_asigna_resp st_p
st_p.coddoc = GetItemString(GetRow(),'coddoc')
st_p.clugar = GetItemString(GetRow(),'clugar')
st_p.numdoc = GetItemNumber(GetRow(),'numdoc')
st_p.item = GetItemNumber(GetRow(),'item')
st_p.codarticulo = GetItemString(GetRow(),'codarticulo')
st_p.codalmacen = GetItemString(GetRow(),'codalmacen')
st_p.codalmacen_target = GetItemString(GetRow(),'codalmacen_target')
st_p.cantidad = GetItemNumber(GetRow(),'cantidad')

Message.PowerObjectParm = st_p
//w_af_respon.PostEvent (Open!)

end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)

end event

