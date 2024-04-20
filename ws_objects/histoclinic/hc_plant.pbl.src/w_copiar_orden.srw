$PBExportHeader$w_copiar_orden.srw
forward
global type w_copiar_orden from window
end type
type pb_1 from picturebutton within w_copiar_orden
end type
type tab_1 from tab within w_copiar_orden
end type
type tp_1 from userobject within tab_1
end type
type st_5 from statictext within tp_1
end type
type st_4 from statictext within tp_1
end type
type st_3 from statictext within tp_1
end type
type pb_cancel_act from picturebutton within tp_1
end type
type pb_ok_act from picturebutton within tp_1
end type
type st_2 from statictext within tp_1
end type
type st_1 from statictext within tp_1
end type
type dp_2 from datepicker within tp_1
end type
type dp_1 from datepicker within tp_1
end type
type dw_form_act from datawindow within tp_1
end type
type dw_ord_act from datawindow within tp_1
end type
type gb_1 from groupbox within tp_1
end type
type gb_2 from groupbox within tp_1
end type
type gb_3 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
st_5 st_5
st_4 st_4
st_3 st_3
pb_cancel_act pb_cancel_act
pb_ok_act pb_ok_act
st_2 st_2
st_1 st_1
dp_2 dp_2
dp_1 dp_1
dw_form_act dw_form_act
dw_ord_act dw_ord_act
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
type tp_2 from userobject within tab_1
end type
type pb_3 from picturebutton within tp_2
end type
type pb_2 from picturebutton within tp_2
end type
type st_7 from statictext within tp_2
end type
type st_6 from statictext within tp_2
end type
type dw_ing_urg from datawindow within tp_2
end type
type dw_ord_urg from datawindow within tp_2
end type
type dw_form_urg from datawindow within tp_2
end type
type gb_4 from groupbox within tp_2
end type
type gb_5 from groupbox within tp_2
end type
type gb_6 from groupbox within tp_2
end type
type tp_2 from userobject within tab_1
pb_3 pb_3
pb_2 pb_2
st_7 st_7
st_6 st_6
dw_ing_urg dw_ing_urg
dw_ord_urg dw_ord_urg
dw_form_urg dw_form_urg
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
end type
type tab_1 from tab within w_copiar_orden
tp_1 tp_1
tp_2 tp_2
end type
end forward

global type w_copiar_orden from window
integer width = 3813
integer height = 1772
boolean titlebar = true
string title = "Replica Ordenes Anteriores"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
pb_1 pb_1
tab_1 tab_1
end type
global w_copiar_orden w_copiar_orden

type variables
st_xa_procs_hc  i_st
private long i_contador=-1,i_norden, i_contador_urg=-1
private string i_clug_his,i_clug_his_urg
private datetime fecha1,fecha2,fecha1_urg,fecha2_urg
end variables

on w_copiar_orden.create
this.pb_1=create pb_1
this.tab_1=create tab_1
this.Control[]={this.pb_1,&
this.tab_1}
end on

on w_copiar_orden.destroy
destroy(this.pb_1)
destroy(this.tab_1)
end on

event open;i_st=message.powerobjectparm
i_contador=i_st.contador
i_clug_his=i_st.clug
tab_1.tp_1.dw_ord_act.retrieve(i_contador, i_clug_his,fecha1,fecha2 )
tab_1.tp_2.dw_ing_urg.retrieve(tipdoc,docu)
if tab_1.tp_2.dw_ing_urg.rowcount()>0 then
	tab_1.tp_2.enabled=true
else
	tab_1.tp_2.enabled=false	
end if
end event

type pb_1 from picturebutton within w_copiar_orden
boolean visible = false
integer x = 1047
integer y = 1648
integer width = 183
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
boolean originalsize = true
alignment htextalign = left!
end type

event clicked;closewithreturn(parent,i_st)
end event

type tab_1 from tab within w_copiar_orden
event create ( )
event destroy ( )
integer x = 23
integer y = 12
integer width = 3717
integer height = 1628
integer taborder = 30
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
boolean focusonbuttondown = true
integer selectedtab = 1
tp_1 tp_1
tp_2 tp_2
end type

