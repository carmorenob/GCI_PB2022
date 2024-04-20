$PBExportHeader$w_contr_requi.srw
forward
global type w_contr_requi from window
end type
type pb_4 from picturebutton within w_contr_requi
end type
type pb_3 from picturebutton within w_contr_requi
end type
type pb_2 from picturebutton within w_contr_requi
end type
type pb_1 from picturebutton within w_contr_requi
end type
type st_2 from statictext within w_contr_requi
end type
type st_1 from statictext within w_contr_requi
end type
type dw_1 from datawindow within w_contr_requi
end type
type gb_1 from groupbox within w_contr_requi
end type
end forward

global type w_contr_requi from window
integer width = 3154
integer height = 1520
boolean titlebar = true
string title = "Asistente de contratación"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_4 pb_4
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
st_2 st_2
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_contr_requi w_contr_requi

on w_contr_requi.create
this.pb_4=create pb_4
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.st_2=create st_2
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.pb_4,&
this.pb_3,&
this.pb_2,&
this.pb_1,&
this.st_2,&
this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_contr_requi.destroy
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;this.x=250
this.y=800
dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat)
end event

type pb_4 from picturebutton within w_contr_requi
string tag = "Refrescar"
integer x = 1751
integer y = 1280
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "refrescar.gif"
end type

event clicked;dw_1.retrieve(w_contratos.empres,w_contratos.i_contrat)
end event

type pb_3 from picturebutton within w_contr_requi
string tag = "Eliminar"
integer x = 1577
integer y = 1280
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
end type

event clicked;dw_1.deleterow(0)
if dw_1.update()=-1 then
	rollback;
else
	commit;
end if
end event

type pb_2 from picturebutton within w_contr_requi
string tag = "Guardar"
integer x = 1403
integer y = 1280
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
end type

event clicked;if dw_1.update()=-1 then 
	rollback;
else 
	commit;
end if

end event

type pb_1 from picturebutton within w_contr_requi
string tag = "Adicionar"
integer x = 1230
integer y = 1280
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
end type

event clicked;long fila,l_j,donde
dw_1.setfocus()
l_j=dw_1.getitemnumber(1,'maximos')
if isnull(l_j) then l_j=0
l_j=l_j+1
fila=dw_1.insertrow(0)
dw_1.scrolltorow(fila)
dw_1.setitem(fila,"nitem",l_j )
dw_1.setitem(fila,'codemp',w_contratos.empres)
dw_1.setitem(fila,'codcontrato',w_contratos.i_contrat)


	
//for j=1 to dw_1.rowcount()
//	donde=dw_1.find("nitem="+string(j),1,dw_1.rowcount())
//	if donde=0 then exit
//next
//if donde=0 then	
//else
//	dw_1.setitem(fila,"nitem",dw_1.rowcount())
//end if
end event

type st_2 from statictext within w_contr_requi
integer x = 114
integer y = 116
integer width = 2953
integer height = 204
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 134217752
string text = "Hay datos importantes que son propios de cada contrato, por ejemplo documentos que acompañan a la factura, que exigen firma y huella.   en este momento usted puede cargar la base de datos con aspectos importantes del contrato que a los usuarios del programa le pueden ser de gran utilidad."
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_contr_requi
integer x = 119
integer y = 4
integer width = 1024
integer height = 112
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8388608
long backcolor = 67108864
string text = "Requisitos de contrato"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_contr_requi
integer x = 128
integer y = 404
integer width = 2935
integer height = 816
integer taborder = 10
string title = "none"
string dataobject = "dw_contra_requi"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;dw_1.settransobject(SQLCA)
end event

type gb_1 from groupbox within w_contr_requi
integer x = 105
integer y = 332
integer width = 2985
integer height = 924
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217750
string text = "Aspectos importantes"
borderstyle borderstyle = styleraised!
end type

