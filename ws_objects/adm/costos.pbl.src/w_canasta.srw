$PBExportHeader$w_canasta.srw
forward
global type w_canasta from window
end type
type pb_del_ins from picturebutton within w_canasta
end type
type pb_save from picturebutton within w_canasta
end type
type pb_6 from picturebutton within w_canasta
end type
type pb_5 from picturebutton within w_canasta
end type
type pb_4 from picturebutton within w_canasta
end type
type pb_3 from picturebutton within w_canasta
end type
type st_2 from statictext within w_canasta
end type
type dw_faltan from datawindow within w_canasta
end type
type st_1 from statictext within w_canasta
end type
type dw_getareo from datawindow within w_canasta
end type
type dw_conf from datawindow within w_canasta
end type
type pb_2 from picturebutton within w_canasta
end type
type dw_4 from datawindow within w_canasta
end type
type pb_1 from picturebutton within w_canasta
end type
type dw_3 from datawindow within w_canasta
end type
type dw_cpo from datawindow within w_canasta
end type
type dw_cab from datawindow within w_canasta
end type
type gb_1 from groupbox within w_canasta
end type
type gb_2 from groupbox within w_canasta
end type
end forward

global type w_canasta from window
integer width = 4466
integer height = 2344
boolean titlebar = true
string title = "Configuración de canastas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "obra.ico"
boolean center = true
pb_del_ins pb_del_ins
pb_save pb_save
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_faltan dw_faltan
st_1 st_1
dw_getareo dw_getareo
dw_conf dw_conf
pb_2 pb_2
dw_4 dw_4
pb_1 pb_1
dw_3 dw_3
dw_cpo dw_cpo
dw_cab dw_cab
gb_1 gb_1
gb_2 gb_2
end type
global w_canasta w_canasta

type variables
string i_operacion
boolean i_cambio_ins,i_cambio_conf
end variables

forward prototypes
public function integer grabar ()
public function integer f_pregunta ()
end prototypes

public function integer grabar ();if dw_cpo.accepttext()=-1 then return -1
if dw_conf.accepttext()=-1 then return -1
i_operacion = 'Delete'
if dw_conf.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if dw_cpo.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if dw_cpo.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if dw_conf.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
dw_cpo.resetupdate()
dw_conf.resetupdate()
commit;
i_cambio_ins=false
i_cambio_conf=false
return 1
end function

public function integer f_pregunta ();if (not i_cambio_ins) and (not i_cambio_conf) then return 2
return messagebox("Atención",'Realizó cambios, desea guardarlos?' ,question!,yesnocancel!,3)
end function

on w_canasta.create
this.pb_del_ins=create pb_del_ins
this.pb_save=create pb_save
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_faltan=create dw_faltan
this.st_1=create st_1
this.dw_getareo=create dw_getareo
this.dw_conf=create dw_conf
this.pb_2=create pb_2
this.dw_4=create dw_4
this.pb_1=create pb_1
this.dw_3=create dw_3
this.dw_cpo=create dw_cpo
this.dw_cab=create dw_cab
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.pb_del_ins,&
this.pb_save,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.st_2,&
this.dw_faltan,&
this.st_1,&
this.dw_getareo,&
this.dw_conf,&
this.pb_2,&
this.dw_4,&
this.pb_1,&
this.dw_3,&
this.dw_cpo,&
this.dw_cab,&
this.gb_1,&
this.gb_2}
end on

on w_canasta.destroy
destroy(this.pb_del_ins)
destroy(this.pb_save)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_faltan)
destroy(this.st_1)
destroy(this.dw_getareo)
destroy(this.dw_conf)
destroy(this.pb_2)
destroy(this.dw_4)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.dw_cpo)
destroy(this.dw_cab)
destroy(this.gb_1)
destroy(this.gb_2)
end on

event open;dw_cab.retrieve()
end event

event closequery;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
		return 0
	case 3
		return 1
end choose
end event

type pb_del_ins from picturebutton within w_canasta
integer x = 3063
integer y = 68
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar Insumo"
end type

event clicked;if dw_cpo.rowcount()=0 then return
pb_3.event clicked()
dw_cpo.deleterow(0)
i_cambio_ins=true
end event

type pb_save from picturebutton within w_canasta
integer x = 1554
integer y = 1060
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "       &g"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;grabar()
end event

type pb_6 from picturebutton within w_canasta
integer x = 2633
integer y = 1732
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante_1.gif"
alignment htextalign = left!
string powertiptext = "Borrar el Generico Seleccionado"
end type

