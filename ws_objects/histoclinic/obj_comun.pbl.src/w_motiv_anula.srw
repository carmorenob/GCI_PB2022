$PBExportHeader$w_motiv_anula.srw
forward
global type w_motiv_anula from window
end type
type st_2 from statictext within w_motiv_anula
end type
type st_1 from statictext within w_motiv_anula
end type
type dw_anula from datawindow within w_motiv_anula
end type
type pb_2 from picturebutton within w_motiv_anula
end type
type pb_1 from picturebutton within w_motiv_anula
end type
type mle_1 from multilineedit within w_motiv_anula
end type
end forward

global type w_motiv_anula from window
integer width = 1765
integer height = 880
boolean titlebar = true
string title = "Motivo de Anulación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "question!"
boolean center = true
st_2 st_2
st_1 st_1
dw_anula dw_anula
pb_2 pb_2
pb_1 pb_1
mle_1 mle_1
end type
global w_motiv_anula w_motiv_anula

type variables
st_xa_anular st_anulacion
datawindowchild dw_tipos
end variables

on w_motiv_anula.create
this.st_2=create st_2
this.st_1=create st_1
this.dw_anula=create dw_anula
this.pb_2=create pb_2
this.pb_1=create pb_1
this.mle_1=create mle_1
this.Control[]={this.st_2,&
this.st_1,&
this.dw_anula,&
this.pb_2,&
this.pb_1,&
this.mle_1}
end on

on w_motiv_anula.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_anula)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.mle_1)
end on

event open;st_anulacion = Message.PowerObjectParm

//dw_tipos.SetFilter("tipo='"+st_anulacion.tipo+"'")
//dw_tipos.Filter()
dw_tipos.retrieve(st_anulacion.tipo)
dw_anula.insertrow(1)
end event

type st_2 from statictext within w_motiv_anula
integer x = 37
integer y = 200
integer width = 379
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "JUSTIFICACION"
boolean focusrectangle = false
end type

type st_1 from statictext within w_motiv_anula
integer x = 32
integer y = 4
integer width = 233
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "CAUSA"
boolean focusrectangle = false
end type

type dw_anula from datawindow within w_motiv_anula
integer x = 23
integer y = 72
integer width = 1696
integer height = 84
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_anula',dw_tipos)
dw_tipos.settransobject(sqlca)

end event

type pb_2 from picturebutton within w_motiv_anula
integer x = 901
integer y = 632
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parenT)
end event

type pb_1 from picturebutton within w_motiv_anula
integer x = 727
integer y = 632
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if trim(dw_anula.getitemstring(dw_anula.getrow(),'cod_anula'))=''  or   isnull(dw_anula.getitemstring(dw_anula.getrow(),'cod_anula')) then 
	messagebox('Atención','Campo Causa Obligatorio')
	return
end if
if trim(mle_1.text)='' then return
st_anulacion. motivo=dw_anula.getitemstring(dw_anula.getrow(),'cod_anula')
st_anulacion.observacion=mle_1.text
st_anulacion.nombre=dw_tipos.getitemstring(dw_tipos.getrow(),'des_motivo')
closewithreturn(parent,st_anulacion)


end event

type mle_1 from multilineedit within w_motiv_anula
integer x = 27
integer y = 264
integer width = 1691
integer height = 348
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15793151
integer limit = 255
borderstyle borderstyle = stylelowered!
end type

