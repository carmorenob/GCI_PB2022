$PBExportHeader$w_trab_labo.srw
$PBExportComments$Muestra el trabajo pendiente y/o realizado
forward
global type w_trab_labo from window
end type
type rb_8 from radiobutton within w_trab_labo
end type
type rb_7 from radiobutton within w_trab_labo
end type
type dw_lug from datawindow within w_trab_labo
end type
type st_9 from statictext within w_trab_labo
end type
type dw_tip_ingres from datawindow within w_trab_labo
end type
type t_1 from tab within w_trab_labo
end type
type tp_1 from userobject within t_1
end type
type pb_4 from pb_report within tp_1
end type
type dw_pend from datawindow within tp_1
end type
type tp_1 from userobject within t_1
pb_4 pb_4
dw_pend dw_pend
end type
type tp_4 from userobject within t_1
end type
type pb_6 from pb_report within tp_4
end type
type pb_5 from picturebutton within tp_4
end type
type st_6 from statictext within tp_4
end type
type em_6 from editmask within tp_4
end type
type em_5 from editmask within tp_4
end type
type st_5 from statictext within tp_4
end type
type dw_re_sc from datawindow within tp_4
end type
type tp_4 from userobject within t_1
pb_6 pb_6
pb_5 pb_5
st_6 st_6
em_6 em_6
em_5 em_5
st_5 st_5
dw_re_sc dw_re_sc
end type
type tp_2 from userobject within t_1
end type
type pb_2 from pb_report within tp_2
end type
type pb_traer from picturebutton within tp_2
end type
type dw_real from datawindow within tp_2
end type
type st_2 from statictext within tp_2
end type
type st_1 from statictext within tp_2
end type
type em_2 from editmask within tp_2
end type
type em_1 from editmask within tp_2
end type
type tp_2 from userobject within t_1
pb_2 pb_2
pb_traer pb_traer
dw_real dw_real
st_2 st_2
st_1 st_1
em_2 em_2
em_1 em_1
end type
type tp_3 from userobject within t_1
end type
type pb_3 from pb_report within tp_3
end type
type pb_1 from picturebutton within tp_3
end type
type em_4 from editmask within tp_3
end type
type st_4 from statictext within tp_3
end type
type st_3 from statictext within tp_3
end type
type em_3 from editmask within tp_3
end type
type dw_suma from datawindow within tp_3
end type
type tp_3 from userobject within t_1
pb_3 pb_3
pb_1 pb_1
em_4 em_4
st_4 st_4
st_3 st_3
em_3 em_3
dw_suma dw_suma
end type
type t_1 from tab within w_trab_labo
tp_1 tp_1
tp_4 tp_4
tp_2 tp_2
tp_3 tp_3
end type
type dw_grup from datawindow within w_trab_labo
end type
end forward

global type w_trab_labo from window
integer width = 4937
integer height = 2036
boolean titlebar = true
string title = "Trabajo en Laboratorio"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
rb_8 rb_8
rb_7 rb_7
dw_lug dw_lug
st_9 st_9
dw_tip_ingres dw_tip_ingres
t_1 t_1
dw_grup dw_grup
end type
global w_trab_labo w_trab_labo

type variables
datawindowchild idw_grupo,idw_tingres
string i_area
end variables

forward prototypes
public subroutine traer ()
end prototypes

public subroutine traer ();string tingres,lug
long grupo
datetime fecha1,fecha2
grupo=dw_grup.getitemnumber(1,1)
tingres=dw_tip_ingres.getitemstring(1,1)
if rb_7.checked then lug='%'
if rb_8.checked then lug=dw_lug.getitemstring(1,1)

if isnull(i_area) or isnull(grupo) or isnull(tingres) then
	t_1.tp_1.dw_pend.reset()
	t_1.tp_2.dw_real.reset()
	t_1.tp_3.dw_suma.reset()
else
	t_1.tp_1.dw_pend.retrieve(i_area,grupo,tingres,lug)
	fecha1=datetime(date(t_1.tp_2.em_1.text),time('00:00'))
	fecha2=datetime(date(t_1.tp_2.em_2.text),time('23:59:59'))
	t_1.tp_2.dw_real.retrieve(i_area,grupo,tingres,fecha1,fecha2,lug)
	fecha1=datetime(date(t_1.tp_3.em_3.text),time('00:00'))
	fecha2=datetime(date(t_1.tp_3.em_4.text),time('23:59:59'))
	t_1.tp_3.dw_suma.retrieve(i_area,grupo,tingres,fecha1,fecha2,lug)
end if
	
end subroutine

