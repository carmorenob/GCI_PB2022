$PBExportHeader$w_respuestas.srw
forward
global type w_respuestas from window
end type
type pb_ok from picturebutton within w_respuestas
end type
type tab_1 from tab within w_respuestas
end type
type tbg_1 from userobject within tab_1
end type
type pb_3 from picturebutton within tbg_1
end type
type pb_insa from picturebutton within tbg_1
end type
type pb_1 from picturebutton within tbg_1
end type
type pb_ins from picturebutton within tbg_1
end type
type pb_2 from picturebutton within tbg_1
end type
type pb_insg from picturebutton within tbg_1
end type
type dw_3 from datawindow within tbg_1
end type
type dw_2 from datawindow within tbg_1
end type
type dw_1 from datawindow within tbg_1
end type
type tbg_1 from userobject within tab_1
pb_3 pb_3
pb_insa pb_insa
pb_1 pb_1
pb_ins pb_ins
pb_2 pb_2
pb_insg pb_insg
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type
type tabpage_1 from userobject within tab_1
end type
type dw_5 from datawindow within tabpage_1
end type
type pb_ing from picturebutton within tabpage_1
end type
type pb_ing_all from picturebutton within tabpage_1
end type
type pb_ret_all from picturebutton within tabpage_1
end type
type pb_ret from picturebutton within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type st_2 from statictext within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_5 dw_5
pb_ing pb_ing
pb_ing_all pb_ing_all
pb_ret_all pb_ret_all
pb_ret pb_ret
dw_4 dw_4
st_2 st_2
st_1 st_1
gb_2 gb_2
gb_1 gb_1
end type
type tab_1 from tab within w_respuestas
tbg_1 tbg_1
tabpage_1 tabpage_1
end type
end forward

global type w_respuestas from window
integer width = 4608
integer height = 2212
boolean titlebar = true
string title = "Cartera - Respuestas a Objeciones Normativo"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_rtan.ico"
pb_ok pb_ok
tab_1 tab_1
end type
global w_respuestas w_respuestas

type variables
boolean i_cambio,i_nuevo
string i_operacion
end variables

forward prototypes
public function integer grabar ()
public function integer f_pregunta ()
end prototypes

public function integer grabar ();if tab_1.tabpage_1.dw_4.Update(true,false) = -1 then 
	i_operacion = ''
	Return -1
end if
tab_1.tbg_1.dw_1.resetupdate()
tab_1.tabpage_1.dw_4.resetupdate()
i_cambio=false
i_nuevo=false
return 1
end function

public function integer f_pregunta ();if tab_1.tabpage_1.dw_4.accepttext()=-1 then return 3
if  tab_1.tabpage_1.dw_5.accepttext()=-1 then return 3
if (not i_cambio )and (not i_nuevo) then return 2
return messagebox("Atención, realizó cambios",'Insertó o modificó una objeción, desea guardar los cambios?',question!,yesnocancel!,3)
end function

on w_respuestas.create
this.pb_ok=create pb_ok
this.tab_1=create tab_1
this.Control[]={this.pb_ok,&
this.tab_1}
end on

on w_respuestas.destroy
destroy(this.pb_ok)
destroy(this.tab_1)
end on

event closequery;choose case f_pregunta()
	case 1
		if grabar()=-1 then
			return 1
		else
			return 0
		end if
	case 2
		return 0
	case 3
		return 1
end choose
end event

event open;tab_1.tbg_1.dw_1.retrieve()
end event

type pb_ok from picturebutton within w_respuestas
integer x = 4320
integer y = 8
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if grabar()=-1 then return
commit;

end event

type tab_1 from tab within w_respuestas
event create ( )
event destroy ( )
integer x = 32
integer y = 40
integer width = 4517
integer height = 2080
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
tbg_1 tbg_1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tbg_1=create tbg_1
this.tabpage_1=create tabpage_1
this.Control[]={this.tbg_1,&
this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tbg_1)
destroy(this.tabpage_1)
end on

type tbg_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4480
integer height = 1952
long backcolor = 67108864
string text = "Respuestas"
long tabtextcolor = 33554432
string picturename = "facturas.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_insa pb_insa
pb_1 pb_1
pb_ins pb_ins
pb_2 pb_2
pb_insg pb_insg
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type

