$PBExportHeader$w_def_ciclos.srw
forward
global type w_def_ciclos from window
end type
type dw_1 from datawindow within w_def_ciclos
end type
type st_2 from statictext within w_def_ciclos
end type
type st_1 from statictext within w_def_ciclos
end type
type pb_5 from picturebutton within w_def_ciclos
end type
type pb_2 from picturebutton within w_def_ciclos
end type
type pb_1 from picturebutton within w_def_ciclos
end type
type dw_cab from datawindow within w_def_ciclos
end type
type dw_cpo from datawindow within w_def_ciclos
end type
end forward

global type w_def_ciclos from window
integer width = 2373
integer height = 988
boolean titlebar = true
string title = "Nómina - Definición de Ciclos x Turno"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_ciclo.ico"
dw_1 dw_1
st_2 st_2
st_1 st_1
pb_5 pb_5
pb_2 pb_2
pb_1 pb_1
dw_cab dw_cab
dw_cpo dw_cpo
end type
global w_def_ciclos w_def_ciclos

type variables
boolean cambio
datawindowchild dwc_cp
string i_cemp

end variables

on w_def_ciclos.create
this.dw_1=create dw_1
this.st_2=create st_2
this.st_1=create st_1
this.pb_5=create pb_5
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_cab=create dw_cab
this.dw_cpo=create dw_cpo
this.Control[]={this.dw_1,&
this.st_2,&
this.st_1,&
this.pb_5,&
this.pb_2,&
this.pb_1,&
this.dw_cab,&
this.dw_cpo}
end on

on w_def_ciclos.destroy
destroy(this.dw_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_5)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_cab)
destroy(this.dw_cpo)
end on

event open;select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
if sqlca.sqlcode=-1 then
	messagebox("Error leyendo la tabla lugar",sqlca.sqlerrtext)
	return -1
end if
if isnull(i_cemp) then
	messagebox("Error Código Empresa",'No existe el código de la empresa en la tabla lugar, debe colocarlo allí para poder continuar')
	return -1
end if
dw_cpo.GetChild('cod_concep',dwc_cp)
dwc_cp.SetTransObject(SQLCA)
dwc_cp.Retrieve(i_cemp)

dw_cab.Retrieve()

end event

event closequery;if cambio then
	if messageBox('Atención','Ha realizado cambios. Desea continuar y perder los cambios?',QUESTION!,yesno!,2) = 2 then Return -1
end if

end event

type dw_1 from datawindow within w_def_ciclos
boolean visible = false
integer x = 59
integer y = 844
integer width = 279
integer height = 44
integer taborder = 20
string title = "none"
string dataobject = "dw_ciclo_turno"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)
end event

type st_2 from statictext within w_def_ciclos
integer x = 46
integer y = 520
integer width = 224
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Turnos"
boolean focusrectangle = false
end type

type st_1 from statictext within w_def_ciclos
integer x = 59
integer y = 16
integer width = 206
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ciclos"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_def_ciclos
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2080
integer y = 372
integer width = 146
integer height = 128
integer taborder = 30
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

event clicked;long i,fila
string cual

cual=dw_cab.getitemstring(dw_cab.GetRow(),'codigo')
delete from nom_ciclos_turno where cod_ciclo=:cual;
if sqlca.sqlcode <> 0 then
	Rollback;
	Return -1
end if
for i = 1 to 7
	if not isnull(dw_cpo.getitemstring(1,'dia'+string(i))) then 
		fila = dw_1.InsertRow(0)
		dw_1.setitem(fila,'cod_ciclo',dw_cab.GetItemString(dw_cab.GetRow(),'codigo'))
		dw_1.setitem(fila,'dia',i)
		dw_1.setitem(fila,'cod_turno',dw_cpo.getitemstring(1,'dia'+string(i)))
	end if 
next
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
if dw_1.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
cambio = FALSE
Return 0


end event

type pb_2 from picturebutton within w_def_ciclos
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2080
integer y = 220
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

event clicked;if dw_cab.RowCount() > 0 then
	string cual
	cual=dw_cab.getitemstring(dw_cab.GetRow(),'codigo')
	delete from nom_ciclos_turno where cod_ciclo=:cual;
	if sqlca.sqlcode <> 0 then
		Rollback;
		Return -1
	end if
	
	dw_cab.DeleteRow(dw_cab.GetRow())
	if dw_cab.Update() = -1 then
		Rollback;
		Return -1
	end if
	Commit;
end if
end event

type pb_1 from picturebutton within w_def_ciclos
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2080
integer y = 84
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;long fila
fila = dw_cab.InsertRow(0)
dw_cab.ScrolltoRow(fila)
cambio = TRUE
dw_cpo.reset()
fila = dw_cpo.InsertRow(0)
dw_cpo.SetItem(fila,'codigo',dw_cab.GetItemString(dw_cab.GetRow(),'codigo'))
cambio = TRUE

end event

type dw_cab from datawindow within w_def_ciclos
integer x = 41
integer y = 88
integer width = 1979
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_ciclos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cpo.Reset()
if currentrow = 0 or RowCount() = 0 then Return
dw_1.Retrieve(getItemString(GetRow(),'codigo'))
int li,fila
for li=1 to dw_1.rowcount()
	if li=1 then 
		fila = dw_cpo.InsertRow(0)
		dw_cpo.SetItem(fila,'codigo',dw_cab.GetItemString(dw_cab.GetRow(),'codigo'))
	end if
	dw_cpo.SetItem(fila,'dia'+string(dw_1.getitemnumber(li,'dia')),dw_1.getitemstring(li,'cod_turno'))
next
end event

event constructor;setTransObject(SQLCA)

end event

event rowfocuschanging;if cambio then
	long ret
	ret = MessageBox('Atención','Ha realizado cambios. Desea guardarlos?',QUESTION!,yesno!)
	if ret = 1 then
		Return pb_5.Event clicked()
	end if
	cambio = FALSE
end if

end event

type dw_cpo from datawindow within w_def_ciclos
integer x = 46
integer y = 580
integer width = 2171
integer height = 252
integer taborder = 10
string title = "none"
string dataobject = "dw_ciclos_turno"
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if acceptText() = - 1 then Return -1
cambio = TRUE

end event

