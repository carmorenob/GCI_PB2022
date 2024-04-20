$PBExportHeader$w_edita_campo_apdx.srw
forward
global type w_edita_campo_apdx from window
end type
type pb_1 from picturebutton within w_edita_campo_apdx
end type
type pb_2 from picturebutton within w_edita_campo_apdx
end type
type pb_ok from picturebutton within w_edita_campo_apdx
end type
type mle_1 from multilineedit within w_edita_campo_apdx
end type
end forward

global type w_edita_campo_apdx from window
integer width = 3447
integer height = 2048
boolean titlebar = true
string title = "Edición de campo"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "contrato.ico"
boolean center = true
pb_1 pb_1
pb_2 pb_2
pb_ok pb_ok
mle_1 mle_1
end type
global w_edita_campo_apdx w_edita_campo_apdx

type variables
st_rte i_st
string i_retorna='!'
end variables

event close;closewithreturn(this,i_retorna)
end event

event open;i_st=message.powerobjectparm
if i_st.c_otro='7' then
	pb_1.enabled=false
else
	pb_1.enabled=true
end if
mle_1.text=i_st.empresa
mle_1.Alignment = Justify!
end event

on w_edita_campo_apdx.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.pb_ok=create pb_ok
this.mle_1=create mle_1
this.Control[]={this.pb_1,&
this.pb_2,&
this.pb_ok,&
this.mle_1}
end on

on w_edita_campo_apdx.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.pb_ok)
destroy(this.mle_1)
end on

type pb_1 from picturebutton within w_edita_campo_apdx
integer x = 1856
integer y = 1820
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "editar.GIF"
alignment htextalign = left!
string powertiptext = "Plantilla"
end type

event clicked;I_st.mle=mle_1
openwithparm(w_plants_txt_campos,i_st)

end event

type pb_2 from picturebutton within w_edita_campo_apdx
integer x = 1687
integer y = 1820
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "          &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_edita_campo_apdx
integer x = 1518
integer y = 1820
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "            &a"
boolean default = true
boolean originalsize = true
string picturename = "Aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;i_retorna=mle_1.text
close(parent)
end event

type mle_1 from multilineedit within w_edita_campo_apdx
integer width = 3438
integer height = 1796
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 33554431
boolean border = false
boolean vscrollbar = true
boolean autovscroll = true
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

