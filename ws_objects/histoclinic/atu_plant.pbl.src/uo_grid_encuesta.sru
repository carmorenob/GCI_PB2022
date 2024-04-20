$PBExportHeader$uo_grid_encuesta.sru
forward
global type uo_grid_encuesta from userobject
end type
type pb_ref from picturebutton within uo_grid_encuesta
end type
type em_hasta from editmask within uo_grid_encuesta
end type
type st_5 from statictext within uo_grid_encuesta
end type
type st_4 from statictext within uo_grid_encuesta
end type
type em_desde from editmask within uo_grid_encuesta
end type
type st_3 from statictext within uo_grid_encuesta
end type
type cbx_todas from checkbox within uo_grid_encuesta
end type
type dw_lugar from datawindow within uo_grid_encuesta
end type
type dw_valor from datawindow within uo_grid_encuesta
end type
type dw_ls from datawindow within uo_grid_encuesta
end type
type dw_campo from datawindow within uo_grid_encuesta
end type
type dw_plants from datawindow within uo_grid_encuesta
end type
type dw_1 from datawindow within uo_grid_encuesta
end type
type dw_historial from datawindow within uo_grid_encuesta
end type
type st_2 from statictext within uo_grid_encuesta
end type
type gb_1 from groupbox within uo_grid_encuesta
end type
end forward

global type uo_grid_encuesta from userobject
integer width = 4905
integer height = 1612
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event closequery pbm_closequery
event cambio_diags ( )
pb_ref pb_ref
em_hasta em_hasta
st_5 st_5
st_4 st_4
em_desde em_desde
st_3 st_3
cbx_todas cbx_todas
dw_lugar dw_lugar
dw_valor dw_valor
dw_ls dw_ls
dw_campo dw_campo
dw_plants dw_plants
dw_1 dw_1
dw_historial dw_historial
st_2 st_2
gb_1 gb_1
end type
global uo_grid_encuesta uo_grid_encuesta

type variables
private string i_tipo,i_cplant,i_ccont, i_textos, i_campos, i_columnas, i_comps, camposh,lugares
private long posX, posY, colum, altura, consec, alto_head, max_level
private datawindowchild idw_plants,idw_lista
private uo_timer timer
boolean i_cambia, i_nueva//para saber si se ha modificado algo
string i_message, i_fecha1,i_fecha2
boolean i_displayonly //,i_puede_modif//para que si no pudo crear una orden no siga enviando eso

end variables

forward prototypes
public function integer reset ()
public function integer retrieve (string p_codplantilla, long p_nencuesta)
end prototypes

event closequery;if not i_cambia then return 0
choose case messagebox('Atención','Realizón cambios en datos de '+i_message+'. Desea guardar los cambios?',question!,yesnocancel!,1)
	case 2
		i_cambia=false
		return 0
	case 3
		return 1
end choose
end event

event cambio_diags();//
end event

public function integer reset ();i_cplant=''
dw_historial.reset()
idw_plants.reset()
i_cambia=false
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

on uo_grid_encuesta.create
this.pb_ref=create pb_ref
this.em_hasta=create em_hasta
this.st_5=create st_5
this.st_4=create st_4
this.em_desde=create em_desde
this.st_3=create st_3
this.cbx_todas=create cbx_todas
this.dw_lugar=create dw_lugar
this.dw_valor=create dw_valor
this.dw_ls=create dw_ls
this.dw_campo=create dw_campo
this.dw_plants=create dw_plants
this.dw_1=create dw_1
this.dw_historial=create dw_historial
this.st_2=create st_2
this.gb_1=create gb_1
this.Control[]={this.pb_ref,&
this.em_hasta,&
this.st_5,&
this.st_4,&
this.em_desde,&
this.st_3,&
this.cbx_todas,&
this.dw_lugar,&
this.dw_valor,&
this.dw_ls,&
this.dw_campo,&
this.dw_plants,&
this.dw_1,&
this.dw_historial,&
this.st_2,&
this.gb_1}
end on

