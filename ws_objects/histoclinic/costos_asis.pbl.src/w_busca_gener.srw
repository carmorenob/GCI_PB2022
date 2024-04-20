$PBExportHeader$w_busca_gener.srw
forward
global type w_busca_gener from window
end type
type pb_2 from picturebutton within w_busca_gener
end type
type pb_1 from picturebutton within w_busca_gener
end type
type st_2 from statictext within w_busca_gener
end type
type sle_1 from singlelineedit within w_busca_gener
end type
type st_1 from statictext within w_busca_gener
end type
type dw_1 from datawindow within w_busca_gener
end type
end forward

global type w_busca_gener from window
integer width = 2798
integer height = 1308
boolean titlebar = true
string title = "Buscar Genéricos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
st_2 st_2
sle_1 sle_1
st_1 st_1
dw_1 dw_1
end type
global w_busca_gener w_busca_gener

type variables
datawindow i_dw
singlelineedit i_sle
end variables

on w_busca_gener.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.st_2,&
this.sle_1,&
this.st_1,&
this.dw_1}
end on

on w_busca_gener.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_1)
end on

event open;if message.powerobjectparm.typeof()=singlelineedit! then
	i_sle=message.powerobjectparm
else
	i_dw=message.powerobjectparm
end if
end event

type pb_2 from picturebutton within w_busca_gener
integer x = 1362
integer y = 1088
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_busca_gener
integer x = 1207
integer y = 1088
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
if isnull(dw_1.getitemstring(dw_1.getrow(),'cod_insumo')) then
	messagebox('Atención','Este genérico no está asociado a un insumo no lo puede utilizar')
	return
end if
if isvalid(i_dw) then
	i_dw.setitem(i_dw.getrow(),'c_medica',dw_1.getitemstring(dw_1.getrow(),'c_medica'))
	i_dw.event itemchanged(i_dw.getrow(),i_dw.object.cod_insumo,dw_1.getitemstring(dw_1.getrow(),'cod_insumo'))
	i_dw.setitem(i_dw.getrow(),'medicamento',dw_1.getitemstring(dw_1.getrow(),'medicamento'))
	i_dw.event itemchanged(i_dw.getrow(),i_dw.object.medicamento,dw_1.getitemstring(dw_1.getrow(),'medicamento'))
else
	i_sle.text=dw_1.getitemstring(dw_1.getrow(),'c_medica')
	i_sle.event modified()
end if
close(parent)
end event

type st_2 from statictext within w_busca_gener
integer x = 9
integer y = 196
integer width = 530
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Genéricos encontrados:"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_gener
integer x = 5
integer y = 64
integer width = 2752
integer height = 88
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event modified;if dw_1.retrieve('%'+text+'%')=0 then
	messagebox('Atención','No hay registros con esta condición')
end if
end event

type st_1 from statictext within w_busca_gener
integer x = 18
integer width = 832
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Condición de búsqueda (Descripción):"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_busca_gener
integer x = 5
integer y = 256
integer width = 2747
integer height = 800
integer taborder = 20
string title = "none"
string dataobject = "dw_xa_buscar_gener"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;pb_1.event clicked()
end event

