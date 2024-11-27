$PBExportHeader$w_grup_clinic.srw
$PBExportComments$Configura los campos de APDX
forward
global type w_grup_clinic from window
end type
type t1 from tab within w_grup_clinic
end type
type p1 from userobject within t1
end type
type pb_5 from picturebutton within p1
end type
type pb_4 from picturebutton within p1
end type
type pb_3 from picturebutton within p1
end type
type st_2 from statictext within p1
end type
type dw_2 from datawindow within p1
end type
type p1 from userobject within t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_2 dw_2
end type
type p2 from userobject within t1
end type
type pb_arbol from picturebutton within p2
end type
type tv_1 from treeview within p2
end type
type st_3 from statictext within p2
end type
type cb_11 from picturebutton within p2
end type
type cb_7 from picturebutton within p2
end type
type cb_10 from picturebutton within p2
end type
type cb_9 from picturebutton within p2
end type
type cb_8 from picturebutton within p2
end type
type rb_l from radiobutton within p2
end type
type rb_v from radiobutton within p2
end type
type dw_4 from datawindow within p2
end type
type sle_1 from singlelineedit within p2
end type
type dw_l from datawindow within p2
end type
type dw_5 from datawindow within p2
end type
type p2 from userobject within t1
pb_arbol pb_arbol
tv_1 tv_1
st_3 st_3
cb_11 cb_11
cb_7 cb_7
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
rb_l rb_l
rb_v rb_v
dw_4 dw_4
sle_1 sle_1
dw_l dw_l
dw_5 dw_5
end type
type t1 from tab within w_grup_clinic
p1 p1
p2 p2
end type
type pb_2 from picturebutton within w_grup_clinic
end type
type cb_delsug from picturebutton within w_grup_clinic
end type
type pb_1 from picturebutton within w_grup_clinic
end type
type mle_1 from multilineedit within w_grup_clinic
end type
type st_1 from statictext within w_grup_clinic
end type
type dw_6 from datawindow within w_grup_clinic
end type
type dw_1 from datawindow within w_grup_clinic
end type
type gb_1 from groupbox within w_grup_clinic
end type
end forward

global type w_grup_clinic from window
string tag = "Configuración Personalizada Apoyo Dx"
integer width = 6203
integer height = 2428
boolean titlebar = true
string title = "Configuración Personalizada Apoyo Dx"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Project!"
string pointer = "Arrow!"
boolean clientedge = true
t1 t1
pb_2 pb_2
cb_delsug cb_delsug
pb_1 pb_1
mle_1 mle_1
st_1 st_1
dw_6 dw_6
dw_1 dw_1
gb_1 gb_1
end type
global w_grup_clinic w_grup_clinic

type variables
datawindowchild area,docus
string anterior,orden
long il_DragSource, il_DropTarget, il_DragParent, il_rclick, i_fila
end variables

forward prototypes
public function integer addchildren (long hand, string agrupa)
public function integer insertcampo (string p_orden)
public function integer setorder (long p_handle, ref integer p_orden)
end prototypes

public function integer addchildren (long hand, string agrupa);integer fila
long newhand
TreeViewItem ltvi_New
fila = t1.p2.dw_4.Find("agrupa='" + agrupa +"'",1,t1.p2.dw_4.RowCount())
do while fila > 0
	if t1.p2.dw_4.GetItemString(fila,'tipocampo') = '7' then
		ltvi_New.Children = TRUE
	else
		ltvi_New.Children = FALSE
	end if
	if t1.p2.dw_4.GetItemString(fila,'estado')='1' then
		ltvi_New.PictureIndex = integer(t1.p2.dw_4.GetItemString(fila,'tipocampo'))
		ltvi_New.SelectedPictureIndex = integer(t1.p2.dw_4.GetItemString(fila,'tipocampo'))
	else
		ltvi_New.PictureIndex = 8
		ltvi_New.SelectedPictureIndex = 8
	end if
	ltvi_New.Label = t1.p2.dw_4.GetItemString(fila,'nombrecampo')
	ltvi_New.Data = t1.p2.dw_4.GetItemNumber(fila,'consecampo')
	newhand = t1.p2.tv_1.InsertItemLast(hand, ltvi_New)
	If newhand < 1 Then
		MessageBox("Error", "Error insertando item", Exclamation!)
		Return -1
	End If
	t1.p2.dw_4.SetItem(fila,'handle',newhand)
	addChildren(newhand,String(t1.p2.dw_4.GetItemNumber(fila,'consecampo')))
	if fila = t1.p2.dw_4.RowCount() then EXIT
	fila = t1.p2.dw_4.Find("agrupa='" + agrupa +"'",fila + 1,t1.p2.dw_4.RowCount())
loop

Return 0

end function

