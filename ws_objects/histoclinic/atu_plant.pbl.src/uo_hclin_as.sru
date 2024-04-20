$PBExportHeader$uo_hclin_as.sru
forward
global type uo_hclin_as from userobject
end type
type pb_4 from picturebutton within uo_hclin_as
end type
type dw_valor from datawindow within uo_hclin_as
end type
type dw_ls from datawindow within uo_hclin_as
end type
type pb_3 from picturebutton within uo_hclin_as
end type
type pb_2 from picturebutton within uo_hclin_as
end type
type pb_1 from picturebutton within uo_hclin_as
end type
type st_1 from statictext within uo_hclin_as
end type
type dw_historial from datawindow within uo_hclin_as
end type
type dw_campo from datawindow within uo_hclin_as
end type
type st_2 from statictext within uo_hclin_as
end type
type dw_plants from datawindow within uo_hclin_as
end type
type t1 from tab within uo_hclin_as
end type
type p1 from userobject within t1
end type
type p1 from userobject within t1
end type
type p2 from userobject within t1
end type
type p2 from userobject within t1
end type
type t1 from tab within uo_hclin_as
p1 p1
p2 p2
end type
type dw_1 from datawindow within uo_hclin_as
end type
type dw_ficha from datawindow within uo_hclin_as
end type
end forward

global type uo_hclin_as from userobject
integer width = 4475
integer height = 2036
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event closequery pbm_closequery
event cambio_diags ( )
pb_4 pb_4
dw_valor dw_valor
dw_ls dw_ls
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_1 st_1
dw_historial dw_historial
dw_campo dw_campo
st_2 st_2
dw_plants dw_plants
t1 t1
dw_1 dw_1
dw_ficha dw_ficha
end type
global uo_hclin_as uo_hclin_as

type variables
private string i_tipo,i_cplant,i_ccont, i_textos, i_campos, i_columnas, i_lugarfact
private long posX, posY, colum, altura, consec, i_nfact
private datawindowchild idw_plants,idw_lista
private uo_timer timer
boolean i_cambia, i_nueva//para saber si se ha modificado algo
string i_message
boolean i_displayonly //,i_puede_modif//para que si no pudo crear una orden no siga enviando eso
keycode i_nextitem=keyf7!,i_nextchild=keyf9!,i_previtem=keyf8!

end variables

forward prototypes
public function integer grabar ()
public function integer reset ()
public function integer retrieve (string p_codplantilla, long p_nencuesta)
public function integer retrieve (string p_codplantilla, double nfact, string lugar)
end prototypes

event closequery;if i_nfact > 0 then
	if grabar()=-1 then
		rollback;
		return 1
	else
		commit;
		return 0
	end if
end if
if not i_cambia then return 0
choose case messagebox('Atención','Realizón cambios en datos de '+i_message+'. Desea guardar los cambios?',question!,yesnocancel!,1)
	case 1
		if grabar()=-1 then
			rollback;
			return 1
		else
			commit;
			return 0
		end if
	case 2
		i_cambia=false
		return 0
	case 3
		return 1
end choose

end event

event cambio_diags();//
end event

public function integer grabar ();dw_1.accepttext()
if not i_cambia then
	return 0
end if
if dw_historial.GetItemString(dw_historial.Getrow(),'estado') <> '0' then
	messagebox('Atención','La encuesta ya se encuentra cerrada')
	return 0
end if

long j, f
string s_campo, valor
boolean inserto,si_datos

for j=1 to dw_campo.Rowcount()
	s_campo = String(dw_campo.GetItemNumber(j,'numcampo'))
	choose case dw_campo.GetItemString(j,'tipo')
		case 'S'  //:seleccion 
			if i_cambia then
				if isNull(dw_1.GetItemString(1,'seleccion_'+s_campo)) then dw_1.SetItem(1,'seleccion_'+s_campo,'0')
