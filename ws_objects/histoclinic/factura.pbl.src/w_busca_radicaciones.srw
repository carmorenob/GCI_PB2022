$PBExportHeader$w_busca_radicaciones.srw
forward
global type w_busca_radicaciones from window
end type
type pb_3 from picturebutton within w_busca_radicaciones
end type
type pb_2 from picturebutton within w_busca_radicaciones
end type
type pb_1 from picturebutton within w_busca_radicaciones
end type
type dw_1 from datawindow within w_busca_radicaciones
end type
end forward

global type w_busca_radicaciones from window
integer width = 3447
integer height = 1040
boolean titlebar = true
string title = "Radicaciones Contabilizadas y que están en cartera."
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "buscar.ico"
boolean center = true
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_1 dw_1
end type
global w_busca_radicaciones w_busca_radicaciones

type variables
datawindow i_dw
end variables

on w_busca_radicaciones.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_1=create dw_1
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_1}
end on

on w_busca_radicaciones.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_1)
end on

event open;i_dw=message.powerobjectparm
end event

type pb_3 from picturebutton within w_busca_radicaciones
integer x = 1669
integer y = 772
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "ayuda.gif"
string disabledname = "d_ayuda.gif"
alignment htextalign = left!
end type

type pb_2 from picturebutton within w_busca_radicaciones
integer x = 1499
integer y = 772
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "cancelar.gif"
string disabledname = "d_cancelar.gif"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_busca_radicaciones
integer x = 1335
integer y = 772
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean originalsize = true
string picturename = "aceptar.gif"
string disabledname = "d_aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar Radicación"
end type

event clicked;if dw_1.rowcount()=0 THEN RETURN
i_dw.insertrow(1)
i_dw.setitem(1,'num_radicacion',dw_1.getitemnumber(dw_1.getrow(),'num_radicacion'))
i_dw.setitem(1,'clugar',dw_1.getitemstring(dw_1.getrow(),'clugar'))
i_dw.setitem(1,'tipo',dw_1.getitemstring(dw_1.getrow(),'tipo'))
i_dw.setitem(1,'desemp',dw_1.getitemstring(dw_1.getrow(),'desemp'))
i_dw.setitem(1,'fecha_radica',dw_1.getitemdatetime(dw_1.getrow(),'fecha_radica'))
i_dw.setrow(1)
i_dw.event rowfocuschanged(1)
CLOSE(PARENT)
end event

type dw_1 from datawindow within w_busca_radicaciones
integer x = 27
integer y = 28
integer width = 3342
integer height = 724
integer taborder = 10
string title = "none"
string dataobject = "dw_rad_pendientes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;st_dw_xa_funciones st_dw
st_dw.dw=this
st_dw.dwo=dwo
st_dw.row=row
openwithparm(w_funcion_dw,st_dw)
end event

event constructor;settransobject( SQLCA)
retrieve( )
end event

event doubleclicked;PB_1.event clicked()
end event