public function integer insertcampo (string p_orden);integer fila, i = 0
TreeViewItem ltvi
if p_orden = 'Borra' then
	t1.p2.tv_1.GetItem(il_rclick,ltvi)
	if ltvi.children then
		messagebox('Atención','Este campo tiene hijos, no lo puede borrar')
		return -1
	end if
	fila = t1.p2.dw_4.Find("consecampo="+string(ltvi.Data),1,t1.p2.dw_4.RowCount())
	if fila > 0 then
		t1.p2.tv_1.DeleteItem(il_rclick)
		t1.p2.dw_4.DeleteRow(fila)
	end if
	Return 0
end if

long padre, previo, ret
string valor, tipo,l_estado
if p_orden = 'insfolder' or p_orden = 'addfolder' then
	valor = 'Etiqueta'
	tipo = '7'
else
	valor = 'Texto'
	tipo = '1'
end if
do while TRUE
	i++
	fila = t1.p2.dw_4.Find("nombrecampo='" + valor + string(i) + "'",1,t1.p2.dw_4.RowCount())
	if fila = 0 then 
		valor = valor + string(i)
		Exit
	end if
LOOP

t1.p2.tv_1.GetItem(il_rclick,ltvi)
padre = t1.p2.tv_1.FindItem(ParentTreeItem!, il_rclick)
previo = t1.p2.tv_1.FindItem(PreviousTreeItem!, il_rclick)

if p_orden = 'insfolder' then
	if padre = -1 then
		if previo = -1 then
			ret = t1.p2.tv_1.InsertItemFirst(0,valor,7)
		else
			ret = t1.p2.tv_1.InsertItem(0,previo,valor,7)
		end if
	else
		if previo = -1 then
			ret = t1.p2.tv_1.InsertItemFirst(padre,valor,7)
		else
			ret = t1.p2.tv_1.InsertItem(padre,previo,valor,7)
		end if
	end if
elseif p_orden = 'addfolder' then
	if padre = -1 then
		ret = t1.p2.tv_1.InsertItemLast(0,valor,7)
	else
		if previo = -1 then
			ret = t1.p2.tv_1.InsertItemLast(padre,valor,7)
		else
			ret = t1.p2.tv_1.InsertItemLast(padre,valor,7)
		end if
	end if
elseif p_orden = 'insitem' then
	if ltvi.PictureIndex = 7 then
		ret = t1.p2.tv_1.InsertItemFirst(il_rclick,valor,1)
	else
		if padre <> -1 then 
			if previo = -1 then
				ret = t1.p2.tv_1.InsertItemFirst(padre,valor,1)
			else
				ret = t1.p2.tv_1.InsertItem(padre,previo,valor,1)
			end if
		end if
	end if
elseif p_orden = 'additem' then
	if ltvi.PictureIndex = 7 then
		ret = t1.p2.tv_1.InsertItemLast(il_rclick,valor,1)
	else
		if padre <> -1 then
			ret = t1.p2.tv_1.InsertItemLast(padre,valor,1)
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
	fila = t1.p2.dw_4.InsertRow(0)
	campo = t1.p2.dw_4.Describe("Evaluate('max(consecampo)',0)")
	t1.p2.dw_4.SetItem(fila,'codGC', t1.p1.dw_2.GetItemNumber(t1.p1.dw_2.GetRow(),'codGC'))
	t1.p2.dw_4.SetItem(fila,'codproced', t1.p1.dw_2.GetItemString(t1.p1.dw_2.GetRow(),'codproced'))
	t1.p2.dw_4.SetItem(fila,'consecampo', long(campo) + 1)
	t1.p2.dw_4.SetItem(fila,'nombrecampo', valor)
	t1.p2.dw_4.SetItem(fila,'tipocampo', tipo)
	t1.p2.dw_4.SetItem(fila,'estado', '1')
	t1.p2.dw_4.SetItem(fila,'handle', ret)
	t1.p2.dw_4.SetItem(fila,'ind', '1')
	padre = t1.p2.tv_1.FindItem(ParentTreeItem!, ret)
	if padre > 0 then
		t1.p2.tv_1.GetItem(padre,ltvi)
		t1.p2.dw_4.SetItem(fila,'agrupa', String(ltvi.Data))
	end if
	t1.p2.tv_1.GetItem(ret,ltvi)
	ltvi.Data = long(campo) + 1
	t1.p2.tv_1.SetItem(ret,ltvi)
	t1.p2.tv_1.SelectItem(ret)
	t1.p2.dw_4.ScrolltoRow(fila)
end if

Return 0

end function

public function integer setorder (long p_handle, ref integer p_orden);if p_handle <= 0 then Return -1
treeViewItem tvi
integer fila
long actual, padre, hijo

