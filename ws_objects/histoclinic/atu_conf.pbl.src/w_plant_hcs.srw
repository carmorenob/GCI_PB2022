$PBExportHeader$w_plant_hcs.srw
forward
global type w_plant_hcs from window
end type
type tab_2 from tab within w_plant_hcs
end type
type tp2_1 from userobject within tab_2
end type
type dw_deta from datawindow within tp2_1
end type
type tp2_1 from userobject within tab_2
dw_deta dw_deta
end type
type tp2_2 from userobject within tab_2
end type
type st_3 from statictext within tp2_2
end type
type dw_aspecto from datawindow within tp2_2
end type
type pb_7 from picturebutton within tp2_2
end type
type pb_3 from picturebutton within tp2_2
end type
type tp2_2 from userobject within tab_2
st_3 st_3
dw_aspecto dw_aspecto
pb_7 pb_7
pb_3 pb_3
end type
type tab_2 from tab within w_plant_hcs
tp2_1 tp2_1
tp2_2 tp2_2
end type
type tab_1 from tab within w_plant_hcs
end type
type tp_1 from userobject within tab_1
end type
type cb_2 from picturebutton within tp_1
end type
type cb_1 from picturebutton within tp_1
end type
type dw_l from datawindow within tp_1
end type
type dw_save_campo from datawindow within tp_1
end type
type tv_1 from treeview within tp_1
end type
type gb_3 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
cb_2 cb_2
cb_1 cb_1
dw_l dw_l
dw_save_campo dw_save_campo
tv_1 tv_1
gb_3 gb_3
end type
type tp_2 from userobject within tab_1
end type
type st_5 from statictext within tp_2
end type
type st_4 from statictext within tp_2
end type
type dw_campo_ficha from datawindow within tp_2
end type
type pb_6 from picturebutton within tp_2
end type
type pb_5 from picturebutton within tp_2
end type
type rte_1 from richtextedit within tp_2
end type
type dw_campo_cab from datawindow within tp_2
end type
type gb_4 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
st_5 st_5
st_4 st_4
dw_campo_ficha dw_campo_ficha
pb_6 pb_6
pb_5 pb_5
rte_1 rte_1
dw_campo_cab dw_campo_cab
gb_4 gb_4
end type
type tab_1 from tab within w_plant_hcs
tp_1 tp_1
tp_2 tp_2
end type
type pb_save from picturebutton within w_plant_hcs
end type
type pb_4 from picturebutton within w_plant_hcs
end type
type pb_del from picturebutton within w_plant_hcs
end type
type pb_1 from picturebutton within w_plant_hcs
end type
type st_1 from statictext within w_plant_hcs
end type
type dw_lista from datawindow within w_plant_hcs
end type
type gb_1 from groupbox within w_plant_hcs
end type
type st_estado from statictext within w_plant_hcs
end type
end forward

global type w_plant_hcs from window
integer width = 4224
integer height = 2492
boolean titlebar = true
string title = " Encuestas - Elaboración"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "Form!"
boolean toolbarvisible = false
boolean center = true
tab_2 tab_2
tab_1 tab_1
pb_save pb_save
pb_4 pb_4
pb_del pb_del
pb_1 pb_1
st_1 st_1
dw_lista dw_lista
gb_1 gb_1
st_estado st_estado
end type
global w_plant_hcs w_plant_hcs

type variables
boolean i_cambio,i_estado=false
Long il_DragSource, il_DragParent, il_Droptarget, il_rclick
integer FileNum
string i_cplant,i_operacion
uo_datastore i_dw_ing_qx
datawindowchild dwc_f

end variables

forward prototypes
public function integer addchildren (long hand, string agrupa)
public function integer insertcampo (string orden)
public function integer wf_picture (string p_tipo)
public function integer grabar ()
public function integer f_pregunta ()
public function integer revisar ()
end prototypes

public function integer addchildren (long hand, string agrupa);integer fila
long newhand
TreeViewItem ltvi_New
fila = tab_1.tp_1.dw_save_campo.Find("agrupa='" + agrupa +"'",1,tab_1.tp_1.dw_save_campo.RowCount())
do while fila > 0
	if tab_1.tp_1.dw_save_campo.GetItemString(fila,'tipo') = '0' then
		ltvi_New.Children = TRUE
	else
		ltvi_New.Children = FALSE
	end if
	ltvi_New.PictureIndex = integer(tab_1.tp_1.dw_save_campo.GetItemString(fila,'tipo')) + 1
	ltvi_New.SelectedPictureIndex = integer(tab_1.tp_1.dw_save_campo.GetItemString(fila,'tipo')) + 1
	ltvi_New.Label = tab_1.tp_1.dw_save_campo.GetItemString(fila,'descampo')
	ltvi_New.Data = tab_1.tp_1.dw_save_campo.GetItemNumber(fila,'numcampo')
	newhand = tab_1.tp_1.tv_1.InsertItemLast(hand, ltvi_New)
	If newhand < 1 Then
		MessageBox("Error", "Error insertando item", Exclamation!)
		Return -1
	End If
	tab_1.tp_1.dw_save_campo.SetItem(fila,'handle',newhand)
	addChildren(newhand,tab_1.tp_1.dw_save_campo.GetItemString(fila,'codplantilla') + String(tab_1.tp_1.dw_save_campo.GetItemNumber(fila,'numcampo')))
	if fila = tab_1.tp_1.dw_save_campo.RowCount() then EXIT
	fila = tab_1.tp_1.dw_save_campo.Find("agrupa='" + agrupa +"'",fila + 1,tab_1.tp_1.dw_save_campo.RowCount())
loop

Return 0

end function

public function integer insertcampo (string orden);integer fila, i = 0, fig
TreeViewItem ltvi

