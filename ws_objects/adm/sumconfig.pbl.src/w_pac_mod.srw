$PBExportHeader$w_pac_mod.srw
forward
global type w_pac_mod from window
end type
type st_1 from statictext within w_pac_mod
end type
type pb_cancelar from picturebutton within w_pac_mod
end type
type pb_grabardef from picturebutton within w_pac_mod
end type
type dw_1 from datawindow within w_pac_mod
end type
end forward

global type w_pac_mod from window
integer width = 1463
integer height = 1608
boolean titlebar = true
string title = "Modificación PAC"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
pb_cancelar pb_cancelar
pb_grabardef pb_grabardef
dw_1 dw_1
end type
global w_pac_mod w_pac_mod

type variables
Datawindow dw_obj

end variables

on w_pac_mod.create
this.st_1=create st_1
this.pb_cancelar=create pb_cancelar
this.pb_grabardef=create pb_grabardef
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.pb_cancelar,&
this.pb_grabardef,&
this.dw_1}
end on

on w_pac_mod.destroy
destroy(this.st_1)
destroy(this.pb_cancelar)
destroy(this.pb_grabardef)
destroy(this.dw_1)
end on

event open;dw_obj = Message.PowerObjectParm
if dw_obj.RowCount() = 0 then Return 0
dw_1.Retrieve(dw_obj.GetItemString(dw_obj.GetRow(),'codalmacen'), dw_obj.GetItemNumber(dw_obj.GetRow(),'ano'), dw_obj.GetItemNumber(dw_obj.GetRow(),'item'), dw_obj.GetItemString(dw_obj.GetRow(),'codgenerico') )

end event

type st_1 from statictext within w_pac_mod
integer x = 667
integer y = 1304
integer width = 741
integer height = 212
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217752
string text = "Debe balancear los valores entre los meses para conseguir el total. Si desea cambiarlo debe tener permisos sobre el botón guardar"
boolean focusrectangle = false
end type

type pb_cancelar from picturebutton within w_pac_mod
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 347
integer y = 1320
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
string picturename = "Cancelar.gif"
string disabledname = "d_Cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_grabardef from picturebutton within w_pac_mod
event mousemove pbm_mousemove
string tag = "GrabarTemporal"
integer x = 494
integer y = 1320
integer width = 142
integer height = 124
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "GrabarTemporal"
end type

event clicked;long f
string ca
if dw_1.AcceptText() = -1 then Return -1
if dw_1.GetItemNumber(1,'compute_1') <  dw_1.GetItemNumber(1,'compute_2') then
	MessageBox('Atención','No puede modificar por ser mayor lo consumido que lo planeado')
	Return -1
elseif dw_1.GetItemNumber(1,'total') <> dw_1.GetItemNumber(1,'compute_1') then
	if f_sol_permiso(this,'PAC') <> 1 then Return
end if
if dw_1.Update() = -1 then
	Rollback;
end if

w_pac.dw_paccab.TriggerEvent(rowfocuschanged!)
f = w_pac.dw_paccpo.Find("codgenerico='"+dw_1.GetItemString(1,'codgenerico')+"'",1,w_pac.dw_paccpo.RowCount())
if f> 0 then
	w_pac.dw_paccpo.Scrolltorow(f)
end if
close(parent)

end event

type dw_1 from datawindow within w_pac_mod
integer x = 119
integer y = 28
integer width = 1093
integer height = 1264
integer taborder = 10
string title = "none"
string dataobject = "dw_paccpo_mod"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