//			if dw_1.GetItemString(1,'seleccion_'+s_campo) <>'' and not isnull(dw_1.GetItemString(1,'seleccion_'+s_campo)) then
				f = dw_valor.insertrow(0)
				dw_valor.SetItem(f,'texto',dw_1.GetItemString(1,'seleccion_'+s_campo))
				inserto=true
			end if
		case 'L'  //:lista 
			if dw_1.GetItemString(1,'lista_'+s_campo) <>'' and not isnull(dw_1.GetItemString(1,'lista_'+s_campo)) then
				f = dw_valor.insertrow(0)
				dw_valor.SetItem(f,'texto',dw_1.GetItemString(1,'lista_'+s_campo))
				inserto=true
			end if
		case 'T'  //:texto
			if dw_1.GetItemString(1,'texto_'+s_campo) <>'' and not isnull(dw_1.GetItemString(1,'texto_'+s_campo)) then
				f = dw_valor.insertrow(0)
				dw_valor.SetItem(f,'texto',dw_1.GetItemString(1,'texto_'+s_campo))
				inserto=true
			end if
		case 'N' //:si/no  
			if dw_1.GetItemString(1,'sino_'+s_campo) <> '' and not isnull(dw_1.GetItemString(1,'sino_'+s_campo)) then
				f = dw_valor.insertrow(0)
				dw_valor.setitem(f,'sino',dw_1.GetItemString(1,'sino_'+s_campo))
				inserto=true
			end if
		case 'R'//:Numerico 
			if not isnull(dw_1.GetItemNumber(1,'numero_'+s_campo)) then
				f = dw_valor.insertrow(0)
				dw_valor.setitem(f,'numero',dw_1.GetItemNumber(1,'numero_'+s_campo))
				inserto=true
			end if
		case 'F' //:fecha
			if not isnull(dw_1.getitemdatetime(1,'fecha_'+s_campo)) then
				f = dw_valor.insertrow(0)
				dw_valor.setitem(f,'fecha',dw_1.getitemdatetime(1,'fecha_'+s_campo))
				inserto=true
			end if
	end choose
	if inserto then
		dw_valor.setitem(f,'cod_plantilla',dw_campo.GetitemString(j,'codplantilla'))
		dw_valor.setitem(f,'clugar',clugar)
		dw_valor.setitem(f,'item',dw_campo.GetitemNumber(j,'numcampo'))
		dw_valor.setitem(f,'padre',dw_campo.GetitemNumber(j,'padre'))
		dw_valor.setitem(f,'orden',dw_campo.GetitemNumber(j,'orden'))
		dw_valor.setitem(f,'descampo',dw_campo.GetitemString(j,'descampo'))
		dw_valor.setitem(f,'tipo',dw_campo.GetitemString(j,'tipo'))
		inserto = false
		si_datos = true
		dw_valor.event rec_revisa_padre(dw_campo.getitemnumber(j,'padre'))
	end if
next

long nreg,item
blob guarda
boolean fecha
string err
if si_datos then
	select max(nencuesta) into :nreg from atu_registro where codplantilla=:i_cplant;
	if sqlca.sqlcode=-1 then
		err=sqlca.sqlerrtext
		rollback;
		messagebox('Error leyendo hclin_registro',err)
		return -1
	end if
	if isnull(nreg) then nreg=0
	nreg ++
	dw_historial.setitem(1,'nencuesta',nreg)
	dw_historial.setitem(1,'estado','1')
	if i_nfact > 0 then
		dw_historial.setitem(1,'nfact',i_nfact)
		dw_historial.setitem(1,'clugar_fact',i_lugarfact)
	end if
	if dw_historial.update(true,false)=-1 then 
		dw_historial.deleterow(1)
		return -1
	end if
	for j=1 to dw_valor.rowcount()
		dw_valor.setitem(j,'nencuesta',nreg)
	next
	if dw_valor.Update(true,false)=-1 then
		dw_historial.DeleteRow(dw_historial.GetRow())
		dw_valor.reset()
		return -1
	end if
elseif dw_historial.GetItemStatus(dw_historial.GetRow(),0,primary!) = New! or dw_historial.GetItemStatus(dw_historial.GetRow(),0,primary!) = NewModified! then
	MessageBox('Atención','No agregó datos. Se eliminará la encuesta nueva')
	dw_historial.DeleteRow(dw_historial.GetRow())