on w_trab_labo.create
this.rb_8=create rb_8
this.rb_7=create rb_7
this.dw_lug=create dw_lug
this.st_9=create st_9
this.dw_tip_ingres=create dw_tip_ingres
this.t_1=create t_1
this.dw_grup=create dw_grup
this.Control[]={this.rb_8,&
this.rb_7,&
this.dw_lug,&
this.st_9,&
this.dw_tip_ingres,&
this.t_1,&
this.dw_grup}
end on

on w_trab_labo.destroy
destroy(this.rb_8)
destroy(this.rb_7)
destroy(this.dw_lug)
destroy(this.st_9)
destroy(this.dw_tip_ingres)
destroy(this.t_1)
destroy(this.dw_grup)
end on

event open;i_area=message.stringparm
idw_grupo.retrieve(i_area)
if g_motor='postgres' then
	t_1.tp_4.dw_re_sc.DataObject ='dw_apdx_hechos_sinconfimar_postgres'
else
	t_1.tp_4.dw_re_sc.DataObject ='dw_apdx_hechos_sinconfimar'
end if
t_1.tp_4.dw_re_sc.settransobject(sqlca)
traer()

end event

type rb_8 from radiobutton within w_trab_labo
integer x = 3227
integer y = 16
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Solo en:"
end type

event clicked;traer()
end event

type rb_7 from radiobutton within w_trab_labo
integer x = 2990
integer y = 16
integer width = 219
integer height = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Todos"
boolean checked = true
end type

event clicked;traer()
end event

type dw_lug from datawindow within w_trab_labo
integer x = 3488
integer y = 8
integer width = 1353
integer height = 76
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_combo_lugar"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
insertrow(1)
setitem(1,1,clugar)
end event

event itemchanged;rb_8.checked=true
accepttext()
traer()
end event

type st_9 from statictext within w_trab_labo
integer x = 1577
integer y = 8
integer width = 293
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo Ingreso:"
boolean focusrectangle = false
end type

type dw_tip_ingres from datawindow within w_trab_labo
integer x = 1870
integer y = 8
integer width = 1051
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_tip_ingres_drop"
boolean border = false
boolean livescroll = true
end type

event constructor;settransobject(sqlca)
getchild('codtingre',idw_tingres)
idw_tingres.settransobject(sqlca)
idw_tingres.retrieve()
idw_tingres.insertrow(1)
idw_tingres.setitem(1,'descripcion','Todos')
idw_tingres.setitem(1,'codtingre','%')
insertrow(1)
setitem(1,1,w_apoyo_diag2.i_tipoing)
end event

event itemchanged;accepttext()
traer()
end event

type t_1 from tab within w_trab_labo
integer x = 14
integer y = 96
integer width = 4873
integer height = 1832
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tp_1 tp_1
tp_4 tp_4
tp_2 tp_2
tp_3 tp_3
end type

on t_1.create
this.tp_1=create tp_1
this.tp_4=create tp_4
this.tp_2=create tp_2
this.tp_3=create tp_3
this.Control[]={this.tp_1,&
this.tp_4,&
this.tp_2,&
this.tp_3}
end on

on t_1.destroy
destroy(this.tp_1)
destroy(this.tp_4)
destroy(this.tp_2)
destroy(this.tp_3)
end on

type tp_1 from userobject within t_1
integer x = 18
integer y = 112
integer width = 4837
integer height = 1704
long backcolor = 67108864
string text = "Pendientes"
long tabtextcolor = 33554432
string picturename = "cambia_doc.ico"
long picturemaskcolor = 536870912
string powertiptext = "Exámenes pendientes de realizar"
pb_4 pb_4
dw_pend dw_pend
end type

on tp_1.create
this.pb_4=create pb_4
this.dw_pend=create dw_pend
this.Control[]={this.pb_4,&
this.dw_pend}
end on

on tp_1.destroy
destroy(this.pb_4)
destroy(this.dw_pend)
end on

type pb_4 from pb_report within tp_1
integer x = 9
integer taborder = 60
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir"
string cod_rep = "LAP"
string nombre_rep = "Laboratorios Pendientes"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[3]
par[1]=i_area
par[2]=dw_grup.getitemnumber(1,1)
par[3]=dw_tip_ingres.getitemstring(1,1)
imprimir(par,'','0')

end event

type dw_pend from datawindow within tp_1
integer x = 18
integer y = 132
integer width = 4782
integer height = 1552
integer taborder = 60
string title = "none"
string dataobject = "dw_apdx_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
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