if orden = 'Borra' then
	tab_1.tp_1.tv_1.GetItem(il_rclick,ltvi)
	fila = tab_1.tp_1.dw_save_campo.Find("numcampo="+string(ltvi.Data),1,tab_1.tp_1.dw_save_campo.RowCount())
	if fila > 0 then
		tab_1.tp_1.tv_1.DeleteItem(il_rclick)
		tab_1.tp_1.dw_l.setfilter('numcampo='+string(ltvi.Data))
		tab_1.tp_1.dw_l.filter()
		do while tab_1.tp_1.dw_l.rowcount()>0
			tab_1.tp_1.dw_l.deleterow(0)
		loop
		tab_1.tp_1.dw_save_campo.DeleteRow(fila)
	end if
	Return 0
end if

long padre, previo, ret
string valor, tipo, tipopadre
if orden = 'insfolder' or orden = 'addfolder' then
	valor = 'Etiqueta'
	tipo = 'E'
else
	valor = 'Texto'
	tipo = 'T'
	fig=5
end if
do while TRUE
	i++
	fila = tab_1.tp_1.dw_save_campo.Find("descampo='" + valor + string(i) + "'",1,tab_1.tp_1.dw_save_campo.RowCount())
	if fila = 0 then 
		valor = valor + string(i)
		Exit
	end if
LOOP

tab_1.tp_1.tv_1.GetItem(il_rclick,ltvi)
padre = tab_1.tp_1.tv_1.FindItem(ParentTreeItem!, il_rclick)
previo = tab_1.tp_1.tv_1.FindItem(PreviousTreeItem!, il_rclick)

tab_1.tp_1.tv_1.GetItem(il_rclick,ltvi)
if ltvi.pictureindex=9 then 	
	tipo='S' 
	fig=2
end if

if orden = 'insfolder' then
	if padre = -1 then
		if previo = -1 then
			ret = tab_1.tp_1.tv_1.InsertItemFirst(0,valor,1)
		else
			ret = tab_1.tp_1.tv_1.InsertItem(0,previo,valor,1)
		end if
	else
		if previo = -1 then
			ret = tab_1.tp_1.tv_1.InsertItemFirst(padre,valor,1)
		else
			ret = tab_1.tp_1.tv_1.InsertItem(padre,previo,valor,1)
		end if
	end if
elseif orden = 'addfolder' then
	if padre = -1 then
		ret = tab_1.tp_1.tv_1.InsertItemLast(0,valor,1)
	else
		if previo = -1 then
			ret = tab_1.tp_1.tv_1.InsertItemLast(padre,valor,1)
		else
			ret = tab_1.tp_1.tv_1.InsertItemLast(padre,valor,1)
		end if
	end if
elseif orden = 'insitem' then
	if ltvi.PictureIndex = 1 or ltvi.PictureIndex=9  then
		ret = tab_1.tp_1.tv_1.InsertItemFirst(il_rclick,valor,fig)
	else
		if padre <> -1 then 
			if previo = -1 then
				ret = tab_1.tp_1.tv_1.InsertItemFirst(padre,valor,fig)
			else
				ret = tab_1.tp_1.tv_1.InsertItem(padre,previo,valor,fig)
			end if
		end if
	end if
elseif orden = 'additem' then
	if ltvi.PictureIndex = 1 or ltvi.PictureIndex = 9 then
		ret = tab_1.tp_1.tv_1.InsertItemLast(il_rclick,valor,fig)
	else
		if padre <> -1 then
			ret = tab_1.tp_1.tv_1.InsertItemLast(padre,valor,fig)
		end if
	end if
end if

if padre <> -1 then
	tab_1.tp_1.tv_1.ExpandItem(padre)
end if
if ltvi.PictureIndex = 1 then
	tab_1.tp_1.tv_1.ExpandItem(ltvi.ItemHandle)
end if

if ret > 0 then
	string campo
	fila = tab_1.tp_1.dw_save_campo.InsertRow(0)
	campo = tab_1.tp_1.dw_save_campo.Describe("Evaluate('max(numcampo)',0)")
	tab_1.tp_1.dw_save_campo.SetItem(fila,'codplantilla', i_cplant)
	tab_1.tp_1.dw_save_campo.SetItem(fila,'numcampo', long(campo) + 1)
	tab_1.tp_1.dw_save_campo.SetItem(fila,'descampo', valor)
	tab_1.tp_1.dw_save_campo.SetItem(fila,'tipo', tipo)
	tab_1.tp_1.dw_save_campo.SetItem(fila,'estado', '1')
	tab_1.tp_1.dw_save_campo.SetItem(fila,'handle', ret)
//	tab_1.tp_1.dw_save_campo.SetItem(fila,'plant_codtingre', tab_1.tp_1.dw_deta.GetItemString(tab_1.tp_1.dw_deta.GetRow(),'codtingre'))
//	tab_1.tp_1.dw_save_campo.SetItem(fila,'plant_tipo', tab_1.tp_1.dw_deta.GetItemString(tab_1.tp_1.dw_deta.GetRow(),'tipo'))
//	tab_1.tp_1.dw_save_campo.SetItem(fila,'ingreso', tab_1.tp_1.dw_deta.GetItemString(tab_1.tp_1.dw_deta.GetRow(),'ingreso'))
	padre = tab_1.tp_1.tv_1.FindItem(ParentTreeItem!, ret)
	if padre > 0 then
		tab_1.tp_1.tv_1.GetItem(padre,ltvi)
		tab_1.tp_1.dw_save_campo.SetItem(fila,'padre', ltvi.Data)
	elseif padre=-1 then // esto lo agrego gloria
		tab_1.tp_1.dw_save_campo.SetItem(fila,'padre',0)
	end if
	tab_1.tp_1.tv_1.GetItem(ret,ltvi)
	ltvi.Data = long(campo) + 1
	tab_1.tp_1.tv_1.SetItem(ret,ltvi)
	tab_1.tp_1.tv_1.SelectItem(ret)
	tab_1.tp_1.dw_save_campo.ScrolltoRow(fila)
