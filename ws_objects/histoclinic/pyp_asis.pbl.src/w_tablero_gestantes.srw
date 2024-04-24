$PBExportHeader$w_tablero_gestantes.srw
forward
global type w_tablero_gestantes from window
end type
type t1 from tab within w_tablero_gestantes
end type
type tb from userobject within t1
end type
type dw_8 from datawindow within tb
end type
type dw_7 from datawindow within tb
end type
type dw_5 from datawindow within tb
end type
type dw_4 from datawindow within tb
end type
type dw_2 from datawindow within tb
end type
type tb from userobject within t1
dw_8 dw_8
dw_7 dw_7
dw_5 dw_5
dw_4 dw_4
dw_2 dw_2
end type
type dt from userobject within t1
end type
type pb_1 from picturebutton within dt
end type
type st_1 from statictext within dt
end type
type drop_tipo from dropdownlistbox within dt
end type
type dw_6 from datawindow within dt
end type
type dt from userobject within t1
pb_1 pb_1
st_1 st_1
drop_tipo drop_tipo
dw_6 dw_6
end type
type t1 from tab within w_tablero_gestantes
tb tb
dt dt
end type
type dw_1 from datawindow within w_tablero_gestantes
end type
type fec_2 from editmask within w_tablero_gestantes
end type
type r_1 from rectangle within w_tablero_gestantes
end type
type dw_3 from datawindow within w_tablero_gestantes
end type
type st_3 from statictext within w_tablero_gestantes
end type
type st_2 from statictext within w_tablero_gestantes
end type
end forward

global type w_tablero_gestantes from window
integer width = 6281
integer height = 2528
boolean titlebar = true
string title = "Seguimiento A La Gestión De Cohorte De Gestantes"
boolean controlmenu = true
boolean minbox = true
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "turgencias.ico"
t1 t1
dw_1 dw_1
fec_2 fec_2
r_1 r_1
dw_3 dw_3
st_3 st_3
st_2 st_2
end type
global w_tablero_gestantes w_tablero_gestantes

type variables
string ls_xlugar
DataWindowChild idw_lugt

end variables

forward prototypes
public subroutine filtre ()
end prototypes

public subroutine filtre ();datetime fecha1,fecha2
int l_i
fecha1=datetime('01/01/'+string(year(date(fec_2.text))))
fecha2=datetime(fec_2.text)



dw_1.retrieve(fecha2,ls_xlugar)
t1.tb.dw_2.retrieve(fecha1,fecha2,ls_xlugar)
t1.tb.dw_4.retrieve(fecha1,datetime(RelativeDate(date(fecha2),60)),ls_xlugar)
for l_i=1 to 5
	t1.tb.dw_4.SetDataStyle ( "gr_1", 1, l_i, Foreground!,rgb(0,162,232 ))
	t1.tb.dw_4.SetDataStyle ( "gr_1", 1, l_i, Shade!,rgb(0,162,232 ))
next

t1.tb.dw_5.retrieve(fecha1,fecha2,ls_xlugar)
t1.tb.dw_7.retrieve(fecha1,fecha2,ls_xlugar)
for l_i=1 to 12
	t1.tb.dw_7.SetDataStyle ( "gr_1", 1, l_i, Foreground!,rgb(157,211,144))
	t1.tb.dw_7.SetDataStyle ( "gr_1", 1, l_i, Shade!,rgb(157,211,144))
next

end subroutine

on w_tablero_gestantes.create
this.t1=create t1
this.dw_1=create dw_1
this.fec_2=create fec_2
this.r_1=create r_1
this.dw_3=create dw_3
this.st_3=create st_3
this.st_2=create st_2
this.Control[]={this.t1,&
this.dw_1,&
this.fec_2,&
this.r_1,&
this.dw_3,&
this.st_3,&
this.st_2}
end on

on w_tablero_gestantes.destroy
destroy(this.t1)
destroy(this.dw_1)
destroy(this.fec_2)
destroy(this.r_1)
destroy(this.dw_3)
destroy(this.st_3)
destroy(this.st_2)
end on