on uo_grid_encuesta.destroy
destroy(this.pb_ref)
destroy(this.em_hasta)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.em_desde)
destroy(this.st_3)
destroy(this.cbx_todas)
destroy(this.dw_lugar)
destroy(this.dw_valor)
destroy(this.dw_ls)
destroy(this.dw_campo)
destroy(this.dw_plants)
destroy(this.dw_1)
destroy(this.dw_historial)
destroy(this.st_2)
destroy(this.gb_1)
end on

event constructor;timer=create uo_timer

end event

type pb_ref from picturebutton within uo_grid_encuesta
integer x = 3374
integer y = 76
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
string picturename = "refrescar.GIF"
alignment htextalign = left!
string powertiptext = "Traer Datos"
end type

event clicked;long j, ncampo, i, f
st_2.Text = ''
dw_historial.retrieve(i_cplant ,lugares,datetime(i_fecha1),datetime(date(i_fecha2),time("23:59")))
dw_1.RowsMove(1, dw_1.RowCount(), Primary!, dw_1,1, Delete!)
dw_1.reset()
if dw_historial.RowCount() = 0  then Return
st_2.Text = 'Registro '+string(dw_1.GetRow()) +' de '+string(dw_1.RowCount())
dw_1.SetRedraw(FALSE)
for i = 1 to dw_historial.RowCount()
	dw_valor.Retrieve(dw_historial.GetItemString(i,'codplantilla'),dw_historial.GetItemString(i,'clugar'),dw_historial.GetItemNumber(i,'nencuesta'))
	f = dw_1.InsertRow(0)
	for j = 1 to dw_valor.RowCount()
		ncampo = dw_valor.GetItemNumber(j,'item')
		choose case dw_valor.GetItemString(j,'tipo')
			case 'S'
				dw_1.SetItem(f,'seleccion_'+string(ncampo),dw_valor.GetItemString(j,'texto'))
			case 'N'
				dw_1.SetItem(f,'sino_'+string(ncampo),dw_valor.GetItemString(j,'sino'))
			case 'L'
				dw_1.SetItem(f,'lista_'+string(ncampo),dw_valor.GetItemString(j,'texto'))
			case 'T'
				dw_1.SetItem(f,'texto_'+string(ncampo),dw_valor.GetItemString(j,'texto'))
			case 'R'
				dw_1.SetItem(f,'numero_'+string(ncampo),dw_valor.GetItemNumber(j,'numero'))
			case 'F'
				dw_1.SetItem(f,'fecha_'+string(ncampo),dw_valor.GetItemDateTime(j,'fecha'))
		end choose
	next
	dw_1.SetRedraw(TRUE)
next


end event

type em_hasta from editmask within uo_grid_encuesta
integer x = 2843
integer y = 132
integer width = 379
integer height = 72
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

event modified;long no_dias

i_fecha1=em_desde.text
i_fecha2=em_hasta.text
no_dias=DaysAfter(date(i_fecha1), date(i_fecha2))
if no_dias<0 then 
	messagebox("Error Fecha","El intervalo de fecha es erroneo.")
	em_desde.text="00/00/0000"
	em_hasta.text="00/00/0000"
else
	dw_historial.setfilter("")
	dw_historial.filter( )
	pb_ref.event clicked()
end if
end event

type st_5 from statictext within uo_grid_encuesta
integer x = 2683
integer y = 140
integer width = 155
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_4 from statictext within uo_grid_encuesta
integer x = 2071
integer y = 140
integer width = 169
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type em_desde from editmask within uo_grid_encuesta
integer x = 2254
integer y = 140
integer width = 379
integer height = 72
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_3 from statictext within uo_grid_encuesta
integer x = 2071
integer y = 76
integer width = 631
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Entre el intervalo de fechas:"
boolean focusrectangle = false
end type

