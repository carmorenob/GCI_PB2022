$PBExportHeader$w_plants_impu.srw
forward
global type w_plants_impu from window
end type
type st_3 from statictext within w_plants_impu
end type
type st_2 from statictext within w_plants_impu
end type
type st_1 from statictext within w_plants_impu
end type
type dw_1 from datawindow within w_plants_impu
end type
type pb_del_plant from picturebutton within w_plants_impu
end type
type pb_new from picturebutton within w_plants_impu
end type
type pb_3 from picturebutton within w_plants_impu
end type
type pb_del from picturebutton within w_plants_impu
end type
type pb_insert from picturebutton within w_plants_impu
end type
type dw_cpo from datawindow within w_plants_impu
end type
type dw_cab from datawindow within w_plants_impu
end type
type dw_emp from datawindow within w_plants_impu
end type
end forward

global type w_plants_impu from window
integer width = 2528
integer height = 2028
boolean titlebar = true
string title = "Tesorería - Plantillas de Impuestos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "impuesto.ico"
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
dw_1 dw_1
pb_del_plant pb_del_plant
pb_new pb_new
pb_3 pb_3
pb_del pb_del
pb_insert pb_insert
dw_cpo dw_cpo
dw_cab dw_cab
dw_emp dw_emp
end type
global w_plants_impu w_plants_impu

type variables
datawindowchild idw_iva2,idw_cta2
end variables

on w_plants_impu.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.pb_del_plant=create pb_del_plant
this.pb_new=create pb_new
this.pb_3=create pb_3
this.pb_del=create pb_del
this.pb_insert=create pb_insert
this.dw_cpo=create dw_cpo
this.dw_cab=create dw_cab
this.dw_emp=create dw_emp
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.pb_del_plant,&
this.pb_new,&
this.pb_3,&
this.pb_del,&
this.pb_insert,&
this.dw_cpo,&
this.dw_cab,&
this.dw_emp}
end on

on w_plants_impu.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.pb_del_plant)
destroy(this.pb_new)
destroy(this.pb_3)
destroy(this.pb_del)
destroy(this.pb_insert)
destroy(this.dw_cpo)
destroy(this.dw_cab)
destroy(this.dw_emp)
end on

type st_3 from statictext within w_plants_impu
integer x = 55
integer y = 1128
integer width = 1074
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle de la Plantilla:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_plants_impu
integer x = 55
integer y = 636
integer width = 1074
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantillas del Concepto:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_plants_impu
integer x = 59
integer y = 148
integer width = 795
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Conceptos de Pagos de la Empresa:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_plants_impu
integer x = 50
integer y = 204
integer width = 2249
integer height = 408
integer taborder = 20
string title = "none"
string dataobject = "dw_tesorelfact_concep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cab.reset()
if getrow()<1 then return
dw_cab.retrieve(getitemstring(getrow(),'cod_rel'))

end event

event constructor;settransobject(sqlca)
object.cod_rel.edit.displayonly='yes'
object.descripcion.edit.displayonly='yes'
object.cod_total.edit.displayonly='yes'
end event

type pb_del_plant from picturebutton within w_plants_impu
integer x = 2190
integer y = 852
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "         &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Plantilla [Alt + B]"
end type

event clicked;if dw_cpo.rowcount()>0 then 
	messagebox("Atención",'Debe borrar primero los impuestos de la plantilla para poderla borrar')
	return
end if
dw_cab.deleterow(0)
end event

type pb_new from picturebutton within w_plants_impu
integer x = 2190
integer y = 716
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &i"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Plantilla [Alt + I]"
end type

event clicked;if isnull(dw_emp.getitemstring(1,1)) or dw_1.rowcount()=0 then return
long fila
fila=dw_cab.insertrow(0)
dw_cab.setitem(fila,'cod_rel',dw_1.getitemstring(dw_1.getrow(),'cod_rel'))
dw_cab.scrolltorow(fila)
dw_cab.setfocus()
end event

type pb_3 from picturebutton within w_plants_impu
integer x = 2190
integer y = 996
integer width = 151
integer height = 132
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &g"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt + G]"
end type

event clicked;if dw_cab.accepttext()=-1 then return
if dw_cpo.accepttext()=-1 then return
if dw_cab.update(true,false)=-1 then
	rollback;
	return
end if
if dw_cpo.update(true,false)=-1 then
	rollback;
	return
end if
commit;
dw_cab.resetupdate()
dw_cpo.resetupdate()
end event

type pb_del from picturebutton within w_plants_impu
integer x = 1198
integer y = 1748
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &t"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Registro [Alt + T]"
end type

event clicked;if dw_cpo.rowcount()=0 then return
dw_cpo.deleterow(0)
end event

type pb_insert from picturebutton within w_plants_impu
integer x = 1015
integer y = 1752
integer width = 151
integer height = 132
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &r"
boolean originalsize = true
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Registro [Alt + R]"
end type

event clicked;if isnull(dw_emp.getitemstring(1,1)) or dw_cab.rowcount()=0 then return
long j,fila
fila=dw_cpo.insertrow(0)
dw_cpo.setitem(fila,'cod_rel',dw_cab.getitemstring(dw_cab.getrow(),'cod_rel'))
dw_cpo.setitem(fila,'cod_plant',dw_cab.getitemstring(dw_cab.getrow(),'cod_plant'))
for j=1 to dw_cpo.rowcount()
	if dw_cpo.find('item='+string(j),1,dw_cpo.rowcount())=0 then exit
next
dw_cpo.setitem(fila,'item',j)
dw_cpo.setfocus()
end event

type dw_cpo from datawindow within w_plants_impu
integer x = 55
integer y = 1184
integer width = 2368
integer height = 544
integer taborder = 30
string title = "none"
string dataobject = "dw_plant_impu_cp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_concep',idw_iva2)
idw_iva2.settransobject(sqlca)
idw_iva2.retrieve()

getchild('cod_total',idw_cta2)
idw_cta2.settransobject(sqlca)
settransobject(sqlca)
end event

event itemchanged;choose case dwo.name
	case 'cod_concep'
		if idw_cta2.retrieve(dw_emp.getitemstring(1,1),data)=1 then
			setitem(row,'cod_total',idw_cta2.getitemstring(1,'codtotal'))
		end if
end choose
end event

event rowfocuschanged;if getrow()<1 then return
if not isnull(getitemstring(getrow(),'cod_rel')) then
	idw_cta2.retrieve(dw_emp.getitemstring(1,1),getitemstring(getrow(),'cod_concep'))
end if
end event

type dw_cab from datawindow within w_plants_impu
integer x = 50
integer y = 692
integer width = 2094
integer height = 424
integer taborder = 20
string title = "none"
string dataobject = "dw_plant_impu_cab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cpo.reset()
if getrow()<1 then return
dw_cpo.retrieve(getitemstring(1,'cod_rel'),getitemstring(getrow(),'cod_plant'))

end event

event constructor;settransobject(sqlca)
end event

type dw_emp from datawindow within w_plants_impu
integer x = 50
integer width = 873
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_cont_empresa"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;accepttext()
dw_1.reset()
dw_1.retrieve(data,'0')
end event