event open;if g_motor='postgres' then
	dw_1.dataobject='dw_tab_gestantes_partos_cant'
	t1.tb.dw_2.dataobject='dw_tab_gestante_agenda_eco'
	t1.tb.dw_4.dataobject='dw_tab_gestante_agenda_cpn'	
	t1.tb.dw_5.dataobject='dw_tab_gestante_ultima_atn'
	t1.tb.dw_7.dataobject='dw_tab_gestante_ultimo_cp'
end if

dw_1.settransobject(sqlca)
t1.tb.dw_2.settransobject(sqlca)
t1.tb.dw_4.settransobject(sqlca)
t1.tb.dw_5.settransobject(sqlca)
t1.tb.dw_7.settransobject(sqlca)
w_principal.dw_1.visible=false
int ll_find

ll_find =idw_lugt.find("codlugar='"+clugar+"'",1,idw_lugt.rowcount())
if idw_lugt.getitemstring(ll_find,'prim')='1' then
	ls_xlugar='%'
else
	ls_xlugar=clugar
end if
filtre()

//string ls_json,ls_data,ls_html, gs_directory='c:\windows\temp\'
//integer li_fila,li_ret
// 
//pie.il_tipo_grafico =1 //donna
//pie.is_titulo = 'PRUEBA'
//debugbreak()
////
//dw_6.settransobject(sqlca)
//dw_6.retrieve()
//ls_json = dw_6.exportjson()
//pie.wf_create_jason(ls_json)
//pie.wf_create_script( )
//
//ls_html= gs_directory + 'index.html'
//pie.wf_create_html(ls_html)
//
//li_ret = pie.wb_1.navigate(ls_html) 
//li_ret = pie.ole_1.object.navigate(ls_html)

end event

event close;w_principal.dw_1.visible=true
//m_principal.visible=true

end event

event timer;timer(0)
filtre()
end event

type t1 from tab within w_tablero_gestantes
integer x = 9
integer y = 260
integer width = 6135
integer height = 2104
integer taborder = 90
integer textsize = -7
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Small Fonts"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
boolean showtext = false
tabposition tabposition = tabsonleft!
integer selectedtab = 1
tb tb
dt dt
end type

on t1.create
this.tb=create tb
this.dt=create dt
this.Control[]={this.tb,&
this.dt}
end on

on t1.destroy
destroy(this.tb)
destroy(this.dt)
end on

type tb from userobject within t1
event create ( )
event destroy ( )
integer x = 128
integer y = 16
integer width = 5989
integer height = 2072
long backcolor = 67108864
string text = "Tablero"
long tabtextcolor = 33554432
string picturename = "tbl_urgencias.ico"
long picturemaskcolor = 536870912
dw_8 dw_8
dw_7 dw_7
dw_5 dw_5
dw_4 dw_4
dw_2 dw_2
end type

on tb.create
this.dw_8=create dw_8
this.dw_7=create dw_7
this.dw_5=create dw_5
this.dw_4=create dw_4
this.dw_2=create dw_2
this.Control[]={this.dw_8,&
this.dw_7,&
this.dw_5,&
this.dw_4,&
this.dw_2}
end on

on tb.destroy
destroy(this.dw_8)
destroy(this.dw_7)
destroy(this.dw_5)
destroy(this.dw_4)
destroy(this.dw_2)
end on

