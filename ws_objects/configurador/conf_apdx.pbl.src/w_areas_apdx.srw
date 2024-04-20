$PBExportHeader$w_areas_apdx.srw
forward
global type w_areas_apdx from window
end type
type pb_save from picturebutton within w_areas_apdx
end type
type pb_salir from picturebutton within w_areas_apdx
end type
type tab_1 from tab within w_areas_apdx
end type
type tp_1 from userobject within tab_1
end type
type pb_del from picturebutton within tp_1
end type
type pb_new from picturebutton within tp_1
end type
type dw_area from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_del pb_del
pb_new pb_new
dw_area dw_area
end type
type tp_2 from userobject within tab_1
end type
type pb_5 from picturebutton within tp_2
end type
type pb_7 from picturebutton within tp_2
end type
type pb_6 from picturebutton within tp_2
end type
type pb_4 from picturebutton within tp_2
end type
type st_3 from statictext within tp_2
end type
type st_2 from statictext within tp_2
end type
type dw_2 from datawindow within tp_2
end type
type dw_no_estan from datawindow within tp_2
end type
type dw_1 from datawindow within tp_2
end type
type dw_estan from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
pb_5 pb_5
pb_7 pb_7
pb_6 pb_6
pb_4 pb_4
st_3 st_3
st_2 st_2
dw_2 dw_2
dw_no_estan dw_no_estan
dw_1 dw_1
dw_estan dw_estan
end type
type tabpage_1 from userobject within tab_1
end type
type dw_3 from datawindow within tabpage_1
end type
type st_1 from statictext within tabpage_1
end type
type pb_8 from picturebutton within tabpage_1
end type
type pb_3 from picturebutton within tabpage_1
end type
type pb_2 from picturebutton within tabpage_1
end type
type pb_1 from picturebutton within tabpage_1
end type
type dw_nluestan from datawindow within tabpage_1
end type
type dw_luestan from datawindow within tabpage_1
end type
type gb_1 from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_3 dw_3
st_1 st_1
pb_8 pb_8
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_nluestan dw_nluestan
dw_luestan dw_luestan
gb_1 gb_1
end type
type tab_1 from tab within w_areas_apdx
tp_1 tp_1
tp_2 tp_2
tabpage_1 tabpage_1
end type
end forward

global type w_areas_apdx from window
integer width = 4864
integer height = 2108
boolean titlebar = true
string title = "Areas de Apoyo Diagnóstico"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Project!"
pb_save pb_save
pb_salir pb_salir
tab_1 tab_1
end type
global w_areas_apdx w_areas_apdx

type variables
datawindowchild idw_docus
boolean i_cambio,i_cambio_seg
string i_area
end variables

forward prototypes
public function integer grabar ()
end prototypes

public function integer grabar ();if tab_1.tp_1.dw_area.update(true,false)=-1 then return -1
if tab_1.tp_2.dw_estan.update(true,false)=-1 then return -1
if tab_1.tabpage_1.dw_luestan.update(true,false)=-1 then return -1

tab_1.tp_2.enabled=true
commit;
tab_1.tp_1.pb_new.enabled=true
tab_1.tp_2.dw_estan.resetupdate()
tab_1.tp_1.dw_area.resetupdate()
tab_1.tabpage_1.dw_luestan.resetupdate()
tab_1.tabpage_1.dw_nluestan.resetupdate()

i_cambio=false
i_cambio_seg=false
return 1
end function

on w_areas_apdx.create
this.pb_save=create pb_save
this.pb_salir=create pb_salir
this.tab_1=create tab_1
this.Control[]={this.pb_save,&
this.pb_salir,&
this.tab_1}
end on

on w_areas_apdx.destroy
destroy(this.pb_save)
destroy(this.pb_salir)
destroy(this.tab_1)
end on

