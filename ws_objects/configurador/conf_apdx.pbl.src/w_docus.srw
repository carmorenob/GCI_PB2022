$PBExportHeader$w_docus.srw
forward
global type w_docus from window
end type
type pb_del2 from picturebutton within w_docus
end type
type pb_new2 from picturebutton within w_docus
end type
type dw_doc from datawindow within w_docus
end type
type st_2 from statictext within w_docus
end type
type dw_lugares from datawindow within w_docus
end type
type pb_save from picturebutton within w_docus
end type
type pb_new from picturebutton within w_docus
end type
type dw_cab from datawindow within w_docus
end type
type st_6 from statictext within w_docus
end type
type dw_histo from datawindow within w_docus
end type
type dw_mod from datawindow within w_docus
end type
type gb_1 from groupbox within w_docus
end type
end forward

global type w_docus from window
string tag = "Modificó o creó un Documento. Desea guardar los cambios ?"
integer width = 4178
integer height = 1772
boolean titlebar = true
string title = "GCI - Documentos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "Form!"
pb_del2 pb_del2
pb_new2 pb_new2
dw_doc dw_doc
st_2 st_2
dw_lugares dw_lugares
pb_save pb_save
pb_new pb_new
dw_cab dw_cab
st_6 st_6
dw_histo dw_histo
dw_mod dw_mod
gb_1 gb_1
end type
global w_docus w_docus

type variables
datawindowchild hija,dw_ccosto
string tipo_col,anterior,orden,i_modulo,i_cdoc,i_operacion
boolean i_nuevo,i_cambio
long i_fila
end variables

forward prototypes
public subroutine reset_dws ()
public function integer f_pregunta ()
public function integer grabar ()
end prototypes

public subroutine reset_dws ();dw_cab.reset()
dw_doc.reset()
end subroutine

public function integer f_pregunta ();if dw_cab.accepttext()=-1 then return 3
if dw_doc.accepttext()=-1 then return 3
if not i_cambio then return 2
return messagebox("Atención, realizó cambios",tag,question!,yesnocancel!,3)
end function

public function integer grabar ();if dw_cab.accepttext()=-1 then return -1
if dw_doc.accepttext()=-1 then return -1
i_operacion = 'Delete'
if dw_doc.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
if dw_cab.Update(TRUE,FALSE) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = 'Insert'
if dw_cab.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
if dw_doc.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
i_operacion = ''
long j
string crep,clug
blob reporte
for j=1 to dw_doc.rowcount()
	crep=dw_doc.getitemstring(j,'coddoc')
	clug=dw_doc.getitemstring(j,'clugar')
	sqlca.autocommit=true
	if dw_doc.getitemstring(j,'reporte')='' or isnull(dw_doc.getitemstring(j,'reporte')) then
		update documentos set reporte=null where coddoc=:crep and clugar=:clug;
	else
		reporte=blob(dw_doc.getitemstring(j,'reporte'))
		updateblob documentos set reporte=:reporte where coddoc=:crep and clugar=:clug;
	end if
	sqlca.autocommit=false
	if sqlca.sqlcode=-1 then
		messagebox('Error actualizando documentos',sqlca.sqlerrtext)
		rollback;
		return -1
	end if
next
commit;
dw_cab.resetupdate()
dw_doc.resetupdate()
dw_histo.resetupdate()
if i_nuevo then
	dw_histo.setitem(1,'coddoc',dw_cab.getitemstring(1,'coddoc'))
	dw_histo.setitem(1,'desdoc',dw_cab.getitemstring(1,'desdoc'))
	dw_histo.setitem(1,'por_lugar',dw_cab.getitemstring(1,'por_lugar'))
	dw_histo.setitem(1,'estado','1')
end if
i_cambio=false
i_nuevo=false
return 1
end function

on w_docus.create
this.pb_del2=create pb_del2
this.pb_new2=create pb_new2
this.dw_doc=create dw_doc
this.st_2=create st_2
this.dw_lugares=create dw_lugares
this.pb_save=create pb_save
this.pb_new=create pb_new
this.dw_cab=create dw_cab
this.st_6=create st_6
this.dw_histo=create dw_histo
this.dw_mod=create dw_mod
this.gb_1=create gb_1
this.Control[]={this.pb_del2,&
this.pb_new2,&
this.dw_doc,&
this.st_2,&
this.dw_lugares,&
this.pb_save,&
this.pb_new,&
this.dw_cab,&
this.st_6,&
this.dw_histo,&
this.dw_mod,&
this.gb_1}
end on

on w_docus.destroy
destroy(this.pb_del2)
destroy(this.pb_new2)
destroy(this.dw_doc)
destroy(this.st_2)
destroy(this.dw_lugares)
destroy(this.pb_save)
destroy(this.pb_new)
destroy(this.dw_cab)
destroy(this.st_6)
destroy(this.dw_histo)
destroy(this.dw_mod)
destroy(this.gb_1)
end on

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