end if

Return 0

end function

public function integer wf_picture (string p_tipo);choose case p_tipo
	case 'E' //etiqueta 
		return 1
	case 'U' //seleccion multiple
		return 9
	CASE 'S'//seleccion checkbox
		return 2
	CASE 'N'//sino radiobuttons
		return 3
	CASE 'L'//lista
		return 4
	CASE 'T'//texto
		return 5
	CASE 'R'//numero
		return 7
	CASE 'M'//memo
		return 6
	CASE 'F'//fecha
		return 8
end choose
end function

public function integer grabar ();if tab_2.tp2_1.dw_deta.accepttext()=-1 then return -1
if tab_2.tp2_2.dw_aspecto.accepttext()=-1 then return -1
if tab_2.tp2_2.dw_aspecto.event e_consecutivo_ficha()=-1 then return -1
if tab_1.tp_1.dw_save_campo.accepttext()=-1 then return -1
if tab_1.tp_1.dw_l.accepttext()=-1 then return -1

long conteo
string plant

plant = tab_2.tp2_1.dw_deta.GetItemString(tab_2.tp2_1.dw_deta.GetRow(),'codplantilla')

if i_estado=false then
	select count(*) into :conteo from atu_registro where codplantilla=:plant;
	if conteo > 0 then
		MessageBox('Atención','La plantilla tiene encuestas. No puede modificarla')
		Return -1
	end if
end if
tab_1.tp_1.tv_1.event copiar_orden()
i_operacion = 'Delete'
if tab_1.tp_1.dw_l.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_save_campo.Update(TRUE,FALSE) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_2.tp2_2.dw_aspecto.update(true,false)=-1 then
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_2.tp2_1.dw_deta.update(true,false)=-1 then
	Rollback;
	i_operacion = ''
	Return -1
end if

i_operacion = 'Insert'
if tab_2.tp2_1.dw_deta.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_2.tp2_2.dw_aspecto.update(true,false)=-1 then
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_save_campo.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
if tab_1.tp_1.dw_l.Update(true,false) = -1 then 
	Rollback;
	i_operacion = ''
	Return -1
end if
i_operacion = ''
if dw_lista.rowcount()>0 and tab_2.tp2_1.dw_deta.rowcount()>0 then
	if dw_lista.getitemstatus(1,0,primary!)=new! then
		dw_lista.setitem(1,'codplantilla',i_cplant)
		dw_lista.setitem(1,'desplantilla',tab_2.tp2_1.dw_deta.getitemstring(1,'desplantilla'))
		dw_lista.resetupdate()
	end if
end if
TAB_2.TP2_2.dw_aspecto.resetupdate( )
TAB_2.TP2_2.DW_aspecto.RETRIeve( I_CPLANT)
tab_2.tp2_1.dw_deta.resetupdate()
tab_1.tp_1.dw_save_campo.resetupdate()
tab_1.tp_1.dw_l.resetupdate()
dw_lista.resetupdate()
i_cambio=false
i_estado=false
commit;
dw_lista.retrieve( )
return 1
end function

public function integer f_pregunta ();if not i_cambio then return 0
choose case messagebox(w_plant_hcs.title,'Realizó cambios a la plantilla o borró alguna, desea guardar los cambios?',question!,yesnocancel!,1)
	case 1//si
		if grabar()=-1 then return -1
	case 2
		i_cambio=false
		return 0
	case 3
		return -1
end choose

end function

public function integer revisar ();long i,padre,f_pad
for i=1 to tab_1.tp_1.dw_save_campo.rowcount()
	padre=tab_1.tp_1.dw_save_campo.GetItemNumber(i,'padre')
	f_pad=tab_1.tp_1.dw_save_campo.find('numcampo='+string(padre),1,tab_1.tp_1.dw_save_campo.rowcount())
	if isnull(padre) or (f_pad=0 and padre<>0 ) then 
		MessageBox('Atención','La plantilla tiene campos erróneos, debe revisarla en la tabla directamente (Hay campos que no tienen campo padre)')
		return -1
	end if
	if padre<>0 then
		if tab_1.tp_1.dw_save_campo.getitemstring(f_pad,'tipo')<>'E' and  tab_1.tp_1.dw_save_campo.getitemstring(f_pad,'tipo')<>'U'   then
			MessageBox('Atención','La plantilla tiene campos errónes, debe revisarla en la tabla directamente (Hay campos cuyo padre no es etiqueta)')
			return -1
		end if
	end if
next
end function

on w_plant_hcs.create
this.tab_2=create tab_2
this.tab_1=create tab_1
this.pb_save=create pb_save
this.pb_4=create pb_4
this.pb_del=create pb_del
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_lista=create dw_lista
this.gb_1=create gb_1
this.st_estado=create st_estado
this.Control[]={this.tab_2,&
this.tab_1,&
this.pb_save,&
this.pb_4,&
this.pb_del,&
this.pb_1,&
this.st_1,&
this.dw_lista,&
this.gb_1,&
this.st_estado}
end on

on w_plant_hcs.destroy
destroy(this.tab_2)
destroy(this.tab_1)
destroy(this.pb_save)
destroy(this.pb_4)
destroy(this.pb_del)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_lista)
destroy(this.gb_1)
destroy(this.st_estado)
end on

event closequery;if f_pregunta()=-1 then return 1
end event

event open;dw_lista.retrieve( )
end event

type tab_2 from tab within w_plant_hcs
event create ( )
event destroy ( )
integer x = 1979
integer y = 24
integer width = 2181
integer height = 800
integer taborder = 80
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp2_1 tp2_1
tp2_2 tp2_2
end type

