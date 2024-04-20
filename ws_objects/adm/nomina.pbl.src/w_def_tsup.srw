$PBExportHeader$w_def_tsup.srw
forward
global type w_def_tsup from window
end type
type st_2 from statictext within w_def_tsup
end type
type st_1 from statictext within w_def_tsup
end type
type pb_5 from picturebutton within w_def_tsup
end type
type pb_4 from picturebutton within w_def_tsup
end type
type pb_3 from picturebutton within w_def_tsup
end type
type pb_2 from picturebutton within w_def_tsup
end type
type pb_1 from picturebutton within w_def_tsup
end type
type dw_cab from datawindow within w_def_tsup
end type
type dw_cpo from datawindow within w_def_tsup
end type
end forward

global type w_def_tsup from window
integer width = 3479
integer height = 1660
boolean titlebar = true
string title = "Nómina - Definición Esquemas Trabajo Suplementario"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_suplem.ico"
boolean center = true
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
global w_def_tsup w_def_tsup

type variables
boolean cambio
datawindowchild dwc_cp
string i_cemp

end variables

on w_def_tsup.create
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

on w_def_tsup.destroy
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

event open;
select cod_empresa into :i_cemp from lugar where codlugar=:clugar;
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

event resize;//
end event

type st_2 from statictext within w_def_tsup
integer x = 37
integer y = 512
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

type st_1 from statictext within w_def_tsup
integer x = 37
integer y = 20
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

type pb_5 from picturebutton within w_def_tsup
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2674
integer y = 340
integer width = 142
integer height = 124
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
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
if long(dw_cpo.Describe("Evaluate('sum(compensa)',0)")) > 1 then
	MessageBox('Atención','Debe definir un solo registro de compensacion')
	Return -1
end if
i = dw_cpo.Find("compensa=1",1,dw_cpo.RowCount())
if i > 0 then
	if dw_cpo.GetItemNumber(i,'recargo') = 1 then
		MessageBox('Atención','El registro definido como Compensación, no puede ser Recargo a la vez')
		Return -1
	end if
end if
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

type pb_4 from picturebutton within w_def_tsup
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 3223
integer y = 576
integer width = 142
integer height = 124
integer taborder = 30
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
fila = dw_cpo.InsertRow(0)
dw_cpo.SetItem(fila,'codtsup',dw_cab.GetItemString(dw_cab.GetRow(),'codtsup'))
cambio = TRUE

end event

type pb_3 from picturebutton within w_def_tsup
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 3223
integer y = 704
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar fila"
end type

event clicked;if dw_cpo.RowCount() > 0 then
	dw_cpo.DeleteRow(dw_cpo.GetRow())
	cambio = TRUE
end if

end event

type pb_2 from picturebutton within w_def_tsup
event mousemove pbm_mousemove
string tag = "&Eliminar Concepto"
integer x = 2674
integer y = 212
integer width = 142
integer height = 124
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "                $n"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Fila"
end type

event clicked;if dw_cab.RowCount() > 0 then
	dw_cab.DeleteRow(dw_cab.GetRow())
	cambio = TRUE
end if

end event

type pb_1 from picturebutton within w_def_tsup
event mousemove pbm_mousemove
string tag = "&Nuevo Concepto"
integer x = 2674
integer y = 84
integer width = 142
integer height = 124
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

end event

type dw_cab from datawindow within w_def_tsup
integer x = 32
integer y = 80
integer width = 2597
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_esquema_tsup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;dw_cpo.Reset()
if currentrow = 0 or RowCount() = 0 then Return
dw_cpo.Retrieve(getItemString(GetRow(),'codtsup'))

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

type dw_cpo from datawindow within w_def_tsup
integer x = 37
integer y = 572
integer width = 3163
integer height = 936
integer taborder = 10
string title = "none"
string dataobject = "dw_tsup_cfg"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;setTransObject(SQLCA)

end event

event itemchanged;if acceptText() = - 1 then Return -1
cambio = TRUE

end event