actual = p_handle
do while actual > 0
	if t1.p2.tv_1.GetItem(actual,tvi) = -1 then
		Return -1
	end if
	fila = t1.p2.dw_4.Find("consecampo="+string(tvi.Data), 1, t1.p2.dw_4.RowCount())
	if fila > 0 then
		p_orden = p_orden + 1
		t1.p2.dw_4.SetItem(fila,'orden',p_orden)
		t1.p2.dw_4.SetItem(fila,'nivel',tvi.level)
	end if
	
	if tvi.Children = TRUE then
		setorder(t1.p2.tv_1.FindItem(childTreeItem!,actual),p_orden)
	end if
	actual = t1.p2.tv_1.FindItem(NextTreeItem!,actual)
loop

Return 0

end function

on w_grup_clinic.create
this.t1=create t1
this.pb_2=create pb_2
this.cb_delsug=create cb_delsug
this.pb_1=create pb_1
this.mle_1=create mle_1
this.st_1=create st_1
this.dw_6=create dw_6
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.t1,&
this.pb_2,&
this.cb_delsug,&
this.pb_1,&
this.mle_1,&
this.st_1,&
this.dw_6,&
this.dw_1,&
this.gb_1}
end on

on w_grup_clinic.destroy
destroy(this.t1)
destroy(this.pb_2)
destroy(this.cb_delsug)
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.st_1)
destroy(this.dw_6)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(SQLCA)
t1.p1.dw_2.settransobject(SQLCA)
t1.p1.dw_2.getchild("coddoc",docus)
docus.settransobject(SQLCA)
docus.retrieve()
t1.p2.dw_4.settransobject(SQLCA)
t1.p2.dw_5.settransobject(SQLCA)
dw_6.settransobject(SQLCA)
dw_6.getchild("codaadx",area)
area.settransobject(SQLCA)
area.retrieve()
if area.rowcount()=0 then
	messagebox("Error","No se han creado areas")
	return
end if
dw_6.retrieve()
dw_1.retrieve(dw_6.getitemstring(1,1))

end event

event closequery;int ret
if t1.p2.dw_4.GetNextModified(0,Primary!) > 0 or t1.p2.dw_5.GetNextModified(0,Primary!) > 0 or t1.p2.dw_l.GetNextModified(0,Primary!) > 0 then
	ret = Messagebox('Aviso','Desea grabar los cambios del Reporte?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		t1.p2.cb_10.TriggerEvent(clicked!)
	elseif ret = 2 then
		Return
	else
		Return -1
	end if
end if
end event

event resize;t1.resize(newwidth -50, newheight -780)
t1.p1.dw_2.resize(t1.width - 300 ,t1.height - 250 )
t1.p1.st_2.y=t1.p1.dw_2.y +t1.p1.dw_2.height +10
t1.p1.st_2.x=t1.p1.dw_2.x +t1.p1.dw_2.width - 598
t1.p1.pb_3.x=t1.p1.dw_2.x+t1.p1.dw_2.width+ 50
t1.p1.pb_4.x=t1.p1.dw_2.x+t1.p1.dw_2.width+ 50
t1.p1.pb_5.x=t1.p1.dw_2.x+t1.p1.dw_2.width+ 50

t1.p2.resize(1115, t1.height - 50 )
t1.p2.tv_1.resize(1376, t1.height - 250 )

t1.p2.cb_8.y=t1.p2.height - 220
t1.p2.cb_9.y=t1.p2.height - 220
t1.p2.cb_10.y=t1.p2.height - 220
end event

type t1 from tab within w_grup_clinic
event create ( )
event destroy ( )
integer x = 41
integer y = 764
integer width = 6117
integer height = 1452
integer taborder = 30
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
alignment alignment = center!
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
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6080
integer height = 1324
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_2 dw_2
end type

on p1.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_2=create dw_2
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.st_2,&
this.dw_2}
end on

on p1.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_2)
end on

type pb_5 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 5915
integer y = 288
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &u"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "G&uardar"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
if dw_2.update()<1 then
	rollback;
	//dw_1.triggerevent(rowfocuschanged!)
else
	commit;
end if
end event

type pb_4 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 5915
integer y = 156
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &r"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Bo&rrar Procedimiento"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
dw_2.deleterow(0)
pb_5.triggerevent(clicked!)
end event

type pb_3 from picturebutton within p1
event mousemove pbm_mousemove
string tag = "              &P"
integer x = 5911
integer y = 24
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
string picturename = "insertar.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo &Procedimiento"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
if dw_1.rowcount()=0 then return
open(w_busca_proc)
end event

type st_2 from statictext within p1
integer x = 3429
integer y = 1244
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within p1
integer x = 27
integer y = 24
integer width = 5842
integer height = 1208
integer taborder = 30
string dragicon = "none!"
string dataobject = "dw_procgc"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.type = "text" then 
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
end if

