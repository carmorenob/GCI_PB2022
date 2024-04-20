$PBExportHeader$w_objeciones.srw
forward
global type w_objeciones from window
end type
type pb_ok from picturebutton within w_objeciones
end type
type tab_1 from tab within w_objeciones
end type
type tabpage_2 from userobject within tab_1
end type
type st_3 from statictext within tabpage_2
end type
type dw_6 from datawindow within tabpage_2
end type
type pb_3 from picturebutton within tabpage_2
end type
type pb_2 from picturebutton within tabpage_2
end type
type pb_1 from picturebutton within tabpage_2
end type
type pb_insa from picturebutton within tabpage_2
end type
type pb_inse from picturebutton within tabpage_2
end type
type pb_insg from picturebutton within tabpage_2
end type
type dw_3 from datawindow within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type dw_1 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
st_3 st_3
dw_6 dw_6
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
pb_insa pb_insa
pb_inse pb_inse
pb_insg pb_insg
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type
type tabpage_1 from userobject within tab_1
end type
type st_2 from statictext within tabpage_1
end type
type pb_5 from picturebutton within tabpage_1
end type
type pb_4 from picturebutton within tabpage_1
end type
type pb_ret_all from picturebutton within tabpage_1
end type
type pb_ret from picturebutton within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type dw_5 from datawindow within tabpage_1
end type
type dw_4 from datawindow within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type gb_2 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
st_2 st_2
pb_5 pb_5
pb_4 pb_4
pb_ret_all pb_ret_all
pb_ret pb_ret
st_1 st_1
dw_5 dw_5
dw_4 dw_4
gb_1 gb_1
gb_2 gb_2
end type
type tab_1 from tab within w_objeciones
tabpage_2 tabpage_2
tabpage_1 tabpage_1
end type
end forward

global type w_objeciones from window
integer width = 5893
integer height = 2380
boolean titlebar = true
string title = "Cartera - Normativo Objeciones"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_objecconn.ico"
pb_ok pb_ok
tab_1 tab_1
end type
global w_objeciones w_objeciones

type variables
boolean lb_cambio,lb_nuevo
string ls_operacion,ls_ver
end variables
forward prototypes
public function integer grabar ()
public function integer f_pregunta ()
end prototypes

public function integer grabar ();if tab_1.tabpage_2.dw_1.Update(TRUE,FALSE) = -1 then 
	ls_operacion = ''
	Return -1
end if
if tab_1.tabpage_2.dw_2.Update(TRUE,FALSE) = -1 then 
	ls_operacion = ''
	Return -1
end if
if tab_1.tabpage_2.dw_3.Update(TRUE,FALSE) = -1 then 
	ls_operacion = ''
	Return -1
end if
if tab_1.tabpage_1.dw_4.Update(TRUE,FALSE) = -1 then 
	ls_operacion = ''
	Return -1
end if
tab_1.tabpage_2.dw_1.resetupdate()
tab_1.tabpage_2.dw_2.resetupdate()
tab_1.tabpage_2.dw_3.resetupdate()
return 1
end function

public function integer f_pregunta ();if tab_1.tabpage_2.dw_3.accepttext()=-1 then return 3
if  tab_1.tabpage_1.dw_4.accepttext()=-1 then return 3
if (not lb_cambio )and (not lb_nuevo) then return 2
return messagebox("Atención, realizó cambios",'Insertó o modificó una objeción, desea guardar los cambios?',question!,yesnocancel!,3)
end function

on w_objeciones.create
this.pb_ok=create pb_ok
this.tab_1=create tab_1
this.Control[]={this.pb_ok,&
this.tab_1}
end on

on w_objeciones.destroy
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

type pb_ok from picturebutton within w_objeciones
integer x = 5687
integer y = 4
integer width = 146
integer height = 128
integer taborder = 20
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

type tab_1 from tab within w_objeciones
integer x = 41
integer y = 24
integer width = 5847
integer height = 2124
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
tabpage_2 tabpage_2
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_2=create tabpage_2
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_2,&
this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_2)
destroy(this.tabpage_1)
end on

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5810
integer height = 1996
long backcolor = 67108864
string text = "Objecciones"
long tabtextcolor = 33554432
string picturename = "facturas.ico"
long picturemaskcolor = 536870912
st_3 st_3
dw_6 dw_6
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
pb_insa pb_insa
pb_inse pb_inse
pb_insg pb_insg
dw_3 dw_3
dw_2 dw_2
dw_1 dw_1
end type

on tabpage_2.create
this.st_3=create st_3
this.dw_6=create dw_6
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.pb_insa=create pb_insa
this.pb_inse=create pb_inse
this.pb_insg=create pb_insg
this.dw_3=create dw_3
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.st_3,&
this.dw_6,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.pb_insa,&
this.pb_inse,&
this.pb_insg,&
this.dw_3,&
this.dw_2,&
this.dw_1}
end on

