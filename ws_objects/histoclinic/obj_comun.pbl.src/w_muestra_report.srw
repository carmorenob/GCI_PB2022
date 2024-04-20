$PBExportHeader$w_muestra_report.srw
forward
global type w_muestra_report from window
end type
type dw_report from datawindow within w_muestra_report
end type
end forward

global type w_muestra_report from window
integer width = 1458
integer height = 216
boolean titlebar = true
string title = "Reportes de menús"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "print.ico"
boolean center = true
dw_report dw_report
end type
global w_muestra_report w_muestra_report

type variables
uo_report i_report
blob i_archivo
long i_antrow
string i_carreta,i_todo
end variables

on w_muestra_report.create
this.dw_report=create dw_report
this.Control[]={this.dw_report}
end on

on w_muestra_report.destroy
destroy(this.dw_report)
end on

event open;dw_report.retrieve(usuario,message.stringparm)

end event

type dw_report from datawindow within w_muestra_report
event mousemove pbm_dwnmousemove
event keypres pbm_dwnkey
integer width = 1440
integer height = 96
integer taborder = 10
string title = "none"
string dataobject = "dw_muestra_report"
boolean vscrollbar = true
boolean border = false
end type

event mousemove;if row<1 then return
setrow(row)
f_microhelp((dw_report.getitemstring(row,'comentario')))

end event

event keypres;if key=keyenter! then
	event clicked(pointerx(),pointery(),getrow(),object.descripcion)
	return 1
end if
end event

event constructor;settransobject(SQLCA)


end event

event clicked;if row=0 then return
i_report=create uo_report
i_report.cod_rep=this.getitemstring( row,'cod_rep')
i_report.tipo_rep='menu!'
if i_report.inicia( ) = -1 then return
i_report.imprimir( {""},"",'0')
close(parent )
end event

event retrieveend;long a,b
if rowcount( ) < 15 then
	a = rowcount( ) * 80
else
	a = 15 * 80
end if
height= a
parent.height=a +100


end event