end if
dw_historial.resetupdate()
dw_valor.resetupdate()
i_cambia=false
i_nueva = FALSE
//dw_plants.event pinta()
commit;
Return 1

end function

public function integer reset ();i_cplant=''
dw_historial.reset()
idw_plants.reset()
i_cambia=false
//dw_plants.setitem(1,1,i_cprof)
dw_1.Reset()
return 1
end function

public function integer retrieve (string p_codplantilla, long p_nencuesta);idw_plants.reset()	//lista desplegable de las plantillas existentes
idw_plants.retrieve()
dw_plants.Reset()
dw_plants.InsertRow(0)

if idw_plants.rowcount() = 1 and isNull(p_codplantilla) then
	p_codplantilla = idw_plants.getitemstring(1,'codplantilla')
end if
if not isNull(p_codplantilla) then
	dw_plants.setitem(1,1,idw_plants.getitemstring(1,'codplantilla'))
	message.powerobjectparm = dw_plants
	timer.event timer()
end if
Return 1

end function

public function integer retrieve (string p_codplantilla, double nfact, string lugar);idw_plants.reset()	//lista desplegable de las plantillas existentes
idw_plants.retrieve()
dw_plants.Reset()
dw_plants.InsertRow(0)
dw_plants.Enabled = FALSE

if not isNull(p_codplantilla) and not isNull(nfact) and not isNull(lugar) then
	i_nfact = nfact
	i_lugarfact = lugar
	dw_plants.setitem(1,1,idw_plants.getitemstring(1,'codplantilla'))
	message.powerobjectparm = dw_plants
	timer.event timer()
	pb_3.Event Clicked()
end if
Return 1

end function

on uo_hclin_as.create
this.pb_4=create pb_4
this.dw_valor=create dw_valor
this.dw_ls=create dw_ls
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_historial=create dw_historial
this.dw_campo=create dw_campo
this.st_2=create st_2
this.dw_plants=create dw_plants
this.t1=create t1
this.dw_1=create dw_1
this.dw_ficha=create dw_ficha
this.Control[]={this.pb_4,&
this.dw_valor,&
this.dw_ls,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_1,&
this.dw_historial,&
this.dw_campo,&
this.st_2,&
this.dw_plants,&
this.t1,&
this.dw_1,&
this.dw_ficha}
end on

on uo_hclin_as.destroy
destroy(this.pb_4)
destroy(this.dw_valor)
destroy(this.dw_ls)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_historial)
destroy(this.dw_campo)
destroy(this.st_2)
destroy(this.dw_plants)
destroy(this.t1)
destroy(this.dw_1)
destroy(this.dw_ficha)
end on

event constructor;timer=create uo_timer

end event

type pb_4 from picturebutton within uo_hclin_as
integer x = 489
integer y = 136
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                                               &E"
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Anular encuesta seleccionada"
end type

event clicked;if dw_historial.RowCount() = 0 then Return 0
if dw_historial.GetItemString(dw_historial.GetRow(),'estado') = '0' then
	MessageBox('Atención','Sólo encuestas en elaboración pueden ser eliminadas')
elseif dw_historial.GetItemString(dw_historial.GetRow(),'estado') = '1' then
	if MessageBox('Atención','Está seguro de anular la encuesta seleccionada?',Question!,yesno!) = 2 then Return 0
	dw_historial.SetItem(dw_historial.GetRow(),'estado','2')	
	if dw_historial.Update() = -1 then
		Rollback;
	end if
end if

end event

type dw_valor from datawindow within uo_hclin_as
event rec_revisa_padre ( long padre )
boolean visible = false
integer x = 2583
integer y = 680
integer width = 745
integer height = 264
integer taborder = 60
string title = "none"
string dataobject = "dw_reg_valor"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rec_revisa_padre(long padre);if padre=0 then return
if find('item='+string(padre),1,RowCount())=0 then
	long donde, donde2
	donde = dw_campo.find('numcampo='+string(padre),1,dw_campo.RowCount())
	donde2 = insertrow(getrow())
	setitem(donde2,'cod_plantilla',dw_campo.GetitemString(donde,'codplantilla'))
	setitem(donde2,'clugar',clugar)
	setitem(donde2,'item',dw_campo.Getitemnumber(donde,'numcampo'))
	setitem(donde2,'padre',dw_campo.Getitemnumber(donde,'padre'))
	setitem(donde2,'orden',dw_campo.Getitemnumber(donde,'orden'))
	setitem(donde2,'descampo',dw_campo.Getitemstring(donde,'descampo'))
	setitem(donde2,'tipo',dw_campo.Getitemstring(donde,'tipo'))
	event rec_revisa_padre(dw_campo.Getitemnumber(donde,'padre'))