end event

event itemchanged;this.accepttext()
if dwo.name="clugar" then
	this.setitem(this.getrow(),"coddoc","")
	docus.setfilter("clugar='"+data+"'")
	docus.filter()
end if
end event

event retrieveend;if rowcount=0 then st_2.text=""
end event

event retrieverow;if getitemstring(row,'tipoimpre')<>'2' then setitem(row,'coddoc',getitemstring(row,"g_coddoc"))

end event

event rowfocuschanged;long fila, hand
fila=getrow()
hand = t1.p2.tv_1.FindItem(RootTreeItem!,0)
do while hand > 0
	t1.p2.tv_1.DeleteItem(hand)
	hand = t1.p2.tv_1.FindItem(RootTreeItem!,0)
loop
t1.p2.dw_4.reset()
t1.p2.dw_5.reset()
if fila<1 then return
t1.p2.dw_5.visible=false
t1.p2.cb_7.visible=false
t1.p2.cb_11.visible=false
If  t1.p2.pb_arbol.Event clicked() = 0 then
	t1.p2.dw_4.Retrieve(dw_2.getitemnumber(fila,'codgc'),GetItemString(fila,'codproced'),'1')
else
	t1.p2.dw_4.Retrieve(dw_2.getitemnumber(fila,'codgc'),GetItemString(fila,'codproced'),'0')
end if
t1.p2.dw_5.Retrieve(GetItemString(fila,'codproced'))
t1.p2.dw_l.Retrieve(GetItemString(fila,'codproced'))
t1.p2.cb_8.enabled=true
st_2.text="Proc. "+string(fila)+" de "+string(RowCount())
t1.p2.st_3.Text = GetItemString(getrow(),'descripcion')


if  dw_2.getitemstring(dw_2.getrow(),'estado')='0' then 
	t1.p2.enabled=false
else
	t1.p2.enabled=true
end if
end event

event doubleclicked;if dw_2.getitemstring(dw_2.getrow(),'estado')='0' then 
	t1.p2.enabled=false
	return 
else
	t1.p2.enabled=true
	t1.SelectTab(2)
end if
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
i_fila=-1
openwithparm(w_funcion_dw,st_dw)
end event

type p2 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 6080
integer height = 1324
long backcolor = 67108864
string text = "Reporte"
long tabtextcolor = 33554432
string picturename = "resultados.ico"
long picturemaskcolor = 536870912
pb_arbol pb_arbol
tv_1 tv_1
st_3 st_3
cb_11 cb_11
cb_7 cb_7
cb_10 cb_10
cb_9 cb_9
cb_8 cb_8
rb_l rb_l
rb_v rb_v
dw_4 dw_4
sle_1 sle_1
dw_l dw_l
dw_5 dw_5
end type

on p2.create
this.pb_arbol=create pb_arbol
this.tv_1=create tv_1
this.st_3=create st_3
this.cb_11=create cb_11
this.cb_7=create cb_7
this.cb_10=create cb_10
this.cb_9=create cb_9
this.cb_8=create cb_8
this.rb_l=create rb_l
this.rb_v=create rb_v
this.dw_4=create dw_4
this.sle_1=create sle_1
this.dw_l=create dw_l
this.dw_5=create dw_5
this.Control[]={this.pb_arbol,&
this.tv_1,&
this.st_3,&
this.cb_11,&
this.cb_7,&
this.cb_10,&
this.cb_9,&
this.cb_8,&
this.rb_l,&
this.rb_v,&
this.dw_4,&
this.sle_1,&
this.dw_l,&
this.dw_5}
end on

on p2.destroy
destroy(this.pb_arbol)
destroy(this.tv_1)
destroy(this.st_3)
destroy(this.cb_11)
destroy(this.cb_7)
destroy(this.cb_10)
destroy(this.cb_9)
destroy(this.cb_8)
destroy(this.rb_l)
destroy(this.rb_v)
destroy(this.dw_4)
destroy(this.sle_1)
destroy(this.dw_l)
destroy(this.dw_5)
end on

type pb_arbol from picturebutton within p2
boolean visible = false
integer x = 1198
integer y = 1220
integer width = 105
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
boolean originalsize = true
alignment htextalign = left!
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return -1

end event

type tv_1 from treeview within p2
integer x = 9
integer y = 64
integer width = 1376
integer height = 1244
integer taborder = 40
boolean dragauto = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean editlabels = true
boolean deleteitems = true
boolean linesatroot = true
boolean disabledragdrop = false
string picturename[] = {"text.ico","computado.ico","editor.ico","lista.ico","radio.ico","check.ico","folder.ico","fecha.ico","computado.ico","fecha.ico","inactivo.ico"}
long picturemaskcolor = 536870912
string statepicturename[] = {"",""}
long statepicturemaskcolor = 12632256
end type