on tab_2.create
this.tp2_1=create tp2_1
this.tp2_2=create tp2_2
this.Control[]={this.tp2_1,&
this.tp2_2}
end on

on tab_2.destroy
destroy(this.tp2_1)
destroy(this.tp2_2)
end on

type tp2_1 from userobject within tab_2
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 2144
integer height = 672
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "scanner.ico"
long picturemaskcolor = 536870912
dw_deta dw_deta
end type

on tp2_1.create
this.dw_deta=create dw_deta
this.Control[]={this.dw_deta}
end on

on tp2_1.destroy
destroy(this.dw_deta)
end on

type dw_deta from datawindow within tp2_1
integer x = 55
integer y = 112
integer width = 2011
integer height = 448
integer taborder = 80
string title = "none"
string dataobject = "dw_deta_plant"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;string ls_path,ls_filename

GetFileOpenName("selección de Archivo",ls_path,ls_filename,"srd","SRD Files (*.srd),*.srd")

if ls_path <> '' then
	SetItem(GetRow(),'reporte',ls_path)
end if

end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event itemchanged;long j

choose case getcolumnname()
	case 'ingreso'
		for j=1 to tab_1.tp_1.dw_save_campo.rowcount()
			tab_1.tp_1.dw_save_campo.setitem(j,'ingreso',data)
		next
	case 'codplantilla'
		i_cplant=data
		for j=1 to tab_1.tp_1.dw_save_campo.rowcount()
			tab_1.tp_1.dw_save_campo.setitem(j,'codplantilla',i_cplant)
		next
		tab_1.tp_1.dw_l.setfilter('')
		tab_1.tp_1.dw_l.filter()
		for j=1 to tab_1.tp_1.dw_l.rowcount()
			tab_1.tp_1.dw_l.setitem(j,'codplantilla',i_cplant)
		next
		tab_1.tp_1.dw_save_campo.event rowfocuschanged(tab_1.tp_1.dw_save_campo.getrow())
	case 'estado'
		i_estado=true
end choose
i_cambio=true
accepttext()
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

type tp2_2 from userobject within tab_2
integer x = 18
integer y = 112
integer width = 2144
integer height = 672
long backcolor = 67108864
string text = "Ficha Técnica"
long tabtextcolor = 33554432
string picturename = "resultados.ico"
long picturemaskcolor = 536870912
st_3 st_3
dw_aspecto dw_aspecto
pb_7 pb_7
pb_3 pb_3
end type

on tp2_2.create
this.st_3=create st_3
this.dw_aspecto=create dw_aspecto
this.pb_7=create pb_7
this.pb_3=create pb_3
this.Control[]={this.st_3,&
this.dw_aspecto,&
this.pb_7,&
this.pb_3}
end on

on tp2_2.destroy
destroy(this.st_3)
destroy(this.dw_aspecto)
destroy(this.pb_7)
destroy(this.pb_3)
end on

type st_3 from statictext within tp2_2
integer x = 18
integer y = 4
integer width = 402
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aspecto:"
boolean focusrectangle = false
end type

type dw_aspecto from datawindow within tp2_2
event type long e_consecutivo_ficha ( )
integer x = 5
integer y = 60
integer width = 1979
integer height = 608
integer taborder = 80
string dataobject = "dw_aspecto_ficha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event type long e_consecutivo_ficha();long nro_aspecto, i 

select max(codaspecto) into :nro_aspecto from atu_ficha_tecnica where codplantilla=:i_cplant;
if sqlca.sqlcode=-1 then 
	messagebox(w_plant_hcs.title, sqlca.sqlerrtext)
	return -1 
else
	if isnull(nro_aspecto) then nro_aspecto=0
	for i=1 to rowcount( )
		if getitemstatus( i, 0, Primary!)=New! or getitemstatus( i, 0, Primary!)=NewModified! then
			nro_aspecto=nro_aspecto+1
			setitem( i, 'codaspecto', nro_aspecto)
		end if
	next
end if 
end event

event constructor;settransobject( sqlca)
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

event itemchanged;i_cambio= true
end event

type pb_7 from picturebutton within tp2_2
integer x = 1993
integer y = 188
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Eliminar Aspecto"
end type

event clicked;dw_aspecto.deleterow(0)
end event

type pb_3 from picturebutton within tp2_2
integer x = 1993
integer y = 60
integer width = 142
integer height = 124
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean flatstyle = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Insertar Aspecto"
end type

event clicked;long fila

fila=dw_aspecto.insertrow(0)
dw_aspecto.setitem(fila, 'codplantilla',i_cplant)
i_cambio= true
end event

type tab_1 from tab within w_plant_hcs
event create ( )
event destroy ( )
integer x = 37
integer y = 856
integer width = 4119
integer height = 1468
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
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
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4082
integer height = 1340
long backcolor = 67108864
string text = "Campos"
long tabtextcolor = 33554432
string picturename = "editar.ico"
long picturemaskcolor = 536870912
cb_2 cb_2
cb_1 cb_1
dw_l dw_l
dw_save_campo dw_save_campo
tv_1 tv_1
gb_3 gb_3
end type

on tp_1.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_l=create dw_l
this.dw_save_campo=create dw_save_campo
this.tv_1=create tv_1
this.gb_3=create gb_3
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_l,&
this.dw_save_campo,&
this.tv_1,&
this.gb_3}
end on

on tp_1.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_l)
destroy(this.dw_save_campo)
destroy(this.tv_1)
destroy(this.gb_3)
end on

type cb_2 from picturebutton within tp_1
event mousemove pbm_mousemove
boolean visible = false
integer x = 3534
integer y = 632
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                  &b"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Item"
end type

event clicked;if dw_l.RowCount() > 0 then
	dw_l.DeleteRow(0)
	i_cambio=true
end if

end event