end if

end event

event constructor;setTransObject(SQLCA)

end event

type dw_ls from datawindow within uo_hclin_as
boolean visible = false
integer x = 2715
integer y = 540
integer width = 686
integer height = 256
integer taborder = 80
string title = "none"
string dataobject = "dw_campo_lista"
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type pb_3 from picturebutton within uo_hclin_as
integer x = 50
integer y = 136
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                                       &I"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar [Alt+I]"
end type

event clicked;long fila
if idw_plants.getitemstring(idw_plants.getrow(),'estado')='1' then
	fila = dw_historial.InsertRow(1)
	dw_historial.SetItem(fila,'codplantilla',i_cplant)
	dw_historial.SetItem(fila,'clugar',clugar)
	dw_historial.SetItem(fila,'desplantilla',idw_plants.GetItemString(idw_plants.Getrow(),'desplantilla'))
	dw_historial.SetItem(fila,'fecha',today())
	dw_historial.SetItem(fila,'fecha_reg',today())
	dw_historial.SetItem(fila,'estado','0')
	dw_historial.SetItem(fila,'usuario',usuario)
	dw_historial.ScrolltoRow(fila)
	dw_1.Reset()
	dw_1.InsertRow(0)
	dw_1.SetFocus()
	i_nueva = TRUE
else
	messagebox('Atención','No puede cargar en plantillas inactivas')
end if
end event

type pb_2 from picturebutton within uo_hclin_as
integer x = 197
integer y = 136
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                                               &E"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar  [Alt+E]"
end type

event clicked;if dw_historial.RowCount() = 0 then Return 0
if dw_historial.GetItemString(dw_historial.GetRow(),'estado') = '0' then
	i_cambia = FALSE
	i_nueva = FALSE
	dw_historial.DeleteRow(dw_historial.GetRow())
else
	MessageBox('Atención','Sólo encuestas en elaboración pueden ser eliminadas')
end if

end event

type pb_1 from picturebutton within uo_hclin_as
integer x = 343
integer y = 136
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                                                 &G"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar [Alt+G]"
end type

event clicked;grabar()

end event

type st_1 from statictext within uo_hclin_as
integer x = 1417
integer y = 8
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Historial:"
boolean focusrectangle = false
end type

type dw_historial from datawindow within uo_hclin_as
integer x = 1408
integer y = 60
integer width = 2437
integer height = 320
integer taborder = 50
string title = "none"
string dataobject = "dw_historial_enc"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( sqlca)

end event

event rowfocuschanged;long j, ncampo
st_2.Text = ''
if RowCount() = 0 or currentrow = 0 then Return
dw_valor.Retrieve(GetItemString(GetRow(),'codplantilla'),GetItemString(GetRow(),'clugar'),GetItemNumber(GetRow(),'nencuesta'))
dw_1.SetRedraw(FALSE)
dw_1.Reset()
dw_1.InsertRow(0)
for j = 1 to dw_valor.RowCount()
	ncampo = dw_valor.GetItemNumber(j,'item')
	choose case dw_valor.GetItemString(j,'tipo')
		case 'S'
			dw_1.SetItem(1,'seleccion_'+string(ncampo),dw_valor.GetItemString(j,'texto'))
		case 'N'
			dw_1.SetItem(1,'sino_'+string(ncampo),dw_valor.GetItemString(j,'sino'))
		case 'L'
			dw_1.SetItem(1,'lista_'+string(ncampo),dw_valor.GetItemString(j,'texto'))
		case 'T'
			dw_1.SetItem(1,'texto_'+string(ncampo),dw_valor.GetItemString(j,'texto'))
		case 'R'
			dw_1.SetItem(1,'numero_'+string(ncampo),dw_valor.GetItemNumber(j,'numero'))
		case 'F'
			dw_1.SetItem(1,'fecha_'+string(ncampo),dw_valor.GetItemDateTime(j,'fecha'))
	end choose
