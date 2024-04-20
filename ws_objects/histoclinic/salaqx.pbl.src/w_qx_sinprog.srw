$PBExportHeader$w_qx_sinprog.srw
forward
global type w_qx_sinprog from window
end type
type pb_cancel from picturebutton within w_qx_sinprog
end type
type pb_aceptar from picturebutton within w_qx_sinprog
end type
type st_4 from statictext within w_qx_sinprog
end type
type st_2 from statictext within w_qx_sinprog
end type
type st_1 from statictext within w_qx_sinprog
end type
type dw_cir from datawindow within w_qx_sinprog
end type
type dw_cab from datawindow within w_qx_sinprog
end type
end forward

global type w_qx_sinprog from window
integer width = 5477
integer height = 1028
boolean titlebar = true
string title = "Actos Quirúrgicos del Paciente Pendientes de Atender"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "bisturi.ico"
boolean center = true
pb_cancel pb_cancel
pb_aceptar pb_aceptar
st_4 st_4
st_2 st_2
st_1 st_1
dw_cir dw_cir
dw_cab dw_cab
end type
global w_qx_sinprog w_qx_sinprog

type variables
datawindowchild l_idw_anestesiologos
end variables

on w_qx_sinprog.create
this.pb_cancel=create pb_cancel
this.pb_aceptar=create pb_aceptar
this.st_4=create st_4
this.st_2=create st_2
this.st_1=create st_1
this.dw_cir=create dw_cir
this.dw_cab=create dw_cab
this.Control[]={this.pb_cancel,&
this.pb_aceptar,&
this.st_4,&
this.st_2,&
this.st_1,&
this.dw_cir,&
this.dw_cab}
end on

on w_qx_sinprog.destroy
destroy(this.pb_cancel)
destroy(this.pb_aceptar)
destroy(this.st_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_cir)
destroy(this.dw_cab)
end on

event open;dw_cab.retrieve(tipdoc,docu)
end event

type pb_cancel from picturebutton within w_qx_sinprog
integer x = 4325
integer y = 204
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &c"
boolean cancel = true
boolean originalsize = true
string picturename = "Cancelar.gif"
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_aceptar from picturebutton within w_qx_sinprog
integer x = 4325
integer y = 48
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string powertiptext = "Aceptar y llevar a Sala [Alt+A]"
end type

event clicked;if dw_cir.rowcount()=0 then return
long nh,j,donde,ret,ningres
string tingre,clug_hadm
setnull(nh)
donde=w_new_sala_qx.dw_admi.find('estado="1"',1,w_new_sala_qx.dw_admi.rowcount())
if donde=0 then
	open(w_admi_ambu)
	nh=message.doubleparm
	if nh=-1 then return
	clug_hadm=clugar
else
	if w_new_sala_qx.dw_admi.getitemstring(donde,'codtingre')<>'4' then
		messagebox("Atención","Este paciente tiene una admisión diferente a ambulatoria activa, debe cerrarla primero para continuar")
		return
	end if
	nh=w_new_sala_qx.dw_admi.getitemnumber(donde,'nh')
	clug_hadm=w_new_sala_qx.dw_admi.getitemstring(donde,'clugar')
	ret =  messagebox("Atencíon",'El paciente tiene la Admisión Ambulatoria: '+string(nh)+'  Activa. El acto Qx se cargará a esta admisión.~r Desea continuar ?',question!,yesnocancel!)
	if ret =3 then
		Return 
	else
		if ret = 2 then
			nh=w_new_sala_qx.dw_admi.getitemnumber(w_new_sala_qx.dw_admi.getrow(),'nh')
			clug_hadm=w_new_sala_qx.dw_admi.getitemstring(w_new_sala_qx.dw_admi.getrow(),'clugar')
			donde=w_new_sala_qx.dw_admi.getrow()
		else
			nh=w_new_sala_qx.dw_admi.getitemnumber(donde,'nh')
			clug_hadm=w_new_sala_qx.dw_admi.getitemstring(donde,'clugar')
		end if
		if donde<>w_new_sala_qx.dw_admi.getrow() then w_new_sala_qx.dw_admi.scrolltorow(donde)
	end if
end if

