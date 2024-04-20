$PBExportHeader$w_nom_tablero.srw
forward
global type w_nom_tablero from window
end type
type dw_vmes from datawindow within w_nom_tablero
end type
type st_3 from statictext within w_nom_tablero
end type
type em_mes2 from editmask within w_nom_tablero
end type
type st_2 from statictext within w_nom_tablero
end type
type em_mes1 from editmask within w_nom_tablero
end type
type em_anyo from editmask within w_nom_tablero
end type
type fec_2 from editmask within w_nom_tablero
end type
type fec_1 from editmask within w_nom_tablero
end type
type st_1 from statictext within w_nom_tablero
end type
type dw_aus from datawindow within w_nom_tablero
end type
type r_1 from rectangle within w_nom_tablero
end type
end forward

global type w_nom_tablero from window
integer width = 3840
integer height = 1888
boolean titlebar = true
string title = "Tablero Recurso Humano"
boolean controlmenu = true
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "trhumano.ico"
boolean clientedge = true
boolean center = true
dw_vmes dw_vmes
st_3 st_3
em_mes2 em_mes2
st_2 st_2
em_mes1 em_mes1
em_anyo em_anyo
fec_2 fec_2
fec_1 fec_1
st_1 st_1
dw_aus dw_aus
r_1 r_1
end type
global w_nom_tablero w_nom_tablero

forward prototypes
public subroutine filtra ()
end prototypes

public subroutine filtra ();fec_1.text=string('01/'+em_mes1.text+'/'+em_anyo.text)
fec_2.text=string(relativedate(date(string('01/'+string(long(em_mes2.text)+1))+'/'+em_anyo.text),-1))

dw_aus.retrieve(datetime(fec_1.text),datetime(fec_2.text))
dw_vmes.retrieve(double(em_anyo.text),double(em_mes1.text),double(em_mes2.text))
end subroutine

on w_nom_tablero.create
this.dw_vmes=create dw_vmes
this.st_3=create st_3
this.em_mes2=create em_mes2
this.st_2=create st_2
this.em_mes1=create em_mes1
this.em_anyo=create em_anyo
this.fec_2=create fec_2
this.fec_1=create fec_1
this.st_1=create st_1
this.dw_aus=create dw_aus
this.r_1=create r_1
this.Control[]={this.dw_vmes,&
this.st_3,&
this.em_mes2,&
this.st_2,&
this.em_mes1,&
this.em_anyo,&
this.fec_2,&
this.fec_1,&
this.st_1,&
this.dw_aus,&
this.r_1}
end on

on w_nom_tablero.destroy
destroy(this.dw_vmes)
destroy(this.st_3)
destroy(this.em_mes2)
destroy(this.st_2)
destroy(this.em_mes1)
destroy(this.em_anyo)
destroy(this.fec_2)
destroy(this.fec_1)
destroy(this.st_1)
destroy(this.dw_aus)
destroy(this.r_1)
end on

event open;filtra()
end event

type dw_vmes from datawindow within w_nom_tablero
integer x = 1865
integer y = 232
integer width = 1801
integer height = 1088
integer taborder = 20
string title = "none"
string dataobject = "dw_nom_tab_valormes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type st_3 from statictext within w_nom_tablero
integer x = 992
integer y = 28
integer width = 128
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes2"
boolean focusrectangle = false
end type

type em_mes2 from editmask within w_nom_tablero
integer x = 1125
integer y = 20
integer width = 229
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "#####"
boolean spin = true
double increment = 1
string minmax = "1~~12"
end type

event constructor;em_mes2.text=string(month(today()))
//fec_2.text=string(relativedate(date(string('01/'+string(month(today())+1)+'/'+string(year(today())))),-1))
end event

event modified;filtra()
end event

type st_2 from statictext within w_nom_tablero
integer x = 530
integer y = 28
integer width = 128
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mes1"
boolean focusrectangle = false
end type

type em_mes1 from editmask within w_nom_tablero
integer x = 672
integer y = 20
integer width = 229
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
string mask = "#####"
boolean spin = true
double increment = 1
string minmax = "1~~12"
end type

event constructor;em_mes1.text=string(month(today()))
//fec_1.text=string('01/'+string(month(today()))+'/'+string(year(today())))
end event

event modified;filtra()
end event

type em_anyo from editmask within w_nom_tablero
integer x = 165
integer y = 20
integer width = 311
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
string mask = "#####"
boolean spin = true
double increment = 1
string minmax = "2015~~2050"
end type

event constructor;em_anyo.text=string(year(today()))
end event

event modified;filtra()
end event

type fec_2 from editmask within w_nom_tablero
boolean visible = false
integer x = 2373
integer y = 20
integer width = 370
integer height = 80
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event modified;//filtre()
end event

type fec_1 from editmask within w_nom_tablero
boolean visible = false
integer x = 1966
integer y = 24
integer width = 402
integer height = 80
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
double increment = 1
end type

event modified;//filtre()
end event

type st_1 from statictext within w_nom_tablero
integer x = 50
integer y = 32
integer width = 105
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Año"
boolean focusrectangle = false
end type

type dw_aus from datawindow within w_nom_tablero
integer x = 18
integer y = 228
integer width = 1801
integer height = 1088
integer taborder = 10
string title = "none"
string dataobject = "dw_nom_tab_ausentismo"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type r_1 from rectangle within w_nom_tablero
long linecolor = 16777215
integer linethickness = 5
long fillcolor = 67108864
integer x = 23
integer y = 8
integer width = 1623
integer height = 112
end type