event clicked;if dw_conf.rowcount()=0 then return
dw_faltan.insertrow(1)
dw_faltan.setitem(1,'codgenerico',dw_conf.getitemstring(dw_conf.getrow(),'codgenerico'))
dw_faltan.setitem(1,'descripcion',dw_conf.getitemstring(dw_conf.getrow(),'descripcion'))
//dw_faltan.setitem(1,'c_medica',dw_conf.getitemstring(dw_conf.getrow(),'c_medica'))
//dw_faltan.setitem(1,'medicamento',dw_conf.getitemstring(dw_conf.getrow(),'medicamento'))
dw_conf.deleterow(0)
i_cambio_conf=true
end event

type pb_5 from picturebutton within w_canasta
integer x = 2633
integer y = 1240
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras_1.gif"
alignment htextalign = left!
string powertiptext = "Adicionar todos los Genéricos"
end type

event clicked;if dw_faltan.rowcount()=0 then return
if isnull(dw_getareo.getitemstring(1,1)) or dw_cpo.getrow()=0 then return
dw_conf.insertrow(1)
dw_conf.setitem(1,'cod_proced',dw_cpo.getitemstring(dw_cpo.getrow(),'cod_proced'))
dw_conf.setitem(1,'codgenerico',dw_faltan.getitemstring(dw_faltan.getrow(),'codgenerico'))
dw_conf.setitem(1,'cod_insumo',dw_cpo.getitemstring(dw_cpo.getrow(),'cod_insumo'))
dw_conf.setitem(1,'codgetareo',dw_getareo.getitemstring(1,1))
//dw_conf.setitem(1,'c_medica',dw_faltan.getitemstring(dw_faltan.getrow(),'c_medica'))
dw_conf.setitem(1,'descripcion',dw_faltan.getitemstring(dw_faltan.getrow(),'descripcion'))
dw_faltan.deleterow(0)
i_cambio_conf=true
end event

type pb_4 from picturebutton within w_canasta
integer x = 2633
integer y = 1364
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras.gif"
alignment htextalign = left!
string powertiptext = "Adicionar todos los genericos"
end type

event clicked;do while dw_faltan.rowcount()>0
	pb_5.event clicked()
loop
end event

type pb_3 from picturebutton within w_canasta
integer x = 2633
integer y = 1856
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ultimo.gif"
alignment htextalign = left!
string powertiptext = "Borrar Todos los Genéricos"
end type

event clicked;do while dw_conf.rowcount()>0
	pb_6.event clicked()
loop
end event

type st_2 from statictext within w_canasta
integer x = 2839
integer y = 1044
integer width = 1001
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medico/Quirúrgicos Configurados del Insumo:"
boolean focusrectangle = false
end type

type dw_faltan from datawindow within w_canasta
integer x = 2825
integer y = 1108
integer width = 1513
integer height = 1092
integer taborder = 40
string title = "none"
string dataobject = "dw_gener_no_incluid"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

event doubleclicked;pb_5.event clicked()
end event

type st_1 from statictext within w_canasta
integer x = 37
integer y = 1168
integer width = 841
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Medico/Quirúrgicos por Grupo Etareo:"
boolean focusrectangle = false
end type