event closequery;if i_cambio or i_cambio_seg then
	choose case messagebox("Atención",'Realizó cambios al Area, desea guardarlos.?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then
				rollback;
				return 1
			end if
		case 2
			i_cambio_seg=false
			i_cambio=false
		case 3
			return 1
	end choose
end if
end event

event open;tab_1.tp_1.dw_area.reset()
tab_1.tp_1.dw_area.retrieve()
end event

event resize;tab_1.resize(newwidth -20, newheight -280)
tab_1.tp_1.dw_area.resize(tab_1.width -100 ,tab_1.height - 350 )

pb_save.y=tab_1.y+tab_1.height + 10
pb_salir.y=tab_1.y+tab_1.height + 10

tab_1.tp_1.pb_new.y=tab_1.tp_1.dw_area.y+tab_1.tp_1.dw_area.height + 10
tab_1.tp_1.pb_del.y=tab_1.tp_1.dw_area.y+tab_1.tp_1.dw_area.height + 10

end event

type pb_save from picturebutton within w_areas_apdx
integer x = 2226
integer y = 1872
integer width = 146
integer height = 128
integer taborder = 190
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &g"
boolean originalsize = true
string picturename = "guardar.gif"
string powertiptext = "Guardar [Alt+G]"
end type

event clicked;if grabar()=-1 then 
	rollback;
end if
	
end event

type pb_salir from picturebutton within w_areas_apdx
integer x = 2395
integer y = 1872
integer width = 146
integer height = 128
integer taborder = 180
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "puerta.gif"
string powertiptext = "Salir"
end type

event clicked;Close(parent)

end event

type tab_1 from tab within w_areas_apdx
integer x = 18
integer y = 28
integer width = 4800
integer height = 1724
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tabpage_1 tabpage_1
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tabpage_1=create tabpage_1
this.Control[]={this.tp_1,&
this.tp_2,&
this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tabpage_1)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4763
integer height = 1596
long backcolor = 67108864
string text = "Areas"
long tabtextcolor = 33554432
string picturename = "areas.ico"
long picturemaskcolor = 536870912
string powertiptext = "Areas de Apoyo Diagnóstico a Trabajar en el programa"
pb_del pb_del
pb_new pb_new
dw_area dw_area
end type

on tp_1.create
this.pb_del=create pb_del
this.pb_new=create pb_new
this.dw_area=create dw_area
this.Control[]={this.pb_del,&
this.pb_new,&
this.dw_area}
end on

on tp_1.destroy
destroy(this.pb_del)
destroy(this.pb_new)
destroy(this.dw_area)
end on

type pb_del from picturebutton within tp_1
integer x = 2341
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 170
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "           &b"
boolean originalsize = true
string picturename = "borrar_fila.gif"
string disabledname = "d_borrar_fila.gif"
string powertiptext = "Borrar Area [Alt+B]"
end type

event clicked;dw_area.deleterow(0)
i_cambio=true
end event

type pb_new from picturebutton within tp_1
integer x = 2190
integer y = 1436
integer width = 146
integer height = 128
integer taborder = 160
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &i"
boolean originalsize = true
string picturename = "insertar.gif"
string disabledname = "d_insertar.gif"
string powertiptext = "Insertar Nueva Area [Alt+I]"
end type

event clicked;dw_area.scrolltorow(dw_area.insertrow(0))
dw_area.setfocus()
tab_1.tp_2.enabled=false
i_cambio=true
enabled=false
end event

type dw_area from datawindow within tp_1
integer x = 14
integer y = 56
integer width = 4713
integer height = 1352
integer taborder = 30
string title = "none"
string dataobject = "dw_areapdx_tabla"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('desdoc',idw_docus)
idw_docus.settransobject(sqlca)



end event

event rowfocuschanged;if getrow()<1 then return
idw_docus.retrieve(getitemstring(getrow(),'clugar'))
i_area=getitemstring(getrow(),'codaadx')
tab_1.tp_2.dw_1.reset()
tab_1.tp_2.dw_2.reset()
tab_1.tp_2.dw_estan.reset()
tab_1.tp_2.dw_no_estan.reset()
tab_1.tp_2.dw_estan.retrieve(i_area)
tab_1.tp_2.dw_no_estan.retrieve(i_area)
tab_1.tabpage_1.dw_luestan.retrieve(i_area)
tab_1.tabpage_1.dw_nluestan.retrieve(i_area)

end event

event itemchanged;string nulo
setnull(nulo)
choose case dwo.name
	case 'codaadx'
		i_area=data
	case 'clugar'
		idw_docus.retrieve(data)
		setitem(row,'desdoc',nulo)
		setitem(row,'coddoc',nulo)
	case 'desdoc'
		setitem(row,'coddoc',idw_docus.getitemstring(idw_docus.getrow(),'coddoc'))
end choose
i_cambio=true
end event

event rowfocuschanging;if describe('evaluate("isrownew()",'+string(getrow())+')')='true' then return 1
if i_cambio_seg then
	choose case messagebox("Atención",'Realizó cambios de seguridad al Area, desea guardarlos.?',question!,yesnocancel!,1)
		case 1
			if grabar()=-1 then
				rollback;
				return 1
			end if
		case 2
			i_cambio_seg=false
		case 3
			return 1
	end choose
end if
end event

type tp_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4763
integer height = 1596
long backcolor = 67108864
string text = "Seguridad"
long tabtextcolor = 33554432
string picturename = "seguridad.ico"
long picturemaskcolor = 536870912
string powertiptext = "Seguridad del Área (Grupos con permisos de acceder al Area)"
pb_5 pb_5
pb_7 pb_7
pb_6 pb_6
pb_4 pb_4
st_3 st_3
st_2 st_2
dw_2 dw_2
dw_no_estan dw_no_estan
dw_1 dw_1
dw_estan dw_estan
end type

on tp_2.create
this.pb_5=create pb_5
this.pb_7=create pb_7
this.pb_6=create pb_6
this.pb_4=create pb_4
this.st_3=create st_3
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_no_estan=create dw_no_estan
this.dw_1=create dw_1
this.dw_estan=create dw_estan
this.Control[]={this.pb_5,&
this.pb_7,&
this.pb_6,&
this.pb_4,&
this.st_3,&
this.st_2,&
this.dw_2,&
this.dw_no_estan,&
this.dw_1,&
this.dw_estan}
end on

on tp_2.destroy
destroy(this.pb_5)
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.pb_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_no_estan)
destroy(this.dw_1)
destroy(this.dw_estan)
end on

