$PBExportHeader$w_tablero_urgencias.srw
forward
global type w_tablero_urgencias from window
end type
type tab_1 from tab within w_tablero_urgencias
end type
type tg from userobject within tab_1
end type
type dw_7 from datawindow within tg
end type
type dw_8 from datawindow within tg
end type
type dw_6 from datawindow within tg
end type
type tg from userobject within tab_1
dw_7 dw_7
dw_8 dw_8
dw_6 dw_6
end type
type tgr from userobject within tab_1
end type
type st_6 from statictext within tgr
end type
type st_4 from statictext within tgr
end type
type dw_9 from datawindow within tgr
end type
type dw_10 from datawindow within tgr
end type
type tgr from userobject within tab_1
st_6 st_6
st_4 st_4
dw_9 dw_9
dw_10 dw_10
end type
type tab_1 from tab within w_tablero_urgencias
tg tg
tgr tgr
end type
type fec_2 from editmask within w_tablero_urgencias
end type
type fec_1 from editmask within w_tablero_urgencias
end type
type dw_4 from datawindow within w_tablero_urgencias
end type
type r_1 from rectangle within w_tablero_urgencias
end type
type st_3 from statictext within w_tablero_urgencias
end type
type st_2 from statictext within w_tablero_urgencias
end type
type st_1 from statictext within w_tablero_urgencias
end type
type dw_2 from datawindow within w_tablero_urgencias
end type
type dw_1 from datawindow within w_tablero_urgencias
end type
type dw_5 from datawindow within w_tablero_urgencias
end type
type dw_3 from datawindow within w_tablero_urgencias
end type
end forward

global type w_tablero_urgencias from window
integer width = 6171
integer height = 2700
boolean titlebar = true
string title = "Tablero en Tiempo Real Urgencias"
boolean controlmenu = true
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "turgencias.ico"
tab_1 tab_1
fec_2 fec_2
fec_1 fec_1
dw_4 dw_4
r_1 r_1
st_3 st_3
st_2 st_2
st_1 st_1
dw_2 dw_2
dw_1 dw_1
dw_5 dw_5
dw_3 dw_3
end type
global w_tablero_urgencias w_tablero_urgencias

type variables
string ls_xlugar
DataWindowChild idw_lugt

end variables

forward prototypes
public subroutine filtre ()
end prototypes

public subroutine filtre ();dw_1.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
dw_2.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
dw_4.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
dw_5.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
tab_1.tg.dw_6.retrieve(relativedate(date(fec_1.text),-1),date(fec_1.text),ls_xlugar)
tab_1.tg.dw_7.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
tab_1.tg.dw_8.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
tab_1.tgr.dw_9.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
tab_1.tgr.dw_10.retrieve(date(fec_1.text),date(fec_2.text),ls_xlugar)
timer(80)

end subroutine

on w_tablero_urgencias.create
this.tab_1=create tab_1
this.fec_2=create fec_2
this.fec_1=create fec_1
this.dw_4=create dw_4
this.r_1=create r_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.dw_5=create dw_5
this.dw_3=create dw_3
this.Control[]={this.tab_1,&
this.fec_2,&
this.fec_1,&
this.dw_4,&
this.r_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.dw_2,&
this.dw_1,&
this.dw_5,&
this.dw_3}
end on

on w_tablero_urgencias.destroy
destroy(this.tab_1)
destroy(this.fec_2)
destroy(this.fec_1)
destroy(this.dw_4)
destroy(this.r_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.dw_5)
destroy(this.dw_3)
end on

event open;if g_motor='sql' then
	dw_1.dataobject='dw_tab_tiempo_espera_triagge_sql'
	dw_2.dataobject='dw_tab_tiempo_espera_consulta_sql'
	dw_4.dataobject='dw_tab_tiempo_espera_pacientes_sql'
end if
if g_motor='postgres' then
	dw_1.dataobject='dw_tab_tiempo_espera_triagge_postgres'
	dw_2.dataobject='dw_tab_tiempo_espera_consulta_postgres'
	dw_4.dataobject='dw_tab_tiempo_espera_pacientes_postgres'	
	dw_5.dataobject='dw_tab_tiempo_espera_consulta_pacientes_postgres'
	
end if
if g_motor='anywhere' then
	dw_1.dataobject='dw_tab_tiempo_espera_triagge'
	dw_2.dataobject='dw_tab_tiempo_espera_consulta'
	dw_4.dataobject='dw_tab_tiempo_espera_pacientes'	
end if
dw_1.settransobject(sqlca)
dw_2.settransobject(sqlca)
dw_4.settransobject(sqlca)
dw_5.settransobject(sqlca)
w_principal.dw_1.visible=false
int ll_find

ll_find =idw_lugt.find("codlugar='"+clugar+"'",1,idw_lugt.rowcount())
if idw_lugt.getitemstring(ll_find,'prim')='1' then
	ls_xlugar='%'
else
	ls_xlugar=clugar
end if
filtre()
filtre()
//m_principal.visible=false

end event

event close;w_principal.dw_1.visible=true
//m_principal.visible=true

end event

event timer;timer(0)
filtre()
end event

type tab_1 from tab within w_tablero_urgencias
integer x = 41
integer y = 1340
integer width = 6016
integer height = 1148
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean showtext = false
tabposition tabposition = tabsonleft!
integer selectedtab = 1
tg tg
tgr tgr
end type

on tab_1.create
this.tg=create tg
this.tgr=create tgr
this.Control[]={this.tg,&
this.tgr}
end on