event begindrag;TreeViewItem ltvi_Source

GetItem(handle, ltvi_Source)
il_DragSource = handle
il_DragParent = FindItem(ParentTreeItem!, handle)


end event

event dragdrop;Long					ll_NewItem,l_parent, fs
TreeViewItem		ltvi_Target, ltvi_Source, ltvi_Parent, ltvi_New
int fpadre, fhijo

if il_DragSource = il_DropTarget then 
	This.Drag(Cancel!)
	SetDropHighlight(0)
	il_DropTarget = 0
	Return
end if

If GetItem(il_DropTarget, ltvi_Target) = -1 Then Return
If GetItem(il_DragSource, ltvi_Source) = -1 Then Return
fs = dw_4.Find("handle="+string(il_DragSource),1,dw_4.RowCount())

GetItem(il_DragParent, ltvi_Parent)
DeleteItem(il_DragSource)
SetNull(ltvi_Source.ItemHandle)
l_parent = FindItem(ParentTreeItem!, il_DropTarget)
if ltvi_Target.PictureIndex = 7 then 
	ll_NewItem = InsertItemSort(il_DropTarget, ltvi_Source)
else
	if l_parent = -1 then l_parent = 0
	ll_NewItem = InsertItem(l_Parent, il_DropTarget, ltvi_Source)
end if
dw_4.SetItem(fs,'handle',ll_NewItem)

this.SetDropHighlight (0)
SelectItem(ll_NewItem)

l_parent = FindItem(ParentTreeItem!,ll_NewItem)
if l_parent > 0 then
	fpadre = dw_4.Find("handle="+string(l_parent),1,dw_4.RowCount())
	dw_4.SetItem(fs,'agrupa',String(dw_4.GetItemNumber(fpadre,'consecampo')))
else
	string vnul
	setNull(vnul)
	dw_4.SetItem(fs,'agrupa',vnul)
end if
addChildren(ll_newitem,string(dw_4.GetItemNumber(fs,'consecampo')))

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

event endlabeledit;dw_4.SetItem(dw_4.GetRow(),'nombrecampo',newtext)

end event

event rightclicked;If  t1.p2.pb_arbol.Event clicked() = 0 then
    TreeViewItem ltvi_New
	il_rclick = handle
	m_campopgc m_c
	m_c = CREATE m_campopgc
	long fila
	if GetItem(handle, ltvi_New) = 1 then
		fila = dw_4.Find("consecampo=" + string(ltvi_New.Data) ,1,dw_4.RowCount())
		if dw_4.getitemstring(fila,'tipocampo')<>'7' then
			m_c.item[1].enabled=false
			m_c.item[2].enabled=false
			m_c.item[4].enabled=false
			m_c.item[5].enabled=false
		end if
	end if
	m_c.PopMenu(w_principal.PointerX(), w_principal.PointerY())
end if
end event

event selectionchanged;Integer fila
TreeViewItem ltvi_New
long handle

if GetItem(oldhandle, ltvi_New) = 1 then
	fila = dw_4.Find("consecampo=" + string(ltvi_New.Data) ,1,dw_4.RowCount())
	if fila > 0 then
		ltvi_New.Bold = FALSE
		SetItem(oldhandle, ltvi_New)
	end if
end if
handle = FindItem(CurrentTreeItem!,0)

Parent.SetRedraw(False)
if GetItem(handle, ltvi_New) = 1 then
	fila = dw_4.Find("consecampo=" + string(ltvi_New.Data) ,1,dw_4.RowCount())
	if fila > 0 then
		dw_4.ScrollToRow(fila)
		ltvi_New.Bold = TRUE
		SetItem(handle, ltvi_New)
	end if
end if
Parent.SetRedraw(True)

end event

type st_3 from statictext within p2
integer x = 18
integer y = 4
integer width = 2569
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_11 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 5925
integer y = 256
integer width = 142
integer height = 124
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &l"
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Fi&la"
end type

event clicked;long i
if dw_5.Visible then
	if dw_5.rowcount()=0 then return
	dw_5.deleterow(dw_5.getrow())
elseif dw_l.Visible then
	if dw_l.rowcount() = 0 then return
	dw_l.deleterow(dw_l.GetRow())
end if	

end event

type cb_7 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "              &F"
integer x = 5925
integer y = 116
integer width = 142
integer height = 124
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Insertar &Fila"
end type

event clicked;long fila,consecam,donde
string cproc, valor

