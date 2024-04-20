$PBExportHeader$w_motivos_notas.srw
forward
global type w_motivos_notas from window
end type
type pb_2 from picturebutton within w_motivos_notas
end type
type pb_1 from picturebutton within w_motivos_notas
end type
type mle_1 from multilineedit within w_motivos_notas
end type
type dw_anul from datawindow within w_motivos_notas
end type
type gb_2 from groupbox within w_motivos_notas
end type
end forward

global type w_motivos_notas from window
integer width = 1888
integer height = 1496
boolean titlebar = true
string title = "Motivo Notas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_2 pb_2
pb_1 pb_1
mle_1 mle_1
dw_anul dw_anul
gb_2 gb_2
end type
global w_motivos_notas w_motivos_notas

type variables
st_anula anular
st_xa_anular st_anulacion
datawindowchild idw_tipofac
end variables
on w_motivos_notas.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.mle_1=create mle_1
this.dw_anul=create dw_anul
this.gb_2=create gb_2
this.Control[]={this.pb_2,&
this.pb_1,&
this.mle_1,&
this.dw_anul,&
this.gb_2}
end on

on w_motivos_notas.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.dw_anul)
destroy(this.gb_2)
end on

event open;anular=message.powerobjectparm
if anular.de_donde='objeto' then
	dw_anul.visible=false
	mle_1.y=72
	title='Objeto de la Factura'
	gb_2.text='Objeto de la Factura'
else
	mle_1.y=180
	dw_anul.visible=true
	title='Motivo Nota'
	gb_2.text='Motivo Nota'	
end if

end event

type pb_2 from picturebutton within w_motivos_notas
integer x = 937
integer y = 1240
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_motivos_notas
integer x = 759
integer y = 1240
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "         &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;if mle_1.text='' and anular.de_donde<>'objeto' then
	messagebox("Atención","El motivo de la anulación no puede ser nulo")
	return
end if
end event

type mle_1 from multilineedit within w_motivos_notas
integer x = 27
integer y = 160
integer width = 1733
integer height = 1028
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 255
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type dw_anul from datawindow within w_motivos_notas
integer x = 23
integer y = 72
integer width = 1696
integer height = 84
integer taborder = 20
string title = "none"
string dataobject = "dw_combo_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_anula',idw_tipofac)
idw_tipofac.settransobject(sqlca)
idw_tipofac.retrieve('FC')
dw_anul.insertrow(1)

end event

type gb_2 from groupbox within w_motivos_notas
integer width = 1797
integer height = 1220
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motivo Nota:"
borderstyle borderstyle = styleraised!
end type

