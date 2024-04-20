$PBExportHeader$w_plan_medica.srw
forward
global type w_plan_medica from window
end type
type pb_3 from picturebutton within w_plan_medica
end type
type pb_2 from picturebutton within w_plan_medica
end type
type pb_1 from picturebutton within w_plan_medica
end type
type dw_plan_med from datawindow within w_plan_medica
end type
type st_1 from statictext within w_plan_medica
end type
type dw_plan from datawindow within w_plan_medica
end type
end forward

global type w_plan_medica from window
integer width = 2432
integer height = 1684
boolean titlebar = true
string title = "Configuración de planes de Medicamentos y Medico-Quirúrgicos"
boolean controlmenu = true
boolean minbox = true
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "ribon_tarmed.ico"
pb_3 pb_3
pb_2 pb_2
pb_1 pb_1
dw_plan_med dw_plan_med
st_1 st_1
dw_plan dw_plan
end type
global w_plan_medica w_plan_medica

type variables
boolean guardo
end variables

on w_plan_medica.create
this.pb_3=create pb_3
this.pb_2=create pb_2
this.pb_1=create pb_1
this.dw_plan_med=create dw_plan_med
this.st_1=create st_1
this.dw_plan=create dw_plan
this.Control[]={this.pb_3,&
this.pb_2,&
this.pb_1,&
this.dw_plan_med,&
this.st_1,&
this.dw_plan}
end on

on w_plan_medica.destroy
destroy(this.pb_3)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.dw_plan_med)
destroy(this.st_1)
destroy(this.dw_plan)
end on

event open;guardo=true
dw_plan.retrieve()
end event

type pb_3 from picturebutton within w_plan_medica
string tag = "&Borrar"
integer x = 2117
integer y = 836
integer width = 146
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "borrar_fila.gif"
alignment htextalign = left!
end type

event clicked;dw_plan_med.deleterow(0)
end event

type pb_2 from picturebutton within w_plan_medica
string tag = "Nuevo &Med"
integer x = 2117
integer y = 684
integer width = 146
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "insertar.GIF"
alignment htextalign = left!
end type

event clicked;if not dw_plan_med.visible then return
long cuantos
cuantos=dw_plan_med.rowcount()
st_pa_medica st
st.dw=dw_plan_med
st.valor=dw_plan.getitemstring(dw_plan.getrow(),"codplan")
st.campo='codplan'
st.origen='1'
openwithparm(w_busca_med,st)
if dw_plan_med.rowcount()<>cuantos then guardo=false

end event

type pb_1 from picturebutton within w_plan_medica
string tag = "&Guardar"
integer x = 1897
integer y = 108
integer width = 146
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean originalsize = true
string picturename = "guardar.GIF"
alignment htextalign = left!
end type

event clicked;if dw_plan.getitemstring(dw_plan.getrow(),3)="4" and dw_plan_med.rowcount()=0 then
	messagebox("Error","Este plan es personalizado y no tiene medicamentos asignados")
	return
end if
if dw_plan_med.update()=-1 then
	rollback;
	return
else
	if dw_plan.update()=-1 then
		rollback;
	else
		commit;
		guardo=true
	end if
end if
end event

type dw_plan_med from datawindow within w_plan_medica
integer x = 23
integer y = 684
integer width = 2057
integer height = 728
integer taborder = 20
string title = "none"
string dataobject = "dw_plan_medica"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)
end event

type st_1 from statictext within w_plan_medica
integer x = 41
integer y = 24
integer width = 1810
integer height = 72
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Planes de medicamentos"
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

type dw_plan from datawindow within w_plan_medica
integer x = 41
integer y = 92
integer width = 1806
integer height = 492
integer taborder = 10
string title = "none"
string dataobject = "dw_plan_resumen_med"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event constructor;this.settransobject(sqlca)

end event

event itemchanged;this.accepttext()
if this.getcolumnname()="t_incluirmed" then
	if data="4" then
		dw_plan_med.visible=true
		dw_plan_med.retrieve(this.getitemstring(this.getrow(),"codplan"))
	else
		dw_plan_med.visible=false
	end if
end if
end event

event rowfocuschanged;if this.getrow()<1 then return
if this.getitemstring(this.getrow(),"t_incluirmed")="4" then
	dw_plan_med.visible=true
	dw_plan_med.retrieve(this.getitemstring(this.getrow(),"codplan"))
	guardo=true
else
	dw_plan_med.visible=false
end if

end event

event retrieveend;this.triggerevent(rowfocuschanged!)
end event

event rowfocuschanging;if not guardo then
	choose case messagebox("Atención","No ha guardado los cambios de este plan, desea guardarlos ahora ?",question!,yesnocancel!,1)
		case 1
			pb_1.triggerevent(clicked!)
		case 2
		case 3
			return 1
	end choose
end if

end event