type dw_getareo from datawindow within w_canasta
integer x = 14
integer y = 1016
integer width = 1458
integer height = 160
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_getareo"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,1)
if i_cambio_conf then
	choose case messagebox('Atención','Realizó cambios a los grupos etareos, desea guardar los cambios ?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then 
				setitem(1,1,actual)
				settext(actual)
				return 2
			end if
		case 2
			i_cambio_conf=false
		case 3
			setitem(1,1,actual)
			settext(actual)
			return 2
	end choose
end if
dw_conf.reset()
dw_faltan.reset()
if isnull(data) or dw_cab.rowcount()=0 or dw_cpo.rowcount()=0 or dw_cpo.getrow()<1 then return
if isnull(dw_cpo.getitemstring(dw_cpo.getrow(),'cod_insumo')) then return
dw_conf.retrieve(dw_cpo.getitemstring(dw_cpo.getrow(),'cod_proced'),dw_cpo.getitemstring(dw_cpo.getrow(),'cod_insumo'),data)
dw_faltan.retrieve(dw_cpo.getitemstring(dw_cpo.getrow(),'cod_proced'),dw_cpo.getitemstring(dw_cpo.getrow(),'cod_insumo'),data)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_conf from datawindow within w_canasta
integer x = 32
integer y = 1224
integer width = 2537
integer height = 964
integer taborder = 30
string title = "none"
string dataobject = "dw_cos_canasta_getareo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
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

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event doubleclicked;pb_6.event clicked()
end event

type pb_2 from picturebutton within w_canasta
integer x = 2875
integer y = 68
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "buscar.gif"
alignment htextalign = left!
end type

event clicked;st_xa_elegir st
st.titulo='Buscar Insumos'
st.dw_object='dw_insumo'
st.ancho=2000
st.alto=1200
openwithparm(w_buscar_gral,st)
if message.stringparm<>'' then dw_4.event itemchanged(1,dw_4.object.edita,message.stringparm)
end event

type dw_4 from datawindow within w_canasta
integer x = 2181
integer y = 56
integer width = 686
integer height = 136
integer taborder = 20
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
modify('t_1.text="Digite el código del &Insumo:"')
modify('edita.accelerator="I"')
end event

event itemchanged;if dw_cab.rowcount()=0 then return
if i_cambio_conf then
	choose case messagebox('Atención','Realizó cambios a los grupos etareos, desea guardar los cambios ?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return
		case 2
			i_cambio_conf=false
		case 3
			return 2
	end choose
end if
string cod,descrip
long donde
cod=trim(data)
select insumo into :descrip from cos_insumo where cod_insumo=:cod;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo cos_insumo',sqlca.sqlerrtext)
	return 2
end if
if isnull(descrip) then
	messagebox('Atención','Este insumo no existe')
	return 2
end if
donde=dw_cpo.find('cod_insumo="'+cod+'"',1,dw_cpo.rowcount())
if donde=0 then
	dw_cpo.insertrow(1)
	dw_cpo.setitem(1,'cod_proced',dw_cab.getitemstring(dw_cab.getrow(),'cod_proced'))
	dw_cpo.setitem(1,'cod_insumo',cod)
	dw_cpo.setitem(1,'insumo',descrip)
	dw_cpo.setrow(donde)
	dw_cpo.event rowfocuschanged(donde)
else
	dw_cpo.scrolltorow(donde)
end if
settext('')
i_cambio_ins=true
return 2
end event

type pb_1 from picturebutton within w_canasta
integer x = 709
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
boolean originalsize = true
string picturename = "buscar.gif"
alignment htextalign = left!
end type

event clicked;open(w_busca_proc)
if message.stringparm<>'' then
	dw_3.event itemchanged(1,dw_3.object.edita,message.stringparm)
end if
end event

type dw_3 from datawindow within w_canasta
integer x = 27
integer y = 56
integer width = 686
integer height = 136
integer taborder = 20
string title = "none"
string dataobject = "dw_paraediciones"
boolean border = false
boolean livescroll = true
end type

event constructor;insertrow(1)
end event

event itemchanged;choose case f_pregunta()
	case 1//yes
		if grabar()=-1 then return
	case 2//no
		i_cambio_ins=false
		i_cambio_conf=false
	case 3//cancel
		return 2
end choose
string cod,descrip
long donde
cod=trim(data)
select descripcion into :descrip from proced where codproced=:cod;
if sqlca.sqlcode=-1 then
	messagebox('Error leyendo Proced',sqlca.sqlerrtext)
	return 2
end if
if isnull(descrip) then
	messagebox('Atención','Este procedimiento no existe')
	return 2
end if
donde=dw_cab.find('cod_proced="'+cod+'"',1,dw_cab.rowcount())
if donde=0 then
	dw_cab.insertrow(1)
	dw_cab.setitem(1,'cod_proced',cod)
	dw_cab.setitem(1,'descripcion',descrip)
	dw_cab.setrow(1)
	dw_cab.event rowfocuschanged(1)
else
	dw_cab.scrolltorow(donde)
end if
settext('')
return 2
end event

type dw_cpo from datawindow within w_canasta
integer x = 2185
integer y = 208
integer width = 2126
integer height = 772
integer taborder = 20
string title = "none"
string dataobject = "dw_cos_canasta_cpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_getareo.event itemchanged(1,dw_getareo.object.codgetareo,dw_getareo.getitemstring(1,1))
end event

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

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanging;if i_cambio_conf then
	choose case messagebox('Atención','Realizó cambios a los grupos etareos, desea guardar los cambios ?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then return 1
		case 2
			i_cambio_conf=false
		case 3
			return 1
	end choose
end if
return 0
end event

type dw_cab from datawindow within w_canasta
integer x = 27
integer y = 212
integer width = 2039
integer height = 768
integer taborder = 10
string title = "none"
string dataobject = "dw_cab_canasta"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cpo.reset()
if getrow()<1 then return
dw_cpo.retrieve(getitemstring(getrow(),'cod_proced'))
end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanging;choose case f_pregunta()
	case 1//yes
		if grabar()=-1 then return 1
	case 2//no
		i_cambio_ins=false
		i_cambio_conf=false
	case 3//cancel
		return 1
end choose
return 0
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type gb_1 from groupbox within w_canasta
integer width = 2112
integer height = 1008
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Procedimientos:"
end type

type gb_2 from groupbox within w_canasta
integer x = 2158
integer width = 2203
integer height = 1008
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Insumos del Procedimiento:"
end type

