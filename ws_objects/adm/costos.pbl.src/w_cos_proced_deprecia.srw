$PBExportHeader$w_cos_proced_deprecia.srw
forward
global type w_cos_proced_deprecia from window
end type
type dw_uc from datawindow within w_cos_proced_deprecia
end type
type pb_save from picturebutton within w_cos_proced_deprecia
end type
type pb_6 from picturebutton within w_cos_proced_deprecia
end type
type pb_5 from picturebutton within w_cos_proced_deprecia
end type
type pb_4 from picturebutton within w_cos_proced_deprecia
end type
type pb_3 from picturebutton within w_cos_proced_deprecia
end type
type dw_faltan from datawindow within w_cos_proced_deprecia
end type
type st_1 from statictext within w_cos_proced_deprecia
end type
type dw_conf from datawindow within w_cos_proced_deprecia
end type
type pb_1 from picturebutton within w_cos_proced_deprecia
end type
type dw_3 from datawindow within w_cos_proced_deprecia
end type
type dw_cab from datawindow within w_cos_proced_deprecia
end type
type gb_1 from groupbox within w_cos_proced_deprecia
end type
end forward

global type w_cos_proced_deprecia from window
integer width = 3890
integer height = 2344
boolean titlebar = true
string title = "Configuración de Depreciables por Procedimiento"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "cargo.ico"
boolean center = true
dw_uc dw_uc
pb_save pb_save
pb_6 pb_6
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
dw_faltan dw_faltan
st_1 st_1
dw_conf dw_conf
pb_1 pb_1
dw_3 dw_3
dw_cab dw_cab
gb_1 gb_1
end type
global w_cos_proced_deprecia w_cos_proced_deprecia

type variables
boolean i_cambio
DatawindowChild dw_ccosto
string uf,cc
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

on w_cos_proced_deprecia.create
this.dw_uc=create dw_uc
this.pb_save=create pb_save
this.pb_6=create pb_6
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.dw_faltan=create dw_faltan
this.st_1=create st_1
this.dw_conf=create dw_conf
this.pb_1=create pb_1
this.dw_3=create dw_3
this.dw_cab=create dw_cab
this.gb_1=create gb_1
this.Control[]={this.dw_uc,&
this.pb_save,&
this.pb_6,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.dw_faltan,&
this.st_1,&
this.dw_conf,&
this.pb_1,&
this.dw_3,&
this.dw_cab,&
this.gb_1}
end on

on w_cos_proced_deprecia.destroy
destroy(this.dw_uc)
destroy(this.pb_save)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.dw_faltan)
destroy(this.st_1)
destroy(this.dw_conf)
destroy(this.pb_1)
destroy(this.dw_3)
destroy(this.dw_cab)
destroy(this.gb_1)
end on

event open;dw_uc.getchild("codcc",dw_ccosto)
dw_ccosto.settransobject(SQLCA)
dw_ccosto.retrieve()
dw_ccosto.setfilter("codlugar=''")
dw_ccosto.filter()
dw_uc.insertrow(1)
dw_cab.retrieve()

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

type dw_uc from datawindow within w_cos_proced_deprecia
integer x = 2231
integer y = 1084
integer width = 731
integer height = 128
integer taborder = 40
string title = "none"
string dataobject = "dw_uf_cc"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;string vnul, cuf, cod
AcceptText()
if isNull(this.getitemstring(1,'coduf')) then Return 0
if this.getColumnName() = 'coduf' then
	dw_faltan.Reset()
	cod = GetItemString(1,'coduf')
	select desufuncional into :uf from ufuncional
	where coduf = :cod;
	dw_faltan.Retrieve(cod)
end if

end event

event constructor;SetTransObject(SQLCA)

end event

type pb_save from picturebutton within w_cos_proced_deprecia
integer x = 3625
integer y = 212
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

type pb_6 from picturebutton within w_cos_proced_deprecia
integer x = 2071
integer y = 1692
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
string powertiptext = "Retirar"
end type

