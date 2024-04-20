$PBExportHeader$w_perso_ventana.srw
forward
global type w_perso_ventana from window
end type
type pb_cancel from picturebutton within w_perso_ventana
end type
type pb_guardar from picturebutton within w_perso_ventana
end type
type dw_titulo from datawindow within w_perso_ventana
end type
type tab_1 from tab within w_perso_ventana
end type
type tp_1 from userobject within tab_1
end type
type pb_5 from picturebutton within tp_1
end type
type pb_6 from picturebutton within tp_1
end type
type pb_7 from picturebutton within tp_1
end type
type pb_4 from picturebutton within tp_1
end type
type dw_resto_grupos from datawindow within tp_1
end type
type st_2 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type dw_seg_boton from datawindow within tp_1
end type
type dw_botones from datawindow within tp_1
end type
type tp_1 from userobject within tab_1
pb_5 pb_5
pb_6 pb_6
pb_7 pb_7
pb_4 pb_4
dw_resto_grupos dw_resto_grupos
st_2 st_2
st_1 st_1
dw_seg_boton dw_seg_boton
dw_botones dw_botones
end type
type tp_2 from userobject within tab_1
end type
type st_3 from statictext within tp_2
end type
type dw_cols_dw from datawindow within tp_2
end type
type dw_dws from datawindow within tp_2
end type
type tp_2 from userobject within tab_1
st_3 st_3
dw_cols_dw dw_cols_dw
dw_dws dw_dws
end type
type tp_3 from userobject within tab_1
end type
type dw_tps from datawindow within tp_3
end type
type dw_tabs from datawindow within tp_3
end type
type tp_3 from userobject within tab_1
dw_tps dw_tps
dw_tabs dw_tabs
end type
type tab_1 from tab within w_perso_ventana
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type
type dw_vent from datawindow within w_perso_ventana
end type
type dw_mod from datawindow within w_perso_ventana
end type
end forward

global type w_perso_ventana from window
integer width = 4105
integer height = 1940
boolean titlebar = true
string title = "Personalización de Ventanas"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "ribon_personaliza.ico"
boolean center = true
pb_cancel pb_cancel
pb_guardar pb_guardar
dw_titulo dw_titulo
tab_1 tab_1
dw_vent dw_vent
dw_mod dw_mod
end type
global w_perso_ventana w_perso_ventana

type variables
datawindowchild idw_ventanas
string i_cmod,i_cvent
boolean i_cambio_vent,i_cambio_boton,i_cambio_dw,i_cambio_tab
end variables

forward prototypes
public function integer guardar ()
public function integer guardar_boton ()
public function integer guardar_dw ()
public function integer guardar_tab ()
end prototypes

public function integer guardar ();if i_cambio_boton then
	if guardar_boton()=-1 then return -1
end if
if i_cambio_dw then
	if guardar_dw()=-1 then return -1
end if
if i_cambio_tab then
	if guardar_tab()=-1 then return -1
end if
if i_cambio_vent then
	if dw_titulo.update(true,false)=-1 then return -1
	if tab_1.tp_1.dw_botones.update(true,false)=-1 then return -1
	if tab_1.tp_2.dw_dws.update(true,false)=-1 then return -1
	if tab_1.tp_3.dw_tabs.update(true,false)=-1 then return -1
end if
dw_titulo.resetupdate()
tab_1.tp_1.dw_botones.resetupdate()
tab_1.tp_2.dw_dws.resetupdate()
tab_1.tp_3.dw_tabs.resetupdate()
i_cambio_vent=false
return 1
end function

public function integer guardar_boton ();if tab_1.tp_1.dw_seg_boton.update(true,false)=-1 then return -1
i_cambio_boton=false
tab_1.tp_1.dw_seg_boton.resetupdate()
return 1
end function

public function integer guardar_dw ();if tab_1.tp_2.dw_cols_dw.update(true,false)=-1 then return -1
i_cambio_dw=false
tab_1.tp_2.dw_cols_dw.resetupdate()
return 1
end function

public function integer guardar_tab ();if tab_1.tp_3.dw_tps.update(true,false)=-1 then return -1
i_cambio_tab=false
tab_1.tp_3.dw_tps.resetupdate()
return 1
end function

on w_perso_ventana.create
this.pb_cancel=create pb_cancel
this.pb_guardar=create pb_guardar
this.dw_titulo=create dw_titulo
this.tab_1=create tab_1
this.dw_vent=create dw_vent
this.dw_mod=create dw_mod
this.Control[]={this.pb_cancel,&
this.pb_guardar,&
this.dw_titulo,&
this.tab_1,&
this.dw_vent,&
this.dw_mod}
end on

