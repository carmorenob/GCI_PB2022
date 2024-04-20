$PBExportHeader$w_cotizaciones.srw
forward
global type w_cotizaciones from window
end type
type pb_3 from picturebutton within w_cotizaciones
end type
type st_2 from statictext within w_cotizaciones
end type
type st_1 from statictext within w_cotizaciones
end type
type pb_2 from pb_report within w_cotizaciones
end type
type pb_1 from picturebutton within w_cotizaciones
end type
type dw_cpo from datawindow within w_cotizaciones
end type
type dw_cab from datawindow within w_cotizaciones
end type
end forward

global type w_cotizaciones from window
integer width = 2871
integer height = 1488
boolean titlebar = true
string title = "Revisar Cotizaciones de Tratamiento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "rec_caja.ico"
boolean clientedge = true
boolean center = true
pb_3 pb_3
st_2 st_2
st_1 st_1
pb_2 pb_2
pb_1 pb_1
dw_cpo dw_cpo
dw_cab dw_cab
end type
global w_cotizaciones w_cotizaciones

type variables
datawindow idw_serv
long i_ntrat
string i_clug_trat,i_cambios='no'
end variables

event open;idw_serv=message.powerobjectparm
if idw_serv.rowcount()=0 then
	close(this)
	return
end if
i_ntrat=idw_serv.getitemnumber(1,'ntratamiento')
i_clug_trat=idw_serv.getitemstring(1,'clugar')
dw_cab.retrieve(i_ntrat,i_clug_trat)
end event

on w_cotizaciones.create
this.pb_3=create pb_3
this.st_2=create st_2
this.st_1=create st_1
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_cpo=create dw_cpo
this.dw_cab=create dw_cab
this.Control[]={this.pb_3,&
this.st_2,&
this.st_1,&
this.pb_2,&
this.pb_1,&
this.dw_cpo,&
this.dw_cab}
end on

on w_cotizaciones.destroy
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_cpo)
destroy(this.dw_cab)
end on

event close;closewithreturn(this,i_cambios)
end event

type pb_3 from picturebutton within w_cotizaciones
integer x = 2441
integer y = 380
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "puerta.gif"
alignment htextalign = left!
string powertiptext = "Salir"
end type

event clicked;close(parent)
end event

type st_2 from statictext within w_cotizaciones
integer x = 87
integer y = 560
integer width = 535
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la Cotización:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cotizaciones
integer x = 78
integer y = 12
integer width = 910
integer height = 48
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cotizaciones del Tratamiento Nro:"
boolean focusrectangle = false
end type

type pb_2 from pb_report within w_cotizaciones
integer x = 2441
integer y = 224
integer taborder = 30
string text = "       &r"
string powertiptext = "Reimprimir Cotización [Alt+R]"
string cod_rep = "COT"
string nombre_rep = "Cotización de Servicios"
string tipo_rep = "documento!"
end type

event clicked;call super::clicked;if dw_cab.rowcount()=0 then return
any par[2]
par[1]=dw_cab.getitemnumber(dw_cab.getrow(),'ncotiza')
par[2]=dw_cab.getitemstring(dw_cab.getrow(),'clugar')
imprimir(par,'','0')
end event

type pb_1 from picturebutton within w_cotizaciones
integer x = 2437
integer y = 80
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &a"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Anular Cotización [Alt+A]"
end type

event clicked;if dw_cab.rowcount()=0 then return
if not isnull(dw_cab.getitemstring(dw_cab.getrow(),'estado')) then
	messagebox("Atención",'Esta cotización ya se encuentra anulada')
	return
end if
if messagebox("Atención",'Está seguro que desea anular esta cotización ?',question!,yesno!,2)=2 then return
dw_cab.setitem(dw_cab.getrow(),'estado',usuario)
dw_cab.setitem(dw_cab.getrow(),'fecha_anula',datetime(today(),now()))
if dw_cab.update()= -1 then
	rollback;
	dw_cab.retrieve(i_ntrat,i_clug_trat)
	return
end if
long ncot
ncot=dw_cab.getitemnumber(dw_cab.getrow(),'ncotiza')
update odontratacpo set ncotiza=null , clugar_cot=null , nitem_cot=null
where ntratamiento=:i_ntrat and clugar=:i_clug_trat and ncotiza=:ncot;
if sqlca.sqlcode=-1 then
	messagebox("Error actualizando OdontrataCpo",sqlca.sqlerrtext)
	rollback;
	dw_cab.retrieve(i_ntrat,i_clug_trat)
	return
end if
commit;
i_cambios='si'
end event

type dw_cpo from datawindow within w_cotizaciones
integer x = 73
integer y = 616
integer width = 2697
integer height = 716
integer taborder = 20
string title = "none"
string dataobject = "dw_cotiza_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_cab from datawindow within w_cotizaciones
integer x = 69
integer y = 72
integer width = 2345
integer height = 464
integer taborder = 10
string title = "none"
string dataobject = "dw_cotiza_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;dw_cpo.retrieve(getitemnumber(getrow(),'ncotiza'),getitemstring(getrow(),'clugar'))
end event

