$PBExportHeader$w_busca_devoluciones.srw
forward
global type w_busca_devoluciones from window
end type
type pb_cancel from picturebutton within w_busca_devoluciones
end type
type pb_ok from picturebutton within w_busca_devoluciones
end type
type dw_1 from datawindow within w_busca_devoluciones
end type
end forward

global type w_busca_devoluciones from window
integer width = 2533
integer height = 932
boolean titlebar = true
string title = "Pagos Directos del Tercero para registrar como Devolución"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
pb_cancel pb_cancel
pb_ok pb_ok
dw_1 dw_1
end type
global w_busca_devoluciones w_busca_devoluciones

type variables
datawindow i_dw
end variables

on w_busca_devoluciones.create
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.dw_1=create dw_1
this.Control[]={this.pb_cancel,&
this.pb_ok,&
this.dw_1}
end on

on w_busca_devoluciones.destroy
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.dw_1)
end on

event open;i_dw=message.powerobjectparm
dw_1.retrieve(i_dw.getitemstring(1,'tipodoc'),i_dw.getitemstring(1,'documento'))

string j1,j2

j1=i_dw.getitemstring(1,'tipodoc')
j2=i_dw.getitemstring(1,'documento')

end event

type pb_cancel from picturebutton within w_busca_devoluciones
integer x = 1239
integer y = 712
integer width = 151
integer height = 132
integer taborder = 30
integer textsize = -10
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

type pb_ok from picturebutton within w_busca_devoluciones
integer x = 1074
integer y = 712
integer width = 151
integer height = 132
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;if dw_1.rowcount()=0 then return
//if dw_1.getitemnumber(1,'t_devolver')=0 then return
datawindow dw_t1
dw_t1=w_recibe_fact.tab_2.t2_3.t5.t5_4.tab_legal.tab_pro.dw_legal_cpo
dec jar
if dw_1.getitemnumber(1,'t_devolver')>dw_t1.getitemnumber(1,'total') then
	messagebox('Atención','No puede devolver más de lo que se radicó')
	return
end if
datawindow dw_t
dw_t=w_recibe_fact.tab_2.t2_3.t5.t5_4.tab_legal.tab_devo.dw_devo
long j,donde
for j=1 to dw_1.rowcount()
	if dw_1.getitemnumber(j,'esco')=0 then continue
	donde=dw_t.insertrow(0)
	dw_t.setitem(donde,'coddoc',dw_1.getitemstring(j,'coddoc'))
	dw_t.setitem(donde,'clugar',dw_1.getitemstring(j,'clugar'))
	dw_t.setitem(donde,'num_ingreso',dw_1.getitemnumber(j,'num_ingreso'))
//	dw_t.setitem(donde,'fecha_legal',dw_1.getitemdatetime(j,'fecha'))
	dw_t.setitem(donde,'impu',dw_1.getitemstring(j,'impu'))
	dw_t.setitem(donde,'valor',dw_1.getitemnumber(j,'valor'))
	dw_t.setitem(donde,'tnotadeb',dw_1.getitemnumber(j,'tnotadeb'))
	dw_t.setitem(donde,'tnotacred',dw_1.getitemnumber(j,'tnotacred'))
next
dw_t.resetupdate()
w_recibe_fact.lf_devol()
close(parent)
end event

type dw_1 from datawindow within w_busca_devoluciones
integer width = 2487
integer height = 704
integer taborder = 10
string title = "none"
string dataobject = "dw_pagodir_recep"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