cproc = dw_4.getitemstring(dw_4.getrow(),'codproced')
consecam = dw_4.getitemnumber(dw_4.getrow(),'consecampo')
if dw_5.Visible then
	valor = dw_5.Describe("Evaluate('max(nvalorn)',0)")
	fila = dw_5.Insertrow(0)
	dw_5.scrolltorow(fila)
	dw_5.setitem(fila,'codproced',cproc)
	dw_5.setitem(fila,'conse_campo',consecam)
	dw_5.setitem(fila,'nvalorn',long(valor)+1)
	dw_5.setfocus()
elseif dw_l.Visible then
	valor = dw_l.Describe("Evaluate('max(item)',0)")
	fila = dw_l.InsertRow(0)
	dw_l.ScrollToRow(fila)
	dw_l.SetItem(fila,'codgc',dw_4.getitemNumber(dw_4.getrow(),'codGC'))
	dw_l.SetItem(fila,'codproced',cproc)
	dw_l.SetItem(fila,'consecampo',consecam)
	dw_l.SetItem(fila,'item',long(valor)+1)
	dw_l.SetItem(fila,'estado','1')
	dw_l.SetFocus()
end if

end event

type cb_10 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3936
integer y = 1180
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &u"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "G&uardar"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
integer l_orden=0
setorder(tv_1.FindItem(RootTreeItem!,0),l_orden)
if dw_4.update()= -1 then
	rollback;
	Return -1
else
	if dw_5.update() = -1 then
		rollback;
		Return -1
	end if	
	if dw_l.update() = -1 then
		rollback;
		Return -1
	end if
	commit;
end if
Return 0
end event

type cb_9 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3785
integer y = 1180
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &r"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Bo&rrar Campo"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
if dw_4.rowcount() = 0 then return
tv_1.DeleteItem(dw_4.GetItemNumber(dw_4.GetRow(),'handle'))
dw_4.deleterow(dw_4.getrow())
if dw_4.update()=-1 then 
	rollback;
else
	commit;
end if

end event

type cb_8 from picturebutton within p2
event mousemove pbm_mousemove
string tag = "              &C"
integer x = 3630
integer y = 1180
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo &Campo"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return 
il_rclick = tv_1.FindItem(CurrentTreeItem!,0)
InsertCampo('insitem')

end event

type rb_l from radiobutton within p2
boolean visible = false
integer x = 4091
integer y = 32
integer width = 325
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista"
end type

event clicked;if this.checked then
	dw_l.Visible = TRUE
	dw_5.Visible = FALSE
else
	dw_5.Visible = TRUE
	dw_l.Visible = FALSE
end if

end event

type rb_v from radiobutton within p2
boolean visible = false
integer x = 3561
integer y = 32
integer width = 530
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Valores Referencia"
end type

event clicked;if this.checked then
	dw_5.Visible = TRUE
	dw_l.Visible = FALSE
else
	dw_l.Visible = TRUE
	dw_5.Visible = FALSE
end if

end event

type dw_4 from datawindow within p2
integer x = 1413
integer y = 64
integer width = 2139
integer height = 1184
integer taborder = 120
string title = "none"
string dataobject = "dw_campopgc"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;int i, ret, f,l_filas
treeViewItem ltvi
string tipo, modifica, campo, tipoAnt, vnul
setNull(vnul)

tv_1.GetItem(this.GetItemNumber(this.GetRow(),'handle'),ltvi)
tv_1.SelectItem(this.GetItemNumber(this.GetRow(),'handle'))
rb_l.Visible = FALSE
rb_v.Visible = FALSE
if this.GetColumnName() = 'tipocampo' then
end if


if this.GetColumnName() = 'tipocampo' then
	tipoAnt = this.GetItemString(this.GetRow(),'tipocampo')
	if tipoant='7' and ltvi.children then //etiqueta
		settext(tipoant)
		messagebox('Atención','Esta rama del árbol ya tiene hijos')
		return 2
	end if
	if isNull(data) then
		tipo = this.GetItemString(this.GetRow(),'tipocampo')
	else
		tipo = data
	end if
	if tipo = '4' then
		dw_l.SetFilter("consecampo="+string(GetItemNumber(GetRow(),'consecampo')))
		dw_l.Filter()
		dw_l.visible=true
		cb_7.visible=true
		cb_11.visible=true
		if GetItemString(GetRow(),'indvalor') = '1' then
			rb_v.Visible=TRUE
			rb_l.Visible=TRUE
			rb_l.checked = TRUE
		end if
	else
		if tipoAnt = '4' then
			ret = Messagebox('Aviso','Los items de la lista se borrarán. Desea Continuar',QUESTION!,YESNOCANCEL!)
			if ret = 1 then
				l_filas= dw_l.RowCount()
				f=1
				do while f <= l_filas
					dw_l.DeleteRow(dw_1.getrow())
					if f = dw_l.RowCount() then EXIT
					f++
				loop
				this.SetItem(this.GetRow(),'moda4','')
				dw_l.visible=false
			else 
				this.SetText('4')
				this.SetItem(this.GetRow(),'tipocampo',4)
				Return 2
			end if
		end if
		dw_5.visible = False
		cb_7.visible = False
		cb_11.visible = False
	end if
	ltvi.PictureIndex = long(tipo)
	ltvi.SelectedPictureIndex = long(tipo)
	this.SetItem(this.GetRow(),'moda1','')
	this.SetItem(this.GetRow(),'moda2','')
	this.SetItem(this.GetRow(),'moda3','')
	this.SetItem(this.GetRow(),'moda4','')
	this.SetItem(this.GetRow(),'moda5','')
	this.SetItem(this.GetRow(),'moda6','')
