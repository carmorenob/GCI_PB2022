$PBExportHeader$w_copiar_hc_memo.srw
forward
global type w_copiar_hc_memo from window
end type
type pb_1 from picturebutton within w_copiar_hc_memo
end type
type tab_1 from tab within w_copiar_hc_memo
end type
type tp_1 from userobject within tab_1
end type
type rte_x from richtextedit within tp_1
end type
type st_5 from statictext within tp_1
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
type dw_ord_act from datawindow within tp_1
end type
type gb_1 from groupbox within tp_1
end type
type gb_2 from groupbox within tp_1
end type
type gb_3 from groupbox within tp_1
end type
type tp_1 from userobject within tab_1
rte_x rte_x
st_5 st_5
pb_cancel_act pb_cancel_act
pb_ok_act pb_ok_act
st_2 st_2
st_1 st_1
dp_2 dp_2
dp_1 dp_1
dw_ord_act dw_ord_act
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
type tab_1 from tab within w_copiar_hc_memo
tp_1 tp_1
end type
end forward

global type w_copiar_hc_memo from window
integer width = 3662
integer height = 1772
boolean titlebar = true
string title = "Replica Campo HC"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
pb_1 pb_1
tab_1 tab_1
end type
global w_copiar_hc_memo w_copiar_hc_memo

type variables
st_xa_procs_hc  i_st
private long i_contador=-1,i_norden,i_campo
private string s_clug_his,s_plant,s_profe
private datetime fecha1,fecha2
end variables

on w_copiar_hc_memo.create
this.pb_1=create pb_1
this.tab_1=create tab_1
this.Control[]={this.pb_1,&
this.tab_1}
end on

on w_copiar_hc_memo.destroy
destroy(this.pb_1)
destroy(this.tab_1)
end on

event open;i_st=message.powerobjectparm
i_contador=i_st.contador
s_clug_his=i_st.clug
s_plant=i_st.tingres
s_profe=i_st.cprof
i_campo=i_st.ncampo

tab_1.tp_1.dw_ord_act.retrieve(i_contador,s_clug_his,s_plant,s_profe,fecha1,fecha2)

end event

type pb_1 from picturebutton within w_copiar_hc_memo
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

type tab_1 from tab within w_copiar_hc_memo
event create ( )
event destroy ( )
integer x = 23
integer y = 12
integer width = 3584
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
end type

on tab_1.create
this.tp_1=create tp_1
this.Control[]={this.tp_1}
end on

on tab_1.destroy
destroy(this.tp_1)
end on

type tp_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3547
integer height = 1500
long backcolor = 67108864
string text = "Ingreso Actual"
long tabtextcolor = 33554432
string picturename = "actual.ico"
long picturemaskcolor = 536870912
rte_x rte_x
st_5 st_5
pb_cancel_act pb_cancel_act
pb_ok_act pb_ok_act
st_2 st_2
st_1 st_1
dp_2 dp_2
dp_1 dp_1
dw_ord_act dw_ord_act
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type

on tp_1.create
this.rte_x=create rte_x
this.st_5=create st_5
this.pb_cancel_act=create pb_cancel_act
this.pb_ok_act=create pb_ok_act
this.st_2=create st_2
this.st_1=create st_1
this.dp_2=create dp_2
this.dp_1=create dp_1
this.dw_ord_act=create dw_ord_act
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.Control[]={this.rte_x,&
this.st_5,&
this.pb_cancel_act,&
this.pb_ok_act,&
this.st_2,&
this.st_1,&
this.dp_2,&
this.dp_1,&
this.dw_ord_act,&
this.gb_1,&
this.gb_2,&
this.gb_3}
end on

on tp_1.destroy
destroy(this.rte_x)
destroy(this.st_5)
destroy(this.pb_cancel_act)
destroy(this.pb_ok_act)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.dp_2)
destroy(this.dp_1)
destroy(this.dw_ord_act)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type rte_x from richtextedit within tp_1
integer x = 87
integer y = 956
integer width = 3387
integer height = 448
integer taborder = 70
integer textsize = -8
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean init_displayonly = true
borderstyle borderstyle = stylelowered!
end type

type st_5 from statictext within tp_1
integer x = 2011
integer y = 36
integer width = 1495
integer height = 172
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15793151
string text = "Seleccione la Hc generada previamente e el campo correspondiente"
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type pb_cancel_act from picturebutton within tp_1
integer x = 1751
integer y = 60
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

event clicked;setnull(i_st.cemp)
pb_1.event clicked()
end event

type pb_ok_act from picturebutton within tp_1
integer x = 1582
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
datetime value = DateTime(Date("2023-10-11"), Time("15:13:37.000000"))
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
tab_1.tp_1.dw_ord_act.retrieve(i_contador, s_clug_his,s_plant,s_profe,fecha1,fecha2)
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
datetime value = DateTime(Date("2023-10-11"), Time("15:13:37.000000"))
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
tab_1.tp_1.dw_ord_act.retrieve(i_contador, s_clug_his,s_plant,s_profe,fecha1,fecha2)
end event

type dw_ord_act from datawindow within tp_1
integer x = 69
integer y = 300
integer width = 3392
integer height = 536
integer taborder = 30
string title = "none"
string dataobject = "dw_copy_hc_registro"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event rowfocuschanged;f_sel_rtf(rte_x)
rte_x.clearall()
f_sel_rtf(rte_x)
rte_x.clearall()

i_norden=-1
if dw_ord_act.rowcount()=0 then return
i_norden=dw_ord_act.getitemnumber(dw_ord_act.getrow(),"nregistro")

blob lb_motivo

selectblob
	hclin_reg_valor.long_texto into :lb_motivo
FROM 
	hclin_reg_valor
WHERE 
	(((hclin_reg_valor.contador)=:i_contador) 
	AND ((hclin_reg_valor.clugar)=:s_clug_his) 
	AND ((hclin_reg_valor.nregistro)=:i_norden) 
	AND ((hclin_reg_valor.item)=:i_campo));
	
IF SQLCA.SQLCode = -1 THEN
	MessageBox("No pudo recuperarse información de la planilla.", SQLCA.SQLErrText)
END IF
f_pega_a_rtf(rte_x,string(lb_motivo),3)
rte_x.selectTextAll(Detail!)
rte_x.Copy()
i_st.cemp=string(lb_motivo)

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
integer width = 3470
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
string text = "Registro Hc"
end type

type gb_3 from groupbox within tp_1
integer x = 32
integer y = 892
integer width = 3488
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
string text = "Registro Histórico"
end type

