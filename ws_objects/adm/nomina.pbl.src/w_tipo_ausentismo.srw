$PBExportHeader$w_tipo_ausentismo.srw
forward
global type w_tipo_ausentismo from window
end type
type tab_1 from tab within w_tipo_ausentismo
end type
type t_rf from userobject within tab_1
end type
type dw_1 from datawindow within t_rf
end type
type t_rf from userobject within tab_1
dw_1 dw_1
end type
type t_fs from userobject within tab_1
end type
type dw_2 from datawindow within t_fs
end type
type t_fs from userobject within tab_1
dw_2 dw_2
end type
type tab_1 from tab within w_tipo_ausentismo
t_rf t_rf
t_fs t_fs
end type
type pb_1 from picturebutton within w_tipo_ausentismo
end type
type pb_2 from picturebutton within w_tipo_ausentismo
end type
type pb_5 from picturebutton within w_tipo_ausentismo
end type
end forward

global type w_tipo_ausentismo from window
integer width = 4896
integer height = 1936
boolean titlebar = true
string title = "Nómina - Tipo de Ausentismo"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_asentismo.ico"
tab_1 tab_1
pb_1 pb_1
pb_2 pb_2
pb_5 pb_5
end type
global w_tipo_ausentismo w_tipo_ausentismo

type variables
boolean cambio
string i_cemp
datawindowchild dwc_generico,dwc_generico1,dwc_gen2

end variables

event open;tab_1.t_rf.dw_1.Retrieve()

end event

on w_tipo_ausentismo.create
this.tab_1=create tab_1
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_5=create pb_5
this.Control[]={this.tab_1,&
this.pb_1,&
this.pb_2,&
this.pb_5}
end on

on w_tipo_ausentismo.destroy
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_5)
end on

event resize;//
end event

type tab_1 from tab within w_tipo_ausentismo
event create ( )
event destroy ( )
integer x = 37
integer y = 20
integer width = 4823
integer height = 1624
integer taborder = 20
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
t_rf t_rf
t_fs t_fs
end type

on tab_1.create
this.t_rf=create t_rf
this.t_fs=create t_fs
this.Control[]={this.t_rf,&
this.t_fs}
end on

on tab_1.destroy
destroy(this.t_rf)
destroy(this.t_fs)
end on

event selectionchanged;tab_1.t_fs.dw_2.setfocus()
end event

type t_rf from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4786
integer height = 1496
long backcolor = 67108864
string text = "Tipos"
long tabtextcolor = 33554432
string picturename = "referencia.ico"
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on t_rf.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on t_rf.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within t_rf
integer x = 14
integer y = 20
integer width = 4763
integer height = 1448
integer taborder = 30
string title = "none"
string dataobject = "dw_conf_ausentismo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
dw_1.GetChild('cod_concep', dwc_generico)
dw_1.GetChild('cod_concep_base', dwc_generico1)
dw_1.GetChild('cod_concep_emp', dwc_gen2)
dwc_generico.SetTransObject(SQLCA)
dwc_generico1.SetTransObject(SQLCA)
dwc_gen2.SetTransObject(SQLCA)
select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return
end if
if isnull(i_cemp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return
end if
dwc_generico.Retrieve(i_cemp)
dwc_generico1.Retrieve(i_cemp)
dwc_gen2.Retrieve(i_cemp)

end event

event rowfocuschanged;//tab_1.t_fs.dw_2.retrieve(tab_1.t_rf.dw_1.getitemstring(tab_1.t_rf.dw_1.getrow(),'cod_ausen'))
//if dw_1.getitemstring(currentrow,'incap')='1' then
//	tab_1.t_fs.visible=true
//else
//	tab_1.t_fs.visible=false
//end if
end event

type t_fs from userobject within tab_1
event create ( )
event destroy ( )
boolean visible = false
integer x = 18
integer y = 112
integer width = 4786
integer height = 1496
long backcolor = 67108864
string text = "Rangos"
long tabtextcolor = 33554432
string picturename = "factura.ico"
long picturemaskcolor = 536870912
dw_2 dw_2
end type

on t_fs.create
this.dw_2=create dw_2
this.Control[]={this.dw_2}
end on

on t_fs.destroy
destroy(this.dw_2)
end on

type dw_2 from datawindow within t_fs
integer x = 41
integer y = 68
integer width = 1847
integer height = 1280
integer taborder = 30
string title = "none"
string dataobject = "dw_conf_ausentismo_det"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

type pb_1 from picturebutton within w_tipo_ausentismo
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2327
integer y = 1684
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;long fila
string valor
if tab_1.selectedtab=1 then
	fila =tab_1.t_rf.dw_1.InsertRow(0)
	tab_1.t_rf.dw_1.ScrolltoRow(fila)
else
	valor = tab_1.t_fs.dw_2.Describe("Evaluate('max(item)',0)")
	if isnull(valor) then valor='0'
	fila = tab_1.t_fs.dw_2.InsertRow(0)
	tab_1.t_fs.dw_2.SetItem(fila,'cod_ausen',tab_1.t_rf.dw_1.getitemstring(tab_1.t_rf.dw_1.getrow(),'cod_ausen'))
	tab_1.t_fs.dw_2.SetItem(fila,'item',long(valor) + 1)
	tab_1.t_fs.dw_2.ScrolltoRow(fila)
end if
cambio = TRUE

end event

type pb_2 from picturebutton within w_tipo_ausentismo
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2487
integer y = 1684
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Fila"
end type

event clicked;if tab_1.selectedtab=1 then
	if tab_1.t_rf.dw_1.RowCount() > 0 then
		if tab_1.t_rf.dw_1.GetItemStatus(tab_1.t_rf.dw_1.GetRow(),0,Primary!) = NewModified! then
			tab_1.t_rf.dw_1.DeleteRow(tab_1.t_rf.dw_1.GetRow())
			cambio = TRUE
		else
			MessageBox('Atención','Solo puede borrar registros nuevos')
		end if
	end if
else
	if tab_1.t_fs.dw_2.RowCount() > 0 then
		if tab_1.t_fs.dw_2.GetItemStatus(tab_1.t_fs.dw_2.GetRow(),0,Primary!) = NewModified! then
			tab_1.t_fs.dw_2.DeleteRow(tab_1.t_fs.dw_2.GetRow())
			cambio = TRUE
		else
			MessageBox('Atención','Solo puede borrar registros nuevos')
		end if
	end if
end if
end event

type pb_5 from picturebutton within w_tipo_ausentismo
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2642
integer y = 1684
integer width = 146
integer height = 128
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
string powertiptext = "Grabar"
end type

event clicked;long fila
if tab_1.t_rf.dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
if tab_1.t_fs.dw_2.Update() = -1 then
	Rollback;
	Return -1
end if

end event

