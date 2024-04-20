$PBExportHeader$w_conf_act_final.srw
forward
global type w_conf_act_final from window
end type
type pb_save from picturebutton within w_conf_act_final
end type
type st_1 from statictext within w_conf_act_final
end type
type dw_act from datawindow within w_conf_act_final
end type
type t1 from tab within w_conf_act_final
end type
type tp1 from userobject within t1
end type
type pb_5 from picturebutton within tp1
end type
type pb_4 from picturebutton within tp1
end type
type pb_3 from picturebutton within tp1
end type
type pb_2 from picturebutton within tp1
end type
type st_3 from statictext within tp1
end type
type st_2 from statictext within tp1
end type
type dw_ge from datawindow within tp1
end type
type dw_ge_conf from datawindow within tp1
end type
type tp1 from userobject within t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
st_3 st_3
st_2 st_2
dw_ge dw_ge
dw_ge_conf dw_ge_conf
end type
type tp2 from userobject within t1
end type
type pb_7 from picturebutton within tp2
end type
type pb_6 from picturebutton within tp2
end type
type st_5 from statictext within tp2
end type
type pb_1 from picturebutton within tp2
end type
type dw_pivots from datawindow within tp2
end type
type dw_3 from datawindow within tp2
end type
type gb_1 from groupbox within tp2
end type
type tp2 from userobject within t1
pb_7 pb_7
pb_6 pb_6
st_5 st_5
pb_1 pb_1
dw_pivots dw_pivots
dw_3 dw_3
gb_1 gb_1
end type
type t1 from tab within w_conf_act_final
tp1 tp1
tp2 tp2
end type
type dw_tipo from datawindow within w_conf_act_final
end type
end forward

global type w_conf_act_final from window
integer width = 3392
integer height = 1876
boolean titlebar = true
string title = "Configuración de Actividades Finales"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_save pb_save
st_1 st_1
dw_act dw_act
t1 t1
dw_tipo dw_tipo
end type
global w_conf_act_final w_conf_act_final

type variables
boolean i_cambio
end variables

on w_conf_act_final.create
this.pb_save=create pb_save
this.st_1=create st_1
this.dw_act=create dw_act
this.t1=create t1
this.dw_tipo=create dw_tipo
this.Control[]={this.pb_save,&
this.st_1,&
this.dw_act,&
this.t1,&
this.dw_tipo}
end on

on w_conf_act_final.destroy
destroy(this.pb_save)
destroy(this.st_1)
destroy(this.dw_act)
destroy(this.t1)
destroy(this.dw_tipo)
end on

event closequery;if i_cambio=true then
	choose case messagebox('Atención','realizó cambios a la actividad final, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if pb_save.event clicked()=-1 then return 1
		case 2
			i_cambio=false
		case 3
			return 1
	end choose
end if
end event

type pb_save from picturebutton within w_conf_act_final
integer x = 603
integer y = 412
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "guardar.gif"
string powertiptext = "Guardar"
end type

event clicked;if t1.tp1.dw_ge_conf.accepttext()=-1 then return -1
if t1.tp1.dw_ge_conf.update(true,false)=-1 then return -1
if t1.tp2.dw_pivots.update(true,false)=-1 then return -1
commit;
t1.tp1.dw_ge_conf.resetupdate()
t1.tp2.dw_pivots.resetupdate()
i_cambio=false
end event

type st_1 from statictext within w_conf_act_final
integer x = 768
integer width = 517
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Actividad final por tipo:"
boolean focusrectangle = false
end type

type dw_act from datawindow within w_conf_act_final
integer x = 763
integer y = 56
integer width = 2565
integer height = 484
integer taborder = 20
string title = "none"
string dataobject = "dw_act_final_x_tipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;t1.tp1.dw_ge_conf.reset()
t1.tp1.dw_ge.reset()
t1.tp2.dw_pivots.reset()
if getrow()<1 then return
string cod
cod=getitemstring(getrow(),'cod_activid')
t1.tp1.dw_ge_conf.retrieve(cod)
t1.tp1.dw_ge.retrieve(cod)
t1.tp2.dw_pivots.retrieve(cod)
end event

event rowfocuschanging;if i_cambio then
	choose case messagebox('Atención','realizó cambios a la actividad final, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if pb_save.event clicked()=-1 then return 1
		case 2
			i_cambio=false
		case 3
			return 1
	end choose
end if
end event

type t1 from tab within w_conf_act_final
integer x = 18
integer y = 568
integer width = 3310
integer height = 1176
integer taborder = 20
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
tp1 tp1
tp2 tp2
end type

on t1.create
this.tp1=create tp1
this.tp2=create tp2
this.Control[]={this.tp1,&
this.tp2}
end on

on t1.destroy
destroy(this.tp1)
destroy(this.tp2)
end on

type tp1 from userobject within t1
integer x = 18
integer y = 100
integer width = 3273
integer height = 1060
long backcolor = 67108864
string text = "Grupos etareos"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
st_3 st_3
st_2 st_2
dw_ge dw_ge
dw_ge_conf dw_ge_conf
end type

on tp1.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_3=create st_3
this.st_2=create st_2
this.dw_ge=create dw_ge
this.dw_ge_conf=create dw_ge_conf
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.pb_2,&
this.st_3,&
this.st_2,&
this.dw_ge,&
this.dw_ge_conf}
end on

on tp1.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_ge)
destroy(this.dw_ge_conf)
end on