event doubleclicked;if getrow()<1 or row<1 then return
if getrow()<>row then scrolltorow(row)
if tipdoc<>getitemstring(getrow(),'tipodoc') or docu<>getitemstring(getrow(),'documento') then
	w_principal.dw_1.setitem(1,"tipodoc",getitemstring(getrow(),'tipodoc'))
	w_principal.dw_1.setitem(1,"documento",getitemstring(getrow(),'documento'))
	w_principal.dw_1.setcolumn("documento")
	w_principal.dw_1.triggerevent(itemchanged!)	
end if
if dw_tip_ingres.getitemstring(1,1)<>w_apoyo_diag2.dw_tip_ingres.getitemstring(1,1) then
	w_apoyo_diag2.dw_tip_ingres.setitem(1,1,dw_tip_ingres.getitemstring(1,1))
	w_apoyo_diag2.dw_tip_ingres.event itemchanged(1,w_apoyo_diag2.dw_tip_ingres.object.codtingre,dw_tip_ingres.getitemstring(1,1))
end if
datawindow dw_t
dw_t=w_apoyo_diag2.dw_hist
dw_t.scrolltorow(dw_t.find('ningreso='+string(getitemnumber(getrow(),'ningreso')),1,dw_t.rowcount()))
close(f_vent_padre(this))
end event

type tp_4 from userobject within t_1
integer x = 18
integer y = 112
integer width = 4837
integer height = 1704
long backcolor = 67108864
string text = "Realizados Sin Confirmar"
long tabtextcolor = 33554432
string picturename = "anula_salida.ico"
long picturemaskcolor = 536870912
pb_6 pb_6
pb_5 pb_5
st_6 st_6
em_6 em_6
em_5 em_5
st_5 st_5
dw_re_sc dw_re_sc
end type

on tp_4.create
this.pb_6=create pb_6
this.pb_5=create pb_5
this.st_6=create st_6
this.em_6=create em_6
this.em_5=create em_5
this.st_5=create st_5
this.dw_re_sc=create dw_re_sc
this.Control[]={this.pb_6,&
this.pb_5,&
this.st_6,&
this.em_6,&
this.em_5,&
this.st_5,&
this.dw_re_sc}
end on

on tp_4.destroy
destroy(this.pb_6)
destroy(this.pb_5)
destroy(this.st_6)
destroy(this.em_6)
destroy(this.em_5)
destroy(this.st_5)
destroy(this.dw_re_sc)
end on

type pb_6 from pb_report within tp_4
integer x = 1545
integer y = 12
integer taborder = 60
boolean originalsize = false
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir"
string cod_rep = "LBR"
string nombre_rep = "Laboratorios Realizados"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[5]
par[1]=i_area
par[2]=dw_grup.getitemnumber(1,1)
par[3]=dw_tip_ingres.getitemstring(1,1)
par[4]=datetime(date(em_5.text),time('00:00'))
par[5]=datetime(date(em_6.text),time('23:59:59'))
imprimir(par,'','0')

end event

type pb_5 from picturebutton within tp_4
integer x = 1381
integer y = 12
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string picturename = "refrescar.gif"
string powertiptext = "Traer datos"
end type

event clicked;string tingres
long grupo
datetime fecha1,fecha2
grupo=dw_grup.getitemnumber(1,1)
tingres=dw_tip_ingres.getitemstring(1,1)
if isnull(i_area) or isnull(grupo) or isnull(tingres) then return
fecha1=datetime(date(t_1.tp_4.em_5.text),time('00:00'))
fecha2=datetime(date(t_1.tp_4.em_6.text),time('23:59:59'))
dw_re_sc.retrieve(i_area,grupo,tingres,fecha1,fecha2)

end event

type st_6 from statictext within tp_4
integer x = 763
integer y = 40
integer width = 151
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
boolean focusrectangle = false
end type

type em_6 from editmask within tp_4
integer x = 955
integer y = 36
integer width = 375
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type em_5 from editmask within tp_4
integer x = 210
integer y = 40
integer width = 366
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type st_5 from statictext within tp_4
integer x = 32
integer y = 40
integer width = 174
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type dw_re_sc from datawindow within tp_4
integer x = 18
integer y = 160
integer width = 4777
integer height = 1524
integer taborder = 40
string title = "none"
string dataobject = "dw_apdx_hechos_sinconfimar_postgres"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if getrow()<1 or row<1 then return
if getrow()<>row then scrolltorow(row)
if tipdoc<>getitemstring(getrow(),'tipodoc') or docu<>getitemstring(getrow(),'documento') then
	w_principal.dw_1.setitem(1,"tipodoc",getitemstring(getrow(),'tipodoc'))
	w_principal.dw_1.setitem(1,"documento",getitemstring(getrow(),'documento'))
	w_principal.dw_1.setcolumn("documento")
	w_principal.dw_1.triggerevent(itemchanged!)	
