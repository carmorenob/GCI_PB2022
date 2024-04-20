$PBExportHeader$w_recuerda_cita.srw
forward
global type w_recuerda_cita from window
end type
type rte_1 from richtextedit within w_recuerda_cita
end type
type pb_3 from picturebutton within w_recuerda_cita
end type
type pb_2 from picturebutton within w_recuerda_cita
end type
type dw_1 from datawindow within w_recuerda_cita
end type
type pb_1 from picturebutton within w_recuerda_cita
end type
type em_hasta from editmask within w_recuerda_cita
end type
type em_desde from editmask within w_recuerda_cita
end type
type st_2 from statictext within w_recuerda_cita
end type
type st_1 from statictext within w_recuerda_cita
end type
type gb_1 from groupbox within w_recuerda_cita
end type
end forward

global type w_recuerda_cita from window
integer width = 4850
integer height = 1612
boolean titlebar = true
string title = "Recordatorio Citas"
boolean controlmenu = true
long backcolor = 67108864
string icon = "recorda.ico"
boolean center = true
rte_1 rte_1
pb_3 pb_3
pb_2 pb_2
dw_1 dw_1
pb_1 pb_1
em_hasta em_hasta
em_desde em_desde
st_2 st_2
st_1 st_1
gb_1 gb_1
end type
global w_recuerda_cita w_recuerda_cita

on w_recuerda_cita.create
this.rte_1=create rte_1
this.pb_3=create pb_3
this.pb_2=create pb_2
this.dw_1=create dw_1
this.pb_1=create pb_1
this.em_hasta=create em_hasta
this.em_desde=create em_desde
this.st_2=create st_2
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.rte_1,&
this.pb_3,&
this.pb_2,&
this.dw_1,&
this.pb_1,&
this.em_hasta,&
this.em_desde,&
this.st_2,&
this.st_1,&
this.gb_1}
end on

on w_recuerda_cita.destroy
destroy(this.rte_1)
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.dw_1)
destroy(this.pb_1)
destroy(this.em_hasta)
destroy(this.em_desde)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;if g_motor='postgres' then
	dw_1.dataobject='dw_recuerda_cita_fecha_postgres'
else
	dw_1.dataobject='dw_recuerda_cita_fecha'
end if
dw_1.settransobject(sqlca)

end event

type rte_1 from richtextedit within w_recuerda_cita
boolean visible = false
integer x = 2007
integer y = 60
integer width = 343
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type pb_3 from picturebutton within w_recuerda_cita
integer x = 1637
integer y = 56
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
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;close(parent)
end event

type pb_2 from picturebutton within w_recuerda_cita
integer x = 1458
integer y = 48
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "envia_mail.jpg"
alignment htextalign = left!
end type

event clicked;string i_clug,em,ncom
int l_cita,l_ci
double ncita

for l_ci=1 to dw_1.rowcount()
  em=dw_1.getitemstring(l_ci,"email")
  ncita=dw_1.getitemnumber(l_ci,"ncita")
  i_clug=dw_1.getitemstring(l_ci,"clugar")
  ncom=dw_1.getitemstring(l_ci,"nombre_completo")
  em= f_recuerda_cita(ncita,i_clug,'G',em,rte_1,false,ncom)
  if em='Correo Enviado Satisfactoriamente' then
	dw_1.setitem(l_ci,'enviado',1)
  else
	dw_1.setitem(l_ci,'enviado',2)
  end if
  dw_1.setitem(l_ci,'error',em)
next
messagebox('Atencíon','Proceso Finalizado')
end event

type dw_1 from datawindow within w_recuerda_cita
integer x = 46
integer y = 224
integer width = 4754
integer height = 1212
integer taborder = 20
string title = "none"
string dataobject = "dw_recuerda_cita_fecha"
boolean hscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type pb_1 from picturebutton within w_recuerda_cita
integer x = 1289
integer y = 52
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
string picturename = "refrescar.GIF"
alignment htextalign = left!
end type

event clicked;dw_1.retrieve(date(em_desde.text),date(em_hasta.text))
end event

type em_hasta from editmask within w_recuerda_cita
integer x = 832
integer y = 68
integer width = 366
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string minmax = "~~"
end type

event constructor;text = string(today(),'dd-mm-yyyy')
end event

type em_desde from editmask within w_recuerda_cita
integer x = 261
integer y = 68
integer width = 366
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
string minmax = "~~"
end type

event constructor;text = string(today(),'dd-mm-yyyy')
end event

type st_2 from statictext within w_recuerda_cita
integer x = 654
integer y = 72
integer width = 201
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type st_1 from statictext within w_recuerda_cita
integer x = 73
integer y = 72
integer width = 201
integer height = 68
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_recuerda_cita
integer x = 23
integer width = 1947
integer height = 212
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterios"
end type

