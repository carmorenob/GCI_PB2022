$PBExportHeader$w_cual_tot.srw
forward
global type w_cual_tot from window
end type
type dw_1 from datawindow within w_cual_tot
end type
type pb_ok from picturebutton within w_cual_tot
end type
end forward

global type w_cual_tot from window
integer width = 2555
integer height = 728
boolean titlebar = true
string title = "Tipo de Actividad Final"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Question!"
boolean center = true
dw_1 dw_1
pb_ok pb_ok
end type
global w_cual_tot w_cual_tot

type variables
boolean i_cerrar=false
end variables

event open;// cuando el contrato de es de tipo actividad final se debe 
// preguntar el tipo de tot obligatoramente
long j
j=dw_1.retrieve(message.stringparm)
if j=0 then
	messagebox('Atención','No se han definido actividades finales para el tipo: '+message.stringparm)
	message.stringparm=''
	i_cerrar=true
	close(this)
elseif j=1 then
	pb_ok.event clicked()
end if
end event

on w_cual_tot.create
this.dw_1=create dw_1
this.pb_ok=create pb_ok
this.Control[]={this.dw_1,&
this.pb_ok}
end on

on w_cual_tot.destroy
destroy(this.dw_1)
destroy(this.pb_ok)
end on

event closequery;if not i_cerrar then return 1
end event

type dw_1 from datawindow within w_cual_tot
integer width = 2537
integer height = 496
integer taborder = 10
string title = "none"
string dataobject = "dw_act_final_x_tipo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;settransobject(sqlca)
end event

event doubleclicked;if row<1 then return
pb_ok.event clicked()
end event

type pb_ok from picturebutton within w_cual_tot
integer x = 1115
integer y = 504
integer width = 142
integer height = 124
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "             &a"
boolean default = true
boolean flatstyle = true
boolean originalsize = true
string picturename = "aceptar.gif"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;i_cerrar=true
closewithreturn (parent,dw_1.getitemstring(dw_1.getrow(),'cod_activid'))
end event

