$PBExportHeader$w_pyp_config.srw
forward
global type w_pyp_config from window
end type
type t1 from tab within w_pyp_config
end type
type p1 from userobject within t1
end type
type pb_n from picturebutton within p1
end type
type pb_b from picturebutton within p1
end type
type dw_1 from datawindow within p1
end type
type p1 from userobject within t1
pb_n pb_n
pb_b pb_b
dw_1 dw_1
end type
type p2 from userobject within t1
end type
type pb_2 from picturebutton within p2
end type
type pb_1 from picturebutton within p2
end type
type dw_2 from datawindow within p2
end type
type p2 from userobject within t1
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
end type
type p4 from userobject within t1
end type
type pb_6 from picturebutton within p4
end type
type pb_5 from picturebutton within p4
end type
type dw_4 from datawindow within p4
end type
type p4 from userobject within t1
pb_6 pb_6
pb_5 pb_5
dw_4 dw_4
end type
type p5 from userobject within t1
end type
type pb_8 from picturebutton within p5
end type
type pb_7 from picturebutton within p5
end type
type st_1 from statictext within p5
end type
type dw_5 from datawindow within p5
end type
type p5 from userobject within t1
pb_8 pb_8
pb_7 pb_7
st_1 st_1
dw_5 dw_5
end type
type t1 from tab within w_pyp_config
p1 p1
p2 p2
p4 p4
p5 p5
end type
type pb_10 from picturebutton within w_pyp_config
end type
type pb_9 from picturebutton within w_pyp_config
end type
end forward

global type w_pyp_config from window
integer width = 6062
integer height = 1884
boolean titlebar = true
string title = "Configuración Promoción y Mantenimiento"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
t1 t1
pb_10 pb_10
pb_9 pb_9
end type
global w_pyp_config w_pyp_config

on w_pyp_config.create
this.t1=create t1
this.pb_10=create pb_10
this.pb_9=create pb_9
this.Control[]={this.t1,&
this.pb_10,&
this.pb_9}
end on

on w_pyp_config.destroy
destroy(this.t1)
destroy(this.pb_10)
destroy(this.pb_9)
end on

event open;t1.p1.dw_1.retrieve()
end event

type t1 from tab within w_pyp_config
integer x = 32
integer y = 36
integer width = 5998
integer height = 1592
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
p1 p1
p2 p2
p4 p4
p5 p5
end type

on t1.create
this.p1=create p1
this.p2=create p2
this.p4=create p4
this.p5=create p5
this.Control[]={this.p1,&
this.p2,&
this.p4,&
this.p5}
end on

on t1.destroy
destroy(this.p1)
destroy(this.p2)
destroy(this.p4)
destroy(this.p5)
end on

type p1 from userobject within t1
integer x = 18
integer y = 112
integer width = 5961
integer height = 1464
long backcolor = 67108864
string text = "Curso de Vida"
long tabtextcolor = 33554432
string picturename = "cursov.ico"
long picturemaskcolor = 536870912
pb_n pb_n
pb_b pb_b
dw_1 dw_1
end type

on p1.create
this.pb_n=create pb_n
this.pb_b=create pb_b
this.dw_1=create dw_1
this.Control[]={this.pb_n,&
this.pb_b,&
this.dw_1}
end on

on p1.destroy
destroy(this.pb_n)
destroy(this.pb_b)
destroy(this.dw_1)
end on

type pb_n from picturebutton within p1
event mousemove pbm_mousemove
integer x = 3826
integer y = 36
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
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Plantilla"
end type

event clicked;int f, li_maximos
f = dw_1.InsertRow(0)
dw_1.scrolltoRow(f)
li_maximos=integer(dw_1.getitemstring(1,'maximos'))
if isnull(li_maximos) then li_maximos=0
li_maximos++
if li_maximos<10 then 
	dw_1.setitem(f,'codigo_cv','0'+string(li_maximos))
else
	dw_1.setitem(f,'codigo_cv',string(li_maximos))
end if
end event

type pb_b from picturebutton within p1
event mousemove pbm_mousemove
integer x = 3826
integer y = 168
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Plantilla"
end type

event clicked;if dw_1.RowCount() > 0 then
	dw_1.DeleteRow(0)
end if

end event

type dw_1 from datawindow within p1
integer x = 32
integer y = 28
integer width = 3694
integer height = 1360
integer taborder = 20
string title = "none"
string dataobject = "dw_pym_cursovida"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
end event

