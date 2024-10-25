$PBExportHeader$w_reportes_asis.srw
forward
global type w_reportes_asis from window
end type
type dw_1 from datawindow within w_reportes_asis
end type
end forward

global type w_reportes_asis from window
integer width = 3351
integer height = 2280
boolean titlebar = true
string title = "Reportes Asistenciales Disponibles"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "r_rasis.ico"
boolean center = true
dw_1 dw_1
end type
global w_reportes_asis w_reportes_asis

on w_reportes_asis.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_reportes_asis.destroy
destroy(this.dw_1)
end on

event open;dw_1.retrieve(usuario)
end event

type dw_1 from datawindow within w_reportes_asis
integer x = 32
integer y = 44
integer width = 3278
integer height = 2104
integer taborder = 10
string title = "none"
string dataobject = "dw_reportes_asis"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;SetTransObject(SQLCA)

end event

event doubleclicked;int p_fila
string cod_rep
if rowcount()<=0 then close(parent)

p_fila=dw_1.getrow()

cod_rep=dw_1.getitemstring(dw_1.getrow(),'cod_rep')
f_abrerepor(cod_rep,p_fila,i_rep_asis[])
close(parent)
end event

