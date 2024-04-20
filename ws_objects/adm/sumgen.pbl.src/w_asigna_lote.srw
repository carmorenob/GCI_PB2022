$PBExportHeader$w_asigna_lote.srw
forward
global type w_asigna_lote from window
end type
type st_2 from statictext within w_asigna_lote
end type
type pb_3 from picturebutton within w_asigna_lote
end type
type pb_2 from picturebutton within w_asigna_lote
end type
type dw_1 from datawindow within w_asigna_lote
end type
end forward

global type w_asigna_lote from window
integer width = 1888
integer height = 708
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_2 st_2
pb_3 pb_3
pb_2 pb_2
dw_1 dw_1
end type
global w_asigna_lote w_asigna_lote

type variables
st_lote st_temp

end variables

on w_asigna_lote.create
this.st_2=create st_2
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_1=create dw_1
this.Control[]={this.st_2,&
this.pb_3,&
this.pb_2,&
this.dw_1}
end on

on w_asigna_lote.destroy
destroy(this.st_2)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_1)
end on

event open;st_temp = Message.PowerObjectParm
st_2.text=st_temp.codarticulo+' ' +st_temp.codalmacendes
dw_1.insertrow(0)
end event

type st_2 from statictext within w_asigna_lote
integer x = 18
integer y = 20
integer width = 1819
integer height = 96
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
boolean focusrectangle = false
end type

type pb_3 from picturebutton within w_asigna_lote
event mousemove pbm_mousemove
string tag = "Cancelar"
integer x = 846
integer y = 468
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
vtextalign vtextalign = multiline!
string powertiptext = "Cancelar"
end type

event clicked;closewithreturn(parent,'!')


end event

type pb_2 from picturebutton within w_asigna_lote
event mousemove pbm_mousemove
string tag = "Aceptar"
integer x = 686
integer y = 468
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;if dw_1.RowCount() = 0 or dw_1.Getrow() < 1 then Return
long fila
string ls_lote, ls_return='!',ls_con
datetime ld_fv

if messageBox('Aviso','Este proceso asignara lotes a todos los movimientos del inventario esta seguro?',QUESTION!,YESNO!) = 2 then
	closewithreturn(parent,ls_return)
end if
ls_lote=dw_1.getitemstring(1,'lote')
ls_con=dw_1.getitemstring(1,'con')
ld_fv=dw_1.getitemdatetime(1,'fecha_venc')
if g_motor='postgres' then
	SELECT * into :ls_return from sp_sumarticulo_lotes(:st_temp.codarticulo, :ls_lote,:ld_fv,:ls_con);
else
//	////
end if
if ls_return='OK' then
	ls_return='0'
end if
closewithreturn(parent,ls_return)
end event

type dw_1 from datawindow within w_asigna_lote
integer x = 27
integer y = 136
integer width = 1810
integer height = 280
integer taborder = 10
string title = "none"
string dataobject = "dw_lotes_new"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = StyleBox!
end type

event constructor;SetTransObject(SQLCA)
end event