on tbg_1.create
this.pb_3=create pb_3
this.pb_insa=create pb_insa
this.pb_1=create pb_1
this.pb_ins=create pb_ins
this.pb_2=create pb_2
this.pb_insg=create pb_insg
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.pb_3,&
this.pb_insa,&
this.pb_1,&
this.pb_ins,&
this.pb_2,&
this.pb_insg,&
this.dw_3,&
this.dw_2,&
this.dw_1}
end on

on tbg_1.destroy
destroy(this.pb_3)
destroy(this.pb_insa)
destroy(this.pb_1)
destroy(this.pb_ins)
destroy(this.pb_2)
destroy(this.pb_insg)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type pb_3 from picturebutton within tbg_1
integer x = 4270
integer y = 1432
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_3.rowcount()>0 then
	dw_3.deleterow(0)
end if
end event

type pb_insa from picturebutton within tbg_1
integer x = 4270
integer y = 1300
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;dw_3.scrolltorow(dw_3.insertrow(0))
dw_3.setitem(dw_3.getrow(),'con_gral',dw_1.getitemstring(dw_1.getrow(),'con_gral'))
dw_3.setitem(dw_3.getrow(),'con_espe',dw_2.getitemstring(dw_2.getrow(),'con_espe'))
end event

type pb_1 from picturebutton within tbg_1
integer x = 4270
integer y = 796
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_3.rowcount()>0 then
	messagebox("Atención","Esta cuenta no se puede borrar ya que posee Aplicación")
	return
else
	if dw_2.rowcount()>0 then
		dw_2.deleterow(0)
	end if
end if
end event

type pb_ins from picturebutton within tbg_1
integer x = 4270
integer y = 656
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;dw_2.scrolltorow(dw_2.insertrow(0))
dw_2.setitem(dw_2.getrow(),'con_gral',dw_1.getitemstring(dw_1.getrow(),'con_gral'))
end event

type pb_2 from picturebutton within tbg_1
integer x = 4270
integer y = 172
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_2.rowcount()>0 then
	messagebox("Atención","Esta cuenta no se puede borrar ya que posee Especificación")
	return
else
	if dw_1.rowcount()>0 then
		dw_1.deleterow(0)
	end if
end if
end event

type pb_insg from picturebutton within tbg_1
integer x = 4270
integer y = 20
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
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;dw_1.scrolltorow(dw_1.insertrow(0))
end event

type dw_3 from datawindow within tbg_1
integer x = 55
integer y = 1296
integer width = 4197
integer height = 616
integer taborder = 70
string title = "none"
string dataobject = "dw_respglosa_apli"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tabpage_1.dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
tab_1.tabpage_1.enabled=true
if getrow()<1 then return
tab_1.tabpage_1.st_2.text=getitemstring(getrow(),'descripcion')
tab_1.tabpage_1.dw_4.retrieve(getitemstring(getrow(),'cod_respuesta'))
tab_1.tabpage_1.dw_5.retrieve(getitemstring(getrow(),'cod_respuesta'))
end event

type dw_2 from datawindow within tbg_1
integer x = 41
integer y = 652
integer width = 4183
integer height = 616
integer taborder = 60
string title = "none"
string dataobject = "dw_respglosa_esp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if tab_1.tbg_1.dw_3.retrieve(tab_1.tbg_1.dw_1.getitemstring(tab_1.tbg_1.dw_1.getrow(),'con_gral'),tab_1.tbg_1.dw_2.getitemstring(tab_1.tbg_1.dw_2.getrow(),'con_espe'))>0 then
	tab_1.tabpage_1.enabled=true
else
//	tab_1.tabpage_1.enabled=false
end if
end event

type dw_1 from datawindow within tbg_1
integer x = 37
integer y = 24
integer width = 4178
integer height = 616
integer taborder = 20
string title = "none"
string dataobject = "dw_respglosa_gral"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if tab_1.tbg_1.dw_2.retrieve(tab_1.tbg_1.dw_1.getitemstring(tab_1.tbg_1.dw_1.getrow(),'con_gral'))>0 then
	tab_1.tabpage_1.enabled=true
