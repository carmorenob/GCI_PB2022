$PBExportHeader$w_busca_rias.srw
forward
global type w_busca_rias from window
end type
type pb_2 from picturebutton within w_busca_rias
end type
type pb_1 from picturebutton within w_busca_rias
end type
type cb_aceptar from picturebutton within w_busca_rias
end type
type st_1 from statictext within w_busca_rias
end type
type dw_busca from datawindow within w_busca_rias
end type
end forward

global type w_busca_rias from window
integer x = 402
integer y = 400
integer width = 2286
integer height = 848
boolean titlebar = true
string title = "Busqueda Rápida de Pacientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "buscar.ico"
string pointer = "Arrow!"
boolean clientedge = true
boolean center = true
pb_2 pb_2
pb_1 pb_1
cb_aceptar cb_aceptar
st_1 st_1
dw_busca dw_busca
end type
global w_busca_rias w_busca_rias

type variables
string ordenar[9]
end variables

on w_busca_rias.create
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_aceptar=create cb_aceptar
this.st_1=create st_1
this.dw_busca=create dw_busca
this.Control[]={this.pb_2,&
this.pb_1,&
this.cb_aceptar,&
this.st_1,&
this.dw_busca}
end on

on w_busca_rias.destroy
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_aceptar)
destroy(this.st_1)
destroy(this.dw_busca)
end on

event open;dw_busca.insertrow(0)

end event

type pb_2 from picturebutton within w_busca_rias
integer x = 2062
integer y = 100
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
string picturename = "borrar_fila.GIF"
string disabledname = "d_borrar_fila.GIF"
alignment htextalign = left!
string powertiptext = "Borrar Fila"
end type

event clicked;if dw_busca.rowcount()= 1 then return
dw_busca.deleterow(0)
end event

type pb_1 from picturebutton within w_busca_rias
event mousemove pbm_mousemove
integer x = 1056
integer y = 596
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "        &c"
boolean cancel = true
boolean originalsize = true
string picturename = "cancelar.GIF"
string disabledname = "d_cancelar.GIF"
alignment htextalign = left!
string powertiptext = "Cancelar [Alt+C]"
end type

event clicked;close(parent)
end event

type cb_aceptar from picturebutton within w_busca_rias
event mousemove pbm_mousemove
integer x = 914
integer y = 596
integer width = 146
integer height = 128
integer taborder = 80
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "          &a"
boolean default = true
boolean originalsize = true
string picturename = "aceptar.GIF"
string disabledname = "d_aceptar.GIF"
alignment htextalign = left!
string powertiptext = "Aceptar [Alt+A]"
end type

event clicked;long j,donde
string buscar,comilla
dw_busca.accepttext()
buscar=""
for j=1 to dw_busca.rowcount()
	buscar+=dw_busca.getitemstring(j,1)
	if dw_busca.getitemstring(j,1)="s_nfactura = "  then
		comilla=""
	else
		comilla="'"
	end if
	if dw_busca.getitemstring(j,1)="s_fecha = " then
		buscar+="datetime('"+dw_busca.getitemstring(j,2)+"') "
	else
		buscar+=comilla+dw_busca.getitemstring(j,2)+comilla
	end if
	buscar+=dw_busca.getitemstring(j,3)
next
donde=w_rias.tab_2.tp2_1.t1.tp1.dw_ria.find(buscar,1,w_rias.tab_2.tp2_1.t1.tp1.dw_ria.rowcount())
if donde= 0 then
	Messagebox("Atención","No se encontraron registros coincidentes")
else
	w_rias.tab_2.tp2_1.t1.tp1.dw_ria.setcolumn("documento")
	w_rias.tab_2.tp2_1.t1.tp1.dw_ria.scrolltorow(donde)
	close(parent)
	w_rias.setfocus()
	w_rias.tab_2.tp2_1.t1.tp1.dw_ria.setfocus()
end if
end event

type st_1 from statictext within w_busca_rias
integer x = 69
integer y = 4
integer width = 1938
integer height = 76
string dragicon = "none!"
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string pointer = "Arrow!"
long textcolor = 33554432
long backcolor = 134217752
string text = "Agregue campo y condición de búsqueda (caracter % es comodín)"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type dw_busca from datawindow within w_busca_rias
event mousemove pbm_mousemove
integer x = 73
integer y = 92
integer width = 1961
integer height = 464
integer taborder = 10
string dragicon = "none!"
string title = "Busqueda de pacientes"
string dataobject = "dw_xa_buscar_ria"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;this.accepttext()
if this.getcolumnname()="condicion" then
	long fila,cuantos
	fila=this.getrow()
	cuantos=this.rowcount()
	choose case this.getitemstring(fila,"condicion")
		case " and "
			if fila=cuantos then this.insertrow(0)
		case " or "
			if fila=cuantos then this.insertrow(0)
		case " "
			if fila<cuantos then 
				long i
				for i=fila +1 to cuantos
					this.deleterow(fila +1)
				next
			end if
	end choose
end if
if this.getcolumnname()="valor" then
	if (this.getitemstring(row,1)="nfactura = " or this.getitemstring(row,1)="s_fecha = ") and pos(data,"%")<>0 then
		this.setitem(row,dwo.name,"")
		return 1
	end if
end if
		
end event

