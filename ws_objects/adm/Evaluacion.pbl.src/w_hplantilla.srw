$PBExportHeader$w_hplantilla.srw
forward
global type w_hplantilla from window
end type
type pb_b from picturebutton within w_hplantilla
end type
type pb_n from picturebutton within w_hplantilla
end type
type pb_2 from picturebutton within w_hplantilla
end type
type pb_1 from picturebutton within w_hplantilla
end type
type t1 from tab within w_hplantilla
end type
type p1 from userobject within t1
end type
type pb_exp from picturebutton within p1
end type
type pb_4 from picturebutton within p1
end type
type st_1 from statictext within p1
end type
type dw_lp from datawindow within p1
end type
type dw_p from datawindow within p1
end type
type p1 from userobject within t1
pb_exp pb_exp
pb_4 pb_4
st_1 st_1
dw_lp dw_lp
dw_p dw_p
end type
type p2 from userobject within t1
end type
type pb_p from picturebutton within p2
end type
type pb_3 from picturebutton within p2
end type
type cb_2 from picturebutton within p2
end type
type cb_1 from picturebutton within p2
end type
type dw_l from datawindow within p2
end type
type tv_1 from treeview within p2
end type
type dw_campo from datawindow within p2
end type
type p2 from userobject within t1
pb_p pb_p
pb_3 pb_3
cb_2 cb_2
cb_1 cb_1
dw_l dw_l
tv_1 tv_1
dw_campo dw_campo
end type
type t1 from tab within w_hplantilla
p1 p1
p2 p2
end type
type dw_cab from datawindow within w_hplantilla
end type
end forward

global type w_hplantilla from window
integer width = 3387
integer height = 2072
boolean titlebar = true
string title = "Nómina - Plantillas de Evaluación Desempeño"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_plantilla.ico"
pb_b pb_b
pb_n pb_n
pb_2 pb_2
pb_1 pb_1
t1 t1
dw_cab dw_cab
end type
global w_hplantilla w_hplantilla

type variables
Long il_DragSource, il_DragParent, il_Droptarget, il_rclick
integer FileNum
uo_datastore dw_hl

end variables

forward prototypes
public function integer addchildren (long hand, string agrupa)
public function integer insertcampo (string orden)
public function integer getorder (treeview tv, ref datawindow dw, long handle, integer orden)
public function long hijos (long orden, string agrupa)
end prototypes

public function integer addchildren (long hand, string agrupa);integer fila
long newhand
TreeViewItem ltvi_New
fila = t1.p2.dw_campo.Find("agrupa='" + agrupa +"'",1,t1.p2.dw_campo.RowCount())
do while fila > 0
	if t1.p2.dw_campo.GetItemString(fila,'tipo') = '0' then
		ltvi_New.Children = TRUE
	else
		ltvi_New.Children = FALSE
	end if
	ltvi_New.PictureIndex = integer(t1.p2.dw_campo.GetItemString(fila,'tipo')) + 1
	ltvi_New.SelectedPictureIndex = integer(t1.p2.dw_campo.GetItemString(fila,'tipo')) + 1
	ltvi_New.Label = t1.p2.dw_campo.GetItemString(fila,'descampo')
	ltvi_New.Data = t1.p2.dw_campo.GetItemNumber(fila,'numcampo')
	newhand = t1.p2.tv_1.InsertItemLast(hand, ltvi_New)
	If newhand < 1 Then
		MessageBox("Error", "Error insertando item", Exclamation!)
		Return -1
	End If
	t1.p2.dw_campo.SetItem(fila,'handle',newhand)
	addChildren(newhand,t1.p2.dw_campo.GetItemString(fila,'codplantilla') + String(t1.p2.dw_campo.GetItemNumber(fila,'numcampo')))
	if fila = t1.p2.dw_campo.RowCount() then EXIT
	fila = t1.p2.dw_campo.Find("agrupa='" + agrupa +"'",fila + 1,t1.p2.dw_campo.RowCount())
loop

Return 0

end function

public function integer insertcampo (string orden);integer fila, i = 0
TreeViewItem ltvi
if orden = 'Borra' then
	t1.p2.tv_1.GetItem(il_rclick,ltvi)
	fila = t1.p2.dw_campo.Find("numcampo="+string(ltvi.Data),1,t1.p2.dw_campo.RowCount())
	if fila > 0 then
		t1.p2.tv_1.DeleteItem(il_rclick)
		t1.p2.dw_campo.DeleteRow(fila)
	end if
	Return 0
end if

long padre, previo, ret
string valor, tipo
if orden = 'insfolder' or orden = 'addfolder' then
	valor = 'Etiqueta'
	tipo = '0'
else
	valor = 'Texto'
	tipo = '4'
end if
do while TRUE
	i++
	fila = t1.p2.dw_campo.Find("descampo='" + valor + string(i) + "'",1,t1.p2.dw_campo.RowCount())
	if fila = 0 then 
		valor = valor + string(i)
		Exit
	end if