event timer;if i_fila=dw_histo.getrow() then
	timer(0)
	return
end if
setnull(i_cdoc)
if dw_histo.getrow()<1 then return
i_fila=dw_histo.getrow()
i_cdoc=dw_histo.getitemstring(i_fila,'coddoc')
dw_cab.retrieve(i_cdoc)
dw_doc.retrieve(i_cdoc)
timer(0)
end event

type pb_del2 from picturebutton within w_docus
integer x = 1838
integer y = 1492
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
string powertiptext = "Borrar Documento por Lugar"
end type

event clicked;dw_doc.deleterow(0)
i_cambio=true
end event

type pb_new2 from picturebutton within w_docus
integer x = 1664
integer y = 1492
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Documento por Lugar"
end type

event clicked;dw_doc.insertrow(1)
dw_doc.setitem(1,'codmodulo',i_modulo)
dw_doc.setitem(1,'coddoc',i_cdoc)
//dw_doc.setitem(1,'desdoc',dw_cab.getitemstring(1,'desdoc'))
dw_doc.setitem(1,'por_lugar',dw_cab.getitemstring(1,'por_lugar'))

end event

type dw_doc from datawindow within w_docus
integer x = 37
integer y = 748
integer width = 4018
integer height = 712
integer taborder = 30
string title = "none"
string dataobject = "dw_doc_todo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;string camino,nomarch,carreta
long file
if row<>getrow() then setrow(row)
if dwo.name='b_1' then
	nomarch=getitemstring(getrow(),'camino')
	if isnull(nomarch) then nomarch=''
	camino=nomarch
	if GetFileOpenName("Abrir Reporte", camino, nomarch, "SRD","Reportes (*.SRD),*.SRD",nomarch) = 1 then
		setitem(getrow(),'camino',camino)
		file=fileopen(nomarch,textmode!)
		if file=-1 then
			messagebox('Error', 'No se pudo abrir el archivo')
			return
		end if
		filereadex(file,carreta)
		setitem(getrow(),'fecha_carga',now())
		setitem(getrow(),'reporte',carreta)
		event itemchanged(getrow(),object.reporte,'')
	end if
else
	camino=getitemstring(getrow(),'camino')
	if GetFileSaveName ( 'Guardar reporte como', camino, nomarch , 'SRD' , 'Reportes (*.srd),*.srd' )<=0 then return
	file=fileopen(nomarch,textmode!,write!,lockwrite!,replace!)
	if file=-1 then
		messagebox('Error creando archivo','No se pudo abrir el archivo para escribirlo')
		return
	end if
	filewriteex(file,getitemstring(getrow(),'reporte'))
end if
fileclose(file)
end event

event clicked;if dwo.type <> "text" then 
	if dwo.type="column" then
		tipo_col=this.describe(dwo.name+".coltype")
//		st_3.text=dwo.name
	end if
	return
end if
string cual,ojo,ss
cual=dwo.name
cual=mid(cual,1,len(cual) - 2)
if anterior=cual then
	if orden="A" then
		orden="D"
	else
		orden="A"
	end if
else
	orden="A"
end if
this.setsort(cual+" "+orden)
this.sort()
anterior=cual
end event

event constructor;settransobject(sqlca)
end event

event dberror;rollback;
return 0
end event

event itemchanged;choose case this.getcolumnname()
	case 'camino'
		if trim(gettext())='' then return
		if not fileexists(gettext()) then
			setitem(getrow(),'camino','')
			settext('')
			return 1
		end if
		uo_datastore dw_temp
		dw_temp=create uo_datastore
		if f_lee_dw_camino(gettext(),dw_temp)=-1 then return
		real factor_umed
		choose case dw_temp.describe("datawindow.units")
			case '0'//powerunits
				factor_umed=1/174
			case '1'//pixels
				factor_umed=1/38
			case '2'//pulgadas
				factor_umed=1/395
			case '3'//centimetros
				factor_umed=1/1000
		end choose
		setitem(getrow(),'tam_papel',dw_temp.describe('datawindow.print.paper.size'))
		setitem(getrow(),'orienta',dw_temp.describe('datawindow.print.orientation'))
		setitem(getrow(),'mar_izq',real(dw_temp.describe('datawindow.print.margin.left'))*factor_umed)
		setitem(getrow(),'mar_der',real(dw_temp.describe('datawindow.print.margin.right'))*factor_umed)
		setitem(getrow(),'mar_sup',real(dw_temp.describe('datawindow.print.margin.top'))*factor_umed)
		setitem(getrow(),'mar_inf',real(dw_temp.describe('datawindow.print.margin.bottom'))*factor_umed)
		setitem(getrow(),'copias',1)
		setitem(getrow(),'tamanyo',100)
		setitem(getrow(),'v_prelim','0')
		setitem(getrow(),'ver_dialogo','1')
		setitem(getrow(),'cambiar_prop','1')