on tab_1.create
this.tp_1=create tp_1
this.tp_2=create tp_2
this.Control[]={this.tp_1,&
this.tp_2}
end on

on tab_1.destroy
destroy(this.tp_1)
destroy(this.tp_2)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3680
integer height = 1500
long backcolor = 67108864
string text = "Ingreso Actual"
long tabtextcolor = 33554432
string picturename = "actual.ico"
long picturemaskcolor = 536870912
st_5 st_5
st_4 st_4
st_3 st_3
pb_cancel_act pb_cancel_act
pb_ok_act pb_ok_act
st_2 st_2
st_1 st_1
dp_2 dp_2
dp_1 dp_1
dw_form_act dw_form_act
dw_ord_act dw_ord_act
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type

on tp_1.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.pb_cancel_act=create pb_cancel_act
this.pb_ok_act=create pb_ok_act
this.st_2=create st_2
this.st_1=create st_1
this.dp_2=create dp_2
this.dp_1=create dp_1
this.dw_form_act=create dw_form_act
this.dw_ord_act=create dw_ord_act
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.pb_cancel_act,&
this.pb_ok_act,&
this.st_2,&
this.st_1,&
this.dp_2,&
this.dp_1,&
this.dw_form_act,&
this.dw_ord_act,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on tp_1.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.pb_cancel_act)
destroy(this.pb_ok_act)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dp_2)
destroy(this.dp_1)
destroy(this.dw_form_act)
destroy(this.dw_ord_act)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type st_5 from statictext within tp_1
integer x = 2921
integer y = 272
integer width = 745
integer height = 144
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione la orden generada previamente"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_4 from statictext within tp_1
integer x = 2926
integer y = 620
integer width = 718
integer height = 240
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Identifique los productos y ajuste cantidades, Vía administración, Dosificación y Frecuencia"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_3 from statictext within tp_1
integer x = 1522
integer y = 48
integer width = 910
integer height = 164
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione las fechas para el criterio de Búsqueda de las Ordenes a replicar"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancel_act from picturebutton within tp_1
integer x = 2757
integer y = 64
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;pb_1.event clicked()
end event

type pb_ok_act from picturebutton within tp_1
integer x = 2578
integer y = 60
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;long l_j,l_donde
For l_j=1 to dw_form_act.rowcount()
	if dw_form_act.getitemstring(l_j,'escog')='1' then 
		l_donde=i_st.dw_procs.insertrow(0)
		i_st.dw_procs.setitem(l_donde,'cmedica',dw_form_act.getitemstring(l_j,'c_medica'))
		i_st.dw_procs.setitem(l_donde,'cantidad',dw_form_act.getitemnumber(l_j,'solicitada'))
		i_st.dw_procs.setitem(l_donde,'administracion',dw_form_act.getitemstring(l_j,'administracion'))
		i_st.dw_procs.setitem(l_donde,'frecuen',dw_form_act.getitemstring(l_j,'frecuen'))
		i_st.dw_procs.setitem(l_donde,'via',dw_form_act.getitemstring(l_j,'via'))
		i_st.dw_procs.setitem(l_donde,'dosis',dw_form_act.getitemnumber(l_j,'dosis'))
	end if
Next
pb_1.event clicked()
end event

type st_2 from statictext within tp_1
integer x = 818
integer y = 96
integer width = 187
integer height = 52
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta"
boolean focusrectangle = false
end type

type st_1 from statictext within tp_1
string tag = "actual.ico"
integer x = 101
integer y = 96
integer width = 160
integer height = 76
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde"
boolean focusrectangle = false
end type

type dp_2 from datepicker within tp_1
integer x = 1024
integer y = 88
integer width = 462
integer height = 104
integer taborder = 50
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2020-06-29"), Time("10:59:53.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event constructor;SetValue(today(),now())
fecha2=datetime(today(),time('23:59'))
end event

event valuechanged;date l_fecha
time hora