type dw_8 from datawindow within tb
boolean visible = false
integer x = 1998
integer y = 1040
integer width = 1970
integer height = 1000
integer taborder = 90
string title = "none"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_7 from datawindow within tb
integer x = 3991
integer y = 12
integer width = 1970
integer height = 1000
integer taborder = 20
string title = "none"
string dataobject = "dw_tab_gestante_ultimo_cp"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_5 from datawindow within tb
integer x = 1998
integer y = 12
integer width = 1970
integer height = 1000
integer taborder = 20
string title = "none"
string dataobject = "dw_tab_gestante_ultima_atn"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_4 from datawindow within tb
integer x = 9
integer y = 1040
integer width = 1970
integer height = 1000
integer taborder = 80
string title = "none"
string dataobject = "dw_tab_gestante_agenda_cpn"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dw_2 from datawindow within tb
integer x = 9
integer y = 12
integer width = 1970
integer height = 1000
integer taborder = 20
string title = "none"
string dataobject = "dw_tab_gestante_agenda_eco"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type dt from userobject within t1
integer x = 128
integer y = 16
integer width = 5989
integer height = 2072
long backcolor = 67108864
string text = "Datos"
long tabtextcolor = 33554432
string picturename = "grid.ico"
long picturemaskcolor = 536870912
pb_1 pb_1
st_1 st_1
drop_tipo drop_tipo
dw_6 dw_6
end type

on dt.create
this.pb_1=create pb_1
this.st_1=create st_1
this.drop_tipo=create drop_tipo
this.dw_6=create dw_6
this.Control[]={this.pb_1,&
this.st_1,&
this.drop_tipo,&
this.dw_6}
end on

on dt.destroy
destroy(this.pb_1)
destroy(this.st_1)
destroy(this.drop_tipo)
destroy(this.dw_6)
end on

type pb_1 from picturebutton within dt
string tag = "Exportar"
integer x = 5563
integer y = 24
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
string picturename = "export.gif"
alignment htextalign = left!
end type

event clicked;if dw_6.rowcount()>0 then
	openwithparm(w_export,dw_6)
end if
end event

type st_1 from statictext within dt
integer x = 37
integer y = 32
integer width = 306
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "INDICADOR"
boolean focusrectangle = false
end type

type drop_tipo from dropdownlistbox within dt
integer x = 366
integer y = 24
integer width = 1202
integer height = 276
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Agenda Ecografias","Agendamiento Control Prenatal","Ultimo Control Prenatal","Gestantes sin Fur"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;datetime fecha1,fecha2
fecha1=datetime('01/01/'+string(year(date(fec_2.text))))
fecha2=datetime(fec_2.text)

choose case index
	case 1
		t1.dt.dw_6.dataobject='dw_tab_gestante_agenda_eco_tab'
	case 2
		t1.dt.dw_6.dataobject='dw_tab_gestante_agenda_eco_tab'		
	case 3
		t1.dt.dw_6.dataobject='dw_tab_gestante_ultimo_cp_tab'
	case 4
		t1.dt.dw_6.dataobject='dw_tab_gestante_sinfur_tab'	
end choose
t1.dt.dw_6.settransobject(sqlca)
t1.dt.dw_6.retrieve(fecha1,fecha2,ls_xlugar)
end event

type dw_6 from datawindow within dt
integer x = 46
integer y = 184
integer width = 5696
integer height = 1872
integer taborder = 70
string title = "none"
string dataobject = "dw_tab_gestante_agenda_eco_tab"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)

end event

type dw_1 from datawindow within w_tablero_gestantes
integer x = 2638
integer y = 16
integer width = 2496
integer height = 220
integer taborder = 10
string title = "none"
string dataobject = "dw_tab_gestantes_partos_cant"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type fec_2 from editmask within w_tablero_gestantes
integer x = 416
integer y = 84
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

type r_1 from rectangle within w_tablero_gestantes
long linecolor = 16777215
integer linethickness = 5
long fillcolor = 67108864
integer x = 23
integer y = 16
integer width = 2578
integer height = 220
end type

type dw_3 from datawindow within w_tablero_gestantes
integer x = 1207
integer y = 76
integer width = 1344
integer height = 80
integer taborder = 50
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
end event

event itemchanged;if idw_lugt.getitemstring(idw_lugt.getrow(),'prim')='1' then
	ls_xlugar='%'
else
	ls_xlugar=data
end if
filtre()
end event

type st_3 from statictext within w_tablero_gestantes
integer x = 987
integer y = 88
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

type st_2 from statictext within w_tablero_gestantes
integer x = 87
integer y = 96
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
string text = "FECHA CORTE"
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

