$PBExportHeader$w_cos_proced_cargo.srw
forward
global type w_cos_proced_cargo from window
end type
type pb_save from picturebutton within w_cos_proced_cargo
end type
type pb_6 from picturebutton within w_cos_proced_cargo
end type
type pb_5 from picturebutton within w_cos_proced_cargo
end type
type pb_4 from picturebutton within w_cos_proced_cargo
end type
type pb_3 from picturebutton within w_cos_proced_cargo
end type
type st_2 from statictext within w_cos_proced_cargo
end type
type dw_faltan from datawindow within w_cos_proced_cargo
end type
type st_1 from statictext within w_cos_proced_cargo
end type
type dw_conf from datawindow within w_cos_proced_cargo
end type
type pb_1 from picturebutton within w_cos_proced_cargo
end type
type dw_3 from datawindow within w_cos_proced_cargo
end type
type dw_cab from datawindow within w_cos_proced_cargo
end type
type gb_1 from groupbox within w_cos_proced_cargo
end type
end forward

global type w_cos_proced_cargo from window
integer width = 4389
integer height = 2344
boolean titlebar = true
string title = "Configuración de Tipo de Gasto por Procedimiento y Cargo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "cargo.ico"
boolean center = true
pb_save pb_save
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_faltan dw_faltan
st_1 st_1
dw_conf dw_conf
pb_1 pb_1
dw_3 dw_3
dw_cab dw_cab
gb_1 gb_1
end type
global w_cos_proced_cargo w_cos_proced_cargo

type variables
boolean i_cambio
end variables

forward prototypes
public function integer grabar ()
public function integer f_pregunta ()
end prototypes

public function integer grabar ();if dw_conf.accepttext()=-1 then return -1
if dw_conf.Update(TRUE,FALSE) = -1 then 
	Return -1
end if
dw_conf.resetupdate()
commit;
i_cambio=false
return 1
end function

public function integer f_pregunta ();if not i_cambio then return 2
return messagebox("Atención",'Realizó cambios, desea guardarlos?' ,question!,yesnocancel!,3)
end function

on w_cos_proced_cargo.create
this.pb_save=create pb_save
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_faltan=create dw_faltan
this.st_1=create st_1
this.dw_conf=create dw_conf
this.pb_1=create pb_1
this.dw_3=create dw_3
this.dw_cab=create dw_cab
this.gb_1=create gb_1
this.Control[]={this.pb_save,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.st_2,&
this.dw_faltan,&
this.st_1,&
this.dw_conf,&
this.pb_1,&
this.dw_3,&
this.dw_cab,&
this.gb_1}
end on

on w_cos_proced_cargo.destroy
destroy(this.pb_save)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_faltan)
destroy(this.st_1)
destroy(this.dw_conf)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.dw_cab)
destroy(this.gb_1)
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

type pb_save from picturebutton within w_cos_proced_cargo
integer x = 3950
integer y = 204
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

type pb_6 from picturebutton within w_cos_proced_cargo
integer x = 2226
integer y = 1740
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
//dw_faltan.insertrow(1)
//dw_faltan.setitem(1,'cargo',dw_conf.getitemstring(dw_conf.getrow(),'cargo'))
//dw_faltan.setitem(1,'nombre_cargo',dw_conf.getitemstring(dw_conf.getrow(),'nombre_cargo'))
dw_conf.deleterow(0)
i_cambio=true
end event

type pb_5 from picturebutton within w_cos_proced_cargo
integer x = 2226
integer y = 1100
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
string powertiptext = "Adicionar el Genérico Seleccionado"
end type

event clicked;if dw_faltan.rowcount()=0 then return
dw_conf.insertrow(1)
dw_conf.setitem(1,'cod_proced',dw_cab.getitemstring(dw_cab.getrow(),'cod_proced'))
dw_conf.setitem(1,'cargo',dw_faltan.getitemstring(dw_faltan.getrow(),'cargo'))
dw_conf.setitem(1,'nombre_cargo',dw_faltan.getitemstring(dw_faltan.getrow(),'nombre_cargo'))
//dw_faltan.deleterow(0)
i_cambio=true
end event

type pb_4 from picturebutton within w_cos_proced_cargo
integer x = 2226
integer y = 1224
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

type pb_3 from picturebutton within w_cos_proced_cargo
integer x = 2226
integer y = 1864
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

type st_2 from statictext within w_cos_proced_cargo
integer x = 2405
integer y = 1028
integer width = 667
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cargos no Configurados:"
boolean focusrectangle = false
end type

type dw_faltan from datawindow within w_cos_proced_cargo
integer x = 2400
integer y = 1092
integer width = 1792
integer height = 1100
integer taborder = 40
string title = "none"
string dataobject = "dw_cargos_sin_proced"
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

type st_1 from statictext within w_cos_proced_cargo
integer x = 37
integer y = 1032
integer width = 887
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cargos configurados del Procedimiento:"
boolean focusrectangle = false
end type

type dw_conf from datawindow within w_cos_proced_cargo
integer x = 32
integer y = 1088
integer width = 2139
integer height = 1100
integer taborder = 30
string title = "none"
string dataobject = "dw_cos_proced_cargo"
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

event doubleclicked;pb_6.event clicked()
end event

type pb_1 from picturebutton within w_cos_proced_cargo
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

type dw_3 from datawindow within w_cos_proced_cargo
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
		i_cambio=false
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

type dw_cab from datawindow within w_cos_proced_cargo
integer x = 27
integer y = 208
integer width = 3867
integer height = 768
integer taborder = 10
string title = "none"
string dataobject = "dw_cab_cargo_proc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_conf.reset()
dw_faltan.reset()
if getrow()<1 then return
dw_conf.retrieve(getitemstring(getrow(),'cod_proced'))
dw_faltan.retrieve(getitemstring(getrow(),'cod_proced'))
end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

event rowfocuschanging;choose case f_pregunta()
	case 1//yes
		if grabar()=-1 then return 1
	case 2//no
		i_cambio=false
	case 3//cancel
		return 1
end choose
return 0
end event

type gb_1 from groupbox within w_cos_proced_cargo
integer width = 4165
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

