$PBExportHeader$w_reportes_adm.srw
forward
global type w_reportes_adm from window
end type
type dw_1 from datawindow within w_reportes_adm
end type
end forward

global type w_reportes_adm from window
integer width = 3351
integer height = 2280
boolean titlebar = true
string title = "Reportes disponibles"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_1 dw_1
end type
global w_reportes_adm w_reportes_adm

on w_reportes_adm.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on w_reportes_adm.destroy
destroy(this.dw_1)
end on

event open;dw_1.retrieve(usuario)
end event

type dw_1 from datawindow within w_reportes_adm
integer x = 32
integer y = 44
integer width = 3278
integer height = 2060
integer taborder = 10
string title = "none"
string dataobject = "dw_reportes_adm"
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
f_abrerepor(cod_rep,p_fila,i_rep_adm[])
close(parent)
end event