type cb_1 from picturebutton within tp_1
event mousemove pbm_mousemove
boolean visible = false
integer x = 3534
integer y = 472
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                    &a"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Item"
end type

event clicked;integer fila
string valor
if dw_save_campo.GetRow() = 0 then Return
fila = dw_l.InsertRow(0)
dw_l.SetItem(fila,'codplantilla',dw_save_campo.GetItemString(dw_save_campo.GetRow(),'codplantilla'))
dw_l.SetItem(fila,'numcampo',dw_save_campo.GetItemNumber(dw_save_campo.GetRow(),'numcampo'))
valor = dw_l.Describe("Evaluate('max(nitem)',0)")
dw_l.SetItem(fila,'nitem',long(valor) + 1)
dw_l.SetItem(fila,'estado','1')
dw_l.ScrolltoRow(fila)
i_cambio=true

end event

type dw_l from datawindow within tp_1
boolean visible = false
integer x = 1952
integer y = 456
integer width = 1531
integer height = 756
integer taborder = 60
string title = "none"
string dataobject = "dw_lista_campos_hc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event itemchanged;i_cambio=true
accepttext()
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

type dw_save_campo from datawindow within tp_1
integer x = 2002
integer y = 104
integer width = 1829
integer height = 320
integer taborder = 20
string title = "none"
string dataobject = "dw_campos_plant"
boolean border = false
end type

event buttonclicked;if dw_save_campo.GetItemStatus(dw_save_campo.GetRow(),0,Primary!) = NewModified! then
	if grabar() = -1 then
		Return
	end if
end if
//if getitemstring(getrow(),'tipo_memo')='D' or getitemstring(getrow(),'tipo_memo')='C' or getitemstring(getrow(),'tipo_memo')='P' then
//	openwithparm(w_plantcampo,dw_save_campo)
//else
openwithparm(w_edita_plant_rtf,dw_save_campo)
//end if

end event

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,dataobject)
end event

event itemchanged;int i, ret,picture, esta
treeViewItem ltvi
string tipo, modifica, campo, tipoAnt, vnul, tipopadre
setNull(vnul)

tv_1.GetItem(GetItemNumber(GetRow(),'handle'),ltvi)
tv_1.SelectItem(GetItemNumber(GetRow(),'handle'))

if GetColumnName() = 'tipo' then
	
	esta= find("#2="+string(getitemnumber(getrow(), 'padre')  ),1,rowcount( )  )
	if esta>0 then 
		tipopadre= getitemstring( esta, 'tipo')
		if tipopadre='U' THEN 
			messagebox(w_plant_hcs.title, 'El item corresponde a selección multiple, no se puede cambiar el tipo')
			setitem(getrow(), 'tipo', 'S')
			AcceptText()
			tv_1.SetItem(tv_1.FindItem(CurrentTreeItem!, 0),ltvi)
			return
		End if
	end if 
	
	tipoAnt = GetItemString(GetRow(),'tipo')
	if tipoant='E' or tipoAnt='U' and ltvi.children then //etiqueta o seleccion multiple
		settext(tipoant)
		messagebox('Atención','Esta rama del árbol ya tiene hijos')
		return 2
	end if
	if isNull(data) then
		tipo = GetItemString(GetRow(),'tipo')
	else
		tipo = data
	end if
	if tipo = 'L' then
		dw_l.setfilter('numcampo='+string(GetItemNumber(getrow(),'numcampo')))
		dw_l.filter()
		dw_l.sort()
		cb_1.Visible = TRUE
		cb_2.Visible = TRUE
		dw_l.Visible = TRUE
	else
		if tipoAnt = 'L' then
			ret = Messagebox('Aviso','Los items de la lista se borrarán. Desea Continuar',QUESTION!,YESNOCANCEL!)
			if ret = 1 then
				ret = dw_l.RowCount()
				for i = 1 to ret
					dw_l.DeleteRow(1)
				next
			else 
				SetText('L')
				SetItem(GetRow(),'tipo','L')
				Return 2
			end if
		end if
		cb_1.Visible = FALSE
		cb_2.Visible = FALSE
		dw_l.Visible = FALSE
	end if
	picture=wf_picture(tipo)
	ltvi.PictureIndex = picture
	ltvi.SelectedPictureIndex = picture
elseif GetColumnName() = 'descampo' then
	if isNull(data) then
		ltvi.Label = GetItemString(GetRow(),'descampo')
	else
		ltvi.Label = data
	end if
end if
AcceptText()
tv_1.SetItem(tv_1.FindItem(CurrentTreeItem!, 0),ltvi)
i_cambio=true

end event

event rowfocuschanged;long fila
if currentrow = 0 or RowCount() = 0 then Return
fila = GetRow()
if GetItemString(fila,'tipo') = 'L' then
	dw_l.setfilter('numcampo='+string(GetItemNumber(fila,'numcampo')))
	dw_l.filter()
	dw_l.sort()
	cb_1.Visible = TRUE
	cb_2.Visible = TRUE
	dw_l.Visible = TRUE
else
	cb_1.Visible = FALSE
	cb_2.Visible = FALSE
	dw_l.Visible = FALSE

end if

end event

event rowfocuschanging;IF (KeyDown(KeyTab!) and currentrow<>newrow) or ((KeyDown(KeyEnter!) or KeyDown(KeyDownArrow!) OR & 
   KeyDown(KeyUpArrow!) OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!)) and getfocus()=this) THEN
	return -1
end if
if currentrow < 1 or this.RowCount() = 0 then Return
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