type cbx_todas from checkbox within uo_grid_encuesta
integer x = 1431
integer y = 84
integer width = 613
integer height = 60
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas las encuestas"
end type

event clicked;dw_historial.setfilter("")
dw_historial.filter( )
if cbx_todas.checked=true then
	em_desde.enabled=false
	em_hasta.enabled=false
	em_desde.text="00/00/0000"
	em_hasta.text="00/00/0000"
	i_fecha1="1900-01-01"
	i_fecha2=string(Today ( ))
	dw_historial.retrieve(i_cplant ,lugares,datetime(i_fecha1),datetime(i_fecha2))
	pb_ref.event clicked()
else
	em_desde.enabled=true
	em_hasta.enabled=true
end if

end event

type dw_lugar from datawindow within uo_grid_encuesta
integer x = 32
integer y = 128
integer width = 1175
integer height = 132
integer taborder = 60
string title = "none"
string dataobject = "dw_combo_lugar_atu"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleshadowbox!
end type

event constructor;settransobject( sqlca)
retrieve( )

end event

event itemchanged;accepttext()
lugares=dw_lugar.getitemstring(1,1)

end event

type dw_valor from datawindow within uo_grid_encuesta
event rec_revisa_padre ( long padre )
boolean visible = false
integer x = 3931
integer y = 76
integer width = 187
integer height = 112
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

type dw_ls from datawindow within uo_grid_encuesta
boolean visible = false
integer x = 3721
integer y = 40
integer width = 178
integer height = 156
integer taborder = 80
string title = "none"
string dataobject = "dw_campo_lista"
boolean resizable = true
boolean border = false
boolean livescroll = true
end type

event constructor;setTransObject(SQLCA)

end event

type dw_campo from datawindow within uo_grid_encuesta
event type integer addcontrol ( integer fila,  integer nivel )
event type integer addchildren ( string padre,  integer nivel )
event type integer revisar ( )
event type long ancho_hijos ( long padre )
boolean visible = false
integer x = 4119
integer y = 52
integer width = 169
integer height = 156
integer taborder = 50
string title = "none"
string dataobject = "dw_plan_fields"
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type integer addcontrol(integer fila, integer nivel);string modifica, nombre, medida, limites, agregado
long i, ncampo
double vmin, vmax

ncampo = GetItemNumber(fila,'numcampo')
nombre = GetItemString(fila,'descampo')
//agregado = GetItemString(fila,'agregado')
vmin = GetItemNumber(fila,'num_min')
vmax = GetItemNumber(fila,'num_max')
if isnull(medida) then medida=''
if isnull(nombre) then nombre='campo '+string(ncampo)
////Tipo de Control
// Etiqueta
if GetItemString(fila,'tipo') = 'E' then 
	consec = consec + 1
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_'+string(ncampo)+' dbname="'+nombre+'" initial="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=header id='+string(consec)+' alignment="2" tabsequence=0 border="6" color="33554432" x="'+String(PosX)+'" y="'+string(4 + (nivel )*66 + alto_head)+'" height="56" width="'+string(Event ancho_hijos(ncampo) - 10)+'" format="[general]" html.valueishtml="0"  name=etiqueta_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
end if

// Seleccion
if GetItemString(fila,'tipo') = 'S' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="250" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
	//i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="seleccion_'+string(ncampo)+'" values="	1/	0" )~r~n'
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="'+nombre+'" values="	1/	0" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="250" format="[general]" html.valueishtml="0" protect="0~tif(0=1,0,1)"  name=seleccion_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	PosX = PosX + 263
end if

// Si / No
if GetItemString(fila,'tipo') = 'N' then
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="390" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=sino_'+string(ncampo)+' dbname="'+nombre+'" values="Si	1/No	0/" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="390" format="[general]" html.valueishtml="0" protect="0~tif(0=1,0,1)" name=sino_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" radiobuttons.columns=2 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )" font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	PosX = PosX + 403
end if

