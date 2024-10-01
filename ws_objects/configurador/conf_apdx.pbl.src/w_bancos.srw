$PBExportHeader$w_bancos.srw
forward
global type w_bancos from window
end type
type pb_save from picturebutton within w_bancos
end type
type tab_1 from tab within w_bancos
end type
type tp_1 from userobject within tab_1
end type
type pb_4 from picturebutton within tp_1
end type
type pb_3 from picturebutton within tp_1
end type
type pb_2 from picturebutton within tp_1
end type
type pb_1 from picturebutton within tp_1
end type
type dw_lista_enc from datawindow within tp_1
end type
type dw_item_enc from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_lista_enc dw_lista_enc
dw_item_enc dw_item_enc
end type
type tp_2 from userobject within tab_1
end type
type pb_8 from picturebutton within tp_2
end type
type pb_7 from picturebutton within tp_2
end type
type pb_6 from picturebutton within tp_2
end type
type pb_5 from picturebutton within tp_2
end type
type dw_lista_prue from datawindow within tp_2
end type
type dw_prue from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
dw_lista_prue dw_lista_prue
dw_prue dw_prue
end type
type tab_1 from tab within w_bancos
tp_1 tp_1
tp_2 tp_2
end type
type st_1 from statictext within w_bancos
end type
type dw_1 from datawindow within w_bancos
end type
end forward

global type w_bancos from window
integer width = 4315
integer height = 1488
boolean titlebar = true
string title = "Bancos - Configuración"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "conf_pag.ico"
boolean center = true
pb_save pb_save
tab_1 tab_1
st_1 st_1
dw_1 dw_1
end type
global w_bancos w_bancos

type variables
string i_banco,i_operacion
end variables

on w_bancos.create
this.pb_save=create pb_save
this.tab_1=create tab_1
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_save,&
this.tab_1,&
this.st_1,&
this.dw_1}
end on

on w_bancos.destroy
destroy(this.pb_save)
destroy(this.tab_1)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;dw_1.retrieve()
end event

type pb_save from picturebutton within w_bancos
integer x = 4119
integer y = 68
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       &g"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;i_operacion = 'Delete'
if tab_1.tp_1.dw_lista_enc.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_item_enc.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if tab_1.tp_1.dw_item_enc.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_lista_enc.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = 'Delete'
if tab_1.tp_2.dw_lista_prue.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_2.dw_prue.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if tab_1.tp_2.dw_prue.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_2.dw_lista_prue.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = ''
tab_1.tp_1.dw_item_enc.resetUpdate()
tab_1.tp_1.dw_lista_enc.resetupdate()
tab_1.tp_2.dw_lista_prue.resetUpdate()
tab_1.tp_2.dw_prue.resetUpdate()
commit;
end event

type tab_1 from tab within w_bancos
integer x = 46
integer y = 496
integer width = 4027
integer height = 864
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3991
integer height = 736
long backcolor = 67108864
string text = "Encuesta"
long tabtextcolor = 33554432
string picturename = "CheckBox!"
long picturemaskcolor = 536870912
string powertiptext = "Items que se Configuran para la encuenta inicial"
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_lista_enc dw_lista_enc
dw_item_enc dw_item_enc
end type

on tp_1.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_lista_enc=create dw_lista_enc
this.dw_item_enc=create dw_item_enc
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_lista_enc,&
this.dw_item_enc}
end on

on tp_1.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_lista_enc)
destroy(this.dw_item_enc)
end on

type pb_4 from picturebutton within tp_1
integer x = 2949
integer y = 608
integer width = 146
integer height = 128
integer taborder = 50
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
string powertiptext = "Borrar"
end type

event clicked;dw_lista_enc.deleterow(0)
end event