on w_perso_ventana.destroy
destroy(this.pb_cancel)
destroy(this.pb_guardar)
destroy(this.dw_titulo)
destroy(this.tab_1)
destroy(this.dw_vent)
destroy(this.dw_mod)
end on

event closequery;if i_cambio_vent or i_cambio_boton or i_cambio_dw or i_cambio_tab then
	choose case messagebox("Atención",'Realizó cambios a la Ventana. Desea Guardarlos ahora?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				return 1
			else
				commit;
			end if
		case 2
			return 0
		case 3
			return 1
	end choose
end if
end event

type pb_cancel from picturebutton within w_perso_ventana
integer x = 2057
integer y = 1664
integer width = 142
integer height = 124
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar y cerrar"
end type

event clicked;close(parent)
end event

type pb_guardar from picturebutton within w_perso_ventana
integer x = 1856
integer y = 1664
integer width = 146
integer height = 128
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.gif"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;if guardar()=-1 then
	rollback;
else
	commit;
end if
end event

type dw_titulo from datawindow within w_perso_ventana
integer x = 2661
integer y = 8
integer width = 1399
integer height = 160
integer taborder = 30
string title = "none"
string dataobject = "dw_titu_vent"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio_vent=true
end event

type tab_1 from tab within w_perso_ventana
integer x = 14
integer y = 160
integer width = 3991
integer height = 1492
integer taborder = 40
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
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
tp_3 tp_3
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_2,&
this.tp_3}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3954
integer height = 1364
long backcolor = 67108864
string text = "Botones"
long tabtextcolor = 33554432
string picturename = "boton.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_6 pb_6
pb_7 pb_7
pb_4 pb_4
dw_resto_grupos dw_resto_grupos
st_2 st_2
st_1 st_1
dw_seg_boton dw_seg_boton
dw_botones dw_botones
end type

on tp_1.create
this.pb_5=create pb_5
this.pb_6=create pb_6
this.pb_7=create pb_7
this.pb_4=create pb_4
this.dw_resto_grupos=create dw_resto_grupos
this.st_2=create st_2
this.st_1=create st_1
this.dw_seg_boton=create dw_seg_boton
this.dw_botones=create dw_botones
this.Control[]={this.pb_5,&
this.pb_6,&
this.pb_7,&
this.pb_4,&
this.dw_resto_grupos,&
this.st_2,&
this.st_1,&
this.dw_seg_boton,&
this.dw_botones}
end on

on tp_1.destroy
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.pb_7)
destroy(this.pb_4)
destroy(this.dw_resto_grupos)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_seg_boton)
destroy(this.dw_botones)
end on

type pb_5 from picturebutton within tp_1
integer x = 1714
integer y = 812
integer width = 146
integer height = 128
integer taborder = 140
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Agregar Todos los Grupos"
end type

event clicked;if dw_resto_grupos.rowcount()=0 or dw_seg_boton.visible=false then return
long fila
fila=dw_resto_grupos.getrow()
dw_seg_boton.insertrow(1)
dw_seg_boton.setitem(1,'cod_ventana',i_cvent)
dw_seg_boton.setitem(1,'cod_obj',dw_botones.getitemstring(dw_botones.getrow(),'cod_obj'))
dw_seg_boton.setitem(1,'codgrupo',dw_resto_grupos.getitemstring(fila,'codgrupo'))
dw_seg_boton.setitem(1,'descripcion',dw_resto_grupos.getitemstring(fila,'descripcion'))
dw_resto_grupos.deleterow(fila)
i_cambio_boton=true
end event

type pb_6 from picturebutton within tp_1
integer x = 1714
integer y = 672
integer width = 146
integer height = 128
integer taborder = 130
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "atras_1.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Agregar Grupo"
end type

event clicked;if dw_seg_boton.visible=false then return
do while dw_resto_grupos.rowcount()>0
	pb_5.triggerevent(clicked!)
loop
end event

type pb_7 from picturebutton within tp_1
integer x = 1714
integer y = 1096
integer width = 146
integer height = 128
integer taborder = 120
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "Ultimo.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Retirar todos los Grupos"
end type

event clicked;if dw_seg_boton.visible=false then return
do while dw_seg_boton.rowcount()>0
	pb_4.triggerevent(clicked!)
loop
end event

type pb_4 from picturebutton within tp_1
integer x = 1714
integer y = 952
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
string picturename = "adelante_1.gif"
vtextalign vtextalign = vcenter!
string powertiptext = "Retirar Grupo"
end type

event clicked;if dw_seg_boton.rowcount()=0 or dw_seg_boton.visible=false then return
long fila
fila=dw_seg_boton.getrow()
dw_resto_grupos.insertrow(1)
dw_resto_grupos.setitem(1,'codgrupo',dw_seg_boton.getitemstring(fila,'codgrupo'))
dw_resto_grupos.setitem(1,'descripcion',dw_seg_boton.getitemstring(fila,'descripcion'))
dw_seg_boton.deleterow(fila)
i_cambio_boton=true
end event