// Lista
if GetItemString(fila,'tipo') = 'L' then
	dw_ls.Retrieve(GetItemString(fila,'codplantilla'),GetItemNumber(fila,'numcampo'))
	for i = 1 to dw_ls.RowCount()
		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + string(dw_ls.GetItemNumber(i,'nitem')) + "/"
	next
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="250" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'	
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=lista_'+string(ncampo)+' dbname="'+nombre+'" values="'+modifica+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="250" format="[general]" html.valueishtml="0" protect="0~tif(0=1,0,1)" name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=no  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )" font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	PosX = PosX + 263
end if

// texto
if GetItemString(fila,'tipo') = 'T' then		
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="400" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=texto_'+string(ncampo)+' dbname="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="400" format="[general]" html.valueishtml="0" protect="0~tif(0=1,0,1)" name=texto_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=255 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	PosX = PosX + 413
end if

// Numerico
if GetItemString(fila,'tipo') = 'R' then
	consec = consec + 1
	if not isNull(vmin) and not isNull(vmin) and (vmin < vmax) then
		limites = 'validation="dec(getText()) >= '+string(vmin) + ' and dec(getText()) <= '+string(vmax) +'"'
	else
		limites=''
	end if
	
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="250" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
	i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="'+nombre+'" '+limites+' )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="250" format="[general]" html.valueishtml="0" protect="0~tif(0=1,0,1)" name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=no editmask.mask="###,###.00" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="250" format="#,##0.00" html.valueishtml="0" protect="0~tif(0=1,0,1)" name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1"  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+medida+'" border="0" color="0" x="'+String(PosX  + 310)+'" y="'+string(PosY+80)+'" height="56" width="645" html.valueishtml="0"  name=medida_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
	PosX = PosX + 263
	if agregado = '1' then  // Promedio
		i_textos = i_textos + 'text(band=header alignment="2" text="Prom '+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="250" html.valueishtml="0"  name=numero_tot_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15780518" )~r~n'
		i_columnas = i_columnas + 'compute(band=detail alignment="2" expression="cumulativesum(numero_'+string(ncampo)+')/cumulativeSum(if(not isNull(numero_'+string(ncampo)+'),1,0))" border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="250" format="#,##0.00" html.valueishtml="0" name=numero_tot_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
		PosX = PosX + 263
	    i_comps = i_comps + 'compute(band=trailer.1 alignment="2" expression="avg(numero_'+string(ncampo)+' for group 1)" border="0" color="0" x="'+String(PosX - 263 )+'" y="'+string(PosY)+'" height="56" width="250" format="#,##0.00" html.valueishtml="0"  name=compute_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
	elseif agregado = '2' then
		i_textos = i_textos + 'text(band=header alignment="2" text="Acum '+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="250" html.valueishtml="0"  name=numero_tot_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="15780518" )~r~n'
		i_columnas = i_columnas + 'compute(band=detail alignment="2" expression="cumulativesum(numero_'+string(ncampo)+')" border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="250" format="#,##0.00" html.valueishtml="0" name=numero_tot_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0 ,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
		PosX = PosX + 263
	    i_comps = i_comps + 'compute(band=trailer.1 alignment="2" expression="sum(numero_'+string(ncampo)+' for group 1)" border="0" color="0" x="'+String(PosX -263 )+'" y="'+string(PosY)+'" height="56" width="250" format="#,##0.00" html.valueishtml="0"  name=compute_'+string(ncampo)+' visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" ) ~r~n'
	end if
end if