LOOP

t1.p2.tv_1.GetItem(il_rclick,ltvi)
padre = t1.p2.tv_1.FindItem(ParentTreeItem!, il_rclick)
previo = t1.p2.tv_1.FindItem(PreviousTreeItem!, il_rclick)

if orden = 'insfolder' then
	if padre = -1 then
		if previo = -1 then
			ret = t1.p2.tv_1.InsertItemFirst(0,valor,1)
		else
			ret = t1.p2.tv_1.InsertItem(0,previo,valor,1)
		end if
	else
		if previo = -1 then
			ret = t1.p2.tv_1.InsertItemFirst(padre,valor,1)
		else
			ret = t1.p2.tv_1.InsertItem(padre,previo,valor,1)
		end if
	end if
elseif orden = 'addfolder' then
	if padre = -1 then
		ret = t1.p2.tv_1.InsertItemLast(0,valor,1)
	else
		if previo = -1 then
			ret = t1.p2.tv_1.InsertItemLast(padre,valor,1)
		else
			ret = t1.p2.tv_1.InsertItemLast(padre,valor,1)
		end if
	end if
elseif orden = 'insitem' then
	if ltvi.PictureIndex = 1 then
		ret = t1.p2.tv_1.InsertItemFirst(il_rclick,valor,5)
	else
		if padre <> -1 then 
			if previo = -1 then
				ret = t1.p2.tv_1.InsertItemFirst(padre,valor,5)
			else
				ret = t1.p2.tv_1.InsertItem(padre,previo,valor,5)
			end if
		end if
	end if
elseif orden = 'additem' then
	if ltvi.PictureIndex = 1 then
		ret = t1.p2.tv_1.InsertItemLast(il_rclick,valor,5)
	else
		if padre <> -1 then
			ret = t1.p2.tv_1.InsertItemLast(padre,valor,5)
		end if
	end if
end if

if padre <> -1 then
	t1.p2.tv_1.ExpandItem(padre)
end if
if ltvi.PictureIndex = 1 then
	t1.p2.tv_1.ExpandItem(ltvi.ItemHandle)
end if

if ret > 0 then
	string campo
	fila = t1.p2.dw_campo.InsertRow(0)
	campo = t1.p2.dw_campo.Describe("Evaluate('max(numcampo)',0)")
	if not IsNull(dw_cab.GetItemString(dw_cab.GetRow(),'codplantilla')) then
		t1.p2.dw_campo.SetItem(fila,'codplantilla', dw_cab.GetItemString(dw_cab.GetRow(),'codplantilla'))
	end if
	t1.p2.dw_campo.SetItem(fila,'numcampo', long(campo) + 1)
	t1.p2.dw_campo.SetItem(fila,'descampo', valor)
	t1.p2.dw_campo.SetItem(fila,'tipo', tipo)
	t1.p2.dw_campo.SetItem(fila,'estado', '1')
	t1.p2.dw_campo.SetItem(fila,'handle', ret)
	padre = t1.p2.tv_1.FindItem(ParentTreeItem!, ret)
	if padre > 0 then
		t1.p2.tv_1.GetItem(padre,ltvi)
		t1.p2.dw_campo.SetItem(fila,'agrupa', dw_cab.GetItemString(dw_cab.GetRow(),'codplantilla') + String(ltvi.Data))
	end if
	t1.p2.tv_1.GetItem(ret,ltvi)
	ltvi.Data = long(campo) + 1
	t1.p2.tv_1.SetItem(ret,ltvi)
	t1.p2.tv_1.SelectItem(ret)
	t1.p2.dw_campo.ScrolltoRow(fila)
end if

Return 0

end function

public function integer getorder (treeview tv, ref datawindow dw, long handle, integer orden);if handle <= 0 then Return -1
treeViewItem tvi
integer fila, lorden
long actual, padre, hijo

lorden = orden
actual = handle
do while actual > 0
	
	if tv.GetItem(actual,tvi) = -1 then
		Return -1
	end if
	fila = dw.Find("numcampo="+string(tvi.Data),1,dw.RowCount())
	if fila > 0 then
		lorden = lorden + 1
		fila = dw.SetItem(fila,'orden',lorden)
	end if
	
	if tvi.Children = TRUE then
		getorder(tv,dw,tv.FindItem(childTreeItem!,actual),0)
	end if
	actual = tv.FindItem(NextTreeItem!,actual)
loop

Return 0

end function