getValue(l_fecha,hora)
fecha2=datetime(l_fecha,time('00:00'))
tab_1.tp_1.dw_ord_act.retrieve(i_contador, i_clug_his,fecha1,fecha2 )
end event

type dp_1 from datepicker within tp_1
integer x = 256
integer y = 92
integer width = 489
integer height = 100
integer taborder = 50
boolean border = true
borderstyle borderstyle = stylelowered!
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2020-06-29"), Time("10:59:53.000000"))
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

event constructor;SetValue(relativedate(today(),-1),time('00:00'))
fecha1=datetime(relativedate(today(),-1),time('00:00'))

end event

event valuechanged;date l_fecha
time hora

getValue(l_fecha,hora)
fecha1=datetime(l_fecha,time('00:00'))
tab_1.tp_1.dw_ord_act.retrieve(i_contador, i_clug_his,fecha1,fecha2 )
end event

type dw_form_act from datawindow within tp_1
integer x = 73
integer y = 960
integer width = 3520
integer height = 484
integer taborder = 40
string title = "none"
string dataobject = "dw_oscpo_form_hadm_copy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event buttonclicked;long j
string p_codigo

for j=1 to rowcount()
	if dwo.text='Copia' then
		setrow(j)
		setitem(j,'escog','1')
	else
		setitem(j,'escog','0')
	end if
next
if dwo.name<>'b_2' then 
	if dwo.text='Copia' then modify(string(dwo.name)+'.text="No Copia"') else 	modify(string(dwo.name)+'.text="Copia"')
end if

end event

event itemchanged;accepttext()
end event

type dw_ord_act from datawindow within tp_1
integer x = 69
integer y = 300
integer width = 2793
integer height = 536
integer taborder = 30
string title = "none"
string dataobject = "dw_oscab_hadm_copy"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tp_1.dw_form_act.reset()
i_norden=-1
if dw_ord_act.rowcount()=0 then return
i_norden=dw_ord_act.getitemnumber(dw_ord_act.getrow(),"nsolicitud")
tab_1.tp_1.dw_form_act.retrieve(i_contador,i_clug_his,i_norden)
i_norden=tab_1.tp_1.dw_form_act.rowcount()
end event

type gb_1 from groupbox within tp_1
integer x = 41
integer y = 24
integer width = 1472
integer height = 192
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Criterio Búsqueda"
end type

type gb_2 from groupbox within tp_1
integer x = 41
integer y = 244
integer width = 2862
integer height = 624
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Orden"
end type

type gb_3 from groupbox within tp_1
integer x = 32
integer y = 892
integer width = 3593
integer height = 588
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Prescripción"
end type

type tp_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3680
integer height = 1500
long backcolor = 67108864
string text = "Urgencia"
long tabtextcolor = 33554432
string picturename = "urgen.ico"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_2 pb_2
st_7 st_7
st_6 st_6
dw_ing_urg dw_ing_urg
dw_ord_urg dw_ord_urg
dw_form_urg dw_form_urg
gb_4 gb_4
gb_5 gb_5
gb_6 gb_6
end type

on tp_2.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.st_7=create st_7
this.st_6=create st_6
this.dw_ing_urg=create dw_ing_urg
this.dw_ord_urg=create dw_ord_urg
this.dw_form_urg=create dw_form_urg
this.gb_4=create gb_4
this.gb_5=create gb_5
this.gb_6=create gb_6
this.Control[]={this.pb_3,&
this.pb_2,&
this.st_7,&
this.st_6,&
this.dw_ing_urg,&
this.dw_ord_urg,&
this.dw_form_urg,&
this.gb_4,&
this.gb_5,&
this.gb_6}
end on

on tp_2.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.dw_ing_urg)
destroy(this.dw_ord_urg)
destroy(this.dw_form_urg)
destroy(this.gb_4)
destroy(this.gb_5)
destroy(this.gb_6)
end on

type pb_3 from picturebutton within tp_2
integer x = 3387
integer y = 208
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
alignment htextalign = left!
end type

event clicked;pb_1.event clicked()
end event