// Fecha
if GetItemString(fila,'tipo') = 'F' then 
	consec = consec + 1
	i_textos = i_textos + 'text(band=header alignment="2" text="'+nombre+'" border="6" color="0" x="'+String(PosX )+'" y="'+string(4 + (max_level)*66 + alto_head)+'" height="124" width="340" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424" )~r~n'
	i_campos = i_campos + 'column=(type=datetime updatewhereclause=yes name=fecha_'+string(ncampo)+'  dbname="'+nombre+'" )~r~n'
	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX)+'" y="'+string(PosY)+'" height="56" width="340" format="dd/mm/yyyy" html.valueishtml="0" protect="0~tif(0=1,0,1)" name=fecha_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="dd/mm/yyyy" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400~tif ( currentrow()=getrow() , 700 , 400 )"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="536870912~tif ( 1=0,  rgb(220,192,192), RGB(255,255,255) )" )~r~n'
	PosX = PosX + 353
end if

Return 0
















//string modifica, nombre, medida, valida
//long i, ncampo
//double minimo, maximo
//
//ncampo = GetItemNumber(fila,'numcampo')
//nombre = GetItemString(fila,'descampo')
//medida = GetItemString(fila,'medida')
//minimo = GetItemNumber(fila,'num_min')
//maximo = GetItemNumber(fila,'num_max')
//if isnull(medida) then medida=''
//if isnull(nombre) then nombre='campo '+string(ncampo)
//////Tipo de Control
//// Etiqueta
//if GetItemString(fila,'tipo') = 'E' then 
//	consec = consec + 1
//	PosX = consec*10 + 10
////	if col = 1 then PosY = PosY + altura
////	if colum = 1 then PosY = PosY + altura
//	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=etiqueta_'+string(ncampo)+' dbname="etiqueta_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence=0 border="0" color="33554432" x="'+String(PosX)+'" y="'+string(posY)+'" height="56" width="1362" format="[general]" html.valueishtml="0"  name=etiqueta_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
////	PosY = PosY + 100
//	altura = 0 
//	colum = 0
//end if
//
////// Etiqueta de selección múltiple
////if GetItemString(fila,'tipo') = 'U' then 
////	consec = consec + 1
////	PosX = consec*10 + 10
//////	if col = 1 then PosY = PosY + altura
////	if colum = 1 then PosY = PosY + altura
////	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=multiple_'+string(ncampo)+' dbname="multiple_'+string(ncampo)+'" initial="'+nombre+'" )~r~n'
////	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence=0 border="0" color="33554432" x="'+String(PosX)+'" y="'+string(posY)+'" height="56" width="1362" format="[general]" html.valueishtml="0"  name=multiple_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=0 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autohscroll=yes edit.displayonly=yes font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="12639424")~r~n'
//////	PosY = PosY + 100
////	altura = 0 
////	colum = 0
////end if
//
//// Seleccion
//if GetItemString(fila,'tipo') = 'S' then 
//	consec = consec + 1
//	PosX = consec*10 + 10
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=selec_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
//	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=seleccion_'+string(ncampo)+' dbname="seleccion_'+string(ncampo)+'" values="	1/	0" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="2" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY + 80)+'" height="56" width="105" format="[general]" html.valueishtml="0"  name=seleccion_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" checkbox.text="" checkbox.on="1" checkbox.off="0" checkbox.scale=no checkbox.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
////	if colum = 1 then 
////		if altura > 170 then
////			PosY = Posy + altura
////		else
////			PosY = PosY + 170
////		end if
////		colum = 0
////	else
////		altura = 170
////		colum = 1
////	end if
//end if
//
//// Si / No
//if GetItemString(fila,'tipo') = 'N' then
//	consec = consec + 1
//	PosX = consec*10 + 10
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="1689" html.valueishtml="0"  name=sino_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
//	i_campos = i_campos + 'column=(type=char(1) updatewhereclause=yes name=sino_'+string(ncampo)+' dbname="sino_'+string(ncampo)+'" values="Si	1/No	0/" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="393" format="[general]" html.valueishtml="0"  name=sino_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" radiobuttons.columns=2 radiobuttons.scale=no radiobuttons.threed=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="536870912" )~r~n'
////	if colum = 1 then 
////		if altura > 170 then
////			PosY = Posy + altura
////		else
////			PosY = PosY + 170
////		end if
////		colum = 0
////	else
////		altura = 170
////		colum = 1
////	end if
//end if
//// Lista
//if GetItemString(fila,'tipo') = 'L' then
//	dw_ls.Retrieve(GetItemString(fila,'codplantilla'),GetItemNumber(fila,'numcampo'))
//	for i = 1 to dw_ls.RowCount()
////		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + string(dw_ls.GetItemNumber(i,'nitem')) + "/"
//		modifica = modifica + dw_ls.GetItemString(i,'descripcion') + "~t" + dw_ls.GetItemString(i,'descripcion') + "/"
//	next
//	consec = consec + 1
//	PosX = consec*10 + 10
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="1689" html.valueishtml="0"  name=lista_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'	
//	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=lista_'+string(ncampo)+' dbname="lista_'+string(ncampo)+'" values="'+modifica+'" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="0" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="1289" format="[general]" html.valueishtml="0"  name=lista_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" ddlb.limit=0 ddlb.allowedit=no ddlb.case=any ddlb.vscrollbar=yes ddlb.useasborder=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
////	if colum = 1 then 
////		if altura > 170 then
////			PosY = Posy + altura
////		else
////			PosY = PosY + 170
////		end if
////		colum = 0
////	else
////		altura = 170
////		colum = 1
////	end if
//end if
//// texto
//if GetItemString(fila,'tipo') = 'T' then		
//	consec = consec + 1
//	PosX = consec*10 + 10
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="1280" html.valueishtml="0"  name=texto_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
//	i_campos = i_campos + 'column=(type=char(255) updatewhereclause=yes name=texto_'+string(ncampo)+' dbname="texto_'+string(ncampo)+'" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="132" width="1280" format="[general]" html.valueishtml="0"  name=texto_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" edit.limit=255 edit.case=any edit.focusrectangle=no edit.autoselect=yes edit.autovscroll=yes edit.vscrollbar=yes  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
//	if colum = 1 then 
//		if altura > 270 then
//			PosY = Posy + altura
//		else
//			PosY = PosY + 270
//		end if
//		colum = 0
//	else
//		altura = 270
//		colum = 1
//	end if
//end if
//
//// Numerico
//if GetItemString(fila,'tipo') = 'R' then
//	//validation="double(gettext()) > 0 and double(gettext()) < 100 " validationmsg="'El valor debe estar entre'" )
//	if not isNull(minimo) and not isNull(maximo) then
//		valida = 'validation= "double(gettext()) >= '+string(minimo) + ' and double(gettext()) <= ' +string(maximo) + '" validationmsg="~'El valor debe estar entre ' +string(minimo) +' y '+string(maximo) +'~'"'
//	elseif not isNull(minimo) then
//		valida = 'validation= "double(gettext()) >= '+string(minimo) + '" validationmsg="~'El valor debe ser mayor que ' +string(minimo) + '~'"'
//	elseif not isNull(maximo) then
//		valida = 'validation= "double(gettext()) <= '+string(maximo) + '" validationmsg="~'El valor debe ser menor que ' +string(maximo) + '~'"'
//	end if
//	consec = consec + 1
//	PosX = consec*10 + 10
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="645" html.valueishtml="0"  name=numero_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
//	i_campos = i_campos + 'column=(type=number updatewhereclause=yes name=numero_'+string(ncampo)+' dbname="numero_'+string(ncampo)+'" '+valida+' )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="1" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="370" format="[general]" html.valueishtml="0"  name=numero_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="###,###.00" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
////	i_textos = i_textos + 'text(band=detail alignment="0" text="'+medida+'" border="0" color="0" x="'+String(PosX + colum*1400 + 410)+'" y="'+string(PosY+80)+'" height="56" width="1645" html.valueishtml="0"  name=medida_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
////	if colum = 1 then 
////		if altura > 270 then
////			PosY = Posy + altura
////		else
////			PosY = PosY + 270
////		end if
////		colum = 0
////	else
////		altura = 270
////		colum = 1
////	end if
//end if
//// Fecha
//if GetItemString(fila,'tipo') = 'F' then 
//	consec = consec + 1
//	PosX = consec*10 + 10
//	i_textos = i_textos + 'text(band=detail alignment="0" text="'+nombre+'" border="0" color="0" x="'+String(PosX + colum*1400)+'" y="'+string(PosY)+'" height="56" width="1645" html.valueishtml="0"  name=fecha_'+string(ncampo)+'_t visible="1"  font.face="Tahoma" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="1" background.color="16777215" )~r~n'
//	i_campos = i_campos + 'column=(type=datetime updatewhereclause=yes name=fecha_'+string(ncampo)+'  dbname="fecha_'+string(ncampo)+'" )~r~n'
//	i_columnas = i_columnas + 'column(band=detail id='+string(consec)+' alignment="0" tabsequence='+string(consec)+' border="5" color="33554432" x="'+String(PosX + colum*1400)+'" y="'+string(PosY+80)+'" height="56" width="361" format="dd/mm/yyyy" html.valueishtml="0"  name=fecha_'+string(ncampo)+' Tag="'+string(ncampo)+'" visible="1" editmask.spin=yes editmask.mask="dd/mm/yyyy" editmask.spinincr=0 editmask.focusrectangle=no  font.face="Arial" font.height="-8" font.weight="400"  font.family="2" font.pitch="2" font.charset="0" background.mode="2" background.color="16777215" )~r~n'
////	if colum = 1 then 
////		if altura > 270 then
////			PosY = Posy + altura
////		else
////			PosY = PosY + 270
////		end if
////		colum = 0
////	else
////		altura = 270
////		colum = 1
////	end if
//end if
//
//Return 0
//
end event