event rowfocuschanged;if currentrow = 0 or GetRow() = 0 then Return
t1.p2.dw_2.Retrieve(GetItemString(getRow(),'codigo_cv'))
if isNull(GetItemString(GetRow(),'codigo_cv')) then Return
t1.p2.dw_2.TriggerEvent(RowFocusChanged!)

end event

type p2 from userobject within t1
integer x = 18
integer y = 112
integer width = 5961
integer height = 1464
long backcolor = 67108864
string text = "Intervenciones de Salud"
long tabtextcolor = 33554432
string picturename = "progr_pyp.ico"
long picturemaskcolor = 536870912
pb_2 pb_2
pb_1 pb_1
dw_2 dw_2
end type

on p2.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_2=create dw_2
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_2}
end on

on p2.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_2)
end on

type pb_2 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3831
integer y = 44
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Plantilla"
end type

event clicked;if t1.p1.dw_1.RowCount() = 0 then Return
if isNull(t1.p1.dw_1.GetItemString(t1.p1.dw_1.Getrow(),'codigo_cv')) then 
	MessageBox('Error','Debe especificar el Ciclo de Vida')
	Return
end if
int f,li_maximos
f = dw_2.InsertRow(0)
dw_2.SetItem(f,'codigo_cv',t1.p1.dw_1.GetItemString(t1.p1.dw_1.Getrow(),'codigo_cv'))

li_maximos=dw_2.GetItemnumber(dw_2.Getrow(),'maximos')
if isnull(li_maximos) then li_maximos=0
li_maximos++
dw_2.SetItem(f,'codigo_is',li_maximos)
dw_2.scrolltoRow(f)

end event

type pb_1 from picturebutton within p2
event mousemove pbm_mousemove
integer x = 3831
integer y = 184
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Plantilla"
end type

event clicked;if dw_2.RowCount() > 0 then
	dw_2.DeleteRow(0)
end if

end event

type dw_2 from datawindow within p2
integer x = 32
integer y = 44
integer width = 3753
integer height = 1368
integer taborder = 30
string title = "none"
string dataobject = "dw_pym_actividadsalud"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event rowfocuschanged;if currentrow = 0 or GetRow() = 0 then Return

t1.p4.dw_4.Retrieve(GetItemString(GetRow(),'codigo_cv'),GetItemnumber(GetRow(),'codigo_is'))
t1.p4.dw_4.TriggerEvent(RowFocusChanged!)

end event

event rowfocuschanging;if t1.p4.dw_4.Event RowFocusChanging(0,0) = -1 then
	Return -1
end if
if t1.p4.dw_4.DeletedCount() > 0 or t1.p4.dw_4.ModifiedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then
		if t1.p4.dw_4.update() = -1 then
			rollback;
			Return -1
		end if
	elseif ret = 3 then
		Return -1
	end if	
end if
Return 0

end event

type p4 from userobject within t1
integer x = 18
integer y = 112
integer width = 5961
integer height = 1464
long backcolor = 67108864
string text = "Productos"
long tabtextcolor = 33554432
string picturename = "ribon_producto.ico"
long picturemaskcolor = 536870912
pb_6 pb_6
pb_5 pb_5
dw_4 dw_4
end type

on p4.create
this.pb_6=create pb_6
this.pb_5=create pb_5
this.dw_4=create dw_4
this.Control[]={this.pb_6,&
this.pb_5,&
this.dw_4}
end on

on p4.destroy
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.dw_4)
end on

type pb_6 from picturebutton within p4
event mousemove pbm_mousemove
integer x = 5778
integer y = 164
integer width = 146
integer height = 128
integer taborder = 100
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &b"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Plantilla"
end type

event clicked;if dw_4.RowCount() > 0 then
	dw_4.DeleteRow(0)
end if

end event

type pb_5 from picturebutton within p4
event mousemove pbm_mousemove
integer x = 5778
integer y = 28
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Adicionar Plantilla"
end type

event clicked;if t1.p2.dw_2.RowCount() = 0 then Return
int f,lmax
f = dw_4.InsertRow(0)

dw_4.SetItem(f,'codigo_cv',t1.p2.dw_2.GetItemString(t1.p2.dw_2.Getrow(),'codigo_cv'))
dw_4.SetItem(f,'codigo_is',t1.p2.dw_2.GetItemnumber(t1.p2.dw_2.Getrow(),'codigo_is'))
if isnull(dw_4.GetItemnumber(dw_4.Getrow(),'maximos')) then
	lmax=0