public function long hijos (long orden, string agrupa);string bufer, tipo
long fila,i, j, cant
fila = t1.p2.dw_campo.Find("agrupa='" + agrupa +"'",1,t1.p2.dw_campo.RowCount())
do while fila > 0
	orden = orden + 1
	bufer = string(orden) + ','
	bufer = bufer + t1.p2.dw_campo.GetItemString(fila,'descampo') + ','
	tipo = t1.p2.dw_campo.GetItemString(fila,'campoguarda')
	if isNull(tipo) then tipo = ''
	bufer = bufer + tipo + ','
	choose case t1.p2.dw_campo.GetItemString(fila,'tipo')
		case '1'
			tipo = 'Etiqueta'
		case '2'
			tipo = 'Seleccion'
		case '3'
			tipo = 'Lista'
		case '4'
			tipo = 'Texto'
		case '5'
			tipo = 'Memo'
		case '6'
			tipo = 'Numerico'
	end choose
	
	bufer = bufer + tipo

	if tipo = 'Lista' then
		dw_hl.Retrieve(t1.p2.dw_campo.GetItemString(fila,'codplantilla'),t1.p2.dw_campo.GetItemNumber(fila,'numcampo'))
		cant = dw_hl.RowCount()
		if cant > 0 then
			bufer = bufer + ','
			tipo = ''
			for j = 1 to cant
				tipo = tipo + dw_hl.GetItemString(j,'descripcion')
				if j < cant then
					tipo = tipo + ':'
				end if
			next
			bufer = bufer + tipo
		end if
	end if
	
	if fileWrite(FileNum,bufer) = -1 then
		MessageBox('Atención','No se puede escribir en el archivo')
	end if
orden = hijos(orden,t1.p2.dw_campo.GetItemString(fila,'codplantilla') + String(t1.p2.dw_campo.GetItemNumber(fila,'numcampo')))
	if fila = t1.p2.dw_campo.RowCount() then EXIT
	fila = t1.p2.dw_campo.Find("agrupa='" + agrupa +"'",fila + 1,t1.p2.dw_campo.RowCount())
loop

Return orden

end function

on w_hplantilla.create
this.pb_b=create pb_b
this.pb_n=create pb_n
this.pb_2=create pb_2
this.pb_1=create pb_1
this.t1=create t1
this.dw_cab=create dw_cab
this.Control[]={this.pb_b,&
this.pb_n,&
this.pb_2,&
this.pb_1,&
this.t1,&
this.dw_cab}
end on

on w_hplantilla.destroy
destroy(this.pb_b)
destroy(this.pb_n)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.t1)
destroy(this.dw_cab)
end on

event open;dw_cab.Retrieve()

end event