event type integer addchildren(string padre, integer nivel);long fila, f, i, cant
integer ret
string modifica, texto

fila = dw_campo.Find("padre=" + padre,1,dw_campo.RowCount())
do while fila > 0
	cant = cant + 1
//	PosX = 30 * Nivel
	if Event addControl(fila,nivel) = -1 then
		MessageBox('Error','Error Adicionando control')
		Return -1
	end if
	ret = Event addChildren(String(dw_campo.GetItemNumber(fila,'numcampo')), Nivel + 1)
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + padre,fila + 1,dw_campo.RowCount())
	if fila = 0 and ret = 0 then 
//		PosY = PosY + altura
//		colum = 0
	end if
loop
Return cant

end event

event type integer revisar();if rowcount() = 0 then Return -1
integer i, f, nivel = 1, col = 0
long padre,f_pad, subnivel

for i = 1 to this.RowCount()
	padre=GetItemNumber(i,'padre')
	f_pad=find('numcampo='+string(padre),1,rowcount())
	if isnull(padre) or (f_pad=0 and padre<>0 ) then 
		MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos que no tienen campo padre)')
		return -1
	end if
	if padre<>0 then
		if not(getitemstring(f_pad,'tipo')='E' or getitemstring(f_pad,'tipo')='U') then
			MessageBox('Atención','La plantilla tiene campos errónes, revisela para poder trabajar con ella (Hay campos cuyo padre no es etiqueta)')
			return -1
		end if
	end if
	if padre = 0 then
		if event addControl(i,nivel) = -1 then
			MessageBox('Error','Error Adicionando control')
			Return -1
		end if
		// Children
		event addChildren(String(this.GetItemNumber(i,'numcampo')), Nivel + 1)
	end if