elseif this.GetColumnName() = 'nombrecampo' then
	if isNull(data) then
		ltvi.Label = this.GetItemString(this.GetRow(),'nombrecampo')
	else
		ltvi.Label = data
	end if
elseif this.GetColumnName() = 'indvalor' then
	string iv
	if isNull(data) then
		iv = getitemstring(this.getrow(),'indvalor')
	else
		iv = data
	end if
	if data = '1' then
		dw_5.SetFilter("conse_campo="+string(dw_4.GetItemNumber(dw_4.GetRow(),'consecampo')))
		dw_5.Filter()
		dw_5.visible=true
		cb_7.visible=true
		cb_11.visible=true
		//sle_1.visible=true
		if GetItemString(GetRow(),'tipocampo') = '4' then
			rb_v.Visible=TRUE
			rb_l.Visible=TRUE
			rb_v.checked = TRUE
		end if
	else
		dw_5.visible=False
		cb_7.visible=False
		cb_11.visible=False
		//sle_1.visible=false		
	end if
end if
this.SetItem(this.GetRow(),'usu_modif',usuario)	
this.SetItem(this.GetRow(),'fecha_modif',datetime(today(),now()))	
this.AcceptText()
tv_1.SetItem(tv_1.FindItem(CurrentTreeItem!, 0),ltvi)

end event

event retrieveend;if rowcount = 0 then Return
integer i, fila
long hand
TreeViewItem ltvi_New
for i = 1 to RowCount()
	if IsNull(GetItemString(i,'agrupa')) then
		ltvi_New.Label = GetItemString(i,'nombrecampo')
		ltvi_New.Data = GetItemNumber(i,'consecampo')
		if GetItemString(i,'estado')='1' then
			ltvi_New.PictureIndex = long(GetItemString(i,'tipocampo'))
			ltvi_New.SelectedPictureIndex = long(GetItemString(i,'tipocampo'))
		else
			ltvi_New.PictureIndex =8
			ltvi_New.SelectedPictureIndex =8
		end if
		hand = t1.p2.tv_1.InsertItemLast(0, ltvi_New)
		If hand < 1 Then
			MessageBox("Error", "Error insertando item", Exclamation!)
			Return -1
		End If
		SetItem(i,'handle',hand)
		// Children
		addChildren(hand,String(GetItemNumber(i,'consecampo')))
	End if
next
//hand = GetItemNumber(rowcount,'handle')
//if hand > 0 then
//	t1.p2.tv_1.SelectItem(hand)
//end if
ResetUpdate()
hand = tv_1.FindItem(RootTreeItem!, 0)
tv_1.ExpandAll(hand)


//long fila
//fila=getrow()
//if fila<1 then return
//dw_5.retrieve(getitemstring(fila,'codproced'),getitemnumber(fila,'consecampo'))
//if getitemstring(fila,"indvalor")='1' then
//	dw_5.visible=true
//	cb_7.visible=true
//	cb_11.visible=true
//	cb_12.visible=true
//else
//	dw_5.visible=false
//	cb_7.visible=false
//	cb_11.visible=false
//	cb_12.visible=false
//end if
//

end event

event rowfocuschanged;rb_v.Visible = FALSE
rb_l.Visible = FALSE
if GetRow() = 0 or currentrow = 0 then Return
if GetItemString(GetRow(),'indvalor') = '1' then
	dw_5.SetFilter("conse_campo="+string(GetItemNumber(GetRow(),'consecampo')))
	dw_5.Filter()
	dw_5.visible=true
	cb_7.visible=true
	cb_11.visible=true
	if GetItemString(GetRow(),'tipocampo') = '4' then
		rb_v.Visible = TRUE
		rb_l.Visible = TRUE
		rb_v.checked = TRUE
	else
		rb_v.Visible = FALSE
		rb_l.Visible = FALSE
	end if
else
	dw_5.visible=False
	cb_7.visible=False
	cb_11.visible=False