event closequery;int ret
if t1.p1.dw_p.GetNextModified(0,Primary!) > 0 then
	ret = Messagebox('Aviso','Desea grabar los cambios de la plantilla?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		pb_1.TriggerEvent(clicked!)
	elseif ret = 2 then
		Return
	else
		Return -1
	end if
end if
if t1.p2.dw_campo.GetNextModified(0,Primary!) > 0 then
	ret = Messagebox('Aviso','Desea grabar los cambios de los campos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		pb_1.TriggerEvent(clicked!)
	elseif ret = 2 then
		Return
	else
		Return -1
	end if
end if

end event

type pb_b from picturebutton within w_hplantilla
event mousemove pbm_mousemove
integer x = 2395
integer y = 344
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Plantilla"
end type

event clicked;integer ret,i,filas
if t1.p2.dw_campo.RowCount() > 0 then
	ret = MessageBox('Aviso','La plantilla tiene campos definidos. Está seguro de quere Borrarla?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		filas = t1.p2.dw_campo.RowCount()
		for i = 1 to filas
			t1.p2.dw_campo.DeleteRow(1)
		next
		if t1.p2.dw_campo.Update() = -1 then
			Rollback;
			Return
		end if
		t1.p1.dw_p.DeleteRow(t1.p1.dw_p.GetRow())
		dw_cab.DeleteRow(dw_cab.GetRow())
		if dw_cab.Update() = -1 then
			Rollback;
			Return
		end if
		commit;
	elseif ret = 2 then
		Return
	else
		Return
	end if
else
	t1.p1.dw_p.DeleteRow(t1.p1.dw_p.GetRow())
	dw_cab.DeleteRow(dw_cab.GetRow())
	if dw_cab.Update() = -1 then
		Rollback;
		Return
	end if
	commit;	
end if

end event

type pb_n from picturebutton within w_hplantilla
event mousemove pbm_mousemove
integer x = 2249
integer y = 344
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Plantilla"
end type

event clicked;integer fila
string valor
valor = dw_cab.Describe("Evaluate('max(long(codplantilla))',0)")
fila = dw_cab.InsertRow(0)
dw_cab.SetItem(fila,'codplantilla',string(long(valor) + 1))
dw_cab.SetItem(fila,'estado','1')
if dw_cab.Update() = -1 then
	Rollback;
	Return
end if
dw_cab.ScrolltoRow(fila)
dw_cab.TriggerEvent(RowFocusChanged!)
commit;

end event

type pb_2 from picturebutton within w_hplantilla
event mousemove pbm_mousemove
integer x = 1522
integer y = 1900
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

type pb_1 from picturebutton within w_hplantilla
event mousemove pbm_mousemove
integer x = 1664
integer y = 1900
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;int i
if t1.p1.dw_p.Update() = -1 then
	Rollback;
	Return -1
end if
if getOrder(t1.p2.tv_1, t1.p2.dw_campo, t1.p2.tv_1.FindItem(RootTreeItem!,0), 0) = -1 then
	MessageBox('Aviso','No pudo guardarse el orden arbol')
end if
for i = 1 to t1.p2.dw_campo.RowCount()
	if t1.p2.dw_campo.GetItemString(i,'tipo') <> '0' and isNull(t1.p2.dw_campo.GetItemString(i,'campoguarda')) then
		messageBox('Error','El campo no puede tener NULO en Campo donde se guardará')
		t1.p2.dw_campo.ScrolltoRow(i)
		Return -1
	end if
next
if t1.p2.dw_campo.Update() = -1 then
	Rollback;
	Return -1
end if

if t1.p2.dw_l.Update() = -1 then
	Rollback;
	Return -1
end if
commit;

end event

type t1 from tab within w_hplantilla
integer x = 37
integer y = 516
integer width = 3191
integer height = 1236
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
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

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 3154
integer height = 1108
long backcolor = 67108864
string text = "Detalle"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
pb_exp pb_exp
pb_4 pb_4
st_1 st_1
dw_lp dw_lp
dw_p dw_p
end type

on p1.create
this.pb_exp=create pb_exp
this.pb_4=create pb_4
this.st_1=create st_1
this.dw_lp=create dw_lp
this.dw_p=create dw_p
this.Control[]={this.pb_exp,&
this.pb_4,&
this.st_1,&
this.dw_lp,&
this.dw_p}
end on

on p1.destroy
destroy(this.pb_exp)
destroy(this.pb_4)
destroy(this.st_1)
destroy(this.dw_lp)
destroy(this.dw_p)
end on

type pb_exp from picturebutton within p1
event mousemove pbm_mousemove
integer x = 1824
integer y = 856
integer width = 142
integer height = 124
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "export.gif"
string disabledname = "d_export.gif"
alignment htextalign = left!
string powertiptext = "Exportar plantilla"
end type

event clicked;string bufer, tipo
long i,orden
orden  = 1

string is_filename, is_fullname
dw_hl = Create uo_datastore
dw_hl.DataObject = 'dw_hlista'
dw_hl.SetTransObject(SQLCA)
dw_hl.setFilter("estado='1'")
dw_hl.Filter()

if GetFileSaveName ("Open", is_fullname, is_filename,"txt", "Text Files (*.txt)") < 1 then return

FileNum = FileOpen(is_fullname, LineMode!, Write!, LockWrite!, Replace!)

for i = 1 to t1.p2.dw_campo.RowCount()
	if IsNull(t1.p2.dw_campo.GetItemString(i,'agrupa')) then
		bufer = string(orden) + ','
		bufer = bufer + t1.p2.dw_campo.GetItemString(i,'descampo') + ','
		tipo = t1.p2.dw_campo.GetItemString(i,'campoguarda')
		if isNull(tipo) then tipo = ''
		bufer = bufer + tipo + ','
		choose case t1.p2.dw_campo.GetItemString(i,'tipo')
			case '1'
				tipo = 'Etiqueta'
			case '2'
				tipo = 'Seleccion'
			case '3'
				tipo = 'Lista'
			case '4'
				tipo = 'Texto'
			case '5'
				tipo = 'Memo'
			case '6'
				tipo = 'Numerico'
		end choose
		
		bufer = bufer + tipo
		if fileWrite(FileNum,bufer) = -1 then
			MessageBox('Atención','No se puede escribir en el archivo')
		end if
		// Children
		orden = hijos(orden,t1.p2.dw_campo.GetItemString(i,'codplantilla') + String(t1.p2.dw_campo.GetItemNumber(i,'numcampo')))
	end if
next

FileClose (FileNum)
MessageBox('Atención','Se exportó el archivo '+ is_fullname)

end event

type pb_4 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 1678
integer y = 856
integer width = 142
integer height = 124
integer taborder = 70
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
string powertiptext = "Usar plantilla"
end type

event clicked;if isNull(dw_lp.GetItemString(1,'codplantilla')) then
	MessageBox('Atención','Necesita seleccionar una plantilla que se tomará como base')
	Return
end if
if t1.p2.dw_campo.RowCount() > 0 then
	if MessageBox('Atención','La plantilla tiene campos, estos se reemplazarán. Desea continuar?',QUESTION!,YESNO!,2) = 2 then Return
end if

long i,j, tam
uo_datastore dw_c
dw_c = create uo_datastore
dw_c.DataObject = 'dw_hcampos'
dw_c.SetTransObject(SQLCA)

if t1.p2.dw_campo.RowCount() > 0 then
	for i = 1 to t1.p2.dw_campo.RowCount()
		t1.p2.dw_campo.DeleteRow(1)
	next
	if t1.p2.dw_campo.Update() = -1 then
		Rollback;
		Return
	end if
end if

dw_c.Retrieve(dw_lp.GetItemString(1,'codplantilla'))
tam = len(dw_lp.GetItemString(1,'codplantilla'))
for i = 1 to dw_c.RowCount()
	t1.p2.dw_campo.InsertRow(i)
	t1.p2.dw_campo.SetItem(i,'indapdx',dw_cab.GetItemString(dw_cab.GetRow(),'indapdx'))	
	t1.p2.dw_campo.SetItem(i,'codplantilla',dw_cab.GetItemString(dw_cab.GetRow(),'codplantilla'))
	t1.p2.dw_campo.SetItem(i,'numcampo',dw_c.GetItemNumber(i,'numcampo'))
	t1.p2.dw_campo.SetItem(i,'agrupa',dw_cab.GetItemString(dw_cab.GetRow(),'codplantilla') + mid(dw_c.GetItemString(i,'agrupa'),tam + 1))
	
	for j = 3 to 33
		if j = 6 or j = 12 then
			t1.p2.dw_campo.SetItem(i,j,dw_c.GetItemNumber(i,j))
		else
			if j <> 5 then t1.p2.dw_campo.SetItem(i,j,dw_c.GetItemString(i,j))
		end if
	next
next
if t1.p2.dw_campo.Update() = -1 then
	rollback;
	Return
end if
t1.p2.dw_campo.TriggerEvent(Retrieveend!)

end event

type st_1 from statictext within p1
integer x = 101
integer y = 896
integer width = 430
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Copiar de plantilla"
boolean focusrectangle = false
end type

type dw_lp from datawindow within p1
integer x = 549
integer y = 884
integer width = 1083
integer height = 76
integer taborder = 70
string title = "none"
string dataobject = "dw_hlsplantilla"
boolean border = false
boolean livescroll = true
end type

event constructor;SetTransObject(SQLCA)
InsertRow(0)
end event

type dw_p from datawindow within p1
integer x = 73
integer y = 24
integer width = 2606
integer height = 804
integer taborder = 20
string title = "none"
string dataobject = "dw_hplantillacb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

event itemchanged;int i
if this.AcceptText() = -1 then Return
if this.GetColumnName() = 'desplantilla' then
	dw_cab.SetItem(dw_cab.GetRow(),'desplantilla',this.GetItemString(this.GetRow(),'desplantilla'))
elseif this.GetColumnName() = 'codesp' then
	dw_cab.SetItem(dw_cab.GetRow(),'codesp',this.GetItemString(this.GetRow(),'codesp'))
elseif this.GetColumnName() = 'indapdx' then
	dw_cab.SetItem(dw_cab.GetRow(),'indapdx',this.GetItemString(this.GetRow(),'indapdx'))
elseif this.GetColumnName() = 'codtingre' then
	dw_cab.SetItem(dw_cab.GetRow(),'codtingre',this.GetItemString(this.GetRow(),'codtingre'))
	for i = 1 to t1.p2.dw_campo.RowCount()
		t1.p2.dw_campo.SetItem(i,'codtingre', this.GetItemString(this.GetRow(),'codtingre'))
	next	
elseif this.GetColumnName() = 'ingreso' then
	for i = 1 to t1.p2.dw_campo.RowCount()
		t1.p2.dw_campo.SetItem(i,'ingreso', t1.p1.dw_p.GetItemString(t1.p1.dw_p.GetRow(),'ingreso'))
	next
end if

end event

event buttonclicked;string ls_path,ls_filename

GetFileOpenName("selección de Archivo",ls_path,ls_filename,"srd","SRD Files (*.srd),*.srd")

if ls_path <> '' then
	this.SetItem(this.GetRow(),'reporte',ls_path)
end if

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 3154
integer height = 1108
long backcolor = 67108864
string text = "Campos"
long tabtextcolor = 33554432
string picturename = "campos.ico"
long picturemaskcolor = 536870912
pb_p pb_p
pb_3 pb_3
cb_2 cb_2
cb_1 cb_1
dw_l dw_l
tv_1 tv_1
dw_campo dw_campo
end type

on p2.create
this.pb_p=create pb_p
this.pb_3=create pb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_l=create dw_l
this.tv_1=create tv_1
this.dw_campo=create dw_campo
this.Control[]={this.pb_p,&
this.pb_3,&
this.cb_2,&
this.cb_1,&
this.dw_l,&
this.tv_1,&
this.dw_campo}
end on

on p2.destroy
destroy(this.pb_p)
destroy(this.pb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_l)
destroy(this.tv_1)
destroy(this.dw_campo)
end on

type pb_p from picturebutton within p2
event mousemove pbm_mousemove
boolean visible = false
integer x = 2976
integer y = 624
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar Registro"
end type

event clicked;if dw_campo.GetItemStatus(dw_campo.GetRow(),0,Primary!) = NewModified! then
	if pb_1.Event clicked() = -1 then
		Return
	end if
end if
openwithparm(w_plantcampo,dw_campo)

end event

type pb_3 from picturebutton within p2
event mousemove pbm_mousemove
boolean visible = false
integer x = 2976
integer y = 880
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
string picturename = "anular_doc.gif"
string disabledname = "d_anular_doc.gif"
alignment htextalign = left!
string powertiptext = "Activar/Inactivar Campo"
end type

event clicked;if dw_l.RowCount() > 0 then
	if dw_l.GetItemString(dw_l.GetRow(),'estado') = '1' then
		dw_l.SetItem(dw_l.GetRow(),'estado','0')
	else
		dw_l.SetItem(dw_l.GetRow(),'estado','1')
	end if
end if
dw_l.triggerEvent(RowFocusChanged!)
end event

type cb_2 from picturebutton within p2
event mousemove pbm_mousemove
boolean visible = false
integer x = 2976
integer y = 752
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Registro"
end type

event clicked;if dw_l.RowCount() > 0 then
	dw_l.DeleteRow(0)
end if

end event

type cb_1 from picturebutton within p2
event mousemove pbm_mousemove
boolean visible = false
integer x = 2976
integer y = 624
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Registro"
end type

event clicked;integer fila
string valor
if dw_campo.GetRow() = 0 then Return
fila = dw_l.InsertRow(0)
dw_l.SetItem(fila,'codplantilla',dw_campo.GetItemString(dw_campo.GetRow(),'codplantilla'))
dw_l.SetItem(fila,'numcampo',dw_campo.GetItemNumber(dw_campo.GetRow(),'numcampo'))
valor = dw_l.Describe("Evaluate('max(nitem)',0)")
dw_l.SetItem(fila,'nitem',long(valor) + 1)
dw_l.SetItem(fila,'estado','1')
dw_l.ScrolltoRow(fila)


end event

type dw_l from datawindow within p2
boolean visible = false
integer x = 1339
integer y = 628
integer width = 1531
integer height = 376
integer taborder = 30
string title = "none"
string dataobject = "dw_hlista"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.SetTransObject(SQLCA)

end event

event rowfocuschanged;if currentRow = 0 or this.RowCount() = 0 then Return
if dw_l.GetItemString(dw_l.GetRow(),'estado') = '1' then
	pb_3.PictureName = 'anular_doc.gif'
else
	pb_3.PictureName = 'aceptar.gif'
end if

end event

type tv_1 from treeview within p2
integer x = 105
integer y = 108
integer width = 1157
integer height = 892
integer taborder = 30
boolean dragauto = true
integer textsize = -8
integer weight = 400
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
string picturename[] = {"My Videos2.ico","CheckBox!","RadioButton!","ListBox!","EditMask!","RichTextEdit!","ComputePage5!","ShowWatch!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event selectionchanged;Integer fila
TreeViewItem ltvi_New
long handle

if GetItem(oldhandle, ltvi_New) = 1 then
	fila = dw_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_campo.RowCount())
	if fila > 0 then
		ltvi_New.Bold = FALSE
		SetItem(oldhandle, ltvi_New)
	end if
end if

handle = FindItem(CurrentTreeItem!,0)

Parent.SetRedraw(False)
if GetItem(handle, ltvi_New) = 1 then
	fila = dw_campo.Find("numcampo=" + string(ltvi_New.Data) ,1,dw_campo.RowCount())
	if fila > 0 then
		dw_campo.ScrollToRow(fila)
		ltvi_New.Bold = TRUE
		SetItem(handle, ltvi_New)
	end if
end if
Parent.SetRedraw(True)

end event

event begindrag;TreeViewItem ltvi_Source

GetItem(handle, ltvi_Source)

//If ltvi_Source.PictureIndex = 1 Then
	//This.Drag(Cancel!)
//Else
	il_DragSource = handle
	il_DragParent = FindItem(ParentTreeItem!, handle)
//End If

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

event dragdrop;Long					ll_NewItem,l_parent
TreeViewItem		ltvi_Target, ltvi_Source, ltvi_Parent, ltvi_New
int fpadre, fhijo

fpadre = FindItem(ParentTreeItem!, il_DropTarget)
Do while fpadre > -1
	if fpadre = il_DragSource then
		This.Drag(Cancel!)
		SetDropHighlight(0)
		il_DropTarget = 0
		Return
	else
		fpadre = FindItem(ParentTreeItem!, fpadre)
	end if
loop

if il_DragSource = il_DropTarget then 
	This.Drag(Cancel!)
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
end if

//If GetItem(il_DropTarget, ltvi_Target) = -1 Then Return
long ret
ret = GetItem(il_DropTarget, ltvi_Target)
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return

GetItem(il_DragParent, ltvi_Parent)
DeleteItem(il_DragSource)
SetNull(ltvi_Source.ItemHandle)
l_parent = FindItem(ParentTreeItem!, il_DropTarget)

if ret <> -1 then
	if ltvi_Target.PictureIndex = 1 then 
		ll_NewItem = InsertItemFirst(il_DropTarget, ltvi_Source)
	else
		ll_NewItem = InsertItem(l_Parent, il_DropTarget, ltvi_Source)
	end if
else
	ll_NewItem = InsertItemLast(0, ltvi_Source)
end if

this.SetDropHighlight (0)
SelectItem(ll_NewItem)

l_parent = FindItem(ParentTreeItem!,ll_NewItem)
fpadre = dw_campo.Find("handle="+string(l_parent),1,dw_campo.RowCount())
//fhijo = dw_campo.Find("handle="+string(ll_newitem),1,dw_campo.RowCount())
fhijo = dw_campo.Find("numcampo="+string(ltvi_Source.Data),1,dw_campo.RowCount())
dw_campo.SetItem(fhijo, 'handle',ll_NewItem)
if l_parent > 0 then
	dw_campo.SetItem(fhijo,'agrupa',dw_campo.GetItemString(fpadre,'codplantilla') + string(dw_campo.GetItemNumber(fpadre,'numcampo')))
else
	string vnul
	setNull(vnul)
	dw_campo.SetItem(fhijo,'agrupa',vnul)
end if
addChildren(ll_newitem,dw_campo.GetItemString(fhijo,'codplantilla') + string(dw_campo.GetItemNumber(fhijo,'numcampo')))

end event

event endlabeledit;dw_campo.SetItem(dw_campo.GetRow(),'descampo',newtext)

end event

event rightclicked;
il_rclick = handle
m_hcampos m_c
m_c = CREATE m_hcampos

m_c.PopMenu(w_hplantilla.PointerX(), w_hplantilla.PointerY() )

end event

type dw_campo from datawindow within p2
event poblarlista ( string tipo )
integer x = 1312
integer y = 60
integer width = 1582
integer height = 984
integer taborder = 20
string title = "none"
string dataobject = "dw_hcampos"
boolean border = false
end type

event poblarlista(string tipo);string modifica, campo
integer i, fila

modifica = "campoguarda.values='"
choose case tipo
	case '1' 
		campo = 'valorselec'
	case '2' 
		campo = 'valorlogico'
	case '3' 
		campo = 'valorlista'
	case '4' 
		campo = 'valortexto'
	case '5' 
		campo = 'valormemo'
	case '6' 
		campo = 'valornum'
	case '7' 
		campo = 'valorfecha'
end choose
if campo <>'' then
	for i = 1 to 30
		fila = this.Find("campoguarda='"+campo+string(i)+"'",1,this.RowCount())
		if fila = 0 or (fila>0 and fila=this.GetRow()) then
			modifica = modifica+campo+string(i)+"~t"+campo+string(i)+"/"
		end if
	next	
else
	modifica = "campoguarda.values=''"
end if
this.Modify(modifica + "'")

end event

event constructor;this.SetTransObject(SQLCA)

end event

event rowfocuschanged;long fila, hand
if currentrow = 0 or this.RowCount() = 0 then Return
fila = this.GetRow()
if this.GetItemString(fila,'tipo') = '3' then
	dw_l.Retrieve(this.GetItemString(fila,'codplantilla'),this.GetItemNumber(fila,'numcampo'))
	cb_1.Visible = TRUE
	cb_2.Visible = TRUE
	pb_3.Visible = TRUE
	pb_p.Visible = FALSE
	dw_l.Visible = TRUE
else
	dw_l.Reset()
	cb_1.Visible = FALSE
	cb_2.Visible = FALSE
	pb_3.Visible = FALSE
	dw_l.Visible = FALSE
	pb_p.Visible = FALSE
	if this.GetItemString(fila,'tipo') = '5' then
		pb_p.Visible = TRUE
	end if
end if

Event poblarLista (this.GetItemString(this.GetRow(),'tipo'))

//if tv_1.FindItem(currentTreeItem!,0) <> this.GetItemNumber(this.GetRow(),'handle') then
//	tv_1.SelectItem(this.GetItemNumber(this.GetRow(),'handle'))
//end if

end event

event itemchanged;int i, ret
treeViewItem ltvi
string tipo, modifica, campo, tipoAnt, vnul
setNull(vnul)

tv_1.GetItem(this.GetItemNumber(this.GetRow(),'handle'),ltvi)
tv_1.SelectItem(this.GetItemNumber(this.GetRow(),'handle'))

if this.GetColumnName() = 'tipo' then
	tipoAnt = this.GetItemString(this.GetRow(),'tipo')
	if isNull(data) then
		tipo = this.GetItemString(this.GetRow(),'tipo')
	else
		tipo = data
	end if
	if tipo = '3' then
		cb_1.Visible = TRUE
		cb_2.Visible = TRUE
		pb_3.Visible = TRUE
		dw_l.Visible = TRUE
	else
		if tipoAnt = '3' then
			ret = Messagebox('Aviso','Los items de la lista se borrarán. Desea Continuar',QUESTION!,YESNOCANCEL!)
			if ret = 1 then
				ret = dw_l.RowCount()
				for i = 1 to ret
					dw_l.DeleteRow(1)
				next
			else 
				this.SetText('3')
				this.SetItem(this.GetRow(),'tipo',3)
				Return 2
			end if
		end if
		cb_1.Visible = FALSE
		cb_2.Visible = FALSE
		pb_3.Visible = FALSE
		dw_l.Visible = FALSE
	end if
	ltvi.PictureIndex = long(tipo) + 1
	ltvi.SelectedPictureIndex = long(tipo) + 1
	this.SetItem(GetRow(),'campoguarda',vnul)
	Event poblarLista (tipo)
	this.SetItem(this.GetRow(),'campoguarda',vnul)
elseif this.GetColumnName() = 'descampo' then
	if isNull(data) then
		ltvi.Label = this.GetItemString(this.GetRow(),'descampo')
	else
		ltvi.Label = data
	end if
elseif this.GetColumnName() = 'conducta' then
	if data = '0' then
		pb_p.Visible=TRUE
	end if
elseif this.GetColumnName() = 'campoguarda' then
	long fila
	fila = this.Find("campoguarda='"+data+"'",1,this.RowCount())
	if fila > 0 then
		this.SetText(this.GetItemString(this.GetRow(),'campoguarda'))
		this.SetItem(this.GetRow(),'campoguarda',this.GetItemString(this.GetRow(),'campoguarda'))
		Return 2
	end if
end if
this.AcceptText()
tv_1.SetItem(tv_1.FindItem(CurrentTreeItem!, 0),ltvi)

end event

event retrieveend;if rowcount = 0 then Return
integer i, fila
long hand
TreeViewItem ltvi_New
for i = 1 to this.RowCount()
	if IsNull(this.GetItemString(i,'agrupa')) then
		ltvi_New.Label = this.GetItemString(i,'descampo')
		ltvi_New.Data = this.GetItemNumber(i,'numcampo')
		ltvi_New.Children = TRUE
		ltvi_New.PictureIndex = long(this.GetItemString(i,'tipo')) + 1
		ltvi_New.SelectedPictureIndex = long(this.GetItemString(i,'tipo')) + 1
		hand = t1.p2.tv_1.InsertItemLast(0, ltvi_New)
		If hand < 1 Then
			MessageBox("Error", "Error insertando item", Exclamation!)
			Return -1
		End If
		this.SetItem(i,'handle',hand)
		// Children
		addChildren(hand,this.GetItemString(i,'codplantilla') + String(this.GetItemNumber(i,'numcampo')))
	end if
next

this.ResetUpdate()
hand = tv_1.FindItem(RootTreeItem!, 0)
tv_1.ExpandAll(hand)

end event

event rowfocuschanging;IF KeyDown(KeyEnter!) or KeyDown(KeyDownArrow!) OR & 
   KeyDown(KeyUpArrow!) OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!) THEN
	return -1
end if
if currentrow < 1 or this.RowCount() = 0 then Return
if this.GetItemString(currentrow,'tipo') <> '0' then
	if isNull(this.GetItemString(currentrow,'campoguarda')) then
		MessageBox('Error','Debe ingresar el campo donde se guardará')
		Return -1
	end if
end if

end event

event buttonclicked;string ls_path,ls_filename

GetFileOpenName("selección de Archivo",ls_path,ls_filename,"srd","SRD Files (*.srd),*.srd")

if ls_path <> '' then
	this.SetItem(this.GetRow(),'camino',ls_path)
end if

end event

type dw_cab from datawindow within w_hplantilla
integer x = 41
integer y = 20
integer width = 2126
integer height = 452
integer taborder = 10
string title = "none"
string dataobject = "dw_hplantilla"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;t1.p1.dw_p.Reset()
//t1.p2.dw_campo.Reset()
if RowCount() = 0 or currentrow = 0 then 
	Return
end if

long hand
hand = t1.p2.tv_1.FindItem(RootTreeItem!,0)
do while hand > 0
	t1.p2.tv_1.DeleteItem(hand)
	hand = t1.p2.tv_1.FindItem(RootTreeItem!,0)
loop

t1.p1.dw_p.Retrieve(GetItemString(GetRow(),'codplantilla'))
t1.p2.dw_campo.Reset()
t1.p2.dw_campo.Retrieve(GetItemString(GetRow(),'codplantilla'))

end event

event constructor;this.SetTransObject(SQLCA)

end event

event clicked;if row < 1 then Return
if GetRow() <> row then
	SetRow(row)
end if

end event

event rowfocuschanging;int ret
if t1.p1.dw_p.GetNextModified(0,Primary!) > 0 then
	ret = Messagebox('Aviso','Desea grabar los cambios de la plantilla?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		pb_1.TriggerEvent(clicked!)
	elseif ret = 2 then
		Return
	else
		Return -1
	end if
end if
if t1.p2.dw_campo.GetNextModified(0,Primary!) > 0 then
	ret = Messagebox('Aviso','Desea grabar los cambios de los campos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		pb_1.TriggerEvent(clicked!)
	elseif ret = 2 then
		Return
	else
		Return -1
	end if
end if

end event