type pb_5 from picturebutton within tp1
integer x = 1563
integer y = 232
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "atras_1.gif"
string powertiptext = "Incluir todos los grupos etareos"
end type

event clicked;do while dw_ge.rowcount()>0
	pb_4.event clicked()
loop
end event

type pb_4 from picturebutton within tp1
integer x = 1563
integer y = 100
integer width = 142
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "atras.gif"
string powertiptext = "Incluir el grupo etareo"
end type

event clicked;if dw_ge.rowcount()=0 then return
long j
j=dw_ge_conf.insertrow(0)
dw_ge_conf.setitem(j,'cod_activid',dw_act.getitemstring(dw_act.getrow(),'cod_activid'))
dw_ge_conf.setitem(j,'codgetareo',dw_ge.getitemstring(dw_ge.getrow(),'codgetareo'))
dw_ge_conf.setitem(j,'desgetareo',dw_ge.getitemstring(dw_ge.getrow(),'desgetareo'))
dw_ge.deleterow(0)
i_cambio=true
end event

type pb_3 from picturebutton within tp1
integer x = 1554
integer y = 880
integer width = 142
integer height = 124
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "adelante_1.gif"
string powertiptext = "Retirar todos los grupos etareos"
end type

event clicked;do while dw_ge_conf.rowcount()>0
	pb_2.event clicked()
loop
end event

type pb_2 from picturebutton within tp1
integer x = 1554
integer y = 748
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "ultimo.gif"
string powertiptext = "Retirar el grupo etareo"
end type

event clicked;if dw_ge_conf.rowcount()=0 then return
long j
j=dw_ge.insertrow(0)
dw_ge.setitem(j,'codgetareo',dw_ge_conf.getitemstring(dw_ge_conf.getrow(),'codgetareo'))
dw_ge.setitem(j,'desgetareo',dw_ge_conf.getitemstring(dw_ge_conf.getrow(),'desgetareo'))
dw_ge_conf.deleterow(0)
i_cambio=true
end event

type st_3 from statictext within tp1
integer x = 1765
integer y = 36
integer width = 663
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resto de grupos etareos:"
boolean focusrectangle = false
end type

type st_2 from statictext within tp1
integer x = 23
integer y = 36
integer width = 663
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupos etareos configurados:"
boolean focusrectangle = false
end type

type dw_ge from datawindow within tp1
integer x = 1765
integer y = 96
integer width = 1486
integer height = 912
integer taborder = 20
string title = "none"
string dataobject = "dw_rest_getar_act"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_ge_conf from datawindow within tp1
integer x = 18
integer y = 96
integer width = 1486
integer height = 912
integer taborder = 20
string title = "none"
string dataobject = "dw_geta_act"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type tp2 from userobject within t1
integer x = 18
integer y = 100
integer width = 3273
integer height = 1060
long backcolor = 67108864
string text = "Pivotes"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_7 pb_7
pb_6 pb_6
st_5 st_5
pb_1 pb_1
dw_pivots dw_pivots
dw_3 dw_3
gb_1 gb_1
end type

