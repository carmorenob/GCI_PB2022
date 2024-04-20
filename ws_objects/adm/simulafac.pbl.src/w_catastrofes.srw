$PBExportHeader$w_catastrofes.srw
forward
global type w_catastrofes from window
end type
type pb_5 from picturebutton within w_catastrofes
end type
type pb_4 from picturebutton within w_catastrofes
end type
type pb_3 from picturebutton within w_catastrofes
end type
type pb_2 from picturebutton within w_catastrofes
end type
type pb_1 from picturebutton within w_catastrofes
end type
type dw_2 from datawindow within w_catastrofes
end type
type dw_1 from datawindow within w_catastrofes
end type
end forward

global type w_catastrofes from window
integer width = 1801
integer height = 1832
boolean titlebar = true
string title = "Escoger Evento Catastrofico"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "StopSign!"
boolean clientedge = true
boolean center = true
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
dw_1 dw_1
end type
global w_catastrofes w_catastrofes

type variables
datawindowchild dw_ciudad
end variables

on w_catastrofes.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_2,&
this.dw_1}
end on

on w_catastrofes.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;if message.stringparm='nuevo' then return
trae trae1
trae1=message.powerobjectparm
dw_1.scrolltorow(dw_1.find('ncatastrofe='+string(trae1.numero)+" and clugar='"+trae1.lugar+"'",1,dw_1.rowcount()))

end event

type pb_5 from picturebutton within w_catastrofes
integer x = 1600
integer y = 964
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;closewithreturn(parent,'!')
end event

type pb_4 from picturebutton within w_catastrofes
integer x = 1595
integer y = 788
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if pb_3.event clicked()=-1 then return
if isnull(dw_2.getitemnumber(1,'ncatastrofe')) then return
trae trae2
trae2.numero=dw_2.getitemnumber(1,'ncatastrofe')
trae2.lugar=dw_2.getitemstring(1,'clugar')
closewithreturn(parent,trae2)
end event

type pb_3 from picturebutton within w_catastrofes
integer x = 1591
integer y = 472
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar Evento Catastrófico"
end type

event clicked;dw_1.accepttext()
if isnull(dw_1.getitemstring(dw_1.getrow(),'sitio')) or trim(dw_1.getitemstring(dw_1.getrow(),'sitio'))='' then
	messagebox('Atención','Debe digitar el Sitio del evento')
	return -1
end if
if isnull(dw_2.getitemstring(1,'zona')) or trim(dw_2.getitemstring(1,'zona'))='' then
	messagebox('Atención','Debe digitar la zona del evento')
	return -1
end if
if isnull(dw_2.getitemstring(1,'informe')) or trim(dw_2.getitemstring(1,'informe'))='' then
	messagebox('Atención','Debe digitar el informe del evento')
	return -1
end if
if isnull(dw_1.getitemnumber(1,'ncatastrofe')) then
	long ncatas
	setnull(ncatas)
	select max(ncatastrofe) into :ncatas from catastrofe where clugar=:clugar;
	if isnull(ncatas) then ncatas=0
	ncatas++
	dw_2.setitem(1,'ncatastrofe',ncatas)
	dw_2.setitem(1,'clugar',clugar)
end if
dw_2.setitem(1,'sitio',dw_1.getitemstring(dw_1.getrow(),'sitio'))
dw_2.setitem(1,'fecha',dw_1.getitemdatetime(dw_1.getrow(),'fecha'))
dw_2.accepttext()
if dw_2.update()=-1 then
	rollback;
	return -1
end if
commit;
return 1
end event

type pb_2 from picturebutton within w_catastrofes
integer x = 1591
integer y = 336
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Registro"
end type

event clicked;dw_1.deleterow(0)
if dw_1.update()=-1 then
	rollback;
else
	commit;
end if
end event

type pb_1 from picturebutton within w_catastrofes
integer x = 1591
integer y = 200
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Nuevo Evento Catastrofico"
end type

event clicked;dw_1.scrolltorow(1)
dw_1.insertrow(1)
dw_1.scrolltorow(1)
dw_2.insertrow(1)
dw_1.setfocus()
end event

type dw_2 from datawindow within w_catastrofes
integer x = 27
integer y = 480
integer width = 1545
integer height = 1216
integer taborder = 20
string title = "none"
string dataobject = "dw_cpo_catas"
boolean border = false
boolean livescroll = true
end type

event constructor;this.getchild('codciudad',dw_ciudad)
dw_ciudad.settransobject(sqlca)
dw_ciudad.insertrow(1)
this.settransobject(sqlca)
end event

event itemchanged;this.accepttext()
if this.getcolumnname()='cdepto' then
	this.setitem(1,'codciudad','')
	dw_ciudad.retrieve(this.getitemstring(1,'cdepto'))
end if
end event

event retrieveend;if rowcount=0 then return
dw_ciudad.retrieve(this.getitemstring(1,'cdepto'))
end event

type dw_1 from datawindow within w_catastrofes
integer x = 37
integer y = 40
integer width = 1522
integer height = 424
integer taborder = 10
string title = "none"
string dataobject = "dw_cab_catas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
this.retrieve()
end event

event rowfocuschanged;if this.getrow()<1 then return
dw_2.retrieve(this.getitemnumber(this.getrow(),1),this.getitemstring(this.getrow(),2))
end event

event itemchanged;this.accepttext()
end event

event rowfocuschanging;if isnull(this.getitemnumber(1,'ncatastrofe')) and currentrow<>0 then return 1
end event