on tab_1.destroy
destroy(this.tg)
destroy(this.tgr)
end on

type tg from userobject within tab_1
event create ( )
event destroy ( )
integer x = 128
integer y = 16
integer width = 5870
integer height = 1116
long backcolor = 67108864
string text = "Graficas"
long tabtextcolor = 33554432
string picturename = "tbl_urgencias.ico"
long picturemaskcolor = 536870912
dw_7 dw_7
dw_8 dw_8
dw_6 dw_6
end type

on tg.create
this.dw_7=create dw_7
this.dw_8=create dw_8
this.dw_6=create dw_6
this.Control[]={this.dw_7,&
this.dw_8,&
this.dw_6}
end on

on tg.destroy
destroy(this.dw_7)
destroy(this.dw_8)
destroy(this.dw_6)
end on

type dw_7 from datawindow within tg
integer x = 3936
integer y = 16
integer width = 1902
integer height = 1084
integer taborder = 60
string title = "none"
string dataobject = "dw_tab_atenciones_observa"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_8 from datawindow within tg
integer x = 1989
integer y = 16
integer width = 1902
integer height = 1088
integer taborder = 50
string title = "none"
string dataobject = "dw_tab_clase_adm"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_6 from datawindow within tg
integer x = 27
integer y = 16
integer width = 1902
integer height = 1092
integer taborder = 20
string title = "none"
string dataobject = "dw_tab_atenciones_urgencias"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type tgr from userobject within tab_1
event create ( )
event destroy ( )
integer x = 128
integer y = 16
integer width = 5870
integer height = 1116
long backcolor = 67108864
string text = "Tabular"
long tabtextcolor = 33554432
string picturename = "grid.ico"
long picturemaskcolor = 536870912
st_6 st_6
st_4 st_4
dw_9 dw_9
dw_10 dw_10
end type

on tgr.create
this.st_6=create st_6
this.st_4=create st_4
this.dw_9=create dw_9
this.dw_10=create dw_10
this.Control[]={this.st_6,&
this.st_4,&
this.dw_9,&
this.dw_10}
end on

on tgr.destroy
destroy(this.st_6)
destroy(this.st_4)
destroy(this.dw_9)
destroy(this.dw_10)
end on

type st_6 from statictext within tgr
integer x = 50
integer y = 24
integer width = 439
integer height = 56
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 134217731
string text = "PROCEDIMIENTOS"
boolean focusrectangle = false
end type

type st_4 from statictext within tgr
integer x = 2702
integer y = 20
integer width = 745
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 134217731
string text = "PACIENTES EN OBSERVACION"
boolean focusrectangle = false
end type

type dw_9 from datawindow within tgr
integer x = 2697
integer y = 96
integer width = 3173
integer height = 992
integer taborder = 60
string title = "none"
string dataobject = "dw_tab_atenciones_urgencias_obs"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_10 from datawindow within tgr
integer x = 37
integer y = 96
integer width = 2615
integer height = 992
integer taborder = 20
string title = "none"
string dataobject = "dw_tab_cups_urgencias"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)

end event

type fec_2 from editmask within w_tablero_urgencias
integer x = 1362
integer y = 20
integer width = 475
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

event constructor;fec_2.text=string(today())
end event

event modified;filtre()
end event

type fec_1 from editmask within w_tablero_urgencias
integer x = 448
integer y = 16
integer width = 475
integer height = 80
integer taborder = 60
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

event constructor;fec_1.text=string(today())
end event

event modified;filtre()
end event

type dw_4 from datawindow within w_tablero_urgencias
integer x = 2121
integer y = 148
integer width = 3909
integer height = 564
integer taborder = 40
string title = "none"
string dataobject = "dw_tab_tiempo_espera_pacientes_postgres"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type r_1 from rectangle within w_tablero_urgencias
long linecolor = 16777215
integer linethickness = 5
long fillcolor = 67108864
integer x = 23
integer y = 8
integer width = 3538
integer height = 116
end type

type st_3 from statictext within w_tablero_urgencias
integer x = 1943
integer y = 32
integer width = 242
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "LUGAR"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_2 from statictext within w_tablero_urgencias
integer x = 1033
integer y = 32
integer width = 370
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA FINAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type st_1 from statictext within w_tablero_urgencias
integer x = 87
integer y = 32
integer width = 370
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "FECHA INICIAL"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_tablero_urgencias
integer x = 37
integer y = 732
integer width = 2057
integer height = 584
integer taborder = 40
string title = "none"
string dataobject = "dw_tab_tiempo_espera_consulta"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_1 from datawindow within w_tablero_urgencias
integer x = 32
integer y = 148
integer width = 2062
integer height = 572
integer taborder = 30
string title = "none"
string dataobject = "dw_tab_tiempo_espera_triagge_postgres"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_5 from datawindow within w_tablero_urgencias
integer x = 2121
integer y = 732
integer width = 3890
integer height = 584
integer taborder = 50
string title = "none"
string dataobject = "dw_tab_tiempo_espera_consulta_pacientes"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_3 from datawindow within w_tablero_urgencias
integer x = 2162
integer y = 20
integer width = 1344
integer height = 80
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)
getchild('codlugar',idw_lugt)
idw_lugt.setfilter("urg='1'")
idw_lugt.filter()
end event

event itemchanged;if idw_lugt.getitemstring(idw_lugt.getrow(),'prim')='1' then
	ls_xlugar='%'
else
	ls_xlugar=data
end if
filtre()
end event