end if
end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4480
integer height = 1952
long backcolor = 67108864
string text = "Permisos"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
dw_5 dw_5
pb_ing pb_ing
pb_ing_all pb_ing_all
pb_ret_all pb_ret_all
pb_ret pb_ret
dw_4 dw_4
st_2 st_2
st_1 st_1
gb_2 gb_2
gb_1 gb_1
end type

on tabpage_1.create
this.dw_5=create dw_5
this.pb_ing=create pb_ing
this.pb_ing_all=create pb_ing_all
this.pb_ret_all=create pb_ret_all
this.pb_ret=create pb_ret
this.dw_4=create dw_4
this.st_2=create st_2
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.dw_5,&
this.pb_ing,&
this.pb_ing_all,&
this.pb_ret_all,&
this.pb_ret,&
this.dw_4,&
this.st_2,&
this.st_1,&
this.gb_2,&
this.gb_1}
end on

on tabpage_1.destroy
destroy(this.dw_5)
destroy(this.pb_ing)
destroy(this.pb_ing_all)
destroy(this.pb_ret_all)
destroy(this.pb_ret)
destroy(this.dw_4)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type dw_5 from datawindow within tabpage_1
integer x = 2432
integer y = 276
integer width = 1911
integer height = 1360
integer taborder = 60
string title = "none"
string dataobject = "dw_resto_objec"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

type pb_ing from picturebutton within tabpage_1
integer x = 2135
integer y = 720
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
string picturename = "atras.gif"
alignment htextalign = left!
string powertiptext = "Agregar Todos a la Objección"
end type

event clicked;if  dw_5.rowcount()=0 then return
long donde
donde=dw_4.insertrow(0)
dw_4.setitem(donde,'cod_respuesta',tab_1.tbg_1.dw_3.getitemstring(tab_1.tbg_1.dw_3.getrow(),'cod_respuesta'))
dw_4.setitem(donde,'cod_objecion',dw_5.getitemstring(dw_5.getrow(),'cod_objecion'))
dw_4.setitem(donde,'descripcion',dw_5.getitemstring(dw_5.getrow(),'descripcion'))
dw_5.deleterow(0)
end event

type pb_ing_all from picturebutton within tabpage_1
integer x = 2135
integer y = 572
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.gif"
alignment htextalign = left!
string powertiptext = "Agregar a la Obección"
end type

event clicked;do while dw_5.rowcount()>0
	pb_ing.event clicked()
loop

end event

type pb_ret_all from picturebutton within tabpage_1
integer x = 2135
integer y = 424
integer width = 146
integer height = 128
integer taborder = 70
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "ultimo.gif"
alignment htextalign = left!
string powertiptext = "Retirar Todos de la Obección"
end type

event clicked;do while dw_4.rowcount()>0
	pb_ret.event clicked()
loop
end event

type pb_ret from picturebutton within tabpage_1
integer x = 2135
integer y = 268
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
string picturename = "adelante_1.gif"
alignment htextalign = left!
string powertiptext = "Retirar la Obección"
end type

event clicked;if dw_4.rowcount()=0 then return
long donde
donde=dw_5.insertrow(0)
dw_5.setitem(donde,'cod_objecion',dw_4.getitemstring(dw_4.getrow(),'cod_objecion'))
dw_5.setitem(donde,'descripcion',dw_4.getitemstring(dw_4.getrow(),'descripcion'))
dw_4.deleterow(0)


end event

type dw_4 from datawindow within tabpage_1
integer x = 73
integer y = 276
integer width = 1911
integer height = 1352
integer taborder = 50
string title = "none"
string dataobject = "dw_objes_respu"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)


end event

type st_2 from statictext within tabpage_1
integer x = 73
integer y = 96
integer width = 4297
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within tabpage_1
integer x = 59
integer y = 32
integer width = 411
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigo Respuesta"
boolean focusrectangle = false
end type

type gb_2 from groupbox within tabpage_1
integer x = 2368
integer y = 204
integer width = 2016
integer height = 1460
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todas las Objecciones "
end type

type gb_1 from groupbox within tabpage_1
integer x = 41
integer y = 204
integer width = 2034
integer height = 1484
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Objecciones que usan Respuesta"
end type

