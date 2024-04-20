$PBExportHeader$w_flujo.srw
forward
global type w_flujo from window
end type
type dw_ventana from datawindow within w_flujo
end type
type pb_3 from picturebutton within w_flujo
end type
type pb_1 from picturebutton within w_flujo
end type
type st_1 from statictext within w_flujo
end type
type dw_flujo from datawindow within w_flujo
end type
type dw_mod_ori from datawindow within w_flujo
end type
end forward

global type w_flujo from window
integer width = 5637
integer height = 1796
boolean titlebar = true
string title = "Flujo de Documentos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_ventana dw_ventana
pb_3 pb_3
pb_1 pb_1
st_1 st_1
dw_flujo dw_flujo
dw_mod_ori dw_mod_ori
end type
global w_flujo w_flujo

type variables
datawindowchild idw_ventana

end variables

on w_flujo.create
this.dw_ventana=create dw_ventana
this.pb_3=create pb_3
this.pb_1=create pb_1
this.st_1=create st_1
this.dw_flujo=create dw_flujo
this.dw_mod_ori=create dw_mod_ori
this.Control[]={this.dw_ventana,&
this.pb_3,&
this.pb_1,&
this.st_1,&
this.dw_flujo,&
this.dw_mod_ori}
end on

on w_flujo.destroy
destroy(this.dw_ventana)
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.dw_flujo)
destroy(this.dw_mod_ori)
end on

type dw_ventana from datawindow within w_flujo
integer x = 1490
integer y = 36
integer width = 1024
integer height = 144
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_ventana"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
getchild('cod_ventana',idw_ventana)
idw_ventana.settransobject(sqlca)
end event

event itemchanged;dw_flujo.retrieve(data)
end event

type pb_3 from picturebutton within w_flujo
integer x = 2811
integer y = 60
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
string picturename = "guardar2.GIF"
string disabledname = "d_guardar2.GIF"
alignment htextalign = left!
string powertiptext = "Guardar"
end type

event clicked;dw_flujo.accepttext()
if dw_flujo.update()=-1 then
	rollback;
else
	commit;
end if
end event

type pb_1 from picturebutton within w_flujo
integer x = 2642
integer y = 60
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
string picturename = "insertar.GIF"
string disabledname = "d_insertar.GIF"
alignment htextalign = left!
string powertiptext = "Insertar Nuevo Flujo de datos"
end type

event clicked;if isnull(dw_mod_ori.getitemstring(1,1)) or dw_ventana.getitemstring(1,1)='' or isnull(dw_ventana.getitemstring(1,1))then return
dw_flujo.setitem(dw_flujo.insertrow(0),'cod_vent',dw_ventana.getitemstring(1,1))

end event

type st_1 from statictext within w_flujo
integer x = 55
integer y = 184
integer width = 640
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Flujos:"
boolean focusrectangle = false
end type

type dw_flujo from datawindow within w_flujo
event p_itemchanged ( )
integer x = 41
integer y = 244
integer width = 5550
integer height = 1392
integer taborder = 20
string title = "none"
string dataobject = "dw_flujo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event p_itemchanged();accepttext()
setitem(getrow(),'codigo',dw_ventana.getitemstring(1,1)+getitemstring(getrow(),'cod_orig')+getitemstring(getrow(),'cod_dest'))
end event

event constructor;settransobject(sqlca)
end event

event itemchanged;if dwo.name='cod_orig' or dwo.name='cod_dest' then
	post event p_itemchanged()
end if
end event

type dw_mod_ori from datawindow within w_flujo
integer x = 41
integer y = 32
integer width = 1371
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_modulos"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
end event

event itemchanged;idw_ventana.retrieve(data)
dw_ventana.setitem(1,1,'')
dw_flujo.reset()
end event