type pb_3 from picturebutton within tp_1
integer x = 2784
integer y = 604
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;long donde,j
donde=dw_lista_enc.insertrow(0)
dw_lista_enc.setitem(donde,'cod_banco',i_banco)
dw_lista_enc.setitem(donde,'item',dw_item_enc.getitemnumber(dw_item_enc.getrow(),'item'))
for j=1 to dw_lista_enc.rowcount()
	if dw_lista_enc.find('subitem='+string(j),1,dw_lista_enc.rowcount())=0 then exit
next
dw_lista_enc.setitem(donde,'subitem',j)
end event

type pb_2 from picturebutton within tp_1
integer x = 2519
integer y = 160
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
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Item"
end type

event clicked;do while dw_lista_enc.rowcount()>0
	dw_lista_enc.deleterow(0)
loop
dw_item_enc.deleterow(0)
end event

type pb_1 from picturebutton within tp_1
integer x = 2514
integer y = 32
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
alignment htextalign = left!
end type

event clicked;long donde,j
donde=dw_item_enc.insertrow(0)
dw_item_enc.setitem(donde,'cod_banco',i_banco)
for j=1 to dw_item_enc.rowcount()
	if dw_item_enc.find('item='+string(j),1,dw_item_enc.rowcount())=0 then exit
next
dw_item_enc.setitem(donde,'item',j)
end event

type dw_lista_enc from datawindow within tp_1
integer x = 2775
integer y = 40
integer width = 1216
integer height = 540
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_enc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event dberror;rollback;
return 0
end event

type dw_item_enc from datawindow within tp_1
integer x = 5
integer y = 36
integer width = 2491
integer height = 660
integer taborder = 10
string title = "none"
string dataobject = "dw_banco_item_encuesta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then
	dw_lista_enc.setfilter('isnull(item)')
	pb_3.enabled=false
	pb_4.enabled=false
else
	if isnull(getitemnumber(getrow(),'item')) then
		dw_lista_enc.setfilter('isnull(item)')
	else
		dw_lista_enc.setfilter('item='+string(getitemnumber(getrow(),'item')))
	end if
	if getitemstring(getrow(),'tipo')='L' then
		pb_3.enabled=true
		pb_4.enabled=true
	else
		pb_3.enabled=false
		pb_4.enabled=false
	end if
end if
dw_lista_enc.filter()
end event

event itemchanged;choose case dwo.name
	case 'tipo'
		if data='L' then
			pb_3.enabled=true
			pb_4.enabled=true
		else
			pb_3.enabled=false
			pb_4.enabled=false
		end if
	case 'obligatorio'
		if data='1' then
			setitem(getrow(),'tipo','L')
			post event itemchanged(getrow() , object.tipo , 'L')	
		end if
end choose
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event dberror;rollback;
return 0
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3991
integer height = 736
long backcolor = 67108864
string text = "Pruebas"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Pruebas preliminares y de Infecciones de la Muestra"
pb_8 pb_8
pb_7 pb_7
pb_6 pb_6
pb_5 pb_5
dw_lista_prue dw_lista_prue
dw_prue dw_prue
end type

on tp_2.create
this.pb_8=create pb_8
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_5=create pb_5
this.dw_lista_prue=create dw_lista_prue
this.dw_prue=create dw_prue
this.Control[]={this.pb_8,&
this.pb_7,&
this.pb_6,&
this.pb_5,&
this.dw_lista_prue,&
this.dw_prue}
end on

on tp_2.destroy
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.dw_lista_prue)
destroy(this.dw_prue)
end on

type pb_8 from picturebutton within tp_2
integer x = 2423
integer y = 192
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Item"
end type

event clicked;do while dw_lista_prue.rowcount()>0
	dw_lista_prue.deleterow(0)
loop
dw_prue.deleterow(0)
end event

type pb_7 from picturebutton within tp_2
integer x = 2423
integer y = 64
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
alignment htextalign = left!
end type

event clicked;long donde,j
donde=dw_prue.insertrow(0)
dw_prue.setitem(donde,'cod_banco',i_banco)
for j=1 to dw_prue.rowcount()
	if dw_prue.find('nro_examen='+string(j),1,dw_prue.rowcount())=0 then exit
