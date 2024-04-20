$PBExportHeader$w_escoge_empresa_qx.srw
forward
global type w_escoge_empresa_qx from window
end type
type pb_2 from picturebutton within w_escoge_empresa_qx
end type
type pb_1 from picturebutton within w_escoge_empresa_qx
end type
type mle_1 from multilineedit within w_escoge_empresa_qx
end type
type dw_1 from datawindow within w_escoge_empresa_qx
end type
end forward

global type w_escoge_empresa_qx from window
integer width = 2542
integer height = 1048
boolean titlebar = true
string title = "Escoger Empresa"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
mle_1 mle_1
dw_1 dw_1
end type
global w_escoge_empresa_qx w_escoge_empresa_qx

type variables
st_busca_emp_capit pa_emp
end variables

on w_escoge_empresa_qx.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.mle_1=create mle_1
this.dw_1=create dw_1
this.Control[]={this.pb_2,&
this.pb_1,&
this.mle_1,&
this.dw_1}
end on

on w_escoge_empresa_qx.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.mle_1)
destroy(this.dw_1)
end on

event open;dw_1.retrieve(tipdoc,docu)
end event

type pb_2 from picturebutton within w_escoge_empresa_qx
integer x = 1248
integer y = 788
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
end type

event clicked;setnull(pa_emp.emp)
setnull(pa_emp.cont)
closewithreturn(parent,pa_emp)

end event

type pb_1 from picturebutton within w_escoge_empresa_qx
integer x = 1083
integer y = 788
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "        &a"
boolean default = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;dw_1.triggerevent(doubleclicked!)
end event

type mle_1 from multilineedit within w_escoge_empresa_qx
integer x = 73
integer y = 32
integer width = 2386
integer height = 176
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 134217752
string text = "Elija la empresa la cual sera resposable de la Qx. Escoja  la fila y de Doble Click o <Enter>"
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_escoge_empresa_qx
integer x = 59
integer y = 252
integer width = 2418
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_empresa_cont_salas"
boolean controlmenu = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if dw_1.getrow()<1 then return 
if isnull(dw_1.getitemstring(row,'codemp')) then
	messagebox('Atención','Seleccione Empresa de la  Lista dano doble click')
	 return
end if
pa_emp.emp=dw_1.getitemstring(row,'codemp')
pa_emp.cont=dw_1.getitemstring(row,'codcontrato')
closewithreturn(parent,pa_emp)
end event

event constructor;settransobject(sqlca)

end event