on tp2.create
this.pb_7=create pb_7
this.pb_6=create pb_6
this.st_5=create st_5
this.pb_1=create pb_1
this.dw_pivots=create dw_pivots
this.dw_3=create dw_3
this.gb_1=create gb_1
this.Control[]={this.pb_7,&
this.pb_6,&
this.st_5,&
this.pb_1,&
this.dw_pivots,&
this.dw_3,&
this.gb_1}
end on

on tp2.destroy
destroy(this.pb_7)
destroy(this.pb_6)
destroy(this.st_5)
destroy(this.pb_1)
destroy(this.dw_pivots)
destroy(this.dw_3)
destroy(this.gb_1)
end on

type pb_7 from picturebutton within tp2
integer x = 73
integer y = 92
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
string picturename = "buscar.gif"
alignment htextalign = left!
string powertiptext = "Buscar procedimientos"
end type

event clicked;if dw_act.rowcount()=0 then return
open(w_busca_solo_cups)
if message.stringparm<>'' then
	dw_3.setitem(1,'codproced',message.stringparm)
	dw_3.event itemchanged(1,dw_3.object.codproced,message.stringparm)
end if
end event

type pb_6 from picturebutton within tp2
integer x = 3081
integer y = 312
integer width = 137
integer height = 124
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "borrar_fila.gif"
alignment htextalign = left!
string powertiptext = "Borrar pivote"
end type

event clicked;if dw_pivots.rowcount()=0 then return
dw_pivots.deleterow(0)
i_cambio=true
end event

type st_5 from statictext within tp2
integer x = 27
integer y = 260
integer width = 626
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pivotes de la Actividad final:"
boolean focusrectangle = false
end type

type pb_1 from picturebutton within tp2
integer x = 3086
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
string picturename = "llevar.gif"
alignment htextalign = left!
string powertiptext = "Adicionar pivote (procedimiento)"
end type

event clicked;if dw_act.rowcount()=0 then return
string cod
cod=dw_3.getitemstring(1,'codproced')
if isnull(cod) or cod='' then return
long j
j=dw_pivots.find('proccups="'+cod+'"',1,dw_pivots.rowcount())
if j=0 then
	j=dw_pivots.insertrow(0)
	dw_pivots.setitem(j,'cod_activid',dw_act.getitemstring(dw_act.getrow(),'cod_activid'))
	dw_pivots.setitem(j,'proccups',cod)
	dw_pivots.setitem(j,'descripcion',dw_3.getitemstring(1,'descripcion'))
	i_cambio=true
end if
dw_3.reset()
dw_3.insertrow(1)


end event

type dw_pivots from datawindow within tp2
integer x = 23
integer y = 316
integer width = 3013
integer height = 712
integer taborder = 30
string title = "none"
string dataobject = "dw_pivotes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event dberror;return f_dw_error(sqldbcode,sqlsyntax,sqlerrtext,classname())
end event

type dw_3 from datawindow within tp2
integer x = 242
integer y = 68
integer width = 2761
integer height = 152
integer taborder = 20
string title = "none"
string dataobject = "dw_busca_proc"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;setredraw(false)
post retrieve(data)
end event

event retrieveend;if rowcount()=0 then
	messagebox('Atención','Procedimiento no existe')
	insertrow(1)
end if
setredraw(true)
end event

type gb_1 from groupbox within tp2
integer x = 32
integer width = 3013
integer height = 252
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Buscar procedimiento:"
end type

type dw_tipo from datawindow within w_conf_act_final
integer x = 9
integer width = 782
integer height = 160
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_tip_act_fin"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;string actual
actual=getitemstring(1,1)
if i_cambio then
	choose case messagebox('Atención','realizó cambios a la actividad final, desea guardarlos?',question!,yesnocancel!,1)
		case 1
			if pb_save.event clicked()=-1 then 
				settext(actual)
				setitem(1,1,actual)
				return 2
			end if
		case 2
			i_cambio=false
		case 3
			settext(actual)
			setitem(1,1,actual)
			return 2
	end choose
end if

accepttext()
dw_act.reset()
dw_act.retrieve(data)
choose case data
	case 'Y','P','C','Q'
		t1.tp2.enabled=true
	case 'T','E','U'
		t1.selectedtab=1
		t1.tp2.enabled=false
end choose
end event