//cargar en la admisión ambulatoria que está abierta o en la que mando w_admi_ambu(nh)
//osea insertar el nuevo acto qx en qxcabacto con f_newingre
//de aqui padelante si hay error debe darle rollback a eso (nuevo qxcabcato,dw_cab,qxcpacto)

w_new_sala_qx.tipo_ingres='4'
w_new_sala_qx.dw_new.setitem(1,'fechainicio',datetime(date(dw_cab.getitemdatetime(dw_cab.getrow(),'tiniciaqx'))))
w_new_sala_qx.dw_new.setitem(1,'horainicio',dw_cab.getitemdatetime(dw_cab.getrow(),'tiniciaqx'))
w_new_sala_qx.dw_new.setitem(1,'fechafin',datetime(date(dw_cab.getitemdatetime(dw_cab.getrow(),'tterminaqx'))))
w_new_sala_qx.dw_new.setitem(1,'horafin',dw_cab.getitemdatetime(dw_cab.getrow(),'tterminaqx'))
w_new_sala_qx.dw_new.setitem(1,'codigosala',dw_cab.getitemstring(dw_cab.getrow(),'codigosala'))
w_new_sala_qx.dw_new.setitem(1,'tipo_cirugia','0')
ningres=w_new_sala_qx.f_newingre(nh,clug_hadm)
if ningres=-1 then return
dw_cab.setitem(dw_cab.getrow(),'numero_ingre',ningres)
dw_cab.setitem(dw_cab.getrow(),'clugar_qx',clugar)
dw_cab.setitem(dw_cab.getrow(),'codemp',w_new_sala_qx.dw_admi.getitemstring(w_new_sala_qx.dw_admi.getrow(),'cemp'))

if dw_cab.update()=-1 then 
	rollback;
	return
end if

uo_datastore ds
ds=create uo_datastore
ds.dataobject='dw_at_qx'
ds.settransobject(sqlca)
for j=1 to dw_cir.rowcount()
	dw_cir.scrolltorow(j)
	ds.insertrow(j)
	ds.setitem(j,'proccups',dw_cir.getitemstring(j,'codproced'))
	ds.setitem(j,'prof',dw_cir.getitemstring(j,'qx'))
	ds.setitem(j,'cesp',dw_cir.getitemstring(j,'espe_qx'))
	ds.setitem(j,'fecha',dw_cir.getitemdatetime(j,'iniciacir'))
	ds.setitem(j,'tipoane',dw_cir.getitemstring(j,'codtipoanestesia'))
	ds.setitem(j,'ane',dw_cir.getitemstring(j,'anes'))
	ds.setitem(j,'diagprinp',dw_cir.getitemstring(j,'dx_preqx'))
	ds.setitem(j,'nautoriza',dw_cir.getitemstring(j,'nautoriza'))
next
openwithparm(w_new_atiende_pqx,ds)
close(parent)
end event

type st_4 from statictext within w_qx_sinprog
integer x = 4539
integer y = 48
integer width = 901
integer height = 336
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Se muestran los actos del Paciente ya programados que no se han atendido. Seleccione el Acto a Atender y presione aceptar para llevarlo con sus respectivos datos a Sala Quirúrgica "
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_qx_sinprog
integer x = 37
integer y = 376
integer width = 375
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cirugías del Acto"
boolean focusrectangle = false
end type

type st_1 from statictext within w_qx_sinprog
integer x = 37
integer width = 1056
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actos Qx Programados Pendientes de Atender"
boolean focusrectangle = false
end type

type dw_cir from datawindow within w_qx_sinprog
integer x = 32
integer y = 436
integer width = 5408
integer height = 460
integer taborder = 20
string title = "none"
string dataobject = "dw_qxcita_cir"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
this.getchild('anes',l_idw_anestesiologos)
l_idw_anestesiologos.settransobject(sqlca)
l_idw_anestesiologos.retrieve()
end event

type dw_cab from datawindow within w_qx_sinprog
integer x = 32
integer y = 56
integer width = 4251
integer height = 292
integer taborder = 10
string title = "none"
string dataobject = "dw_qx_sinaten"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then return
dw_cir.reset()
dw_cir.retrieve(getitemnumber(getrow(),'ncita'),getitemstring(getrow(),'clugar'),'1')

end event