type tv_1 from treeview within tp_1
event type long rec_inserta ( long p_pos,  long p_numcampo )
event reset ( )
event copiar_orden ( )
integer x = 18
integer y = 40
integer width = 1833
integer height = 1268
integer taborder = 50
boolean dragauto = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean editlabels = true
boolean deleteitems = true
boolean linesatroot = true
boolean disabledragdrop = false
boolean fullrowselect = true
string picturename[] = {"Open!","CheckBox!","RadioButton!","DropDownListBox!","StaticText!","MultiLineEdit5!","Compute5!","ComputeToday5!","Custom092!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event type long rec_inserta(long p_pos, long p_numcampo);treeviewitem ll
uo_datastore ds_hijos
long j,k,donde,imagen
string descrip
ds_hijos=create uo_datastore
ds_hijos.dataobject='dw_hijos_plant'
ds_hijos.settransobject(sqlca)

ds_hijos.retrieve(i_cplant,p_numcampo)
for k=1 to ds_hijos.rowcount()
	imagen=wf_picture(ds_hijos.getitemstring(k,'tipo'))
	descrip=ds_hijos.getitemstring(k,'descampo')
	if isnull(descrip) then descrip=''
	j=InsertItemlast(p_pos,descrip, imagen)
	tv_1.getitem(j,ll)
	ll.data=ds_hijos.getitemnumber(k,'numcampo')
	donde=dw_save_campo.find('numcampo='+string(ds_hijos.getitemnumber(k,'numcampo')),1,dw_save_campo.rowcount())
	dw_save_campo.setitem(donde,'handle',j)
	tv_1.setitem(j,ll)
	event rec_inserta(j,ds_hijos.getitemnumber(k,'numcampo'))
next
destroy ds_hijos
if p_numcampo=0 then
	long hand
	hand = FindItem(RootTreeItem!,0)
	if hand>0 then selectitem(hand)
end if
return j

end event

event reset();long hand
hand = FindItem(RootTreeItem!,0)
do while hand > 0
	DeleteItem(hand)
	hand = FindItem(RootTreeItem!,0)
loop
end event

event copiar_orden();long hand,donde,orden=1
TreeViewItem tvl
hand = FindItem(RootTreeItem!,0)
if hand=-1 then return
expandall(hand)
do while hand > 0
	getitem(hand,tvl)
	donde=dw_save_campo.find('numcampo='+string(tvl.data),1,dw_save_campo.rowcount())
	dw_save_campo.setitem(donde,'orden',orden)
	orden ++
	hand = FindItem(NextVisibleTreeItem!,hand)
loop
end event

event begindrag;TreeViewItem ltvi_Source

GetItem(handle, ltvi_Source)

If ltvi_Source.PictureIndex = 1 Then
	This.Drag(Cancel!)
Else
	il_DragSource = handle
	il_DragParent = FindItem(ParentTreeItem!, handle)
End If

end event

event dragdrop;Long					ll_NewItem,l_parent
TreeViewItem		ltvi_Target, ltvi_Source, ltvi_New, ltvi_Parent
long fpadre, fhijo

if il_DragSource = il_DropTarget then 
	This.Drag(Cancel!)
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
end if

If GetItem(il_DropTarget, ltvi_Target) = -1 Then Return
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return

GetItem(il_DragParent, ltvi_Parent)
DeleteItem(il_DragSource)
SetNull(ltvi_Source.ItemHandle)
l_parent = FindItem(ParentTreeItem!, il_DropTarget)
if ltvi_Target.PictureIndex = 1 then 
	ll_NewItem = InsertItemSort(il_DropTarget, ltvi_Source)
else
	ll_NewItem = InsertItem(l_Parent, il_DropTarget, ltvi_Source)
end if

SetDropHighlight (0)
SelectItem(ll_NewItem)

l_parent = FindItem(ParentTreeItem!,ll_NewItem)
fpadre = dw_save_campo.Find("handle="+string(l_parent),1,dw_save_campo.RowCount())
fhijo = dw_save_campo.Find("numcampo="+string(ltvi_Source.Data),1,dw_save_campo.RowCount())

dw_save_campo.SetItem(fhijo, 'handle',ll_NewItem)
dw_save_campo.SetItem(fhijo, 'padre', dw_save_campo.getitemnumber(fpadre,'numcampo'))
i_cambio=true

end event

event dragwithin;TreeViewItem		ltvi_Over

If GetItem(handle, ltvi_Over) = -1 Then
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
End If

SetDropHighlight(handle)
il_DropTarget = handle

end event

event endlabeledit;dw_save_campo.SetItem(dw_save_campo.GetRow(),'descampo',newtext)

end event

event rightclicked;if tab_2.tp2_1.dw_deta.rowcount()=0 then return
TreeViewItem ltvi_New
il_rclick = handle
m_hcampos m_c
m_c = CREATE m_hcampos
message.stringparm=''
long fila
if GetItem(handle, ltvi_New) = 1 then
	fila = dw_save_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_save_campo.RowCount())
	if  dw_save_campo.getitemstring(fila,'tipo')='U'  then
		m_c.item[1].enabled=false
		m_c.item[2].enabled=false
	elseif  dw_save_campo.getitemstring(fila,'tipo')<>'E' then
		m_c.item[1].enabled=false
		m_c.item[2].enabled=false
		m_c.item[4].enabled=false
		m_c.item[5].enabled=false
	end if
end if
m_c.PopMenu(w_principal.PointerX(), w_principal.PointerY() )
if message.stringparm='' then return
insertcampo(message.stringparm)

end event

event selectionchanged;Integer fila
TreeViewItem ltvi_New
long handle

if GetItem(oldhandle, ltvi_New) = 1 then
	//messagebox('1','')
	fila = dw_save_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_save_campo.RowCount())
	if fila > 0 then
		ltvi_New.Bold = FALSE
		SetItem(oldhandle, ltvi_New)
	end if
end if


handle = FindItem(CurrentTreeItem!,0)

//Parent.SetRedraw(False)
if GetItem(handle, ltvi_New) = 1 then
	//messagebox('2','')
	fila = dw_save_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_save_campo.RowCount())
	if fila > 0 then
		dw_save_campo.ScrollToRow(fila)
		ltvi_New.Bold = TRUE
		SetItem(handle, ltvi_New)
	end if
