$PBExportHeader$w_reps_cups.srw
$PBExportComments$Configura los campos de APDX
forward
global type w_reps_cups from window
end type
type t1 from tab within w_reps_cups
end type
type p1 from userobject within t1
end type
type pb_5 from picturebutton within p1
end type
type pb_4 from picturebutton within p1
end type
type pb_3 from picturebutton within p1
end type
type st_2 from statictext within p1
end type
type dw_2 from datawindow within p1
end type
type p1 from userobject within t1
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_2 dw_2
end type
type t1 from tab within w_reps_cups
p1 p1
end type
type st_1 from statictext within w_reps_cups
end type
type dw_6 from datawindow within w_reps_cups
end type
type dw_1 from datawindow within w_reps_cups
end type
type gb_1 from groupbox within w_reps_cups
end type
end forward

global type w_reps_cups from window
string tag = "Configuración Reps Cups"
integer width = 3552
integer height = 2428
boolean titlebar = true
string title = "Configuración Reps Cups"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "Project!"
string pointer = "Arrow!"
boolean clientedge = true
t1 t1
st_1 st_1
dw_6 dw_6
dw_1 dw_1
gb_1 gb_1
end type
global w_reps_cups w_reps_cups

type variables
datawindowchild area,docus
string anterior,orden
long il_DragSource, il_DropTarget, il_DragParent, il_rclick, i_fila
end variables

on w_reps_cups.create
this.t1=create t1
this.st_1=create st_1
this.dw_6=create dw_6
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.t1,&
this.st_1,&
this.dw_6,&
this.dw_1,&
this.gb_1}
end on

on w_reps_cups.destroy
destroy(this.t1)
destroy(this.st_1)
destroy(this.dw_6)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;t1.p1.dw_2.settransobject(SQLCA)
dw_6.settransobject(SQLCA)
dw_6.retrieve()

dw_1.settransobject(SQLCA)
dw_1.retrieve(dw_6.getitemstring(1,1))



end event

event resize;//t1.resize(newwidth -50, newheight -780)
//t1.p1.dw_2.resize(t1.width - 300 ,t1.height - 250 )
//t1.p1.st_2.y=t1.p1.dw_2.y +t1.p1.dw_2.height +10
//t1.p1.st_2.x=t1.p1.dw_2.x +t1.p1.dw_2.width - 598
//t1.p1.pb_3.x=t1.p1.dw_2.x+t1.p1.dw_2.width+ 50
//t1.p1.pb_4.x=t1.p1.dw_2.x+t1.p1.dw_2.width+ 50
//t1.p1.pb_5.x=t1.p1.dw_2.x+t1.p1.dw_2.width+ 50
//
//t1.p2.resize(1115, t1.height - 50 )
//t1.p2.tv_1.resize(1376, t1.height - 250 )
//
//t1.p2.cb_8.y=t1.p2.height - 220
//t1.p2.cb_9.y=t1.p2.height - 220
//t1.p2.cb_10.y=t1.p2.height - 220
end event

type t1 from tab within w_reps_cups
event create ( )
event destroy ( )
integer x = 41
integer y = 764
integer width = 3424
integer height = 1452
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean raggedright = true
boolean focusonbuttondown = true
boolean powertips = true
alignment alignment = center!
integer selectedtab = 1
p1 p1
end type

on t1.create
this.p1=create p1
this.Control[]={this.p1}
end on

on t1.destroy
destroy(this.p1)
end on

type p1 from userobject within t1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3387
integer height = 1324
long backcolor = 67108864
string text = "Procedimientos"
long tabtextcolor = 33554432
string picturename = "ap_dx.ico"
long picturemaskcolor = 536870912
pb_5 pb_5
pb_4 pb_4
pb_3 pb_3
st_2 st_2
dw_2 dw_2
end type

on p1.create
this.pb_5=create pb_5
this.pb_4=create pb_4
this.pb_3=create pb_3
this.st_2=create st_2
this.dw_2=create dw_2
this.Control[]={this.pb_5,&
this.pb_4,&
this.pb_3,&
this.st_2,&
this.dw_2}
end on

on p1.destroy
destroy(this.pb_5)
destroy(this.pb_4)
destroy(this.pb_3)
destroy(this.st_2)
destroy(this.dw_2)
end on

type pb_5 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 3191
integer y = 312
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &u"
boolean originalsize = true
string picturename = "guardar.gif"
string disabledname = "d_guardar.gif"
alignment htextalign = left!
string powertiptext = "G&uardar"
end type

event clicked;if f_permiso_boton(this,'RCUP')=0 then return
if dw_2.update()<1 then
	rollback;
else
	commit;
end if
end event

type pb_4 from picturebutton within p1
event mousemove pbm_mousemove
integer x = 3191
integer y = 176
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "            &r"
boolean originalsize = true
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Bo&rrar Procedimiento"
end type

event clicked;if f_permiso_boton(this,'APDI')=0 then return
dw_2.deleterow(0)
pb_5.triggerevent(clicked!)
end event

type pb_3 from picturebutton within p1
event mousemove pbm_mousemove
string tag = "              &P"
integer x = 3191
integer y = 44
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Nuevo &Procedimiento"
end type

event clicked;if f_permiso_boton(this,'RCUP')=0 then return
if dw_1.rowcount()=0 then return
open(w_busca_proc)
end event

type st_2 from statictext within p1
integer x = 3429
integer y = 1244
integer width = 594
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_2 from datawindow within p1
integer y = 48
integer width = 3127
integer height = 1208
integer taborder = 30
string dragicon = "none!"
string dataobject = "dw_pm_servicios_proced"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;if dwo.type = "text" then 
	string cual,ojo,ss
	cual=dwo.name
	cual=mid(cual,1,len(cual) - 2)
	if anterior=cual then
		if orden="A" then
			orden="D"
		else
			orden="A"
		end if
	else
		orden="A"
	end if
	this.setsort(cual+" "+orden)
	this.sort()
	anterior=cual
end if

end event

event retrieveend;if rowcount=0 then st_2.text=""
end event

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
st_dw.color_fondo=string(rgb(255,255,255))
i_fila=-1
openwithparm(w_funcion_dw,st_dw)
end event

type st_1 from statictext within w_reps_cups
integer x = 41
integer y = 24
integer width = 439
integer height = 84
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Grupo Servicio :"
boolean focusrectangle = false
end type

type dw_6 from datawindow within w_reps_cups
integer x = 503
integer y = 12
integer width = 1586
integer height = 68
integer taborder = 10
string title = "none"
string dataobject = "dw_combo_grp_servicio_drop"
boolean border = false
boolean livescroll = true
end type

event itemchanged;accepttext()
dw_1.reset()
dw_1.retrieve(getitemstring(1,1))

end event

type dw_1 from datawindow within w_reps_cups
integer x = 82
integer y = 168
integer width = 2958
integer height = 548
integer taborder = 20
string dragicon = "none!"
string dataobject = "dw_pm_servicios_grilla"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;long fila
string tipo

fila=getrow()
t1.p1.dw_2.reset()
if fila<1 then return
tipo=getitemstring(fila,'cod_serv')
t1.p1.dw_2.retrieve(tipo)

end event

event retrieveend;if dw_1.rowcount()=0 then
	t1.p1.dw_2.reset()
end if
end event

type gb_1 from groupbox within w_reps_cups
integer x = 37
integer y = 100
integer width = 3063
integer height = 656
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Servicios:"
end type