next
return 1

end event

event type long ancho_hijos(long padre);long f, fila, l_ancho, campo
string tipo

fila = dw_campo.Find("padre=" + string(padre),1,dw_campo.RowCount())
do while fila > 0
	tipo = GetItemString(fila,'tipo')
	choose case tipo
		case 'S' 
			campo = 263
		case 'N' 
			campo = 403
		case 'L' 
			campo = 263
		case 'T' 
			campo = 413
		case 'R' 
//			if (GetItemString(fila,'agregado') = '1' or GetItemString(fila,'agregado') = '2') and GetItemString(fila,'diagprin') = '1' then
//				campo = 263 * 2
//			else
				campo = 263
//			end if
		case 'F' 
			campo = 353
	end choose
	l_ancho = l_ancho + campo + Event ancho_hijos(GetItemNumber(fila,'numcampo'))
	if fila = dw_campo.RowCount() then EXIT
	fila = dw_campo.Find("padre=" + string(padre),fila + 1,dw_campo.RowCount())
loop
Return l_ancho

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

type dw_plants from datawindow within uo_grid_encuesta
event type integer pinta ( )
event keypres pbm_dwnkey
integer x = 37
integer width = 1344
integer height = 124
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_plantillas"
boolean border = false
boolean livescroll = true
end type