type pb_5 from picturebutton within tp_2
integer x = 2011
integer y = 216
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "adelante_1.gif"
end type

event clicked;if dw_estan.rowcount()=0 then return
long fila
fila=dw_estan.getrow()
dw_no_estan.insertrow(1)
dw_no_estan.setitem(1,'codgrupo',dw_estan.getitemstring(fila,'codgrupo'))
dw_no_estan.setitem(1,'descripcion',dw_estan.getitemstring(fila,'descripcion'))
dw_estan.deleterow(fila)
dw_estan.triggerevent(rowfocuschanged!)
dw_no_estan.triggerevent(rowfocuschanged!)
i_cambio_seg=true

end event

type pb_7 from picturebutton within tp_2
integer x = 2011
integer y = 520
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras_1.gif"
end type

event clicked;do while dw_no_estan.rowcount()>0
	pb_6.triggerevent(clicked!)
loop
end event

type pb_6 from picturebutton within tp_2
integer x = 2011
integer y = 368
integer width = 151
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "atras.gif"
end type

event clicked;if dw_no_estan.rowcount()=0 then return
long fila
fila=dw_no_estan.getrow()
dw_estan.insertrow(1)
dw_estan.setitem(1,'codaadx',i_area)
dw_estan.setitem(1,'codgrupo',dw_no_estan.getitemstring(fila,'codgrupo'))
dw_estan.setitem(1,'descripcion',dw_no_estan.getitemstring(fila,'descripcion'))
dw_no_estan.deleterow(fila)
dw_estan.triggerevent(rowfocuschanged!)
dw_no_estan.triggerevent(rowfocuschanged!)
i_cambio_seg=true

end event

type pb_4 from picturebutton within tp_2
integer x = 2011
integer y = 64
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Ultimo.gif"
end type

event clicked;do while dw_estan.rowcount()>0
	pb_5.triggerevent(clicked!)
loop

end event

type st_3 from statictext within tp_2
integer x = 2213
integer y = 784
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios"
boolean focusrectangle = false
end type

type st_2 from statictext within tp_2
integer x = 73
integer y = 784
integer width = 302
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Usuarios"
boolean focusrectangle = false
end type

type dw_2 from datawindow within tp_2
integer x = 2222
integer y = 852
integer width = 1710
integer height = 656
integer taborder = 150
string title = "none"
string dataobject = "dw_usu_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_no_estan from datawindow within tp_2
integer x = 2213
integer y = 64
integer width = 1733
integer height = 684
integer taborder = 30
string title = "none"
string dataobject = "dw_areadx_sin_perm"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if getrow()>0 then pb_6.triggerevent(clicked!)
end event

event rowfocuschanged;dw_2.reset()
if getrow()<1 then Return
dw_2.Retrieve(GetItemString(GetRow(),'codgrupo'))