end if
if dw_tip_ingres.getitemstring(1,1)<>w_apoyo_diag2.dw_tip_ingres.getitemstring(1,1) then
	w_apoyo_diag2.dw_tip_ingres.setitem(1,1,getitemstring(getrow(),'tipo_ingres'))
	w_apoyo_diag2.dw_tip_ingres.event itemchanged(1,w_apoyo_diag2.dw_tip_ingres.object.codtingre,getitemstring(getrow(),'tipo_ingres'))
end if
datawindow dw_t
dw_t=w_apoyo_diag2.dw_hist
dw_t.scrolltorow(dw_t.find('ningreso='+string(getitemnumber(getrow(),'ningreso')),1,dw_t.rowcount()))
close(f_vent_padre(this))
end event

type tp_2 from userobject within t_1
integer x = 18
integer y = 112
integer width = 4837
integer height = 1704
long backcolor = 67108864
string text = "Realizado"
long tabtextcolor = 33554432
string picturename = "audita.ico"
long picturemaskcolor = 536870912
string powertiptext = "Exámenes realizados por fecha"
pb_2 pb_2
pb_traer pb_traer
dw_real dw_real
st_2 st_2
st_1 st_1
em_2 em_2
em_1 em_1
end type

on tp_2.create
this.pb_2=create pb_2
this.pb_traer=create pb_traer
this.dw_real=create dw_real
this.st_2=create st_2
this.st_1=create st_1
this.em_2=create em_2
this.em_1=create em_1
this.Control[]={this.pb_2,&
this.pb_traer,&
this.dw_real,&
this.st_2,&
this.st_1,&
this.em_2,&
this.em_1}
end on

on tp_2.destroy
destroy(this.pb_2)
destroy(this.pb_traer)
destroy(this.dw_real)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_2)
destroy(this.em_1)
end on

type pb_2 from pb_report within tp_2
integer x = 1545
integer y = 8
integer taborder = 50
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir"
string cod_rep = "LBR"
string nombre_rep = "Laboratorios Realizados"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[5]
par[1]=i_area
par[2]=dw_grup.getitemnumber(1,1)
par[3]=dw_tip_ingres.getitemstring(1,1)
par[4]=datetime(date(em_1.text),time('00:00'))
par[5]=datetime(date(em_2.text),time('23:59:59'))
imprimir(par,'','0')

end event

type pb_traer from picturebutton within tp_2
integer x = 1362
integer y = 8
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "refrescar.gif"
string powertiptext = "Traer datos"
end type

event clicked;string tingres,lug
long grupo
datetime fecha1,fecha2
grupo=dw_grup.getitemnumber(1,1)
tingres=dw_tip_ingres.getitemstring(1,1)
if rb_7.checked then lug='%'
if rb_8.checked then lug=dw_lug.getitemstring(1,1)
if isnull(i_area) or isnull(grupo) or isnull(tingres) then return
fecha1=datetime(date(t_1.tp_2.em_1.text),time('00:00'))
fecha2=datetime(date(t_1.tp_2.em_2.text),time('23:59:59'))
dw_real.retrieve(i_area,grupo,tingres,fecha1,fecha2,lug)

end event

type dw_real from datawindow within tp_2
integer y = 172
integer width = 4777
integer height = 1500
integer taborder = 40
string title = "none"
string dataobject = "dw_apdx_hechos"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if getrow()<1 or row<1 then return
if getrow()<>row then scrolltorow(row)
if tipdoc<>getitemstring(getrow(),'tipodoc') or docu<>getitemstring(getrow(),'documento') then
	w_principal.dw_1.setitem(1,"tipodoc",getitemstring(getrow(),'tipodoc'))
	w_principal.dw_1.setitem(1,"documento",getitemstring(getrow(),'documento'))
	w_principal.dw_1.setcolumn("documento")
	w_principal.dw_1.triggerevent(itemchanged!)	
end if
if dw_tip_ingres.getitemstring(1,1)<>w_apoyo_diag2.dw_tip_ingres.getitemstring(1,1) then
	w_apoyo_diag2.dw_tip_ingres.setitem(1,1,dw_tip_ingres.getitemstring(1,1))
	w_apoyo_diag2.dw_tip_ingres.event itemchanged(1,w_apoyo_diag2.dw_tip_ingres.object.codtingre,dw_tip_ingres.getitemstring(1,1))