next
dw_prue.setitem(donde,'nro_examen',j)
end event

type pb_6 from picturebutton within tp_2
integer x = 3141
integer y = 572
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
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar"
end type

type pb_5 from picturebutton within tp_2
integer x = 2985
integer y = 572
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar"
end type

event clicked;long donde,j
donde=dw_lista_prue.insertrow(0)
dw_lista_prue.setitem(donde,'cod_banco',i_banco)
dw_lista_prue.setitem(donde,'nro_examen',dw_prue.getitemnumber(dw_prue.getrow(),'nro_examen'))
for j=1 to dw_lista_prue.rowcount()
	if dw_lista_prue.find('subitem='+string(j),1,dw_lista_prue.rowcount())=0 then exit
next
dw_lista_prue.setitem(donde,'subitem',j)
end event

type dw_lista_prue from datawindow within tp_2
integer x = 2606
integer y = 40
integer width = 937
integer height = 512
integer taborder = 40
string title = "none"
string dataobject = "dw_banco_prueba_lista"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

type dw_prue from datawindow within tp_2
integer x = 9
integer y = 24
integer width = 2386
integer height = 676
integer taborder = 30
string title = "none"
string dataobject = "dw_banco_prueba"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event sqlpreview;string tipo

if sqltype = PreviewSelect! then
	tipo = 'Select'
	i_operacion = ''
elseif sqltype = PreviewInsert! then
	tipo = 'Insert'
elseif sqltype = PreviewDelete! then
	tipo = 'Delete'
elseif sqltype = PreviewUpdate! then
	tipo = 'Update'
end if

if i_operacion = 'Delete' then
	if tipo = 'Delete' then
		Return 0
	else
		Return 2
	end if
elseif i_operacion = 'Insert' then
	if tipo = 'Insert' or tipo = 'Update' then
		Return 0
	else
		Return 2
	end if
end if
end event

event itemchanged;if dwo.name='tipo' then
	if data='L' then
		pb_5.enabled=true
		pb_6.enabled=true
	else
		pb_5.enabled=false
		pb_6.enabled=false
	end if
end if
end event

event rowfocuschanged;if getrow()<1 then
	dw_lista_prue.setfilter('isnull(nro_examen)')
	pb_5.enabled=false
	pb_6.enabled=false
else
	if isnull(getitemnumber(getrow(),'nro_examen')) then
		dw_lista_prue.setfilter('isnull(nro_examen)')
	else
		dw_lista_prue.setfilter('nro_examen='+string(getitemnumber(getrow(),'nro_examen')))
	end if
	if getitemstring(getrow(),'tipo')='L' then
		pb_5.enabled=true
		pb_6.enabled=true
	else
		pb_5.enabled=false
		pb_6.enabled=false
	end if
end if
dw_lista_prue.filter()
end event

type st_1 from statictext within w_bancos
integer x = 41
integer y = 12
integer width = 416
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Bancos de Fluidos:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_bancos
integer x = 37
integer y = 72
integer width = 4046
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_bancos"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
object.descrip_banco.edit.displayonly='TRUE'
object.consec_x_anyo.protect='1'
object.coddoc_sello.protect='1'
end event

event rowfocuschanged;tab_1.tp_1.dw_item_enc.reset()
tab_1.tp_1.dw_lista_enc.reset()
tab_1.tp_2.dw_prue.reset()
tab_1.tp_2.dw_lista_prue.reset()
if getrow()<1 then return
i_banco=getitemstring(getrow(),'cod_banco')
tab_1.tp_1.dw_lista_enc.retrieve(i_banco)
tab_1.tp_2.dw_lista_prue.retrieve(i_banco)
tab_1.tp_1.dw_item_enc.retrieve(i_banco)
tab_1.tp_2.dw_prue.retrieve(i_banco)
end event