type pb_2 from picturebutton within tp_2
integer x = 3383
integer y = 60
integer width = 146
integer height = 128
integer taborder = 60
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;long l_j,l_donde
For l_j=1 to dw_form_urg.rowcount()
	if dw_form_urg.getitemstring(l_j,'escog')='1' then 
		l_donde=i_st.dw_procs.insertrow(0)
		i_st.dw_procs.setitem(l_donde,'cmedica',dw_form_urg.getitemstring(l_j,'c_medica'))
		i_st.dw_procs.setitem(l_donde,'cantidad',dw_form_urg.getitemnumber(l_j,'solicitada'))
		i_st.dw_procs.setitem(l_donde,'administracion',dw_form_urg.getitemstring(l_j,'administracion'))
		i_st.dw_procs.setitem(l_donde,'frecuen',dw_form_urg.getitemstring(l_j,'frecuen'))
		i_st.dw_procs.setitem(l_donde,'via',dw_form_urg.getitemstring(l_j,'via'))
		i_st.dw_procs.setitem(l_donde,'dosis',dw_form_urg.getitemstring(l_j,'dosis'))
	end if
Next
pb_1.event clicked()
end event

type st_7 from statictext within tp_2
integer x = 2917
integer y = 400
integer width = 686
integer height = 80
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione la orden generada previamente"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_6 from statictext within tp_2
integer x = 2921
integer y = 600
integer width = 722
integer height = 232
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Identifique los productos y ajuste cantidades, Vía administración, Dosificación y Frecuencia"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_ing_urg from datawindow within tp_2
integer x = 69
integer y = 92
integer width = 3214
integer height = 240
integer taborder = 40
string title = "none"
string dataobject = "dw_admin_copy"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;tab_1.tp_2.dw_form_urg.reset()
if getrow()<1 then return
i_contador_urg=getitemnumber(getrow(),"contador")
i_clug_his_urg=getitemstring(getrow(),"clugar_his")
Fecha2_urg=datetime(date(getitemdatetime(getrow(),"fechaegreso")),time('23:59'))
Fecha1_urg=datetime(relativedate(date(fecha2_urg),-1))
tab_1.tp_2.dw_ord_urg.retrieve(i_contador_urg,i_clug_his_urg,fecha1_urg,fecha2_urg)
end event

type dw_ord_urg from datawindow within tp_2
integer x = 78
integer y = 408
integer width = 2793
integer height = 400
integer taborder = 40
string title = "none"
string dataobject = "dw_oscab_hadm_copy"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;tab_1.tp_2.dw_form_urg.reset()
i_norden=-1
if getrow()<1 then return
i_norden=getitemnumber(getrow(),"nsolicitud")
tab_1.tp_2.dw_form_urg.retrieve(i_contador_urg,i_clug_his_urg,i_norden)
end event

event constructor;settransobject(sqlca)
end event

type dw_form_urg from datawindow within tp_2
integer x = 82
integer y = 920
integer width = 3547
integer height = 532
integer taborder = 50
string title = "none"
string dataobject = "dw_oscpo_form_hadm_copy"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event buttonclicking;long j
string p_codigo

for j=1 to rowcount()
	if dwo.text='Copia' then
		setrow(j)
		setitem(j,'escog','1')
	else
		setitem(j,'escog','0')
	end if
next
if dwo.name<>'b_2' then 
	if dwo.text='Copia' then modify(string(dwo.name)+'.text="No Copia"') else 	modify(string(dwo.name)+'.text="Copia"')
end if
end event

type gb_4 from groupbox within tp_2
integer x = 41
integer y = 348
integer width = 2848
integer height = 504
integer taborder = 40
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "ORDEN"
end type

type gb_5 from groupbox within tp_2
integer x = 41
integer y = 852
integer width = 3625
integer height = 636
integer taborder = 60
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PRESCRIPCIÓN"
end type

type gb_6 from groupbox within tp_2
integer x = 41
integer y = 28
integer width = 3296
integer height = 332
integer taborder = 30
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "INGRESOS DE URGENCIAS"
end type