event type integer pinta();accepttext()
lugares=dw_lugar.getitemstring(1,1)
if i_cplant=getitemstring(1,1) then return -1
i_cplant = getitemstring(1,1)
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
dw_campo.Retrieve(i_cplant)
if dw_campo.rowcount()=0 then
	messageBox('Error','No hay encuestas configuradas')
	return -1
end if
if dw_campo.event revisar()=-1 THEN 
	return -1
end if

sintaxis = 'release 11.5;~r~n' + &
' datawindow(units=0 timer_interval=0 color=67108864 processing=1 HTMLDW=no print.printername="" print.documentname="" print.orientation = 0 print.margin.left = 110 print.margin.right = 110 print.margin.top = 96 print.margin.bottom = 96 print.paper.source = 0 print.paper.size = 0 print.canusedefaultprinter=yes print.prompt=no print.buttons=no print.preview.buttons=no print.cliptext=no print.overrideprintjob=no print.collate=yes print.preview.outline=yes hidegrayline=no )~r~n' +&
' header(height=0 color="536870912" )~r~n' +&
' summary(height=0 color="536870912" )~r~n' + &
' footer(height=0 color="536870912" )~r~n' +&
' detail(height=74 color="536870912" ) ~r~n' +&
'table('

sintaxis = sintaxis + i_campos + ') ~r~n'
sintaxis = sintaxis + i_columnas
sintaxis = sintaxis + i_textos
//sintaxis = sintaxis + i_comps
dw_1.Create(sintaxis,err)
if err <> '' then
	messageBox('Error',err)
end if
err = dw_1.Modify('Datawindow.header.height="'+string((max_level + 1)*66 + 70 + alto_head)+'"')
return 0

end event

event constructor;if i_displayonly = TRUE then Visible = FALSE
getchild('codplantilla',idw_plants)
idw_plants.settransobject(sqlca)

end event

event itemchanged;message.powerobjectparm=dw_plants
timer.stop()
timer.start(0.4)

end event

type dw_1 from datawindow within uo_grid_encuesta
integer x = 41
integer y = 280
integer width = 4800
integer height = 1280
integer taborder = 50
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

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

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)



end event

event rowfocuschanged;st_2.Text = 'Registro '+string(dw_1.GetRow()) +' de '+string(dw_1.RowCount())

end event

type dw_historial from datawindow within uo_grid_encuesta
boolean visible = false
integer x = 3552
integer y = 44
integer width = 128
integer height = 120
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string title = "none"
string dataobject = "dw_historial_enc_fecha"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject( sqlca)

end event

event clicked;if row > 0 then
	if GetRow() <> row then SetRow(row)
end if

end event

type st_2 from statictext within uo_grid_encuesta
integer x = 1417
integer y = 156
integer width = 608
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean focusrectangle = false
end type

type gb_1 from groupbox within uo_grid_encuesta
integer x = 1394
integer y = 32
integer width = 1861
integer height = 196
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mostrar encuestas"
end type