type dw_resto_grupos from datawindow within tp_1
integer x = 1957
integer y = 640
integer width = 1600
integer height = 688
integer taborder = 50
string title = "none"
string dataobject = "dw_resto_grup_boton"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_2 from statictext within tp_1
integer x = 1952
integer y = 584
integer width = 375
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resto de Grupos"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within tp_1
integer x = 18
integer y = 584
integer width = 914
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos con Permiso de Ejecutar el Botón:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_seg_boton from datawindow within tp_1
integer x = 14
integer y = 640
integer width = 1600
integer height = 688
integer taborder = 50
string title = "none"
string dataobject = "dw_seg_boton"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_botones from datawindow within tp_1
integer y = 32
integer width = 3904
integer height = 516
integer taborder = 20
string title = "none"
string dataobject = "dw_obj_vent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;if getrow()<1 then return
dw_seg_boton.retrieve(i_cvent,getitemstring(getrow(),'cod_obj'))
	dw_resto_grupos.retrieve(i_cvent,getitemstring(getrow(),'cod_obj'))
if getitemstring(getrow(),'permiso')='1' and getitemstring(getrow(),'visible')='1' then
	dw_seg_boton.visible=true
	dw_resto_grupos.visible=true
else
	dw_seg_boton.visible=false
	dw_resto_grupos.visible=false
end if
	
end event

event itemchanged;choose case getcolumnname()
	case 'permiso'
		if data='1' then
			dw_seg_boton.visible=true
			dw_resto_grupos.visible=true
		else
			dw_seg_boton.visible=false
			dw_resto_grupos.visible=false
		end if
	case 'visible'
		if data='1' and getitemstring(getrow(),'permiso')='1' then
			dw_seg_boton.visible=true
			dw_resto_grupos.visible=true
		else
			dw_seg_boton.visible=false
			dw_resto_grupos.visible=false
		end if
end choose
accepttext()
i_cambio_vent=true
end event

event rowfocuschanging;if i_cambio_boton then
	choose case messagebox('Atención','Cambió la Configuración del Botón. Desea guardarlo ahora?',question!,yesnocancel!,1)
		case 1
			if guardar_boton()=-1 then
				rollback;
				return 1
			else
				commit;
				return 0
			end if
		case 2
			i_cambio_boton=false
			return 0
		case 3
			return 1
	end choose		
end if
end event

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3954
integer height = 1364
long backcolor = 67108864
string text = "Datawindows"
long tabtextcolor = 33554432
string picturename = "ribon_lista.ico"
long picturemaskcolor = 536870912
st_3 st_3
dw_cols_dw dw_cols_dw
dw_dws dw_dws
end type

on tp_2.create
this.st_3=create st_3
this.dw_cols_dw=create dw_cols_dw
this.dw_dws=create dw_dws
this.Control[]={this.st_3,&
this.dw_cols_dw,&
this.dw_dws}
end on

on tp_2.destroy
destroy(this.st_3)
destroy(this.dw_cols_dw)
destroy(this.dw_dws)
end on

type st_3 from statictext within tp_2
integer x = 174
integer y = 572
integer width = 608
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Columnas del Datawindow:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_cols_dw from datawindow within tp_2
integer x = 82
integer y = 624
integer width = 3552
integer height = 704
integer taborder = 50
string title = "none"
string dataobject = "dw_cols_dw"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;i_cambio_dw=true
end event

event constructor;settransobject(sqlca)
end event

type dw_dws from datawindow within tp_2
integer x = 73
integer y = 36
integer width = 3584
integer height = 520
integer taborder = 30
string title = "none"
string dataobject = "dw_obj_vent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case getcolumnname()
	case 'visible'
		if data='1' then
			dw_cols_dw.visible=true
		else
			dw_cols_dw.visible=false
		end if
end choose
accepttext()
i_cambio_vent=true

end event

event rowfocuschanged;if getrow()<1 then return
dw_cols_dw.retrieve(i_cvent,getitemstring(getrow(),'cod_obj'))
if getitemstring(getrow(),'visible')='1' then
	dw_cols_dw.visible=true
else
	dw_cols_dw.visible=false
end if
	
end event

event rowfocuschanging;if i_cambio_dw then
	choose case messagebox('Atención','Cambió la Configuración del Datawindow. Desea guardarlo ahora?',question!,yesnocancel!,1)
		case 1
			if guardar_dw()=-1 then
				rollback;
				return 1
			else
				commit;
				return 0
			end if
		case 2
			i_cambio_dw=false
			return 0
		case 3
			return 1
	end choose		
end if
end event

