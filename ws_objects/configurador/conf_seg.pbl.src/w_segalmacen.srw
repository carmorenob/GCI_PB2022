$PBExportHeader$w_segalmacen.srw
forward
global type w_segalmacen from window
end type
type st_3 from statictext within w_segalmacen
end type
type sle_2 from singlelineedit within w_segalmacen
end type
type st_2 from statictext within w_segalmacen
end type
type st_1 from statictext within w_segalmacen
end type
type sle_1 from singlelineedit within w_segalmacen
end type
type dw_alm from datawindow within w_segalmacen
end type
type st_6 from statictext within w_segalmacen
end type
type dw_lug from datawindow within w_segalmacen
end type
type pb_salir from picturebutton within w_segalmacen
end type
type pb_guardar from picturebutton within w_segalmacen
end type
type dw_noestan from datawindow within w_segalmacen
end type
type pb_7 from picturebutton within w_segalmacen
end type
type pb_6 from picturebutton within w_segalmacen
end type
type dw_estan from datawindow within w_segalmacen
end type
type gb_2 from groupbox within w_segalmacen
end type
end forward

global type w_segalmacen from window
integer width = 4375
integer height = 2392
boolean titlebar = true
string title = "Grupos autorizados por Almacén"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_segal.ico"
st_3 st_3
sle_2 sle_2
st_2 st_2
st_1 st_1
sle_1 sle_1
dw_alm dw_alm
st_6 st_6
dw_lug dw_lug
pb_salir pb_salir
pb_guardar pb_guardar
dw_noestan dw_noestan
pb_7 pb_7
pb_6 pb_6
dw_estan dw_estan
gb_2 gb_2
end type
global w_segalmacen w_segalmacen

type variables
DataWindowChild dwc_alm
end variables

on w_segalmacen.create
this.st_3=create st_3
this.sle_2=create sle_2
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.dw_alm=create dw_alm
this.st_6=create st_6
this.dw_lug=create dw_lug
this.pb_salir=create pb_salir
this.pb_guardar=create pb_guardar
this.dw_noestan=create dw_noestan
this.pb_7=create pb_7
this.pb_6=create pb_6
this.dw_estan=create dw_estan
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.sle_2,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.dw_alm,&
this.st_6,&
this.dw_lug,&
this.pb_salir,&
this.pb_guardar,&
this.dw_noestan,&
this.pb_7,&
this.pb_6,&
this.dw_estan,&
this.gb_2}
end on

on w_segalmacen.destroy
destroy(this.st_3)
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.dw_alm)
destroy(this.st_6)
destroy(this.dw_lug)
destroy(this.pb_salir)
destroy(this.pb_guardar)
destroy(this.dw_noestan)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.dw_estan)
destroy(this.gb_2)
end on

event closequery;if dw_estan.ModifiedCount() > 0 or dw_estan.DeletedCount() > 0 then
	int ret
	ret = MessageBox('Aviso','Ha realizado cambios. Desea guardarlos?',QUESTION!,YESNOCANCEL!)
	if ret = 1 then 
		Return pb_guardar.Event Clicked()
	elseif ret = 2 then
		Return 0
	else
		Return -1
	end if
end if

end event

type st_3 from statictext within w_segalmacen
integer x = 41
integer y = 32
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type sle_2 from singlelineedit within w_segalmacen
event keypressed pbm_keyup
integer x = 274
integer y = 276
integer width = 1499
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
textcase textcase = upper!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
dw_estan.SetFilter("upper(nombre) like '" +upper( texto )+ "'")
dw_estan.Filter()

end event

type st_2 from statictext within w_segalmacen
integer x = 91
integer y = 276
integer width = 174
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
boolean focusrectangle = false
end type

type st_1 from statictext within w_segalmacen
integer x = 2185
integer y = 276
integer width = 174
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_segalmacen
event keypressed pbm_keyup
integer x = 2368
integer y = 276
integer width = 1499
integer height = 72
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
textcase textcase = upper!
end type

event keypressed;string texto
texto = upper(text)
if right(texto,1) <> '%' then
	texto = texto + '%'
end if
dw_noestan.SetFilter("upper(nombre) like '" +upper( texto )+ "'")
dw_noestan.Filter()

end event

type dw_alm from datawindow within w_segalmacen
event retornar ( )
integer x = 1426
integer y = 92
integer width = 1157
integer height = 72
integer taborder = 10
string title = "none"
string dataobject = "dw_alm_ext"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retornar();//this.SetItem(1,'codalmacen',codalm)

end event