next
dw_1.SetRedraw(TRUE)
st_2.Text = 'Registro '+string(GetRow()) +' de '+string(RowCount())

end event

event rbuttondown;if GetItemStatus(GetRow(),0,primary!) = New! or GetItemStatus(GetRow(),0,primary!) = NewModified! then
	int ret
	ret = MessageBox('Atención','Está elaborando una encuesta y no la ha guardado. Seleccione Si para guardar y continuar, no para no guardar y continuar', QUESTION!,yesnocancel!)
	if ret = 1 then
		if grabar() = -1 then Return -1
	elseif ret = 2 then
		if GetItemStatus(GetRow(),0,primary!) = New! or GetItemStatus(GetRow(),0,primary!) = NewModified! then
			i_cambia = FALSE
			DeleteRow(GetRow())
			Event RowFocuschanged(GetRow())
		end if
	elseif ret = 3 then
		return 0
	end if
end if 
st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

event rowfocuschanging;if i_nueva then
	if MessageBox('Atención','Ha agregado una encuesta nueva. Desea guardar los cambios?',Question!,yesno!) = 1 then
		if grabar() = -1 then Return -1
	else
		i_nueva = FALSE
		Deleterow(GetRow())
	end if
end if

end event

event clicked;if row > 0 then
	if GetRow() <> row then SetRow(row)
end if

end event

type dw_campo from datawindow within uo_hclin_as
event type integer addcontrol ( integer fila )
event type integer addchildren ( string padre,  integer nivel )
event type integer revisar ( )
boolean visible = false
integer x = 1426
integer y = 984
integer width = 2030
integer height = 264
integer taborder = 50
string title = "none"
string dataobject = "dw_plan_fields"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer addcontrol(integer fila);string modifica, nombre, medida, valida
long i, ncampo
double minimo, maximo

ncampo = GetItemNumber(fila,'numcampo')
nombre = GetItemString(fila,'descampo')
medida = GetItemString(fila,'medida')
minimo = GetItemNumber(fila,'num_min')
maximo = GetItemNumber(fila,'num_max')
if isnull(medida) then medida=''
if isnull(nombre) then nombre='campo '+string(ncampo)
////Tipo de Control
// Etiqueta
if GetItemString(fila,'tipo') = 'E' then 
	consec = consec + 1
//	if col = 1 then PosY = PosY + altura
	if colum = 1 then PosY = PosY + altura
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_'+string(ncampo)+' dbname="etiqueta_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence=0 border="0" color="33554432" x="'+String(PosX)+'" y="'+string(posY)+'" height="56" width="4500" format="[general]" html.valueishtml="0"  name=etiqueta_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
	PosY = PosY + 100
	altura = 0 
	colum = 0
end if

// Etiqueta de selección múltiple
if GetItemString(fila,'tipo') = 'U' then 
	consec = consec + 1
//	if col = 1 then PosY = PosY + altura
	if colum = 1 then PosY = PosY + altura
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=multiple_'+string(ncampo)+' dbname="multiple_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence=0 border="0" color="33554432" x="'+String(PosX)+'" y="'+string(posY)+'" height="56" width="2501" format="[general]" html.valueishtml="0"  name=multiple_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
	PosY = PosY + 100
	altura = 0 
	colum = 0
end if

// Seleccion
if GetItemString(fila,'tipo') = 'S' then 
	consec = consec + 1
	//i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="2501" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum)+'" y="'+string(PosY)+'" height="56" width="1449" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215"  height.autosize=yes )~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="seleccion_'+string(ncampo)+'" values="	1/	0" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX +1449)+'" y="'+string(PosY)+'" height="56" width="105" format="[general]" html.valueishtml="0"  name=seleccion_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 1
	end if
end if

