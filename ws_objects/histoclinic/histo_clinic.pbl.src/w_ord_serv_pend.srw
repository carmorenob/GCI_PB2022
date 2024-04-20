$PBExportHeader$w_ord_serv_pend.srw
forward
global type w_ord_serv_pend from window
end type
type pb_2 from picturebutton within w_ord_serv_pend
end type
type pb_1 from picturebutton within w_ord_serv_pend
end type
type dw_servicios from datawindow within w_ord_serv_pend
end type
type dw_ord_serv from datawindow within w_ord_serv_pend
end type
end forward

global type w_ord_serv_pend from window
integer width = 3291
integer height = 1452
boolean titlebar = true
string title = "Ordenes de Servicio Anteriores no registradas"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "os.ico"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
dw_servicios dw_servicios
dw_ord_serv dw_ord_serv
end type
global w_ord_serv_pend w_ord_serv_pend

on w_ord_serv_pend.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_servicios=create dw_servicios
this.dw_ord_serv=create dw_ord_serv
this.Control[]={this.pb_2,&
this.pb_1,&
this.dw_servicios,&
this.dw_ord_serv}
end on

on w_ord_serv_pend.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_servicios)
destroy(this.dw_ord_serv)
end on

event open;dw_ord_serv.settransobject(sqlca)
dw_servicios.settransobject(sqlca)
dw_ord_serv.retrieve(tipdoc,docu,datetime(today()))
end event

type pb_2 from picturebutton within w_ord_serv_pend
integer x = 3013
integer y = 832
integer width = 146
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar"
end type

event clicked;close(parent)
end event

type pb_1 from picturebutton within w_ord_serv_pend
integer x = 3013
integer y = 700
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar"
end type

event clicked;dw_ord_serv.triggerevent(doubleclicked!)
end event

type dw_servicios from datawindow within w_ord_serv_pend
integer x = 229
integer y = 676
integer width = 2738
integer height = 576
integer taborder = 20
string title = "none"
string dataobject = "dw_oscuerpo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;this.modify("examen.protect=1")
this.modify("cantidad.protect=1")
this.modify("codproced.protect=1")
end event

type dw_ord_serv from datawindow within w_ord_serv_pend
integer x = 55
integer y = 60
integer width = 3095
integer height = 508
integer taborder = 10
string title = "none"
string dataobject = "dw_oser_pend"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.getrow()<1 then return
long conta,nserv
string clug
conta=this.getitemnumber(this.getrow(),"contador")
nserv=this.getitemnumber(this.getrow(),"nsolicitud")
clug=this.getitemstring(this.getrow(),"clugar")
dw_servicios.retrieve(conta,nserv,clug)
end event

event doubleclicked;if this.getrow()<1 then return
this.setitem(this.getrow(),"embarazada","1")
if this.update()= -1 then
	rollback;
	Messagebox("Error","Error actualizando estado de la orden de servicio")
else
	long i,j
	for i=1 to dw_servicios.rowcount()
		w_embarazo.tab_1.tabpage_cont.pb_nuevo.triggerevent(clicked!)
		j=w_embarazo.tab_1.tabpage_cont.dw_exam_control.getrow()
		w_embarazo.tab_1.tabpage_cont.dw_exam_control.setitem(j,"examen",dw_servicios.getitemstring(i,"examen"))
		w_embarazo.tab_1.tabpage_cont.dw_exam_control.setitem(j,"clugar_his",this.getitemstring(i,"clugar"))
		w_embarazo.tab_1.tabpage_cont.dw_exam_control.setitem(j,"contador",this.getitemnumber(i,"contador"))
		w_embarazo.tab_1.tabpage_cont.dw_exam_control.setitem(j,"nsolicitud",this.getitemnumber(i,"nsolicitud"))
	next
	close(parent)
end if
end event