event itemchanged;AcceptText()
dw_estan.Reset()
dw_noestan.Reset()
dw_estan.Retrieve(GetItemString(1,'codalmacen'))
dw_noestan.Retrieve(GetItemString(1,'codalmacen'))
end event

type st_6 from statictext within w_segalmacen
integer x = 1431
integer y = 36
integer width = 247
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Almacén"
boolean focusrectangle = false
end type

type dw_lug from datawindow within w_segalmacen
integer x = 32
integer y = 88
integer width = 1125
integer height = 68
integer taborder = 10
string title = "none"
string dataobject = "dw_lugarseg"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)

dw_alm.GetChild('codalmacen', dwc_alm)
dwc_alm.SetTransObject(SQLCA)
if dwc_alm.Retrieve() > 0 then 
	dw_alm.InsertRow(1)
	dwc_alm.setfilter("codlugar='"+clugar+"'")
	dwc_alm.filter()
end if

end event

event itemchanged;string ls_clugar
ls_clugar=data
dwc_alm.retrieve()
dwc_alm.setfilter("codlugar='"+ls_clugar+"'")
dwc_alm.filter()



end event

type pb_salir from picturebutton within w_segalmacen
integer x = 1902
integer y = 2068
integer width = 146
integer height = 128
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;Close(parent)

end event

type pb_guardar from picturebutton within w_segalmacen
integer x = 2107
integer y = 2068
integer width = 151
integer height = 132
integer taborder = 170
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
alignment htextalign = left!
end type

event clicked;if dw_estan.Update() = -1 then
	Rollback;
	Return -1
end if
commit;
Return 0

end event

type dw_noestan from datawindow within w_segalmacen
integer x = 2181
integer y = 368
integer width = 1792
integer height = 1544
integer taborder = 140
string title = "none"
string dataobject = "dw_us_grp_alm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type pb_7 from picturebutton within w_segalmacen
integer x = 1947
integer y = 368
integer width = 146
integer height = 128
integer taborder = 110
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Ultimo.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Retirar a todos del Grupo"
end type

event clicked;if dw_noestan.rowcount()=0 then return
long fila
for fila=dw_estan.rowcount() to 1 step -1
	if dw_estan.getitemstring(fila,'esco')='1' then
		dw_noestan.insertrow(1)
		dw_noestan.setitem(1,'codgrupo',dw_estan.getitemstring(fila,'codgrupo'))
		dw_noestan.setitem(1,'usuario',dw_estan.getitemstring(fila,'usuario'))
		dw_noestan.setitem(1,'descripcion',dw_estan.getitemstring(fila,'descripcion'))
		dw_noestan.setitem(1,'nombre',dw_estan.getitemstring(fila,'nombre'))
		dw_estan.deleterow(fila)
	end if
next
sle_2.text=''
dw_estan.SetFilter("")
dw_estan.Filter()
dw_estan.sort()
dw_noestan.sort()
end event

type pb_6 from picturebutton within w_segalmacen
integer x = 1947
integer y = 508
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras_1.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Agregar al Grupo"
end type

event clicked;if dw_noestan.rowcount()=0 then return
long fila
for fila=dw_noestan.rowcount() to 1 step -1
	if dw_noestan.getitemstring(fila,'esco')='1' then
		dw_estan.insertrow(1)
		dw_estan.setitem(1,'codalmacen',dw_alm.GetItemString(1,'codalmacen'))
		dw_estan.setitem(1,'codgrupo',dw_noestan.getitemstring(fila,'codgrupo'))
		dw_estan.setitem(1,'usuario',dw_noestan.getitemstring(fila,'usuario'))
		dw_estan.setitem(1,'descripcion',dw_noestan.getitemstring(fila,'descripcion'))
		dw_estan.setitem(1,'nombre',dw_noestan.getitemstring(fila,'nombre'))
		dw_noestan.deleterow(fila)
	end if
next
sle_1.text=''
dw_noestan.SetFilter("")
dw_noestan.Filter()
dw_estan.sort()
dw_noestan.sort()
end event

type dw_estan from datawindow within w_segalmacen
integer x = 78
integer y = 368
integer width = 1792
integer height = 1544
integer taborder = 90
string title = "none"
string dataobject = "dw_us_grp_alm_Si"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

event doubleclicked;//if this.getrow()>0 then pb_4.triggerevent(clicked!)
end event

event rowfocuschanged;if currentrow = 0 or RowCount() = 0 then Return
//dw_1.Retrieve(GetItemString(GetRow(),'codgrupo'))
end event

type gb_2 from groupbox within w_segalmacen
integer x = 37
integer y = 208
integer width = 3973
integer height = 1808
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos"
borderstyle borderstyle = styleraised!
end type

