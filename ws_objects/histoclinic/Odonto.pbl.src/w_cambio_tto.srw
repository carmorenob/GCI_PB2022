$PBExportHeader$w_cambio_tto.srw
forward
global type w_cambio_tto from window
end type
type dw_qxcpo from datawindow within w_cambio_tto
end type
type dw_qxcab from datawindow within w_cambio_tto
end type
type dw_empac from datawindow within w_cambio_tto
end type
type pb_1 from picturebutton within w_cambio_tto
end type
type cb_aceptar from picturebutton within w_cambio_tto
end type
type dw_activos from datawindow within w_cambio_tto
end type
type gb_1 from groupbox within w_cambio_tto
end type
type gb_2 from groupbox within w_cambio_tto
end type
end forward

global type w_cambio_tto from window
integer width = 3264
integer height = 1244
boolean titlebar = true
string title = "Cambiar Empresa Responsable del Tratamiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "cambia_doc.ico"
boolean clientedge = true
boolean center = true
dw_qxcpo dw_qxcpo
dw_qxcab dw_qxcab
dw_empac dw_empac
pb_1 pb_1
cb_aceptar cb_aceptar
dw_activos dw_activos
gb_1 gb_1
gb_2 gb_2
end type
global w_cambio_tto w_cambio_tto

type variables
string clugar_tto
long nro_tto
st_historial st_os
end variables

on w_cambio_tto.create
this.dw_qxcpo=create dw_qxcpo
this.dw_qxcab=create dw_qxcab
this.dw_empac=create dw_empac
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.dw_activos=create dw_activos
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.dw_qxcpo,&
this.dw_qxcab,&
this.dw_empac,&
this.pb_1,&
this.cb_aceptar,&
this.dw_activos,&
this.gb_1,&
this.gb_2}
end on

on w_cambio_tto.destroy
destroy(this.dw_qxcpo)
destroy(this.dw_qxcab)
destroy(this.dw_empac)
destroy(this.pb_1)
destroy(this.cb_aceptar)
destroy(this.dw_activos)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;st_os = Message.PowerObjectParm
dw_activos.retrieve(st_os.contador,st_os.clugar)
end event

type dw_qxcpo from datawindow within w_cambio_tto
boolean visible = false
integer x = 343
integer y = 1024
integer width = 242
integer height = 88
integer taborder = 50
boolean enabled = false
string title = "none"
string dataobject = "dw_xa_cambiarempqx_cp"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_qxcab from datawindow within w_cambio_tto
boolean visible = false
integer x = 87
integer y = 1036
integer width = 178
integer height = 92
integer taborder = 40
boolean enabled = false
string title = "none"
string dataobject = "dw_xa_cambiarempqx"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_empac from datawindow within w_cambio_tto
integer x = 78
integer y = 504
integer width = 3077
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_empacguarda"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve(tipdoc,docu)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

type pb_1 from picturebutton within w_cambio_tto
integer x = 1335
integer y = 988
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_aceptar from picturebutton within w_cambio_tto
event mousemove pbm_mousemove
integer x = 1184
integer y = 988
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &a"
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if dw_activos.rowcount()<1 or dw_empac.rowcount()<1 then return
string newemp,newcont

//setnull(nulo)
newemp=dw_empac.getitemstring(dw_empac.getrow(),"codemp")
newcont=dw_empac.getitemstring(dw_empac.getrow(),"codcontrato")
if newemp<>dw_activos.getitemstring(dw_activos.getrow(),"cemp") or newcont<>dw_activos.getitemstring(dw_activos.getrow(),"ccontrato") then
	if messagebox("Atención","Está seguro que desea cabiar de responsable del tratamientop?",question!,yesno!,2)=2 then return
	dw_activos.setitem(dw_activos.getrow(),"cemp",newemp)
	dw_activos.setitem(dw_activos.getrow(),"ccontrato",newcont)
	if dw_activos.update()=-1 then
		rollback;
	end if
	messagebox("Atención","Se cambió la empresa responsable del tratamiento, los cambios se ven en el momento de facturar los servicios")
	commit;
	close(parent)
else
	messagebox("Atención","Eligió el mismo contrato y empresa original, esto no surtirtá efecto")
end if
end event

type dw_activos from datawindow within w_cambio_tto
integer x = 73
integer y = 104
integer width = 3067
integer height = 288
integer taborder = 20
string title = "none"
string dataobject = "dw_para_cambio_tto"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event doubleclicked;cb_aceptar.triggerevent(clicked!)
end event

type gb_1 from groupbox within w_cambio_tto
integer x = 41
integer y = 28
integer width = 3141
integer height = 404
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Empresa Activa"
end type

type gb_2 from groupbox within w_cambio_tto
integer x = 32
integer y = 436
integer width = 3145
integer height = 536
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 80269524
string text = "Nuevo Responsable del Tratamiento"
end type