end if
//Parent.SetRedraw(True)

end event

type gb_3 from groupbox within tp_1
integer x = 1934
integer y = 36
integer width = 1938
integer height = 400
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Campo"
end type

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4082
integer height = 1340
long backcolor = 67108864
string text = "Impresión"
long tabtextcolor = 33554432
string picturename = "scanner.ico"
long picturemaskcolor = 536870912
st_5 st_5
st_4 st_4
dw_campo_ficha dw_campo_ficha
pb_6 pb_6
pb_5 pb_5
rte_1 rte_1
dw_campo_cab dw_campo_cab
gb_4 gb_4
end type

on tp_2.create
this.st_5=create st_5
this.st_4=create st_4
this.dw_campo_ficha=create dw_campo_ficha
this.pb_6=create pb_6
this.pb_5=create pb_5
this.rte_1=create rte_1
this.dw_campo_cab=create dw_campo_cab
this.gb_4=create gb_4
this.Control[]={this.st_5,&
this.st_4,&
this.dw_campo_ficha,&
this.pb_6,&
this.pb_5,&
this.rte_1,&
this.dw_campo_cab,&
this.gb_4}
end on

on tp_2.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.dw_campo_ficha)
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.rte_1)
destroy(this.dw_campo_cab)
destroy(this.gb_4)
end on

type st_5 from statictext within tp_2
integer x = 55
integer y = 68
integer width = 343
integer height = 52
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ficha Técnica:"
boolean focusrectangle = false
end type

type st_4 from statictext within tp_2
boolean visible = false
integer x = 1957
integer y = 28
integer width = 343
integer height = 52
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Generales:"
boolean focusrectangle = false
end type

type dw_campo_ficha from datawindow within tp_2
integer x = 55
integer y = 120
integer width = 1682
integer height = 400
integer taborder = 120
string title = "none"
string dataobject = "dw_campos_ficha"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;rte_1.InputFieldInsert ( dw_campo_ficha.getitemstring(dw_campo_ficha.getrow(),'aspecto'))
rte_1.SetFocus()
end event

event constructor;settransobject( sqlca)
end event

type pb_6 from picturebutton within tp_2
integer x = 1760
integer y = 292
integer width = 142
integer height = 124
integer taborder = 90
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string text = "                "
boolean flatstyle = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;blob lleva
string lug

lleva=blob(rte_1.copyrtf(false,detail!))
if isnull(lleva) then lleva=blob(" ")
sqlca.autocommit=true

updateblob atu_plant set encabezado=:lleva where codplantilla=:i_cplant;
if sqlca.sqlcode=-1 then messagebox(w_plant_hcs.title, sqlca.sqlerrtext )
commit;
sqlca.autocommit=false

end event

type pb_5 from picturebutton within tp_2
integer x = 1760
integer y = 132
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "       "
boolean flatstyle = true
string picturename = "ojo.gif"
alignment htextalign = left!
string powertiptext = "Insertar Imagen"
end type

event clicked;string arch,nombre
GetFileOpenName ("Open", nombre, arch, &
  + "jpg", "Archivos de imagen (*.jpg),*.jpg," &
  + "(*.gif), *.gif,(*.bmp),*.bmp")
rte_1.InsertPicture ( arch)


end event

type rte_1 from richtextedit within tp_2
integer x = 9
integer y = 572
integer width = 4041
integer height = 752
integer taborder = 90
boolean init_hscrollbar = true
boolean init_vscrollbar = true
boolean init_wordwrap = true
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_toolbar = true
boolean init_popmenu = true
borderstyle borderstyle = stylelowered!
end type

type dw_campo_cab from datawindow within tp_2
boolean visible = false
integer x = 1957
integer y = 88
integer width = 2094
integer height = 420
integer taborder = 70
string dataobject = "dw_campos_encab"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if row<1 then return
rte_1.InputFieldInsert ( dw_campo_cab.getitemstring(dw_campo_cab.getrow(),'cod_campo'))
rte_1.SetFocus()
end event

type gb_4 from groupbox within tp_2
integer x = 5
integer y = 12
integer width = 1929
integer height = 520
integer taborder = 90
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8388608
long backcolor = 67108864
string text = "Campos a utilizar en el encabezado"
end type

type pb_save from picturebutton within w_plant_hcs
integer x = 1774
integer y = 8
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                                 &g"
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;grabar()
end event

type pb_4 from picturebutton within w_plant_hcs
event mousemove pbm_mousemove
integer x = 1623
integer y = 8
integer width = 142
integer height = 124
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "contrato.gif"
string disabledname = "d_contrato.gif"
alignment htextalign = left!
string powertiptext = "Copiar desde plantilla Seleccionada"
end type