// Si / No
if GetItemString(fila,'tipo') = 'N' then
	consec = consec + 1
	//i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="2501" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum)+'" y="'+string(PosY)+'" height="56" width="1449" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215"  height.autosize=yes)~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=sino_'+string(ncampo)+' dbname="sino_'+string(ncampo)+'" values="Si	1/No	0/" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + 1449)+'" y="'+string(PosY)+'" height="56" width="393" format="[general]" html.valueishtml="0"  name=sino_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" radiobuttons.columns=2 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 1
	end if
end if
// Lista
if GetItemString(fila,'tipo') = 'L' then
	dw_ls.Retrieve(GetItemString(fila,'codplantilla'),GetItemNumber(fila,'numcampo'))
	dw_ls.setfilter("estado='1'")
	dw_ls.filter()
	for i = 1 to dw_ls.RowCount()
//		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + string(dw_ls.GetItemNumber(i,'nitem')) + "/"
		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + dw_ls.GetItemString(i,'descripcion') + "/"
	next
	consec = consec + 1
	//i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*2500)+'" y="'+string(PosY)+'" height="56" width="2501" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum)+'" y="'+string(PosY)+'" height="56" width="1450" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215"  height.autosize=yes)~r~n'	
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=lista_'+string(ncampo)+' dbname="lista_'+string(ncampo)+'" values="'+modifica+'" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="1289" format="[general]" html.valueishtml="0"  name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX +1450)+'" y="'+string(PosY)+'" height="56" width="1289" format="[general]" html.valueishtml="0"  name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 170 then
			PosY = Posy + altura
		else
			PosY = PosY + 170
		end if
		colum = 0
	else
		altura = 170
		colum = 1
	end if
end if
// texto
if GetItemString(fila,'tipo') = 'T' then		
	consec = consec + 1
	//i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="2501" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum)+'" y="'+string(PosY)+'" height="56" width="1449" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215"  height.autosize=yes)~r~n'
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=texto_'+string(ncampo)+' dbname="texto_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX +1449)+'" y="'+string(PosY)+'" height="132" width="1280" format="[general]" html.valueishtml="0"  name=texto_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=255 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 270 then
			PosY = Posy + altura
		else
			PosY = PosY + 270
		end if
		colum = 0
	else
		altura = 270
		colum = 1
	end if
end if
// Memo
//if GetItemString(fila,'tipo') = 'M' then
//	consec = consec + 1
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1500)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=memo_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
//	i_campos = i_campos + 'column=(type=char(32766) updatewhereclause=yes name=memo_'+string(ncampo)+' dbname="memo_'+string(ncampo)+'" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1500)+'" y="'+string(PosY+80)+'" height="696" width="1458" format="[general]" html.valueishtml="0"  name=memo_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
//
//	if colum = 1 then 
//		if altura > 870 then
//			PosY = Posy + altura
//		else
//			PosY = PosY + 870
//		end if
//		colum = 0
//	else
//		altura = 870
//		colum = 1
//	end if
//
//end if

// Numerico
if GetItemString(fila,'tipo') = 'R' then
	//validation="double(gettext()) > 0 and double(gettext()) < 100 " validationmsg="'El valor debe estar entre'" )
	if not isNull(minimo) and not isNull(maximo) then
		valida = 'validation= "double(gettext()) >= '+string(minimo) + ' and double(gettext()) <= ' +string(maximo) + '" validationmsg="~'El valor debe estar entre ' +string(minimo) +' y '+string(maximo) +'~'"'
	elseif not isNull(minimo) then
		valida = 'validation= "double(gettext()) >= '+string(minimo) + '" validationmsg="~'El valor debe ser mayor que ' +string(minimo) + '~'"'
	elseif not isNull(maximo) then
		valida = 'validation= "double(gettext()) <= '+string(maximo) + '" validationmsg="~'El valor debe ser menor que ' +string(maximo) + '~'"'
	end if
	consec = consec + 1
	//i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="2501" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum)+'" y="'+string(PosY)+'" height="56" width="1449" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" height.autosize=yes)~r~n'
	i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="numero_'+string(ncampo)+'" '+valida+' )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="1" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + 1449)+'" y="'+string(PosY)+'" height="56" width="370" format="[general]" html.valueishtml="0"  name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="###,###.00" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+medida+'" border="0" color="0" x="'+String(PosX + colum*1400 + 410)+'" y="'+string(PosY+80)+'" height="56" width="1645" html.valueishtml="0"  name=medida_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 270 then
			PosY = Posy + altura
		else
			PosY = PosY + 270
		end if
		colum = 0
	else
		altura = 270
		colum = 1
	end if