on tabpage_2.destroy
destroy(this.st_3)
destroy(this.dw_6)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.pb_insa)
destroy(this.pb_inse)
destroy(this.pb_insg)
destroy(this.dw_3)
destroy(this.dw_2)
destroy(this.dw_1)
end on

type st_3 from statictext within tabpage_2
integer x = 41
integer y = 24
integer width = 229
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Versión"
boolean focusrectangle = false
end type

type dw_6 from datawindow within tabpage_2
integer x = 270
integer y = 16
integer width = 1609
integer height = 76
integer taborder = 40
string title = "none"
string dataobject = "dw_drop_glosa_version"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(SQLCA)
insertrow(1)
end event

event itemchanged;this.accepttext()
ls_ver=this.getitemstring(1,1)
tab_1.tabpage_2.dw_1.retrieve(ls_ver)
end event

type pb_3 from picturebutton within tabpage_2
integer x = 5637
integer y = 1504
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;if dw_3.rowcount()>0 then
	dw_3.deleterow(0)
end if
end event

type pb_2 from picturebutton within tabpage_2
integer x = 5637
integer y = 856
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
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

type pb_1 from picturebutton within tabpage_2
integer x = 5637
integer y = 256
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
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

type pb_insa from picturebutton within tabpage_2
integer x = 5637
integer y = 1352
integer width = 146
integer height = 128
integer taborder = 90
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if ls_ver="" or isnull(ls_ver) then return
dw_3.scrolltorow(dw_3.insertrow(0))
dw_3.setitem(dw_3.getrow(),"cod_version",ls_ver)
dw_3.setitem(dw_3.getrow(),'con_gral',dw_1.getitemstring(dw_1.getrow(),'con_gral'))
dw_3.setitem(dw_3.getrow(),'con_espe',dw_2.getitemstring(dw_2.getrow(),'con_espe'))
lb_cambio=true

end event

type pb_inse from picturebutton within tabpage_2
integer x = 5637
integer y = 708
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if ls_ver="" or isnull(ls_ver) then return
dw_2.scrolltorow(dw_2.insertrow(0))
dw_2.setitem(dw_2.getrow(),'con_gral',dw_1.getitemstring(dw_1.getrow(),'con_gral'))
dw_2.setitem(dw_2.getrow(),"cod_version",ls_ver)
lb_cambio=true

end event

type pb_insg from picturebutton within tabpage_2
integer x = 5637
integer y = 108
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
alignment htextalign = left!
end type

event clicked;if ls_ver="" or isnull(ls_ver) then return
dw_1.scrolltorow(dw_1.insertrow(0))
dw_1.setitem(dw_1.getrow(),"cod_version",ls_ver)
lb_cambio=true


end event

type dw_3 from datawindow within tabpage_2
integer x = 55
integer y = 1344
integer width = 5559
integer height = 616
integer taborder = 80
string title = "none"
string dataobject = "dw_objeciones_apli"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tabpage_1.dw_4.reset()
tab_1.tabpage_1.dw_5.reset()
if getrow()<1 then return
tab_1.tabpage_1.enabled=true
tab_1.tabpage_1.st_2.text=getitemstring(getrow(),'descripcion')
tab_1.tabpage_1.dw_4.retrieve(getitemstring(getrow(),'cod_objecion'))
tab_1.tabpage_1.dw_5.retrieve(getitemstring(getrow(),'cod_objecion'))
end event

type dw_2 from datawindow within tabpage_2
integer x = 46
integer y = 692
integer width = 5573
integer height = 616
integer taborder = 30
string title = "none"
string dataobject = "dw_objeciones_esp"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if tab_1.tabpage_2.dw_3.retrieve(ls_ver,tab_1.tabpage_2.dw_1.getitemstring(tab_1.tabpage_2.dw_1.getrow(),'con_gral'),tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),'con_espe'))>0 then
	tab_1.tabpage_1.enabled=true
end if
end event

event retrieveend;if tab_1.tabpage_2.dw_3.retrieve(ls_ver,tab_1.tabpage_2.dw_1.getitemstring(tab_1.tabpage_2.dw_1.getrow(),'con_gral'),tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),'con_espe'))>0 then
	tab_1.tabpage_1.enabled=true
end if
end event

type dw_1 from datawindow within tabpage_2
integer x = 41
integer y = 112
integer width = 5559
integer height = 528
integer taborder = 20
string title = "none"
string dataobject = "dw_objeciones_gral"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if tab_1.tabpage_2.dw_2.retrieve(ls_ver,tab_1.tabpage_2.dw_1.getitemstring(tab_1.tabpage_2.dw_1.getrow(),'con_gral'))>0 then
	tab_1.tabpage_1.enabled=true
