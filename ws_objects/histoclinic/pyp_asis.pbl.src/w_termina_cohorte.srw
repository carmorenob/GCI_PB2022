$PBExportHeader$w_termina_cohorte.srw
forward
global type w_termina_cohorte from window
end type
type st_3 from statictext within w_termina_cohorte
end type
type dw_anul from datawindow within w_termina_cohorte
end type
type pb_cancel from picturebutton within w_termina_cohorte
end type
type pb_ok from picturebutton within w_termina_cohorte
end type
type st_2 from statictext within w_termina_cohorte
end type
type dp_1 from datepicker within w_termina_cohorte
end type
type st_1 from statictext within w_termina_cohorte
end type
type mle_1 from multilineedit within w_termina_cohorte
end type
type gb_2 from groupbox within w_termina_cohorte
end type
end forward

global type w_termina_cohorte from window
integer width = 2487
integer height = 1444
boolean titlebar = true
string title = "Terminar Cohorte de Paciente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_3 st_3
dw_anul dw_anul
pb_cancel pb_cancel
pb_ok pb_ok
st_2 st_2
dp_1 dp_1
st_1 st_1
mle_1 mle_1
gb_2 gb_2
end type
global w_termina_cohorte w_termina_cohorte

type variables
datawindowchild dw_tipofac
string cohorte
end variables

on w_termina_cohorte.create
this.st_3=create st_3
this.dw_anul=create dw_anul
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.st_2=create st_2
this.dp_1=create dp_1
this.st_1=create st_1
this.mle_1=create mle_1
this.gb_2=create gb_2
this.Control[]={this.st_3,&
this.dw_anul,&
this.pb_cancel,&
this.pb_ok,&
this.st_2,&
this.dp_1,&
this.st_1,&
this.mle_1,&
this.gb_2}
end on

on w_termina_cohorte.destroy
destroy(this.st_3)
destroy(this.dw_anul)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.st_2)
destroy(this.dp_1)
destroy(this.st_1)
destroy(this.mle_1)
destroy(this.gb_2)
end on

event open;cohorte=Message.StringParm
dw_tipofac.retrieve(cohorte)
dw_anul.insertrow(1)

end event

type st_3 from statictext within w_termina_cohorte
integer x = 101
integer y = 192
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fecha"
boolean focusrectangle = false
end type

type dw_anul from datawindow within w_termina_cohorte
integer x = 695
integer y = 100
integer width = 1696
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_combo_anula"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
getchild('cod_anula',dw_tipofac)
dw_tipofac.settransobject(sqlca)
dw_tipofac.retrieve(cohorte)
dw_anul.insertrow(1)

end event

type pb_cancel from picturebutton within w_termina_cohorte
integer x = 1234
integer y = 1196
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -8
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

event clicked;close(parent)
end event

type pb_ok from picturebutton within w_termina_cohorte
integer x = 1042
integer y = 1196
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
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

event clicked;if mle_1.text="" then
	messagebox("Atención","Debe digitar las Observaciones")
	return
end if
if trim(dw_anul.getitemstring(dw_anul.getrow(),'cod_anula'))='' or isnull(dw_anul.getitemstring(dw_anul.getrow(),'cod_anula')) then 
	messagebox('Atención','Campo Motivo Obligatorio')
	return
end if
st_add_cohorte lst
lst.fecha_inicio=dp_1.value
lst.observaciones=mle_1.text
lst.cod_anula=dw_anul.getitemstring(dw_anul.getrow(),'cod_anula')
closewithreturn(parent, lst)
end event

type st_2 from statictext within w_termina_cohorte
integer x = 709
integer y = 184
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo"
boolean focusrectangle = false
end type

type dp_1 from datepicker within w_termina_cohorte
integer x = 91
integer y = 92
integer width = 549
integer height = 100
integer taborder = 10
boolean border = true
borderstyle borderstyle = stylelowered!
datetimeformat format = dtfcustom!
string customformat = "yyyy-MM-dd"
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2023-06-03"), Time("14:52:50.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type st_1 from statictext within w_termina_cohorte
integer x = 64
integer y = 276
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones"
boolean focusrectangle = false
end type

type mle_1 from multilineedit within w_termina_cohorte
integer x = 59
integer y = 348
integer width = 2331
integer height = 780
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
end type

type gb_2 from groupbox within w_termina_cohorte
integer x = 32
integer y = 12
integer width = 2377
integer height = 256
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Detalle Salida"
borderstyle borderstyle = styleraised!
end type