end choose
i_cambio=true
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
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

event retrieveend;long j
blob reporte
string crep,clug
for j=1 to rowcount
	sqlca.autocommit=true
	clug=getitemstring(j,'clugar')
	crep=getitemstring(j,'coddoc')
	selectblob reporte into :reporte from documentos where coddoc=:crep and clugar=:clug;
	if sqlca.sqlcode=-1 then
		messagebox('Error leyendo documentos',sqlca.sqlerrtext)
		return
	end if
	setitem(j,'reporte',string(reporte))
	sqlca.autocommit=false
next
end event

type st_2 from statictext within w_docus
integer x = 18
integer y = 144
integer width = 219
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugares:"
boolean focusrectangle = false
end type

type dw_lugares from datawindow within w_docus
integer x = 14
integer y = 204
integer width = 1888
integer height = 400
integer taborder = 30
string title = "none"
string dataobject = "dw_lugares"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
retrieve()
object.codlugar.edit.displayonly='true'
object.descripcion.edit.displayonly='true'
end event

type pb_save from picturebutton within w_docus
integer x = 1746
integer y = 28
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
end type

event clicked;if grabar()=1 then
	commit;
end if
end event

type pb_new from picturebutton within w_docus
integer x = 1591
integer y = 24
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;reset_dws()
dw_histo.insertrow(1)
i_fila=1
dw_histo.setrow(1)
dw_histo.setitem(1,'estado','4')
i_cambio=true
i_nuevo=true
dw_cab.insertrow(1)
dw_cab.setitem(1,'codmodulo',i_modulo)
setnull(i_cdoc)
enabled=false
long j
for j=1 to dw_lugares.rowcount()
	dw_doc.insertrow(j)
	dw_doc.setitem(j,'codmodulo',i_modulo)
	dw_doc.setitem(j,'clugar',dw_lugares.getitemstring(j,'codlugar'))
	dw_doc.setitem(j,'por_lugar','1')
next
dw_cab.setfocus()
end event

type dw_cab from datawindow within w_docus
integer x = 1966
integer y = 428
integer width = 2107
integer height = 184
integer taborder = 20
string title = "none"
string dataobject = "dw_deta_docu_gral"
boolean border = false
boolean livescroll = true
end type

event itemchanged;long j
choose case dwo.name
	case 'coddoc'
		i_cdoc=data
		for j=1 to dw_doc.rowcount()
			dw_doc.setitem(j,'coddoc',i_cdoc)
		next
//	case 'desdoc','por_lugar'
//		for j=1 to dw_doc.rowcount()
//			dw_doc.setitem(j,dwo.name,data)
//		next
end choose
accepttext()
i_cambio=true
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

event constructor;settransobject(sqlca)
end event

type st_6 from statictext within w_docus
integer x = 1966
integer y = 12
integer width = 553
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos por Módulo:"
boolean focusrectangle = false
end type

type dw_histo from datawindow within w_docus
event p_borra_nuevo ( long p_estaba,  long p_va )
integer x = 1966
integer y = 64
integer width = 2121
integer height = 356
integer taborder = 10
string title = "none"
string dataobject = "dw_list_docus_x_mod"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_borra_nuevo(long p_estaba, long p_va);deleterow(p_estaba)
i_fila=0
parent.event timer()

end event

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;reset_dws()
timer(0.3)


end event

event rowfocuschanging;choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_cambio=false
		i_nuevo=false
		pb_new.enabled=true
		if currentrow<1 or currentrow>rowcount() then return
		if getitemstring(currentrow,'estado')='4' then 
			post event p_borra_nuevo(currentrow,newrow)
		end if
	case 3//cancelar
		return 1
end choose
return 0
end event

event dberror;rollback;
return 0
end event

type dw_mod from datawindow within w_docus
integer x = 14
integer width = 1367
integer height = 156
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_modulos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,string(dwo.name))
choose case f_pregunta()
	case 1//cambio y debe guardar
		if grabar()=-1 then 
			setitem(1,1,actual)
			return 1
		else
			commit;
		end if
	case 2// no cambio o no va a guardar
		i_cambio=false
		i_nuevo=false
		pb_new.enabled=true
	case 3//cancelar
		setitem(1,1,actual)
		return 1
end choose
pb_new.enabled=true
i_modulo=data
reset_dws()
dw_histo.retrieve(i_modulo)
i_fila=0
dw_histo.event rowfocuschanged(1)

end event

type gb_1 from groupbox within w_docus
integer x = 5
integer y = 672
integer width = 4087
integer height = 960
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Documentos por lugares:"
end type