type tp_3 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3954
integer height = 1364
long backcolor = 67108864
string text = "TabPages"
long tabtextcolor = 33554432
string picturename = "tabs.ico"
long picturemaskcolor = 536870912
dw_tps dw_tps
dw_tabs dw_tabs
end type

on tp_3.create
this.dw_tps=create dw_tps
this.dw_tabs=create dw_tabs
this.Control[]={this.dw_tps,&
this.dw_tabs}
end on

on tp_3.destroy
destroy(this.dw_tps)
destroy(this.dw_tabs)
end on

type dw_tps from datawindow within tp_3
integer x = 178
integer y = 720
integer width = 3497
integer height = 588
integer taborder = 50
string title = "none"
string dataobject = "dw_tps"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;i_cambio_tab=true
end event

type dw_tabs from datawindow within tp_3
integer x = 215
integer y = 40
integer width = 3461
integer height = 624
integer taborder = 30
string title = "none"
string dataobject = "dw_obj_vent"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event itemchanged;choose case getcolumnname()
	case 'visible'
		if data='1' then
			dw_tps.visible=true
		else
			dw_tps.visible=false
		end if
end choose
accepttext()
i_cambio_vent=true

end event

event rowfocuschanged;if getrow()<1 then return
dw_tps.retrieve(i_cvent,getitemstring(getrow(),'cod_obj'))
if getitemstring(getrow(),'visible')='1' then
	dw_tps.visible=true
else
	dw_tps.visible=false
end if
	
end event

event rowfocuschanging;if i_cambio_tab then
	choose case messagebox('Atención','Cambió la Configuración del TabPage. Desea guardarlo ahora?',question!,yesnocancel!,1)
		case 1
			if guardar_tab()=-1 then
				rollback;
				return 1
			else
				commit;
				return 0
			end if
		case 2
			i_cambio_tab=false
			return 0
		case 3
			return 1
	end choose		
end if
end event

type dw_vent from datawindow within w_perso_ventana
integer x = 1435
integer y = 20
integer width = 1170
integer height = 156
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_ventana_mod"
boolean border = false
boolean livescroll = true
end type

event constructor;getchild('cod_ventana',idw_ventanas)
idw_ventanas.settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_cambio_vent or i_cambio_boton or i_cambio_dw or i_cambio_tab then
	choose case messagebox("Atención",'Realizó cambios a la Ventana. Desea Guardarlos ahora?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				settext(getitemstring(1,1))
				setitem(1,1,getitemstring(1,1))
				return 1
			else
				commit;
			end if
		case 2
			i_cambio_vent=false
			i_cambio_boton=false
			i_cambio_dw=false
			i_cambio_tab=false
		case 3
			settext(getitemstring(1,1))
			setitem(1,1,getitemstring(1,1))
			return 1
	end choose
end if
i_cvent=data
dw_titulo.retrieve(i_cmod,i_cvent)
tab_1.tp_1.dw_botones.reset()
tab_1.tp_1.dw_seg_boton.reset()
tab_1.tp_1.dw_resto_grupos.reset()
tab_1.tp_1.dw_botones.retrieve(i_cvent,'B')
tab_1.tp_2.dw_dws.reset()
tab_1.tp_2.dw_cols_dw.reset()
tab_1.tp_2.dw_dws.retrieve(i_cvent,'D')
tab_1.tp_3.dw_tabs.reset()
tab_1.tp_3.dw_tps.reset()
tab_1.tp_3.dw_tabs.retrieve(i_cvent,'T')
end event

type dw_mod from datawindow within w_perso_ventana
integer x = 14
integer y = 20
integer width = 1381
integer height = 140
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_modulos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;if i_cambio_vent or i_cambio_boton or i_cambio_dw or i_cambio_tab then
	choose case messagebox("Atención",'Realizó cambios a la Ventana. Desea Guardarlos ahora?',question!,yesnocancel!,1)
		case 1
			if guardar()=-1 then
				rollback;
				settext(getitemstring(1,1))
				setitem(1,1,getitemstring(1,1))
				return 1
			else
				commit;
			end if
		case 2
			i_cambio_vent=false
			i_cambio_boton=false
			i_cambio_dw=false
			i_cambio_tab=false
		case 3
			settext(getitemstring(1,1))
			setitem(1,1,getitemstring(1,1))
			return 1
	end choose
end if
dw_vent.setitem(1,1,'')
i_cmod=data
idw_ventanas.retrieve(i_cmod)
dw_titulo.reset()
tab_1.tp_1.dw_botones.reset()
tab_1.tp_1.dw_seg_boton.reset()
tab_1.tp_1.dw_resto_grupos.reset()
tab_1.tp_2.dw_dws.reset()
tab_1.tp_2.dw_cols_dw.reset()
tab_1.tp_3.dw_tabs.reset()
tab_1.tp_3.dw_tps.reset()
end event