event clicked;if dw_lista.rowcount()=0 then return
st_xa_elegir st
st.dw_object='dw_ls_plants'
st.titulo='Elegir plantilla para copiar campos'
st.ancho=1800
st.alto=1420
openwithparm(w_buscar_gral,st)
if message.stringparm='' then return
string cplant
cplant=message.stringparm
if tab_1.tp_1.dw_save_campo.RowCount() > 0 then
	if MessageBox('Atención','La plantilla tiene campos, estos se reemplazarán. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
end if

long i,j
string temp,nulo
setnull(nulo)
uo_datastore dw_c
dw_c = create uo_datastore
dw_c.DataObject = 'dw_campos_plant'
dw_c.SetTransObject(SQLCA)

if tab_1.tp_1.dw_save_campo.RowCount() > 0 then
	do while tab_1.tp_1.dw_save_campo.RowCount()>0
		tab_1.tp_1.dw_save_campo.DeleteRow(0)
	loop
	tab_1.tp_1.dw_l.setfilter('')
	tab_1.tp_1.dw_l.filter()
	do while tab_1.tp_1.dw_l.rowcount()>0
		tab_1.tp_1.dw_l.deleterow(0)
	loop
	if tab_1.tp_1.dw_l.update(true,false)=-1 then
		rollback;
		return
	end if
	if tab_1.tp_1.dw_save_campo.Update(true,false) = -1 then
		Rollback;
		Return
	end if
	tab_1.tp_1.dw_l.resetupdate()
	tab_1.tp_1.dw_save_campo.resetupdate()
	tab_1.tp_1.tv_1.event reset()
end if

if dw_c.Retrieve(cplant)>0 then
	dw_c.rowscopy(1,dw_c.rowcount(),primary!,tab_1.tp_1.dw_save_campo,1,primary!)
	for j=1 to tab_1.tp_1.dw_save_campo.rowcount()
		tab_1.tp_1.dw_save_campo.setitem(j,'codplantilla',tab_2.tp2_1.dw_deta.getitemstring(1,'codplantilla'))
	next
	temp=i_cplant
	i_cplant=cplant
	tab_1.tp_1.dw_l.retrieve(i_cplant)
	for j=1 to tab_1.tp_1.dw_l.rowcount()
		tab_1.tp_1.dw_l.setitemstatus(j,0,primary!,new!)
		tab_1.tp_1.dw_l.setitem(j,'codplantilla',tab_2.tp2_1.dw_deta.getitemstring(1,'codplantilla'))
	next
	tab_1.tp_1.tv_1.event rec_inserta(0,0)
	i_cplant=temp
end if
i_cambio=true
end event

type pb_del from picturebutton within w_plant_hcs
integer x = 1472
integer y = 8
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                               &e"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Eliminar Plantilla [Alt+E]"
end type

event clicked;if tab_1.tp_1.dw_save_campo.rowcount()>0 then
	messagebox('Atención','No puede borrar la plantila ya que todavía tiene campos')
	return
end if
if not (tab_2.tp2_1.dw_deta.getitemstatus(tab_2.tp2_1.dw_deta.getrow(),0,primary!)=new! or tab_2.tp2_1.dw_deta.getitemstatus(tab_2.tp2_1.dw_deta.getrow(),0,primary!)=newmodified!) then i_cambio=true
tab_2.tp2_1.dw_deta.deleterow(0)
dw_lista.deleterow(0)

end event

type pb_1 from picturebutton within w_plant_hcs
integer x = 1321
integer y = 8
integer width = 142
integer height = 124
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "                                     &i"
string picturename = "insertar.gif"
alignment htextalign = left!
string powertiptext = "Insertar Plantilla [Alt+I]"
end type

event clicked;dw_lista.accepttext( )
if f_pregunta()=-1 then return
dw_lista.insertrow(1)
if dw_lista.rowcount( )>1 and dw_lista.getrow() =1 then dw_lista.setrow(2)

dw_lista.setrow(1)
tab_2.tp2_1.dw_deta.reset()
tab_2.tp2_1.dw_deta.insertrow(1)
tab_1.tp_1.tv_1.event reset()
tab_1.tp_1.dw_l.reset()
tab_1.tp_1.dw_save_campo.Reset()
i_cambio = true

end event

type st_1 from statictext within w_plant_hcs
integer x = 37
integer y = 96
integer width = 343
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plantillas:"
boolean focusrectangle = false
end type

type dw_lista from datawindow within w_plant_hcs
integer x = 37
integer y = 160
integer width = 1893
integer height = 672
integer taborder = 10
string dataobject = "dw_lista_plants"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

event rowfocuschanged;tab_2.tp2_1.dw_deta.reset()
tab_1.tp_1.tv_1.event reset()
tab_1.tp_1.dw_l.reset()
tab_1.tp_1.dw_save_campo.Reset()

if getrow()<1 then return
long conteo
string plant
plant = GetItemString(GetRow(),'codplantilla')
select count(*) into :conteo from atu_registro where codplantilla=:plant;
if conteo > 0 then
	st_estado.visible = TRUE
else
	st_estado.visible = FALSE
end if

accepttext( )
i_cplant=getitemstring(getrow(),'codplantilla')
if isNull(i_cplant) then Return 0
tab_2.tp2_1.dw_deta.retrieve(i_cplant)
tab_2.tp2_2.dw_aspecto.retrieve(i_cplant)
tab_1.tp_1.dw_save_campo.retrieve(i_cplant)

//encabezado de la plantilla
tab_1.tp_2.dw_campo_ficha.retrieve(i_cplant)
sqlca.autocommit=true
blob trae
tab_1.tp_2.rte_1.selecttextall( )
tab_1.tp_2.rte_1.Clearall( )
selectblob encabezado into :trae from atu_plant where codplantilla=:i_cplant;
if sqlca.sqlcode=-1 then messagebox(w_plant_hcs.title, sqlca.sqlerrtext)
if isnull(trae) then trae=blob('')
sqlca.autocommit=false
f_pega_a_rtf(tab_1.tp_2.rte_1,string(trae),3)

if revisar()=-1 then 
	tab_1.tp_1.dw_save_campo.reset()
	return
end if                   
tab_1.tp_1.tv_1.event rec_inserta(0,0)
tab_1.tp_1.dw_l.retrieve(i_cplant)

//se agrego para que cargue el encabezado

end event

event rowfocuschanging;return  f_pregunta()

end event

type gb_1 from groupbox within w_plant_hcs
integer x = 1682
integer y = 928
integer width = 480
integer height = 400
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
end type

type st_estado from statictext within w_plant_hcs
boolean visible = false
integer x = 2057
integer y = 704
integer width = 1367
integer height = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "La plantilla tiene encuestas, no se puede modificar"
boolean focusrectangle = false
end type