event clicked;if dw_conf.rowcount()=0 then return
long f
f = dw_conf.Find("selec=1",1,dw_conf.RowCount())
do while f > 0
	dw_conf.deleteRow(f)
	i_cambio=true
	f = dw_conf.Find("selec=1",1,dw_conf.RowCount())
loop

dw_uc.TriggerEvent(Itemchanged!)

end event

type pb_5 from picturebutton within w_cos_proced_deprecia
integer x = 2071
integer y = 1556
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
string powertiptext = "Adicionar"
end type

event clicked;if dw_cab.rowcount()=0 then return
if dw_faltan.rowcount()=0 then return
long f
f = dw_faltan.Find("selec=1",1,dw_faltan.RowCount())
do while f > 0
	dw_conf.insertrow(1)
	dw_conf.setitem(1,'cod_proced',dw_cab.getitemstring(dw_cab.getrow(),'cod_proced'))
	dw_conf.setitem(1,'coduf',dw_faltan.getitemstring(dw_faltan.getrow(),'coduf'))
	dw_conf.setitem(1,'codcc',dw_faltan.getitemstring(dw_faltan.getrow(),'codcc'))
//	dw_conf.setitem(1,'coddep',dw_faltan.getitemstring(dw_faltan.getrow(),'coddep'))
	dw_conf.setitem(1,'desuf',uf)
	dw_conf.setitem(1,'descc',dw_faltan.getitemstring(dw_faltan.getrow(),'descc'))
//	dw_conf.setitem(1,'desdep',dw_faltan.getitemstring(dw_faltan.getrow(),'descripcion'))
	//dw_conf.groupcalc()
	dw_faltan.deleterow(0)
	i_cambio=true
	dw_faltan.SetItem(f,'selec',0)
	f = dw_faltan.Find("selec=1",1,dw_faltan.RowCount())
loop

end event

type pb_4 from picturebutton within w_cos_proced_deprecia
boolean visible = false
integer x = 2071
integer y = 1428
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "atras.gif"
string disabledname = "d_atras.gif"
alignment htextalign = left!
string powertiptext = "Adicionar todos los genericos"
end type

event clicked;do while dw_faltan.rowcount()>0
	pb_5.event clicked()
loop
end event

type pb_3 from picturebutton within w_cos_proced_deprecia
boolean visible = false
integer x = 2075
integer y = 1824
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string picturename = "ultimo.gif"
string disabledname = "d_ultimo.gif"
alignment htextalign = left!
string powertiptext = "Borrar Todos los Genéricos"
end type

event clicked;do while dw_conf.rowcount()>0
	pb_6.event clicked()
loop
end event

type dw_faltan from datawindow within w_cos_proced_deprecia
integer x = 2249
integer y = 1224
integer width = 1573
integer height = 968
integer taborder = 40
string title = "none"
string dataobject = "dw_clases_noestan"
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

event retrieverow;string coduf,codcc,coddep
long fila
coduf = GetItemString(row,'coduf')
codcc = GetItemString(row,'codcc')
//coddep = GetItemString(row,'coddep')

fila = dw_conf.Find("coduf='"+coduf+"' and codcc='"+codcc+"'",1,dw_conf.RowCount())
if fila > 0 then
	deleteRow(Row)
end if

end event

type st_1 from statictext within w_cos_proced_deprecia
integer x = 37
integer y = 1076
integer width = 1134
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "centros de Costos configurados del Procedimiento:"
boolean focusrectangle = false
end type

type dw_conf from datawindow within w_cos_proced_deprecia
integer x = 32
integer y = 1148
integer width = 2016
integer height = 1040
integer taborder = 30
string title = "none"
string dataobject = "dw_proc_deprecia"
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

type pb_1 from picturebutton within w_cos_proced_deprecia
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

type dw_3 from datawindow within w_cos_proced_deprecia
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

type dw_cab from datawindow within w_cos_proced_deprecia
integer x = 27
integer y = 208
integer width = 3566
integer height = 768
integer taborder = 10
string title = "none"
string dataobject = "dw_cab_proc_deprecia"
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
dw_uc.TriggerEvent(itemchanged!)

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

type gb_1 from groupbox within w_cos_proced_deprecia
integer width = 3813
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