end if
// Fecha
if GetItemString(fila,'tipo') = 'F' then 
	consec = consec + 1
	//i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="2501" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum)+'" y="'+string(PosY)+'" height="56" width="1449" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" height.autosize=yes)~r~n'
	i_campos = i_campos + 'column=(type=datetime updatewhereclause=yes name=fecha_'+string(ncampo)+'  dbname="fecha_'+string(ncampo)+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + 1449)+'" y="'+string(PosY)+'" height="56" width="361" format="dd/mm/yyyy" html.valueishtml="0"  name=fecha_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="dd/mm/yyyy" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
	if colum = 1 then 
		if altura > 270 then
			PosY = Posy + altura
		else
			PosY = PosY + 270
		end if
		colum = 0
	else
		altura = 270
		colum = 1
	end if
end if

Return 0

end event

event type integer addchildren(string padre, integer nivel);long fila, f, i, cant
integer ret
//st_uobject st_uo
string modifica, texto

fila = dw_campo.Find("padre=" + padre,1,dw_campo.RowCount())
do while fila > 0
	cant = cant + 1
	PosX = 30 * Nivel
	if Event addControl(fila) = -1 then
		MessageBox('Error','Error Adicionando control')
		Return -1
	end if
	ret = Event addChildren(String(dw_campo.GetItemNumber(fila,'numcampo')), Nivel + 1)
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + padre,fila + 1,dw_campo.RowCount())
	//if fila = 0 and ret = 0 and colum = 1 then 
		PosY = PosY + altura
		colum = 0
	//end if
loop
Return cant

end event

event type integer revisar();if rowcount() = 0 then Return -1
integer i, f, Nivel=1, col = 0
long padre,f_pad
PosX = 10
PosY = 10

