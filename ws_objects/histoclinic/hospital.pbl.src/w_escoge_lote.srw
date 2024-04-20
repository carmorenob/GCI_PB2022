$PBExportHeader$w_escoge_lote.srw
forward
global type w_escoge_lote from window
end type
type st_1 from statictext within w_escoge_lote
end type
type pb_cancel from picturebutton within w_escoge_lote
end type
type pb_ok from picturebutton within w_escoge_lote
end type
type dw_1 from datawindow within w_escoge_lote
end type
end forward

global type w_escoge_lote from window
integer width = 3397
integer height = 1384
boolean titlebar = true
string title = "Escoger Lotes de Medicamento"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
end type
global w_escoge_lote w_escoge_lote

type variables
st_lotes st_lote
end variables

on w_escoge_lote.create
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.pb_cancel,&
this.pb_ok,&
this.dw_1}
end on

on w_escoge_lote.destroy
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
end on

event open;st_lote=message.powerobjectparm
st_1.text=string(st_lote.cant)
if g_motor='postgres' then
	dw_1.dataobject='dw_escoge_lote_postgres'
elseif g_motor='sql' then
	dw_1.dataobject='dw_escoge_lote_sqlserver'
else
	dw_1.dataobject='dw_escoge_lote'
end if
dw_1.settransobject(sqlca)
dw_1.retrieve(st_lote.cmedica,st_lote.alm)


double l_control
if  st_lote.cdoc<>'FC' and st_lote.cdoc<>'FV' then 
	///Verifica ingreso control
	SELECT OSCuerpo.solicitada - OSCuerpo.entregada - OSCuerpo.devuelta into :l_control
	FROM OSCuerpo
	WHERE (((OSCuerpo.Contador)=:st_lote.contador_os) 
	AND ((OSCuerpo.clugar)=:st_lote.clugar_os) 
	AND ((OSCuerpo.NSolicitud)=:st_lote.nsolicitud_os) 
	AND ((OSCuerpo.Item)=:st_lote.item_os));
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo Oscuerpo para verificar control",sqlca.sqlerrtext)
		return 
	end if
	if l_control <= 0 then
		messagebox("Leyendo Control",'Error ya entregado')
		return 
	end if
End if

long j,acumul
acumul=st_lote.cant
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'vencido')>0 then
		if dw_1.getitemnumber(j,'cantidad')>acumul then
			dw_1.setitem(j,'llevar',acumul)
			exit
		else
			dw_1.setitem(j,'llevar',dw_1.getitemnumber(j,'cantidad'))
			acumul -=dw_1.getitemnumber(j,'cantidad')
		end if
	end if
next
end event

type st_1 from statictext within w_escoge_lote
integer x = 2944
integer width = 352
integer height = 96
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 67108864
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_escoge_lote
integer x = 1605
integer y = 1120
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
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_escoge_lote
integer x = 1445
integer y = 1120
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
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
dw_1.accepttext()
if dw_1.getitemdatetime(dw_1.getrow(),'fecha_venc')<datetime(date(Today()),time('00:00')) then
	messagebox("Error",'Medicamento vencido')
	return
end if
if dw_1.getitemnumber(1,'total')<>st_lote.cant then
	messagebox('Atención','La cantidad a entregar es diferente a la solicitada, revise para poder continuar')
	return
end if

if  st_lote.cdoc<>'FC' and st_lote.cdoc<>'FV' then 
	double l_control
	///Verifica ingreso control
	SELECT OSCuerpo.solicitada - OSCuerpo.entregada - OSCuerpo.devuelta into :l_control
	FROM OSCuerpo
	WHERE (((OSCuerpo.Contador)=:st_lote.contador_os) 
	AND ((OSCuerpo.clugar)=:st_lote.clugar_os) 
	AND ((OSCuerpo.NSolicitud)=:st_lote.nsolicitud_os) 
	AND ((OSCuerpo.Item)=:st_lote.item_os));
	if sqlca.sqlcode=-1 then
		messagebox("Error leyendo Oscuerpo para verificar control",sqlca.sqlerrtext)
		return 
	end if
	if l_control <= 0 then
		messagebox("Leyendo Control",'Error ya entregado')
		return 
	end if
end if


long j,donde
//st_lote.dw_lote_mov.setfilter('item='+string(st_lote.item)+' and secuencia='+string(st_lote.secuencia))
st_lote.dw_lote_mov.setfilter('item='+string(st_lote.item)+' and contador_os='+string(st_lote.contador_os)+' and clugar_os='+"'"+st_lote.clugar_os+"'"+' and nsolicitud_os='+string(st_lote.nsolicitud_os)+' and item_os='+string(st_lote.item_os))
st_lote.dw_lote_mov.filter()
do while st_lote.dw_lote_mov.rowcount()>0 
	st_lote.dw_lote_mov.deleterow(0)
loop
st_lote.dw_lote_mov.setfilter('')
st_lote.dw_lote_mov.filter()
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'llevar')>0 then
		donde=st_lote.dw_lote_mov.insertrow(0)
		st_lote.dw_lote_mov.setitem(donde,'codalmacen',st_lote.alm)
		st_lote.dw_lote_mov.setitem(donde,'codarticulo',dw_1.getitemstring(j,'codarticulo'))
		st_lote.dw_lote_mov.setitem(donde,'fecha_venc',dw_1.getitemdatetime(j,'fecha_venc'))
		st_lote.dw_lote_mov.setitem(donde,'vprom',dw_1.getitemnumber(j,'costoprom'))
		st_lote.dw_lote_mov.setitem(donde,'convenio',dw_1.getitemstring(j,'convenio'))
		st_lote.dw_lote_mov.setitem(donde,'lote',dw_1.getitemstring(j,'lote'))
		st_lote.dw_lote_mov.setitem(donde,'coddoc',st_lote.cdoc)
		st_lote.dw_lote_mov.setitem(donde,'clugar',st_lote.clug)
		st_lote.dw_lote_mov.setitem(donde,'item',st_lote.item)
		st_lote.dw_lote_mov.setitem(donde,'secuencia',st_lote.secuencia)
		st_lote.dw_lote_mov.setitem(donde,'cantidad',dw_1.getitemnumber(j,'llevar'))
		st_lote.dw_lote_mov.setitem(donde,'estado','1')//definitivo
		st_lote.dw_lote_mov.setitem(donde,'signo',-1)
		st_lote.dw_lote_mov.setitem(donde,'cmedica',st_lote.cmedica)
		st_lote.dw_lote_mov.setitem(donde,'contador_os',st_lote.contador_os)
		st_lote.dw_lote_mov.setitem(donde,'clugar_os',st_lote.clugar_os)
		st_lote.dw_lote_mov.setitem(donde,'nsolicitud_os',st_lote.nsolicitud_os)
		st_lote.dw_lote_mov.setitem(donde,'item_os',st_lote.item_os)
	end if
next
close(parent)
end event

type dw_1 from datawindow within w_escoge_lote
integer width = 3333
integer height = 1092
integer taborder = 10
string title = "none"
string dataobject = "dw_escoge_lote"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