end if
if GetItemString(GetRow(),'tipocampo') = '4' then
	dw_l.SetFilter("consecampo="+string(dw_4.GetItemNumber(dw_4.GetRow(),'consecampo')))
	dw_l.Filter()
	if not rb_v.Visible then
		dw_l.Visible = True
	end if
	cb_7.visible = True
	cb_11.visible = True
else
	dw_l.Visible = False
end if

end event

event rowfocuschanging;IF (KeyDown(KeyTab!) and currentrow<>newrow) or ((KeyDown(KeyEnter!) or KeyDown(KeyDownArrow!) OR & 
   KeyDown(KeyUpArrow!) OR KeyDown(KeyPageDown!) OR KeyDown(KeyPageUp!)) and getfocus()=this) THEN
	return -1
end if
end event

event itemfocuschanged;if string(dwo.Name) = 'moda4' then
	string valor, modifica = "moda4.values='"
	int i
	for i = 1 to dw_l.RowCount()
		valor = dw_l.GetItemString(i,'nombre')
		if not isNull(valor) and valor<>'' then
			modifica = modifica+valor+"~t"+valor+string(i)+"/"
		end if
	next	
	this.Modify(modifica + "'")
end if
end event

event buttonclicked;if dwo.name ='b_plan' then
	openwithparm(w_edita_plant_rtf,t1.p2.dw_4)
end if

end event

event doubleclicked;if dwo.name='formula' then
	openwithparm(w_edita_form_apdx,this)
	if message.stringparm<>'' then setitem(getrow(),'formula',message.stringparm)
end if
end event

type sle_1 from singlelineedit within p2
boolean visible = false
integer x = 3616
integer y = 904
integer width = 2341
integer height = 64
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type dw_l from datawindow within p2
boolean visible = false
integer x = 3566
integer y = 120
integer width = 2336
integer height = 740
integer taborder = 30
string title = "none"
string dataobject = "dw_campopgclista"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

type dw_5 from datawindow within p2
integer x = 3566
integer y = 120
integer width = 2336
integer height = 752
integer taborder = 160
string title = "Valores Normales"
string dataobject = "dw_val_norm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

type pb_2 from picturebutton within w_grup_clinic
event mousemove pbm_mousemove
integer x = 3397
integer y = 448
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &E"
boolean originalsize = true
string picturename = "editar.gif"
string disabledname = "d_editar.gif"
alignment htextalign = left!
string powertiptext = "&Editar Grupo"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
if dw_1.rowcount()=0 then return
new_or_edit=false
open(w_nuev_gclin)

end event

type cb_delsug from picturebutton within w_grup_clinic
event mousemove pbm_mousemove
integer x = 3397
integer y = 312
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &B"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "&Borrar Grupo"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
dw_1.deleterow(0)
if dw_1.update()<1 then
	rollback;
	dw_1.retrieve()
else
	commit;
end if

end event

type pb_1 from picturebutton within w_grup_clinic
event mousemove pbm_mousemove
string tag = "              &G"
integer x = 3397
integer y = 172
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo &Grupo"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
new_or_edit=true
open(w_nuev_gclin)

end event

type mle_1 from multilineedit within w_grup_clinic
integer x = 3694
integer y = 140
integer width = 2354
integer height = 316
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
string text = "Tenga en cuenta los siguentes aspectos: -Seleccione un area de apoyo diagnóstico, de esta area se visualizarán los grupos o secciones. -Seleccione un grupo, de este grupo se visualizarán los procedimient- Seleccione un procedimiento, de este se visualizará la configuración del reporte que usted puede modificar."
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_grup_clinic
integer x = 41
integer y = 24
integer width = 146
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Area:"
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_grup_clinic
integer x = 201
integer y = 16
integer width = 1298
integer height = 100
integer taborder = 10
string title = "none"
string dataobject = "dw_area_peq"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
dw_1.reset()
dw_1.retrieve(getitemstring(1,1))

end event

type dw_1 from datawindow within w_grup_clinic
integer x = 82
integer y = 168
integer width = 3250
integer height = 548
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_grup_resu"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila
string tipo

fila=getrow()
t1.p1.dw_2.reset()
if fila<1 then return
tipo=getitemstring(fila,'codaadx')
if isnull(getitemstring(fila,'codaadx')) or  getitemstring(fila,'codaadx')='' then
	tipo='0'
else
	tipo='1'
end if
t1.p1.dw_2.retrieve(getitemnumber(fila,'codgc'),tipo)

end event

event retrieveend;if rowcount()=0 then
	t1.p1.dw_2.reset()
	t1.p2.dw_4.reset()
	t1.p2.dw_5.reset()
end if
end event

type gb_1 from groupbox within w_grup_clinic
integer x = 37
integer y = 100
integer width = 3570
integer height = 656
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos:"
end type