end if
datawindow dw_t
dw_t=w_apoyo_diag2.dw_hist
dw_t.scrolltorow(dw_t.find('ningreso='+string(getitemnumber(getrow(),'ningreso')),1,dw_t.rowcount()))
close(f_vent_padre(this))
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
openwithparm(w_funcion_dw,st_dw)
end event

type st_2 from statictext within tp_2
integer x = 745
integer y = 36
integer width = 151
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_1 from statictext within tp_2
integer x = 14
integer y = 36
integer width = 174
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type em_2 from editmask within tp_2
integer x = 937
integer y = 32
integer width = 375
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type em_1 from editmask within tp_2
integer x = 192
integer y = 36
integer width = 366
integer height = 80
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean autoskip = true
boolean spin = true
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type tp_3 from userobject within t_1
integer x = 18
integer y = 112
integer width = 4837
integer height = 1704
long backcolor = 67108864
string text = "Realizado agrupado"
long tabtextcolor = 33554432
string picturename = "ComputeSum!"
long picturemaskcolor = 536870912
pb_3 pb_3
pb_1 pb_1
em_4 em_4
st_4 st_4
st_3 st_3
em_3 em_3
dw_suma dw_suma
end type

on tp_3.create
this.pb_3=create pb_3
this.pb_1=create pb_1
this.em_4=create em_4
this.st_4=create st_4
this.st_3=create st_3
this.em_3=create em_3
this.dw_suma=create dw_suma
this.Control[]={this.pb_3,&
this.pb_1,&
this.em_4,&
this.st_4,&
this.st_3,&
this.em_3,&
this.dw_suma}
end on

on tp_3.destroy
destroy(this.pb_3)
destroy(this.pb_1)
destroy(this.em_4)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_3)
destroy(this.dw_suma)
end on

type pb_3 from pb_report within tp_3
integer x = 1746
integer taborder = 20
string picturename = "print2.gif"
string disabledname = "d_print2.gif"
string powertiptext = "Imprimir"
string cod_rep = "LBRA"
string nombre_rep = "Laboratorios realizados agrupados"
string tipo_rep = "interno!"
end type

event clicked;call super::clicked;any par[5]
par[1]=i_area
par[2]=dw_grup.getitemnumber(1,1)
par[3]=dw_tip_ingres.getitemstring(1,1)
par[4]=datetime(date(left(em_3.text,10)),time(right(em_3.text,5)))
par[5]=datetime(date(left(em_4.text,10)),time(right(em_4.text,5)))
imprimir(par,'','0')

end event

type pb_1 from picturebutton within tp_3
integer x = 1563
integer width = 146
integer height = 128
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "refrescar.gif"
string powertiptext = "Traer datos"
end type

event clicked;string tingres,lug
long grupo
datetime fecha1,fecha2
grupo=dw_grup.getitemnumber(1,1)
tingres=dw_tip_ingres.getitemstring(1,1)
if rb_7.checked then lug='%'
if rb_8.checked then lug=dw_lug.getitemstring(1,1)
if isnull(i_area) or isnull(grupo) or isnull(tingres) then return
fecha1=datetime(date(left(em_3.text,10)),time(right(em_3.text,5)))
fecha2=datetime(date(left(em_4.text,10)),time(right(em_4.text,5)))
dw_suma.retrieve(i_area,grupo,tingres,fecha1,fecha2,lug)

end event

type em_4 from editmask within tp_3
integer x = 946
integer y = 28
integer width = 535
integer height = 80
integer taborder = 60
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
boolean autoskip = true
boolean spin = true
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type st_4 from statictext within tp_3
integer x = 805
integer y = 28
integer width = 151
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Hasta:"
boolean focusrectangle = false
end type

type st_3 from statictext within tp_3
integer x = 32
integer y = 32
integer width = 160
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Desde:"
boolean focusrectangle = false
end type

type em_3 from editmask within tp_3
integer x = 192
integer y = 28
integer width = 535
integer height = 80
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy hh:mm"
boolean autoskip = true
boolean spin = true
end type

event constructor;text=string(today(),'dd/mm/yyyy')
end event

type dw_suma from datawindow within tp_3
integer x = 41
integer y = 176
integer width = 4750
integer height = 1488
integer taborder = 40
string title = "none"
string dataobject = "dw_apdx_hechos_suma"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

type dw_grup from datawindow within w_trab_labo
integer x = 9
integer y = 8
integer width = 1554
integer height = 80
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_combo_gclinic"
boolean border = false
end type

event constructor;insertrow(1)
getchild('codgc',idw_grupo)
idw_grupo.settransobject(sqlca)

end event

event itemchanged;accepttext()
traer()
end event