else
	lmax=dw_4.GetItemnumber(dw_4.Getrow(),'maximos')
end if
dw_4.SetItem(f,'item_ed',lmax +1)
dw_4.	SetItem(f,'cod_prodpym',dw_4.GetItemString(f,'codigo_cv')+ string(dw_4.GetItemnumber(f,'codigo_is'))+string( dw_4.GetItemnumber(f,'item_ed') ))
dw_4.scrolltoRow(f)

end event

type dw_4 from datawindow within p4
integer x = 32
integer y = 28
integer width = 5719
integer height = 1388
integer taborder = 20
string title = "none"
string dataobject = "dw_pym_productos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event doubleclicked;if getcolumnname()='pcups' then
		open(w_busca_proc)
		st_proced stp
		stp=message.powerobjectparm
		if not isvalid(stp) then return
		if stp.interno<>'' then
			setitem(getrow(),'cod_cups',stp.interno)
			setitem(getrow(),'pcups',stp.cups)
			setitem(getrow(),'cod_version',stp.version)
			setitem(getrow(),'descripcion',stp.descrip)
			triggerevent(itemchanged!)
		end if
end if
if getcolumnname()='cod_atc' then
	st_med st_med
	st_pa_medica st_m

	open(w_busca_atc)	
	st_med = Message.PowerObjectParm
	if not isValid(st_med) then Return -1
	setitem(getrow(),'desp_atc',st_med.medicamento)
	setitem(getrow(),'cod_atc',st_med.cmedica)
end if
end event

type p5 from userobject within t1
boolean visible = false
integer x = 18
integer y = 112
integer width = 5961
integer height = 1464
long backcolor = 67108864
string text = "Acciones"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_8 pb_8
pb_7 pb_7
st_1 st_1
dw_5 dw_5
end type

on p5.create
this.pb_8=create pb_8
this.pb_7=create pb_7
this.st_1=create st_1
this.dw_5=create dw_5
this.Control[]={this.pb_8,&
this.pb_7,&
this.st_1,&
this.dw_5}
end on

on p5.destroy
destroy(this.pb_8)
destroy(this.pb_7)
destroy(this.st_1)
destroy(this.dw_5)
end on

type pb_8 from picturebutton within p5
event mousemove pbm_mousemove
integer x = 3232
integer y = 324
integer width = 142
integer height = 124
integer taborder = 110
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

event clicked;if dw_5.RowCount() > 0 then
	dw_5.DeleteRow(0)
end if

end event

type pb_7 from picturebutton within p5
event mousemove pbm_mousemove
integer x = 3232
integer y = 196
integer width = 142
integer height = 124
integer taborder = 100
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

event clicked;if t1.p4.dw_4.RowCount() = 0 then Return
if isNull(t1.p4.dw_4.GetItemString(t1.p4.dw_4.Getrow(),'subitem')) then 
	MessageBox('Error','Debe especificar el Código (Item) de Subproducto')
	Return
end if
int f
string valor
valor = dw_5.Describe("Evaluate('max(item)',0)")
f = dw_5.InsertRow(0)
dw_5.SetItem(f,'cod_prodpyp',t1.p4.dw_4.GetItemString(t1.p4.dw_4.Getrow(),'cod_prodpyp'))
dw_5.SetItem(f,'item',long(valor) + 1)
dw_5.scrolltoRow(f)

end event

type st_1 from statictext within p5
integer x = 69
integer y = 80
integer width = 750
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Acciones por procedimiento"
boolean focusrectangle = false
end type

type dw_5 from datawindow within p5
integer x = 69
integer y = 160
integer width = 3150
integer height = 1012
integer taborder = 30
string title = "none"
string dataobject = "dw_pyp_actividades"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

type pb_10 from picturebutton within w_pyp_config
event mousemove pbm_mousemove
integer x = 2784
integer y = 1648
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Grabar"
end type

event clicked;
if t1.p1.dw_1.update() = -1 then
	rollback;
	Return -1
elseif t1.p2.dw_2.Update() = -1 then
	rollback;
	Return -1
//elseif t1.p3.dw_3.Update() = -1 then
//	rollback;
//	Return -1
elseif t1.p4.dw_4.Update() = -1 then
	rollback;
	Return -1
elseif t1.p5.dw_5.Update() = -1 then
	rollback;
	Return -1						
end if
commit;
Return 0

end event

type pb_9 from picturebutton within w_pyp_config
event mousemove pbm_mousemove
integer x = 2633
integer y = 1648
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &a"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)

end event