for i = 1 to this.RowCount()
	padre=GetItemNumber(i,'padre')
	f_pad=find('numcampo='+string(padre),1,rowcount())
	if isnull(padre) or (f_pad=0 and padre<>0 ) then 
		MessageBox('Atención','La plantilla tiene campos erróneos, revisela para poder trabajar con ella (Hay campos que no tienen campo padre)')
		return -1
	end if
	if padre<>0 then
		if not(getitemstring(f_pad,'tipo')='E' or getitemstring(f_pad,'tipo')='U') then
			MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos cuyo padre no es etiqueta)')
			return -1
		end if
	end if
	if padre = 0 then
		if event addControl(i) = -1 then
			MessageBox('Error','Error Adicionando control')
			Return -1
		end if
		// Children
		event addChildren(String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
	end if
next
return 1

end event

event constructor;setTransObject(SQLCA)

end event

event retrieveend;//if rowcount = 0 then Return
//integer i, f, Nivel=1, col = 0
//
//PosX = 10
//PosY = 10
//
//for i = 1 to this.RowCount()
//	if GetItemNumber(i,'padre') = 0 then
//		if event addControl(i) = -1 then
//			MessageBox('Error','Error Adicionando control')
//			Return -1
//		end if
//		// Children
//		event addChildren(String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
//	end if
//next
//
end event

type st_2 from statictext within uo_hclin_as
integer x = 1815
integer y = 384
integer width = 1317
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
boolean focusrectangle = false
end type

type dw_plants from datawindow within uo_hclin_as
event pinta ( )
event keypres pbm_dwnkey
integer x = 37
integer width = 1344
integer height = 128
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_plantillas"
boolean border = false
boolean livescroll = true
end type

event pinta();accepttext()

if i_cplant=getitemstring(1,1) then return

if i_cambia then
	choose case messagebox('Atención','Realizó cambios en la plantilla de '+i_message+', desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then
				rollback;
			else
				commit;
			end if
		case 2
			i_cambia=false
		case 3
			setitem(1,1,i_cplant)
			return
	end choose
end if
i_cplant = getitemstring(1,1)

//i_pudo_orden=true

string sintaxis, buffer, err
i_campos = ''
i_columnas = ''
i_textos = ''
consec = 0
PosX = 10
PosY = 10
altura=0
colum = 0
dw_1.Reset()
dw_ficha.Retrieve(i_cplant)
dw_campo.Retrieve(i_cplant)
if dw_campo.event revisar()=-1 THEN 
	return
end if

sintaxis = 'release 10.5;~r~n' + &
' datawindow(units=0 timer_interval=0 color=67108864 processing=0 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.preview.outline=yes hidegrayline=no )~r~n' +&
' header(height=0 color="536870912" )~r~n' +&
' summary(height=0 color="536870912" )~r~n' + &
' footer(height=0 color="536870912" )~r~n' +&
' detail(height=1096 color="536870912" ) ~r~n' +&
'table('

sintaxis = sintaxis + i_campos + ') ~r~n'
sintaxis = sintaxis + i_columnas
sintaxis = sintaxis + i_textos
dw_1.Create(sintaxis,err)
if err <> '' then
	messageBox('Error',err)
end if
err = dw_1.Modify('Datawindow.Detail.height="'+string(PosY+altura)+'"')
if err <> '' then
	messageBox('Error',err)
end if

dw_historial.Retrieve(i_cplant, clugar)
dw_historial.TriggerEvent(rowfocuschanged!)

end event

event keypres;//if key=i_nextitem or key=i_previtem or key=i_nextchild then navegar(key)
end event

event constructor;if i_displayonly = TRUE then Visible = FALSE
getchild('codplantilla',idw_plants)
idw_plants.settransobject(sqlca)
idw_plants.setfilter("estado='1'")
idw_plants.filter()


end event

event itemchanged;message.powerobjectparm=dw_plants
timer.stop()
timer.start(0.4)

end event

type t1 from tab within uo_hclin_as
integer x = 50
integer y = 340
integer width = 3643
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean boldselectedtext = true
integer selectedtab = 1
p1 p1
p2 p2
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.Control[]={this.p1,&
this.p2}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
end on

event selectionchanged;if newindex = 1 then
	dw_1.Visible = TRUE
	dw_ficha.Visible = FALSE
else
	dw_1.Visible = FALSE
	dw_ficha.Visible = TRUE
end if

end event

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 3607
integer height = -4
long backcolor = 67108864
string text = "Datos Encuesta"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
end type

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 3607
integer height = -4
long backcolor = 67108864
string text = "Ficha Técnica"
long tabtextcolor = 33554432
string picturename = "resultados.ico"
long picturemaskcolor = 536870912
end type

type dw_1 from datawindow within uo_hclin_as
integer x = 55
integer y = 448
integer width = 4311
integer height = 1544
integer taborder = 50
string title = "none"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;//if dw_res_new.RowCount() = 0 then 
//	MessageBox('Atención','No tiene resultados relacionados')
//	Return 0
//end if
//opensheetwithparm(w_res_selec,dw_res_new,w_principal,0,original!)
//
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())

end event

event itemchanged;i_cambia = TRUE

end event

event itemfocuschanged;long fila
string ayuda
//st_muestra.text = ''
fila = dw_campo.Find("numcampo="+Describe(string(dwo.name)+".Tag"),1,dw_campo.RowCount())
if fila = 0 then Return -1
ayuda = dw_campo.getItemString(fila,'ayuda')
if not isNull(ayuda) and trim(ayuda) <> '' then
	//st_muestra.text = ayuda
end if
if dw_campo.getItemString(fila,'tipo') = 'M' then
//	uo_1.retrieve(dw_campo.getItemNumber(fila,'numcampo'), dw_campo.GetItemString(fila,'tipo_memo'))
end if

end event

event losefocus;if AcceptText() = -1 then Return -1

end event

type dw_ficha from datawindow within uo_hclin_as
boolean visible = false
integer x = 50
integer y = 448
integer width = 3131
integer height = 1244
integer taborder = 70
string title = "none"
string dataobject = "dw_ficha_tecnica"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