end event

type dw_1 from datawindow within tp_2
integer x = 73
integer y = 852
integer width = 1842
integer height = 664
integer taborder = 120
string title = "none"
string dataobject = "dw_usu_grup"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type dw_estan from datawindow within tp_2
integer x = 73
integer y = 56
integer width = 1870
integer height = 684
integer taborder = 20
string title = "none"
string dataobject = "dw_areadx_seg"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if getrow()>0 then pb_4.triggerevent(clicked!)
end event

event rowfocuschanged;dw_1.reset()
if getrow()<1 then Return
dw_1.Retrieve(GetItemString(GetRow(),'codgrupo'))
end event

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4763
integer height = 1596
long backcolor = 67108864
string text = "Almacenes"
long tabtextcolor = 33554432
string picturename = "ips.ico"
long picturemaskcolor = 536870912
dw_3 dw_3
st_1 st_1
pb_8 pb_8
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_nluestan dw_nluestan
dw_luestan dw_luestan
gb_1 gb_1
end type

on tabpage_1.create
this.dw_3=create dw_3
this.st_1=create st_1
this.pb_8=create pb_8
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_nluestan=create dw_nluestan
this.dw_luestan=create dw_luestan
this.gb_1=create gb_1
this.Control[]={this.dw_3,&
this.st_1,&
this.pb_8,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_nluestan,&
this.dw_luestan,&
this.gb_1}
end on

on tabpage_1.destroy
destroy(this.dw_3)
destroy(this.st_1)
destroy(this.pb_8)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_nluestan)
destroy(this.dw_luestan)
destroy(this.gb_1)
end on

type dw_3 from datawindow within tabpage_1
integer x = 2601
integer y = 104
integer width = 1335
integer height = 84
integer taborder = 40
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)
InsertRow(0)
end event

event itemchanged;dw_nluestan.setfilter("codlugar='"+data+"'")
dw_nluestan.filter()

end event

type st_1 from statictext within tabpage_1
integer x = 2450
integer y = 104
integer width = 142
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lugar"
boolean focusrectangle = false
end type

type pb_8 from picturebutton within tabpage_1
integer x = 2213
integer y = 488
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "atras_1.gif"
end type

type pb_3 from picturebutton within tabpage_1
integer x = 2213
integer y = 348
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "atras.gif"
end type

event clicked;if dw_nluestan.rowcount()=0 then return
long fila
fila=dw_nluestan.getrow()
dw_luestan.insertrow(1)
dw_luestan.setitem(1,'codaadx',i_area)
dw_luestan.setitem(1,'codalmacen',dw_nluestan.getitemstring(fila,'codalmacen'))
dw_luestan.setitem(1,'descripcion',dw_nluestan.getitemstring(fila,'descripcion'))
dw_luestan.setitem(1,'desl',dw_nluestan.getitemstring(fila,'deslug'))
dw_nluestan.deleterow(fila)
dw_luestan.triggerevent(rowfocuschanged!)
dw_nluestan.triggerevent(rowfocuschanged!)
i_cambio_seg=true

end event

type pb_2 from picturebutton within tabpage_1
integer x = 2213
integer y = 200
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "adelante_1.gif"
end type

event clicked;if dw_luestan.rowcount()=0 then return
long fila
fila=dw_luestan.getrow()
dw_nluestan.insertrow(1)
dw_nluestan.setitem(1,'codalmacen',dw_luestan.getitemstring(fila,'codalmacen'))
dw_nluestan.setitem(1,'descripcion',dw_luestan.getitemstring(fila,'descripcion'))
dw_nluestan.setitem(1,'deslug',dw_luestan.getitemstring(fila,'desl'))
end event

type pb_1 from picturebutton within tabpage_1
integer x = 2213
integer y = 56
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "Ultimo.gif"
end type

type dw_nluestan from datawindow within tabpage_1
integer x = 2437
integer y = 224
integer width = 2249
integer height = 1296
integer taborder = 20
string title = "none"
string dataobject = "dw_almacenes_area"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_luestan from datawindow within tabpage_1
integer x = 101
integer y = 56
integer width = 2062
integer height = 1456
integer taborder = 60
string title = "none"
string dataobject = "dw_areas_almacenes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type gb_1 from groupbox within tabpage_1
integer x = 2395
integer y = 20
integer width = 2341
integer height = 1556
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos Los Almacenes"
end type

