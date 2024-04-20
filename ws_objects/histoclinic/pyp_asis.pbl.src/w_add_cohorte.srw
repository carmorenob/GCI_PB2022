$PBExportHeader$w_add_cohorte.srw
forward
global type w_add_cohorte from window
end type
type st_1 from statictext within w_add_cohorte
end type
type pb_cancel from picturebutton within w_add_cohorte
end type
type pb_ok from picturebutton within w_add_cohorte
end type
type mle_1 from multilineedit within w_add_cohorte
end type
type dw_cohortes from uo_datawindow within w_add_cohorte
end type
end forward

global type w_add_cohorte from window
integer width = 2226
integer height = 1960
boolean titlebar = true
string title = "Crear nuevo Cohorte a Paciente"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
pb_cancel pb_cancel
pb_ok pb_ok
mle_1 mle_1
dw_cohortes dw_cohortes
end type
global w_add_cohorte w_add_cohorte

on w_add_cohorte.create
this.st_1=create st_1
this.pb_cancel=create pb_cancel
this.pb_ok=create pb_ok
this.mle_1=create mle_1
this.dw_cohortes=create dw_cohortes
this.Control[]={this.st_1,&
this.pb_cancel,&
this.pb_ok,&
this.mle_1,&
this.dw_cohortes}
end on

on w_add_cohorte.destroy
destroy(this.st_1)
destroy(this.pb_cancel)
destroy(this.pb_ok)
destroy(this.mle_1)
destroy(this.dw_cohortes)
end on

event open;dw_cohortes.settransobject(sqlca)
string ls_sexo='1'
if w_principal.dw_1.getitemstring(1,'sexo')='F' then ls_sexo='2'
dw_cohortes.retrieve(&
	w_principal.dw_1.getitemstring(1,'tipodoc'),&
	w_principal.dw_1.getitemstring(1,'documento'),&
	ls_sexo,&
	w_principal.dw_1.getitemnumber(1,'dias')&
)
	
end event

type st_1 from statictext within w_add_cohorte
integer x = 78
integer y = 824
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Observaciones"
boolean focusrectangle = false
end type

type pb_cancel from picturebutton within w_add_cohorte
integer x = 969
integer y = 1696
integer width = 146
integer height = 128
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
end type

event clicked;Close ( parent )
end event

type pb_ok from picturebutton within w_add_cohorte
integer x = 782
integer y = 1692
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
string picturename = "aceptar.gif"
alignment htextalign = left!
end type

event clicked;if dw_cohortes.rowcount()=0 then return

if dw_cohortes.accepttext()=-1 then return

if isnull(dw_cohortes.getitemdatetime(dw_cohortes.getrow(),'fecha_inicio')) then
	messagebox("Atención","Debe digitar la fecha de Ingreso al programa")
	return
end if

if trim(mle_1.text)='' then 
	messagebox("Atención","Debe digitar las observaciones")
	return
end if

st_add_cohorte lst

lst.id_getareo=dw_cohortes.getitemstring(dw_cohortes.getrow(),'codgetareo')
lst.descrip_getareo=dw_cohortes.getitemstring(dw_cohortes.getrow(),'desgetareo')
lst.vitalicio=dw_cohortes.getitemstring(dw_cohortes.getrow(),'vitalicio')
lst.fecha_inicio=dw_cohortes.getitemdatetime(dw_cohortes.getrow(),'fecha_inicio')
lst.observaciones=mle_1.text
CloseWithReturn ( parent, lst )
end event

type mle_1 from multilineedit within w_add_cohorte
integer x = 59
integer y = 892
integer width = 2062
integer height = 760
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 2000
borderstyle borderstyle = stylelowered!
end type

type dw_cohortes from uo_datawindow within w_add_cohorte
integer x = 50
integer y = 48
integer width = 2089
integer height = 732
integer taborder = 10
string dataobject = "dw_new_cohorte_manual"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = false
end type