end if
end event

event retrieveend;if tab_1.tabpage_2.dw_3.retrieve(ls_ver,tab_1.tabpage_2.dw_1.getitemstring(tab_1.tabpage_2.dw_1.getrow(),'con_gral'),tab_1.tabpage_2.dw_2.getitemstring(tab_1.tabpage_2.dw_2.getrow(),'con_espe'))>0 then
	tab_1.tabpage_1.enabled=true
end if
end event

event itemchanged;//dw_1.setitem(row,'con_gral'
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 5810
integer height = 1996
long backcolor = 67108864
string text = "Permisos"
long tabtextcolor = 33554432
string picturename = "rep.ico"
long picturemaskcolor = 536870912
st_2 st_2
pb_5 pb_5
pb_4 pb_4
pb_ret_all pb_ret_all
pb_ret pb_ret
st_1 st_1
dw_5 dw_5
dw_4 dw_4
gb_1 gb_1
gb_2 gb_2
end type

on tabpage_1.create
this.st_2=create st_2
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_ret_all=create pb_ret_all
this.pb_ret=create pb_ret
this.st_1=create st_1
this.dw_5=create dw_5
this.dw_4=create dw_4
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.st_2,&
this.pb_5,&
this.pb_4,&
this.pb_ret_all,&
this.pb_ret,&
this.st_1,&
this.dw_5,&
this.dw_4,&
this.gb_1,&
this.gb_2}
end on

on tabpage_1.destroy
destroy(this.st_2)
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_ret_all)
destroy(this.pb_ret)
destroy(this.st_1)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type st_2 from statictext within tabpage_1
integer x = 73
integer y = 96
integer width = 2944
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

type pb_5 from picturebutton within tabpage_1
integer x = 1445
integer y = 560
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
string picturename = "atras_1.gif"
alignment htextalign = left!
string powertiptext = "Agregar Todos a la Objección"
end type

event clicked;do while dw_5.rowcount()>0
	pb_4.event clicked()
loop
end event

type pb_4 from picturebutton within tabpage_1
integer x = 1449
integer y = 716
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
string picturename = "atras.gif"
alignment htextalign = left!
string powertiptext = "Agregar a la Obección"
end type

event clicked;if tab_1.tabpage_2.dw_3.rowcount()=0 or dw_5.rowcount()=0 then return
long donde
donde=dw_4.insertrow(0)
dw_4.setitem(donde,'cod_objecion',tab_1.tabpage_2.dw_3.getitemstring(tab_1.tabpage_2.dw_3.getrow(),'cod_objecion'))
dw_4.setitem(donde,'responsable',dw_5.getitemstring(dw_5.getrow(),'usuario'))
dw_4.setitem(donde,'nombre',dw_5.getitemstring(dw_5.getrow(),'nombre'))
dw_5.deleterow(0)
end event

type pb_ret_all from picturebutton within tabpage_1
integer x = 1445
integer y = 416
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
string picturename = "ultimo.gif"
alignment htextalign = left!
string powertiptext = "Retirar la Obección"
end type

event clicked;do while dw_4.rowcount()>0
	pb_ret.event clicked()
loop
end event

type pb_ret from picturebutton within tabpage_1
integer x = 1440
integer y = 276
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
string powertiptext = "Retirar Todos de la Obección"
end type

event clicked;if tab_1.tabpage_2.dw_3.rowcount()=0 or dw_4.rowcount()=0 then return
long donde
donde=dw_5.insertrow(0)
dw_5.setitem(donde,'usuario',dw_4.getitemstring(dw_4.getrow(),'responsable'))
dw_5.setitem(donde,'nombre',dw_4.getitemstring(dw_4.getrow(),'nombre'))
dw_4.deleterow(0)

end event

type st_1 from statictext within tabpage_1
integer x = 59
integer y = 32
integer width = 393
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Codigo Objección"
boolean focusrectangle = false
end type

type dw_5 from datawindow within tabpage_1
integer x = 1742
integer y = 276
integer width = 1243
integer height = 1360
integer taborder = 50
string title = "none"
string dataobject = "dw_usurios_sin_obje"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

type dw_4 from datawindow within tabpage_1
integer x = 73
integer y = 276
integer width = 1239
integer height = 1352
integer taborder = 40
string title = "none"
string dataobject = "dw_usu_responde"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within tabpage_1
integer x = 41
integer y = 204
integer width = 1344
integer height = 1484
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios que pueden Responder la Objeción:"
end type

type gb_2 from groupbox within tabpage_1
integer x = 1678
integer y = 204
integer width = 1367
integer height = 1460
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios"
end type

