$PBExportHeader$w_selecc_produc.srw
forward
global type w_selecc_produc from window
end type
type dw_2 from datawindow within w_selecc_produc
end type
type pb_3 from picturebutton within w_selecc_produc
end type
type st_1 from statictext within w_selecc_produc
end type
type pb_ok from picturebutton within w_selecc_produc
end type
type pb_2 from picturebutton within w_selecc_produc
end type
type dw_1 from datawindow within w_selecc_produc
end type
type pb_1 from picturebutton within w_selecc_produc
end type
type dw_combo from datawindow within w_selecc_produc
end type
end forward

global type w_selecc_produc from window
integer width = 3589
integer height = 1384
boolean titlebar = true
string title = "Banco de Fluidos - Productos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_2 dw_2
pb_3 pb_3
st_1 st_1
pb_ok pb_ok
pb_2 pb_2
dw_1 dw_1
pb_1 pb_1
dw_combo dw_combo
end type
global w_selecc_produc w_selecc_produc

type variables
datawindowchild idw_empaq,idw_proc
end variables

on w_selecc_produc.create
this.dw_2=create dw_2
this.pb_3=create pb_3
this.st_1=create st_1
this.pb_ok=create pb_ok
this.pb_2=create pb_2
this.dw_1=create dw_1
this.pb_1=create pb_1
this.dw_combo=create dw_combo
this.Control[]={this.dw_2,&
this.pb_3,&
this.st_1,&
this.pb_ok,&
this.pb_2,&
this.dw_1,&
this.pb_1,&
this.dw_combo}
end on

on w_selecc_produc.destroy
destroy(this.dw_2)
destroy(this.pb_3)
destroy(this.st_1)
destroy(this.pb_ok)
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.dw_combo)
end on

event open;w_banco_fluid.dw_bolsas.rowscopy(1,w_banco_fluid.dw_bolsas.rowcount(),primary!,dw_1,1,primary!)
dw_1.resetupdate()
end event

type dw_2 from datawindow within w_selecc_produc
boolean visible = false
integer x = 1038
integer y = 16
integer width = 686
integer height = 136
integer taborder = 30
string title = "none"
string dataobject = "dw_lista_proc_x_banco"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)

end event

type pb_3 from picturebutton within w_selecc_produc
string tag = "Eliminar Productos"
integer x = 2414
integer y = 12
integer width = 137
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Productos"
end type

event clicked;if dw_1.rowcount()=0 then return
if dw_1.find('nueva=0',1,dw_1.rowcount())>0 then
	messagebox('Atención','Este recipiente ya estaba cargado no lo puede borrar')
	return
end if
do while dw_1.rowcount()>0
	dw_1.deleterow(0)
loop
end event

type st_1 from statictext within w_selecc_produc
integer x = 23
integer y = 132
integer width = 827
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Productos generados en la Donación:"
boolean focusrectangle = false
end type

type pb_ok from picturebutton within w_selecc_produc
integer x = 1568
integer y = 1144
integer width = 137
integer height = 124
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.find('nueva=1',1,dw_1.rowcount())=0 then return
if dw_1.find('isnull(codproced) or isnull(proced_descripcion)',1,dw_1.rowcount())>0 then 
	messagebox('Atención','Debe elegir el procedimiento a generar')
	return
end if
if dw_1.update(true,false)=-1 then return
commit;
w_banco_fluid.dw_bolsas.reset()
dw_1.rowscopy(1,dw_1.rowcount(),primary!,w_banco_fluid.dw_bolsas,1,primary!)
dw_1.resetupdate()
w_banco_fluid.dw_bolsas.resetupdate()
closewithreturn(parent,'ok')
end event

type pb_2 from picturebutton within w_selecc_produc
integer x = 1719
integer y = 1144
integer width = 137
integer height = 124
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type dw_1 from datawindow within w_selecc_produc
integer x = 18
integer y = 188
integer width = 3534
integer height = 940
integer taborder = 20
string title = "none"
string dataobject = "dw_banco_bolsas"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event dberror;rollback;
return 0
end event

event constructor;getchild('proced_descripcion',idw_proc)
idw_proc.settransobject(sqlca)
settransobject(sqlca)

end event

event rowfocuschanged;if getrow()<1 then return
idw_proc.retrieve(getitemstring(getrow(),'cod_banco'),getitemstring(getrow(),'cod_empaque'),getitemnumber(getrow(),'nro'))

end event

event itemchanged;if dwo.name='proced_descripcion' then
	setitem(getrow(),'codproced',idw_proc.getitemstring(idw_proc.getrow(),'codproced'))
end if
end event

type pb_1 from picturebutton within w_selecc_produc
string tag = "Productos"
integer x = 2263
integer y = 12
integer width = 137
integer height = 124
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Productos"
end type

event clicked;if isnull(dw_combo.getitemstring(1,'cod_empaque')) then return
if dw_2.rowcount()=0 then return
if dw_1.rowcount()>0 then return
long j,donde
for j=1 to dw_2.rowcount()
	donde=dw_1.insertrow(0)
	dw_1.setitem(donde,'nro_bolsa',dw_2.getitemnumber(j,'nro'))
	dw_1.setitem(donde,'clugar',w_banco_fluid.dw_histo.getitemstring(w_banco_fluid.dw_histo.getrow(),'clugar'))
	dw_1.setitem(donde,'nro_donacion',w_banco_fluid.dw_histo.getitemnumber(w_banco_fluid.dw_histo.getrow(),'nro_donacion'))
	dw_1.setitem(donde,'estado','S')
	dw_1.setitem(donde,'cod_banco',w_banco_fluid.i_banco)
	dw_1.setitem(donde,'cod_empaque',dw_combo.getitemstring(1,'cod_empaque'))
	dw_1.setitem(donde,'descrip_empaque',dw_2.getitemstring(j,'descrip_empaque'))
	dw_1.setitem(donde,'capacidad',dw_2.getitemnumber(j,'capacidad'))
	dw_1.setitem(donde,'nro',dw_2.getitemnumber(j,'nro'))
	dw_1.setitem(donde,'duracion_muestra',dw_2.getitemnumber(j,'duracion_muestra'))
	dw_1.setitem(donde,'fecha_vencimiento',datetime(relativedate(today(),dw_2.getitemnumber(j,'duracion_muestra'))))
	if idw_proc.retrieve(w_banco_fluid.i_banco,dw_combo.getitemstring(1,'cod_empaque'),dw_2.getitemnumber(j,'nro'))=1 then
		dw_1.setitem(donde,'codproced',idw_proc.getitemstring(1,'codproced'))
		dw_1.setitem(donde,'proced_descripcion',idw_proc.getitemstring(1,'descripcion'))
	end if
next
dw_1.setrow(1)
dw_1.event rowfocuschanged(1)
end event

type dw_combo from datawindow within w_selecc_produc
integer x = 9
integer width = 873
integer height = 132
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_emp_prod"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_empaque',idw_empaq)
idw_empaq.settransobject(sqlca)
settransobject(sqlca)
insertrow(1)
idw_empaq.retrieve(w_banco_fluid.i_banco)
end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'cod_empaque'
		dw_2.retrieve(w_banco_fluid.i_banco,data)
end choose
end event

