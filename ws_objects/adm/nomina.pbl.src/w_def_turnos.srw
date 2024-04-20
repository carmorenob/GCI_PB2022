$PBExportHeader$w_def_turnos.srw
forward
global type w_def_turnos from window
end type
type st_2 from statictext within w_def_turnos
end type
type st_1 from statictext within w_def_turnos
end type
type pb_5 from picturebutton within w_def_turnos
end type
type pb_4 from picturebutton within w_def_turnos
end type
type pb_3 from picturebutton within w_def_turnos
end type
type pb_2 from picturebutton within w_def_turnos
end type
type pb_1 from picturebutton within w_def_turnos
end type
type dw_cab from datawindow within w_def_turnos
end type
type dw_cpo from datawindow within w_def_turnos
end type
end forward

global type w_def_turnos from window
integer width = 2450
integer height = 1304
boolean titlebar = true
string title = "Nómina - Definición Turnos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_vigencia.ico"
st_2 st_2
st_1 st_1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_cab dw_cab
dw_cpo dw_cpo
end type
global w_def_turnos w_def_turnos

type variables
boolean cambio
datawindowchild dwc_cp
string i_cemp

end variables

on w_def_turnos.create
this.st_2=create st_2
this.st_1=create st_1
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_cab=create dw_cab
this.dw_cpo=create dw_cpo
this.Control[]={this.st_2,&
this.st_1,&
this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_cab,&
this.dw_cpo}
end on

on w_def_turnos.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
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

type st_2 from statictext within w_def_turnos
integer x = 41
integer y = 528
integer width = 425
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Horas Referencia"
boolean focusrectangle = false
end type

type st_1 from statictext within w_def_turnos
integer x = 55
integer y = 24
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Esquemas"
boolean focusrectangle = false
end type

type pb_5 from picturebutton within w_def_turnos
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 1993
integer y = 380
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

event clicked;long i
for i = 1 to dw_cpo.RowCount()
	if isNull(dw_cpo.GetItemDateTime(i,'horaini')) or isNull(dw_cpo.GetItemDateTime(i,'horafin')) then
		messageBox('Atención','La definición de horas debe completarse. Fila '+string(i))
		Return -1
	end if
next
if dw_cab.Update() = -1 then
	Rollback;
	Return -1
end if
if dw_cpo.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
cambio = FALSE
Return 0


end event

type pb_4 from picturebutton within w_def_turnos
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2222
integer y = 596
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar"
end type

event clicked;long fila
fila = dw_cpo.InsertRow(0)
dw_cpo.SetItem(fila,'codigo',dw_cab.GetItemString(dw_cab.GetRow(),'codigo'))
cambio = TRUE

end event

type pb_3 from picturebutton within w_def_turnos
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2222
integer y = 736
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
string powertiptext = "Borrar fila"
end type

event clicked;if dw_cpo.RowCount() > 0 then
	dw_cpo.DeleteRow(dw_cpo.GetRow())
	cambio = TRUE
end if

end event

type pb_2 from picturebutton within w_def_turnos
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 1993
integer y = 232
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
	dw_cab.DeleteRow(dw_cab.GetRow())
	cambio = TRUE
end if

end event

type pb_1 from picturebutton within w_def_turnos
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 1993
integer y = 92
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
fila = dw_cab.InsertRow(0)
dw_cab.ScrolltoRow(fila)
cambio = TRUE

end event

type dw_cab from datawindow within w_def_turnos
integer x = 37
integer y = 96
integer width = 1897
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_turnos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cpo.Reset()
if currentrow = 0 or RowCount() = 0 then Return
dw_cpo.Retrieve(getItemString(GetRow(),'codigo'))

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

type dw_cpo from datawindow within w_def_turnos
integer x = 41
integer y = 588
integer width = 2149
integer height = 592
integer taborder = 10
string title = "none"
string dataobject = "dw_turnoshordef"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if acceptText() = - 1 then Return -1
cambio = TRUE

end event

